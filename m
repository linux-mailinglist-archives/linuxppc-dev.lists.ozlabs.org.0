Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F47151E4EC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 08:53:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwJ743LKTz3dyG
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 16:53:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwJ0f2gGLz3dPh
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 16:48:02 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KwHzY1NWyz9sWF;
 Sat,  7 May 2022 08:47:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0wUNc64vnRG; Sat,  7 May 2022 08:47:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KwHzF2S6Mz9sWH;
 Sat,  7 May 2022 08:46:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4B7D78B773;
 Sat,  7 May 2022 08:46:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Gf4nao63hgxJ; Sat,  7 May 2022 08:46:49 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 30E6B8B7A9;
 Sat,  7 May 2022 08:46:47 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2476keuv1320534
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 7 May 2022 08:46:40 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2476keeE1320533;
 Sat, 7 May 2022 08:46:40 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, naveen.n.rao@linux.vnet.ibm.com
Subject: [PATCH v2 16/25] powerpc/ftrace: Use PPC_RAW_xxx() macros instead of
 opencoding.
Date: Sat,  7 May 2022 08:46:18 +0200
Message-Id: <9292094c9a69cef6d29ee83f435a557b59c45065.1651905939.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1651905939.git.christophe.leroy@csgroup.eu>
References: <cover.1651905939.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1651905981; l=4146; s=20211009;
 h=from:subject:message-id; bh=l9MWFNRL2JH1tmWE8RlPsArFLXGPKhtcJE5wWg52jNU=;
 b=iVWZVuen2R8rRu9w7XoKww6e7FkhkY3izm+zXjthYMDADLgJvh25+Hq41xK3kZ3mEGDMoniiBKsX
 dxnINaolBn1qm2KKgxvVEv+gepYx313sj7QO8/uAsVXN9voQbdFr
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
v2:
- Replaced PPC_INST_OFFSET24_MASK by PPC_LI_MASK and added PPC_LI().
- Fix ADDI instead of ADDIS
---
 arch/powerpc/include/asm/ppc-opcode.h |  5 +++++
 arch/powerpc/kernel/trace/ftrace.c    | 32 +++++++++------------------
 2 files changed, 16 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 82f1f0041c6f..3e9aa96ae74b 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -352,6 +352,10 @@
 #define PPC_HIGHER(v)	(((v) >> 32) & 0xffff)
 #define PPC_HIGHEST(v)	(((v) >> 48) & 0xffff)
 
+/* LI Field */
+#define PPC_LI_MASK	0x03fffffc
+#define PPC_LI(v)	((v) & PPC_LI_MASK)
+
 /*
  * Only use the larx hint bit on 64bit CPUs. e500v1/v2 based CPUs will treat a
  * larx with EH set as an illegal instruction.
@@ -572,6 +576,7 @@
 #define PPC_RAW_EIEIO()			(0x7c0006ac)
 
 #define PPC_RAW_BRANCH(addr)		(PPC_INST_BRANCH | ((addr) & 0x03fffffc))
+#define PPC_RAW_BL(offset)		(0x48000001 | PPC_LI(offset))
 
 /* Deal with instructions that older assemblers aren't aware of */
 #define	PPC_BCCTR_FLUSH		stringify_in_c(.long PPC_INST_BCCTR_FLUSH)
diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
index c4a68340a351..ac3f97dd1729 100644
--- a/arch/powerpc/kernel/trace/ftrace.c
+++ b/arch/powerpc/kernel/trace/ftrace.c
@@ -90,19 +90,19 @@ static int test_24bit_addr(unsigned long ip, unsigned long addr)
 
 static int is_bl_op(ppc_inst_t op)
 {
-	return (ppc_inst_val(op) & 0xfc000003) == 0x48000001;
+	return (ppc_inst_val(op) & ~PPC_LI_MASK) == PPC_RAW_BL(0);
 }
 
 static int is_b_op(ppc_inst_t op)
 {
-	return (ppc_inst_val(op) & 0xfc000003) == 0x48000000;
+	return (ppc_inst_val(op) & ~PPC_LI_MASK) == PPC_RAW_BRANCH(0);
 }
 
 static unsigned long find_bl_target(unsigned long ip, ppc_inst_t op)
 {
 	int offset;
 
-	offset = (ppc_inst_val(op) & 0x03fffffc);
+	offset = PPC_LI(ppc_inst_val(op));
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
+		PPC_RAW_ADDI(_R12, _R12, 0),
+		PPC_RAW_MTCTR(_R12),
+		PPC_RAW_BCTR()
 	};
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
 	unsigned long addr = ppc_global_function_entry((void *)ftrace_regs_caller);
-- 
2.35.1

