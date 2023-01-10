class Mock {
  Mock._();

  static const String profileImage =
      'https://buffer.com/library/content/images/2020/05/Ash-Read.png';

  static List<MKTask> incompleteTasks = [
    MKTask(title: 'Upload 1099-R to TurboTax', category: '💰 Finance'),
    MKTask(title: 'Submit 2019 tax return', category: '💰 Finance'),
    MKTask(title: 'Print parking passes', category: '💞 Wedding'),
    MKTask(title: 'Sign contract, send back', category: '🖥️ Freelance'),
    MKTask(title: 'Hand sanitizer', category: '🛒 Shopping List'),
  ];

  static List<MKTask> completeTasks = [
    MKTask(title: 'Check on FedEx Order'),
    MKTask(title: 'Look at new plugins'),
    MKTask(title: 'Respond to catering company'),
    MKTask(title: 'Reschedule morning coffee'),
    MKTask(title: 'Hand sanitizer'),
  ];
}

class MKTask {
  final String title;
  final String category;

  MKTask({required this.title, this.category = ''});
}
