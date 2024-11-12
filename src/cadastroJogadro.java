import javax.swing.*;
import java.awt.event.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class cadastroJogadro extends JDialog {
    private JPanel contentPane;
    private JButton buttonOK;
    private JButton buttonCancel;
    private JTextField emailTextField;
    private JPasswordField senhaPasswordField;
    private JRadioButton tecnicoRadioButton;
    private JRadioButton timeRadioButton;
    private JRadioButton jogadorRadioButton;
    private JTextField textField1;
    private JTextField textField2;
    private ButtonGroup userTypeGroup;

    public cadastroJogadro() {
        setContentPane(contentPane);
        setModal(true);
        getRootPane().setDefaultButton(buttonOK);

        // Agrupar os RadioButtons
        userTypeGroup = new ButtonGroup();
        userTypeGroup.add(tecnicoRadioButton);
        userTypeGroup.add(timeRadioButton);
        userTypeGroup.add(jogadorRadioButton);

        buttonOK.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                onOK();
            }
        });

        buttonCancel.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                onCancel();
            }
        });

        setDefaultCloseOperation(DO_NOTHING_ON_CLOSE);
        addWindowListener(new WindowAdapter() {
            public void windowClosing(WindowEvent e) {
                onCancel();
            }
        });

        contentPane.registerKeyboardAction(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                onCancel();
            }
        }, KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0), JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
    }

    private void onOK() {
        // Capturar os dados do formulário
        String email = emailTextField.getText();
        String senha = new String(senhaPasswordField.getPassword());
        String tipoUsuario = "";

        if (tecnicoRadioButton.isSelected()) {
            tipoUsuario = "Tecnico";
        } else if (timeRadioButton.isSelected()) {
            tipoUsuario = "Time";
        } else if (jogadorRadioButton.isSelected()) {
            tipoUsuario = "Jogador";
        }

        // Insere os dados no banco de dados
        insertData(email, senha, tipoUsuario);

        dispose();
    }

    private void onCancel() {
        dispose();
    }

    private void insertData(String email, String senha, String tipoUsuario) {
        String insertQuery = "INSERT INTO Usuarios (email, senha, tipoUsuario) VALUES (?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {

            preparedStatement.setString(1, email);
            preparedStatement.setString(2, senha);
            preparedStatement.setString(3, tipoUsuario);

            int rowsInserted = preparedStatement.executeUpdate();
            if (rowsInserted > 0) {
                System.out.println("Dados inseridos com sucesso!");
            }

        } catch (SQLException e) {
            System.out.println("Erro ao inserir dados: " + e.getMessage());
        }
    }

    public static void main(String[] args) {
        cadastroJogadro dialog = new cadastroJogadro();
        dialog.pack();
        dialog.setVisible(true);
        System.exit(0);
    }
}
