Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B61B37FE984
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 08:10:29 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o7IdEVkb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgnQW19V4z3cVk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 18:10:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o7IdEVkb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgnPg6vL0z3bwJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 18:09:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D800261DA1;
	Thu, 30 Nov 2023 07:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 119D7C433C7;
	Thu, 30 Nov 2023 07:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701328178;
	bh=CXqClLIV3QnHOJtilJIT3Di9WZofqhTEHRzpRu9IQaw=;
	h=From:To:Cc:Subject:Date:From;
	b=o7IdEVkb8m1NjsXFkN6Bi5JqxhkY8jrdXwIGfXGvyXfiR4GLiPojaPW2dc30kdO26
	 j/x0px5O1tWUr37BSBzqp/aAinYEh/yUFmuHcpv1wZ+uFZxoYSw2oqIeqI8CRInRv9
	 Ainzh+dtxvjECtgdJatZv87V0elmzLDcgjepkn2q0lXehwaioyFORvcyf7oadM2Bkm
	 zhFMyyTCVlgslAWMPRMjaw8ICRdJf54jsxcz9zDOGlPNKu/cncYMi3OJ57j0oG4tNG
	 ADmEkaJCAYmz5CKKROONSDvotISP8BKjSiipJpYnzCo1q9Y3ibnnJ2NNGvljS5kb1U
	 0t/VKLOuN5iRA==
From: Naveen N Rao <naveen@kernel.org>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/ftrace: Fix stack teardown in ftrace_no_trace
Date: Thu, 30 Nov 2023 12:29:47 +0530
Message-ID: <20231130065947.2188860-1-naveen@kernel.org>
X-Mailer: git-send-email 2.43.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 41a506ef71eb ("powerpc/ftrace: Create a dummy stackframe to fix
stack unwind") added use of a new stack frame on ftrace entry to fix
stack unwind. However, the commit missed updating the offset used while
tearing down the ftrace stack when ftrace is disabled. Fix the same.

In addition, the commit missed saving the correct stack pointer in
pt_regs. Update the same.

Fixes: 41a506ef71eb ("powerpc/ftrace: Create a dummy stackframe to fix stack unwind")
Cc: stable@vger.kernel.org
Signed-off-by: Naveen N Rao <naveen@kernel.org>
---
 arch/powerpc/kernel/trace/ftrace_entry.S | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/trace/ftrace_entry.S b/arch/powerpc/kernel/trace/ftrace_entry.S
index 90701885762c..40677416d7b2 100644
--- a/arch/powerpc/kernel/trace/ftrace_entry.S
+++ b/arch/powerpc/kernel/trace/ftrace_entry.S
@@ -62,7 +62,7 @@
 	.endif
 
 	/* Save previous stack pointer (r1) */
-	addi	r8, r1, SWITCH_FRAME_SIZE
+	addi	r8, r1, SWITCH_FRAME_SIZE+STACK_FRAME_MIN_SIZE
 	PPC_STL	r8, GPR1(r1)
 
 	.if \allregs == 1
@@ -182,7 +182,7 @@ ftrace_no_trace:
 	mflr	r3
 	mtctr	r3
 	REST_GPR(3, r1)
-	addi	r1, r1, SWITCH_FRAME_SIZE
+	addi	r1, r1, SWITCH_FRAME_SIZE+STACK_FRAME_MIN_SIZE
 	mtlr	r0
 	bctr
 #endif

base-commit: 9a15ae60f2c9707433b01e55815cd9142be102b2
-- 
2.43.0

