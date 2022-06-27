Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC46655BA44
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jun 2022 16:07:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LWqKg3vmRz3dpR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jun 2022 00:07:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=q2E+KRvm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LWqDz2Z5Yz3bbv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jun 2022 00:02:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=q2E+KRvm;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LWqDz1y7Tz4xZ7;
	Tue, 28 Jun 2022 00:02:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656338579;
	bh=Ns1y9n1pOJMgEBYkpz6JkyRijC8Yi77FAWe3CURLMuk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=q2E+KRvmjj6Wy4NpvCW1IDm9PImbSetNqEdAArDGgV0GVGy8xmf5U4L5vWfKPsrWT
	 6uflQkdTfMY78i3ELtgm6gaJmWxFGmphldivKsbxQbXVrRhFGID8Yvm7k94JRSPnJ9
	 pW6eb19GwVivsWesGj2ejDNZn/ABIHLg6wFgDW5AWAHiLmKXrsFU79fIguXFdczxQi
	 YLUMYuPltuBn/hm+lvjYC0NX/+IODz9EpkT5DKzGQdMCJGjGwfNCjTmrgoGMJ+9i8o
	 PoPluiLhX8K1UlUrkRN5l22cQTpKNfiURMTYWuOq1/MMbpDMKDo7wqjWuFzIsObnj9
	 uOxtEF0BP37xA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 08/13] selftests/powerpc/ptrace: Convert to load/store doubles
Date: Tue, 28 Jun 2022 00:02:34 +1000
Message-Id: <20220627140239.2464900-8-mpe@ellerman.id.au>
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

Some of the ptrace tests check the contents of floating pointer
registers. Currently these use float, which is always 4 bytes, but the
ptrace API supports saving/restoring 8 bytes per register, so switch to
using doubles to exercise the code more fully.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/include/reg.h | 68 +++++++++---------
 tools/testing/selftests/powerpc/lib/reg.S     | 70 +++++++++----------
 .../selftests/powerpc/ptrace/ptrace-gpr.c     | 16 ++---
 .../selftests/powerpc/ptrace/ptrace-gpr.h     | 14 ++--
 .../selftests/powerpc/ptrace/ptrace-tm-gpr.c  | 18 ++---
 .../powerpc/ptrace/ptrace-tm-spd-gpr.c        | 20 +++---
 .../testing/selftests/powerpc/ptrace/ptrace.h | 14 ++--
 7 files changed, 111 insertions(+), 109 deletions(-)

diff --git a/tools/testing/selftests/powerpc/include/reg.h b/tools/testing/selftests/powerpc/include/reg.h
index bc7f610c2c6d..7f0dc2f62496 100644
--- a/tools/testing/selftests/powerpc/include/reg.h
+++ b/tools/testing/selftests/powerpc/include/reg.h
@@ -123,44 +123,44 @@
 		"li 30, %[" #_asm_symbol_name_immed "];" \
 		"li 31, %[" #_asm_symbol_name_immed "];"
 
-#define ASM_LOAD_FPR_SINGLE_PRECISION(_asm_symbol_name_addr) \
-		"lfs 0, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 1, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 2, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 3, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 4, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 5, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 6, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 7, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 8, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 9, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 10, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 11, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 12, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 13, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 14, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 15, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 16, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 17, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 18, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 19, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 20, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 21, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 22, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 23, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 24, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 25, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 26, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 27, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 28, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 29, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 30, 0(%[" #_asm_symbol_name_addr "]);" \
-		"lfs 31, 0(%[" #_asm_symbol_name_addr "]);"
+#define ASM_LOAD_FPR(_asm_symbol_name_addr) \
+		"lfd 0, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 1, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 2, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 3, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 4, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 5, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 6, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 7, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 8, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 9, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 10, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 11, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 12, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 13, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 14, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 15, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 16, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 17, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 18, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 19, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 20, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 21, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 22, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 23, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 24, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 25, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 26, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 27, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 28, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 29, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 30, 0(%[" #_asm_symbol_name_addr "]);" \
+		"lfd 31, 0(%[" #_asm_symbol_name_addr "]);"
 
 #ifndef __ASSEMBLER__
 void store_gpr(unsigned long *addr);
 void load_gpr(unsigned long *addr);
-void store_fpr_single_precision(float *addr);
+void store_fpr(double *addr);
 #endif /* end of __ASSEMBLER__ */
 
 #endif /* _SELFTESTS_POWERPC_REG_H */
