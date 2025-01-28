class ProjectUtils {
  final String image;
  final String title;
  final String subtitle;
  final String? androidLink;
  final String? iosLink;
  final String? webLink;

  ProjectUtils({
    required this.image,
    required this.title,
    required this.subtitle,
    this.androidLink,
    this.iosLink,
    this.webLink,
  });

  static first() {}
}

List<ProjectUtils> projectItems = [
  ProjectUtils(
    image: "assets/projects/p1.png",
    title: "Repo 1",
    subtitle: "DATA STRUCTURES : Its a KTU lab project",
    webLink: "https://github.com/Sree14hari/DATA-STRUCTURES-KTU.git",
  ),
  ProjectUtils(
    image: "assets/projects/p2.png",
    title: "Repo 2",
    subtitle: "OS KTU : Its a KTU lab project",
    webLink: "https://github.com/Sree14hari/OS-KTU.git",
  ),
  ProjectUtils(
    image: "assets/projects/p3.png",
    title: "Repo 3",
    subtitle: "PORTFOLIO : Its a personal portfolio",
    webLink: "https://github.com/Sree14hari/Portfolio-flutter.git",
  ),
];
