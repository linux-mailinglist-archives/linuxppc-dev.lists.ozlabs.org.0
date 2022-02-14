Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EAF4B4CA8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 11:52:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jy1Jn34Cmz3f8V
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 21:52:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hwx4k26n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hwx4k26n; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jy15q4xYmz3cTp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 21:43:11 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21EAcjEK036679; 
 Mon, 14 Feb 2022 10:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=5pcADrzSsK/IOVrfZRfqNMCQ5THYLAee93G67vbM6cc=;
 b=hwx4k26nqzqlird/B341a5SgVJU4cL6s30PpKtTdlVE9JP8hT5OxDi4drEutDbmf5xDn
 VGwuS+aNMjE3biPALYd5yTv8Ff4rPLjbQdG1waHNx6s0oSiXkXFUcIwyVaDRYXQSA7je
 aUXfzkt14cV9N2AxVyV8uOc0eJeCdrGrrmj0B/cP+3DmizUrYldW0KFYllK1AR/fKc/0
 e4mKWSFNWUEeIFn1pYXQBSHZ+fYmykH3FQ5hxc4B6DjhWGgZY7gOaFzxZWyMpWisGHCk
 Z6HT1OxLu60RfaB2DX8AsMD9iRmif5uMffvJLOc2e6csOT4ShxI1FpQQ4lpiZIWjlEql TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e7920nu2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:54 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21EATDpt039812;
 Mon, 14 Feb 2022 10:42:53 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e7920nu23-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:53 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21EAXfXE014706;
 Mon, 14 Feb 2022 10:42:51 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06fra.de.ibm.com with ESMTP id 3e645jb9yt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:50 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21EAWT3T50200918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 10:32:29 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B4684AE053;
 Mon, 14 Feb 2022 10:42:47 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A169AE057;
 Mon, 14 Feb 2022 10:42:45 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.124.167])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Feb 2022 10:42:45 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH powerpc/next 15/17] powerpc/bpf: Use _Rn macros for GPRs
Date: Mon, 14 Feb 2022 16:11:49 +0530
Message-Id: <7df626b8cdc6141d4295ac16137c82ad570b6637.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vAg8hQTHpmz9QM9rnD6Pz_896M7hk2UF
X-Proofpoint-ORIG-GUID: PhXCRRApbsZ5ECpzBTkJgtz6-mrJt-8-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_02,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140064
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Yauheni Kaliuta <yauheni.kaliuta@redhat.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use _Rn macros to specify register names to make their usage clear.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp32.c | 30 +++++++-------
 arch/powerpc/net/bpf_jit_comp64.c | 68 +++++++++++++++----------------
 2 files changed, 49 insertions(+), 49 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index 063e3a1be9270d..fe4e0eca017ede 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -41,23 +41,23 @@
 /* BPF to ppc register mappings */
 const int b2p[MAX_BPF_JIT_REG + 1] = {
 	/* function return value */
-	[BPF_REG_0] = 12,
+	[BPF_REG_0] = _R12,
 	/* function arguments */
-	[BPF_REG_1] = 4,
-	[BPF_REG_2] = 6,
-	[BPF_REG_3] = 8,
-	[BPF_REG_4] = 10,
-	[BPF_REG_5] = 22,
+	[BPF_REG_1] = _R4,
+	[BPF_REG_2] = _R6,
+	[BPF_REG_3] = _R8,
+	[BPF_REG_4] = _R10,
+	[BPF_REG_5] = _R22,
 	/* non volatile registers */
-	[BPF_REG_6] = 24,
-	[BPF_REG_7] = 26,
-	[BPF_REG_8] = 28,
-	[BPF_REG_9] = 30,
+	[BPF_REG_6] = _R24,
+	[BPF_REG_7] = _R26,
+	[BPF_REG_8] = _R28,
+	[BPF_REG_9] = _R30,
 	/* frame pointer aka BPF_REG_10 */
-	[BPF_REG_FP] = 18,
+	[BPF_REG_FP] = _R18,
 	/* eBPF jit internal registers */
-	[BPF_REG_AX] = 20,
-	[TMP_REG] = 31,		/* 32 bits */
+	[BPF_REG_AX] = _R20,
+	[TMP_REG] = _R31,		/* 32 bits */
 };
 
 static int bpf_to_ppc(struct codegen_context *ctx, int reg)
@@ -66,8 +66,8 @@ static int bpf_to_ppc(struct codegen_context *ctx, int reg)
 }
 
 /* PPC NVR range -- update this if we ever use NVRs below r17 */