diff --git a/tools/testing/selftests/powerpc/lib/reg.S b/tools/testing/selftests/powerpc/lib/reg.S
index dd37b8e6f84c..6d1af4a9a6b4 100644
--- a/tools/testing/selftests/powerpc/lib/reg.S
+++ b/tools/testing/selftests/powerpc/lib/reg.S
@@ -53,42 +53,42 @@ FUNC_START(store_gpr)
 	blr
 FUNC_END(store_gpr)
 
-/* Single Precision Float - float buf[32] */
-FUNC_START(store_fpr_single_precision)
-	stfs 0, 0*4(3)
-	stfs 1, 1*4(3)
-	stfs 2, 2*4(3)
-	stfs 3, 3*4(3)
-	stfs 4, 4*4(3)
-	stfs 5, 5*4(3)
-	stfs 6, 6*4(3)
-	stfs 7, 7*4(3)
-	stfs 8, 8*4(3)
-	stfs 9, 9*4(3)
-	stfs 10, 10*4(3)
-	stfs 11, 11*4(3)
-	stfs 12, 12*4(3)
-	stfs 13, 13*4(3)
-	stfs 14, 14*4(3)
-	stfs 15, 15*4(3)
-	stfs 16, 16*4(3)
-	stfs 17, 17*4(3)
-	stfs 18, 18*4(3)
-	stfs 19, 19*4(3)
-	stfs 20, 20*4(3)
-	stfs 21, 21*4(3)
-	stfs 22, 22*4(3)
-	stfs 23, 23*4(3)
-	stfs 24, 24*4(3)
-	stfs 25, 25*4(3)
-	stfs 26, 26*4(3)
-	stfs 27, 27*4(3)
-	stfs 28, 28*4(3)
-	stfs 29, 29*4(3)
-	stfs 30, 30*4(3)
-	stfs 31, 31*4(3)
+/* Double Precision Float - double buf[32] */
+FUNC_START(store_fpr)
+	stfd  0,  0*8(3)
+	stfd  1,  1*8(3)
+	stfd  2,  2*8(3)
+	stfd  3,  3*8(3)
+	stfd  4,  4*8(3)
+	stfd  5,  5*8(3)
+	stfd  6,  6*8(3)
+	stfd  7,  7*8(3)
+	stfd  8,  8*8(3)
+	stfd  9,  9*8(3)
+	stfd 10, 10*8(3)
+	stfd 11, 11*8(3)
+	stfd 12, 12*8(3)
+	stfd 13, 13*8(3)
+	stfd 14, 14*8(3)
+	stfd 15, 15*8(3)
+	stfd 16, 16*8(3)
+	stfd 17, 17*8(3)
+	stfd 18, 18*8(3)
+	stfd 19, 19*8(3)
+	stfd 20, 20*8(3)
+	stfd 21, 21*8(3)
+	stfd 22, 22*8(3)
+	stfd 23, 23*8(3)
+	stfd 24, 24*8(3)
+	stfd 25, 25*8(3)
+	stfd 26, 26*8(3)
+	stfd 27, 27*8(3)
+	stfd 28, 28*8(3)
+	stfd 29, 29*8(3)
+	stfd 30, 30*8(3)
+	stfd 31, 31*8(3)
 	blr
-FUNC_END(store_fpr_single_precision)
+FUNC_END(store_fpr)
 
 /* VMX/VSX registers - unsigned long buf[128] */
 FUNC_START(loadvsx)
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c b/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c
index 17cd480c8780..1468e89c044b 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.c
@@ -12,20 +12,20 @@
 int shm_id;
 int *cptr, *pptr;
 
