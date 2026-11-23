import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_bosta_tiklayici/oyun_bosta_tiklayici.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(bostaTiklayiciConfig.title.length, 33);
    expect(bostaTiklayiciConfig.tagline.length, 33);
    for (final s in bostaTiklayiciConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(bostaTiklayiciConfig.gameId, bostaTiklayiciId);
    expect(bostaTiklayiciRules.gameId, bostaTiklayiciId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(bostaTiklayiciRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: bostaTiklayiciId, optionalMechanics: bostaTiklayiciRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(bostaTiklayiciRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
