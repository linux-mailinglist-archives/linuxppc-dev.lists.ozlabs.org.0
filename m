Return-Path: <linuxppc-dev+bounces-11494-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69445B3C13B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 18:53:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cD48R2TB1z2yt0;
	Sat, 30 Aug 2025 02:53:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756486391;
	cv=none; b=dFqdi2GDS+s880mcVQlK81/1Yk43UFFWRHIXYnhjyOk1bOrUEEYVIg2WyHG9M60GvB1lwWN7+jjjbBXcwHbqZUTc+73Gmq3mk584QxW1pa2snjbTAaILCJ9NeM186TAIBACg2WxLNgkT+r6d9900W37nsgylWPK/IH92oTxb5J7+xpPERcvtDIRYsKF2u4wLjx6/eybqXio0RqiBxCwNuPmqYNc8agJ6RSEbQPJ80kM/c7QpejczgVwwgH+bIhzyQwWAFNvb+mrrw2m+AEBp4M4XkPF5NQMSwR2tnJSIA1xkOAy003RhW3i9S3PzhVg3T/umM0yBV/n7SdS5dQWCLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756486391; c=relaxed/relaxed;
	bh=US1ykTnydS37YdpxLH/NRYLU0J9OvOWyeqm75mdVxss=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jkYB79mFelSvjizhOWLngIHKwQ11+g5YqYzLLqTNI6M8QQ6cwK6sDnQJ7SxFNszX1MxA6VJ6bwCKvCIL1/tER7ip/JOw5Kb2VkWSaiUecuAEeCobcJBKc/Qv8LtH/7rV831DkJofuYo6I+RLqobg/DtVkCMikejz+gjEWhcUtjZT3LvI62cWfHKywp1ZHkNEf3oeqgCVIRlXWFCJrxIPHFfgbimo1B6z3D7NiVi9BLnjdZN9cnEeQmqX3HzAcY0XH3puIDV1O32bzOf7glthGjxAdSgIDxihTR7F1RaFRp2J4vxv04VKCrJw8RCocpN4EC9tv9olX53Y10SjKHqUvQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oOFOxHW6; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oOFOxHW6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cD48Q4J6Kz2ysc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 02:53:10 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T9IMAb020783;
	Fri, 29 Aug 2025 16:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=US1ykTnydS37YdpxL
	H/NRYLU0J9OvOWyeqm75mdVxss=; b=oOFOxHW6UQ1VOS/5PxqDQUXlzrM6uGLHW
	L0Lb9lo4Ow5DENHPcOt63f0C+NJONb4NvmNk+dsFzalohuyGkDIS15w+kx+CDeKP
	Uaxc66r5WmJdBfxWL35xhHlZrtgxBpZjkj6YehpTIQ9/359jT/t3RSPe70fgv+Se
	xeTpqJAunt5H7DiF5rDCllsec+LdexgHIgO6ZvZ5jEzHspe8MbhPsDg4XdNyJ3tt
	9VcfmBBMOwJCh1BB/SlGGwiqhrY/qzDf+zmbF7IBA0d5cpo6zOIQzEBXuBoY7nMN
	idxEUKnOTHJsflzPXKzLmYHkSX8lX2uZe8mNDWOwl2hiHmD0ABVQQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hqge97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 16:52:38 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57TGm3kc007296;
	Fri, 29 Aug 2025 16:52:38 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hqge93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 16:52:38 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57TDA6Hc017993;
	Fri, 29 Aug 2025 16:52:37 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qtp3tbuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 16:52:37 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57TGqXAt19267918
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 16:52:33 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34BBF2004B;
	Fri, 29 Aug 2025 16:52:33 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4331A20040;
	Fri, 29 Aug 2025 16:52:21 +0000 (GMT)
Received: from li-621bac4c-27c7-11b2-a85c-c2bf7c4b3c07.ibm.com.com (unknown [9.43.115.92])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Aug 2025 16:52:20 +0000 (GMT)
From: Saket Kumar Bhaskar <skb99@linux.ibm.com>
To: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
        andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
        daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
        yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
        sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
        christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, memxor@gmail.com,
        iii@linux.ibm.com, shuah@kernel.org
