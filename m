Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A97C9F8DF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 05:46:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JBVd6Sp8zDqvh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 13:46:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JBQj0WRpzDqSM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 13:42:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46JBQh4spNz8wB9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 13:42:52 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46JBQh4Mbrz9sBF; Wed, 28 Aug 2019 13:42:52 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=informatik.wtf
 (client-ip=68.65.122.29; helo=mta-09-4.privateemail.com;
 envelope-from=cmr@informatik.wtf; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from MTA-09-4.privateemail.com (mta-09-4.privateemail.com
 [68.65.122.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46JBQg5Tqcz9sN1
 for <linuxppc-dev@ozlabs.org>; Wed, 28 Aug 2019 13:42:50 +1000 (AEST)
Received: from MTA-09.privateemail.com (localhost [127.0.0.1])
 by MTA-09.privateemail.com (Postfix) with ESMTP id B091F60045;
 Tue, 27 Aug 2019 23:42:47 -0400 (EDT)
Received: from wrwlf0000.attlocal.net (unknown [10.20.151.235])
 by MTA-09.privateemail.com (Postfix) with ESMTPA id 4DD0860034;
 Wed, 28 Aug 2019 03:42:47 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: linuxppc-dev@ozlabs.org,
	kernel-hardening@lists.openwall.com
Subject: [PATCH v5 2/2] powerpc/xmon: Restrict when kernel is locked down
Date: Tue, 27 Aug 2019 22:46:13 -0500
Message-Id: <20190828034613.14750-3-cmr@informatik.wtf>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190828034613.14750-1-cmr@informatik.wtf>
References: <20190828034613.14750-1-cmr@informatik.wtf>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Xmon should be either fully or partially disabled depending on the
kernel lockdown state.

Put xmon into read-only mode for lockdown=integrity and prevent user
entry into xmon when lockdown=confidentiality. Xmon checks the lockdown
state on every attempted entry:

 (1) during early xmon'ing

 (2) when triggered via sysrq

 (3) when toggled via debugfs

 (4) when triggered via a previously enabled breakpoint

The following lockdown state transitions are handled:

 (1) lockdown=none -> lockdown=integrity
     set xmon read-only mode

 (2) lockdown=none -> lockdown=confidentiality
     clear all breakpoints, set xmon read-only mode,
     prevent user re-entry into xmon

 (3) lockdown=integrity -> lockdown=confidentiality
     clear all breakpoints, set xmon read-only mode,
     prevent user re-entry into xmon

Suggested-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
---
 arch/powerpc/xmon/xmon.c     | 85 ++++++++++++++++++++++++++++--------
 include/linux/security.h     |  2 +
 security/lockdown/lockdown.c |  2 +
 3 files changed, 72 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index a98a354d46ac..94a5fada3034 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -25,6 +25,7 @@
 #include <linux/nmi.h>
 #include <linux/ctype.h>
 #include <linux/highmem.h>
+#include <linux/security.h>
 
 #include <asm/debugfs.h>
 #include <asm/ptrace.h>
@@ -187,6 +188,8 @@ static void dump_tlb_44x(void);
 static void dump_tlb_book3e(void);
 #endif
 
+static void clear_all_bpt(void);
+
 #ifdef CONFIG_PPC64
 #define REG		"%.16lx"
 #else
@@ -283,10 +286,38 @@ Commands:\n\
 "  U	show uptime information\n"
 "  ?	help\n"
 "  # n	limit output to n lines per page (for dp, dpa, dl)\n"
-"  zr	reboot\n\
-  zh	halt\n"
+"  zr	reboot\n"
+"  zh	halt\n"
 ;
 
+#ifdef CONFIG_SECURITY
+static bool xmon_is_locked_down(void)
+{
+	static bool lockdown;
+
+	if (!lockdown) {
+		lockdown = !!security_locked_down(LOCKDOWN_XMON_RW);
+		if (lockdown) {
+			printf("xmon: Disabled due to kernel lockdown\n");
+			xmon_is_ro = true;
+		}
+	}
+
+	if (!xmon_is_ro) {
+		xmon_is_ro = !!security_locked_down(LOCKDOWN_XMON_WR);
+		if (xmon_is_ro)
+			printf("xmon: Read-only due to kernel lockdown\n");
+	}
+
+	return lockdown;
+}
+#else /* CONFIG_SECURITY */
+static inline bool xmon_is_locked_down(void)
+{
+	return false;
+}
+#endif
+
 static struct pt_regs *xmon_regs;
 
 static inline void sync(void)
@@ -438,7 +469,10 @@ static bool wait_for_other_cpus(int ncpus)
 
 	return false;
 }
-#endif /* CONFIG_SMP */
+#else /* CONFIG_SMP */
+static inline void get_output_lock(void) {}
+static inline void release_output_lock(void) {}
+#endif
 
 static inline int unrecoverable_excp(struct pt_regs *regs)
 {
@@ -455,6 +489,7 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 	int cmd = 0;
 	struct bpt *bp;
 	long recurse_jmp[JMP_BUF_LEN];
+	bool locked_down;
 	unsigned long offset;
 	unsigned long flags;
 #ifdef CONFIG_SMP
@@ -465,6 +500,8 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 	local_irq_save(flags);
 	hard_irq_disable();
 
+	locked_down = xmon_is_locked_down();
+
 	tracing_enabled = tracing_is_on();
 	tracing_off();
 
@@ -516,7 +553,8 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 
 	if (!fromipi) {
 		get_output_lock();
-		excprint(regs);
+		if (!locked_down)
+			excprint(regs);
 		if (bp) {
 			printf("cpu 0x%x stopped at breakpoint 0x%tx (",
 			       cpu, BP_NUM(bp));
@@ -568,10 +606,14 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 		}
 		remove_bpts();
 		disable_surveillance();
-		/* for breakpoint or single step, print the current instr. */
-		if (bp || TRAP(regs) == 0xd00)
-			ppc_inst_dump(regs->nip, 1, 0);
-		printf("enter ? for help\n");
+
+		if (!locked_down) {
+			/* for breakpoint or single step, print curr insn */
+			if (bp || TRAP(regs) == 0xd00)
+				ppc_inst_dump(regs->nip, 1, 0);
+			printf("enter ? for help\n");
+		}
+
 		mb();
 		xmon_gate = 1;
 		barrier();
@@ -595,8 +637,9 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 			spin_cpu_relax();
 			touch_nmi_watchdog();
 		} else {
-			cmd = cmds(regs);
-			if (cmd != 0) {
+			if (!locked_down)
+				cmd = cmds(regs);
+			if (locked_down || cmd != 0) {
 				/* exiting xmon */
 				insert_bpts();
 				xmon_gate = 0;
@@ -633,13 +676,16 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 			       "can't continue\n");
 		remove_bpts();
 		disable_surveillance();
-		/* for breakpoint or single step, print the current instr. */
-		if (bp || TRAP(regs) == 0xd00)
-			ppc_inst_dump(regs->nip, 1, 0);
-		printf("enter ? for help\n");
+		if (!locked_down) {
+			/* for breakpoint or single step, print current insn */
+			if (bp || TRAP(regs) == 0xd00)
+				ppc_inst_dump(regs->nip, 1, 0);
+			printf("enter ? for help\n");
+		}
 	}
 
-	cmd = cmds(regs);
+	if (!locked_down)
+		cmd = cmds(regs);
 
 	insert_bpts();
 	in_xmon = 0;
@@ -668,7 +714,10 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
 		}
 	}
 #endif
-	insert_cpu_bpts();
+	if (locked_down)
+		clear_all_bpt();
+	else
+		insert_cpu_bpts();
 
 	touch_nmi_watchdog();
 	local_irq_restore(flags);
@@ -3767,7 +3816,6 @@ static int __init setup_xmon_sysrq(void)
 device_initcall(setup_xmon_sysrq);
 #endif /* CONFIG_MAGIC_SYSRQ */
 
-#ifdef CONFIG_DEBUG_FS
 static void clear_all_bpt(void)
 {
 	int i;
@@ -3786,9 +3834,12 @@ static void clear_all_bpt(void)
 		dabr.enabled = 0;
 	}
 
+	get_output_lock();
 	printf("xmon: All breakpoints cleared\n");
+	release_output_lock();
 }
 
+#ifdef CONFIG_DEBUG_FS
 static int xmon_dbgfs_set(void *data, u64 val)
 {
 	xmon_on = !!val;
diff --git a/include/linux/security.h b/include/linux/security.h
index 429f9f03372b..ba9d308689b6 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -116,12 +116,14 @@ enum lockdown_reason {
 	LOCKDOWN_MODULE_PARAMETERS,
 	LOCKDOWN_MMIOTRACE,
 	LOCKDOWN_DEBUGFS,
+	LOCKDOWN_XMON_WR,
 	LOCKDOWN_INTEGRITY_MAX,
 	LOCKDOWN_KCORE,
 	LOCKDOWN_KPROBES,
 	LOCKDOWN_BPF_READ,
 	LOCKDOWN_PERF,
 	LOCKDOWN_TRACEFS,
+	LOCKDOWN_XMON_RW,
 	LOCKDOWN_CONFIDENTIALITY_MAX,
 };
 
diff --git a/security/lockdown/lockdown.c b/security/lockdown/lockdown.c
index 0068cec77c05..db85182d3f11 100644
--- a/security/lockdown/lockdown.c
+++ b/security/lockdown/lockdown.c
@@ -31,12 +31,14 @@ static char *lockdown_reasons[LOCKDOWN_CONFIDENTIALITY_MAX+1] = {
 	[LOCKDOWN_MODULE_PARAMETERS] = "unsafe module parameters",
 	[LOCKDOWN_MMIOTRACE] = "unsafe mmio",
 	[LOCKDOWN_DEBUGFS] = "debugfs access",
+	[LOCKDOWN_XMON_WR] = "xmon write access",
 	[LOCKDOWN_INTEGRITY_MAX] = "integrity",
 	[LOCKDOWN_KCORE] = "/proc/kcore access",
 	[LOCKDOWN_KPROBES] = "use of kprobes",
 	[LOCKDOWN_BPF_READ] = "use of bpf to read kernel RAM",
 	[LOCKDOWN_PERF] = "unsafe use of perf",
 	[LOCKDOWN_TRACEFS] = "use of tracefs",
+	[LOCKDOWN_XMON_RW] = "xmon read and write access",
 	[LOCKDOWN_CONFIDENTIALITY_MAX] = "confidentiality",
 };
 
-- 
2.23.0