-#define BPF_PPC_NVR_MIN		17
-#define BPF_PPC_TC		16
+#define BPF_PPC_NVR_MIN		_R17
+#define BPF_PPC_TC		_R16
 
 static int bpf_jit_stack_offsetof(struct codegen_context *ctx, int reg)
 {
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 3e4ed556094770..ac06efa7022379 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -48,28 +48,28 @@
 /* BPF to ppc register mappings */
 const int b2p[MAX_BPF_JIT_REG + 2] = {
 	/* function return value */
-	[BPF_REG_0] = 8,
+	[BPF_REG_0] = _R8,
 	/* function arguments */
-	[BPF_REG_1] = 3,
-	[BPF_REG_2] = 4,
-	[BPF_REG_3] = 5,
-	[BPF_REG_4] = 6,
-	[BPF_REG_5] = 7,
+	[BPF_REG_1] = _R3,
+	[BPF_REG_2] = _R4,
+	[BPF_REG_3] = _R5,
+	[BPF_REG_4] = _R6,
+	[BPF_REG_5] = _R7,
 	/* non volatile registers */
-	[BPF_REG_6] = 27,
-	[BPF_REG_7] = 28,
-	[BPF_REG_8] = 29,
-	[BPF_REG_9] = 30,
+	[BPF_REG_6] = _R27,
+	[BPF_REG_7] = _R28,
+	[BPF_REG_8] = _R29,
+	[BPF_REG_9] = _R30,
 	/* frame pointer aka BPF_REG_10 */
-	[BPF_REG_FP] = 31,
+	[BPF_REG_FP] = _R31,
 	/* eBPF jit internal registers */
-	[BPF_REG_AX] = 12,
-	[TMP_REG_1] = 9,
-	[TMP_REG_2] = 10
+	[BPF_REG_AX] = _R12,
+	[TMP_REG_1] = _R9,
+	[TMP_REG_2] = _R10
 };
 
 /* PPC NVR range -- update this if we ever use NVRs below r27 */
-#define BPF_PPC_NVR_MIN		27
+#define BPF_PPC_NVR_MIN		_R27
 
 static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
 {
@@ -136,7 +136,7 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 	if (ctx->seen & SEEN_TAILCALL) {
 		EMIT(PPC_RAW_LI(b2p[TMP_REG_1], 0));
 		/* this goes in the redzone */
-		EMIT(PPC_RAW_STD(b2p[TMP_REG_1], 1, -(BPF_PPC_STACK_SAVE + 8)));
+		EMIT(PPC_RAW_STD(b2p[TMP_REG_1], _R1, -(BPF_PPC_STACK_SAVE + 8)));
 	} else {
 		EMIT(PPC_RAW_NOP());
 		EMIT(PPC_RAW_NOP());
@@ -149,10 +149,10 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 		 */
 		if (ctx->seen & SEEN_FUNC) {
 			EMIT(PPC_RAW_MFLR(_R0));
-			EMIT(PPC_RAW_STD(0, 1, PPC_LR_STKOFF));
+			EMIT(PPC_RAW_STD(_R0, _R1, PPC_LR_STKOFF));
 		}
 
-		EMIT(PPC_RAW_STDU(1, 1, -(BPF_PPC_STACKFRAME + ctx->stack_size)));
+		EMIT(PPC_RAW_STDU(_R1, _R1, -(BPF_PPC_STACKFRAME + ctx->stack_size)));
 	}
 
 	/*
@@ -162,11 +162,11 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 	 */
 	for (i = BPF_REG_6; i <= BPF_REG_10; i++)
 		if (bpf_is_seen_register(ctx, b2p[i]))
-			EMIT(PPC_RAW_STD(b2p[i], 1, bpf_jit_stack_offsetof(ctx, b2p[i])));
+			EMIT(PPC_RAW_STD(b2p[i], _R1, bpf_jit_stack_offsetof(ctx, b2p[i])));
 
 	/* Setup frame pointer to point to the bpf stack area */
 	if (bpf_is_seen_register(ctx, b2p[BPF_REG_FP]))
-		EMIT(PPC_RAW_ADDI(b2p[BPF_REG_FP], 1,
+		EMIT(PPC_RAW_ADDI(b2p[BPF_REG_FP], _R1,
 				STACK_FRAME_MIN_SIZE + ctx->stack_size));
 }
 
@@ -177,14 +177,14 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx
 	/* Restore NVRs */
 	for (i = BPF_REG_6; i <= BPF_REG_10; i++)
 		if (bpf_is_seen_register(ctx, b2p[i]))
-			EMIT(PPC_RAW_LD(b2p[i], 1, bpf_jit_stack_offsetof(ctx, b2p[i])));
+			EMIT(PPC_RAW_LD(b2p[i], _R1, bpf_jit_stack_offsetof(ctx, b2p[i])));
 
 	/* Tear down our stack frame */
 	if (bpf_has_stack_frame(ctx)) {
-		EMIT(PPC_RAW_ADDI(1, 1, BPF_PPC_STACKFRAME + ctx->stack_size));
+		EMIT(PPC_RAW_ADDI(_R1, _R1, BPF_PPC_STACKFRAME + ctx->stack_size));
 		if (ctx->seen & SEEN_FUNC) {
-			EMIT(PPC_RAW_LD(0, 1, PPC_LR_STKOFF));
-			EMIT(PPC_RAW_MTLR(0));
+			EMIT(PPC_RAW_LD(_R0, _R1, PPC_LR_STKOFF));
+			EMIT(PPC_RAW_MTLR(_R0));
 		}
 	}
 }
@@ -194,7 +194,7 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
 	bpf_jit_emit_common_epilogue(image, ctx);
 
 	/* Move result to r3 */
-	EMIT(PPC_RAW_MR(3, b2p[BPF_REG_0]));
+	EMIT(PPC_RAW_MR(_R3, b2p[BPF_REG_0]));
 
 	EMIT(PPC_RAW_BLR());
 }
@@ -232,7 +232,7 @@ int bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 func
 	func += FUNCTION_DESCR_SIZE;
 
 	/* Load function address into r12 */
-	PPC_LI64(12, func);
+	PPC_LI64(_R12, func);
 
 	/* For bpf-to-bpf function calls, the callee's address is unknown
 	 * until the last extra pass. As seen above, we use PPC_LI64() to
@@ -247,7 +247,7 @@ int bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 func
 	for (i = ctx->idx - ctx_idx; i < 5; i++)
 		EMIT(PPC_RAW_NOP());
 
-	EMIT(PPC_RAW_MTCTR(12));
+	EMIT(PPC_RAW_MTCTR(_R12));
 	EMIT(PPC_RAW_BCTRL());
 
 	return 0;
@@ -281,7 +281,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	 * if (tail_call_cnt >= MAX_TAIL_CALL_CNT)
 	 *   goto out;
 	 */
-	EMIT(PPC_RAW_LD(b2p[TMP_REG_1], 1, bpf_jit_stack_tailcallcnt(ctx)));
+	EMIT(PPC_RAW_LD(b2p[TMP_REG_1], _R1, bpf_jit_stack_tailcallcnt(ctx)));
 	EMIT(PPC_RAW_CMPLWI(b2p[TMP_REG_1], MAX_TAIL_CALL_CNT));
 	PPC_BCC_SHORT(COND_GE, out);
 
@@ -289,7 +289,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	 * tail_call_cnt++;
 	 */
 	EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], b2p[TMP_REG_1], 1));
