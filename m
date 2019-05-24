Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED43E28F99
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 05:29:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 459BgM0spBzDqWT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 13:29:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 459BfB60gYzDqVr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 13:28:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 459Bf95mkSz8tHG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 13:28:17 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 459Bf95b9bz9s6w; Fri, 24 May 2019 13:28:17 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=informatik.wtf
 (client-ip=198.54.127.52; helo=new-02-3.privateemail.com;
 envelope-from=cmr@informatik.wtf; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
Received: from NEW-02-3.privateemail.com (new-02-3.privateemail.com
 [198.54.127.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 459Bf91Gc2z9s00
 for <linuxppc-dev@ozlabs.org>; Fri, 24 May 2019 13:28:15 +1000 (AEST)
Received: from MTA-09.privateemail.com (unknown [10.20.147.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-02.privateemail.com (Postfix) with ESMTPS id A161F60173;
 Fri, 24 May 2019 03:28:12 +0000 (UTC)
Received: from MTA-09.privateemail.com (localhost [127.0.0.1])
 by MTA-09.privateemail.com (Postfix) with ESMTP id 8690A60041;
 Thu, 23 May 2019 23:28:12 -0400 (EDT)
Received: from wrwlf0000.attlocal.net (unknown [10.20.151.200])
 by MTA-09.privateemail.com (Postfix) with ESMTPA id 0527E60043;
 Fri, 24 May 2019 03:28:11 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: linuxppc-dev@ozlabs.org
Subject: [RFC] powerpc/xmon: restrict when kernel is locked down
Date: Thu, 23 May 2019 22:30:19 -0500
Message-Id: <20190524033018.9153-1-cmr@informatik.wtf>
X-Mailer: git-send-email 2.21.0
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
Cc: "Christopher M. Riedl" <cmr@informatik.wtf>, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Xmon should be either fully or partially disabled depending on the
kernel lockdown state.

Put xmon into read-only mode for lockdown=integrity and completely
disable xmon when lockdown=confidentiality. Xmon checks the lockdown
state and takes appropriate action:

 (1) during xmon_setup to prevent early xmon'ing

 (2) when triggered via sysrq

 (3) when toggled via debugfs

 (4) when triggered via a previously enabled breakpoint

The following lockdown state transitions are handled:

 (1) lockdown=none -> lockdown=integrity
     clear all breakpoints, set xmon read-only mode

 (2) lockdown=none -> lockdown=confidentiality
     clear all breakpoints, prevent re-entry into xmon

 (3) lockdown=integrity -> lockdown=confidentiality
     prevent re-entry into xmon

Suggested-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
---
Applies on top of this series:
https://patchwork.kernel.org/patch/10870173/

I've done some limited testing using a single CPU QEMU config.

 arch/powerpc/xmon/xmon.c | 56 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 55 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 3e7be19aa208..8c4a5a0c28f0 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -191,6 +191,9 @@ static void dump_tlb_44x(void);
 static void dump_tlb_book3e(void);
 #endif
 
+static void clear_all_bpt(void);
+static void xmon_init(int);
+
 #ifdef CONFIG_PPC64
 #define REG		"%.16lx"
 #else
@@ -291,6 +294,39 @@ Commands:\n\
   zh	halt\n"
 ;
 
+#ifdef CONFIG_LOCK_DOWN_KERNEL
+static bool xmon_check_lockdown(void)
+{
+	static bool lockdown = false;
+
+	if (!lockdown) {
+		lockdown = kernel_is_locked_down("Using xmon",
+						 LOCKDOWN_CONFIDENTIALITY);
+		if (lockdown) {
+			printf("xmon: Disabled by strict kernel lockdown\n");
+			xmon_on = 0;
+			xmon_init(0);
+		}
+	}
+
+	if (!xmon_is_ro) {
+		xmon_is_ro = kernel_is_locked_down("Using xmon write-access",
+						   LOCKDOWN_INTEGRITY);
+		if (xmon_is_ro) {
+			printf("xmon: Read-only due to kernel lockdown\n");
+			clear_all_bpt();
+		}
+	}
+
+	return lockdown;
+}
+#else
+inline static bool xmon_check_lockdown(void)
+{
+	return false;
+}
+#endif /* CONFIG_LOCK_DOWN_KERNEL */
+
 static struct pt_regs *xmon_regs;
 
 static inline void sync(void)
@@ -708,6 +744,9 @@ static int xmon_bpt(struct pt_regs *regs)
 	struct bpt *bp;
 	unsigned long offset;
 
+	if (xmon_check_lockdown())
+		return 0;
+
 	if ((regs->msr & (MSR_IR|MSR_PR|MSR_64BIT)) != (MSR_IR|MSR_64BIT))
 		return 0;
 
@@ -739,6 +778,9 @@ static int xmon_sstep(struct pt_regs *regs)
 
 static int xmon_break_match(struct pt_regs *regs)
 {
+	if (xmon_check_lockdown())
+		return 0;
+
 	if ((regs->msr & (MSR_IR|MSR_PR|MSR_64BIT)) != (MSR_IR|MSR_64BIT))
 		return 0;
 	if (dabr.enabled == 0)
@@ -749,6 +791,9 @@ static int xmon_break_match(struct pt_regs *regs)
 
 static int xmon_iabr_match(struct pt_regs *regs)
 {
+	if (xmon_check_lockdown())
+		return 0;
+
 	if ((regs->msr & (MSR_IR|MSR_PR|MSR_64BIT)) != (MSR_IR|MSR_64BIT))
 		return 0;
 	if (iabr == NULL)
@@ -3742,6 +3787,9 @@ static void xmon_init(int enable)
 #ifdef CONFIG_MAGIC_SYSRQ
 static void sysrq_handle_xmon(int key)
 {
+	if (xmon_check_lockdown())
+		return;
+
 	/* ensure xmon is enabled */
 	xmon_init(1);
 	debugger(get_irq_regs());
@@ -3763,7 +3811,6 @@ static int __init setup_xmon_sysrq(void)
 device_initcall(setup_xmon_sysrq);
 #endif /* CONFIG_MAGIC_SYSRQ */
 
-#ifdef CONFIG_DEBUG_FS
 static void clear_all_bpt(void)
 {
 	int i;
@@ -3785,8 +3832,12 @@ static void clear_all_bpt(void)
 	printf("xmon: All breakpoints cleared\n");
 }
 
+#ifdef CONFIG_DEBUG_FS
 static int xmon_dbgfs_set(void *data, u64 val)
 {
+	if (xmon_check_lockdown())
+		return 0;
+
 	xmon_on = !!val;
 	xmon_init(xmon_on);
 
@@ -3845,6 +3896,9 @@ early_param("xmon", early_parse_xmon);
 
 void __init xmon_setup(void)
 {
+	if (xmon_check_lockdown())
+		return;
+
 	if (xmon_on)
 		xmon_init(1);
 	if (xmon_early)
-- 
2.21.0

