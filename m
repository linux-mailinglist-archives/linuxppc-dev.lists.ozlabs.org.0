Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7497B4E654E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 15:34:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPSQq2qQNz307B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 01:34:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPSMf25nsz3bY2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 01:31:26 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KPSM542QVz9sTd;
 Thu, 24 Mar 2022 15:30:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E72FP5nJgv9L; Thu, 24 Mar 2022 15:30:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KPSLy4mnbz9sTl;
 Thu, 24 Mar 2022 15:30:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8FB168B780;
 Thu, 24 Mar 2022 15:30:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id i0hCn0b1i4Nh; Thu, 24 Mar 2022 15:30:50 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.77])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B68F18B78F;
 Thu, 24 Mar 2022 15:30:49 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22OEUhg11811730
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Thu, 24 Mar 2022 15:30:43 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22OEUhX11811729;
 Thu, 24 Mar 2022 15:30:43 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 13/22] powerpc/ftrace: Use PPC_RAW_xxx() macros instead of
 opencoding.
Date: Thu, 24 Mar 2022 15:30:03 +0100
Message-Id: <bf3b854ca8f6f5abd29a7b2d9f74a7724fe35e33.1648131740.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648131740.git.christophe.leroy@csgroup.eu>
References: <cover.1648131740.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1648132151; l=3990; s=20211009;
 h=from:subject:message-id; bh=L4Cwq1gLkMCkjjBN0wT65BKj7kA0es8AXhR8S18nacw=;
 b=CTgmkiBqRnsX5ISpbGSkjgXwtqAS60f/ixxWPDxoUl4JaGyHR6aEO6Au8r6/0x7Y9g77iUbnZ3tl
 HFbUsm1wCD5JGw+HhfhMyOdHaeQt2pEEavaALTQeoOppeH2w2Yjx
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PPC_RAW_xxx() macros are self explanatory and less error prone
than open coding.

Use them in ftrace.c

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc-opcode.h |  3 +++
 arch/powerpc/kernel/trace/ftrace.c    | 32 +++++++++------------------
 2 files changed, 14 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 82f1f0041c6f..281754aca0a3 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -294,6 +294,8 @@
 #define PPC_INST_BL			0x48000001
 #define PPC_INST_BRANCH_COND		0x40800000
 
+#define PPC_INST_OFFSET24_MASK		0x03fffffc
+
 /* Prefixes */
 #define PPC_INST_LFS			0xc0000000
 #define PPC_INST_STFS			0xd0000000
@@ -572,6 +574,7 @@
 #define PPC_RAW_EIEIO()			(0x7c0006ac)
 
 #define PPC_RAW_BRANCH(addr)		(PPC_INST_BRANCH | ((addr) & 0x03fffffc))
+#define PPC_RAW_BL(offset)		(0x48000001 | ((offset) & PPC_INST_OFFSET24_MASK))
 
 /* Deal with instructions that older assemblers aren't aware of */
 #define	PPC_BCCTR_FLUSH		stringify_in_c(.long PPC_INST_BCCTR_FLUSH)
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index fdc0412c1d8a..afb1d12838c9 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -90,19 +90,19 @@ static int test_24bit_addr(unsigned long ip, unsigned long addr)
 
 static int is_bl_op(ppc_inst_t op)
 {
-	return (ppc_inst_val(op) & 0xfc000003) == 0x48000001;
+	return (ppc_inst_val(op) & ~PPC_INST_OFFSET24_MASK) == PPC_RAW_BL(0);
 }
 
 static int is_b_op(ppc_inst_t op)
 {
-	return (ppc_inst_val(op) & 0xfc000003) == 0x48000000;
+	return (ppc_inst_val(op) & ~PPC_INST_OFFSET24_MASK) == PPC_RAW_BRANCH(0);
 }
 
 static unsigned long find_bl_target(unsigned long ip, ppc_inst_t op)
 {
 	int offset;
 
-	offset = (ppc_inst_val(op) & 0x03fffffc);
+	offset = (ppc_inst_val(op) & PPC_INST_OFFSET24_MASK);
 	/* make it signed */
 	if (offset & 0x02000000)
 		offset |= 0xfe000000;
@@ -182,7 +182,7 @@ __ftrace_make_nop(struct module *mod,
 	 * Use a b +8 to jump over the load.
 	 */
 
-	pop = ppc_inst(PPC_INST_BRANCH | 8);	/* b +8 */
+	pop = ppc_inst(PPC_RAW_BRANCH(8));	/* b +8 */
 
 	/*
 	 * Check what is in the next instruction. We can see ld r2,40(r1), but
@@ -394,17 +394,8 @@ int ftrace_make_nop(struct module *mod,
 static int
 expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
 {
-	/*
-	 * We expect to see:
-	 *
-	 * b +8
-	 * ld r2,XX(r1)
-	 *
-	 * The load offset is different depending on the ABI. For simplicity
-	 * just mask it out when doing the compare.
-	 */
-	if (!ppc_inst_equal(op0, ppc_inst(0x48000008)) ||
-	    (ppc_inst_val(op1) & 0xffff0000) != 0xe8410000)
+	if (!ppc_inst_equal(op0, ppc_inst(PPC_RAW_BRANCH(8))) ||
+	    !ppc_inst_equal(op1, ppc_inst(PPC_INST_LD_TOC)))
 		return 0;
 	return 1;
 }
@@ -412,7 +403,6 @@ expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
 static int
 expected_nop_sequence(void *ip, ppc_inst_t op0, ppc_inst_t op1)
 {
-	/* look for patched "NOP" on ppc64 with -mprofile-kernel or ppc32 */
 	if (!ppc_inst_equal(op0, ppc_inst(PPC_RAW_NOP())))
 		return 0;
 	return 1;
@@ -738,11 +728,11 @@ int __init ftrace_dyn_arch_init(void)
 	int i;
 	unsigned int *tramp[] = { ftrace_tramp_text, ftrace_tramp_init };
 	u32 stub_insns[] = {
-		0xe98d0000 | PACATOC,	/* ld      r12,PACATOC(r13)	*/
-		0x3d8c0000,		/* addis   r12,r12,<high>	*/
-		0x398c0000,		/* addi    r12,r12,<low>	*/
-		0x7d8903a6,		/* mtctr   r12			*/
-		0x4e800420,		/* bctr				*/
+		PPC_RAW_LD(_R12, _R13, PACATOC),
+		PPC_RAW_ADDIS(_R12, _R12, 0),
+		PPC_RAW_ADDIS(_R12, _R12, 0),
+		PPC_RAW_MTCTR(_R12),
+		PPC_RAW_BCTR()
 	};
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 	unsigned long addr = ppc_global_function_entry((void *)ftrace_regs_caller);
-- 
2.35.1

