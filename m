Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3855438B094
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 15:54:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmB7j1TZNz3dww
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 23:54:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmB3l6G3nz3c55
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 23:51:31 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FmB382YT6z9sTp;
 Thu, 20 May 2021 15:51:00 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zdD4Mets5ZeE; Thu, 20 May 2021 15:51:00 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FmB2x6YHLz9sTd;
 Thu, 20 May 2021 15:50:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C339D8B808;
 Thu, 20 May 2021 15:50:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id y3gveetMcaH2; Thu, 20 May 2021 15:50:49 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8F4BE8B767;
 Thu, 20 May 2021 15:50:49 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 838BC64C40; Thu, 20 May 2021 13:50:49 +0000 (UTC)
Message-Id: <5a167b8ba4d33a5c09cd504f0c862e25ffe85459.1621516826.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1621516826.git.christophe.leroy@csgroup.eu>
References: <cover.1621516826.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 12/12] powerpc/optprobes: use PPC_RAW_ macros
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com, jniethe5@gmail.com
Date: Thu, 20 May 2021 13:50:49 +0000 (UTC)
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

Use PPC_RAW_ macros to simplify the code.

And use PPC_LO/PPC_HI instead of IMM_L/IMM_H which are for
internal use inside ppc-opcode.h

Those macros are self explanatory, comments can go as well.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc-opcode.h | 11 ++++----
 arch/powerpc/kernel/optprobes.c       | 39 +++++----------------------
 2 files changed, 12 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index ac41776661e9..87802e8073e6 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -261,9 +261,6 @@
 #define PPC_INST_BCTR			0x4e800420
 #define PPC_INST_BCTRL			0x4e800421
 #define PPC_INST_DIVD			0x7c0003d2
-#define PPC_INST_RLDICR			0x78000004
-#define PPC_INST_ORI			0x60000000
-#define PPC_INST_ORIS			0x64000000
 #define PPC_INST_BRANCH			0x48000000
 #define PPC_INST_BL			0x48000001
 #define PPC_INST_BRANCH_COND		0x40800000
@@ -323,6 +320,8 @@
 #define PPC_LO(v)	((v) & 0xffff)
 #define PPC_HI(v)	(((v) >> 16) & 0xffff)
 #define PPC_HA(v)	PPC_HI((v) + 0x8000)
+#define PPC_HIGHER(v)	(((v) >> 32) & 0xffff)
+#define PPC_HIGHEST(v)	(((v) >> 48) & 0xffff)
 
 /*
  * Only use the larx hint bit on 64bit CPUs. e500v1/v2 based CPUs will treat a
@@ -499,8 +498,8 @@
 #define PPC_RAW_AND_DOT(d, a, b)	(0x7c000039 | ___PPC_RA(d) | ___PPC_RS(a) | ___PPC_RB(b))
 #define PPC_RAW_OR(d, a, b)		(0x7c000378 | ___PPC_RA(d) | ___PPC_RS(a) | ___PPC_RB(b))
 #define PPC_RAW_MR(d, a)		PPC_RAW_OR(d, a, a)
-#define PPC_RAW_ORI(d, a, i)		(PPC_INST_ORI | ___PPC_RA(d) | ___PPC_RS(a) | IMM_L(i))
-#define PPC_RAW_ORIS(d, a, i)		(PPC_INST_ORIS | ___PPC_RA(d) | ___PPC_RS(a) | IMM_L(i))
+#define PPC_RAW_ORI(d, a, i)		(0x60000000 | ___PPC_RA(d) | ___PPC_RS(a) | IMM_L(i))
+#define PPC_RAW_ORIS(d, a, i)		(0x64000000 | ___PPC_RA(d) | ___PPC_RS(a) | IMM_L(i))
 #define PPC_RAW_NOR(d, a, b)		(0x7c0000f8 | ___PPC_RA(d) | ___PPC_RS(a) | ___PPC_RB(b))
 #define PPC_RAW_XOR(d, a, b)		(0x7c000278 | ___PPC_RA(d) | ___PPC_RS(a) | ___PPC_RB(b))
 #define PPC_RAW_XORI(d, a, i)		(0x68000000 | ___PPC_RA(d) | ___PPC_RS(a) | IMM_L(i))
@@ -519,7 +518,7 @@
 					(0x54000001 | ___PPC_RA(d) | ___PPC_RS(a) | __PPC_SH(i) | __PPC_MB(mb) | __PPC_ME(me))
 #define PPC_RAW_RLWIMI(d, a, i, mb, me) (0x50000000 | ___PPC_RA(d) | ___PPC_RS(a) | __PPC_SH(i) | __PPC_MB(mb) | __PPC_ME(me))
 #define PPC_RAW_RLDICL(d, a, i, mb)     (0x78000000 | ___PPC_RA(d) | ___PPC_RS(a) | __PPC_SH64(i) | __PPC_MB64(mb))
-#define PPC_RAW_RLDICR(d, a, i, me)     (PPC_INST_RLDICR | ___PPC_RA(d) | ___PPC_RS(a) | __PPC_SH64(i) | __PPC_ME64(me))
+#define PPC_RAW_RLDICR(d, a, i, me)     (0x78000004 | ___PPC_RA(d) | ___PPC_RS(a) | __PPC_SH64(i) | __PPC_ME64(me))
 
 /* slwi = rlwinm Rx, Ry, n, 0, 31-n */
 #define PPC_RAW_SLWI(d, a, i)		PPC_RAW_RLWINM(d, a, i, 0, 31-(i))
