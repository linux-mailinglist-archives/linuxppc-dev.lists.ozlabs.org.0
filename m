Return-Path: <linuxppc-dev+bounces-17567-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHMwKBHcpmnRXwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17567-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 14:03:13 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 813A71EFD30
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 14:03:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQGDj3xFFz3cDg;
	Wed, 04 Mar 2026 00:02:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772542965;
	cv=none; b=AyIUQFiicXh22YTu72wOA+DD6D8itFYXSdqIFsRxrSF58tPII/B2RiZltL+aQX+XMTMYrDLQhauqkHGSf6hCXSFq0uL0HqhDW/RXQlUnjiVM5HKSAv5KYkTp4RrKaXydeFlQuQe8gE9dWYg4eIy2KeCzLJpdqIcR0KByXFRAfTMbIsbP03QX2RBmI4Za9dkuYXfYOUtZcVXtziKMTCdRCpalwOLdk0dLCDs+Nx0SCN79QUj9pVnwFb53JY+jz+3xxksfnZhsXSLQ6OuuVYFM+nEM1+GXF3IBF4aomyBU7UU770CQXYtWp/MUFUDUZTa6r4RYAXUIs3S6Ysvhu0nR3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772542965; c=relaxed/relaxed;
	bh=CvRuULbh9UCyQxvb66fdtNibWfdV6kqPGT7RTWisaMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F1fz/qsQ2sa+7OpSn/sQXRO1HnERDJzfeLfV1Kf4H7Yz1H6aWkj55nndLWkXeYfQcejSrD87dcPoVPSSRquJut1C2pmVjKQIO6UC/JfTmPF94hGvwOABamgHLFT+YFgwBduvaFLq4zMtqJgE2ZvAoeHv4VruCM8xItE9W3WSjPWePd1sl3d9ImOvXnbIHCBZthJhO0YKyPTq53DbqfWYkRMo3r72AXqbTfxCZlJ7Slp7htKSuVL5RLDQPTp12+QXmPXKmyE/Fb7KkNkDQQqCUT7CfAEZUbLSbSchaXtpXTckQkX6qeSGnY06g+2KJy0kvw0OPcw08KHqL4KSRTtNlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=apLWm+xO; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=apLWm+xO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQGDh5jTgz3cBT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 00:02:44 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6233xRkI2094170;
	Tue, 3 Mar 2026 13:02:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=CvRuULbh9UCyQxvb6
	6fdtNibWfdV6kqPGT7RTWisaMg=; b=apLWm+xOGHVqABAJFDJD1kCSjVHR6MF75
	6tVW0ezn9UwkY3RAePhAEfnsdvhllipXN9JM6EaAiH6Xpg3+2Z6fNj493HDKgbTe
	vw6hHxO+J6Zs6o38E3h5RJrld8YYO4TR5k7eJEiTkm3Oq71uvAJOqi0uvoDU35y1
	AuvNepE0Mx2X0WFJc9FF0bCORM9KfftNJ4VKurXLlHm/CHoY7lvMuAjyA134W+v/
	1lv2MzxWTOkZtGies3Lsy3fWoVZJjpxE7J0kx7pLHedZwmDxKvdFBkG+o82P419G
	U1rFKDVgGHYog+3FMGe4ZlL4SqeY/ne11n9cfbOy2ba+MYcWDQX/w==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ckskctys6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 13:02:29 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 623BjisK008782;
	Tue, 3 Mar 2026 13:02:29 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cmdd19xxt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 13:02:28 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 623D2P2L48234866
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Mar 2026 13:02:25 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28DBF2004B;
	Tue,  3 Mar 2026 13:02:25 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1BF8720043;
	Tue,  3 Mar 2026 13:02:23 +0000 (GMT)
Received: from li-bd3f974c-2712-11b2-a85c-df1cec4d728e.in.ibm.com (unknown [9.78.106.17])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Mar 2026 13:02:22 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: bpf@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Saket Kumar Bhaskar <skb99@linux.ibm.com>,
        Abhishek Dubey <adubey@linux.ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>, stable@vger.kernel.org
