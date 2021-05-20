Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC8038A657
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 12:24:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm5T42kKdz3bvM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 20:24:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm5RY2ZNxz309V
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 20:23:21 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fm5RF3NkMz9sVx;
 Thu, 20 May 2021 12:23:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qEkTDjC3hltg; Thu, 20 May 2021 12:23:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fm5RD6CXjz9sVn;
 Thu, 20 May 2021 12:23:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AA8828B811;
 Thu, 20 May 2021 12:23:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id L4_U-O8EMe6g; Thu, 20 May 2021 12:23:04 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6AF6B8B80D;
 Thu, 20 May 2021 12:23:04 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 549C864C44; Thu, 20 May 2021 10:23:04 +0000 (UTC)
Message-Id: <99d9ee8849d3992beeadb310a665aae01c3abfb1.1621506159.git.christophe.leroy@csgroup.eu>
In-Reply-To: <5d146b31b943e7ad674894421db4feef54804b9b.1621506159.git.christophe.leroy@csgroup.eu>
References: <5d146b31b943e7ad674894421db4feef54804b9b.1621506159.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 05/12] powerpc/modules: Use PPC_RAW_xx() macros
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com, jniethe5@gmail.com
Date: Thu, 20 May 2021 10:23:04 +0000 (UTC)
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

To improve readability, use PPC_RAW_xx() macros instead of
open coding. Those macros are self-explanatory so the comments
can go as well.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
PPC_INST_ADDIS can also be removed once optprobes.c is fixed (Via another series)
---
 arch/powerpc/include/asm/ppc-opcode.h | 11 ++----
 arch/powerpc/kernel/module_32.c       | 19 +++------
 arch/powerpc/kernel/module_64.c       | 55 +++++++++------------------
 3 files changed, 27 insertions(+), 58 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 003e74827e19..91b7f6bb478b 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -286,12 +286,9 @@
 #define PPC_INST_LD			0xe8000000
 #define PPC_INST_STD			0xf8000000
 #define PPC_INST_MFLR			0x7c0802a6
-#define PPC_INST_MTCTR			0x7c0903a6
-#define PPC_INST_ADDI			0x38000000
 #define PPC_INST_ADDIS			0x3c000000
 #define PPC_INST_ADD			0x7c000214
 #define PPC_INST_BLR			0x4e800020
-#define PPC_INST_BCTR			0x4e800420
 #define PPC_INST_DIVD			0x7c0003d2
 #define PPC_INST_RLDICR			0x78000004
 #define PPC_INST_ORI			0x60000000
@@ -484,12 +481,12 @@
 #define PPC_RAW_BLRL()			(0x4e800021)
 #define PPC_RAW_MTLR(r)			(0x7c0803a6 | ___PPC_RT(r))
 #define PPC_RAW_MFLR(t)			(PPC_INST_MFLR | ___PPC_RT(t))
-#define PPC_RAW_BCTR()			(PPC_INST_BCTR)
+#define PPC_RAW_BCTR()			(0x4e800420)
 #define PPC_RAW_BCTRL()			(0x4e800421)
-#define PPC_RAW_MTCTR(r)		(PPC_INST_MTCTR | ___PPC_RT(r))
-#define PPC_RAW_ADDI(d, a, i)		(PPC_INST_ADDI | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
+#define PPC_RAW_MTCTR(r)		(0x7c0903a6 | ___PPC_RT(r))
+#define PPC_RAW_ADDI(d, a, i)		(0x38000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
 #define PPC_RAW_LI(r, i)		PPC_RAW_ADDI(r, 0, i)
-#define PPC_RAW_ADDIS(d, a, i)		(PPC_INST_ADDIS | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
+#define PPC_RAW_ADDIS(d, a, i)		(0x3c000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
 #define PPC_RAW_ADDIC(d, a, i)		(0x30000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
 #define PPC_RAW_ADDIC_DOT(d, a, i)	(0x34000000 | ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
 #define PPC_RAW_LIS(r, i)		PPC_RAW_ADDIS(r, 0, i)
