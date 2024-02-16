Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 834AD85840F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 18:24:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=QhMS8gVd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbzMT3BZXz3vcF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Feb 2024 04:24:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=QhMS8gVd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbzLk5HVdz30fp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Feb 2024 04:24:14 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 3FEFD8285425
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 11:24:11 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id d-kNdksSXXDs for <linuxppc-dev@lists.ozlabs.org>;
	Fri, 16 Feb 2024 11:24:10 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id E6CA6828677E
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 11:24:09 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com E6CA6828677E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1708104249; bh=exLp0dI6O1cILsifQMSxOJXveELs26NJUcfPtab4C5s=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=QhMS8gVdtir2V1phMBEKq9c2sPxeTwtiLq8nWbgNSwfkOSdy4Fphxfr81yVcYjuzk
	 udsBigH36dzzpofsrZYSu7YXmmpfTsaRFIE+3KjqwZNNIk/S1IGxrzAMYmY9P4SQcP
	 7vwZTrseJoQXsu2hRnFoIXiPFmi+b6DsJAFGGUkE=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 2m-SKDkFf0Xp for <linuxppc-dev@lists.ozlabs.org>;
	Fri, 16 Feb 2024 11:24:09 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id BDF108285A0F
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 11:24:09 -0600 (CST)
Date: Fri, 16 Feb 2024 11:24:07 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <375482960.15931139.1708104247383.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH v3] powerpc: Add gpr1 and fpu save/restore functions
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC121 (Linux)/8.5.0_GA_3042)
Thread-Index: RzhnDO+u/VfR89Ekq2zyrQml5pwnTA==
Thread-Topic: powerpc: Add gpr1 and fpu save/restore functions
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When building the kernel in size optimized mode with the amdgpu module enabled,
gcc will begin referencing external gpr1 and fpu save/restore functions.  This
will then cause a linker failure as we do not link against libgcc which
normally contains those builtin functions.

Implement gpr1 and fpu save/restore functions per the PowerPC 64-bit ELFv2 ABI
documentation.

Tested on a Talos II with a WX7100 installed and running in DisplayCore mode.

Reported-by: kernel test robot <lkp@intel.com>
Tested-by: Timothy Pearson <tpearson@raptorengineering.com>
Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/powerpc/kernel/prom_init_check.sh |   4 +-
 arch/powerpc/lib/crtsavres.S           | 363 +++++++++++++++++--------
 scripts/mod/modpost.c                  |   4 +
 3 files changed, 253 insertions(+), 118 deletions(-)

diff --git a/arch/powerpc/kernel/prom_init_check.sh b/arch/powerpc/kernel/prom_init_check.sh
index 69623b9045d5..76c5651e29d3 100644
--- a/arch/powerpc/kernel/prom_init_check.sh
+++ b/arch/powerpc/kernel/prom_init_check.sh
@@ -72,10 +72,10 @@ do
 
 	# ignore register save/restore funcitons
 	case $UNDEF in
-	_restgpr_*|_restgpr0_*|_rest32gpr_*)
+	_restgpr_*|_restgpr0_*|_restgpr1_*|_rest32gpr_*)
 		OK=1
 		;;
-	_savegpr_*|_savegpr0_*|_save32gpr_*)
+	_savegpr_*|_savegpr0_*|_restgpr0_*|_save32gpr_*)
 		OK=1
 		;;
 	esac
diff --git a/arch/powerpc/lib/crtsavres.S b/arch/powerpc/lib/crtsavres.S
index 7e5e1c28e56a..f97270d36720 100644
--- a/arch/powerpc/lib/crtsavres.S
+++ b/arch/powerpc/lib/crtsavres.S
@@ -3,6 +3,7 @@
  *
  *   Copyright (C) 1995, 1996, 1998, 2000, 2001 Free Software Foundation, Inc.
  *   Copyright 2008 Freescale Semiconductor, Inc.
+ *   Copyright 2024 Raptor Engineering, LLC
  *   Written By Michael Meissner
  *
  * Based on gcc/config/rs6000/crtsavres.asm from gcc
@@ -314,126 +315,134 @@ _GLOBAL(_restvr_31)
 
 #else /* CONFIG_PPC64 */
 
