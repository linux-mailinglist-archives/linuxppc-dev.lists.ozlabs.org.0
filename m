Return-Path: <linuxppc-dev+bounces-15721-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7AFD1E80F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 12:46:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drkqD0yZZz2yFw;
	Wed, 14 Jan 2026 22:46:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768391208;
	cv=none; b=AzqyAnuFfuj0IsBvTqYcljxss1jfvPkFHKeSCCUfJJFOlLOPq/IeRv/CLUkUe1hQD+PIM8TqC9VLYNgnF4oQKtPzg0Ypch0ntHz0sl0jSp64xON3AQt9Gpfr7mrdcEQ675wDDGVIeGi8DNhIzn/xlT9Xle5sYzjfUMkHpyFXwVsTSevsrSU8rmre1szCVC9nc7w38LOhuWop1DOFf6dHgt5fXLB6ztT4WUVnvE8IEsqFwe+caGOWf6T6rw9++H7RiwTP6OF5rzjJvWsJ74cXVrmltHaTzlkU0DEFv5QZn1lirGOnroL5nW8aPSl1R3U5tCyyqyZkOc398+ZFXBg6Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768391208; c=relaxed/relaxed;
	bh=aXJUn3bNZD9fOETwczZ/IV1t0kDAXX4Muw0AQio7os4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QdNaKsinyIEZiD02yY6PQhraXzKz5tgHZwyL/dTZKOBOKH6f/PzionEDDwDAJ0O8wYs6Iz5mnH/Y20AooUkA+KA+fRm0ho0uqGE4PT1MedEjxW0R6FVOFvx/TkR71bONRrS57qBTXWAyCrG8yhy8m/RB5gEtIwd9aOesnH28Ma9n0ZU4zNgG3GgluP2QiPFwkeoC9vmoNpR2HOANeDPhRirkmyCcQT1knUZSxxbcVnod+6Df4F9aSdE0glkzyo8RiAiPeAaSKIFDbYfMmvsujZuwtF5PgWkw2Q/tV/i4w75SzWkZzu+h6etGrSDq0oHRbW3HDEjskdCTkoE+1/DfkQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lTT2E0Ym; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lTT2E0Ym;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drkqB6hnYz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 22:46:46 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60EBVIFw009441;
	Wed, 14 Jan 2026 11:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=aXJUn3bNZD9fOETwc
	zZ/IV1t0kDAXX4Muw0AQio7os4=; b=lTT2E0YmAM/iOpFUA42h/oorTWU+K10D5
	5u7CBO1rDajGULasgPTZ0zr+CFZJeEktvFOsc1RTKH2R7Z+OeT5IPHQaZqlsU/J+
	XSQYM07S8aG8IMh18xM4nKiA4iG04RaZiODQ2bSh0+CZn8dyk9suGQp28DPbJ2J8
	DPoE36VgaOlLxanh2ki5oDtft9v0dCf0+YNCnVMlmtuL5RFYb2PotsbjXi7dKfa2
	VQ0Uhw61FMlIgb+ydoN7DD5zdeirrB/hzKpG+V6upyxiSKP86DIxbFM5qveZEBGo
	thJ30N18Z9XvXk/icC+LVGxetzpsx8a/e9ID5suGTydyfPwddCgmg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bke93155t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 11:46:17 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60EBWDP2020741;
	Wed, 14 Jan 2026 11:46:17 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bke93155q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 11:46:17 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60EBMTux025961;
	Wed, 14 Jan 2026 11:46:15 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bm23n9ra2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 11:46:15 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60EBkBUq46072088
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jan 2026 11:46:11 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C25E20040;
	Wed, 14 Jan 2026 11:46:11 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB4B520043;
	Wed, 14 Jan 2026 11:46:04 +0000 (GMT)
Received: from abhi.. (unknown [9.124.217.65])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 Jan 2026 11:46:04 +0000 (GMT)
From: adubey@linux.ibm.com
To: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
        andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, memxor@gmail.com,
        iii@linux.ibm.com, shuah@kernel.org,
        Abhishek Dubey <adubey@linux.ibm.com>
