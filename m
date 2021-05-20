Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E31038A679
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 12:26:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm5W24V6Xz3c4D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 20:26:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm5Rx3xMnz3c1L
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 20:23:41 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Fm5RN02vpz9sVs;
 Thu, 20 May 2021 12:23:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HQX43WlMW-gC; Thu, 20 May 2021 12:23:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Fm5RL0nmLz9sVM;
 Thu, 20 May 2021 12:23:10 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D90148B811;
 Thu, 20 May 2021 12:23:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1OQrkVU3sLE0; Thu, 20 May 2021 12:23:09 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8A9588B814;
 Thu, 20 May 2021 12:23:09 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 744E064C44; Thu, 20 May 2021 10:23:09 +0000 (UTC)
Message-Id: <e79cd8e111ca13bf8c61a384bac365aa7e207647.1621506159.git.christophe.leroy@csgroup.eu>
In-Reply-To: <5d146b31b943e7ad674894421db4feef54804b9b.1621506159.git.christophe.leroy@csgroup.eu>
References: <5d146b31b943e7ad674894421db4feef54804b9b.1621506159.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 10/12] powerpc/lib/feature-fixups: Use PPC_RAW_xxx() macros
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 naveen.n.rao@linux.vnet.ibm.com, jniethe5@gmail.com
Date: Thu, 20 May 2021 10:23:09 +0000 (UTC)
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

Use PPC_RAW_xxx() macros instead of open coding assembly
opcodes.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/ppc-opcode.h |   4 +
 arch/powerpc/include/asm/reg.h        |   1 +
 arch/powerpc/lib/feature-fixups.c     | 121 +++++++++++++-------------
 3 files changed, 65 insertions(+), 61 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 9cf8575e00d6..027af76db4bd 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -411,6 +411,8 @@
 #define PPC_RAW_DCBFPS(a, b)		(0x7c0000ac | ___PPC_RA(a) | ___PPC_RB(b) | (4 << 21))
 #define PPC_RAW_DCBSTPS(a, b)		(0x7c0000ac | ___PPC_RA(a) | ___PPC_RB(b) | (6 << 21))
 #define PPC_RAW_SC()			(0x44000002)
+#define PPC_RAW_SYNC()			(0x7c0004ac)
+#define PPC_RAW_ISYNC()			(0x4c00012c)
 
 /*
  * Define what the VSX XX1 form instructions will look like, then add
@@ -563,6 +565,8 @@
 #define PPC_RAW_NEG(d, a)		(0x7c0000d0 | ___PPC_RT(d) | ___PPC_RA(a))
 
 #define PPC_RAW_MFSPR(d, spr)		(0x7c0002a6 | ___PPC_RT(d) | __PPC_SPR(spr))
+#define PPC_RAW_MTSPR(spr, d)		(0x7c0003a6 | ___PPC_RS(d) | __PPC_SPR(spr))
+#define PPC_RAW_EIEIO()			(0x7c0006ac)
 
 /* Deal with instructions that older assemblers aren't aware of */
 #define	PPC_BCCTR_FLUSH		stringify_in_c(.long PPC_INST_BCCTR_FLUSH)
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 7c81d3e563b2..c70782eae3a0 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -393,6 +393,7 @@
 #define SPRN_PMMAR	0x356	/* Power Management Memory Activity Register */
 #define SPRN_PSSCR	0x357	/* Processor Stop Status and Control Register (ISA 3.0) */
 #define SPRN_PSSCR_PR	0x337	/* PSSCR ISA 3.0, privileged mode access */
+#define SPRN_TRIG2	0x372
 #define SPRN_PMCR	0x374	/* Power Management Control Register */
 #define SPRN_RWMR	0x375	/* Region-Weighting Mode Register */
 
diff --git a/arch/powerpc/lib/feature-fixups.c b/arch/powerpc/lib/feature-fixups.c
index fe26f2fa0f3f..f0fc521b82ae 100644
--- a/arch/powerpc/lib/feature-fixups.c
+++ b/arch/powerpc/lib/feature-fixups.c
@@ -91,7 +91,7 @@ static int patch_feature_section(unsigned long value, struct fixup_entry *fcur)
 			return 1;
 	}
 