Subject: [PATCH v3 6/6] powerpc64/bpf: fix kfunc call support
Date: Tue,  3 Mar 2026 18:32:08 +0530
Message-ID: <20260303130208.325249-7-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303130208.325249-1-hbathini@linux.ibm.com>
References: <20260303130208.325249-1-hbathini@linux.ibm.com>
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
X-Proofpoint-GUID: Kmc_seossRwssWuUqkbXQ26MaVC5x2ED
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA5OSBTYWx0ZWRfX6yCajZ3eWjz3
 SeUF/Tg5pHN2RFWn3IxSaeeafcxgpG6TVZYadc7W6kX36B+PM8TVwvWFS9QYmOj/7Xpd8DpQskT
 ycdfaDMO+cqGkeqe8GHwxC2lHqK8jL66eIhXkI31r/Va6cCVtG9OE7N+zeL+r9T4+5T6eOffijA
 Xj+spKNfwaiqDnby5uwkEfO0BdWwhFWKJ2YuS/RQMH9eQ0TrkfPOoQ1gM5PW567EFaijO8H4ndl
 3QDYNIbU37mPHUK87JCuXKHVw+6ZCNw8UamF3udGazbX/Lbd4+QJY4IgNVroPMltunLrAMOeTF1
 j2Ai9AwEC0lphuMietZasfEo3Rol/nqqLBfh0DUKYM40iGsQdqiibbxKc0wtxhju4F+YMnO+gpS
 UzE0id89ddysPCBM4XgCISQYrX5B1k3HxrTfZwSyg5PGdBhZNr23sqQ8RmWUmfjXmwAhG3Zcf3K
 EHt+A7k5vZ67k/1sXow==
X-Authority-Analysis: v=2.4 cv=H7DWAuYi c=1 sm=1 tr=0 ts=69a6dbe6 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=uAbxVGIbfxUO_5tXvNgY:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=cgMUl_j-H115-_3Hw7UA:9
X-Proofpoint-ORIG-GUID: Kmc_seossRwssWuUqkbXQ26MaVC5x2ED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030099
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 813A71EFD30
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17567-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Commit 61688a82e047 ("powerpc/bpf: enable kfunc call") inadvertently
enabled kfunc call support for 32-bit powerpc but that support will
not be possible until ABI mismatch between 32-bit powerpc and eBPF is
handled in 32-bit powerpc JIT code. Till then, advertise support only
for 64-bit powerpc. Also, in powerpc ABI, caller needs to extend the
arguments properly based on signedness. The JIT code is responsible
for handling this explicitly for kfunc calls as verifier can't handle
this for each architecture-specific ABI needs. But this was not taken
care of while kfunc call support was enabled for powerpc. Fix it by
handling this with bpf_jit_find_kfunc_model() and using zero_extend()
& sign_extend() helper functions.

Fixes: 61688a82e047 ("powerpc/bpf: enable kfunc call")
Cc: stable@vger.kernel.org
Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v3:
- New patch to fix kfunc call ABI issue on powerpc while passing arguments.


 arch/powerpc/net/bpf_jit_comp.c   |   2 +-
 arch/powerpc/net/bpf_jit_comp64.c | 101 +++++++++++++++++++++++++++---
 2 files changed, 94 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 85457bcb2040..a62a9a92b7b5 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -450,7 +450,7 @@ bool bpf_jit_supports_subprog_tailcalls(void)
 
 bool bpf_jit_supports_kfunc_call(void)
 {
-	return true;
+	return IS_ENABLED(CONFIG_PPC64);
 }
 
 bool bpf_jit_supports_arena(void)
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 04e76440d1ad..3a6bd12eecfd 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -499,6 +499,83 @@ int bpf_jit_emit_func_call_rel(u32 *image, u32 *fimage, struct codegen_context *
 	return 0;
 }
 
