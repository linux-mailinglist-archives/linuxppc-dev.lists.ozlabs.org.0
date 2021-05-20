Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 876B438B093
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 15:54:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmB7M3BQTz3ddT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 23:54:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmB3h1KYCz3c3h
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 23:51:27 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FmB372KN3z9sW7;
 Thu, 20 May 2021 15:50:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F-56nO9M-OXf; Thu, 20 May 2021 15:50:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FmB2w73WGz9sTp;
 Thu, 20 May 2021 15:50:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E13F78B815;
 Thu, 20 May 2021 15:50:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UtQ2-JkR5yOo; Thu, 20 May 2021 15:50:48 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8AC338B767;
 Thu, 20 May 2021 15:50:48 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7D92564C40; Thu, 20 May 2021 13:50:48 +0000 (UTC)
Message-Id: <8ebbd977ea8cf8d706d82458f2a21acd44562a99.1621516826.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1621516826.git.christophe.leroy@csgroup.eu>
References: <cover.1621516826.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 11/12] powerpc/optprobes: Compact code source a bit.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com, jniethe5@gmail.com
Date: Thu, 20 May 2021 13:50:48 +0000 (UTC)
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

Now that lines can be up to 100 chars long, minimise the
amount of split lines to increase readability.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/optprobes.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index 8c08ca15faf3..9c1c8de8c06d 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -18,18 +18,12 @@
 #include <asm/ppc-opcode.h>
 #include <asm/inst.h>
 
-#define TMPL_CALL_HDLR_IDX	\
-	(optprobe_template_call_handler - optprobe_template_entry)
-#define TMPL_EMULATE_IDX	\
-	(optprobe_template_call_emulate - optprobe_template_entry)
-#define TMPL_RET_IDX		\
-	(optprobe_template_ret - optprobe_template_entry)
-#define TMPL_OP_IDX		\
-	(optprobe_template_op_address - optprobe_template_entry)
-#define TMPL_INSN_IDX		\
-	(optprobe_template_insn - optprobe_template_entry)
-#define TMPL_END_IDX		\
-	(optprobe_template_end - optprobe_template_entry)
+#define TMPL_CALL_HDLR_IDX	(optprobe_template_call_handler - optprobe_template_entry)
+#define TMPL_EMULATE_IDX	(optprobe_template_call_emulate - optprobe_template_entry)
+#define TMPL_RET_IDX		(optprobe_template_ret - optprobe_template_entry)
+#define TMPL_OP_IDX		(optprobe_template_op_address - optprobe_template_entry)
+#define TMPL_INSN_IDX		(optprobe_template_insn - optprobe_template_entry)
+#define TMPL_END_IDX		(optprobe_template_end - optprobe_template_entry)
 
 DEFINE_INSN_CACHE_OPS(ppc_optinsn);
 
@@ -280,8 +274,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	 */
 	patch_branch(buff + TMPL_RET_IDX, nip, 0);
 
-	flush_icache_range((unsigned long)buff,
-			   (unsigned long)(&buff[TMPL_END_IDX]));
+	flush_icache_range((unsigned long)buff, (unsigned long)(&buff[TMPL_END_IDX]));
 
 	op->optinsn.insn = buff;
 
@@ -319,10 +312,8 @@ void arch_optimize_kprobes(struct list_head *oplist)
 		 * Backup instructions which will be replaced
 		 * by jump address
 		 */
-		memcpy(op->optinsn.copied_insn, op->kp.addr,
-					       RELATIVEJUMP_SIZE);
-		create_branch(&instr, op->kp.addr,
-			      (unsigned long)op->optinsn.insn, 0);
+		memcpy(op->optinsn.copied_insn, op->kp.addr, RELATIVEJUMP_SIZE);
+		create_branch(&instr, op->kp.addr, (unsigned long)op->optinsn.insn, 0);
 		patch_instruction(op->kp.addr, instr);
 		list_del_init(&op->list);
 	}
@@ -333,8 +324,7 @@ void arch_unoptimize_kprobe(struct optimized_kprobe *op)
 	arch_arm_kprobe(&op->kp);
 }
 
-void arch_unoptimize_kprobes(struct list_head *oplist,
-			     struct list_head *done_list)
+void arch_unoptimize_kprobes(struct list_head *oplist, struct list_head *done_list)
 {
 	struct optimized_kprobe *op;
 	struct optimized_kprobe *tmp;
@@ -345,8 +335,7 @@ void arch_unoptimize_kprobes(struct list_head *oplist,
 	}
 }
 
-int arch_within_optimized_kprobe(struct optimized_kprobe *op,
-				 unsigned long addr)
+int arch_within_optimized_kprobe(struct optimized_kprobe *op, unsigned long addr)
 {
 	return ((unsigned long)op->kp.addr <= addr &&
 		(unsigned long)op->kp.addr + RELATIVEJUMP_SIZE > addr);
-- 
2.25.0