Subject: [PATCH v2 5/6] powerpc64/bpf: Support exceptions
Date: Wed, 14 Jan 2026 17:14:49 +0530
Message-ID: <20260114114450.30405-6-adubey@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260114114450.30405-1-adubey@linux.ibm.com>
References: <20260114114450.30405-1-adubey@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Zt7Vyr5IxOTsYF3YS_KghMXvGQFRnPuJ
X-Authority-Analysis: v=2.4 cv=dYyNHHXe c=1 sm=1 tr=0 ts=69678209 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=DU0EyFXtAAAA:8 a=VnNF1IyMAAAA:8
 a=8rlfmSvwrT77M3U47S8A:9 a=UCR5be5CC-YrbG9FbbB0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA5MyBTYWx0ZWRfX9216ceHfLNTy
 f2q9BP5brJFX1ng4HTTga5/7fd8UuEVNs/evVTdD6cNNyz4BKRooftukmA95roVZIZP0QO3EzC0
 aYkkHQ2wc1hCNVx/7lltVXShDgSImtUN4HbzUDUG8WdFb76NSO3in+ciBq3sI26BIjm2hpDtUTB
 MH9FP35PVrLJ/7IXGiUw94U5HY2cx3kSNsqX9phRKHQRuEoq6hGqGSmaHKq1jH7rjfLQhBzgsrm
 /LPoZEi6sllTrhP/2Nhkp3FsRiwhMK5FVj1dxcYUscn4GhqmnKth92EaAQm85vV4Pu5xEoPqNeO
 PHS+DjfSCLCckAO6PlMA69u9lTNDo9Dk/QtdZJtKHNopxAqg6fV8claIqY3ANO85dO+fa0Zep3L
 R2r7tKW/pYye5/jB7yO78mOIw1cmyvgBVa4VGQEdASel8X9L8P5UVczf/ttcW+j6lvocfYAYwgZ
 Of673mxUYFhLLpcij1A==
X-Proofpoint-GUID: mX_nWFvyyTcU6KkGbHjUDlMtSJl3gZNE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601140093
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Abhishek Dubey <adubey@linux.ibm.com>

The modified prologue/epilogue generation code now
enables exception-callback to use the stack frame of
the program marked as exception boundary, where callee
saved registers are stored.

As per ppc64 ABIv2 documentation[1], r14-r31 are callee
saved registers. BPF programs on ppc64 already saves
r26-r31 registers. Saving the remaining set of callee
saved registers(r14-r25) is handled in the next patch.

[1] https://ftp.rtems.org/pub/rtems/people/sebh/ABI64BitOpenPOWERv1.1_16July2015_pub.pdf

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit.h        |  2 ++
 arch/powerpc/net/bpf_jit_comp.c   |  7 ++++
 arch/powerpc/net/bpf_jit_comp64.c | 53 +++++++++++++++++++++----------
 3 files changed, 45 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 5d735bc5e6bd..fb548ae5d143 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -179,6 +179,8 @@ struct codegen_context {
 	u64 arena_vm_start;
 	u64 user_vm_start;
 	bool is_subprog;
+	bool exception_boundary;
+	bool exception_cb;
 };
 
 #define bpf_to_ppc(r)	(ctx->b2p[r])
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index e3088cf089d1..26991940d36e 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -207,6 +207,8 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	cgctx.arena_vm_start = bpf_arena_get_kern_vm_start(fp->aux->arena);
 	cgctx.user_vm_start = bpf_arena_get_user_vm_start(fp->aux->arena);
 	cgctx.is_subprog = bpf_is_subprog(fp);
+	cgctx.exception_boundary = fp->aux->exception_boundary;
+	cgctx.exception_cb = fp->aux->exception_cb;
 
 	/* Scouting faux-generate pass 0 */
 	if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
@@ -436,6 +438,11 @@ void bpf_jit_free(struct bpf_prog *fp)
 	bpf_prog_unlock_free(fp);
 }
 
