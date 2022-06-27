Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F76C55BA4A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 16:09:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWqNF31b7z3fSx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 00:09:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=b4ycqZur;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWqF15Cmpz3bv4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 00:03:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=b4ycqZur;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LWqF14cr2z4xZG;
	Tue, 28 Jun 2022 00:03:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656338581;
	bh=gq3Tip8YfJTXg9Q6S2qpUCZRKRrtXtRSMLWkjfvWVpA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=b4ycqZurkIecsiu7lmlNaWtylXAP0nSF57X6mmsqv4DAZY2BS+b5pTW2Nhex9W7vX
	 VCad528VRFbu/P+SFOf2ugIItq06787HZJG53cEkqtot1xZq0Gt/ruGHXXnDqy+7iA
	 K9QA4wSvrr5ygu9fjNcQ/s8O8+UkNUTtZWk64zcNSjMU7VvsXN/NhVzgwxCX2J7AIh
	 wxGX/oQVLOj1pWx7iOWnPHuP2McmxXSyWa4LM95OQBNKZfR9Lkx4hYSrg1FYmV/L4O
	 lYFNbKDM4h6DxdNVfKZtbV3qZEroj07JvvAfyL6TcnlHugmaJgp9rH6NERTlbYGr0z
	 HVqOBhX4dpXUA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 12/13] selftests/powerpc/ptrace: Use more interesting values
Date: Tue, 28 Jun 2022 00:02:38 +1000
Message-Id: <20220627140239.2464900-12-mpe@ellerman.id.au>
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

The ptrace-gpr test uses fixed values to test that registers can be
read/written via ptrace. In particular it sets all GPRs to 1, which
means the test could miss some types of bugs - eg. if the kernel was
only returning the low word.

So generate some random values at startup and use those instead.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../selftests/powerpc/ptrace/ptrace-gpr.c     | 71 +++++++++++++++----
 1 file changed, 57 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c b/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c
index b574ea26395c..c5dcb8c02616 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c
@@ -7,18 +7,18 @@
 #include "ptrace.h"
 #include "ptrace-gpr.h"
 #include "reg.h"
+#include <time.h>
 
 /* Tracer and Tracee Shared Data */
 int shm_id;
 int *cptr, *pptr;
 
-double a = FPR_1;
-double b = FPR_2;
-double c = FPR_3;
-
 extern void gpr_child_loop(int *read_flag, int *write_flag,
 			   unsigned long *gpr_buf, double *fpr_buf);
 
+unsigned long child_gpr_val, parent_gpr_val;
+double child_fpr_val, parent_fpr_val;
+
 static int child(void)
 {
 	unsigned long gpr_buf[32];
@@ -30,16 +30,16 @@ static int child(void)
 	memset(fpr_buf, 0, sizeof(fpr_buf));
 
 	for (i = 0; i < 32; i++) {
-		gpr_buf[i] = GPR_1;
-		fpr_buf[i] = a;
+		gpr_buf[i] = child_gpr_val;
+		fpr_buf[i] = child_fpr_val;
 	}
 
 	gpr_child_loop(&cptr[0], &cptr[1], gpr_buf, fpr_buf);
 
 	shmdt((void *)cptr);
 
-	FAIL_IF(validate_gpr(gpr_buf, GPR_3));
-	FAIL_IF(validate_fpr_double(fpr_buf, c));
+	FAIL_IF(validate_gpr(gpr_buf, parent_gpr_val));
+	FAIL_IF(validate_fpr_double(fpr_buf, parent_fpr_val));
 
 	return 0;
 }
@@ -47,24 +47,67 @@ static int child(void)
 int trace_gpr(pid_t child)
 {
 	unsigned long gpr[18];
-	__u64 fpr[32];
+	__u64 tmp, fpr[32];
 
 	FAIL_IF(start_trace(child));
 	FAIL_IF(show_gpr(child, gpr));
-	FAIL_IF(validate_gpr(gpr, GPR_1));
+	FAIL_IF(validate_gpr(gpr, child_gpr_val));
 	FAIL_IF(show_fpr(child, fpr));
-	FAIL_IF(validate_fpr(fpr, FPR_1_REP));
-	FAIL_IF(write_gpr(child, GPR_3));
-	FAIL_IF(write_fpr(child, FPR_3_REP));
+
+	memcpy(&tmp, &child_fpr_val, sizeof(tmp));
+	FAIL_IF(validate_fpr(fpr, tmp));
+
+	FAIL_IF(write_gpr(child, parent_gpr_val));
+
+	memcpy(&tmp, &parent_fpr_val, sizeof(tmp));
+	FAIL_IF(write_fpr(child, tmp));
+
 	FAIL_IF(stop_trace(child));
 
 	return TEST_PASS;
 }
 
+#ifndef __LONG_WIDTH__
+#define __LONG_WIDTH__ (sizeof(long) * 8)
+#endif
+
+static uint64_t rand_reg(void)
+{
+	uint64_t result;
+	long r;
+
+	r = random();
+
+	// Small values are typical
+	result = r & 0xffff;
+	if (r & 0x10000)
+		return result;
+
+	// Pointers tend to have high bits set
+	result |= random() << (__LONG_WIDTH__ - 31);
+	if (r & 0x100000)
+		return result;
+
+	// And sometimes we want a full 64-bit value
+	result ^= random() << 16;
+
+	return result;
+}
+
 int ptrace_gpr(void)
 {
-	pid_t pid;
+	unsigned long seed;
 	int ret, status;
+	pid_t pid;
+
+	seed = getpid() ^ time(NULL);
+	printf("srand(%lu)\n", seed);
+	srand(seed);
+
+	child_gpr_val = rand_reg();
+	child_fpr_val = rand_reg();
+	parent_gpr_val = rand_reg();
+	parent_fpr_val = rand_reg();
 
 	shm_id = shmget(IPC_PRIVATE, sizeof(int) * 2, 0777|IPC_CREAT);
 	pid = fork();
-- 
2.35.3

