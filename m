Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6675FF02B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Oct 2022 16:20:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MppSr522Vz3fZF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Oct 2022 01:20:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mETiHzlD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mETiHzlD;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MpntY6zfDz3dy3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Oct 2022 00:54:13 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 30D9B61B4A;
	Fri, 14 Oct 2022 13:54:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90ADC433C1;
	Fri, 14 Oct 2022 13:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665755651;
	bh=aklpmO0q2Dp4zIh5GuP4Y13ttkWm06iQLcFxoreB6pg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mETiHzlDI1hHoVt266ve09fxExiRM4ZnyHmL1voDR5s92xAa7HR8TMMx620YFNP02
	 oDT/nJ6HdBYd9YiUKffzeqCkGWXMLdLlXrzjw57q4iYH4qGAWAOMFT7xCc+6A3QiWJ
	 JQFtzpyoFx12yAUmfdHZOQOJANigvNtpOf3zNTUHb/Zbo4wA6bpqeemYM7dFbERT27
	 nTS59pY0j+v40Q/OD615+xe1FNX730qtHbcAtdxVNa8JKhocaAi9KDPt174VrfJrZS
	 33Cfp99z5zBHR8vO1RhARPwyKH1Jcq643gEOw6JKFbxBAi9i5vIzIk/ac0yhQuVNVY
	 KQqmKWyMjW+MQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 2/7] powerpc/math-emu: Remove -w build flag and fix warnings
Date: Fri, 14 Oct 2022 09:53:55 -0400
Message-Id: <20221014135402.2109942-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221014135402.2109942-1-sashal@kernel.org>
References: <20221014135402.2109942-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org, Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

[ Upstream commit 7245fc5bb7a966852d5bd7779d1f5855530b461a ]

As reported by Nathan, the module_init() macro was not taken into
account because the header was missing. That means spe_mathemu_init()
was never called.

This should have been detected by gcc at build time, but due to
'-w' flag it went undetected.

Removing that flag leads to many warnings hence errors.

Fix those warnings then remove the -w flag.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Link: https://lore.kernel.org/r/2663961738a46073713786d4efeb53100ca156e7.1662134272.git.christophe.leroy@csgroup.eu
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/math-emu/Makefile   |  2 --
 arch/powerpc/math-emu/math.c     | 18 +++++-----
 arch/powerpc/math-emu/math_efp.c | 57 +++++++++++++++++---------------
 include/math-emu/op-common.h     |  3 ++
 4 files changed, 42 insertions(+), 38 deletions(-)

diff --git a/arch/powerpc/math-emu/Makefile b/arch/powerpc/math-emu/Makefile
index a8794032f15f..26fef2e5672e 100644
--- a/arch/powerpc/math-emu/Makefile
+++ b/arch/powerpc/math-emu/Makefile
@@ -16,5 +16,3 @@ obj-$(CONFIG_SPE)		+= math_efp.o
 
 CFLAGS_fabs.o = -fno-builtin-fabs
 CFLAGS_math.o = -fno-builtin-fabs
-
-ccflags-y = -w
diff --git a/arch/powerpc/math-emu/math.c b/arch/powerpc/math-emu/math.c
index 30b4b69c6941..d9ce80585ecd 100644
--- a/arch/powerpc/math-emu/math.c
+++ b/arch/powerpc/math-emu/math.c
@@ -24,9 +24,9 @@ FLOATFUNC(mtfsf);
 FLOATFUNC(mtfsfi);
 
 #ifdef CONFIG_MATH_EMULATION_HW_UNIMPLEMENTED
-#undef FLOATFUNC(x)
+#undef FLOATFUNC
 #define FLOATFUNC(x)	static inline int x(void *op1, void *op2, void *op3, \
-						 void *op4) { }
+						 void *op4) { return 0; }
 #endif
 
 FLOATFUNC(fadd);
@@ -396,28 +396,28 @@ do_mathemu(struct pt_regs *regs)
 
 	case XCR:
 		op0 = (void *)&regs->ccr;
-		op1 = (void *)((insn >> 23) & 0x7);
+		op1 = (void *)(long)((insn >> 23) & 0x7);
 		op2 = (void *)&current->thread.TS_FPR((insn >> 16) & 0x1f);
 		op3 = (void *)&current->thread.TS_FPR((insn >> 11) & 0x1f);
 		break;
 
 	case XCRL:
 		op0 = (void *)&regs->ccr;
