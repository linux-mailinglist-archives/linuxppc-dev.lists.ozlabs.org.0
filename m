Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B99354D7B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 13:22:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Y3fk48bVzDqMm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 21:22:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="QYw8aS+c"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Y36j0nyszDq8B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jun 2019 20:58:20 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45Y36c4j1Nz9v17f;
 Tue, 25 Jun 2019 12:58:16 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=QYw8aS+c; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id q5L_hjenim9M; Tue, 25 Jun 2019 12:58:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45Y36c3h6rz9v17d;
 Tue, 25 Jun 2019 12:58:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1561460296; bh=+GT6REm4vdeCBBrg/PCyaTpeweCM7WJfCiBlQ40TIUk=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=QYw8aS+ctAp4orUqH4zBvS4mTN62U9owTKSL3F6PFSyclBhZuHUcFRs9Pi5YRaAAd
 3GIVfeLVd3gA16BahfZdc9Iv9FxWVI+QO8JJD/GLoUcQLHlDO+BgytlfBvwkcuC3gu
 LJ84/EEwSSP6pwVRrlv/Z6FxEqdgkzU00sMto7Rs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8D38D8B874;
 Tue, 25 Jun 2019 12:58:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id V_--FxdE_pQf; Tue, 25 Jun 2019 12:58:17 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 50BDA8B87A;
 Tue, 25 Jun 2019 12:58:17 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 29FFE68E1B; Tue, 25 Jun 2019 10:58:17 +0000 (UTC)
Message-Id: <290a9673b0adac34f0008f2679efd5ab5a5c4478.1561459984.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1561459983.git.christophe.leroy@c-s.fr>
References: <cover.1561459983.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v1 11/13] powerpc/ptrace: create ppc_gethwdinfo()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 mikey@neuling.org
Date: Tue, 25 Jun 2019 10:58:17 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Create ippc_gethwdinfo() to handle PPC_PTRACE_GETHWDBGINFO and
reduce ifdef mess

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/ptrace/ptrace-adv.c   | 15 +++++++++++++++
 arch/powerpc/kernel/ptrace/ptrace-decl.h  |  1 +
 arch/powerpc/kernel/ptrace/ptrace-noadv.c | 20 +++++++++++++++++++
 arch/powerpc/kernel/ptrace/ptrace.c       | 32 +------------------------------
 4 files changed, 37 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace-adv.c b/arch/powerpc/kernel/ptrace/ptrace-adv.c
index dcc765940344..f5f334484ebc 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-adv.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-adv.c
@@ -83,6 +83,21 @@ void user_disable_single_step(struct task_struct *task)
 	clear_tsk_thread_flag(task, TIF_SINGLESTEP);
 }
 
