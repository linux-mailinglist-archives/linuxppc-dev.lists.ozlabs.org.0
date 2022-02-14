Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CAD4B4CAD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 11:54:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jy1MH329wz3fH5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 21:54:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tF86Ecjs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=tF86Ecjs; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jy15y02cNz3cV5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 21:43:17 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21E9v1Bj023757; 
 Mon, 14 Feb 2022 10:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/Jg/iAny1dcOckC1ITy+N/f+cRVkl9vomfeJxhEbeGQ=;
 b=tF86EcjskTYngItd/JagEryJPwGFMSJ8QD4jOjXY0N8YGDsXeaMkv+sdRWw2xyRyN7k3
 qmjl7KD9W9UqIFnWe3qubv53R8SMhpSaLlc5Bzbeoizgf+YFhP7wj7B/HCiM9sgduMIg
 X3rQqCldyoqoyxjStqv+Pxri3jclrHWog4uxPNcD4jBraWTmFRJ5gVbUac+/creuyc0P
 MeDDkPXACK892JlEpkRqB6GLKhP2iN4aDsEu3ZGqcav+5rkiHY9iBWDEbkFfL/FSKgDE
 m6E8MvKR5hCjscgt2nppST6mn0rhhPRBTG4zDg6Y7+QmHgoJkRfQRroEvbdkzcEyYXxx IA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e78m0e60s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:43:00 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21EAZoMw010326;
 Mon, 14 Feb 2022 10:43:00 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e78m0e5yu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:59 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21EAXYN0000930;
 Mon, 14 Feb 2022 10:42:57 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3e645jc3a5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:57 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21EAgrAi23593406
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 10:42:53 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B24D4AE051;
 Mon, 14 Feb 2022 10:42:53 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AD7EAE053;
 Mon, 14 Feb 2022 10:42:51 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.124.167])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Feb 2022 10:42:50 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH powerpc/next 17/17] powerpc/bpf: Simplify bpf_to_ppc() and
 adopt it for powerpc64
Date: Mon, 14 Feb 2022 16:11:51 +0530
Message-Id: <09f0540ce3e0cd4120b5b33993b5e73b6ef9e979.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Bnfqcdsqrx5ImpwwcFPB2e0dy8kUJWjk
X-Proofpoint-ORIG-GUID: GkliYTe4yxOpl1_pXM1hQjNUmnphLz01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_02,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 mlxscore=0 phishscore=0 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
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

Convert bpf_to_ppc() to a macro to help simplify its usage since
codegen_context is available in all places it is used. Adopt it also for
powerpc64 for uniformity and get rid of the global b2p structure.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/net/bpf_jit.h        | 11 ++--
 arch/powerpc/net/bpf_jit_comp.c   |  8 +--
 arch/powerpc/net/bpf_jit_comp32.c | 90 ++++++++++++++----------------
 arch/powerpc/net/bpf_jit_comp64.c | 93 ++++++++++++++++---------------
 4 files changed, 98 insertions(+), 104 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index d9bdc9df2e48ed..c16271a456b343 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -122,12 +122,6 @@
 #define SEEN_VREG_MASK	0x1ff80000 /* Volatile registers r3-r12 */
 #define SEEN_NVREG_MASK	0x0003ffff /* Non volatile registers r14-r31 */
 
-#ifdef CONFIG_PPC64
-extern const int b2p[MAX_BPF_JIT_REG + 2];
-#else
-extern const int b2p[MAX_BPF_JIT_REG + 1];
-#endif
-
 struct codegen_context {
 	/*
 	 * This is used to track register usage as well
@@ -141,11 +135,13 @@ struct codegen_context {
 	unsigned int seen;
 	unsigned int idx;
 	unsigned int stack_size;
-	int b2p[ARRAY_SIZE(b2p)];
+	int b2p[MAX_BPF_JIT_REG + 2];
 	unsigned int exentry_idx;
 	unsigned int alt_exit_addr;
 };
 
+#define bpf_to_ppc(r)	(ctx->b2p[r])
+
 #ifdef CONFIG_PPC32
 #define BPF_FIXUP_LEN	3 /* Three instructions => 12 bytes */
 #else
@@ -173,6 +169,7 @@ static inline void bpf_clear_seen_register(struct codegen_context *ctx, int i)
 	ctx->seen &= ~(1 << (31 - i));
 }
 
