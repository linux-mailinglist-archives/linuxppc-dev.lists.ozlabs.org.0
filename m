Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D68C455BA49
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 16:08:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWqMb62LBz3dx4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 00:08:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CbtX+I3k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWqF10pZ9z3bt0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 00:03:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CbtX+I3k;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LWqF070pcz4xZD;
	Tue, 28 Jun 2022 00:03:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656338581;
	bh=PTgzqaarCSjy+3F1qfWydY79sNVB+/jYznxxEuQMCT8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CbtX+I3ksWVcwghmgbLIoIvwGngqE5UTILI6CoV6/0LEk45c5+rEjSQkwqj5INRip
	 J9mbZTZNFTuxge12zBGtw6biY+VY7o8R84mS82wFksXM7ZQFA49C0WKMZL9nHLw59X
	 973ohwL3njoXwMg2EWlRjxAke5oh39iUoLVDrbO4mfcikesJIZlr0rdoEV9MaA7f9v
	 BovlyQexyqAU/ESjL/5CZvK+6mJc8HttEMRl8Sd9UHBS/PDidzCRWPiZOHiQYiSslO
	 ZY4HSTCd7bH5OfDGV5YQIkbFyAdeJNhBorrYd78yjsPxlrA2ognkQ38Mt6vq53IB9q
	 b5/Ju2T5RCmiQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 11/13] selftests/powerpc/ptrace: Make child errors more obvious
Date: Tue, 28 Jun 2022 00:02:37 +1000
Message-Id: <20220627140239.2464900-11-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220627140239.2464900-1-mpe@ellerman.id.au>
References: <20220627140239.2464900-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the FAIL_IF() macro so that errors in the child report a line
number, rather than just silently exiting.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c b/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c
index 4e7a7eb01e3a..b574ea26395c 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c
@@ -19,7 +19,7 @@ double c = FPR_3;
 extern void gpr_child_loop(int *read_flag, int *write_flag,
 			   unsigned long *gpr_buf, double *fpr_buf);
 
-void gpr(void)
+static int child(void)
 {
 	unsigned long gpr_buf[32];
 	double fpr_buf[32];
@@ -38,13 +38,10 @@ void gpr(void)
 
 	shmdt((void *)cptr);
 
-	if (validate_gpr(gpr_buf, GPR_3))
-		exit(1);
+	FAIL_IF(validate_gpr(gpr_buf, GPR_3));
+	FAIL_IF(validate_fpr_double(fpr_buf, c));
 
-	if (validate_fpr_double(fpr_buf, c))
-		exit(1);
-
-	exit(0);
+	return 0;
 }
 
 int trace_gpr(pid_t child)
@@ -76,7 +73,7 @@ int ptrace_gpr(void)
 		return TEST_FAIL;
 	}
 	if (pid == 0)
-		gpr();
+		exit(child());
 
 	if (pid) {
 		pptr = (int *)shmat(shm_id, NULL, 0);
-- 
2.35.3

