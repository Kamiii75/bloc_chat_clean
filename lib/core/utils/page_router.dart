
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/auth_page.dart';
import '../../features/auth/presentation/pages/welcome_page.dart';


class NyAppRouter {
  static GoRouter returnRouter() {
    final GoRouter router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) => const WelcomePage(),
          routes: <RouteBase>[
            GoRoute(
              path: 'auth',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  CustomTransitionPage<void>(
                key: state.pageKey,
                child: const AuthPage(),
                transitionsBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                        Widget child) =>
                    FadeTransition(
                        opacity: CurveTween(curve: Curves.easeInOut)
                            .animate(animation),
                        child: child),
              ),
            ),
            // GoRoute(
            //   path: 'home',
            //   pageBuilder: (BuildContext context, GoRouterState state) =>
            //       CustomTransitionPage<void>(
            //     key: state.pageKey,
            //     child: HomePage(),
            //     transitionsBuilder: (BuildContext context,
            //             Animation<double> animation,
            //             Animation<double> secondaryAnimation,
            //             Widget child) =>
            //         FadeTransition(
            //             opacity: CurveTween(curve: Curves.easeInOut)
            //                 .animate(animation),
            //             child: child),
            //   ),
            //
            //   routes: <RouteBase>[
            //       GoRoute(
            //         path: 'settings',
            //         pageBuilder: (BuildContext context, GoRouterState state) =>
            //             CustomTransitionPage<void>(
            //           key: state.pageKey,
            //           child: SettingsPage(),
            //           transitionsBuilder: (BuildContext context,
            //                   Animation<double> animation,
            //                   Animation<double> secondaryAnimation,
            //                   Widget child) =>
            //               FadeTransition(
            //                   opacity: CurveTween(curve: Curves.easeInOut)
            //                       .animate(animation),
            //                   child: child),
            //         ),
            //       ),
            //       GoRoute(
            //         path: 'startWorkout',
            //         pageBuilder: (BuildContext context, GoRouterState state) =>
            //             CustomTransitionPage<void>(
            //           key: state.pageKey,
            //           child: StartWorkoutPage(),
            //           transitionsBuilder: (BuildContext context,
            //                   Animation<double> animation,
            //                   Animation<double> secondaryAnimation,
            //                   Widget child) =>
            //               FadeTransition(
            //                   opacity: CurveTween(curve: Curves.easeInOut)
            //                       .animate(animation),
            //                   child: child),
            //         ),
            //       ),
            //       GoRoute(
            //         path: 'workoutList',
            //         pageBuilder: (BuildContext context, GoRouterState state) =>
            //             CustomTransitionPage<void>(
            //           key: state.pageKey,
            //           child: WorkoutPage(),
            //           transitionsBuilder: (BuildContext context,
            //                   Animation<double> animation,
            //                   Animation<double> secondaryAnimation,
            //                   Widget child) =>
            //               FadeTransition(
            //                   opacity: CurveTween(curve: Curves.easeInOut)
            //                       .animate(animation),
            //                   child: child),
            //         ),
            //       ),
            //       GoRoute(
            //         path: 'exerciseList',
            //         pageBuilder: (BuildContext context, GoRouterState state) =>
            //             CustomTransitionPage<void>(
            //           key: state.pageKey,
            //           child: ExercisePage(),
            //           transitionsBuilder: (BuildContext context,
            //                   Animation<double> animation,
            //                   Animation<double> secondaryAnimation,
            //                   Widget child) =>
            //               FadeTransition(
            //                   opacity: CurveTween(curve: Curves.easeInOut)
            //                       .animate(animation),
            //                   child: child),
            //         ),
            //       ),
            //       GoRoute(
            //         path: 'exerciseType',
            //         pageBuilder: (BuildContext context, GoRouterState state) =>
            //             CustomTransitionPage<void>(
            //           key: state.pageKey,
            //           child: ExerciseTypePage(),
            //           transitionsBuilder: (BuildContext context,
            //                   Animation<double> animation,
            //                   Animation<double> secondaryAnimation,
            //                   Widget child) =>
            //               FadeTransition(
            //                   opacity: CurveTween(curve: Curves.easeInOut)
            //                       .animate(animation),
            //                   child: child),
            //         ),
            //       ),
            //       GoRoute(
            //         path: 'myWorkouts',
            //         pageBuilder: (BuildContext context, GoRouterState state) =>
            //             CustomTransitionPage<void>(
            //           key: state.pageKey,
            //           child: MyWorkoutsPage(),
            //           transitionsBuilder: (BuildContext context,
            //                   Animation<double> animation,
            //                   Animation<double> secondaryAnimation,
            //                   Widget child) =>
            //               FadeTransition(
            //                   opacity: CurveTween(curve: Curves.easeInOut)
            //                       .animate(animation),
            //                   child: child),
            //         ),
            //       ),
            //       GoRoute(
            //         path: 'myExercises',
            //         pageBuilder: (BuildContext context, GoRouterState state) =>
            //             CustomTransitionPage<void>(
            //           key: state.pageKey,
            //           child: MyExercisePage(),
            //           transitionsBuilder: (BuildContext context,
            //                   Animation<double> animation,
            //                   Animation<double> secondaryAnimation,
            //                   Widget child) =>
            //               FadeTransition(
            //                   opacity: CurveTween(curve: Curves.easeInOut)
            //                       .animate(animation),
            //                   child: child),
            //         ),
            //       ),
            //     ]
            // ),
            // GoRoute(
            //   path: 'selectStyle',
            //   pageBuilder: (BuildContext context, GoRouterState state) =>
            //       CustomTransitionPage<void>(
            //     key: state.pageKey,
            //     child: SelectStylePage(),
            //     transitionsBuilder: (BuildContext context,
            //             Animation<double> animation,
            //             Animation<double> secondaryAnimation,
            //             Widget child) =>
            //         FadeTransition(
            //             opacity: CurveTween(curve: Curves.easeInOut)
            //                 .animate(animation),
            //             child: child),
            //   ),
            // ),
            // GoRoute(
            //   path: 'selectGoal',
            //   pageBuilder: (BuildContext context, GoRouterState state) =>
            //       CustomTransitionPage<void>(
            //         key: state.pageKey,
            //         child: SelectGoalsPage(),
            //         transitionsBuilder: (BuildContext context,
            //             Animation<double> animation,
            //             Animation<double> secondaryAnimation,
            //             Widget child) =>
            //             FadeTransition(
            //                 opacity: CurveTween(curve: Curves.easeInOut)
            //                     .animate(animation),
            //                 child: child),
            //       ),
            // ),
            // GoRoute(
            //   path: 'selectPlan',
            //   pageBuilder: (BuildContext context, GoRouterState state) =>
            //       CustomTransitionPage<void>(
            //         key: state.pageKey,
            //         child: SelectPlanPage(),
            //         transitionsBuilder: (BuildContext context,
            //             Animation<double> animation,
            //             Animation<double> secondaryAnimation,
            //             Widget child) =>
            //             FadeTransition(
            //                 opacity: CurveTween(curve: Curves.easeInOut)
            //                     .animate(animation),
            //                 child: child),
            //       ),
            // ),


          ],
        ),
      ],
    );
    return router;
  }
}