+void bpf_jit_init_reg_mapping(struct codegen_context *ctx);
 int bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx, u64 func);
 int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *ctx,
 		       u32 *addrs, int pass);
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 635f7448ff7952..fc160d33c83960 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -72,13 +72,13 @@ static int bpf_jit_fixup_addresses(struct bpf_prog *fp, u32 *image,
 			tmp_idx = ctx->idx;
 			ctx->idx = addrs[i] / 4;
 #ifdef CONFIG_PPC32
-			PPC_LI32(ctx->b2p[insn[i].dst_reg] - 1, (u32)insn[i + 1].imm);
-			PPC_LI32(ctx->b2p[insn[i].dst_reg], (u32)insn[i].imm);
+			PPC_LI32(bpf_to_ppc(insn[i].dst_reg) - 1, (u32)insn[i + 1].imm);
+			PPC_LI32(bpf_to_ppc(insn[i].dst_reg), (u32)insn[i].imm);
 			for (j = ctx->idx - addrs[i] / 4; j < 4; j++)
 				EMIT(PPC_RAW_NOP());
 #else
 			func_addr = ((u64)(u32)insn[i].imm) | (((u64)(u32)insn[i + 1].imm) << 32);
-			PPC_LI64(b2p[insn[i].dst_reg], func_addr);
+			PPC_LI64(bpf_to_ppc(insn[i].dst_reg), func_addr);
 			/* overwrite rest with nops */
 			for (j = ctx->idx - addrs[i] / 4; j < 5; j++)
 				EMIT(PPC_RAW_NOP());
@@ -179,7 +179,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	}
 
 	memset(&cgctx, 0, sizeof(struct codegen_context));
-	memcpy(cgctx.b2p, b2p, sizeof(cgctx.b2p));
+	bpf_jit_init_reg_mapping(&cgctx);
 
 	/* Make sure that the stack is quadword aligned. */
 	cgctx.stack_size = round_up(fp->aux->stack_depth, 16);
diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index fe4e0eca017ede..7dc716cd64bcbc 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -33,42 +33,38 @@
 /* stack frame, ensure this is quadword aligned */
 #define BPF_PPC_STACKFRAME(ctx)	(STACK_FRAME_MIN_SIZE + BPF_PPC_STACK_SAVE + (ctx)->stack_size)
 
-/* BPF register usage */
-#define TMP_REG	(MAX_BPF_JIT_REG + 0)
-
 #define PPC_EX32(r, i)		EMIT(PPC_RAW_LI((r), (i) < 0 ? -1 : 0))
 
+/* PPC NVR range -- update this if we ever use NVRs below r17 */
+#define BPF_PPC_NVR_MIN		_R17
+#define BPF_PPC_TC		_R16
+
+/* BPF register usage */
+#define TMP_REG			(MAX_BPF_JIT_REG + 0)
+
 /* BPF to ppc register mappings */
