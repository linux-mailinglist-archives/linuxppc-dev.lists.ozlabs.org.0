Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E922E3177
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Dec 2020 15:07:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D3jDS1Zv2zDqDq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Dec 2020 01:07:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=metux.net
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=info@metux.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=metux.net
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D3jBq08vYzDq7F
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Dec 2020 01:05:51 +1100 (AEDT)
Received: from orion.localdomain ([95.114.11.119]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MybbH-1k6EDg42CD-00z0ya; Sun, 27 Dec 2020 15:01:42 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] arch: consolidate pm_power_off callback
Date: Sun, 27 Dec 2020 15:01:28 +0100
Message-Id: <20201227140129.19932-1-info@metux.net>
X-Mailer: git-send-email 2.11.0
X-Provags-ID: V03:K1:22PqiqwOpZh8agmKGH43iqfV1GmeR3GHk4Eu0lKnKo5JMKrP/aH
 u6CpYumM0T5GEJc7rS0tq9Bg/xKyr3+o2Gr9fCdB7eUMKG8cgMD+PLKrI3zI7Q0DCYL27l3
 yH5+7F3cR/5fzfUvsAuPUn4aJ8uyhb1112UFNfkozaNc26eeXZ/L/GwCHQqRBlVeFU8zCCP
 eqdvizyW0mf1u3JeKbaqQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:O0FFj0hCZoY=:x53KUPu82U2t0h9Swai2he
 lJu6z7JrQ2ajJ7Biw9aCJWIXep50l37kuwjhiKNoZ58f5TNa1h8D6bBFHpGD3l0T+XZczwfZP
 PRR0dq3RS/1FxJyg9u7iSK9/SQWqPP5W6goYk6XEzx1ZPvLqD3m8VCkKhsyBcwlkPXyOzIRqB
 HWiu765XCoqo2gaekI+DYkSsNmFI38ts+WUN/lsqkv52c4URoP3FOWGxWIuz9TJGUnsowE16a
 kLWxSjuHU26gtfeLm9j51Y64NizikF+f5c1PXKKAJi87bHJCYlAVBWwbroMHDLefhwzfpptKk
 PeeXh25kKN/pV9C8nVxrq7G17nLr/W0Wj462mR1vFEs1iAOfq4qcd7ryhbs5g1z2xFWBiSOmI
 2a9XQfV2f7DbA3NpANvxnGujgcJ9mUoDBWSZpfPxUhsAoxeezSjV5/l8g1mMl
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, paulus@samba.org,
 linux-csky@vger.kernel.org, hpa@zytor.com, linux-riscv@lists.infradead.org,
 will@kernel.org, tglx@linutronix.de, jonas@southpole.se,
 linux-s390@vger.kernel.org, sstabellini@kernel.org,
 linux-c6x-dev@linux-c6x.org, ysato@users.sourceforge.jp,
 linux-hexagon@vger.kernel.org, deller@gmx.de, x86@kernel.org,
 ley.foon.tan@intel.com, mingo@redhat.com, geert@linux-m68k.org,
 catalin.marinas@arm.com, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, linux-pm@vger.kernel.org, msalter@redhat.com,
 jacquiot.aurelien@gmail.com, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, bp@alien8.de, shorne@gmail.com,
 stefan.kristiansson@saunalahti.fi, christian@brauner.io, chris@zankel.net,
 tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the pm_power_off callback into one global place and also add an
function for conditionally calling it (when not NULL), in order to remove
code duplication in all individual archs.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

----

changes v2:
  * fix forgotten removal of pm_power_off in arch/powerpc, as reported by lkp
