Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 666AD695AA5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 08:29:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGCWL1ZyDz3fvY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 18:29:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L7mfxQeb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=L7mfxQeb;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGC2b6vlXz3cL0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 18:07:35 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 78E20B81BFE;
	Tue, 14 Feb 2023 07:07:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 793FFC433AC;
	Tue, 14 Feb 2023 07:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676358453;
	bh=gVdYdGvVouxRS7I5HTvloIF+eef11VP/cTzmju48sa8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L7mfxQeb7fxb/v6PpTBeFDgujh25Hr7W7QQNyWAgMa+vOQ0vZOC9jbATwq2Z39yZ4
	 qFZsq7gm/ULoVsC6wRl+5NPePvftL0yuLY+Ya/IJ6DcbSvLCo2XKjlpfze71MWncqR
	 OHhzDHffkGNUAOP/KLqrjPZIlsCkQrDhN3QoteTdQWnew5jcqKIHkKr2Ir4jsEYOoB
	 psXgdT+CxTHnwVpYCWAFTN2eJu5PAXlZZAohNqwRWqNIoT0XVAM/cr0XxkCybCJd16
	 WR75rMrtimgplrjhJork8V0V7UD8BePOUY7Z7CbS/aq86TV62VkxEPbpDQUVbHq1HF
	 wChgtf5mBAF/A==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 24/24] sched/idle: Mark arch_cpu_idle_dead() __noreturn
Date: Mon, 13 Feb 2023 23:05:58 -0800
Message-Id: <60d527353da8c99d4cf13b6473131d46719ed16d.1676358308.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1676358308.git.jpoimboe@kernel.org>
References: <cover.1676358308.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, bsegall@google.com, jcmvbkbc@gmail.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, bristot@redhat.com, linux-mips@vger.kernel.org, linux-alph
 a@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Before commit 076cbf5d2163 ("x86/xen: don't let xen_pv_play_dead()
return"), in Xen, when a previously offlined CPU was brought back
online, it unexpectedly resumed execution where it left off in the
middle of the idle loop.

There were some hacks to make that work, but the behavior was surprising
as do_idle() doesn't expect an offlined CPU to return from the dead (in
arch_cpu_idle_dead()).

Now that Xen has been fixed, and the arch-specific implementations of
arch_cpu_idle_dead() also don't return, give it a __noreturn attribute.

This will cause the compiler to complain if an arch-specific
implementation might return.  It also improves code generation for both
caller and callee.

Also fixes the following warning:

  vmlinux.o: warning: objtool: do_idle+0x25f: unreachable instruction

Reported-by: Paul E. McKenney <paulmck@kernel.org>
Tested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 arch/alpha/kernel/process.c     | 2 +-
 arch/arm/kernel/smp.c           | 2 +-
 arch/arm64/kernel/process.c     | 2 +-
 arch/csky/kernel/smp.c          | 2 +-
 arch/ia64/kernel/process.c      | 2 +-
 arch/loongarch/kernel/process.c | 2 +-
 arch/mips/kernel/process.c      | 2 +-
 arch/parisc/kernel/process.c    | 2 +-
 arch/powerpc/kernel/smp.c       | 2 +-
 arch/riscv/kernel/cpu-hotplug.c | 2 +-
 arch/s390/kernel/idle.c         | 2 +-
 arch/sh/kernel/idle.c           | 2 +-
 arch/sparc/kernel/process_64.c  | 2 +-
 arch/x86/kernel/process.c       | 2 +-
 arch/xtensa/kernel/smp.c        | 2 +-
 include/linux/cpu.h             | 2 +-
 kernel/sched/idle.c             | 2 +-
 tools/objtool/check.c           | 1 +
 18 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index d0ff06eda8fa..9bae2fc4910f 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -60,7 +60,7 @@ void arch_cpu_idle(void)
 	wtint(0);
 }
 