-const int b2p[MAX_BPF_JIT_REG + 1] = {
+void bpf_jit_init_reg_mapping(struct codegen_context *ctx)
+{
 	/* function return value */
-	[BPF_REG_0] = _R12,
+	ctx->b2p[BPF_REG_0] = _R12;
 	/* function arguments */
-	[BPF_REG_1] = _R4,
-	[BPF_REG_2] = _R6,
-	[BPF_REG_3] = _R8,
-	[BPF_REG_4] = _R10,
-	[BPF_REG_5] = _R22,
+	ctx->b2p[BPF_REG_1] = _R4;
+	ctx->b2p[BPF_REG_2] = _R6;
+	ctx->b2p[BPF_REG_3] = _R8;
+	ctx->b2p[BPF_REG_4] = _R10;
+	ctx->b2p[BPF_REG_5] = _R22;
 	/* non volatile registers */
-	[BPF_REG_6] = _R24,
-	[BPF_REG_7] = _R26,
-	[BPF_REG_8] = _R28,
-	[BPF_REG_9] = _R30,
+	ctx->b2p[BPF_REG_6] = _R24;
+	ctx->b2p[BPF_REG_7] = _R26;
+	ctx->b2p[BPF_REG_8] = _R28;
+	ctx->b2p[BPF_REG_9] = _R30;
 	/* frame pointer aka BPF_REG_10 */
-	[BPF_REG_FP] = _R18,
+	ctx->b2p[BPF_REG_FP] = _R18;
 	/* eBPF jit internal registers */
-	[BPF_REG_AX] = _R20,
-	[TMP_REG] = _R31,		/* 32 bits */
-};
-
-static int bpf_to_ppc(struct codegen_context *ctx, int reg)
-{
-	return ctx->b2p[reg];
+	ctx->b2p[BPF_REG_AX] = _R20;
+	ctx->b2p[TMP_REG] = _R31;		/* 32 bits */
 }
 
-/* PPC NVR range -- update this if we ever use NVRs below r17 */
-#define BPF_PPC_NVR_MIN		_R17
-#define BPF_PPC_TC		_R16
-
 static int bpf_jit_stack_offsetof(struct codegen_context *ctx, int reg)
 {
 	if ((reg >= BPF_PPC_NVR_MIN && reg < 32) || reg == BPF_PPC_TC)
@@ -110,8 +106,8 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 	int i;
 
 	/* First arg comes in as a 32 bits pointer. */
-	EMIT(PPC_RAW_MR(bpf_to_ppc(ctx, BPF_REG_1), _R3));
-	EMIT(PPC_RAW_LI(bpf_to_ppc(ctx, BPF_REG_1) - 1, 0));
+	EMIT(PPC_RAW_MR(bpf_to_ppc(BPF_REG_1), _R3));
+	EMIT(PPC_RAW_LI(bpf_to_ppc(BPF_REG_1) - 1, 0));
 	EMIT(PPC_RAW_STWU(_R1, _R1, -BPF_PPC_STACKFRAME(ctx)));
 
 	/*
@@ -120,7 +116,7 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 	 * invoked through a tail call.
 	 */
 	if (ctx->seen & SEEN_TAILCALL)
-		EMIT(PPC_RAW_STW(bpf_to_ppc(ctx, BPF_REG_1) - 1, _R1,
+		EMIT(PPC_RAW_STW(bpf_to_ppc(BPF_REG_1) - 1, _R1,
 				 bpf_jit_stack_offsetof(ctx, BPF_PPC_TC)));
 	else
 		EMIT(PPC_RAW_NOP());
@@ -142,15 +138,15 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 			EMIT(PPC_RAW_STW(i, _R1, bpf_jit_stack_offsetof(ctx, i)));
 
 	/* If needed retrieve arguments 9 and 10, ie 5th 64 bits arg.*/
-	if (bpf_is_seen_register(ctx, bpf_to_ppc(ctx, BPF_REG_5))) {
-		EMIT(PPC_RAW_LWZ(bpf_to_ppc(ctx, BPF_REG_5) - 1, _R1, BPF_PPC_STACKFRAME(ctx)) + 8);
-		EMIT(PPC_RAW_LWZ(bpf_to_ppc(ctx, BPF_REG_5), _R1, BPF_PPC_STACKFRAME(ctx)) + 12);
+	if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_5))) {
+		EMIT(PPC_RAW_LWZ(bpf_to_ppc(BPF_REG_5) - 1, _R1, BPF_PPC_STACKFRAME(ctx)) + 8);
+		EMIT(PPC_RAW_LWZ(bpf_to_ppc(BPF_REG_5), _R1, BPF_PPC_STACKFRAME(ctx)) + 12);
 	}
 
 	/* Setup frame pointer to point to the bpf stack area */
-	if (bpf_is_seen_register(ctx, bpf_to_ppc(ctx, BPF_REG_FP))) {
-		EMIT(PPC_RAW_LI(bpf_to_ppc(ctx, BPF_REG_FP) - 1, 0));
-		EMIT(PPC_RAW_ADDI(bpf_to_ppc(ctx, BPF_REG_FP), _R1,
+	if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP))) {
+		EMIT(PPC_RAW_LI(bpf_to_ppc(BPF_REG_FP) - 1, 0));
+		EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
 				  STACK_FRAME_MIN_SIZE + ctx->stack_size));
 	}
 