---
 arch/alpha/kernel/process.c        |  6 ------
 arch/arc/kernel/reset.c            |  3 ---
 arch/arm/kernel/reboot.c           |  6 ++----
 arch/arm64/kernel/process.c        |  6 +-----
 arch/c6x/kernel/process.c          | 10 ++--------
 arch/csky/kernel/power.c           | 10 +++-------
 arch/h8300/kernel/process.c        |  3 ---
 arch/hexagon/kernel/reset.c        |  3 ---
 arch/ia64/kernel/process.c         |  5 +----
 arch/m68k/kernel/process.c         |  3 ---
 arch/microblaze/kernel/process.c   |  3 ---
 arch/mips/kernel/reset.c           |  6 +-----
 arch/nds32/kernel/process.c        |  7 ++-----
 arch/nios2/kernel/process.c        |  3 ---
 arch/openrisc/kernel/process.c     |  3 ---
 arch/parisc/kernel/process.c       |  9 +++------
 arch/powerpc/kernel/setup-common.c |  8 ++------
 arch/powerpc/xmon/xmon.c           |  4 ++--
 arch/riscv/kernel/reset.c          |  9 ++++-----
 arch/s390/kernel/setup.c           |  3 ---
 arch/sh/kernel/reboot.c            |  6 +-----
 arch/x86/kernel/reboot.c           | 15 ++++-----------
 arch/x86/xen/enlighten_pv.c        |  4 ++--
 arch/xtensa/kernel/process.c       |  4 ----
 include/linux/pm.h                 |  2 ++
 kernel/reboot.c                    | 10 ++++++++++
 26 files changed, 42 insertions(+), 109 deletions(-)

diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 6c71554206cc..df0df869751d 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -43,12 +43,6 @@
 #include "proto.h"
 #include "pci_impl.h"
 
-/*
- * Power off function, if any
- */
-void (*pm_power_off)(void) = machine_power_off;
-EXPORT_SYMBOL(pm_power_off);
-
 #ifdef CONFIG_ALPHA_WTINT
 /*
  * Sleep the CPU.
diff --git a/arch/arc/kernel/reset.c b/arch/arc/kernel/reset.c
index fd6c3eb930ba..3a27b6a202d4 100644
--- a/arch/arc/kernel/reset.c
+++ b/arch/arc/kernel/reset.c
@@ -26,6 +26,3 @@ void machine_power_off(void)
 	/* FIXME ::  power off ??? */
 	machine_halt();
 }
-
-void (*pm_power_off) (void) = NULL;
-EXPORT_SYMBOL(pm_power_off);
diff --git a/arch/arm/kernel/reboot.c b/arch/arm/kernel/reboot.c
index 0ce388f15422..9e1bf0e9b3e0 100644
--- a/arch/arm/kernel/reboot.c
+++ b/arch/arm/kernel/reboot.c
@@ -6,6 +6,7 @@
 #include <linux/cpu.h>
 #include <linux/delay.h>
 #include <linux/reboot.h>
+#include <linux/pm.h>
 
 #include <asm/cacheflush.h>
 #include <asm/idmap.h>
@@ -19,8 +20,6 @@ typedef void (*phys_reset_t)(unsigned long, bool);
  * Function pointers to optional machine specific functions
  */
 void (*arm_pm_restart)(enum reboot_mode reboot_mode, const char *cmd);
-void (*pm_power_off)(void);
-EXPORT_SYMBOL(pm_power_off);
 
 /*
  * A temporary stack to use for CPU reset. This is static so that we
@@ -118,8 +117,7 @@ void machine_power_off(void)
 	local_irq_disable();
 	smp_send_stop();
 
-	if (pm_power_off)
-		pm_power_off();
+	do_power_off();
 }
 
 /*
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 6616486a58fe..a5d4c1e80abd 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -67,9 +67,6 @@ EXPORT_SYMBOL(__stack_chk_guard);
 /*
  * Function pointers to optional machine specific functions
  */
-void (*pm_power_off)(void);
-EXPORT_SYMBOL_GPL(pm_power_off);
-
 void (*arm_pm_restart)(enum reboot_mode reboot_mode, const char *cmd);
 
 static void noinstr __cpu_do_idle(void)