-.globl	_savegpr0_14
-_savegpr0_14:
-	std	r14,-144(r1)
-.globl	_savegpr0_15
-_savegpr0_15:
-	std	r15,-136(r1)
-.globl	_savegpr0_16
-_savegpr0_16:
-	std	r16,-128(r1)
-.globl	_savegpr0_17
-_savegpr0_17:
-	std	r17,-120(r1)
-.globl	_savegpr0_18
-_savegpr0_18:
-	std	r18,-112(r1)
-.globl	_savegpr0_19
-_savegpr0_19:
-	std	r19,-104(r1)
-.globl	_savegpr0_20
-_savegpr0_20:
-	std	r20,-96(r1)
-.globl	_savegpr0_21
-_savegpr0_21:
-	std	r21,-88(r1)
-.globl	_savegpr0_22
-_savegpr0_22:
-	std	r22,-80(r1)
-.globl	_savegpr0_23
-_savegpr0_23:
-	std	r23,-72(r1)
-.globl	_savegpr0_24
-_savegpr0_24:
-	std	r24,-64(r1)
-.globl	_savegpr0_25
-_savegpr0_25:
-	std	r25,-56(r1)
-.globl	_savegpr0_26
-_savegpr0_26:
-	std	r26,-48(r1)
-.globl	_savegpr0_27
-_savegpr0_27:
-	std	r27,-40(r1)
-.globl	_savegpr0_28
-_savegpr0_28:
-	std	r28,-32(r1)
-.globl	_savegpr0_29
-_savegpr0_29:
-	std	r29,-24(r1)
-.globl	_savegpr0_30
-_savegpr0_30:
-	std	r30,-16(r1)
-.globl	_savegpr0_31
-_savegpr0_31:
-	std	r31,-8(r1)
-	std	r0,16(r1)
+#define __PPC64_SAVEGPR(n,base)	\
+.globl	_savegpr##n##_14	\
+_savegpr##n##_14:		\
+	std	r14,-144(base)	\
+.globl	_savegpr##n##_15	\
+_savegpr##n##_15:		\
+	std	r15,-136(base)	\
+.globl	_savegpr##n##_16	\
+_savegpr##n##_16:		\
+	std	r16,-128(base)	\
+.globl	_savegpr##n##_17	\
+_savegpr##n##_17:		\
+	std	r17,-120(base)	\
+.globl	_savegpr##n##_18	\
+_savegpr##n##_18:		\
+	std	r18,-112(base)	\
+.globl	_savegpr##n##_19	\
+_savegpr##n##_19:		\
+	std	r19,-104(base)	\
+.globl	_savegpr##n##_20	\
+_savegpr##n##_20:		\
+	std	r20,-96(base)	\
+.globl	_savegpr##n##_21	\
+_savegpr##n##_21:		\
+	std	r21,-88(base)	\
+.globl	_savegpr##n##_22	\
+_savegpr##n##_22:		\
+	std	r22,-80(base)	\
+.globl	_savegpr##n##_23	\
+_savegpr##n##_23:		\
+	std	r23,-72(base)	\
+.globl	_savegpr##n##_24	\
+_savegpr##n##_24:		\
+	std	r24,-64(base)	\
+.globl	_savegpr##n##_25	\
+_savegpr##n##_25:		\
+	std	r25,-56(base)	\
+.globl	_savegpr##n##_26	\
+_savegpr##n##_26:		\
+	std	r26,-48(base)	\
+.globl	_savegpr##n##_27	\
+_savegpr##n##_27:		\
+	std	r27,-40(base)	\
+.globl	_savegpr##n##_28	\
+_savegpr##n##_28:		\
+	std	r28,-32(base)	\
+.globl	_savegpr##n##_29	\
+_savegpr##n##_29:		\
+	std	r29,-24(base)	\
+.globl	_savegpr##n##_30	\
+_savegpr##n##_30:		\
+	std	r30,-16(base)	\
+.globl	_savegpr##n##_31	\
+_savegpr##n##_31:		\
+	std	r31,-8(base)	\
+	std	r0,16(base)	\
 	blr
 