-float a = FPR_1;
-float b = FPR_2;
-float c = FPR_3;
+double a = FPR_1;
+double b = FPR_2;
+double c = FPR_3;
 
 void gpr(void)
 {
 	unsigned long gpr_buf[18];
-	float fpr_buf[32];
+	double fpr_buf[32];
 
 	cptr = (int *)shmat(shm_id, NULL, 0);
 
 	asm __volatile__(
 		ASM_LOAD_GPR_IMMED(gpr_1)
-		ASM_LOAD_FPR_SINGLE_PRECISION(flt_1)
+		ASM_LOAD_FPR(flt_1)
 		:
 		: [gpr_1]"i"(GPR_1), [flt_1] "b" (&a)
 		: "memory", "r6", "r7", "r8", "r9", "r10",
@@ -41,12 +41,12 @@ void gpr(void)
 
 	shmdt((void *)cptr);
 	store_gpr(gpr_buf);
-	store_fpr_single_precision(fpr_buf);
+	store_fpr(fpr_buf);
 
 	if (validate_gpr(gpr_buf, GPR_3))
 		exit(1);
 
-	if (validate_fpr_float(fpr_buf, c))
+	if (validate_fpr_double(fpr_buf, c))
 		exit(1);
 
 	exit(0);
@@ -55,7 +55,7 @@ void gpr(void)
 int trace_gpr(pid_t child)
 {
 	unsigned long gpr[18];
-	unsigned long fpr[32];
+	__u64 fpr[32];
 
 	FAIL_IF(start_trace(child));
 	FAIL_IF(show_gpr(child, gpr));
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.h b/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.h
index c5cd53181e2e..a5470b88bd08 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.h
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-gpr.h
@@ -12,10 +12,10 @@
 #define FPR_3	0.003
 #define FPR_4	0.004
 
-#define FPR_1_REP 0x3f50624de0000000
-#define FPR_2_REP 0x3f60624de0000000
-#define FPR_3_REP 0x3f689374c0000000
-#define FPR_4_REP 0x3f70624de0000000
+#define FPR_1_REP 0x3f50624dd2f1a9fcull
+#define FPR_2_REP 0x3f60624dd2f1a9fcull
+#define FPR_3_REP 0x3f689374bc6a7efaull
+#define FPR_4_REP 0x3f70624dd2f1a9fcull
 
 /* Buffer must have 18 elements */
 int validate_gpr(unsigned long *gpr, unsigned long val)
@@ -36,13 +36,13 @@ int validate_gpr(unsigned long *gpr, unsigned long val)
 }
 
 /* Buffer must have 32 elements */
-int validate_fpr(unsigned long *fpr, unsigned long val)
+int validate_fpr(__u64 *fpr, __u64 val)
 {
 	int i, found = 1;
 
 	for (i = 0; i < 32; i++) {
 		if (fpr[i] != val) {
-			printf("FPR[%d]: %lx Expected: %lx\n", i, fpr[i], val);
+			printf("FPR[%d]: %llx Expected: %llx\n", i, fpr[i], val);
 			found = 0;
 		}
 	}
@@ -53,7 +53,7 @@ int validate_fpr(unsigned long *fpr, unsigned long val)
 }
 
 /* Buffer must have 32 elements */
-int validate_fpr_float(float *fpr, float val)
+int validate_fpr_double(double *fpr, double val)
 {
 	int i, found = 1;
 
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c
index 67ca297c5cca..5dc152b162df 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-gpr.c
@@ -12,15 +12,15 @@
 int shm_id;
 unsigned long *cptr, *pptr;
 
-float a = FPR_1;
-float b = FPR_2;
-float c = FPR_3;
+double a = FPR_1;
+double b = FPR_2;
+double c = FPR_3;
 
 void tm_gpr(void)
 {
 	unsigned long gpr_buf[18];
 	unsigned long result, texasr;
-	float fpr_buf[32];
+	double fpr_buf[32];
 
 	printf("Starting the child\n");
 	cptr = (unsigned long *)shmat(shm_id, NULL, 0);
@@ -29,12 +29,12 @@ void tm_gpr(void)
 	cptr[1] = 0;
 	asm __volatile__(
 		ASM_LOAD_GPR_IMMED(gpr_1)
-		ASM_LOAD_FPR_SINGLE_PRECISION(flt_1)
+		ASM_LOAD_FPR(flt_1)
 		"1: ;"
 		"tbegin.;"
 		"beq 2f;"
 		ASM_LOAD_GPR_IMMED(gpr_2)
-		ASM_LOAD_FPR_SINGLE_PRECISION(flt_2)
+		ASM_LOAD_FPR(flt_2)
 		"tsuspend.;"
 		"li 7, 1;"
 		"stw 7, 0(%[cptr1]);"
@@ -70,12 +70,12 @@ void tm_gpr(void)
 
 		shmdt((void *)cptr);
 		store_gpr(gpr_buf);
-		store_fpr_single_precision(fpr_buf);
+		store_fpr(fpr_buf);
 
 		if (validate_gpr(gpr_buf, GPR_3))
 			exit(1);
 
-		if (validate_fpr_float(fpr_buf, c))
+		if (validate_fpr_double(fpr_buf, c))
 			exit(1);
 
 		exit(0);
@@ -87,7 +87,7 @@ void tm_gpr(void)
 int trace_tm_gpr(pid_t child)
 {
 	unsigned long gpr[18];
-	unsigned long fpr[32];
+	__u64 fpr[32];
 
 	FAIL_IF(start_trace(child));
 	FAIL_IF(show_gpr(child, gpr));
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c
index 6f2bce1b6c5d..458cc1a70ccf 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-tm-spd-gpr.c
@@ -12,10 +12,10 @@
 int shm_id;
 int *cptr, *pptr;
 
-float a = FPR_1;
-float b = FPR_2;
-float c = FPR_3;
-float d = FPR_4;
+double a = FPR_1;
+double b = FPR_2;
+double c = FPR_3;
+double d = FPR_4;
 
 __attribute__((used)) void wait_parent(void)
 {
@@ -28,7 +28,7 @@ void tm_spd_gpr(void)
 {
 	unsigned long gpr_buf[18];
 	unsigned long result, texasr;
-	float fpr_buf[32];
+	double fpr_buf[32];
 
 	cptr = (int *)shmat(shm_id, NULL, 0);
 
@@ -36,7 +36,7 @@ void tm_spd_gpr(void)
 	cptr[2] = 0;
 	asm __volatile__(
 		ASM_LOAD_GPR_IMMED(gpr_1)
-		ASM_LOAD_FPR_SINGLE_PRECISION(flt_1)
+		ASM_LOAD_FPR(flt_1)
 
 		"1: ;"
 		"tbegin.;"
@@ -45,7 +45,7 @@ void tm_spd_gpr(void)
 		ASM_LOAD_GPR_IMMED(gpr_2)
 		"tsuspend.;"
 		ASM_LOAD_GPR_IMMED(gpr_4)
-		ASM_LOAD_FPR_SINGLE_PRECISION(flt_4)
+		ASM_LOAD_FPR(flt_4)
 
 		"bl wait_parent;"
 		"tresume.;"
@@ -77,12 +77,12 @@ void tm_spd_gpr(void)
 
 		shmdt((void *)cptr);
 		store_gpr(gpr_buf);
-		store_fpr_single_precision(fpr_buf);
+		store_fpr(fpr_buf);
 
 		if (validate_gpr(gpr_buf, GPR_3))
 			exit(1);
 
-		if (validate_fpr_float(fpr_buf, c))
+		if (validate_fpr_double(fpr_buf, c))
 			exit(1);
 		exit(0);
 	}
@@ -93,7 +93,7 @@ void tm_spd_gpr(void)
 int trace_tm_spd_gpr(pid_t child)
 {
 	unsigned long gpr[18];
-	unsigned long fpr[32];
+	__u64 fpr[32];
 
 	FAIL_IF(start_trace(child));
 	FAIL_IF(show_gpr(child, gpr));
diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace.h b/tools/testing/selftests/powerpc/ptrace/ptrace.h
index 5181ad9b4b6c..4672e848604f 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace.h
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace.h
@@ -4,6 +4,9 @@
  *
  * Copyright (C) 2015 Anshuman Khandual, IBM Corporation.
  */
+
+#define __SANE_USERSPACE_TYPES__
+
 #include <inttypes.h>
 #include <unistd.h>
 #include <stdlib.h>
@@ -30,8 +33,8 @@
 #define TEST_FAIL 1
 
 struct fpr_regs {
-	unsigned long fpr[32];
-	unsigned long fpscr;
+	__u64 fpr[32];
+	__u64 fpscr;
 };
 
 struct tm_spr_regs {
@@ -318,7 +321,7 @@ int write_ckpt_tar_registers(pid_t child, unsigned long tar,
 }
 
 /* FPR */
-int show_fpr(pid_t child, unsigned long *fpr)
+int show_fpr(pid_t child, __u64 *fpr)
 {
 	struct fpr_regs *regs;
 	int ret, i;
@@ -337,7 +340,7 @@ int show_fpr(pid_t child, unsigned long *fpr)
 	return TEST_PASS;
 }
 
-int write_fpr(pid_t child, unsigned long val)
+int write_fpr(pid_t child, __u64 val)
 {
 	struct fpr_regs *regs;
 	int ret, i;
@@ -360,7 +363,7 @@ int write_fpr(pid_t child, unsigned long val)
 	return TEST_PASS;
 }
 
-int show_ckpt_fpr(pid_t child, unsigned long *fpr)
+int show_ckpt_fpr(pid_t child, __u64 *fpr)
 {
 	struct fpr_regs *regs;
 	struct iovec iov;
@@ -742,4 +745,3 @@ void analyse_texasr(unsigned long texasr)
 }
 
 void store_gpr(unsigned long *addr);
-void store_fpr(float *addr);
-- 
2.35.3