@@ -172,8 +169,7 @@ void machine_power_off(void)
 {
 	local_irq_disable();
 	smp_send_stop();
-	if (pm_power_off)
-		pm_power_off();
+	do_power_off();
 }
 
 /*
diff --git a/arch/c6x/kernel/process.c b/arch/c6x/kernel/process.c
index 9f4fd6a40a10..8b4b24476162 100644
--- a/arch/c6x/kernel/process.c
+++ b/arch/c6x/kernel/process.c
@@ -15,6 +15,7 @@
 #include <linux/reboot.h>
 #include <linux/sched/task.h>
 #include <linux/sched/task_stack.h>
+#include <linux/pm.h>
 
 #include <asm/syscalls.h>
 
@@ -25,12 +26,6 @@ void	(*c6x_halt)(void);
 extern asmlinkage void ret_from_fork(void);
 extern asmlinkage void ret_from_kernel_thread(void);
 
-/*
- * power off function, if any
- */
-void (*pm_power_off)(void);
-EXPORT_SYMBOL(pm_power_off);
-
 void arch_cpu_idle(void)
 {
 	unsigned long tmp;
@@ -71,8 +66,7 @@ void machine_halt(void)
 
 void machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_power_off();
 	halt_loop();
 }
 
diff --git a/arch/csky/kernel/power.c b/arch/csky/kernel/power.c
index 923ee4e381b8..c702e66ce03a 100644
--- a/arch/csky/kernel/power.c
+++ b/arch/csky/kernel/power.c
@@ -2,23 +2,19 @@
 // Copyright (C) 2018 Hangzhou C-SKY Microsystems co.,ltd.
 
 #include <linux/reboot.h>
-
-void (*pm_power_off)(void);
-EXPORT_SYMBOL(pm_power_off);
+#include <linux/pm.h>
 
 void machine_power_off(void)
 {
 	local_irq_disable();
-	if (pm_power_off)
-		pm_power_off();
+	do_power_off();
 	asm volatile ("bkpt");
 }
 
 void machine_halt(void)
 {
 	local_irq_disable();
-	if (pm_power_off)
-		pm_power_off();
+	do_power_off();
 	asm volatile ("bkpt");
 }
 
diff --git a/arch/h8300/kernel/process.c b/arch/h8300/kernel/process.c
index bc1364db58fe..020bf78a779c 100644
--- a/arch/h8300/kernel/process.c
+++ b/arch/h8300/kernel/process.c
@@ -46,9 +46,6 @@
 #include <asm/traps.h>
 #include <asm/setup.h>
 
-void (*pm_power_off)(void) = NULL;
-EXPORT_SYMBOL(pm_power_off);
-
 asmlinkage void ret_from_fork(void);
 asmlinkage void ret_from_kernel_thread(void);
 
diff --git a/arch/hexagon/kernel/reset.c b/arch/hexagon/kernel/reset.c
index da36114d928f..8370ddbcdfd9 100644
--- a/arch/hexagon/kernel/reset.c
+++ b/arch/hexagon/kernel/reset.c
@@ -19,6 +19,3 @@ void machine_halt(void)
 void machine_restart(char *cmd)
 {
 }
-
-void (*pm_power_off)(void) = NULL;
-EXPORT_SYMBOL(pm_power_off);
diff --git a/arch/ia64/kernel/process.c b/arch/ia64/kernel/process.c
index 4ebbfa076a26..72104b967668 100644
--- a/arch/ia64/kernel/process.c
+++ b/arch/ia64/kernel/process.c
@@ -57,8 +57,6 @@ void (*ia64_mark_idle)(int);
 
 unsigned long boot_option_idle_override = IDLE_NO_OVERRIDE;
 EXPORT_SYMBOL(boot_option_idle_override);
-void (*pm_power_off) (void);
-EXPORT_SYMBOL(pm_power_off);
 
 static void
 ia64_do_show_stack (struct unw_frame_info *info, void *arg)
@@ -602,8 +600,7 @@ machine_halt (void)
 void
 machine_power_off (void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_power_off()
 	machine_halt();
 }
 
diff --git a/arch/m68k/kernel/process.c b/arch/m68k/kernel/process.c
index 08359a6e058f..b8dc10a630e1 100644
--- a/arch/m68k/kernel/process.c
+++ b/arch/m68k/kernel/process.c
@@ -72,9 +72,6 @@ void machine_power_off(void)
 	for (;;);
 }
 