-.globl	_restgpr0_14
-_restgpr0_14:
-	ld	r14,-144(r1)
-.globl	_restgpr0_15
-_restgpr0_15:
-	ld	r15,-136(r1)
-.globl	_restgpr0_16
-_restgpr0_16:
-	ld	r16,-128(r1)
-.globl	_restgpr0_17
-_restgpr0_17:
-	ld	r17,-120(r1)
-.globl	_restgpr0_18
-_restgpr0_18:
-	ld	r18,-112(r1)
-.globl	_restgpr0_19
-_restgpr0_19:
-	ld	r19,-104(r1)
-.globl	_restgpr0_20
-_restgpr0_20:
-	ld	r20,-96(r1)
-.globl	_restgpr0_21
-_restgpr0_21:
-	ld	r21,-88(r1)
-.globl	_restgpr0_22
-_restgpr0_22:
-	ld	r22,-80(r1)
-.globl	_restgpr0_23
-_restgpr0_23:
-	ld	r23,-72(r1)
-.globl	_restgpr0_24
-_restgpr0_24:
-	ld	r24,-64(r1)
-.globl	_restgpr0_25
-_restgpr0_25:
-	ld	r25,-56(r1)
-.globl	_restgpr0_26
-_restgpr0_26:
-	ld	r26,-48(r1)
-.globl	_restgpr0_27
-_restgpr0_27:
-	ld	r27,-40(r1)
-.globl	_restgpr0_28
-_restgpr0_28:
-	ld	r28,-32(r1)
-.globl	_restgpr0_29
-_restgpr0_29:
-	ld	r0,16(r1)
-	ld	r29,-24(r1)
-	mtlr	r0
-	ld	r30,-16(r1)
-	ld	r31,-8(r1)
+#define __PPC64_RESTGPR(n,base)	\
+.globl	_restgpr##n##_14	\
+_restgpr##n##_14:		\
+	ld	r14,-144(base)	\
+.globl	_restgpr##n##_15	\
+_restgpr##n##_15:		\
+	ld	r15,-136(base)	\
+.globl	_restgpr##n##_16	\
+_restgpr##n##_16:		\
+	ld	r16,-128(base)	\
+.globl	_restgpr##n##_17	\
+_restgpr##n##_17:		\
+	ld	r17,-120(base)	\
+.globl	_restgpr##n##_18	\
+_restgpr##n##_18:		\
+	ld	r18,-112(base)	\
+.globl	_restgpr##n##_19	\
+_restgpr##n##_19:		\
+	ld	r19,-104(base)	\
+.globl	_restgpr##n##_20	\
+_restgpr##n##_20:		\
+	ld	r20,-96(base)	\
+.globl	_restgpr##n##_21	\
+_restgpr##n##_21:		\
+	ld	r21,-88(base)	\
+.globl	_restgpr##n##_22	\
+_restgpr##n##_22:		\
+	ld	r22,-80(base)	\
+.globl	_restgpr##n##_23	\
+_restgpr##n##_23:		\
+	ld	r23,-72(base)	\
+.globl	_restgpr##n##_24	\
+_restgpr##n##_24:		\
+	ld	r24,-64(base)	\
+.globl	_restgpr##n##_25	\
+_restgpr##n##_25:		\
+	ld	r25,-56(base)	\
+.globl	_restgpr##n##_26	\
+_restgpr##n##_26:		\
+	ld	r26,-48(base)	\
+.globl	_restgpr##n##_27	\
+_restgpr##n##_27:		\
+	ld	r27,-40(base)	\
+.globl	_restgpr##n##_28	\
+_restgpr##n##_28:		\
+	ld	r28,-32(base)	\
+.globl	_restgpr##n##_29	\
+_restgpr##n##_29:		\
+	ld	r0,16(base)	\
+	ld	r29,-24(base)	\
+	mtlr	r0		\
+	ld	r30,-16(base)	\
+	ld	r31,-8(base)	\
+	blr			\
+				\
+.globl	_restgpr##n##_30	\
+_restgpr##n##_30:		\
+	ld	r30,-16(base)	\
+.globl	_restgpr##n##_31	\
+_restgpr##n##_31:		\
+	ld	r0,16(base)	\
+	ld	r31,-8(base)	\
+	mtlr	r0		\
 	blr
 
-.globl	_restgpr0_30
-_restgpr0_30:
-	ld	r30,-16(r1)
-.globl	_restgpr0_31
-_restgpr0_31:
-	ld	r0,16(r1)
-	ld	r31,-8(r1)
-	mtlr	r0
-	blr
+__PPC64_RESTGPR(0, r1)
+__PPC64_RESTGPR(1, r12)
+
+__PPC64_SAVEGPR(0, r1)
+__PPC64_SAVEGPR(1, r12)
 
 #ifdef CONFIG_ALTIVEC
 /* Called with r0 pointing just beyond the end of the vector save area.  */
@@ -540,6 +549,128 @@ _restvr_31:
 
 #endif /* CONFIG_ALTIVEC */
 