+bool bpf_jit_supports_exceptions(void)
+{
+	return IS_ENABLED(CONFIG_PPC64);
+}
+
 bool bpf_jit_supports_subprog_tailcalls(void)
 {
 	return IS_ENABLED(CONFIG_PPC64);
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index ec58395f74f7..a6083dd9786c 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -89,7 +89,9 @@ static inline bool bpf_has_stack_frame(struct codegen_context *ctx)
 	 * - the bpf program uses its stack area
 	 * The latter condition is deduced from the usage of BPF_REG_FP
 	 */
-	return ctx->seen & SEEN_FUNC || bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP));
+	return ctx->seen & SEEN_FUNC ||
+	       bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)) ||
+	       ctx->exception_cb;
 }
 
 /*
@@ -190,23 +192,32 @@ void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 		EMIT(PPC_RAW_STDU(_R1, _R1, -(BPF_PPC_STACKFRAME + ctx->stack_size)));
 	}
 
-	/*
-	 * Back up non-volatile regs -- BPF registers 6-10
-	 * If we haven't created our own stack frame, we save these
-	 * in the protected zone below the previous stack frame
-	 */
-	for (i = BPF_REG_6; i <= BPF_REG_10; i++)
-		if (bpf_is_seen_register(ctx, bpf_to_ppc(i)))
-			EMIT(PPC_RAW_STD(bpf_to_ppc(i), _R1, bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
+	if (!ctx->exception_cb) {
+		/*
+		 * Back up non-volatile regs -- BPF registers 6-10
+		 * If we haven't created our own stack frame, we save these
+		 * in the protected zone below the previous stack frame
+		 */
+		for (i = BPF_REG_6; i <= BPF_REG_10; i++)
+			if (ctx->exception_boundary || bpf_is_seen_register(ctx, bpf_to_ppc(i)))
+				EMIT(PPC_RAW_STD(bpf_to_ppc(i), _R1,
+					bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
 
-	if (ctx->arena_vm_start)
-		EMIT(PPC_RAW_STD(bpf_to_ppc(ARENA_VM_START), _R1,
+		if (ctx->exception_boundary || ctx->arena_vm_start)
+			EMIT(PPC_RAW_STD(bpf_to_ppc(ARENA_VM_START), _R1,
 				 bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ARENA_VM_START))));
 
-	/* Setup frame pointer to point to the bpf stack area */
-	if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)))
-		EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
+		/* Setup frame pointer to point to the bpf stack area */
+		if (bpf_is_seen_register(ctx, bpf_to_ppc(BPF_REG_FP)))
+			EMIT(PPC_RAW_ADDI(bpf_to_ppc(BPF_REG_FP), _R1,
 				STACK_FRAME_MIN_SIZE + ctx->stack_size));
+	} else {
+		/*
+		 * Exception callback receives Frame Pointer of main
+		 * program as third arg
+		 */
+		EMIT(PPC_RAW_MR(_R1, _R5));
+	}
 
 	if (ctx->arena_vm_start)
 		PPC_LI64(bpf_to_ppc(ARENA_VM_START), ctx->arena_vm_start);
@@ -218,17 +229,25 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx
 
 	/* Restore NVRs */
 	for (i = BPF_REG_6; i <= BPF_REG_10; i++)
-		if (bpf_is_seen_register(ctx, bpf_to_ppc(i)))
+		if (ctx->exception_cb || bpf_is_seen_register(ctx, bpf_to_ppc(i)))
 			EMIT(PPC_RAW_LD(bpf_to_ppc(i), _R1, bpf_jit_stack_offsetof(ctx, bpf_to_ppc(i))));
 
-	if (ctx->arena_vm_start)
+	if (ctx->exception_cb || ctx->arena_vm_start)
 		EMIT(PPC_RAW_LD(bpf_to_ppc(ARENA_VM_START), _R1,
 				bpf_jit_stack_offsetof(ctx, bpf_to_ppc(ARENA_VM_START))));
 
+	if (ctx->exception_cb) {
+		/*
+		 * LR value from boundary-frame is received as second parameter
+		 * in exception callback.
+		 */
+		EMIT(PPC_RAW_MTLR(_R4));
+	}
+
 	/* Tear down our stack frame */
 	if (bpf_has_stack_frame(ctx)) {
 		EMIT(PPC_RAW_ADDI(_R1, _R1, BPF_PPC_STACKFRAME + ctx->stack_size));
-		if (ctx->seen & SEEN_FUNC) {
+		if (ctx->seen & SEEN_FUNC || ctx->exception_cb) {
 			EMIT(PPC_RAW_LD(_R0, _R1, PPC_LR_STKOFF));
 			EMIT(PPC_RAW_MTLR(_R0));
 		}
-- 
2.48.1