@@ -170,7 +166,7 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx
 
 void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
 {
-	EMIT(PPC_RAW_MR(_R3, bpf_to_ppc(ctx, BPF_REG_0)));
+	EMIT(PPC_RAW_MR(_R3, bpf_to_ppc(BPF_REG_0)));
 
 	bpf_jit_emit_common_epilogue(image, ctx);
 
@@ -215,8 +211,8 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	 * r5-r6/BPF_REG_2 - pointer to bpf_array
 	 * r7-r8/BPF_REG_3 - index in bpf_array
 	 */
-	int b2p_bpf_array = bpf_to_ppc(ctx, BPF_REG_2);
-	int b2p_index = bpf_to_ppc(ctx, BPF_REG_3);
+	int b2p_bpf_array = bpf_to_ppc(BPF_REG_2);
+	int b2p_index = bpf_to_ppc(BPF_REG_3);
 
 	/*
 	 * if (index >= array->map.max_entries)
@@ -262,7 +258,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 
 	EMIT(PPC_RAW_MTCTR(_R3));
 
-	EMIT(PPC_RAW_MR(_R3, bpf_to_ppc(ctx, BPF_REG_1)));
+	EMIT(PPC_RAW_MR(_R3, bpf_to_ppc(BPF_REG_1)));
 
 	/* tear restore NVRs, ... */
 	bpf_jit_emit_common_epilogue(image, ctx);
@@ -286,11 +282,11 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 
 	for (i = 0; i < flen; i++) {
 		u32 code = insn[i].code;
-		u32 dst_reg = bpf_to_ppc(ctx, insn[i].dst_reg);
+		u32 dst_reg = bpf_to_ppc(insn[i].dst_reg);
 		u32 dst_reg_h = dst_reg - 1;
-		u32 src_reg = bpf_to_ppc(ctx, insn[i].src_reg);
+		u32 src_reg = bpf_to_ppc(insn[i].src_reg);
 		u32 src_reg_h = src_reg - 1;
-		u32 tmp_reg = bpf_to_ppc(ctx, TMP_REG);
+		u32 tmp_reg = bpf_to_ppc(TMP_REG);
 		u32 size = BPF_SIZE(code);
 		s16 off = insn[i].off;
 		s32 imm = insn[i].imm;
@@ -952,17 +948,17 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			if (ret < 0)
 				return ret;
 
-			if (bpf_is_seen_register(ctx, bpf_to_ppc(ctx, BPF_REG_5))) {
-				EMIT(PPC_RAW_STW(bpf_to_ppc(ctx, BPF_REG_5) - 1, _R1, 8));
-				EMIT(PPC_RAW_STW(bpf_to_ppc(ctx, BPF_REG_5), _R1, 12));
+			if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_5))) {
+				EMIT(PPC_RAW_STW(bpf_to_ppc(BPF_REG_5) - 1, _R1, 8));
+				EMIT(PPC_RAW_STW(bpf_to_ppc(BPF_REG_5), _R1, 12));
 			}
 
 			ret = bpf_jit_emit_func_call_rel(image, ctx, func_addr);
 			if (ret)
 				return ret;
 