+void ppc_gethwdinfo(struct ppc_debug_info *dbginfo)
+{
+	dbginfo->version = 1;
+	dbginfo->num_instruction_bps = CONFIG_PPC_ADV_DEBUG_IACS;
+	dbginfo->num_data_bps = CONFIG_PPC_ADV_DEBUG_DACS;
+	dbginfo->num_condition_regs = CONFIG_PPC_ADV_DEBUG_DVCS;
+	dbginfo->data_bp_alignment = 4;
+	dbginfo->sizeof_condition = 4;
+	dbginfo->features = PPC_DEBUG_FEATURE_INSN_BP_RANGE |
+			    PPC_DEBUG_FEATURE_INSN_BP_MASK;
+	if (IS_ENABLED(CONFIG_PPC_ADV_DEBUG_DAC_RANGE))
+		dbginfo->features |= PPC_DEBUG_FEATURE_DATA_BP_RANGE |
+				     PPC_DEBUG_FEATURE_DATA_BP_MASK;
+}
+
 int ptrace_get_debugreg(struct task_struct *child, unsigned long addr,
 			unsigned long __user *datalp)
 {
diff --git a/arch/powerpc/kernel/ptrace/ptrace-decl.h b/arch/powerpc/kernel/ptrace/ptrace-decl.h
index cd5b8256ba56..2404b987b23c 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-decl.h
+++ b/arch/powerpc/kernel/ptrace/ptrace-decl.h
@@ -141,6 +141,7 @@ int tm_cgpr32_set(struct task_struct *target, const struct user_regset *regset,
 extern const struct user_regset_view user_ppc_native_view;
 
 /* ptrace-(no)adv */
+void ppc_gethwdinfo(struct ppc_debug_info *dbginfo);
 int ptrace_get_debugreg(struct task_struct *child, unsigned long addr,
 			unsigned long __user *datalp);
 int ptrace_set_debugreg(struct task_struct *task, unsigned long addr, unsigned long data);
diff --git a/arch/powerpc/kernel/ptrace/ptrace-noadv.c b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
index 985cca136f85..426fedd7ab6c 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-noadv.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
@@ -64,6 +64,26 @@ void user_disable_single_step(struct task_struct *task)
 	clear_tsk_thread_flag(task, TIF_SINGLESTEP);
 }
 
+void ppc_gethwdinfo(struct ppc_debug_info *dbginfo)
+{
+	dbginfo->version = 1;
+	dbginfo->num_instruction_bps = 0;
+	if (ppc_breakpoint_available())
+		dbginfo->num_data_bps = 1;
+	else
+		dbginfo->num_data_bps = 0;
+	dbginfo->num_condition_regs = 0;
+	dbginfo->data_bp_alignment = sizeof(long);
+	dbginfo->sizeof_condition = 0;
+	if (IS_ENABLED(CONFIG_HAVE_HW_BREAKPOINT)) {
+		dbginfo->features = PPC_DEBUG_FEATURE_DATA_BP_RANGE;
+		if (dawr_enabled())
+			dbginfo->features |= PPC_DEBUG_FEATURE_DATA_BP_DAWR;
+	} else {
+		dbginfo->features = 0;
+	}
+}
+
 int ptrace_get_debugreg(struct task_struct *child, unsigned long addr,
 			unsigned long __user *datalp)
 {
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index e789afae6f56..31e8c5a9171e 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -159,37 +159,7 @@ long arch_ptrace(struct task_struct *child, long request,
 	case PPC_PTRACE_GETHWDBGINFO: {
 		struct ppc_debug_info dbginfo;
 
-		dbginfo.version = 1;
-#ifdef CONFIG_PPC_ADV_DEBUG_REGS
-		dbginfo.num_instruction_bps = CONFIG_PPC_ADV_DEBUG_IACS;
-		dbginfo.num_data_bps = CONFIG_PPC_ADV_DEBUG_DACS;
-		dbginfo.num_condition_regs = CONFIG_PPC_ADV_DEBUG_DVCS;
-		dbginfo.data_bp_alignment = 4;
-		dbginfo.sizeof_condition = 4;
-		dbginfo.features = PPC_DEBUG_FEATURE_INSN_BP_RANGE |
-				   PPC_DEBUG_FEATURE_INSN_BP_MASK;
-#ifdef CONFIG_PPC_ADV_DEBUG_DAC_RANGE
-		dbginfo.features |=
-				   PPC_DEBUG_FEATURE_DATA_BP_RANGE |
-				   PPC_DEBUG_FEATURE_DATA_BP_MASK;
-#endif
-#else /* !CONFIG_PPC_ADV_DEBUG_REGS */
-		dbginfo.num_instruction_bps = 0;
-		if (ppc_breakpoint_available())
-			dbginfo.num_data_bps = 1;
-		else
-			dbginfo.num_data_bps = 0;
-		dbginfo.num_condition_regs = 0;
-		dbginfo.data_bp_alignment = sizeof(long);
-		dbginfo.sizeof_condition = 0;
-#ifdef CONFIG_HAVE_HW_BREAKPOINT
-		dbginfo.features = PPC_DEBUG_FEATURE_DATA_BP_RANGE;
-		if (dawr_enabled())
-			dbginfo.features |= PPC_DEBUG_FEATURE_DATA_BP_DAWR;
-#else
-		dbginfo.features = 0;
-#endif /* CONFIG_HAVE_HW_BREAKPOINT */
-#endif /* CONFIG_PPC_ADV_DEBUG_REGS */
+		ppc_gethwdinfo(&dbginfo);
 
 		if (copy_to_user(datavp, &dbginfo,
 				 sizeof(struct ppc_debug_info)))
-- 
2.13.3