-		op1 = (void *)((insn >> 23) & 0x7);
-		op2 = (void *)((insn >> 18) & 0x7);
+		op1 = (void *)(long)((insn >> 23) & 0x7);
+		op2 = (void *)(long)((insn >> 18) & 0x7);
 		break;
 
 	case XCRB:
-		op0 = (void *)((insn >> 21) & 0x1f);
+		op0 = (void *)(long)((insn >> 21) & 0x1f);
 		break;
 
 	case XCRI:
-		op0 = (void *)((insn >> 23) & 0x7);
-		op1 = (void *)((insn >> 12) & 0xf);
+		op0 = (void *)(long)((insn >> 23) & 0x7);
+		op1 = (void *)(long)((insn >> 12) & 0xf);
 		break;
 
 	case XFLB:
-		op0 = (void *)((insn >> 17) & 0xff);
+		op0 = (void *)(long)((insn >> 17) & 0xff);
 		op1 = (void *)&current->thread.TS_FPR((insn >> 11) & 0x1f);
 		break;
 
diff --git a/arch/powerpc/math-emu/math_efp.c b/arch/powerpc/math-emu/math_efp.c
index 0a05e51964c1..3b35340ffc90 100644
--- a/arch/powerpc/math-emu/math_efp.c
+++ b/arch/powerpc/math-emu/math_efp.c
@@ -218,6 +218,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 		case AB:
 		case XCR:
 			FP_UNPACK_SP(SA, va.wp + 1);
+			fallthrough;
 		case XB:
 			FP_UNPACK_SP(SB, vb.wp + 1);
 			break;
@@ -226,8 +227,8 @@ int do_spe_mathemu(struct pt_regs *regs)
 			break;
 		}
 
-		pr_debug("SA: %ld %08lx %ld (%ld)\n", SA_s, SA_f, SA_e, SA_c);
-		pr_debug("SB: %ld %08lx %ld (%ld)\n", SB_s, SB_f, SB_e, SB_c);
+		pr_debug("SA: %d %08x %d (%d)\n", SA_s, SA_f, SA_e, SA_c);
+		pr_debug("SB: %d %08x %d (%d)\n", SB_s, SB_f, SB_e, SB_c);
 
 		switch (func) {
 		case EFSABS:
@@ -278,7 +279,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 			} else {
 				SB_e += (func == EFSCTSF ? 31 : 32);
 				FP_TO_INT_ROUND_S(vc.wp[1], SB, 32,
-						(func == EFSCTSF));
+						(func == EFSCTSF) ? 1 : 0);
 			}
 			goto update_regs;
 
@@ -287,7 +288,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 			FP_CLEAR_EXCEPTIONS;
 			FP_UNPACK_DP(DB, vb.dp);
 
-			pr_debug("DB: %ld %08lx %08lx %ld (%ld)\n",
+			pr_debug("DB: %d %08x %08x %d (%d)\n",
 					DB_s, DB_f1, DB_f0, DB_e, DB_c);
 
 			FP_CONV(S, D, 1, 2, SR, DB);
@@ -301,7 +302,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 				FP_SET_EXCEPTION(FP_EX_INVALID);
 			} else {
 				FP_TO_INT_ROUND_S(vc.wp[1], SB, 32,
-						((func & 0x3) != 0));
+						((func & 0x3) != 0) ? 1 : 0);
 			}
 			goto update_regs;
 
@@ -312,7 +313,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 				FP_SET_EXCEPTION(FP_EX_INVALID);
 			} else {
 				FP_TO_INT_S(vc.wp[1], SB, 32,
-						((func & 0x3) != 0));
+						((func & 0x3) != 0) ? 1 : 0);
 			}
 			goto update_regs;
 
@@ -322,7 +323,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 		break;
 
 pack_s:
-		pr_debug("SR: %ld %08lx %ld (%ld)\n", SR_s, SR_f, SR_e, SR_c);
+		pr_debug("SR: %d %08x %d (%d)\n", SR_s, SR_f, SR_e, SR_c);
 
 		FP_PACK_SP(vc.wp + 1, SR);
 		goto update_regs;
