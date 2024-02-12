Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B17F78519C0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 17:42:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=Yy1fed9s;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYVbv4lK5z3dV5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 03:42:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=Yy1fed9s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYVb76PzGz3brc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 03:41:23 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id EA46A82856E5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 10:41:19 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id g2TJafbKPqE0 for <linuxppc-dev@lists.ozlabs.org>;
	Mon, 12 Feb 2024 10:41:19 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id DFF97828593C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 10:41:18 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com DFF97828593C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1707756078; bh=jPKPZmNS7WgPXV5w6CVYL1EzDy2K/YBVMyH/YxtChvE=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Yy1fed9sobqXz9/LfieHpHBc5fZW5DvCM4VdI/donTauWdriUY0xowB5JZCB33jL/
	 z9nnMoFPpPWf4+kiv2O5IfIIuWOyLB83V6T1DveBWhsPLM0hnSB03XtKTUyTlEXkhP
	 SCpyFpofz5Ox/Gpj77Xl68qjFcM1/fLFmcIWrndQ=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id kR-YbllJRL24 for <linuxppc-dev@lists.ozlabs.org>;
	Mon, 12 Feb 2024 10:41:18 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id B77CD82856E5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Feb 2024 10:41:18 -0600 (CST)
Date: Mon, 12 Feb 2024 10:41:18 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <995988479.14839534.1707756078600.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH] powerpc: Add gpr1 and fpu save/restore functions
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC121 (Linux)/8.5.0_GA_3042)
Thread-Index: wYH6ICv8fM9bjc8orcyPyvGWWQ383w==
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

Implement gpr1 and fpu save/restore functions per the ABI v2 documentation.

Tested on a Talos II with a WX7100 installed and running in DisplayCore mode.

Reported-by: kernel test robot <lkp@intel.com>
Tested-by: Timothy Pearson <tpearson@raptorengineering.com>
Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/powerpc/kernel/prom_init_check.sh |   4 +-
 arch/powerpc/lib/crtsavres.S           | 244 +++++++++++++++++++++++++
 scripts/mod/modpost.c                  |   4 +
 3 files changed, 250 insertions(+), 2 deletions(-)

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
index 7e5e1c28e56a..6cd870aacd7f 100644
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
@@ -435,6 +436,127 @@ _restgpr0_31:
 	mtlr	r0
 	blr
 
+.globl	_savegpr1_14
+_savegpr1_14:
+	std	r14,-144(r12)
+.globl	_savegpr1_15
+_savegpr1_15:
+	std	r15,-136(r12)
+.globl	_savegpr1_16
+_savegpr1_16:
+	std	r16,-128(r12)
+.globl	_savegpr1_17
+_savegpr1_17:
+	std	r17,-120(r12)
+.globl	_savegpr1_18
+_savegpr1_18:
+	std	r18,-112(r12)
+.globl	_savegpr1_19
+_savegpr1_19:
+	std	r19,-104(r12)
+.globl	_savegpr1_20
+_savegpr1_20:
+	std	r20,-96(r12)
+.globl	_savegpr1_21
+_savegpr1_21:
+	std	r21,-88(r12)
+.globl	_savegpr1_22
+_savegpr1_22:
+	std	r22,-80(r12)
+.globl	_savegpr1_23
+_savegpr1_23:
+	std	r23,-72(r12)
+.globl	_savegpr1_24
+_savegpr1_24:
+	std	r24,-64(r12)
+.globl	_savegpr1_25
+_savegpr1_25:
+	std	r25,-56(r12)
+.globl	_savegpr1_26
+_savegpr1_26:
+	std	r26,-48(r12)
+.globl	_savegpr1_27
+_savegpr1_27:
+	std	r27,-40(r12)
+.globl	_savegpr1_28
+_savegpr1_28:
+	std	r28,-32(r12)
+.globl	_savegpr1_29
+_savegpr1_29:
+	std	r29,-24(r12)
+.globl	_savegpr1_30
+_savegpr1_30:
+	std	r30,-16(r12)
+.globl	_savegpr1_31
+_savegpr1_31:
+	std	r31,-8(r12)
+	std	r0,16(r12)
+	blr
+
+.globl	_restgpr1_14
+_restgpr1_14:
+	ld	r14,-144(r12)
+.globl	_restgpr1_15
+_restgpr1_15:
+	ld	r15,-136(r12)
+.globl	_restgpr1_16
+_restgpr1_16:
+	ld	r16,-128(r12)
+.globl	_restgpr1_17
+_restgpr1_17:
+	ld	r17,-120(r12)
+.globl	_restgpr1_18
+_restgpr1_18:
+	ld	r18,-112(r12)
+.globl	_restgpr1_19
+_restgpr1_19:
+	ld	r19,-104(r12)
+.globl	_restgpr1_20
+_restgpr1_20:
+	ld	r20,-96(r12)
+.globl	_restgpr1_21
+_restgpr1_21:
+	ld	r21,-88(r12)
+.globl	_restgpr1_22
+_restgpr1_22:
+	ld	r22,-80(r12)
+.globl	_restgpr1_23
+_restgpr1_23:
+	ld	r23,-72(r12)
+.globl	_restgpr1_24
+_restgpr1_24:
+	ld	r24,-64(r12)
+.globl	_restgpr1_25
+_restgpr1_25:
+	ld	r25,-56(r12)
+.globl	_restgpr1_26
+_restgpr1_26:
+	ld	r26,-48(r12)
+.globl	_restgpr1_27
+_restgpr1_27:
+	ld	r27,-40(r12)
+.globl	_restgpr1_28
+_restgpr1_28:
+	ld	r28,-32(r12)
+.globl	_restgpr1_29
+_restgpr1_29:
+	ld	r0,16(r12)
+	ld	r29,-24(r12)
+	mtlr	r0
+	ld	r30,-16(r12)
+	ld	r31,-8(r12)
+	blr
+
+.globl	_restgpr1_30
+_restgpr1_30:
+	ld	r30,-16(r12)
+.globl	_restgpr1_31
+_restgpr1_31:
+	ld	r0,16(r12)
+	ld	r31,-8(r12)
+	mtlr	r0
+	blr
+
 #ifdef CONFIG_ALTIVEC
 /* Called with r0 pointing just beyond the end of the vector save area.  */
 
@@ -540,6 +662,128 @@ _restvr_31:
 
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