+#ifdef CONFIG_PPC_FPU
+
+.globl	_savefpr_14
+_savefpr_14:
+	stfd f14,-144(r1)
+.globl	_savefpr_15
+_savefpr_15:
+	stfd f15,-136(r1)
+.globl	_savefpr_16
+_savefpr_16:
+	stfd f16,-128(r1)
+.globl	_savefpr_17
+_savefpr_17:
+	stfd f17,-120(r1)
+.globl	_savefpr_18
+_savefpr_18:
+	stfd f18,-112(r1)
+.globl	_savefpr_19
+_savefpr_19:
+	stfd f19,-104(r1)
+.globl	_savefpr_20
+_savefpr_20:
+	stfd f20,-96(r1)
+.globl	_savefpr_21
+_savefpr_21:
+	stfd f21,-88(r1)
+.globl	_savefpr_22
+_savefpr_22:
+	stfd f22,-80(r1)
+.globl	_savefpr_23
+_savefpr_23:
+	stfd f23,-72(r1)
+.globl	_savefpr_24
+_savefpr_24:
+	stfd f24,-64(r1)
+.globl	_savefpr_25
+_savefpr_25:
+	stfd f25,-56(r1)
+.globl	_savefpr_26
+_savefpr_26:
+	stfd f26,-48(r1)
+.globl	_savefpr_27
+_savefpr_27:
+	stfd f27,-40(r1)
+.globl	_savefpr_28
+_savefpr_28:
+	stfd f28,-32(r1)
+.globl	_savefpr_29
+_savefpr_29:
+	stfd f29,-24(r1)
+.globl	_savefpr_30
+_savefpr_30:
+	stfd f30,-16(r1)
+.globl	_savefpr_31
+_savefpr_31:
+	stfd f31,-8(r1)
+	std r0, 16(r1)
+	blr
+
+.globl	_restfpr_14
+_restfpr_14:
+	lfd f14,-144(r1)
+.globl	_restfpr_15
+_restfpr_15:
+	lfd f15,-136(r1)
+.globl	_restfpr_16
+_restfpr_16:
+	lfd f16,-128(r1)
+.globl	_restfpr_17
+_restfpr_17:
+	lfd f17,-120(r1)
+.globl	_restfpr_18
+_restfpr_18:
+	lfd f18,-112(r1)
+.globl	_restfpr_19
+_restfpr_19:
+	lfd f19,-104(r1)
+.globl	_restfpr_20
+_restfpr_20:
+	lfd f20,-96(r1)
+.globl	_restfpr_21
+_restfpr_21:
+	lfd f21,-88(r1)
+.globl	_restfpr_22
+_restfpr_22:
+	lfd f22,-80(r1)
+.globl	_restfpr_23
+_restfpr_23:
+	lfd f23,-72(r1)
+.globl	_restfpr_24
+_restfpr_24:
+	lfd f24,-64(r1)
+.globl	_restfpr_25
+_restfpr_25:
+	lfd f25,-56(r1)
+.globl	_restfpr_26
+_restfpr_26:
+	lfd f26,-48(r1)
+.globl	_restfpr_27
+_restfpr_27:
+	lfd f27,-40(r1)
+.globl	_restfpr_28
+_restfpr_28:
+	lfd f28,-32(r1)
+.globl	_restfpr_29
+_restfpr_29:
+	ld r0, 16(r1)
+	lfd f29,-24(r1)
+	mtlr r0
+	lfd f30,-16(r1)
+	lfd f31,-8(r1)
+	blr
+.globl	_restfpr_30
+_restfpr_30:
+	lfd f30,-16(r1)
+.globl	_restfpr_31
+_restfpr_31:
+	ld r0, 16(r1)
+	lfd f31,-8(r1)
+
+#endif /* CONFIG_PPC_FPU */
+
 #endif /* CONFIG_PPC64 */
 
 #endif
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 267b9a0a3abc..153a163ba3f7 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -597,8 +597,12 @@ static int ignore_undef_symbol(struct elf_info *info, const char *symname)
 		/* Special register function linked on all modules during final link of .ko */
 		if (strstarts(symname, "_restgpr0_") ||
 		    strstarts(symname, "_savegpr0_") ||
+		    strstarts(symname, "_restgpr1_") ||
+		    strstarts(symname, "_savegpr1_") ||
 		    strstarts(symname, "_restvr_") ||
 		    strstarts(symname, "_savevr_") ||
+		    strstarts(symname, "_restfpr_") ||
+		    strstarts(symname, "_savefpr_") ||
 		    strcmp(symname, ".TOC.") == 0)
 			return 1;
 
-- 
2.39.2
