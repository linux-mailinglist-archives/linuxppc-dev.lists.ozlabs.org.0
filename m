Return-Path: <linuxppc-dev+bounces-15720-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A01D1E807
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 12:46:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drkpt0lxVz2yFs;
	Wed, 14 Jan 2026 22:46:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768391190;
	cv=none; b=NuE5yPbtbrUJDeMIMt7Ws1gHBmnCQgVTLk2R01Go/ZPIDeHEgW8Bn9QqNyowA7Fd8XxhtEk2E6Jqy8IvBb2KRk9C4gpXVCOedRhkPKD5UqGiHHIj27W3DwM9YtI1vcPUdOEc0QmNGOVaa6uXRcPvlrwIe0QnNenfE6nu4JFD7R3+vT21QsWTRY469ocSZx9yVZ7IeJCrJLbohW6s4qRe+WosTrOkOqrin6Qzb1IcZiDareTQ6mmgHNL7IEsrkvQL9AmpKhb8GJRFcAzLob0Av2hleynxdFkT+ewZrLSzAY6Zw4pjDMM0vnyR6KQnIaTX/B/52ML8K6xBTCH0oFf/zw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768391190; c=relaxed/relaxed;
	bh=ByuJMcarr0a2cFX1GTvgZGdkfern0JYYktb62wOJqc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YRGft2zGfHj2AZX2pIr+3+MJELo/m7m6xjOau4z2m9KswD9VeCNC/XOBdf15wQfwCqZSnAjbuYyxflyqmR5T1KCYe50cTltkpg5Kkz6+MNpYJHgJas5aagBTekQ50kQtYaFx+DRf+dPP+YvdKK2PX5YrpEzx4PEg+LEJLuPxbJ4xf04NVFtGJivDTa5f939X7WWLJsPCuAKGMr1ZnlvqyCXM4gSj+vOr8WYtaChmHVqEouM3b7NGBFNMCcjVNgyCZF7OfwYM6WamFAEOPtnSKWtuLWcDWiGYyf1RZRW0b2pVXUNaVR3RMWIvmKYCaoEXqc4RO2RbSrPmjNLjxkX7rA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qP0P1vxI; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qP0P1vxI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=adubey@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drkps2gJgz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 22:46:29 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60E97NBw002548;
	Wed, 14 Jan 2026 11:45:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ByuJMcarr0a2cFX1G
	TvgZGdkfern0JYYktb62wOJqc4=; b=qP0P1vxIHzTOdDF19dEog1lfaiIRH4F9o
	q8TeMfoouuf5cglSH0wG5UCFemSkbQkvT1GltCY8ndMljy0A5+35S6bO3qCJLLA1
	tH/mR6fFlSqV3VFFLNURfkhldFcjFWu12w3JofxnFXgpAnctBoJhPkOQIjTv9JS8
	hD0RlFyTkfiubftSdbc0HP3zQXurI/2rVFeEZ5X2Qs++FJTFtsaEY11O2G1dC5+5
	mOGhSQNENsVNr57OcznCdHiBVsrK3UIoBJLRZgTtC9M3JZcX3GS9/ATR1ifmL8OX
	SjI9v6PUBRBXR7T4jh2uKowTNxiQefW4TkdE2JJsl59n7BSb3jmTw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bke93154r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 11:45:55 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60EBWDP0020741;
	Wed, 14 Jan 2026 11:45:55 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bke93154m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 11:45:55 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60E8Y3Pv031269;
	Wed, 14 Jan 2026 11:45:54 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bm3t1sfm4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 11:45:53 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60EBjo7142467824
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jan 2026 11:45:50 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2572720043;
	Wed, 14 Jan 2026 11:45:50 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 912BD20040;
	Wed, 14 Jan 2026 11:45:43 +0000 (GMT)
