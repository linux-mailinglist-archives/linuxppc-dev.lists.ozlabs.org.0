Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C465AAB64
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 11:29:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJt0f018yz3cFm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 19:29:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJsyP2mqmz2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 19:27:41 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4MJsyC38thz9sqv;
	Fri,  2 Sep 2022 11:27:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z18zyH3sEAAj; Fri,  2 Sep 2022 11:27:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4MJsyB5Cxpz9sr0;
	Fri,  2 Sep 2022 11:27:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9A3798B786;
	Fri,  2 Sep 2022 11:27:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WIWnHWbmx_-6; Fri,  2 Sep 2022 11:27:30 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.39])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 524A08B764;
	Fri,  2 Sep 2022 11:27:30 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2829RGsV2117061
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 2 Sep 2022 11:27:16 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2829RGTq2117060;
	Fri, 2 Sep 2022 11:27:16 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: [PATCH 2/2] powerpc/math-emu: Remove -w build flag and fix warnings
Date: Fri,  2 Sep 2022 11:27:06 +0200
Message-Id: <ceaf081fa7eeb5c1d0ad97fd24f2295fcff7e181.1662110814.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <a7384eafc6a27aea15bdc9e8f9a12aac593fccb7.1662110814.git.christophe.leroy@csgroup.eu>
References: <a7384eafc6a27aea15bdc9e8f9a12aac593fccb7.1662110814.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1662110825; l=7901; s=20211009; h=from:subject:message-id; bh=YldljCNF0g06APW8QlmgpcCJm/0p+GAlcJQrnguuuVs=; b=THBVclhy+OabYwyg7VT4vAHKMHTb3o4nsh4ahx0fKCCkPGcrutY8GSAYh1vOPorHRxAbuLct/klS zh/140KICoZkqusjw1rW83PxOdxDlHOxFamXy1TU7rtK5QYEID4E
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As reported by Nathan, the module_init() macro was not taken into
account because the header was missing. That means spe_mathemu_init()
was never called.

This should have been detected by gcc at build time, but due to
'-w' flag it went undetected.

Removing that flag leads to many warnings hence errors.

Fix those warnings then remove the -w flag.

Reported-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/math-emu/Makefile   |  2 --
 arch/powerpc/math-emu/math_efp.c | 57 +++++++++++++++++---------------
 2 files changed, 30 insertions(+), 29 deletions(-)

diff --git a/arch/powerpc/math-emu/Makefile b/arch/powerpc/math-emu/Makefile
index a8794032f15f..26fef2e5672e 100644
--- a/arch/powerpc/math-emu/Makefile
+++ b/arch/powerpc/math-emu/Makefile
@@ -16,5 +16,3 @@ obj-$(CONFIG_SPE)		+= math_efp.o
 
 CFLAGS_fabs.o = -fno-builtin-fabs
 CFLAGS_math.o = -fno-builtin-fabs
-
-ccflags-y = -w
diff --git a/arch/powerpc/math-emu/math_efp.c b/arch/powerpc/math-emu/math_efp.c
index aa3bb8da1cb9..f01e3475f689 100644
--- a/arch/powerpc/math-emu/math_efp.c
+++ b/arch/powerpc/math-emu/math_efp.c
@@ -219,6 +219,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 		case AB:
 		case XCR:
 			FP_UNPACK_SP(SA, va.wp + 1);
+			fallthrough;
 		case XB:
 			FP_UNPACK_SP(SB, vb.wp + 1);
 			break;
@@ -227,8 +228,8 @@ int do_spe_mathemu(struct pt_regs *regs)
 			break;
 		}
 
-		pr_debug("SA: %ld %08lx %ld (%ld)\n", SA_s, SA_f, SA_e, SA_c);
-		pr_debug("SB: %ld %08lx %ld (%ld)\n", SB_s, SB_f, SB_e, SB_c);
+		pr_debug("SA: %d %08x %d (%d)\n", SA_s, SA_f, SA_e, SA_c);
+		pr_debug("SB: %d %08x %d (%d)\n", SB_s, SB_f, SB_e, SB_c);
 
 		switch (func) {
 		case EFSABS:
@@ -279,7 +280,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 			} else {
 				SB_e += (func == EFSCTSF ? 31 : 32);
 				FP_TO_INT_ROUND_S(vc.wp[1], SB, 32,
-						(func == EFSCTSF));
+						(func == EFSCTSF) ? 1 : 0);
 			}
 			goto update_regs;
 
@@ -288,7 +289,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 			FP_CLEAR_EXCEPTIONS;
 			FP_UNPACK_DP(DB, vb.dp);
 
-			pr_debug("DB: %ld %08lx %08lx %ld (%ld)\n",
+			pr_debug("DB: %d %08x %08x %d (%d)\n",
 					DB_s, DB_f1, DB_f0, DB_e, DB_c);
 
 			FP_CONV(S, D, 1, 2, SR, DB);
@@ -302,7 +303,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 				FP_SET_EXCEPTION(FP_EX_INVALID);
 			} else {
 				FP_TO_INT_ROUND_S(vc.wp[1], SB, 32,
-						((func & 0x3) != 0));
+						((func & 0x3) != 0) ? 1 : 0);
 			}
 			goto update_regs;
 
@@ -313,7 +314,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 				FP_SET_EXCEPTION(FP_EX_INVALID);
 			} else {
 				FP_TO_INT_S(vc.wp[1], SB, 32,
-						((func & 0x3) != 0));
+						((func & 0x3) != 0) ? 1 : 0);
 			}
 			goto update_regs;
 