diff --git a/arch/powerpc/kernel/module_32.c b/arch/powerpc/kernel/module_32.c
index c27b8687b82a..f417afc08d33 100644
--- a/arch/powerpc/kernel/module_32.c
+++ b/arch/powerpc/kernel/module_32.c
@@ -145,10 +145,9 @@ int module_frob_arch_sections(Elf32_Ehdr *hdr,
 
 static inline int entry_matches(struct ppc_plt_entry *entry, Elf32_Addr val)
 {
-	if (entry->jump[0] != (PPC_INST_ADDIS | __PPC_RT(R12) | PPC_HA(val)))
+	if (entry->jump[0] != PPC_RAW_LIS(_R12, PPC_HA(val)))
 		return 0;
-	if (entry->jump[1] != (PPC_INST_ADDI | __PPC_RT(R12) | __PPC_RA(R12) |
-			       PPC_LO(val)))
+	if (entry->jump[1] != PPC_RAW_ADDI(_R12, _R12, PPC_LO(val)))
 		return 0;
 	return 1;
 }
@@ -175,16 +174,10 @@ static uint32_t do_plt_call(void *location,
 		entry++;
 	}
 
-	/*
-	 * lis r12, sym@ha
-	 * addi r12, r12, sym@l
-	 * mtctr r12
-	 * bctr
-	 */
-	entry->jump[0] = PPC_INST_ADDIS | __PPC_RT(R12) | PPC_HA(val);
-	entry->jump[1] = PPC_INST_ADDI | __PPC_RT(R12) | __PPC_RA(R12) | PPC_LO(val);
-	entry->jump[2] = PPC_INST_MTCTR | __PPC_RS(R12);
-	entry->jump[3] = PPC_INST_BCTR;
+	entry->jump[0] = PPC_RAW_LIS(_R12, PPC_HA(val));
+	entry->jump[1] = PPC_RAW_ADDI(_R12, _R12, PPC_LO(val));
+	entry->jump[2] = PPC_RAW_MTCTR(_R12);
+	entry->jump[3] = PPC_RAW_BCTR();
 
 	pr_debug("Initialized plt for 0x%x at %p\n", val, entry);
 	return (uint32_t)entry;
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index ae2b188365b1..6baa676e7cb6 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -122,27 +122,19 @@ struct ppc64_stub_entry
  * the stub, but it's significantly shorter to put these values at the
  * end of the stub code, and patch the stub address (32-bits relative
  * to the TOC ptr, r2) into the stub.
- *
- * addis   r11,r2, <high>
- * addi    r11,r11, <low>
- * std     r2,R2_STACK_OFFSET(r1)
- * ld      r12,32(r11)
- * ld      r2,40(r11)
- * mtctr   r12
- * bctr
  */
 static u32 ppc64_stub_insns[] = {
-	PPC_INST_ADDIS | __PPC_RT(R11) | __PPC_RA(R2),
-	PPC_INST_ADDI | __PPC_RT(R11) | __PPC_RA(R11),
+	PPC_RAW_ADDIS(_R11, _R2, 0),
+	PPC_RAW_ADDI(_R11, _R11, 0),
 	/* Save current r2 value in magic place on the stack. */
-	PPC_INST_STD | __PPC_RS(R2) | __PPC_RA(R1) | R2_STACK_OFFSET,
-	PPC_INST_LD | __PPC_RT(R12) | __PPC_RA(R11) | 32,
+	PPC_RAW_STD(_R2, _R1, R2_STACK_OFFSET),
+	PPC_RAW_LD(_R12, _R11, 32),
 #ifdef PPC64_ELF_ABI_v1
 	/* Set up new r2 from function descriptor */
-	PPC_INST_LD | __PPC_RT(R2) | __PPC_RA(R11) | 40,
+	PPC_RAW_LD(_R2, _R11, 40),
 #endif
-	PPC_INST_MTCTR | __PPC_RS(R12),
-	PPC_INST_BCTR,
+	PPC_RAW_MTCTR(_R12),
+	PPC_RAW_BCTR(),
 };
 
 /* Count how many different 24-bit relocations (different symbol,
@@ -336,21 +328,12 @@ int module_frob_arch_sections(Elf64_Ehdr *hdr,
 
 #ifdef CONFIG_MPROFILE_KERNEL
 
-#define PACATOC offsetof(struct paca_struct, kernel_toc)
-
-/*
- * ld      r12,PACATOC(r13)
- * addis   r12,r12,<high>
- * addi    r12,r12,<low>
- * mtctr   r12
- * bctr
- */
 static u32 stub_insns[] = {
-	PPC_INST_LD | __PPC_RT(R12) | __PPC_RA(R13) | PACATOC,
-	PPC_INST_ADDIS | __PPC_RT(R12) | __PPC_RA(R12),
-	PPC_INST_ADDI | __PPC_RT(R12) | __PPC_RA(R12),
-	PPC_INST_MTCTR | __PPC_RS(R12),
-	PPC_INST_BCTR,
+	PPC_RAW_LD(_R12, _R13, offsetof(struct paca_struct, kernel_toc)),
+	PPC_RAW_ADDIS(_R12, _R12, 0),
+	PPC_RAW_ADDI(_R12, _R12, 0),
+	PPC_RAW_MTCTR(_R12),
+	PPC_RAW_BCTR(),
 };
 
 /*
@@ -507,7 +490,7 @@ static int restore_r2(const char *name, u32 *instruction, struct module *me)
 	if (!instr_is_relative_link_branch(ppc_inst(*prev_insn)))
 		return 1;
 
-	if (*instruction != PPC_INST_NOP) {
+	if (*instruction != PPC_RAW_NOP()) {
 		pr_err("%s: Expected nop after call, got %08x at %pS\n",
 			me->name, *instruction, instruction);
 		return 0;
@@ -696,21 +679,17 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 		         *	ld r2, ...(r12)
 			 *	add r2, r2, r12
 			 */
-			if ((((uint32_t *)location)[0] & ~0xfffc) !=
-			    (PPC_INST_LD | __PPC_RT(R2) | __PPC_RA(R12)))
+			if ((((uint32_t *)location)[0] & ~0xfffc) != PPC_RAW_LD(_R2, _R12, 0))
 				break;
-			if (((uint32_t *)location)[1] !=
-			    (PPC_INST_ADD | __PPC_RT(R2) | __PPC_RA(R2) | __PPC_RB(R12)))
+			if (((uint32_t *)location)[1] != PPC_RAW_ADD(_R2, _R2, _R12))
 				break;
 			/*
 			 * If found, replace it with:
 			 *	addis r2, r12, (.TOC.-func)@ha
 			 *	addi  r2,  r2, (.TOC.-func)@l
 			 */
-			((uint32_t *)location)[0] = PPC_INST_ADDIS | __PPC_RT(R2) |
-						    __PPC_RA(R12) | PPC_HA(value);
-			((uint32_t *)location)[1] = PPC_INST_ADDI | __PPC_RT(R2) |
-						    __PPC_RA(R2) | PPC_LO(value);
+			((uint32_t *)location)[0] = PPC_RAW_ADDIS(_R2, _R12, PPC_HA(value));
+			((uint32_t *)location)[1] = PPC_RAW_ADDI(_R2, _R2, PPC_LO(value));
 			break;
 
 		case R_PPC64_REL16_HA:
-- 
2.25.0

