Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6914117173A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 13:31:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SsTg5JwfzDqp5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 23:31:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=klMgwkpu; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SrYN4N5nzDqy9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 22:49:12 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48SrYJ3qQYz9tyhx;
 Thu, 27 Feb 2020 12:49:08 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=klMgwkpu; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id RHlZ6xokiZLT; Thu, 27 Feb 2020 12:49:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48SrYJ2nl9z9tyhM;
 Thu, 27 Feb 2020 12:49:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582804148; bh=+qjclCTypUSk8rUN8fryWx8rZBtGiqAJ4Vg5qmlZkUQ=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=klMgwkpugnSbAPuCNVRiswTWt7vaB0A5wtwf42k6h+h08ea2kY79YEU3XzepsGgaQ
 GLvKSdGhR7NtF8n1Tdn/Wub/lXCM6Uzbt7fgMi+Vv1tBieJ5dhjlDh0o3ZPPtxCDHk
 kYoD6DqTriNK3J1RtKMMnBExdxBgt5PWyy8Kzh9I=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A09408B872;
 Thu, 27 Feb 2020 12:49:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fIviKnrjjkZM; Thu, 27 Feb 2020 12:49:09 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 629738B799;
 Thu, 27 Feb 2020 12:49:09 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 32F1665402; Thu, 27 Feb 2020 11:49:09 +0000 (UTC)
Message-Id: <ef998d954b65d5dbdd2891067aa54ffc6d79e053.1582803998.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1582803998.git.christophe.leroy@c-s.fr>
References: <cover.1582803998.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 12/13] powerpc/ptrace: create ppc_gethwdinfo()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 mikey@neuling.org
Date: Thu, 27 Feb 2020 11:49:09 +0000 (UTC)
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
 arch/powerpc/kernel/ptrace/ptrace-adv.c   | 15 +++++++++++
 arch/powerpc/kernel/ptrace/ptrace-decl.h  |  1 +
 arch/powerpc/kernel/ptrace/ptrace-noadv.c | 20 ++++++++++++++
 arch/powerpc/kernel/ptrace/ptrace.c       | 32 +----------------------
 4 files changed, 37 insertions(+), 31 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace-adv.c b/arch/powerpc/kernel/ptrace/ptrace-adv.c
index c71bedd54a8b..3990c01ef8cf 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-adv.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-adv.c
@@ -56,6 +56,21 @@ void user_disable_single_step(struct task_struct *task)
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
index 4b4b6a1d508a..3c8a81999292 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-decl.h
+++ b/arch/powerpc/kernel/ptrace/ptrace-decl.h
@@ -176,6 +176,7 @@ int tm_cgpr32_set(struct task_struct *target, const struct user_regset *regset,
 extern const struct user_regset_view user_ppc_native_view;
 
 /* ptrace-(no)adv */
+void ppc_gethwdinfo(struct ppc_debug_info *dbginfo);
 int ptrace_get_debugreg(struct task_struct *child, unsigned long addr,
 			unsigned long __user *datalp);
 int ptrace_set_debugreg(struct task_struct *task, unsigned long addr, unsigned long data);
diff --git a/arch/powerpc/kernel/ptrace/ptrace-noadv.c b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
index 9c1ef9c2ffd4..8a616d87fffb 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-noadv.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
@@ -39,6 +39,26 @@ void user_disable_single_step(struct task_struct *task)
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
index d6e1a301d20e..a44f6e5e05ff 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -139,37 +139,7 @@ long arch_ptrace(struct task_struct *child, long request,
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
2.25.0