-void (*pm_power_off)(void) = machine_power_off;
-EXPORT_SYMBOL(pm_power_off);
-
 void show_regs(struct pt_regs * regs)
 {
 	pr_info("Format %02x  Vector: %04x  PC: %08lx  Status: %04x    %s\n",
diff --git a/arch/microblaze/kernel/process.c b/arch/microblaze/kernel/process.c
index 657c2beb665e..f1dd66a14ab6 100644
--- a/arch/microblaze/kernel/process.c
+++ b/arch/microblaze/kernel/process.c
@@ -46,9 +46,6 @@ void show_regs(struct pt_regs *regs)
 				regs->msr, regs->ear, regs->esr, regs->fsr);
 }
 
-void (*pm_power_off)(void) = NULL;
-EXPORT_SYMBOL(pm_power_off);
-
 void flush_thread(void)
 {
 }
diff --git a/arch/mips/kernel/reset.c b/arch/mips/kernel/reset.c
index 6288780b779e..73e32eba422f 100644
--- a/arch/mips/kernel/reset.c
+++ b/arch/mips/kernel/reset.c
@@ -25,9 +25,6 @@
  */
 void (*_machine_restart)(char *command);
 void (*_machine_halt)(void);
-void (*pm_power_off)(void);
-
-EXPORT_SYMBOL(pm_power_off);
 
 static void machine_hang(void)
 {
@@ -114,8 +111,7 @@ void machine_halt(void)
 
 void machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_power_off();
 
 #ifdef CONFIG_SMP
 	preempt_disable();
diff --git a/arch/nds32/kernel/process.c b/arch/nds32/kernel/process.c
index e01ad5d17224..624e2a563082 100644
--- a/arch/nds32/kernel/process.c
+++ b/arch/nds32/kernel/process.c
@@ -12,6 +12,7 @@
 #include <asm/fpu.h>
 #include <linux/ptrace.h>
 #include <linux/reboot.h>
+#include <linux/pm.h>
 
 #if IS_ENABLED(CONFIG_LAZY_FPU)
 struct task_struct *last_task_used_math;
@@ -27,9 +28,6 @@ extern inline void arch_reset(char mode)
 	}
 }
 
-void (*pm_power_off) (void);
-EXPORT_SYMBOL(pm_power_off);
-
 static char reboot_mode_nds32 = 'h';
 
 int __init reboot_setup(char *str)
@@ -54,8 +52,7 @@ EXPORT_SYMBOL(machine_halt);
 
 void machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_power_off();
 }
 
 EXPORT_SYMBOL(machine_power_off);
diff --git a/arch/nios2/kernel/process.c b/arch/nios2/kernel/process.c
index 50b4eb19a6cc..a6195cc02ea4 100644
--- a/arch/nios2/kernel/process.c
+++ b/arch/nios2/kernel/process.c
@@ -28,9 +28,6 @@
 asmlinkage void ret_from_fork(void);
 asmlinkage void ret_from_kernel_thread(void);
 
-void (*pm_power_off)(void) = NULL;
-EXPORT_SYMBOL(pm_power_off);
-
 void arch_cpu_idle(void)
 {
 	raw_local_irq_enable();
diff --git a/arch/openrisc/kernel/process.c b/arch/openrisc/kernel/process.c
index 3c98728cce24..c02343bacf59 100644
--- a/arch/openrisc/kernel/process.c
+++ b/arch/openrisc/kernel/process.c
@@ -84,9 +84,6 @@ void arch_cpu_idle(void)
 		mtspr(SPR_PMR, mfspr(SPR_PMR) | SPR_PMR_DME);
 }
 
-void (*pm_power_off) (void) = machine_power_off;
-EXPORT_SYMBOL(pm_power_off);
-
 /*
  * When a process does an "exec", machine state like FPU and debug
  * registers need to be reset.  This is a hook function for that.
diff --git a/arch/parisc/kernel/process.c b/arch/parisc/kernel/process.c
index a92a23d6acd9..8b94599c9480 100644
--- a/arch/parisc/kernel/process.c
+++ b/arch/parisc/kernel/process.c
@@ -41,6 +41,7 @@
 #include <linux/rcupdate.h>
 #include <linux/random.h>
 #include <linux/nmi.h>
+#include <linux/pm.h>
 
 #include <asm/io.h>
 #include <asm/asm-offsets.h>
@@ -117,9 +118,8 @@ void machine_power_off(void)
 	pdc_chassis_send_status(PDC_CHASSIS_DIRECT_SHUTDOWN);
 
 	/* ipmi_poweroff may have been installed. */