-	EMIT(PPC_RAW_STD(b2p[TMP_REG_1], 1, bpf_jit_stack_tailcallcnt(ctx)));
+	EMIT(PPC_RAW_STD(b2p[TMP_REG_1], _R1, bpf_jit_stack_tailcallcnt(ctx)));
 
 	/* prog = array->ptrs[index]; */
 	EMIT(PPC_RAW_MULI(b2p[TMP_REG_1], b2p_index, 8));
@@ -680,8 +680,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				break;
 			case 64:
 				/* Store the value to stack and then use byte-reverse loads */
-				EMIT(PPC_RAW_STD(dst_reg, 1, bpf_jit_stack_local(ctx)));
-				EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], 1, bpf_jit_stack_local(ctx)));
+				EMIT(PPC_RAW_STD(dst_reg, _R1, bpf_jit_stack_local(ctx)));
+				EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], _R1, bpf_jit_stack_local(ctx)));
 				if (cpu_has_feature(CPU_FTR_ARCH_206)) {
 					EMIT(PPC_RAW_LDBRX(dst_reg, 0, b2p[TMP_REG_1]));
 				} else {
@@ -736,8 +736,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				break;
 			case STF_BARRIER_FALLBACK:
 				ctx->seen |= SEEN_FUNC;
-				PPC_LI64(12, dereference_kernel_function_descriptor(bpf_stf_barrier));
-				EMIT(PPC_RAW_MTCTR(12));
+				PPC_LI64(_R12, dereference_kernel_function_descriptor(bpf_stf_barrier));
+				EMIT(PPC_RAW_MTCTR(_R12));
 				EMIT(PPC_RAW_BCTRL());
 				break;
 			case STF_BARRIER_NONE:
@@ -952,7 +952,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				return ret;
 
 			/* move return value from r3 to BPF_REG_0 */
-			EMIT(PPC_RAW_MR(b2p[BPF_REG_0], 3));
+			EMIT(PPC_RAW_MR(b2p[BPF_REG_0], _R3));
 			break;
 
 		/*
-- 
2.35.1