-	nop = ppc_inst(PPC_INST_NOP);
+	nop = ppc_inst(PPC_RAW_NOP());
 	for (; dest < end; dest = ppc_inst_next(dest, &nop))
 		raw_patch_instruction(dest, nop);
 
@@ -128,21 +128,21 @@ static void do_stf_entry_barrier_fixups(enum stf_barrier_type types)
 	start = PTRRELOC(&__start___stf_entry_barrier_fixup);
 	end = PTRRELOC(&__stop___stf_entry_barrier_fixup);
 
-	instrs[0] = 0x60000000; /* nop */
-	instrs[1] = 0x60000000; /* nop */
-	instrs[2] = 0x60000000; /* nop */
+	instrs[0] = PPC_RAW_NOP();
+	instrs[1] = PPC_RAW_NOP();
+	instrs[2] = PPC_RAW_NOP();
 
 	i = 0;
 	if (types & STF_BARRIER_FALLBACK) {
-		instrs[i++] = 0x7d4802a6; /* mflr r10		*/
-		instrs[i++] = 0x60000000; /* branch patched below */
-		instrs[i++] = 0x7d4803a6; /* mtlr r10		*/
+		instrs[i++] = PPC_RAW_MFLR(_R10);
+		instrs[i++] = PPC_RAW_NOP(); /* branch patched below */
+		instrs[i++] = PPC_RAW_MTLR(_R10);
 	} else if (types & STF_BARRIER_EIEIO) {
-		instrs[i++] = 0x7e0006ac; /* eieio + bit 6 hint */
+		instrs[i++] = PPC_RAW_EIEIO() | 0x02000000; /* eieio + bit 6 hint */
 	} else if (types & STF_BARRIER_SYNC_ORI) {
-		instrs[i++] = 0x7c0004ac; /* hwsync		*/
-		instrs[i++] = 0xe94d0000; /* ld r10,0(r13)	*/
-		instrs[i++] = 0x63ff0000; /* ori 31,31,0 speculation barrier */
+		instrs[i++] = PPC_RAW_SYNC();
+		instrs[i++] = PPC_RAW_LD(_R10, _R13, 0);
+		instrs[i++] = PPC_RAW_ORI(_R31, _R31, 0); /* speculation barrier */
 	}
 
 	for (i = 0; start < end; start++, i++) {
@@ -180,32 +180,31 @@ static void do_stf_exit_barrier_fixups(enum stf_barrier_type types)
 	start = PTRRELOC(&__start___stf_exit_barrier_fixup);
 	end = PTRRELOC(&__stop___stf_exit_barrier_fixup);
 
-	instrs[0] = 0x60000000; /* nop */
-	instrs[1] = 0x60000000; /* nop */
-	instrs[2] = 0x60000000; /* nop */
-	instrs[3] = 0x60000000; /* nop */
-	instrs[4] = 0x60000000; /* nop */
-	instrs[5] = 0x60000000; /* nop */
+	instrs[0] = PPC_RAW_NOP();
+	instrs[1] = PPC_RAW_NOP();
+	instrs[2] = PPC_RAW_NOP();
+	instrs[3] = PPC_RAW_NOP();
+	instrs[4] = PPC_RAW_NOP();
+	instrs[5] = PPC_RAW_NOP();
 
 	i = 0;
 	if (types & STF_BARRIER_FALLBACK || types & STF_BARRIER_SYNC_ORI) {
 		if (cpu_has_feature(CPU_FTR_HVMODE)) {
-			instrs[i++] = 0x7db14ba6; /* mtspr 0x131, r13 (HSPRG1) */
-			instrs[i++] = 0x7db04aa6; /* mfspr r13, 0x130 (HSPRG0) */
+			instrs[i++] = PPC_RAW_MTSPR(SPRN_HSPRG1, _R13);
+			instrs[i++] = PPC_RAW_MFSPR(_R13, SPRN_HSPRG0);
 		} else {
-			instrs[i++] = 0x7db243a6; /* mtsprg 2,r13	*/
-			instrs[i++] = 0x7db142a6; /* mfsprg r13,1    */
+			instrs[i++] = PPC_RAW_MTSPR(SPRN_SPRG2, _R13);
+			instrs[i++] = PPC_RAW_MFSPR(_R13, SPRN_SPRG1);
 	        }
-		instrs[i++] = 0x7c0004ac; /* hwsync		*/
-		instrs[i++] = 0xe9ad0000; /* ld r13,0(r13)	*/
-		instrs[i++] = 0x63ff0000; /* ori 31,31,0 speculation barrier */
-		if (cpu_has_feature(CPU_FTR_HVMODE)) {
-			instrs[i++] = 0x7db14aa6; /* mfspr r13, 0x131 (HSPRG1) */
-		} else {
-			instrs[i++] = 0x7db242a6; /* mfsprg r13,2 */
-		}
+		instrs[i++] = PPC_RAW_SYNC();
+		instrs[i++] = PPC_RAW_LD(_R10, _R13, 0);
+		instrs[i++] = PPC_RAW_ORI(_R31, _R31, 0); /* speculation barrier */
+		if (cpu_has_feature(CPU_FTR_HVMODE))
+			instrs[i++] = PPC_RAW_MFSPR(_R13, SPRN_HSPRG1);
+		else
+			instrs[i++] = PPC_RAW_MFSPR(_R13, SPRN_SPRG2);
 	} else if (types & STF_BARRIER_EIEIO) {
-		instrs[i++] = 0x7e0006ac; /* eieio + bit 6 hint */
+		instrs[i++] = PPC_RAW_EIEIO() | 0x02000000; /* eieio + bit 6 hint */
 	}
 
 	for (i = 0; start < end; start++, i++) {
@@ -258,24 +257,24 @@ void do_uaccess_flush_fixups(enum l1d_flush_type types)
 	start = PTRRELOC(&__start___uaccess_flush_fixup);
 	end = PTRRELOC(&__stop___uaccess_flush_fixup);
 
-	instrs[0] = 0x60000000; /* nop */
-	instrs[1] = 0x60000000; /* nop */
-	instrs[2] = 0x60000000; /* nop */
-	instrs[3] = 0x4e800020; /* blr */
+	instrs[0] = PPC_RAW_NOP();
+	instrs[1] = PPC_RAW_NOP();
+	instrs[2] = PPC_RAW_NOP();
+	instrs[3] = PPC_RAW_BLR();
 
 	i = 0;
 	if (types == L1D_FLUSH_FALLBACK) {
-		instrs[3] = 0x60000000; /* nop */
+		instrs[3] = PPC_RAW_NOP();
 		/* fallthrough to fallback flush */
 	}
 
 	if (types & L1D_FLUSH_ORI) {
-		instrs[i++] = 0x63ff0000; /* ori 31,31,0 speculation barrier */
-		instrs[i++] = 0x63de0000; /* ori 30,30,0 L1d flush*/
+		instrs[i++] = PPC_RAW_ORI(_R31, _R31, 0); /* speculation barrier */
+		instrs[i++] = PPC_RAW_ORI(_R30, _R30, 0); /* L1d flush */
 	}
 
 	if (types & L1D_FLUSH_MTTRIG)
-		instrs[i++] = 0x7c12dba6; /* mtspr TRIG2,r0 (SPR #882) */
+		instrs[i++] = PPC_RAW_MTSPR(SPRN_TRIG2, _R0);
 
 	for (i = 0; start < end; start++, i++) {
 		dest = (void *)start + *start;
@@ -306,24 +305,24 @@ static int __do_entry_flush_fixups(void *data)
 	long *start, *end;
 	int i;
 
-	instrs[0] = 0x60000000; /* nop */
-	instrs[1] = 0x60000000; /* nop */
-	instrs[2] = 0x60000000; /* nop */
+	instrs[0] = PPC_RAW_NOP();
+	instrs[1] = PPC_RAW_NOP();
+	instrs[2] = PPC_RAW_NOP();
 
 	i = 0;
 	if (types == L1D_FLUSH_FALLBACK) {
-		instrs[i++] = 0x7d4802a6; /* mflr r10		*/
-		instrs[i++] = 0x60000000; /* branch patched below */
-		instrs[i++] = 0x7d4803a6; /* mtlr r10		*/
+		instrs[i++] = PPC_RAW_MFLR(_R10);
+		instrs[i++] = PPC_RAW_NOP(); /* branch patched below */
+		instrs[i++] = PPC_RAW_MTLR(_R10);
 	}
 
 	if (types & L1D_FLUSH_ORI) {
-		instrs[i++] = 0x63ff0000; /* ori 31,31,0 speculation barrier */
-		instrs[i++] = 0x63de0000; /* ori 30,30,0 L1d flush*/
+		instrs[i++] = PPC_RAW_ORI(_R31, _R31, 0); /* speculation barrier */
+		instrs[i++] = PPC_RAW_ORI(_R30, _R30, 0); /* L1d flush */
 	}
 
 	if (types & L1D_FLUSH_MTTRIG)
-		instrs[i++] = 0x7c12dba6; /* mtspr TRIG2,r0 (SPR #882) */
+		instrs[i++] = PPC_RAW_MTSPR(SPRN_TRIG2, _R0);
 
 	/*
 	 * If we're patching in or out the fallback flush we need to be careful about the
@@ -421,22 +420,22 @@ void do_rfi_flush_fixups(enum l1d_flush_type types)
 	start = PTRRELOC(&__start___rfi_flush_fixup);
 	end = PTRRELOC(&__stop___rfi_flush_fixup);
 
-	instrs[0] = 0x60000000; /* nop */
-	instrs[1] = 0x60000000; /* nop */
-	instrs[2] = 0x60000000; /* nop */
+	instrs[0] = PPC_RAW_NOP();
+	instrs[1] = PPC_RAW_NOP();
+	instrs[2] = PPC_RAW_NOP();
 
 	if (types & L1D_FLUSH_FALLBACK)
 		/* b .+16 to fallback flush */
-		instrs[0] = 0x48000010;
+		instrs[0] = PPC_INST_BRANCH | 16;
 
 	i = 0;
 	if (types & L1D_FLUSH_ORI) {
-		instrs[i++] = 0x63ff0000; /* ori 31,31,0 speculation barrier */
-		instrs[i++] = 0x63de0000; /* ori 30,30,0 L1d flush*/
+		instrs[i++] = PPC_RAW_ORI(_R31, _R31, 0); /* speculation barrier */
+		instrs[i++] = PPC_RAW_ORI(_R30, _R30, 0); /* L1d flush */
 	}
 
 	if (types & L1D_FLUSH_MTTRIG)
-		instrs[i++] = 0x7c12dba6; /* mtspr TRIG2,r0 (SPR #882) */
+		instrs[i++] = PPC_RAW_MTSPR(SPRN_TRIG2, _R0);
 
 	for (i = 0; start < end; start++, i++) {
 		dest = (void *)start + *start;
@@ -467,11 +466,11 @@ void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_
 	start = fixup_start;
 	end = fixup_end;
 
-	instr = 0x60000000; /* nop */
+	instr = PPC_RAW_NOP();
 
 	if (enable) {
 		pr_info("barrier-nospec: using ORI speculation barrier\n");
-		instr = 0x63ff0000; /* ori 31,31,0 speculation barrier */
+		instr = PPC_RAW_ORI(_R31, _R31, 0); /* speculation barrier */
 	}
 
 	for (i = 0; start < end; start++, i++) {
@@ -508,13 +507,13 @@ void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_
 	start = fixup_start;
 	end = fixup_end;
 
-	instr[0] = PPC_INST_NOP;
-	instr[1] = PPC_INST_NOP;
+	instr[0] = PPC_RAW_NOP();
+	instr[1] = PPC_RAW_NOP();
 
 	if (enable) {
 		pr_info("barrier-nospec: using isync; sync as speculation barrier\n");
-		instr[0] = PPC_INST_ISYNC;
-		instr[1] = PPC_INST_SYNC;
+		instr[0] = PPC_RAW_ISYNC();
+		instr[1] = PPC_RAW_SYNC();
 	}
 
 	for (i = 0; start < end; start++, i++) {
@@ -536,7 +535,7 @@ static void patch_btb_flush_section(long *curr)
 	end = (void *)curr + *(curr + 1);
 	for (; start < end; start++) {
 		pr_devel("patching dest %lx\n", (unsigned long)start);
-		patch_instruction((struct ppc_inst *)start, ppc_inst(PPC_INST_NOP));
+		patch_instruction((struct ppc_inst *)start, ppc_inst(PPC_RAW_NOP()));
 	}
 }
 
-- 
2.25.0

