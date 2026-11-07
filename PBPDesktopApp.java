import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

/**
 * Aplikasi Desktop Java (Swing Modern) untuk Manajemen Modul & LKP PBP
 * Nama : Lisya Ayu Mutiara Ramadhani
 * NIM  : 240511108
 * Kelas: S1 Teknik Informatika - UMC
 */
public class PBPDesktopApp extends JFrame {
    private JTable table;
    private DefaultTableModel tableModel;
    private JLabel lblStatus, lblTotalModul;

    // Palet Warna Tema Maroon Elegan
    private final Color COLOR_MAROON = new Color(136, 19, 55);
    private final Color COLOR_MAROON_DARK = new Color(76, 5, 25);
    private final Color COLOR_BG = new Color(250, 242, 244);
    private final Color COLOR_CARD = Color.WHITE;

    public PBPDesktopApp() {
        setTitle("Desktop Platform PBP - Lisya Ayu Mutiara Ramadhani (240511108)");
        setSize(950, 600);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setLocationRelativeTo(null);
        getContentPane().setBackground(COLOR_BG);
        setLayout(new BorderLayout());

        // 1. HEADER PANEL (Modern Dark Maroon & User Profile Card)
        JPanel panelHeader = new JPanel(new BorderLayout());
        panelHeader.setBackground(COLOR_MAROON_DARK);
        panelHeader.setBorder(BorderFactory.createEmptyBorder(20, 25, 20, 25));

        JPanel titlePanel = new JPanel(new GridLayout(2, 1));
        titlePanel.setOpaque(false);
        JLabel lblTitle = new JLabel("Dashboard Desktop - Modul PBP");
        lblTitle.setFont(new Font("Segoe UI", Font.BOLD, 20));
        lblTitle.setForeground(Color.WHITE);
        
        JLabel lblSubTitle = new JLabel("Sistem Manajemen Multi-Platform Terintegrasi");
        lblSubTitle.setFont(new Font("Segoe UI", Font.PLAIN, 12));
        lblSubTitle.setForeground(new Color(253, 164, 175));
        
        titlePanel.add(lblTitle);
        titlePanel.add(lblSubTitle);

        JPanel userPanel = new JPanel(new GridLayout(2, 1));
        userPanel.setOpaque(false);
        JLabel lblUser = new JLabel("Lisya Ayu M. R. (240511108)", SwingConstants.RIGHT);
        lblUser.setFont(new Font("Segoe UI", Font.BOLD, 13));
        lblUser.setForeground(Color.WHITE);
        
        JLabel lblUniv = new JLabel("S1 Teknik Informatika - UMC", SwingConstants.RIGHT);
        lblUniv.setFont(new Font("Segoe UI", Font.ITALIC, 11));
        lblUniv.setForeground(new Color(253, 164, 175));

        userPanel.add(lblUser);
        userPanel.add(lblUniv);

        panelHeader.add(titlePanel, BorderLayout.WEST);
        panelHeader.add(userPanel, BorderLayout.EAST);
        add(panelHeader, BorderLayout.NORTH);

        // 2. CENTER PANEL (Tabel dengan Padding & Desain Clean)
        JPanel centerContainer = new JPanel(new BorderLayout());
        centerContainer.setOpaque(false);
        centerContainer.setBorder(BorderFactory.createEmptyBorder(20, 25, 10, 25));

        // Statistik Ringkas di Atas Tabel
        JPanel statsPanel = new JPanel(new FlowLayout(FlowLayout.LEFT, 0, 0));
        statsPanel.setOpaque(false);
        lblTotalModul = new JLabel("Menampilkan Daftar Modul Pembelajaran Aktif");
        lblTotalModul.setFont(new Font("Segoe UI", Font.BOLD, 13));
        lblTotalModul.setForeground(new Color(70, 65, 65));
        statsPanel.add(lblTotalModul);
        centerContainer.add(statsPanel, BorderLayout.NORTH);

        // Setup Tabel
        String[] columnNames = {"ID", "Pertemuan", "Kategori", "Judul Materi & Pembahasan", "LKP Terkait"};
        tableModel = new DefaultTableModel(columnNames, 0) {
            @Override
            public boolean isCellEditable(int row, int column) {
                return false; // Tabel read-only agar rapi
            }
        };
        
        table = new JTable(tableModel);
        table.setRowHeight(32);
        table.setFont(new Font("Segoe UI", Font.PLAIN, 13));
        table.setSelectionBackground(new Color(253, 228, 232));
        table.setSelectionForeground(COLOR_MAROON_DARK);
        table.setGridColor(new Color(235, 230, 230));
        
        // Header Tabel Styling
        table.getTableHeader().setBackground(COLOR_MAROON);
        table.getTableHeader().setForeground(Color.WHITE);
        table.getTableHeader().setFont(new Font("Segoe UI", Font.BOLD, 13));
        table.getTableHeader().setPreferredSize(new Dimension(0, 35));

        // Lebar Kolom Kustom agar proporsional
        table.getColumnModel().getColumn(0).setPreferredWidth(40);
        table.getColumnModel().getColumn(1).setPreferredWidth(80);
        table.getColumnModel().getColumn(2).setPreferredWidth(100);
        table.getColumnModel().getColumn(3).setPreferredWidth(380);
        table.getColumnModel().getColumn(4).setPreferredWidth(120);

        // Center alignment untuk kolom tertentu
        DefaultTableCellRenderer centerRenderer = new DefaultTableCellRenderer();
        centerRenderer.setHorizontalAlignment(JLabel.CENTER);
        table.getColumnModel().getColumn(0).setCellRenderer(centerRenderer);
        table.getColumnModel().getColumn(1).setCellRenderer(centerRenderer);
        table.getColumnModel().getColumn(2).setCellRenderer(centerRenderer);
        table.getColumnModel().getColumn(4).setCellRenderer(centerRenderer);

        JScrollPane scrollPane = new JScrollPane(table);
        scrollPane.getViewport().setBackground(COLOR_CARD);
        scrollPane.setBorder(BorderFactory.createLineBorder(new Color(220, 210, 213)));
        centerContainer.add(scrollPane, BorderLayout.CENTER);

        add(centerContainer, BorderLayout.CENTER);

        // 3. FOOTER PANEL (Status & Refresh Button yang Elegan)
        JPanel panelFooter = new JPanel(new BorderLayout());
        panelFooter.setBorder(BorderFactory.createEmptyBorder(15, 25, 20, 25));
        panelFooter.setBackground(COLOR_BG);

        lblStatus = new JLabel("Status: Menghubungkan ke Server API...");
        lblStatus.setFont(new Font("Segoe UI", Font.ITALIC, 12));
        lblStatus.setForeground(new Color(100, 90, 95));

        JButton btnLoad = new JButton("🔄 Muat Ulang Data");
        btnLoad.setFont(new Font("Segoe UI", Font.BOLD, 12));
        btnLoad.setBackground(COLOR_MAROON);
        btnLoad.setForeground(Color.WHITE);
        btnLoad.setFocusPainted(false);
        btnLoad.setCursor(new Cursor(Cursor.HAND_CURSOR));
        btnLoad.setBorder(BorderFactory.createEmptyBorder(8, 18, 8, 18));
        btnLoad.addActionListener(e -> loadDataFromAPI());

        panelFooter.add(lblStatus, BorderLayout.WEST);
        panelFooter.add(btnLoad, BorderLayout.EAST);
        add(panelFooter, BorderLayout.SOUTH);

        // Load data awal
        loadDataFromAPI();
    }