-	if (pm_power_off)
-		pm_power_off();
-		
+	do_power_off();
+
 	/* It seems we have no way to power the system off via
 	 * software. The user has to press the button himself. */
 
@@ -132,9 +132,6 @@ void machine_power_off(void)
 	for (;;);
 }
 
-void (*pm_power_off)(void);
-EXPORT_SYMBOL(pm_power_off);
-
 void machine_halt(void)
 {
 	machine_power_off();
diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 71f38e9248be..3ed44b6ee232 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -32,6 +32,7 @@
 #include <linux/of_platform.h>
 #include <linux/hugetlb.h>
 #include <linux/pgtable.h>
+#include <linux/pm.h>
 #include <asm/debugfs.h>
 #include <asm/io.h>
 #include <asm/paca.h>
@@ -163,18 +164,13 @@ void machine_restart(char *cmd)
 void machine_power_off(void)
 {
 	machine_shutdown();
-	if (pm_power_off)
-		pm_power_off();
-
+	do_power_off();
 	smp_send_stop();
 	machine_hang();
 }
 /* Used by the G5 thermal driver */
 EXPORT_SYMBOL_GPL(machine_power_off);
 
-void (*pm_power_off)(void);
-EXPORT_SYMBOL_GPL(pm_power_off);
-
 void machine_halt(void)
 {
 	machine_shutdown();
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index dcd817ca2edf..38d76c283412 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -26,6 +26,7 @@
 #include <linux/ctype.h>
 #include <linux/highmem.h>
 #include <linux/security.h>
+#include <linux/pm.h>
 
 #include <asm/debugfs.h>
 #include <asm/ptrace.h>
@@ -1237,8 +1238,7 @@ static void bootcmds(void)
 	} else if (cmd == 'h') {
 		ppc_md.halt();
 	} else if (cmd == 'p') {
-		if (pm_power_off)
-			pm_power_off();
+		do_power_off();
 	}
 }
 
diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
index ee5878d968cc..f8bcf4d8b19b 100644
--- a/arch/riscv/kernel/reset.c
+++ b/arch/riscv/kernel/reset.c
@@ -12,9 +12,6 @@ static void default_power_off(void)
 		wait_for_interrupt();
 }
 
-void (*pm_power_off)(void) = default_power_off;
-EXPORT_SYMBOL(pm_power_off);
-
 void machine_restart(char *cmd)
 {
 	do_kernel_restart(cmd);
@@ -23,10 +20,12 @@ void machine_restart(char *cmd)
 
 void machine_halt(void)
 {
-	pm_power_off();
+	do_power_off();
+	default_power_off();
 }
 
 void machine_power_off(void)
 {
-	pm_power_off();
+	do_power_off();
+	default_power_off();
 }
diff --git a/arch/s390/kernel/setup.c b/arch/s390/kernel/setup.c
index 1fbed91c73bc..4e348d3b711f 100644
--- a/arch/s390/kernel/setup.c
+++ b/arch/s390/kernel/setup.c
@@ -302,9 +302,6 @@ void machine_power_off(void)
 /*
  * Dummy power off function.
  */
-void (*pm_power_off)(void) = machine_power_off;
-EXPORT_SYMBOL_GPL(pm_power_off);
-
 void *restart_stack;
 
 unsigned long stack_alloc(void)
diff --git a/arch/sh/kernel/reboot.c b/arch/sh/kernel/reboot.c
index 5c33f036418b..8c9b63e1dbba 100644
--- a/arch/sh/kernel/reboot.c
+++ b/arch/sh/kernel/reboot.c
@@ -10,9 +10,6 @@
 #include <asm/tlbflush.h>
 #include <asm/traps.h>
 
-void (*pm_power_off)(void);
-EXPORT_SYMBOL(pm_power_off);
-
 static void watchdog_trigger_immediate(void)
 {
 	sh_wdt_write_cnt(0xFF);
@@ -46,8 +43,7 @@ static void native_machine_shutdown(void)
 
 static void native_machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_power_off();
 }
 
 static void native_machine_halt(void)
diff --git a/arch/x86/kernel/reboot.c b/arch/x86/kernel/reboot.c
index db115943e8bd..cddf9ca4e6f6 100644
--- a/arch/x86/kernel/reboot.c
+++ b/arch/x86/kernel/reboot.c
@@ -34,12 +34,6 @@
 #include <asm/efi.h>
 
 /*
- * Power off function, if any
- */
-void (*pm_power_off)(void);
-EXPORT_SYMBOL(pm_power_off);
-
-/*
  * This is set if we need to go through the 'emergency' path.
  * When machine_emergency_restart() is called, we may be on
  * an inconsistent state and won't be able to do a clean cleanup
@@ -747,11 +741,10 @@ static void native_machine_halt(void)
 
 static void native_machine_power_off(void)
 {
-	if (pm_power_off) {
-		if (!reboot_force)
-			machine_shutdown();
-		pm_power_off();
-	}
+	if (!reboot_force)
+		machine_shutdown();
+	do_power_off();
+
 	/* A fallback in case there is no PM info available */
 	tboot_shutdown(TB_SHUTDOWN_HALT);
 }