@@ -323,7 +324,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 		break;
 
 pack_s:
-		pr_debug("SR: %ld %08lx %ld (%ld)\n", SR_s, SR_f, SR_e, SR_c);
+		pr_debug("SR: %d %08x %d (%d)\n", SR_s, SR_f, SR_e, SR_c);
 
 		FP_PACK_SP(vc.wp + 1, SR);
 		goto update_regs;
@@ -347,6 +348,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 		case AB:
 		case XCR:
 			FP_UNPACK_DP(DA, va.dp);
+			fallthrough;
 		case XB:
 			FP_UNPACK_DP(DB, vb.dp);
 			break;
@@ -355,9 +357,9 @@ int do_spe_mathemu(struct pt_regs *regs)
 			break;
 		}
 
-		pr_debug("DA: %ld %08lx %08lx %ld (%ld)\n",
+		pr_debug("DA: %d %08x %08x %d (%d)\n",
 				DA_s, DA_f1, DA_f0, DA_e, DA_c);
-		pr_debug("DB: %ld %08lx %08lx %ld (%ld)\n",
+		pr_debug("DB: %d %08x %08x %d (%d)\n",
 				DB_s, DB_f1, DB_f0, DB_e, DB_c);
 
 		switch (func) {
@@ -409,7 +411,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 			} else {
 				DB_e += (func == EFDCTSF ? 31 : 32);
 				FP_TO_INT_ROUND_D(vc.wp[1], DB, 32,
-						(func == EFDCTSF));
+						(func == EFDCTSF) ? 1 : 0);
 			}
 			goto update_regs;
 
@@ -418,7 +420,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 			FP_CLEAR_EXCEPTIONS;
 			FP_UNPACK_SP(SB, vb.wp + 1);
 
-			pr_debug("SB: %ld %08lx %ld (%ld)\n",
+			pr_debug("SB: %d %08x %d (%d)\n",
 					SB_s, SB_f, SB_e, SB_c);
 
 			FP_CONV(D, S, 2, 1, DR, SB);
@@ -432,7 +434,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 				FP_SET_EXCEPTION(FP_EX_INVALID);
 			} else {
 				FP_TO_INT_D(vc.dp[0], DB, 64,
-						((func & 0x1) == 0));
+						((func & 0x1) == 0) ? 1 : 0);
 			}
 			goto update_regs;
 
@@ -443,7 +445,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 				FP_SET_EXCEPTION(FP_EX_INVALID);
 			} else {
 				FP_TO_INT_ROUND_D(vc.wp[1], DB, 32,
-						((func & 0x3) != 0));
+						((func & 0x3) != 0) ? 1 : 0);
 			}
 			goto update_regs;
 
@@ -454,7 +456,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 				FP_SET_EXCEPTION(FP_EX_INVALID);
 			} else {
 				FP_TO_INT_D(vc.wp[1], DB, 32,
-						((func & 0x3) != 0));
+						((func & 0x3) != 0) ? 1 : 0);
 			}
 			goto update_regs;
 
@@ -464,7 +466,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 		break;
 
 pack_d:
-		pr_debug("DR: %ld %08lx %08lx %ld (%ld)\n",
+		pr_debug("DR: %d %08x %08x %d (%d)\n",
 				DR_s, DR_f1, DR_f0, DR_e, DR_c);
 
 		FP_PACK_DP(vc.dp, DR);
@@ -493,6 +495,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 		case XCR:
 			FP_UNPACK_SP(SA0, va.wp);
 			FP_UNPACK_SP(SA1, va.wp + 1);
+			fallthrough;
 		case XB:
 			FP_UNPACK_SP(SB0, vb.wp);
 			FP_UNPACK_SP(SB1, vb.wp + 1);
@@ -503,13 +506,13 @@ int do_spe_mathemu(struct pt_regs *regs)
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
@@ -568,7 +571,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 			} else {
 				SB0_e += (func == EVFSCTSF ? 31 : 32);
 				FP_TO_INT_ROUND_S(vc.wp[0], SB0, 32,
-						(func == EVFSCTSF));
+						(func == EVFSCTSF) ? 1 : 0);
 			}
 			if (SB1_c == FP_CLS_NAN) {
 				vc.wp[1] = 0;
@@ -576,7 +579,7 @@ int do_spe_mathemu(struct pt_regs *regs)
 			} else {
 				SB1_e += (func == EVFSCTSF ? 31 : 32);
 				FP_TO_INT_ROUND_S(vc.wp[1], SB1, 32,
-						(func == EVFSCTSF));
+						(func == EVFSCTSF) ? 1 : 0);
 			}
 			goto update_regs;
 
@@ -587,14 +590,14 @@ int do_spe_mathemu(struct pt_regs *regs)
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
 
@@ -605,14 +608,14 @@ int do_spe_mathemu(struct pt_regs *regs)
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
 
@@ -622,9 +625,9 @@ int do_spe_mathemu(struct pt_regs *regs)
 		break;
 
 pack_vs:
-		pr_debug("SR0: %ld %08lx %ld (%ld)\n",
+		pr_debug("SR0: %d %08x %d (%d)\n",
 				SR0_s, SR0_f, SR0_e, SR0_c);
-		pr_debug("SR1: %ld %08lx %ld (%ld)\n",
+		pr_debug("SR1: %d %08x %d (%d)\n",
 				SR1_s, SR1_f, SR1_e, SR1_c);
 
 		FP_PACK_SP(vc.wp, SR0);
-- 
2.37.1