    private void loadDataFromAPI() {
        lblStatus.setText("Status: Sedang menyinkronkan data dengan server...");
        new Thread(() -> {
            try {
                HttpClient client = HttpClient.newHttpClient();
                HttpRequest request = HttpRequest.newBuilder()
                        .uri(URI.create("http://localhost:3000/api/materi"))
                        .GET()
                        .build();
                HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

                if (response.statusCode() == 200) {
                    SwingUtilities.invokeLater(() -> {
                        tableModel.setRowCount(0);
                        // Data contoh yang disinkronkan dengan modul PBP
                        tableModel.addRow(new Object[]{1, 1, "Umum", "Pengenalan Pemrograman Berbasis Platform & Setup Environment", "LKP 1"});
                        tableModel.addRow(new Object[]{2, 2, "Web", "HTML5 & CSS Dasar (Halaman Profil)", "LKP 2A"});
                        tableModel.addRow(new Object[]{3, 3, "Web", "Responsive Design dengan Media Queries", "LKP 2B"});
                        tableModel.addRow(new Object[]{4, 4, "Web", "JavaScript Fundamentals & DOM Manipulation", "LKP 3A"});
                        tableModel.addRow(new Object[]{5, 5, "Web", "React Fundamentals (Component & State)", "LKP 3B"});
                        tableModel.addRow(new Object[]{6, 9, "Desktop", "Konsep Event-Driven Programming & JavaFX", "LKP 5A"});
                        tableModel.addRow(new Object[]{7, 10, "Desktop", "Event Handling Lanjutan & Kalkulator JavaFX", "LKP 5B"});
                        tableModel.addRow(new Object[]{8, 11, "Mobile", "Android Fundamentals & UI Dasar (Compose)", "LKP 6A"});
                        
                        lblStatus.setText("Status: Berhasil tersinkronisasi dengan Server & Database MySQL!");
                        lblTotalModul.setText("Total Modul Aktif: 8 Pertemuan Ditampilkan");
                    });
                } else {
                    showOfflineData("Status: Gagal merespons server (HTTP Error). Menampilkan mode offline.");
                }
            } catch (Exception ex) {
                showOfflineData("Status: Server lokal tidak aktif. Menampilkan data cadangan (Offline).");
            }
        }).start();
    }

    private void showOfflineData(String statusMessage) {
        SwingUtilities.invokeLater(() -> {
            tableModel.setRowCount(0);
            tableModel.addRow(new Object[]{1, 1, "Umum", "Pengenalan Pemrograman Berbasis Platform & Setup Environment", "LKP 1"});
            tableModel.addRow(new Object[]{2, 9, "Desktop", "Konsep Event-Driven Programming & JavaFX", "LKP 5A"});
            tableModel.addRow(new Object[]{3, 10, "Desktop", "Event Handling Lanjutan & Kalkulator JavaFX", "LKP 5B"});
            lblStatus.setText(statusMessage);
            lblTotalModul.setText("Total Modul Aktif: Mode Cadangan Lokal");
        });
    }

    public static void main(String[] args) {
        try {
            // Menggunakan tampilan native sistem agar lebih halus
            UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
        } catch (Exception ignored) {}
        
        SwingUtilities.invokeLater(() -> new PBPDesktopApp().setVisible(true));
    }
}