-			EMIT(PPC_RAW_MR(bpf_to_ppc(ctx, BPF_REG_0) - 1, _R3));
-			EMIT(PPC_RAW_MR(bpf_to_ppc(ctx, BPF_REG_0), _R4));
+			EMIT(PPC_RAW_MR(bpf_to_ppc(BPF_REG_0) - 1, _R3));
+			EMIT(PPC_RAW_MR(bpf_to_ppc(BPF_REG_0), _R4));
 			break;
 
 		/*
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index b4de0c35c8a4ab..585f257da04587 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -46,27 +46,28 @@
 #define TMP_REG_2	(MAX_BPF_JIT_REG + 1)
 
 /* BPF to ppc register mappings */
-const int b2p[MAX_BPF_JIT_REG + 2] = {
+void bpf_jit_init_reg_mapping(struct codegen_context *ctx)
+{
 	/* function return value */
-	[BPF_REG_0] = _R8,
+	ctx->b2p[BPF_REG_0] = _R8;
 	/* function arguments */
-	[BPF_REG_1] = _R3,
-	[BPF_REG_2] = _R4,
-	[BPF_REG_3] = _R5,
-	[BPF_REG_4] = _R6,
-	[BPF_REG_5] = _R7,
+	ctx->b2p[BPF_REG_1] = _R3;
+	ctx->b2p[BPF_REG_2] = _R4;
+	ctx->b2p[BPF_REG_3] = _R5;
+	ctx->b2p[BPF_REG_4] = _R6;
+	ctx->b2p[BPF_REG_5] = _R7;
 	/* non volatile registers */
-	[BPF_REG_6] = _R27,
-	[BPF_REG_7] = _R28,
-	[BPF_REG_8] = _R29,
-	[BPF_REG_9] = _R30,
+	ctx->b2p[BPF_REG_6] = _R27;
+	ctx->b2p[BPF_REG_7] = _R28;
+	ctx->b2p[BPF_REG_8] = _R29;
+	ctx->b2p[BPF_REG_9] = _R30;
 	/* frame pointer aka BPF_REG_10 */
-	[BPF_REG_FP] = _R31,
+	ctx->b2p[BPF_REG_FP] = _R31;
 	/* eBPF jit internal registers */
-	[BPF_REG_AX] = _R12,
-	[TMP_REG_1] = _R9,
-	[TMP_REG_2] = _R10
-};
+	ctx->b2p[BPF_REG_AX] = _R12;
+	ctx->b2p[TMP_REG_1] = _R9;
+	ctx->b2p[TMP_REG_2] = _R10;
+}
 
 /* PPC NVR range -- update this if we ever use NVRs below r27 */
 #define BPF_PPC_NVR_MIN		_R27
@@ -79,7 +80,7 @@ static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
 	 * - the bpf program uses its stack area
 	 * The latter condition is deduced from the usage of BPF_REG_FP
 	 */
-	return ctx->seen & SEEN_FUNC || bpf_is_seen_register(ctx, b2p[BPF_REG_FP]);
+	return ctx->seen & SEEN_FUNC || bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP));
 }
 
 /*
@@ -134,9 +135,9 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 	 * invoked through a tail call.
 	 */
 	if (ctx->seen & SEEN_TAILCALL) {
-		EMIT(PPC_RAW_LI(b2p[TMP_REG_1], 0));
+		EMIT(PPC_RAW_LI(bpf_to_ppc(TMP_REG_1), 0));
 		/* this goes in the redzone */
-		EMIT(PPC_RAW_STD(b2p[TMP_REG_1], _R1, -(BPF_PPC_STACK_SAVE + 8)));
+		EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, -(BPF_PPC_STACK_SAVE + 8)));
 	} else {
 		EMIT(PPC_RAW_NOP());
 		EMIT(PPC_RAW_NOP());
@@ -161,12 +162,12 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 	 * in the protected zone below the previous stack frame
 	 */
 	for (i = BPF_REG_6; i <= BPF_REG_10; i++)
-		if (bpf_is_seen_register(ctx, b2p[i]))
-			EMIT(PPC_RAW_STD(b2p[i], _R1, bpf_jit_stack_offsetof(ctx, b2p[i])));
+		if (bpf_is_seen_register(ctx, bpf_to_ppc(i)))
+			EMIT(PPC_RAW_STD(bpf_to_ppc(i), _R1, bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
 
 	/* Setup frame pointer to point to the bpf stack area */
-	if (bpf_is_seen_register(ctx, b2p[BPF_REG_FP]))
-		EMIT(PPC_RAW_ADDI(b2p[BPF_REG_FP], _R1,
+	if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)))
+		EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
 				STACK_FRAME_MIN_SIZE + ctx->stack_size));
 }
 