@@ -346,6 +347,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 		case AB:
 		case XCR:
 			FP_UNPACK_DP(DA, va.dp);
+			fallthrough;
 		case XB:
 			FP_UNPACK_DP(DB, vb.dp);
 			break;
@@ -354,9 +356,9 @@ int do_spe_mathemu(struct pt_regs *regs)
 			break;
 		}
 
-		pr_debug("DA: %ld %08lx %08lx %ld (%ld)\n",
+		pr_debug("DA: %d %08x %08x %d (%d)\n",
 				DA_s, DA_f1, DA_f0, DA_e, DA_c);
-		pr_debug("DB: %ld %08lx %08lx %ld (%ld)\n",
+		pr_debug("DB: %d %08x %08x %d (%d)\n",
 				DB_s, DB_f1, DB_f0, DB_e, DB_c);
 
 		switch (func) {
@@ -408,7 +410,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 			} else {
 				DB_e += (func == EFDCTSF ? 31 : 32);
 				FP_TO_INT_ROUND_D(vc.wp[1], DB, 32,
-						(func == EFDCTSF));
+						(func == EFDCTSF) ? 1 : 0);
 			}
 			goto update_regs;
 
@@ -417,7 +419,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 			FP_CLEAR_EXCEPTIONS;
 			FP_UNPACK_SP(SB, vb.wp + 1);
 
-			pr_debug("SB: %ld %08lx %ld (%ld)\n",
+			pr_debug("SB: %d %08x %d (%d)\n",
 					SB_s, SB_f, SB_e, SB_c);
 
 			FP_CONV(D, S, 2, 1, DR, SB);
@@ -431,7 +433,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 				FP_SET_EXCEPTION(FP_EX_INVALID);
 			} else {
 				FP_TO_INT_D(vc.dp[0], DB, 64,
-						((func & 0x1) == 0));
+						((func & 0x1) == 0) ? 1 : 0);
 			}
 			goto update_regs;
 
@@ -442,7 +444,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 				FP_SET_EXCEPTION(FP_EX_INVALID);
 			} else {
 				FP_TO_INT_ROUND_D(vc.wp[1], DB, 32,
-						((func & 0x3) != 0));
+						((func & 0x3) != 0) ? 1 : 0);
 			}
 			goto update_regs;
 
@@ -453,7 +455,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 				FP_SET_EXCEPTION(FP_EX_INVALID);
 			} else {
 				FP_TO_INT_D(vc.wp[1], DB, 32,
-						((func & 0x3) != 0));
+						((func & 0x3) != 0) ? 1 : 0);
 			}
 			goto update_regs;
 
@@ -463,7 +465,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 		break;
 
 pack_d:
-		pr_debug("DR: %ld %08lx %08lx %ld (%ld)\n",
+		pr_debug("DR: %d %08x %08x %d (%d)\n",
 				DR_s, DR_f1, DR_f0, DR_e, DR_c);
 
 		FP_PACK_DP(vc.dp, DR);
@@ -492,6 +494,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 		case XCR:
 			FP_UNPACK_SP(SA0, va.wp);
 			FP_UNPACK_SP(SA1, va.wp + 1);
+			fallthrough;
 		case XB:
 			FP_UNPACK_SP(SB0, vb.wp);
 			FP_UNPACK_SP(SB1, vb.wp + 1);
@@ -502,13 +505,13 @@ int do_spe_mathemu(struct pt_regs *regs)
 			break;
 		}
 
