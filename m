Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3184B4863F2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 12:51:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JV4SC03pnz3dcn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 22:51:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rxnMxSU1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rxnMxSU1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JV4M46bV8z30LQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jan 2022 22:46:40 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 206ArW8a009338; 
 Thu, 6 Jan 2022 11:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6UW4MXR2buz4trUsOQRenA9i1fmsZkGIk/NOYE4alyY=;
 b=rxnMxSU1NjOMbmmdjG3Ip2VYgotqGVC0djjoCorEs27LBRNRQGretZn9+aIK7S5Uecfl
 FKaM4yzPncqOhnIwyBhRiNa8ORJoDSeaDYIE920c/G7fpW0rX5p/OlX32ur3+0SiHYUa
 L4+nvTl/s7cf4sIs4dzTD7nT70gSaFHsa4OoLhOv/Qi5j3rnF/OEGZhpk6ukmz5euj12
 sQCVinHs2mSg6eIppkCtVik2CBIJuj96DEWXILr/NiGGcgUlOHviYHDYFuiBDiEPG3Ty
 w0vpaxaN4P7CiJlnoV1TZYqICueRDXZdRnRoaaDcXIJmizWbleXjHPmy/rtmIbLUz4YR sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ddy2cgwdx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 11:46:21 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 206BkLAp015083;
 Thu, 6 Jan 2022 11:46:21 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ddy2cgwd5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 11:46:21 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 206BhnE1024813;
 Thu, 6 Jan 2022 11:46:18 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3ddmsvmrj0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 11:46:18 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 206BkFl044499300
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jan 2022 11:46:15 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D7C9A4054;
 Thu,  6 Jan 2022 11:46:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6928CA4067;
 Thu,  6 Jan 2022 11:46:11 +0000 (GMT)
Received: from naverao1-tp.ibm.com (unknown [9.43.91.118])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jan 2022 11:46:11 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>
Subject: [PATCH 06/13] powerpc/bpf: Emit a single branch instruction for known
 short branch ranges
Date: Thu,  6 Jan 2022 17:15:10 +0530
Message-Id: <dc31060f18d0cc197eabd842879a952e123ce52f.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1641468127.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YAvPaa84uKlB5Ep5h_E4Y-oRJdsgoatu
X-Proofpoint-GUID: 4bu4lbQFDGqYihq1kClXq-kyc6v5InAp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_04,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=792 clxscore=1015 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2112160000 definitions=main-2201060081
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
Cc: ykaliuta@redhat.com, johan.almbladh@anyfinetworks.com,
 linuxppc-dev@lists.ozlabs.org, song@kernel.org, bpf@vger.kernel.org,
 Jiri Olsa <jolsa@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PPC_BCC() emits two instructions to accommodate scenarios where we need
to branch outside the range of a conditional branch. PPC_BCC_SHORT()
emits a single branch instruction and can be used when the branch is
known to be within a conditional branch range.

Convert some of the uses of PPC_BCC() in the powerpc BPF JIT over to
PPC_BCC_SHORT() where we know the branch range.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp32.c | 8 ++++----
 arch/powerpc/net/bpf_jit_comp64.c | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index 2258d3886d02ec..72c2c47612964d 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -221,7 +221,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	EMIT(PPC_RAW_LWZ(_R0, b2p_bpf_array, offsetof(struct bpf_array, map.max_entries)));
 	EMIT(PPC_RAW_CMPLW(b2p_index, _R0));
 	EMIT(PPC_RAW_LWZ(_R0, _R1, bpf_jit_stack_offsetof(ctx, BPF_PPC_TC)));
-	PPC_BCC(COND_GE, out);
+	PPC_BCC_SHORT(COND_GE, out);
 
 	/*
 	 * if (tail_call_cnt > MAX_TAIL_CALL_CNT)
@@ -230,7 +230,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	EMIT(PPC_RAW_CMPLWI(_R0, MAX_TAIL_CALL_CNT));
 	/* tail_call_cnt++; */
 	EMIT(PPC_RAW_ADDIC(_R0, _R0, 1));
-	PPC_BCC(COND_GT, out);
+	PPC_BCC_SHORT(COND_GT, out);
 
 	/* prog = array->ptrs[index]; */
 	EMIT(PPC_RAW_RLWINM(_R3, b2p_index, 2, 0, 29));
@@ -243,7 +243,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	 *   goto out;
 	 */
 	EMIT(PPC_RAW_CMPLWI(_R3, 0));
-	PPC_BCC(COND_EQ, out);
+	PPC_BCC_SHORT(COND_EQ, out);
 
 	/* goto *(prog->bpf_func + prologue_size); */
 	EMIT(PPC_RAW_LWZ(_R3, _R3, offsetof(struct bpf_prog, bpf_func)));
@@ -834,7 +834,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			if (BPF_MODE(code) == BPF_PROBE_MEM) {
 				PPC_LI32(_R0, TASK_SIZE - off);
 				EMIT(PPC_RAW_CMPLW(src_reg, _R0));
-				PPC_BCC(COND_GT, (ctx->idx + 5) * 4);
+				PPC_BCC_SHORT(COND_GT, (ctx->idx + 4) * 4);
 				EMIT(PPC_RAW_LI(dst_reg, 0));
 				/*
 				 * For BPF_DW case, "li reg_h,0" would be needed when
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 3d018ecc475b2b..2b291d435d2e26 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -225,7 +225,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	EMIT(PPC_RAW_LWZ(b2p[TMP_REG_1], b2p_bpf_array, offsetof(struct bpf_array, map.max_entries)));
 	EMIT(PPC_RAW_RLWINM(b2p_index, b2p_index, 0, 0, 31));
 	EMIT(PPC_RAW_CMPLW(b2p_index, b2p[TMP_REG_1]));
-	PPC_BCC(COND_GE, out);
+	PPC_BCC_SHORT(COND_GE, out);
 
 	/*
 	 * if (tail_call_cnt > MAX_TAIL_CALL_CNT)
@@ -233,7 +233,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	 */
 	PPC_BPF_LL(b2p[TMP_REG_1], 1, bpf_jit_stack_tailcallcnt(ctx));
 	EMIT(PPC_RAW_CMPLWI(b2p[TMP_REG_1], MAX_TAIL_CALL_CNT));
-	PPC_BCC(COND_GT, out);
+	PPC_BCC_SHORT(COND_GT, out);
 
 	/*
 	 * tail_call_cnt++;
@@ -251,7 +251,7 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	 *   goto out;
 	 */
 	EMIT(PPC_RAW_CMPLDI(b2p[TMP_REG_1], 0));
-	PPC_BCC(COND_EQ, out);
+	PPC_BCC_SHORT(COND_EQ, out);
 
 	/* goto *(prog->bpf_func + prologue_size); */
 	PPC_BPF_LL(b2p[TMP_REG_1], b2p[TMP_REG_1], offsetof(struct bpf_prog, bpf_func));
@@ -803,7 +803,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				else /* BOOK3S_64 */
 					PPC_LI64(b2p[TMP_REG_2], PAGE_OFFSET);
 				EMIT(PPC_RAW_CMPLD(b2p[TMP_REG_1], b2p[TMP_REG_2]));
-				PPC_BCC(COND_GT, (ctx->idx + 4) * 4);
+				PPC_BCC_SHORT(COND_GT, (ctx->idx + 3) * 4);
 				EMIT(PPC_RAW_LI(dst_reg, 0));
 				/*
 				 * Check if 'off' is word aligned because PPC_BPF_LL()
-- 
2.34.1

