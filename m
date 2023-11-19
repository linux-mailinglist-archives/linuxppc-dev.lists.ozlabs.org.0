Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 071E47F071D
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Nov 2023 16:19:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=McNppLYS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYDnF6gp4z3cLv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 02:18:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=McNppLYS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYDmM0TNxz3c3H
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 02:18:10 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 65CDF828587F;
	Sun, 19 Nov 2023 09:18:07 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id QXAYfM6e-bG7; Sun, 19 Nov 2023 09:18:05 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 12160828596B;
	Sun, 19 Nov 2023 09:18:05 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 12160828596B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1700407085; bh=DfNhpWq+uQUbDfnLh5nfXGSF7RhZhtThB0PFEVqSlRc=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=McNppLYSwyrfcwZD292FYWx1J8KnIyOOi9Z978sSpSzRCn0LnlqGLocmlCdknNl9C
	 0yuC6gt3wxlbbVPB7JgsXLcFHpiLI0Xc3FXqELUzcqzLZCTMDGdtpDK+7dusDQLNZy
	 ZMXEGS45AerS8lgBN0d3q1SN/3ay8L6kBHkivYDo=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id qtnwUktYg1bG; Sun, 19 Nov 2023 09:18:04 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id D7F26828587F;
	Sun, 19 Nov 2023 09:18:04 -0600 (CST)
Date: Sun, 19 Nov 2023 09:18:02 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Jens Axboe <axboe@kernel.dk>, regressions <regressions@lists.linux.dev>, 
	Michael Ellerman <mpe@ellerman.id.au>, npiggin <npiggin@gmail.com>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <1921539696.48534988.1700407082933.JavaMail.zimbra@raptorengineeringinc.com>
Subject: [PATCH v2] powerpc: Don't clobber fr0/vs0 during fp|altivec
 register  save
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC119 (Linux)/8.5.0_GA_3042)
Thread-Index: dVySrFh2MClWXpV/Kluttxze/2CBtQ==
Thread-Topic: powerpc: Don't clobber fr0/vs0 during fp|altivec register save
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

During floating point and vector save to thread data fr0/vs0 are clobbered
by the FPSCR/VSCR store routine.  This leads to userspace register corruption
and application data corruption / crash under the following rare condition:

 * A userspace thread is executing with VSX/FP mode enabled
 * The userspace thread is making active use of fr0 and/or vs0
 * An IPI is taken in kernel mode, forcing the userspace thread to reschedule
 * The userspace thread is interrupted by the IPI before accessing data it
   previously stored in fr0/vs0
 * The thread being switched in by the IPI has a pending signal

If these exact criteria are met, then the following sequence happens:

 * The existing thread FP storage is still valid before the IPI, due to a
   prior call to save_fpu() or store_fp_state().  Note that the current
   fr0/vs0 registers have been clobbered, so the FP/VSX state in registers
   is now invalid pending a call to restore_fp()/restore_altivec().
 * IPI -- FP/VSX register state remains invalid
 * interrupt_exit_user_prepare_main() calls do_notify_resume(),
   due to the pending signal
 * do_notify_resume() eventually calls save_fpu() via giveup_fpu(), which
   merrily reads and saves the invalid FP/VSX state to thread local storage.
 * interrupt_exit_user_prepare_main() calls restore_math(), writing the invalid
   FP/VSX state back to registers.
 * Execution is released to userspace, and the application crashes or corrupts
   data.

Without the pending signal, do_notify_resume() is never called, therefore the
invalid register state does't matter as it is overwritten nearly immediately
by interrupt_exit_user_prepare_main() calling restore_math() before return
to userspace.

Restore fr0/vs0 after FPSCR/VSCR store has completed for both the fp and
altivec register save paths.

Tested under QEMU in kvm mode, running on a Talos II workstation with dual
POWER9 DD2.2 CPUs.

Closes: https://lore.kernel.org/all/480932026.45576726.1699374859845.JavaMail.zimbra@raptorengineeringinc.com/
Closes: https://lore.kernel.org/linuxppc-dev/480221078.47953493.1700206777956.JavaMail.zimbra@raptorengineeringinc.com/
Tested-by: Timothy Pearson <tpearson@raptorengineering.com>
Tested-by: Jens Axboe <axboe@kernel.dk>
Signed-off-by: Timothy Pearson <tpearson@raptorengineering.com>
---
 arch/powerpc/kernel/fpu.S    | 13 +++++++++++++
 arch/powerpc/kernel/vector.S |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/arch/powerpc/kernel/fpu.S b/arch/powerpc/kernel/fpu.S
index 6a9acfb690c9..2f8f3f93cbb6 100644
--- a/arch/powerpc/kernel/fpu.S
+++ b/arch/powerpc/kernel/fpu.S
@@ -23,6 +23,15 @@
 #include <asm/feature-fixups.h>
 
 #ifdef CONFIG_VSX
+#define __REST_1FPVSR(n,c,base)						\
+BEGIN_FTR_SECTION							\
+	b	2f;							\
+END_FTR_SECTION_IFSET(CPU_FTR_VSX);					\
+	REST_FPR(n,base);						\
+	b	3f;							\
+2:	REST_VSR(n,c,base);						\
+3:
+
 #define __REST_32FPVSRS(n,c,base)					\
 BEGIN_FTR_SECTION							\
 	b	2f;							\
@@ -41,9 +50,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_VSX);					\
 2:	SAVE_32VSRS(n,c,base);						\
 3:
 #else
+#define __REST_1FPVSR(n,b,base)		REST_FPR(n, base)
 #define __REST_32FPVSRS(n,b,base)	REST_32FPRS(n, base)
 #define __SAVE_32FPVSRS(n,b,base)	SAVE_32FPRS(n, base)
 #endif
+#define REST_1FPVSR(n,c,base)   __REST_1FPVSR(n,__REG_##c,__REG_##base)
 #define REST_32FPVSRS(n,c,base) __REST_32FPVSRS(n,__REG_##c,__REG_##base)
 #define SAVE_32FPVSRS(n,c,base) __SAVE_32FPVSRS(n,__REG_##c,__REG_##base)
 
@@ -67,6 +78,7 @@ _GLOBAL(store_fp_state)
 	SAVE_32FPVSRS(0, R4, R3)
 	mffs	fr0
 	stfd	fr0,FPSTATE_FPSCR(r3)
+	REST_1FPVSR(0, R4, R3)
 	blr
 EXPORT_SYMBOL(store_fp_state)
 
@@ -138,4 +150,5 @@ _GLOBAL(save_fpu)
 2:	SAVE_32FPVSRS(0, R4, R6)
 	mffs	fr0
 	stfd	fr0,FPSTATE_FPSCR(r6)
+	REST_1FPVSR(0, R4, R6)
 	blr
diff --git a/arch/powerpc/kernel/vector.S b/arch/powerpc/kernel/vector.S
index 4094e4c4c77a..80b3f6e476b6 100644
--- a/arch/powerpc/kernel/vector.S
+++ b/arch/powerpc/kernel/vector.S
@@ -33,6 +33,7 @@ _GLOBAL(store_vr_state)
 	mfvscr	v0
 	li	r4, VRSTATE_VSCR
 	stvx	v0, r4, r3
+	lvx	v0, 0, r3
 	blr
 EXPORT_SYMBOL(store_vr_state)
 
@@ -109,6 +110,7 @@ _GLOBAL(save_altivec)
 	mfvscr	v0
 	li	r4,VRSTATE_VSCR
 	stvx	v0,r4,r7
+	lvx	v0,0,r7
 	blr
 
 #ifdef CONFIG_VSX
-- 
2.39.2