@@ -176,8 +177,8 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx
 
 	/* Restore NVRs */
 	for (i = BPF_REG_6; i <= BPF_REG_10; i++)
-		if (bpf_is_seen_register(ctx, b2p[i]))
-			EMIT(PPC_RAW_LD(b2p[i], _R1, bpf_jit_stack_offsetof(ctx, b2p[i])));
+		if (bpf_is_seen_register(ctx, bpf_to_ppc(i)))
+			EMIT(PPC_RAW_LD(bpf_to_ppc(i), _R1, bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
 
 	/* Tear down our stack frame */
 	if (bpf_has_stack_frame(ctx)) {
@@ -194,7 +195,7 @@ void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
 	bpf_jit_emit_common_epilogue(image, ctx);
 
 	/* Move result to r3 */
-	EMIT(PPC_RAW_MR(_R3, b2p[BPF_REG_0]));
+	EMIT(PPC_RAW_MR(_R3, bpf_to_ppc(BPF_REG_0)));
 
 	EMIT(PPC_RAW_BLR());
 }
@@ -261,8 +262,8 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	 * r4/BPF_REG_2 - pointer to bpf_array
 	 * r5/BPF_REG_3 - index in bpf_array
 	 */
-	int b2p_bpf_array = b2p[BPF_REG_2];
-	int b2p_index = b2p[BPF_REG_3];
+	int b2p_bpf_array = bpf_to_ppc(BPF_REG_2);
+	int b2p_index = bpf_to_ppc(BPF_REG_3);
 	int bpf_tailcall_prologue_size = 8;
 
 	if (__is_defined(PPC64_ELF_ABI_v2))
@@ -272,42 +273,42 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	 * if (index >= array->map.max_entries)
 	 *   goto out;
 	 */
-	EMIT(PPC_RAW_LWZ(b2p[TMP_REG_1], b2p_bpf_array, offsetof(struct bpf_array, map.max_entries)));
+	EMIT(PPC_RAW_LWZ(bpf_to_ppc(TMP_REG_1), b2p_bpf_array, offsetof(struct bpf_array, map.max_entries)));
 	EMIT(PPC_RAW_RLWINM(b2p_index, b2p_index, 0, 0, 31));
-	EMIT(PPC_RAW_CMPLW(b2p_index, b2p[TMP_REG_1]));
+	EMIT(PPC_RAW_CMPLW(b2p_index, bpf_to_ppc(TMP_REG_1)));
 	PPC_BCC_SHORT(COND_GE, out);
 
 	/*
 	 * if (tail_call_cnt >= MAX_TAIL_CALL_CNT)
 	 *   goto out;
 	 */
-	EMIT(PPC_RAW_LD(b2p[TMP_REG_1], _R1, bpf_jit_stack_tailcallcnt(ctx)));
-	EMIT(PPC_RAW_CMPLWI(b2p[TMP_REG_1], MAX_TAIL_CALL_CNT));
+	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), _R1, bpf_jit_stack_tailcallcnt(ctx)));
+	EMIT(PPC_RAW_CMPLWI(bpf_to_ppc(TMP_REG_1), MAX_TAIL_CALL_CNT));
 	PPC_BCC_SHORT(COND_GE, out);
 
 	/*
 	 * tail_call_cnt++;
 	 */