Subject: [PATCH bpf-next v2 3/5] powerpc64/bpf: Introduce bpf_jit_emit_atomic_ops() to emit atomic instructions
Date: Fri, 29 Aug 2025 22:21:33 +0530
Message-ID: <20250829165135.1273071-4-skb99@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250829165135.1273071-1-skb99@linux.ibm.com>
References: <20250829165135.1273071-1-skb99@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfX2ILk7wBD7g+Y
 GslsxRI+rLEozL5ucqE3avuo3YRYQJHulr2KjmsyFrUZlK1ta2LvRvMBiepZAosQMObKNZi3ly4
 MeD8Ii9j7hl5Ya8LgiUzXNzlQ4jB9SBw9arGihNsPGgnEWhZc56h0HQNRR5varzw1dLwgS9iMcy
 MExRYjQHkCV9twhPyvmLGzHEfUV49mp5SdgaFTnno/Cqj06DsnLD5erVVyDMD8HgckHV9CS9bs0
 BzK+z2TDB9K9d8aXxOVWx+6cYLSAcyx7ynOXBmq+fuj4GGLesNilky5cZkT7OFamM4Dq++zMzvw
 9gqajM9xyrK4eWqJD7Dqn+az3UDf+At/rWCqmY8O4afCOp25wPrFdAD0Xznne+268lQPg4B/Mrl
 St2p5CB5
X-Proofpoint-ORIG-GUID: BKV-v_1sfawB60GC5GYuAb0XnX0OfXwN
X-Proofpoint-GUID: 3hMKP4GSNXj3in_mbOPTI-Jg1D73uiw9
X-Authority-Analysis: v=2.4 cv=Ndbm13D4 c=1 sm=1 tr=0 ts=68b1dad7 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=mLi99PhJ1kaOFlELNpEA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The existing code for emitting bpf atomic instruction sequences for
atomic operations such as XCHG, CMPXCHG, ADD, AND, OR, and XOR has been
refactored into a reusable function, bpf_jit_emit_ppc_atomic_op().
It also computes the jump offset and tracks the instruction index for jited
LDARX/LWARX to be used in case it causes a fault.

Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp64.c | 203 +++++++++++++++++-------------
 1 file changed, 115 insertions(+), 88 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 76efb47f02a6..cb4d1e954961 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -423,6 +423,111 @@ asm (
 "		blr				;"
 );
 