diff --git a/arch/powerpc/kernel/optprobes.c b/arch/powerpc/kernel/optprobes.c
index 9c1c8de8c06d..1488d4e9b34d 100644
--- a/arch/powerpc/kernel/optprobes.c
+++ b/arch/powerpc/kernel/optprobes.c
@@ -137,10 +137,8 @@ void arch_remove_optimized_kprobe(struct optimized_kprobe *op)
 
 static void patch_imm32_load_insns(unsigned long val, int reg, kprobe_opcode_t *addr)
 {
-	patch_instruction(addr, ppc_inst(PPC_RAW_LIS(reg, IMM_H(val))));
-	addr++;
-
-	patch_instruction(addr, ppc_inst(PPC_RAW_ORI(reg, reg, IMM_L(val))));
+	patch_instruction(addr++, ppc_inst(PPC_RAW_LIS(reg, PPC_HI(val))));
+	patch_instruction(addr, ppc_inst(PPC_RAW_ORI(reg, reg, PPC_LO(val))));
 }
 
 /*
@@ -149,34 +147,11 @@ static void patch_imm32_load_insns(unsigned long val, int reg, kprobe_opcode_t *
  */
 static void patch_imm64_load_insns(unsigned long long val, int reg, kprobe_opcode_t *addr)
 {
-	/* lis reg,(op)@highest */
-	patch_instruction(addr,
-			  ppc_inst(PPC_INST_ADDIS | ___PPC_RT(reg) |
-				   ((val >> 48) & 0xffff)));
-	addr++;
-
-	/* ori reg,reg,(op)@higher */
-	patch_instruction(addr,
-			  ppc_inst(PPC_INST_ORI | ___PPC_RA(reg) |
-				   ___PPC_RS(reg) | ((val >> 32) & 0xffff)));
-	addr++;
-
-	/* rldicr reg,reg,32,31 */
-	patch_instruction(addr,
-			  ppc_inst(PPC_INST_RLDICR | ___PPC_RA(reg) |
-				   ___PPC_RS(reg) | __PPC_SH64(32) | __PPC_ME64(31)));
-	addr++;
-
-	/* oris reg,reg,(op)@h */
-	patch_instruction(addr,
-			  ppc_inst(PPC_INST_ORIS | ___PPC_RA(reg) |
-				   ___PPC_RS(reg) | ((val >> 16) & 0xffff)));
-	addr++;
-
-	/* ori reg,reg,(op)@l */
-	patch_instruction(addr,
-			  ppc_inst(PPC_INST_ORI | ___PPC_RA(reg) |
-				   ___PPC_RS(reg) | (val & 0xffff)));
+	patch_instruction(addr++, ppc_inst(PPC_RAW_LIS(reg, PPC_HIGHEST(val))));
+	patch_instruction(addr++, ppc_inst(PPC_RAW_ORI(reg, reg, PPC_HIGHER(val))));
+	patch_instruction(addr++, ppc_inst(PPC_RAW_SLDI(reg, reg, 32)));
+	patch_instruction(addr++, ppc_inst(PPC_RAW_ORIS(reg, reg, PPC_HI(val))));
+	patch_instruction(addr, ppc_inst(PPC_RAW_ORI(reg, reg, PPC_LO(val))));
 }
 
 static void patch_imm_load_insns(unsigned long val, int reg, kprobe_opcode_t *addr)
-- 
2.25.0