-	EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], b2p[TMP_REG_1], 1));
-	EMIT(PPC_RAW_STD(b2p[TMP_REG_1], _R1, bpf_jit_stack_tailcallcnt(ctx)));
+	EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1), 1));
+	EMIT(PPC_RAW_STD(bpf_to_ppc(TMP_REG_1), _R1, bpf_jit_stack_tailcallcnt(ctx)));
 
 	/* prog = array->ptrs[index]; */
-	EMIT(PPC_RAW_MULI(b2p[TMP_REG_1], b2p_index, 8));
-	EMIT(PPC_RAW_ADD(b2p[TMP_REG_1], b2p[TMP_REG_1], b2p_bpf_array));
-	EMIT(PPC_RAW_LD(b2p[TMP_REG_1], b2p[TMP_REG_1], offsetof(struct bpf_array, ptrs)));
+	EMIT(PPC_RAW_MULI(bpf_to_ppc(TMP_REG_1), b2p_index, 8));
+	EMIT(PPC_RAW_ADD(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1), b2p_bpf_array));
+	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1), offsetof(struct bpf_array, ptrs)));
 
 	/*
 	 * if (prog == NULL)
 	 *   goto out;
 	 */
-	EMIT(PPC_RAW_CMPLDI(b2p[TMP_REG_1], 0));
+	EMIT(PPC_RAW_CMPLDI(bpf_to_ppc(TMP_REG_1), 0));
 	PPC_BCC_SHORT(COND_EQ, out);
 
 	/* goto *(prog->bpf_func + prologue_size); */
-	EMIT(PPC_RAW_LD(b2p[TMP_REG_1], b2p[TMP_REG_1], offsetof(struct bpf_prog, bpf_func)));
-	EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], b2p[TMP_REG_1],
+	EMIT(PPC_RAW_LD(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1), offsetof(struct bpf_prog, bpf_func)));
+	EMIT(PPC_RAW_ADDI(bpf_to_ppc(TMP_REG_1), bpf_to_ppc(TMP_REG_1),
 			FUNCTION_DESCR_SIZE + bpf_tailcall_prologue_size));
-	EMIT(PPC_RAW_MTCTR(b2p[TMP_REG_1]));
+	EMIT(PPC_RAW_MTCTR(bpf_to_ppc(TMP_REG_1)));
 
 	/* tear down stack, restore NVRs, ... */
 	bpf_jit_emit_common_epilogue(image, ctx);
@@ -354,11 +355,11 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 
 	for (i = 0; i < flen; i++) {
 		u32 code = insn[i].code;
-		u32 dst_reg = b2p[insn[i].dst_reg];
-		u32 src_reg = b2p[insn[i].src_reg];
+		u32 dst_reg = bpf_to_ppc(insn[i].dst_reg);
+		u32 src_reg = bpf_to_ppc(insn[i].src_reg);
 		u32 size = BPF_SIZE(code);
-		u32 tmp1_reg = b2p[TMP_REG_1];
-		u32 tmp2_reg = b2p[TMP_REG_2];
+		u32 tmp1_reg = bpf_to_ppc(TMP_REG_1);
+		u32 tmp2_reg = bpf_to_ppc(TMP_REG_2);
 		s16 off = insn[i].off;
 		s32 imm = insn[i].imm;
 		bool func_addr_fixed;
@@ -938,7 +939,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				return ret;
 
 			/* move return value from r3 to BPF_REG_0 */
-			EMIT(PPC_RAW_MR(b2p[BPF_REG_0], _R3));
+			EMIT(PPC_RAW_MR(bpf_to_ppc(BPF_REG_0), _R3));
 			break;
 
 		/*
-- 
2.35.1

