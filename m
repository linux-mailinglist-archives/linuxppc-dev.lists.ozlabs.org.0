Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9162581A5C4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Dec 2023 17:57:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oVnSqvb1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SwKVr0v3Fz3cYq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Dec 2023 03:57:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oVnSqvb1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SwKV03kPBz3bPM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Dec 2023 03:56:56 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BKGmMGk016425;
	Wed, 20 Dec 2023 16:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=mcznnzxzLUwi3gyWSPkKnz9qk0WNvqVNrCRGu+qa4O4=;
 b=oVnSqvb1v7P+xQzVGzMlZrt9HvbbP4PqXtqjR6ARSxdM6UjiufN10GCT7AXquKoe+bAq
 9yNOav6kQBl6y62w2iR2OOjKFsBtLXZi1R8F66efW92r3vpp5V14d56vOsuGiknupBwX
 bX5UoC4y9Zl7xI+fTjhPS2VWfBkLzZVnckjBNCoskh7dp7EPTYUGamgOyyKtD0Jr+cz5
 TPE0hvveK5BWcdqHo3ywJ0CXUgFpRjmTDlGwxZQWItnmC5+zWnZQUg53mmc3QoosVoXa
 w2ADGUE05EYbMM3BDMq+ib0yuWPVwHXLyp97CJ8gJwyLWmEouoGQHetPo+xlGXY2KRul 6A== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3v443yg8a1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Dec 2023 16:56:28 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BKF04d9013893;
	Wed, 20 Dec 2023 16:56:28 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3v1qqkfhy4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Dec 2023 16:56:28 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BKGuQSG15991536
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 20 Dec 2023 16:56:26 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04ACC20049;
	Wed, 20 Dec 2023 16:56:26 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 633DF20040;
	Wed, 20 Dec 2023 16:56:23 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.ibm.com.com (unknown [9.43.81.245])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 20 Dec 2023 16:56:23 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: bpf@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/2] powerpc/bpf: ensure module addresses are supported
Date: Wed, 20 Dec 2023 22:26:21 +0530
Message-ID: <20231220165622.246723-1-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GpObFSWZVqUJgaTLpW231MS2WGe2rTU5
X-Proofpoint-GUID: GpObFSWZVqUJgaTLpW231MS2WGe2rTU5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-20_10,2023-12-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1011 suspectscore=0 mlxlogscore=999 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312200120
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Martin KaFai Lau <martin.lau@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, bpf jit code on powerpc assumes all the bpf functions and
helpers to be kernel text. This is false for kfunc case, as function
addresses are mostly module addresses in that case. Ensure module
addresses are supported to enable kfunc support.

This effectively reverts commit feb6307289d8 ("powerpc64/bpf: Optimize
instruction sequence used for function calls") and commit 43d636f8b4fd
("powerpc64/bpf elfv1: Do not load TOC before calling functions") that
assumed only kernel text for bpf functions/helpers.

Also, commit b10cb163c4b3 ("powerpc64/bpf elfv2: Setup kernel TOC in
r2 on entry") that paved the way for the commits mentioned above is
reverted.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit.h        |  2 +-
 arch/powerpc/net/bpf_jit_comp32.c |  8 +--
 arch/powerpc/net/bpf_jit_comp64.c | 90 +++++++++++++++++--------------
 3 files changed, 52 insertions(+), 48 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index cdea5dccaefe..48503caa5b58 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -160,7 +160,7 @@ static inline void bpf_clear_seen_register(struct codegen_context *ctx, int i)
 }
 
 void bpf_jit_init_reg_mapping(struct codegen_context *ctx);
-int bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *ctx, u64 func);
+void bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *ctx, u64 func);
 int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct codegen_context *ctx,
 		       u32 *addrs, int pass, bool extra_pass);
 void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx);
diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index 2f39c50ca729..1236a75c04ea 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -201,7 +201,7 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
 }
 
 /* Relative offset needs to be calculated based on final image location */
-int bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *ctx, u64 func)
+void bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *ctx, u64 func)
 {
 	s32 rel = (s32)func - (s32)(fimage + ctx->idx);
 
@@ -214,8 +214,6 @@ int bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *
 		EMIT(PPC_RAW_MTCTR(_R0));
 		EMIT(PPC_RAW_BCTRL());
 	}
-
-	return 0;
 }
 
 static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
@@ -1054,9 +1052,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 				EMIT(PPC_RAW_STW(bpf_to_ppc(BPF_REG_5), _R1, 12));
 			}
 
