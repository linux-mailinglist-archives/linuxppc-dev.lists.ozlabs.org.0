Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DAE7061B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 09:50:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLlf85PYMz3f97
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 17:50:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UUMKFCeF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLldH33fSz30Jy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 17:50:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UUMKFCeF;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QLldC4QDWz4x3l;
	Wed, 17 May 2023 17:50:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1684309809;
	bh=hLAH2JnqdxjxAHaSLV3xs4Xv8cUK44LBiWt9+yPqLws=;
	h=From:To:Cc:Subject:Date:From;
	b=UUMKFCeFEbyn3AwzUDAOJDY6KWkRKIdbgHz+Ta3f8n8RaFYVLfZ2XEZW/gxx1fVmC
	 uhHrVT1XE7EDmyyZYMHp37mAHuLhMxKi3Nr1apQFGjOPgKjvQ7TNd+QtsPPLEQcGXq
	 BWp2AkLDXWKtPiiEMzVseib1DwCM9gZXLGeeluArG6aTtjAGJfPz/tcMNzHFUuRF+8
	 Xd7bFGdcpe3VxulBj62l5b1e9XaUdOtEi6fQrrP9jIOHRGGIHJvECPdqHS8RjCo0TL
	 b+/Gh8cCrDfQcod6vRs0hqZiI0X87K+KVbvyoJtGxzY8rU8rJ3abRxwdJgaoFXvx3O
	 5LFXDodxy1tDg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/security: Fix Speculation_Store_Bypass reporting on Power10
Date: Wed, 17 May 2023 17:49:45 +1000
Message-Id: <20230517074945.53188-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.40.1
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
Cc: rnsastry@linux.ibm.com, ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nageswara reported that /proc/self/status was showing "vulnerable" for
the Speculation_Store_Bypass feature on Power10, eg:

  $ grep Speculation_Store_Bypass: /proc/self/status
  Speculation_Store_Bypass:       vulnerable

But at the same time the sysfs files, and lscpu, were showing "Not
affected".

This turns out to simply be a bug in the reporting of the
Speculation_Store_Bypass, aka. PR_SPEC_STORE_BYPASS, case.

When SEC_FTR_STF_BARRIER was added, so that firmware could communicate
the vulnerability was not present, the code in ssb_prctl_get() was not
updated to check the new flag.

So add the check for SEC_FTR_STF_BARRIER being disabled. Rather than
adding the new check to the existing if block and expanding the comment
to cover both cases, rewrite the three cases to be separate so they can
be commented separately for clarity.

Fixes: 84ed26fd00c5 ("powerpc/security: Add a security feature for STF barrier")
Cc: stable@vger.kernel.org # v5.14+
Reported-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/security.c | 37 +++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index 206475e3e0b4..4856e1a5161c 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -364,26 +364,27 @@ ssize_t cpu_show_spec_store_bypass(struct device *dev, struct device_attribute *
 
 static int ssb_prctl_get(struct task_struct *task)
 {
+	/*
+	 * The STF_BARRIER feature is on by default, so if it's off that means
+	 * firmware has explicitly said the CPU is not vulnerable via either
+	 * the hypercall or device tree.
+	 */
+	if (!security_ftr_enabled(SEC_FTR_STF_BARRIER))
+		return PR_SPEC_NOT_AFFECTED;
+
+	/*
+	 * If the system's CPU has no known barrier (see setup_stf_barrier())
+	 * then assume that the CPU is not vulnerable.
+	 */
 	if (stf_enabled_flush_types == STF_BARRIER_NONE)
-		/*
-		 * We don't have an explicit signal from firmware that we're
-		 * vulnerable or not, we only have certain CPU revisions that
-		 * are known to be vulnerable.
-		 *
-		 * We assume that if we're on another CPU, where the barrier is
-		 * NONE, then we are not vulnerable.
-		 */
 		return PR_SPEC_NOT_AFFECTED;
-	else
-		/*
-		 * If we do have a barrier type then we are vulnerable. The
-		 * barrier is not a global or per-process mitigation, so the
-		 * only value we can report here is PR_SPEC_ENABLE, which
-		 * appears as "vulnerable" in /proc.
-		 */
-		return PR_SPEC_ENABLE;
-
-	return -EINVAL;
+
+	/*
+	 * Otherwise the CPU is vulnerable. The barrier is not a global or
+	 * per-process mitigation, so the only value that can be reported here
+	 * is PR_SPEC_ENABLE, which appears as "vulnerable" in /proc.
+	 */
+	return PR_SPEC_ENABLE;
 }
 
 int arch_prctl_spec_ctrl_get(struct task_struct *task, unsigned long which)
-- 
2.40.1