diff --git a/arch/x86/xen/enlighten_pv.c b/arch/x86/xen/enlighten_pv.c
index 4409306364dc..7e5416c316d3 100644
--- a/arch/x86/xen/enlighten_pv.c
+++ b/arch/x86/xen/enlighten_pv.c
@@ -33,6 +33,7 @@
 #include <linux/gfp.h>
 #include <linux/edd.h>
 #include <linux/objtool.h>
+#include <linux/pm.h>
 
 #include <xen/xen.h>
 #include <xen/events.h>
@@ -1084,8 +1085,7 @@ static void xen_machine_halt(void)
 
 static void xen_machine_power_off(void)
 {
-	if (pm_power_off)
-		pm_power_off();
+	do_power_off();
 	xen_reboot(SHUTDOWN_poweroff);
 }
 
diff --git a/arch/xtensa/kernel/process.c b/arch/xtensa/kernel/process.c
index 397a7de56377..fb8d5e9829ba 100644
--- a/arch/xtensa/kernel/process.c
+++ b/arch/xtensa/kernel/process.c
@@ -51,10 +51,6 @@
 extern void ret_from_fork(void);
 extern void ret_from_kernel_thread(void);
 
-void (*pm_power_off)(void) = NULL;
-EXPORT_SYMBOL(pm_power_off);
-
-
 #ifdef CONFIG_STACKPROTECTOR
 #include <linux/stackprotector.h>
 unsigned long __stack_chk_guard __read_mostly;
diff --git a/include/linux/pm.h b/include/linux/pm.h
index 47aca6bac1d6..78627c970be0 100644
--- a/include/linux/pm.h
+++ b/include/linux/pm.h
@@ -22,6 +22,8 @@
 extern void (*pm_power_off)(void);
 extern void (*pm_power_off_prepare)(void);
 
+extern void do_power_off(void);
+
 struct device; /* we have a circular dep with device.h */
 #ifdef CONFIG_VT_CONSOLE_SLEEP
 extern void pm_vt_switch_required(struct device *dev, bool required);
diff --git a/kernel/reboot.c b/kernel/reboot.c
index eb1b15850761..ec4cd66dd1ae 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -53,6 +53,16 @@ int reboot_force;
 void (*pm_power_off_prepare)(void);
 EXPORT_SYMBOL_GPL(pm_power_off_prepare);
 
+void (*pm_power_off)(void);
+EXPORT_SYMBOL_GPL(pm_power_off);
+
+void do_power_off(void)
+{
+	if (pm_power_off)
+		pm_power_off();
+}
+EXPORT_SYMBOL_GPL(do_power_off);
+
 /**
  *	emergency_restart - reboot the system
  *
-- 
2.11.0