-		pr_debug("SA0: %ld %08lx %ld (%ld)\n",
+		pr_debug("SA0: %d %08x %d (%d)\n",
 				SA0_s, SA0_f, SA0_e, SA0_c);
-		pr_debug("SA1: %ld %08lx %ld (%ld)\n",
+		pr_debug("SA1: %d %08x %d (%d)\n",
 				SA1_s, SA1_f, SA1_e, SA1_c);
-		pr_debug("SB0: %ld %08lx %ld (%ld)\n",
+		pr_debug("SB0: %d %08x %d (%d)\n",
 				SB0_s, SB0_f, SB0_e, SB0_c);
-		pr_debug("SB1: %ld %08lx %ld (%ld)\n",
+		pr_debug("SB1: %d %08x %d (%d)\n",
 				SB1_s, SB1_f, SB1_e, SB1_c);
 
 		switch (func) {
@@ -567,7 +570,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 			} else {
 				SB0_e += (func == EVFSCTSF ? 31 : 32);
 				FP_TO_INT_ROUND_S(vc.wp[0], SB0, 32,
-						(func == EVFSCTSF));
+						(func == EVFSCTSF) ? 1 : 0);
 			}
 			if (SB1_c == FP_CLS_NAN) {
 				vc.wp[1] = 0;
@@ -575,7 +578,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 			} else {
 				SB1_e += (func == EVFSCTSF ? 31 : 32);
 				FP_TO_INT_ROUND_S(vc.wp[1], SB1, 32,
-						(func == EVFSCTSF));
+						(func == EVFSCTSF) ? 1 : 0);
 			}
 			goto update_regs;
 
@@ -586,14 +589,14 @@ int do_spe_mathemu(struct pt_regs *regs)
 				FP_SET_EXCEPTION(FP_EX_INVALID);
 			} else {
 				FP_TO_INT_ROUND_S(vc.wp[0], SB0, 32,
-						((func & 0x3) != 0));
+						((func & 0x3) != 0) ? 1 : 0);
 			}
 			if (SB1_c == FP_CLS_NAN) {
 				vc.wp[1] = 0;
 				FP_SET_EXCEPTION(FP_EX_INVALID);
 			} else {
 				FP_TO_INT_ROUND_S(vc.wp[1], SB1, 32,
-						((func & 0x3) != 0));
+						((func & 0x3) != 0) ? 1 : 0);
 			}
 			goto update_regs;
 
@@ -604,14 +607,14 @@ int do_spe_mathemu(struct pt_regs *regs)
 				FP_SET_EXCEPTION(FP_EX_INVALID);
 			} else {
 				FP_TO_INT_S(vc.wp[0], SB0, 32,
-						((func & 0x3) != 0));
+						((func & 0x3) != 0) ? 1 : 0);
 			}
 			if (SB1_c == FP_CLS_NAN) {
 				vc.wp[1] = 0;
 				FP_SET_EXCEPTION(FP_EX_INVALID);
 			} else {
 				FP_TO_INT_S(vc.wp[1], SB1, 32,
-						((func & 0x3) != 0));
+						((func & 0x3) != 0) ? 1 : 0);
 			}
 			goto update_regs;
 
@@ -621,9 +624,9 @@ int do_spe_mathemu(struct pt_regs *regs)
 		break;
 
 pack_vs:
-		pr_debug("SR0: %ld %08lx %ld (%ld)\n",
+		pr_debug("SR0: %d %08x %d (%d)\n",
 				SR0_s, SR0_f, SR0_e, SR0_c);
-		pr_debug("SR1: %ld %08lx %ld (%ld)\n",
+		pr_debug("SR1: %d %08x %d (%d)\n",
 				SR1_s, SR1_f, SR1_e, SR1_c);
 
 		FP_PACK_SP(vc.wp, SR0);
diff --git a/include/math-emu/op-common.h b/include/math-emu/op-common.h
index adcc6a97db61..b4539358bb01 100644
--- a/include/math-emu/op-common.h
+++ b/include/math-emu/op-common.h
@@ -662,12 +662,14 @@ do {									\
 	if (X##_e < 0)								\
 	  {									\
 	    FP_SET_EXCEPTION(FP_EX_INEXACT);					\
+	    fallthrough;							\
 	  case FP_CLS_ZERO:							\
 	    r = 0;								\
 	  }									\
 	else if (X##_e >= rsize - (rsigned > 0 || X##_s)			\
 		 || (!rsigned && X##_s))					\
 	  {	/* overflow */							\
+	    fallthrough;							\
 	  case FP_CLS_NAN:                                                      \
 	  case FP_CLS_INF:							\
 	    if (rsigned == 2)							\
@@ -767,6 +769,7 @@ do {									\
 	if (X##_e >= rsize - (rsigned > 0 || X##_s)				\
 	    || (!rsigned && X##_s))						\
 	  {	/* overflow */							\
+	    fallthrough;							\
 	  case FP_CLS_NAN:                                                      \
 	  case FP_CLS_INF:							\
 	    if (!rsigned)							\
-- 
2.35.1

