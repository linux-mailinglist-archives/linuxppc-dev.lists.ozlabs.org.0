Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EBD68DF05
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 18:34:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PB9Gb60dfz3cHF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 04:33:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tXxwcE/g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tXxwcE/g;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PB9Fj0Vxsz3cC1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 04:33:12 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DD3E660F8F;
	Tue,  7 Feb 2023 17:33:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45330C433EF;
	Tue,  7 Feb 2023 17:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675791189;
	bh=OOFodDg/RJjo5qTVphmNP/E/fr/ShyEQVDZAWMtFoM0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tXxwcE/gOF0eNx0XF92RAoYkNum7JZnXOZnnavM7kzrO0MQevxJJtXQxPJNmPEoZR
	 tAMLz9nlYUiMrkjH/XKT2k/4CJZ7++RadCYpn6C4IHt8JHwnxoVyjFlB66hlg6cJRQ
	 RtVlmuj69eecz4+uNG9d2OCUVRkR6tgweGdQ7Ag3A9B3i0x3l1Z/3o2JXHp4uErqyf
	 t3GKQ32zFVa94qvR26M0CjRf2YghqCdXlloIl2kbFkmDdMkoXcoi91RlDvfyQm8h4p
	 fB3bxwZHldFOuKK/WwIFRqJvJxjNiXAvBoMPfmM9C2dJCIEbPzS8z2Zbf2jvHi7ZV3
	 3Wl3kMwIvcAmA==
Date: Tue, 7 Feb 2023 09:33:04 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v1.1 22/22] sched/idle: Mark arch_cpu_idle_dead() __noreturn
Message-ID: <20230207173304.le5rvsz2emasye7s@treble>
References: <cover.1675461757.git.jpoimboe@kernel.org>
 <2eeb4425572785d1f05d8761dba1cf88c2105304.1675461757.git.jpoimboe@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2eeb4425572785d1f05d8761dba1cf88c2105304.1675461757.git.jpoimboe@kernel.org>
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
v1.1:
- add __noreturn to the implementations (in addition to just the
  prototype)

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
 tools/objtool/check.c           | 1 +
 17 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 94938f856545..c9a5ed23c5a6 100644
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
index 71d59b5abede..089ced6d6bd6 100644
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
index cb653c87018f..481ca32e628e 100644
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
index f1ec36caf1d8..3e30147a537e 100644
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
diff --git a/tools/objtool/check.c b/tools/objtool/check.c
index 0f67c6a8bc98..e3fa2279d612 100644
--- a/tools/objtool/check.c
+++ b/tools/objtool/check.c
@@ -167,6 +167,7 @@ static bool __dead_end_function(struct objtool_file *file, struct symbol *func,
 		"__reiserfs_panic",
 		"__stack_chk_fail",
 		"__ubsan_handle_builtin_unreachable",
+		"arch_cpu_idle_dead",
 		"cpu_bringup_and_idle",
 		"cpu_startup_entry",
 		"do_exit",
-- 
2.39.0