+static int zero_extend(u32 *image, struct codegen_context *ctx, u32 src_reg, u32 dst_reg, u32 size)
+{
+	switch (size) {
+	case 1:
+		 /* zero-extend 8 bits into 64 bits */
+		EMIT(PPC_RAW_RLDICL(dst_reg, dst_reg, 0, 56));
+		return 0;
+	case 2:
+		 /* zero-extend 16 bits into 64 bits */
+		EMIT(PPC_RAW_RLDICL(dst_reg, dst_reg, 0, 48));
+		return 0;
+	case 4:
+		 /* zero-extend 32 bits into 64 bits */
+		EMIT(PPC_RAW_RLDICL(dst_reg, dst_reg, 0, 32));
+		fallthrough;
+	case 8:
+		/* Nothing to do */
+		return 0;
+	default:
+		return -1;
+	}
+}
+
+static int sign_extend(u32 *image, struct codegen_context *ctx, u32 src_reg, u32 dst_reg, u32 size)
+{
+	switch (size) {
+	case 1:
+		 /* sign-extend 8 bits into 64 bits */
+		EMIT(PPC_RAW_EXTSB(dst_reg, src_reg));
+		return 0;
+	case 2:
+		 /* sign-extend 16 bits into 64 bits */
+		EMIT(PPC_RAW_EXTSH(dst_reg, src_reg));
+		return 0;
+	case 4:
+		 /* sign-extend 32 bits into 64 bits */
+		EMIT(PPC_RAW_EXTSW(dst_reg, src_reg));
+		fallthrough;
+	case 8:
+		/* Nothing to do */
+		return 0;
+	default:
+		return -1;
+	}
+}
+
+/*
+ * Handle powerpc ABI expectations from caller:
+ *   - Unsigned arguments are zero-extended.
+ *   - Signed arguments are sign-extended.
+ */
+static int prepare_for_kfunc_call(const struct bpf_prog *fp, u32 *image,
+				  struct codegen_context *ctx,
+				  const struct bpf_insn *insn)
+{
+	const struct btf_func_model *m = bpf_jit_find_kfunc_model(fp, insn);
+	int i;
+
+	if (!m)
+		return -1;
+
+	for (i = 0; i < m->nr_args; i++) {
+		/* Note that BPF ABI only allows up to 5 args for kfuncs */
+		u32 reg = bpf_to_ppc(BPF_REG_1 + i), size = m->arg_size[i];
+
+		if (!(m->arg_flags[i] & BTF_FMODEL_SIGNED_ARG)) {
+			if (zero_extend(image, ctx, reg, reg, size))
+				return -1;
+		} else {
+			if (sign_extend(image, ctx, reg, reg, size))
+				return -1;
+		}
+	}
+
+	return 0;
+}
+
 static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
 {
 	/*
@@ -1143,14 +1220,16 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 				/* special mov32 for zext */
 				EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg, 0, 0, 31));
 				break;
-			} else if (off == 8) {
-				EMIT(PPC_RAW_EXTSB(dst_reg, src_reg));
-			} else if (off == 16) {
-				EMIT(PPC_RAW_EXTSH(dst_reg, src_reg));
-			} else if (off == 32) {
-				EMIT(PPC_RAW_EXTSW(dst_reg, src_reg));
-			} else if (dst_reg != src_reg)
-				EMIT(PPC_RAW_MR(dst_reg, src_reg));
+			}
+			if (off == 0) {
+				/* MOV */
+				if (dst_reg != src_reg)
+					EMIT(PPC_RAW_MR(dst_reg, src_reg));
+			} else {
+				/* MOVSX: dst = (s8,s16,s32)src (off = 8,16,32) */
+				if (sign_extend(image, ctx, src_reg, dst_reg, off / 8))
+					return -1;
+			}
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_MOV | BPF_K: /* (u32) dst = imm */
 		case BPF_ALU64 | BPF_MOV | BPF_K: /* dst = (s64) imm */
@@ -1618,6 +1697,12 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 			if (ret < 0)
 				return ret;
 
+			/* Take care of powerpc ABI requirements before kfunc call */
+			if (insn[i].src_reg == BPF_PSEUDO_KFUNC_CALL) {
+				if (prepare_for_kfunc_call(fp, image, ctx, &insn[i]))
+					return -1;
+			}
+
 			ret = bpf_jit_emit_func_call_rel(image, fimage, ctx, func_addr);
 			if (ret)
 				return ret;
-- 
2.53.0