Received: from abhi.. (unknown [9.124.217.65])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 Jan 2026 11:45:43 +0000 (GMT)
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
Subject: [PATCH v2 3/6] powerpc64/bpf: Tailcall handling with trampolines
Date: Wed, 14 Jan 2026 17:14:47 +0530
Message-ID: <20260114114450.30405-4-adubey@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 4tXRySjWdU3uBBoqa_Q3gm6Xvk9V0hL1
X-Authority-Analysis: v=2.4 cv=dYyNHHXe c=1 sm=1 tr=0 ts=696781f3 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=H7N5BJ4JIw_s2QcKL7IA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDA5MyBTYWx0ZWRfXyKA8YkaVhvfS
 ggsszs6fwc/lYLx6gJ0HlxwFixH2csRghsRkXyYUQTu5Ipief6luj8YqEshM8LUoRHEiIjzxCQe
 ElJktFHnKJ3GUbS+Piua49zY++JKepRYFqSGUCRIeFs3YlqLeXeFhUy7tzz+xmKqznZotsGb+Cg
 FDgG2pI1vcS+znpm7BRNfBuM83pynfa7CKQNFR+FgL+kqKy4M+e18/B7wEC4H5mGjCloTWVynjx
 NzaswYPRIsM+/f23jJCawsNUUmd23o5a3uP2C+Jayz8uufND/G900qw6MSH8HCidWtnqFuDCV7M
 ZMssU+0BZiZACh/xCeOaD7KLmEvXlCkUZ7zd9sVe2pf4cBhRY10f2j1rGdAUEhnI2hgmW1v8TiX
 COdfZZra9rRJk5cCyopBX5Uo3qFQPFL11jMc14HLDbYz3x3xzNT6xU72f0a3p2U/Zc9bHUdZAJW
 2TyWu4YeejRilnNTWwQ==
X-Proofpoint-GUID: aAPXFZ5XM8R5C7Daaa3Ir7Dvb0raVItE
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

The trampoline mechanism sets up its own stack frame and
an additional dummy frame. We need to have additional JIT
instructions handling tailcall dereferencing in the
trampoline's context.

We don't add the two stack frames pointed above, rather
add space for tail_call_info at bottom in trampoline frame
for ppc64. This makes the trampoline's frame consistent with
layout of all other frames wrt tail_call_info offset.

Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp.c | 83 ++++++++++++++++++++++-----------
 1 file changed, 56 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 069a8822c30d..e3088cf089d1 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -606,33 +606,58 @@ static int invoke_bpf_mod_ret(u32 *image, u32 *ro_image, struct codegen_context
 	return 0;
 }
 
-static void bpf_trampoline_setup_tail_call_cnt(u32 *image, struct codegen_context *ctx,
-					       int func_frame_offset, int r4_off)
-{
-	if (IS_ENABLED(CONFIG_PPC64)) {
-		/* See bpf_jit_stack_tailcallinfo_offset() */
-		int tailcallcnt_offset = 7 * 8;
-
-		EMIT(PPC_RAW_LL(_R3, _R1, func_frame_offset - tailcallcnt_offset));
-		EMIT(PPC_RAW_STL(_R3, _R1, -tailcallcnt_offset));
-	} else {
-		/* See bpf_jit_stack_offsetof() and BPF_PPC_TC */
-		EMIT(PPC_RAW_LL(_R4, _R1, r4_off));
-	}
-}
+/*
+ * Refer the label 'Generated stack layout' in this file for actual stack
+ * layout during trampoline invocation.
+ *
+ * Refer __arch_prepare_bpf_trampoline() for stack component details.
+ *
+ * The tailcall count/reference is present in caller's stack frame. Its required
+ * to copy the content of tail_call_info before calling the actual function
+ * to which the trampoline is attached.
+ *
+ */
 
