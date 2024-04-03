class Score {
  final String pseudo;
  int score;
  int niveau;

  Score({
    required this.pseudo,
    required this.score,
    required this.niveau,
  });

  factory Score.fromSqFliteDataBase(Map<String, dynamic> map) => Score(
    pseudo: map['pseudo'] ?? 'invité',
    score: map['score'].toInt() ?? 0,
    niveau: map['niveau']?.toInt() ?? 0,
  );
}