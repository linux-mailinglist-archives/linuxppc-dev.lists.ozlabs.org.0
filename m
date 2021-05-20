Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC7E38B092
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 15:54:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmB714dQ6z3c72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 23:54:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmB3b55ywz3bpH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 23:51:23 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FmB350m6Mz9sVX;
 Thu, 20 May 2021 15:50:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mw8-PmS1LE6Z; Thu, 20 May 2021 15:50:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FmB2w0LfWz9sTB;
 Thu, 20 May 2021 15:50:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9F7748B816;
 Thu, 20 May 2021 15:50:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QGzKoaUy5THu; Thu, 20 May 2021 15:50:47 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 75AFE8B808;
 Thu, 20 May 2021 15:50:47 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 68FBA64C40; Thu, 20 May 2021 13:50:47 +0000 (UTC)
Message-Id: <e03192a6d4123242a275e71ce2ba0bb4d90700c1.1621516826.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1621516826.git.christophe.leroy@csgroup.eu>
References: <cover.1621516826.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 10/12] powerpc/optprobes: Minimise casts
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com, jniethe5@gmail.com
Date: Thu, 20 May 2021 13:50:47 +0000 (UTC)
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

nip is already an unsigned long, no cast needed.

op_callback_addr and emulate_step_addr are kprobe_opcode_t *.
There value is obtained with ppc_kallsyms_lookup_name() which
returns 'unsigned long', and there values are used create_branch()
which expects 'unsigned long'. So change them to 'unsigned long'
to avoid casting them back and forth.

can_optimize() used p->addr several times as 'unsigned long'.
Use a local 'unsigned long' variable and avoid casting multiple times.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/optprobes.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index adaf31157f6d..8c08ca15faf3 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -66,6 +66,7 @@ static unsigned long can_optimize(struct kprobe *p)
 	struct pt_regs regs;
 	struct instruction_op op;
 	unsigned long nip = 0;
+	unsigned long addr = (unsigned long)p->addr;
 
 	/*
 	 * kprobe placed for kretprobe during boot time
@@ -73,7 +74,7 @@ static unsigned long can_optimize(struct kprobe *p)
 	 * So further checks can be skipped.
 	 */
 	if (p->addr == (kprobe_opcode_t *)&kretprobe_trampoline)
-		return (unsigned long)p->addr + sizeof(kprobe_opcode_t);
+		return addr + sizeof(kprobe_opcode_t);
 
 	/*
 	 * We only support optimizing kernel addresses, but not
@@ -81,11 +82,11 @@ static unsigned long can_optimize(struct kprobe *p)
 	 *
 	 * FIXME: Optimize kprobes placed in module addresses.
 	 */
-	if (!is_kernel_addr((unsigned long)p->addr))
+	if (!is_kernel_addr(addr))
 		return 0;
 
 	memset(&regs, 0, sizeof(struct pt_regs));
-	regs.nip = (unsigned long)p->addr;
+	regs.nip = addr;
 	regs.trap = 0x0;
 	regs.msr = MSR_KERNEL;
 
@@ -195,7 +196,8 @@ static void patch_imm_load_insns(unsigned long val, int reg, kprobe_opcode_t *ad
 int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 {
 	struct ppc_inst branch_op_callback, branch_emulate_step, temp;
-	kprobe_opcode_t *op_callback_addr, *emulate_step_addr, *buff;
+	unsigned long op_callback_addr, emulate_step_addr;
+	kprobe_opcode_t *buff;
 	long b_offset;
 	unsigned long nip, size;
 	int rc, i;
@@ -225,8 +227,7 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 		goto error;
 
 	/* Check if the return address is also within 32MB range */
-	b_offset = (unsigned long)(buff + TMPL_RET_IDX) -
-			(unsigned long)nip;
+	b_offset = (unsigned long)(buff + TMPL_RET_IDX) - nip;
 	if (!is_offset_in_branch_range(b_offset))
 		goto error;
 
@@ -249,20 +250,18 @@ int arch_prepare_optimized_kprobe(struct optimized_kprobe *op, struct kprobe *p)
 	/*
 	 * 2. branch to optimized_callback() and emulate_step()
 	 */
-	op_callback_addr = (kprobe_opcode_t *)ppc_kallsyms_lookup_name("optimized_callback");
-	emulate_step_addr = (kprobe_opcode_t *)ppc_kallsyms_lookup_name("emulate_step");
+	op_callback_addr = ppc_kallsyms_lookup_name("optimized_callback");
+	emulate_step_addr = ppc_kallsyms_lookup_name("emulate_step");
 	if (!op_callback_addr || !emulate_step_addr) {
 		WARN(1, "Unable to lookup optimized_callback()/emulate_step()\n");
 		goto error;
 	}
 
 	rc = create_branch(&branch_op_callback, buff + TMPL_CALL_HDLR_IDX,
-			   (unsigned long)op_callback_addr,
-			   BRANCH_SET_LINK);
+			   op_callback_addr, BRANCH_SET_LINK);
 
 	rc |= create_branch(&branch_emulate_step, buff + TMPL_EMULATE_IDX,
-			    (unsigned long)emulate_step_addr,
-			    BRANCH_SET_LINK);
+			    emulate_step_addr, BRANCH_SET_LINK);
 
 	if (rc)
 		goto error;
-- 
2.25.0