-void arch_cpu_idle_dead(void)
+void __noreturn arch_cpu_idle_dead(void)
 {
 	wtint(INT_MAX);
 	BUG();
diff --git a/arch/arm/kernel/smp.c b/arch/arm/kernel/smp.c
index adcd417c526b..c2daa0f2f784 100644
--- a/arch/arm/kernel/smp.c
+++ b/arch/arm/kernel/smp.c
@@ -320,7 +320,7 @@ void __cpu_die(unsigned int cpu)
  * of the other hotplug-cpu capable cores, so presumably coming
  * out of idle fixes this.
  */
-void arch_cpu_idle_dead(void)
+void __noreturn arch_cpu_idle_dead(void)
 {
 	unsigned int cpu = smp_processor_id();
 
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 269ac1c25ae2..8d606bbb4a9a 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -69,7 +69,7 @@ void (*pm_power_off)(void);
 EXPORT_SYMBOL_GPL(pm_power_off);
 
 #ifdef CONFIG_HOTPLUG_CPU
-void arch_cpu_idle_dead(void)
+void __noreturn arch_cpu_idle_dead(void)
 {
        cpu_die();
 }
diff --git a/arch/csky/kernel/smp.c b/arch/csky/kernel/smp.c
index 0ec20efaf5fd..9c7a20b73ac6 100644
--- a/arch/csky/kernel/smp.c
+++ b/arch/csky/kernel/smp.c
@@ -300,7 +300,7 @@ void __cpu_die(unsigned int cpu)
 	pr_notice("CPU%u: shutdown\n", cpu);
 }
 
-void arch_cpu_idle_dead(void)
+void __noreturn arch_cpu_idle_dead(void)
 {
 	idle_task_exit();
 
diff --git a/arch/ia64/kernel/process.c b/arch/ia64/kernel/process.c
index 78f5794b2dde..9a5cd9fad3a9 100644
--- a/arch/ia64/kernel/process.c
+++ b/arch/ia64/kernel/process.c
@@ -225,7 +225,7 @@ static inline void __noreturn play_dead(void)
 }
 #endif /* CONFIG_HOTPLUG_CPU */
 
-void arch_cpu_idle_dead(void)
+void __noreturn arch_cpu_idle_dead(void)
 {
 	play_dead();
 }
diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index edfd220a3737..ba70e94eb996 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -61,7 +61,7 @@ unsigned long boot_option_idle_override = IDLE_NO_OVERRIDE;
 EXPORT_SYMBOL(boot_option_idle_override);
 
 #ifdef CONFIG_HOTPLUG_CPU
-void arch_cpu_idle_dead(void)
+void __noreturn arch_cpu_idle_dead(void)
 {
 	play_dead();
 }
diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
index 093dbbd6b843..a3225912c862 100644
--- a/arch/mips/kernel/process.c
+++ b/arch/mips/kernel/process.c
@@ -40,7 +40,7 @@
 #include <asm/stacktrace.h>
 
 #ifdef CONFIG_HOTPLUG_CPU
-void arch_cpu_idle_dead(void)
+void __noreturn arch_cpu_idle_dead(void)
 {
 	play_dead();
 }
diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index c064719b49b0..97c6f875bd0e 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -159,7 +159,7 @@ EXPORT_SYMBOL(running_on_qemu);
 /*
  * Called from the idle thread for the CPU which has been shutdown.
  */
-void arch_cpu_idle_dead(void)
+void __noreturn arch_cpu_idle_dead(void)
 {
 #ifdef CONFIG_HOTPLUG_CPU
 	idle_task_exit();
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index 6b90f10a6c81..f62e5e651bcd 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1752,7 +1752,7 @@ void __cpu_die(unsigned int cpu)
 		smp_ops->cpu_die(cpu);
 }
 
-void arch_cpu_idle_dead(void)
+void __noreturn arch_cpu_idle_dead(void)
 {
 	/*
 	 * Disable on the down path. This will be re-enabled by
diff --git a/arch/riscv/kernel/cpu-hotplug.c b/arch/riscv/kernel/cpu-hotplug.c
index f7a832e3a1d1..59b80211c25f 100644
--- a/arch/riscv/kernel/cpu-hotplug.c
+++ b/arch/riscv/kernel/cpu-hotplug.c
@@ -71,7 +71,7 @@ void __cpu_die(unsigned int cpu)
 /*
  * Called from the idle thread for the CPU which has been shutdown.
  */
-void arch_cpu_idle_dead(void)
+void __noreturn arch_cpu_idle_dead(void)
 {
 	idle_task_exit();
 
diff --git a/arch/s390/kernel/idle.c b/arch/s390/kernel/idle.c
index b04fb418307c..45b5ee28dbe3 100644
--- a/arch/s390/kernel/idle.c
+++ b/arch/s390/kernel/idle.c
@@ -143,7 +143,7 @@ void arch_cpu_idle_exit(void)
 {
 }
 
-void arch_cpu_idle_dead(void)
+void __noreturn arch_cpu_idle_dead(void)
 {
 	cpu_die();
 }
diff --git a/arch/sh/kernel/idle.c b/arch/sh/kernel/idle.c
index 114f0c4abeac..d662503b0665 100644
--- a/arch/sh/kernel/idle.c
+++ b/arch/sh/kernel/idle.c
@@ -30,7 +30,7 @@ void default_idle(void)
 	clear_bl_bit();
 }
 
-void arch_cpu_idle_dead(void)
+void __noreturn arch_cpu_idle_dead(void)
 {
 	play_dead();
 }
diff --git a/arch/sparc/kernel/process_64.c b/arch/sparc/kernel/process_64.c
index 91c2b8124527..b51d8fb0ecdc 100644
--- a/arch/sparc/kernel/process_64.c
+++ b/arch/sparc/kernel/process_64.c
@@ -95,7 +95,7 @@ void arch_cpu_idle(void)
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
-void arch_cpu_idle_dead(void)
+void __noreturn arch_cpu_idle_dead(void)
 {
 	sched_preempt_enable_no_resched();
 	cpu_play_dead();
diff --git a/arch/x86/kernel/process.c b/arch/x86/kernel/process.c
index 4433d13edd44..e52158263d30 100644
--- a/arch/x86/kernel/process.c
+++ b/arch/x86/kernel/process.c
@@ -727,7 +727,7 @@ void arch_cpu_idle_enter(void)
 	local_touch_nmi();
 }
 
-void arch_cpu_idle_dead(void)
+void __noreturn arch_cpu_idle_dead(void)
 {
 	play_dead();
 }
diff --git a/arch/xtensa/kernel/smp.c b/arch/xtensa/kernel/smp.c
index 7bad78495536..054bd64eab19 100644
--- a/arch/xtensa/kernel/smp.c
+++ b/arch/xtensa/kernel/smp.c
@@ -322,7 +322,7 @@ void __cpu_die(unsigned int cpu)
 	pr_err("CPU%u: unable to kill\n", cpu);
 }
 
-void arch_cpu_idle_dead(void)
+void __noreturn arch_cpu_idle_dead(void)
 {
 	cpu_die();
 }
diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index f83e4519c5f0..8582a7142623 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -182,7 +182,7 @@ void arch_cpu_idle(void);
 void arch_cpu_idle_prepare(void);
 void arch_cpu_idle_enter(void);
 void arch_cpu_idle_exit(void);
-void arch_cpu_idle_dead(void);
+void __noreturn arch_cpu_idle_dead(void);
 
 int cpu_report_state(int cpu);
 int cpu_check_up_prepare(int cpu);
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index 56e152f06d0f..342f58a329f5 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -75,7 +75,7 @@ static noinline int __cpuidle cpu_idle_poll(void)
 void __weak arch_cpu_idle_prepare(void) { }
 void __weak arch_cpu_idle_enter(void) { }
 void __weak arch_cpu_idle_exit(void) { }
-void __weak arch_cpu_idle_dead(void) { while (1); }
+void __weak __noreturn arch_cpu_idle_dead(void) { while (1); }
 void __weak arch_cpu_idle(void)
 {
 	cpu_idle_force_poll = 1;
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index f79baae3e338..4be38a40aaca 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -168,6 +168,7 @@ static bool __dead_end_function(struct objtool_file *file, struct symbol *func,
 		"__stack_chk_fail",
 		"__ubsan_handle_builtin_unreachable",
 		"arch_call_rest_init",
+		"arch_cpu_idle_dead",
 		"cpu_bringup_and_idle",
 		"cpu_startup_entry",
 		"do_exit",
-- 
2.39.1