-static void bpf_trampoline_restore_tail_call_cnt(u32 *image, struct codegen_context *ctx,
-						 int func_frame_offset, int r4_off)
+static void bpf_trampoline_setup_tail_call_info(u32 *image, struct codegen_context *ctx,
+					       int func_frame_offset,
+					       int bpf_dummy_frame_size, int r4_off)
 {
 	if (IS_ENABLED(CONFIG_PPC64)) {
 		/* See bpf_jit_stack_tailcallinfo_offset() */
-		int tailcallcnt_offset = 7 * 8;
+		int tailcallinfo_offset = BPF_PPC_TAILCALL;
+		/*
+		 * func_frame_offset =                                   ...(1)
+		 *     bpf_dummy_frame_size + trampoline_frame_size
+		 */
+		EMIT(PPC_RAW_LD(_R4, _R1, func_frame_offset));
+		EMIT(PPC_RAW_LD(_R3, _R4, -tailcallinfo_offset));
+
+		/*
+		 * Setting the tail_call_info in trampoline's frame
+		 * depending on if previous frame had value or reference.
+		 */
+		EMIT(PPC_RAW_CMPLWI(_R3, MAX_TAIL_CALL_CNT));
+		PPC_COND_BRANCH(COND_GT, CTX_NIA(ctx) + 8);
+		EMIT(PPC_RAW_ADDI(_R3, _R4, bpf_jit_stack_tailcallinfo_offset(ctx)));
+		/*
+		 * From ...(1) above:
+		 * trampoline_frame_bottom =                            ...(2)
+		 *     func_frame_offset - bpf_dummy_frame_size
+		 *
+		 * Using ...(2) derived above:
+		 *  trampoline_tail_call_info_offset =                  ...(3)
+		 *      trampoline_frame_bottom - tailcallinfo_offset
+		 *
+		 * From ...(3):
+		 * Use trampoline_tail_call_info_offset to write reference of main's
+		 * tail_call_info in trampoline frame.
+		 */
+		EMIT(PPC_RAW_STL(_R3, _R1, (func_frame_offset - bpf_dummy_frame_size)
+					- tailcallinfo_offset));
 
-		EMIT(PPC_RAW_LL(_R3, _R1, -tailcallcnt_offset));
-		EMIT(PPC_RAW_STL(_R3, _R1, func_frame_offset - tailcallcnt_offset));
 	} else {
 		/* See bpf_jit_stack_offsetof() and BPF_PPC_TC */
-		EMIT(PPC_RAW_STL(_R4, _R1, r4_off));
+		EMIT(PPC_RAW_LL(_R4, _R1, r4_off));
 	}
 }
 
@@ -720,6 +745,7 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 	 * LR save area                 [ r0 save (64-bit)  ]   | header
 	 *                              [ r0 save (32-bit)  ]   |
 	 * dummy frame for unwind       [ back chain 1      ] --
+	 *                              [ tail_call_info    ] non optional - 64-bit powerpc
 	 *                              [ padding           ] align stack frame
 	 *       r4_off                 [ r4 (tailcallcnt)  ] optional - 32-bit powerpc
 	 *       alt_lr_off             [ real lr (ool stub)] optional - actual lr
@@ -801,8 +827,14 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 		}
 	}
 
-	/* Padding to align stack frame, if any */
-	bpf_frame_size = round_up(bpf_frame_size, SZL * 2);
+	if (!(bpf_frame_size % (2 * SZL))) {
+		/* Stack is 16-byte aligned */
+		/* Room for padding followed by 64-bit tail_call_info */
+		bpf_frame_size += SZL + BPF_PPC_TAILCALL;
+	} else {
+		/* Room for 64-bit tail_call_info */
+		bpf_frame_size += BPF_PPC_TAILCALL;
+	}
 
 	/* Dummy frame size for proper unwind - includes 64-bytes red zone for 64-bit powerpc */
 	bpf_dummy_frame_size = STACK_FRAME_MIN_SIZE + 64;
@@ -902,7 +934,8 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 
 		/* Replicate tail_call_cnt before calling the original BPF prog */
 		if (flags & BPF_TRAMP_F_TAIL_CALL_CTX)
-			bpf_trampoline_setup_tail_call_cnt(image, ctx, func_frame_offset, r4_off);
+			bpf_trampoline_setup_tail_call_info(image, ctx, func_frame_offset,
+							   bpf_dummy_frame_size, r4_off);
 
 		/* Restore args */
 		bpf_trampoline_restore_args_stack(image, ctx, func_frame_offset, nr_regs, regs_off);
@@ -917,10 +950,6 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
 		/* Store return value for bpf prog to access */
 		EMIT(PPC_RAW_STL(_R3, _R1, retval_off));
 
-		/* Restore updated tail_call_cnt */
-		if (flags & BPF_TRAMP_F_TAIL_CALL_CTX)
-			bpf_trampoline_restore_tail_call_cnt(image, ctx, func_frame_offset, r4_off);
-
 		/* Reserve space to patch branch instruction to skip fexit progs */
 		if (ro_image) /* image is NULL for dummy pass */
 			im->ip_after_call = &((u32 *)ro_image)[ctx->idx];
-- 
2.48.1