-			ret = bpf_jit_emit_func_call_rel(image, fimage, ctx, func_addr);
-			if (ret)
-				return ret;
+			bpf_jit_emit_func_call_rel(image, fimage, ctx, func_addr);
 
 			EMIT(PPC_RAW_MR(bpf_to_ppc(BPF_REG_0) - 1, _R3));
 			EMIT(PPC_RAW_MR(bpf_to_ppc(BPF_REG_0), _R4));
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 79f23974a320..e7199c202a00 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -126,11 +126,6 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 {
 	int i;
 
-#ifndef CONFIG_PPC_KERNEL_PCREL
-	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
-		EMIT(PPC_RAW_LD(_R2, _R13, offsetof(struct paca_struct, kernel_toc)));
-#endif
-
 	/*
 	 * Initialize tail_call_cnt if we do tail calls.
 	 * Otherwise, put in NOPs so that it can be skipped when we are
@@ -145,6 +140,8 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 		EMIT(PPC_RAW_NOP());
 	}
 
+#define BPF_TAILCALL_PROLOGUE_SIZE	8
+
 	if (bpf_has_stack_frame(ctx)) {
 		/*
 		 * We need a stack frame, but we don't necessarily need to
@@ -204,14 +201,9 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
 
 static int bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx, u64 func)
 {
-	unsigned long func_addr = func ? ppc_function_entry((void *)func) : 0;
-	long reladdr;
-
-	if (WARN_ON_ONCE(!core_kernel_text(func_addr)))
-		return -EINVAL;
-
 	if (IS_ENABLED(CONFIG_PPC_KERNEL_PCREL)) {
-		reladdr = func_addr - CTX_NIA(ctx);
+		unsigned long func_addr = func ? ppc_function_entry((void *)func) : 0;
+		long reladdr = func_addr - CTX_NIA(ctx);
 
 		if (reladdr >= (long)SZ_8G || reladdr < -(long)SZ_8G) {
 			pr_err("eBPF: address of %ps out of range of pcrel address.\n",
@@ -225,31 +217,35 @@ static int bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx, u
 		EMIT(PPC_RAW_BCTR());
 
 	} else {
-		reladdr = func_addr - kernel_toc_addr();
-		if (reladdr > 0x7FFFFFFF || reladdr < -(0x80000000L)) {
-			pr_err("eBPF: address of %ps out of range of kernel_toc.\n", (void *)func);
-			return -ERANGE;
-		}
-
-		EMIT(PPC_RAW_ADDIS(_R12, _R2, PPC_HA(reladdr)));
-		EMIT(PPC_RAW_ADDI(_R12, _R12, PPC_LO(reladdr)));
-		EMIT(PPC_RAW_MTCTR(_R12));
+#ifdef PPC64_ELF_ABI_v1
+		/* func points to the function descriptor */
+		PPC_LI64(b2p[TMP_REG_2], func);
+		/* Load actual entry point from function descriptor */
+		PPC_BPF_LL(b2p[TMP_REG_1], b2p[TMP_REG_2], 0);
+		/* ... and move it to CTR */
+		EMIT(PPC_RAW_MTCTR(b2p[TMP_REG_1]));
+		/*
+		 * Load TOC from function descriptor at offset 8.
+		 * We can clobber r2 since we get called through a
+		 * function pointer (so caller will save/restore r2)
+		 * and since we don't use a TOC ourself.
+		 */
+		PPC_BPF_LL(2, b2p[TMP_REG_2], 8);
+#else
+		/* We can clobber r12 */
+		PPC_LI64(12, func);
+		EMIT(PPC_RAW_MTCTR(12));
+#endif
 		EMIT(PPC_RAW_BCTRL());
 	}
 
 	return 0;
 }
 
-int bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *ctx, u64 func)
+void bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *ctx, u64 func)
 {
 	unsigned int i, ctx_idx = ctx->idx;
 
-	if (WARN_ON_ONCE(func && is_module_text_address(func)))
-		return -EINVAL;
-
-	/* skip past descriptor if elf v1 */
-	func += FUNCTION_DESCR_SIZE;
-
 	/* Load function address into r12 */
 	PPC_LI64(_R12, func);
 
@@ -267,10 +263,20 @@ int bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *
 		for (i = ctx->idx - ctx_idx; i < 5; i++)
 			EMIT(PPC_RAW_NOP());
 
+#ifdef PPC64_ELF_ABI_v1
+	/*
+	 * Load TOC from function descriptor at offset 8.
+	 * We can clobber r2 since we get called through a
+	 * function pointer (so caller will save/restore r2)
+	 * and since we don't use a TOC ourself.
+	 */
+	PPC_BPF_LL(2, 12, 8);
+	/* Load actual entry point from function descriptor */
+	PPC_BPF_LL(12, 12, 0);
+#endif
+
 	EMIT(PPC_RAW_MTCTR(_R12));
 	EMIT(PPC_RAW_BCTRL());
-
-	return 0;
 }
 
 static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
@@ -283,10 +289,6 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	 */
 	int b2p_bpf_array = bpf_to_ppc(BPF_REG_2);
 	int b2p_index = bpf_to_ppc(BPF_REG_3);
-	int bpf_tailcall_prologue_size = 8;
-
-	if (IS_ENABLED(CONFIG_PPC64_ELF_ABI_V2))
-		bpf_tailcall_prologue_size += 4; /* skip past the toc load */
 
 	/*
 	 * if (index >= array->map.max_entries)
@@ -325,8 +327,14 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 
 	/* goto *(prog->bpf_func + prologue_size); */
 	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1), offsetof(struct bpf_prog, bpf_func)));
+#ifdef PPC64_ELF_ABI_v1
+	/* skip past the function descriptor */
 	EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1),
-			FUNCTION_DESCR_SIZE + bpf_tailcall_prologue_size));
+			FUNCTION_DESCR_SIZE + BPF_TAILCALL_PROLOGUE_SIZE));
+#else
+	EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1),
+			BPF_TAILCALL_PROLOGUE_SIZE));
+#endif
 	EMIT(PPC_RAW_MTCTR(bpf_to_ppc(TMP_REG_1)));
 
 	/* tear down stack, restore NVRs, ... */
@@ -992,13 +1000,13 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 			if (ret < 0)
 				return ret;
 
-			if (func_addr_fixed)
+			if (func_addr_fixed) {
 				ret = bpf_jit_emit_func_call_hlp(image, ctx, func_addr);
-			else
-				ret = bpf_jit_emit_func_call_rel(image, fimage, ctx, func_addr);
-
-			if (ret)
-				return ret;
+				if (ret)
+					return ret;
+			} else {
+				bpf_jit_emit_func_call_rel(image, fimage, ctx, func_addr);
+			}
 
 			/* move return value from r3 to BPF_REG_0 */
 			EMIT(PPC_RAW_MR(bpf_to_ppc(BPF_REG_0), _R3));
-- 
2.43.0

