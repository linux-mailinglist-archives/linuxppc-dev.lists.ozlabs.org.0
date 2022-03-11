Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0404D5858
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 03:48:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KF9NP24wZz3bPJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 13:48:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=q6NEt/Ux;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=q6NEt/Ux; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KF9Mj2b8fz2yV7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 13:47:43 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id n18so3890312plg.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 18:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cI4QCEltGleU+0fr29xZZaJlNKYacQmMc9sWn0o8j8c=;
 b=q6NEt/UxAOhpIWNCiz8OqE6bJ3H8T+r2so3r4doQ5+0hv07k27jPmKmCjwis+6bxVi
 6O4dZ9d+ZjTSU+NtCnhheOCa0IqYX0z+Qv95l2UcHQ+DZ4tLB+HxJxU/9FyXaGRbx+JM
 b7tjMFdC1aTejFmFYv/xjs3nFndWtIWFTAfET+Kmgdt82lrADBZnDuthaWTVKxZ9nOCw
 hkonknGpMn6ycXRhkKAYq2kB6xg3Ji94KAfJvsxxCOeIzFKLTUYNf0bsZTmuw8G7Bglt
 kiYiQNEb35ZKF2zkffLNDwVQccW9U77ShIlX+v63AxWGht3neJzCbB3nhY5M7+ShiZ5k
 FUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cI4QCEltGleU+0fr29xZZaJlNKYacQmMc9sWn0o8j8c=;
 b=wszKHS2ELMLr+MJc/G0rw+yNZNC07+NN9mPlvYJ20BSdd0e1GcprGAwi+sdppF/09i
 wH2e+NWbnQcHXPFT0D1QdZlET3hdG1ikVOMOQH3t5/NelksDcv53hKj2N7EiJfBSRlch
 rf2KB/+KgksSD5TbPrCNMJA63RtT6ff3gmddP8jy8wewAu6eApGd5tgvdyRjtqNHuUx+
 lEY27V0R7omzlyBLZc0ZhbV2vYZEzBBRq+yXnwEMZIP6xgEkGUU4Sr8pAPNskOW2nXvU
 C0KMx4CbY/y/MoPGNgOSlWaKj8l/8vwBbjDfi8HmUdWDy6snXhl75h6N1R8vRdJswkMU
 jYOQ==
X-Gm-Message-State: AOAM533nlOojpGgzinL6Ak5vAK/VNbDJ9cNQHYh88jFe5NG2Oe2gDVA0
 62kQZa9mc5oG8NFU/zO7Odj45k+Jmag=
X-Google-Smtp-Source: ABdhPJwS/2yFpRHm4RmXyRXohI+5iZLfKYQZjFP9dQRAJmwYw2r+TpEjJi+UCeEt04jsVCHw0sTJeA==
X-Received: by 2002:a17:90b:1bc5:b0:1bf:1c96:66ac with SMTP id
 oa5-20020a17090b1bc500b001bf1c9666acmr19066231pjb.167.1646966860203; 
 Thu, 10 Mar 2022 18:47:40 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (110-175-148-108.static.tpgi.com.au.
 [110.175.148.108]) by smtp.gmail.com with ESMTPSA id
 ob13-20020a17090b390d00b001becfd7c6f3sm7531788pjb.27.2022.03.10.18.47.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 18:47:39 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/tm: Fix more userspace r13 corruption
Date: Fri, 11 Mar 2022 12:47:33 +1000
Message-Id: <20220311024733.48926-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
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
Cc: Michael Neuling <mikey@neuling.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit cf13435b730a ("powerpc/tm: Fix userspace r13 corruption") fixes
a problem in treclaim where a SLB miss can occur on the
thread_struct->ckpt_regs while SCRATCH0 is live with the saved user r13
value, clobbering it with the kernel r13 and ultimately resulting in
kernel r13 being stored in ckpt_regs.

There is an equivalent problem in trechkpt where the user r13 value is
loaded into r13 from chkpt_regs to be recheckpointed, but a SLB miss
could occur on ckpt_regs accesses after that, which will result in r13
being clobbered with a kernel value and that will get recheckpointed and
then restored to user registers.

The same memory page is accessed right before this critical window where
a SLB miss could cause corruption, so hitting the bug requires the SLB
entry be removed within a small window of instructions, which is possible
if a SLB related MCE hits there. PAPR also permits the hypervisor to
discard this SLB entry (because slb_shadow->persistent is only set to
SLB_NUM_BOLTED) although it's not known whether any implementations would
do this (KVM does not). So this is an extremely unlikely bug, only found
by inspection.

Fix this by also storing user r13 in a temporary location on the kernel
stack and don't chane the r13 register from kernel r13 until the RI=0
critical section that does not fault.

[ The SCRATCH0 change is not strictly part of the fix, it's only used in
  the RI=0 section so it does not have the same problem as the previous
  SCRATCH0 bug. ]

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/tm.S | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/tm.S b/arch/powerpc/kernel/tm.S
index 3beecc32940b..5a0f023a26e9 100644
--- a/arch/powerpc/kernel/tm.S
+++ b/arch/powerpc/kernel/tm.S
@@ -443,7 +443,8 @@ restore_gprs:
 
 	REST_GPR(0, r7)				/* GPR0 */
 	REST_GPRS(2, 4, r7)			/* GPR2-4 */
-	REST_GPRS(8, 31, r7)			/* GPR8-31 */
+	REST_GPRS(8, 12, r7)			/* GPR8-12 */
+	REST_GPRS(14, 31, r7)			/* GPR14-31 */
 
 	/* Load up PPR and DSCR here so we don't run with user values for long */
 	mtspr	SPRN_DSCR, r5
@@ -479,18 +480,24 @@ restore_gprs:
 	REST_GPR(6, r7)
 
 	/*
-	 * Store r1 and r5 on the stack so that we can access them after we
-	 * clear MSR RI.
+	 * Store user r1 and r5 and r13 on the stack (in the unused save
+	 * areas / compiler reserved areas), so that we can access them after
+	 * we clear MSR RI.
 	 */
 
 	REST_GPR(5, r7)
 	std	r5, -8(r1)
-	ld	r5, GPR1(r7)
+	ld	r5, GPR13(r7)
 	std	r5, -16(r1)
+	ld	r5, GPR1(r7)
+	std	r5, -24(r1)
 
 	REST_GPR(7, r7)
 
-	/* Clear MSR RI since we are about to use SCRATCH0. EE is already off */
+	/* Stash the stack pointer away for use after recheckpoint */
+	std	r1, PACAR1(r13)
+
+	/* Clear MSR RI since we are about to clobber r13. EE is already off */
 	li	r5, 0
 	mtmsrd	r5, 1
 
@@ -501,9 +508,9 @@ restore_gprs:
 	 * until we turn MSR RI back on.
 	 */
 
-	SET_SCRATCH0(r1)
 	ld	r5, -8(r1)
-	ld	r1, -16(r1)
+	ld	r13, -16(r1)
+	ld	r1, -24(r1)
 
 	/* Commit register state as checkpointed state: */
 	TRECHKPT
@@ -519,9 +526,9 @@ restore_gprs:
 	 */
 
 	GET_PACA(r13)
-	GET_SCRATCH0(r1)
+	ld	r1, PACAR1(r13)
 
-	/* R1 is restored, so we are recoverable again.  EE is still off */
+	/* R13, R1 is restored, so we are recoverable again.  EE is still off */
 	li	r4, MSR_RI
 	mtmsrd	r4, 1
 
-- 
2.23.0