+static int bpf_jit_emit_atomic_ops(u32 *image, struct codegen_context *ctx,
+				   const struct bpf_insn *insn, u32 *jmp_off,
+				   u32 *tmp_idx, u32 *addrp)
+{
+	u32 tmp1_reg = bpf_to_ppc(TMP_REG_1);
+	u32 tmp2_reg = bpf_to_ppc(TMP_REG_2);
+	u32 size = BPF_SIZE(insn->code);
+	u32 src_reg = bpf_to_ppc(insn->src_reg);
+	u32 dst_reg = bpf_to_ppc(insn->dst_reg);
+	s32 imm = insn->imm;
+
+	u32 save_reg = tmp2_reg;
+	u32 ret_reg = src_reg;
+	u32 fixup_idx;
+
+	/* Get offset into TMP_REG_1 */
+	EMIT(PPC_RAW_LI(tmp1_reg, insn->off));
+       /*
+	* Enforce full ordering for operations with BPF_FETCH by emitting a 'sync'
+	* before and after the operation.
+	*
+	* This is a requirement in the Linux Kernel Memory Model.
+	* See __cmpxchg_u64() in asm/cmpxchg.h as an example.
+	*/
+	if ((imm & BPF_FETCH) && IS_ENABLED(CONFIG_SMP))
+		EMIT(PPC_RAW_SYNC());
+
+	*tmp_idx = ctx->idx;
+
+	/* load value from memory into TMP_REG_2 */
+	if (size == BPF_DW)
+		EMIT(PPC_RAW_LDARX(tmp2_reg, tmp1_reg, dst_reg, 0));
+	else
+		EMIT(PPC_RAW_LWARX(tmp2_reg, tmp1_reg, dst_reg, 0));
+	/* Save old value in _R0 */
+	if (imm & BPF_FETCH)
+		EMIT(PPC_RAW_MR(_R0, tmp2_reg));
+
+	switch (imm) {
+	case BPF_ADD:
+	case BPF_ADD | BPF_FETCH:
+		EMIT(PPC_RAW_ADD(tmp2_reg, tmp2_reg, src_reg));
+		break;
+	case BPF_AND:
+	case BPF_AND | BPF_FETCH:
+		EMIT(PPC_RAW_AND(tmp2_reg, tmp2_reg, src_reg));
+		break;
+	case BPF_OR:
+	case BPF_OR | BPF_FETCH:
+		EMIT(PPC_RAW_OR(tmp2_reg, tmp2_reg, src_reg));
+		break;
+	case BPF_XOR:
+	case BPF_XOR | BPF_FETCH:
+		EMIT(PPC_RAW_XOR(tmp2_reg, tmp2_reg, src_reg));
+		break;
+	case BPF_CMPXCHG:
+	       /*
+		* Return old value in BPF_REG_0 for BPF_CMPXCHG &
+		* in src_reg for other cases.
+		*/
+		ret_reg = bpf_to_ppc(BPF_REG_0);
+
+		/* Compare with old value in BPF_R0 */
+		if (size == BPF_DW)
+			EMIT(PPC_RAW_CMPD(bpf_to_ppc(BPF_REG_0), tmp2_reg));
+		else
+			EMIT(PPC_RAW_CMPW(bpf_to_ppc(BPF_REG_0), tmp2_reg));
+		/* Don't set if different from old value */
+		PPC_BCC_SHORT(COND_NE, (ctx->idx + 3) * 4);
+		fallthrough;
+	case BPF_XCHG:
+		save_reg = src_reg;
+		break;
+	default:
+		return -EOPNOTSUPP;
+	}
+
+	/* store new value */
+	if (size == BPF_DW)
+		EMIT(PPC_RAW_STDCX(save_reg, tmp1_reg, dst_reg));
+	else
+		EMIT(PPC_RAW_STWCX(save_reg, tmp1_reg, dst_reg));
+	/* we're done if this succeeded */
+	PPC_BCC_SHORT(COND_NE, *tmp_idx * 4);
+	fixup_idx = ctx->idx;
+
+	if (imm & BPF_FETCH) {
+		/* Emit 'sync' to enforce full ordering */
+		if (IS_ENABLED(CONFIG_SMP))
+			EMIT(PPC_RAW_SYNC());
+		EMIT(PPC_RAW_MR(ret_reg, _R0));
+		/*
+		 * Skip unnecessary zero-extension for 32-bit cmpxchg.
+		 * For context, see commit 39491867ace5.
+		 */
+		if (size != BPF_DW && imm == BPF_CMPXCHG &&
+		    insn_is_zext(insn + 1))
+			*addrp = ctx->idx * 4;
+	}
+
+	*jmp_off = (fixup_idx - *tmp_idx) * 4;
+
+	return 0;
+}
+
 static int bpf_jit_emit_probe_mem_store(struct codegen_context *ctx, u32 src_reg, s16 off,
 					u32 code, u32 *image)
 {
@@ -538,7 +643,6 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		u32 size = BPF_SIZE(code);
 		u32 tmp1_reg = bpf_to_ppc(TMP_REG_1);
 		u32 tmp2_reg = bpf_to_ppc(TMP_REG_2);
-		u32 save_reg, ret_reg;
 		s16 off = insn[i].off;
 		s32 imm = insn[i].imm;
 		bool func_addr_fixed;
@@ -546,6 +650,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		u64 imm64;
 		u32 true_cond;
 		u32 tmp_idx;
+		u32 jmp_off;
 
 		/*
 		 * addrs[] maps a BPF bytecode address into a real offset from
@@ -1080,93 +1185,15 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 				return -EOPNOTSUPP;
 			}
 
-			save_reg = tmp2_reg;
-			ret_reg = src_reg;
-
-			/* Get offset into TMP_REG_1 */
-			EMIT(PPC_RAW_LI(tmp1_reg, off));
-			/*
-			 * Enforce full ordering for operations with BPF_FETCH by emitting a 'sync'
-			 * before and after the operation.
-			 *
-			 * This is a requirement in the Linux Kernel Memory Model.
-			 * See __cmpxchg_u64() in asm/cmpxchg.h as an example.
-			 */
-			if ((imm & BPF_FETCH) && IS_ENABLED(CONFIG_SMP))
-				EMIT(PPC_RAW_SYNC());
-			tmp_idx = ctx->idx * 4;
-			/* load value from memory into TMP_REG_2 */
-			if (size == BPF_DW)
-				EMIT(PPC_RAW_LDARX(tmp2_reg, tmp1_reg, dst_reg, 0));
-			else
-				EMIT(PPC_RAW_LWARX(tmp2_reg, tmp1_reg, dst_reg, 0));
-
-			/* Save old value in _R0 */
-			if (imm & BPF_FETCH)
-				EMIT(PPC_RAW_MR(_R0, tmp2_reg));
-
-			switch (imm) {
-			case BPF_ADD:
-			case BPF_ADD | BPF_FETCH:
-				EMIT(PPC_RAW_ADD(tmp2_reg, tmp2_reg, src_reg));
-				break;
-			case BPF_AND:
-			case BPF_AND | BPF_FETCH:
-				EMIT(PPC_RAW_AND(tmp2_reg, tmp2_reg, src_reg));
-				break;
-			case BPF_OR:
-			case BPF_OR | BPF_FETCH:
-				EMIT(PPC_RAW_OR(tmp2_reg, tmp2_reg, src_reg));
-				break;
-			case BPF_XOR:
-			case BPF_XOR | BPF_FETCH:
-				EMIT(PPC_RAW_XOR(tmp2_reg, tmp2_reg, src_reg));
-				break;
-			case BPF_CMPXCHG:
-				/*
-				 * Return old value in BPF_REG_0 for BPF_CMPXCHG &
-				 * in src_reg for other cases.
-				 */
-				ret_reg = bpf_to_ppc(BPF_REG_0);
-
-				/* Compare with old value in BPF_R0 */
-				if (size == BPF_DW)
-					EMIT(PPC_RAW_CMPD(bpf_to_ppc(BPF_REG_0), tmp2_reg));
-				else
-					EMIT(PPC_RAW_CMPW(bpf_to_ppc(BPF_REG_0), tmp2_reg));
-				/* Don't set if different from old value */
-				PPC_BCC_SHORT(COND_NE, (ctx->idx + 3) * 4);
-				fallthrough;
-			case BPF_XCHG:
-				save_reg = src_reg;
-				break;
-			default:
-				pr_err_ratelimited(
-					"eBPF filter atomic op code %02x (@%d) unsupported\n",
-					code, i);
-				return -EOPNOTSUPP;
-			}
-
-			/* store new value */
-			if (size == BPF_DW)
-				EMIT(PPC_RAW_STDCX(save_reg, tmp1_reg, dst_reg));
-			else
-				EMIT(PPC_RAW_STWCX(save_reg, tmp1_reg, dst_reg));
-			/* we're done if this succeeded */
-			PPC_BCC_SHORT(COND_NE, tmp_idx);
-
-			if (imm & BPF_FETCH) {
-				/* Emit 'sync' to enforce full ordering */
-				if (IS_ENABLED(CONFIG_SMP))
-					EMIT(PPC_RAW_SYNC());
-				EMIT(PPC_RAW_MR(ret_reg, _R0));
-				/*
-				 * Skip unnecessary zero-extension for 32-bit cmpxchg.
-				 * For context, see commit 39491867ace5.
-				 */
-				if (size != BPF_DW && imm == BPF_CMPXCHG &&
-				    insn_is_zext(&insn[i + 1]))
-					addrs[++i] = ctx->idx * 4;
+			ret = bpf_jit_emit_atomic_ops(image, ctx, &insn[i],
+						      &jmp_off, &tmp_idx, &addrs[i + 1]);
+			if (ret) {
+				if (ret == -EOPNOTSUPP) {
+					pr_err_ratelimited(
+						"eBPF filter atomic op code %02x (@%d) unsupported\n",
+						code, i);
+				}
+				return ret;
 			}
 			break;
 
-- 
2.43.5


