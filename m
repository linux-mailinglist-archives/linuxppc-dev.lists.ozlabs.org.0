Return-Path: <linuxppc-dev+bounces-11493-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E82B3C139
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 18:53:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cD48J2H1Zz2yqm;
	Sat, 30 Aug 2025 02:53:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756486384;
	cv=none; b=XbYO/bNTbf65irrOLvWDNvuiII9k/FJLtWnR2uiTzoQzomi1fPxvDi2to6vRkKS0wEmMKLmEgkhqJmsQPz2SToc6KPZyyt05Ifm01LEa+XqXFjMqY9CJ6w/Hr4xXoWQw/MinMSwnbcnRKJzW8iSJlBkaicewFQZmqZHE5kiDX3eMzTW7Xb+/Lih0WfIk8OvgM6a5rLCP7X7ql6YmY5J3P3z39YeVci5cp46oAyU/9aBm7SPowJFTG70b4X+BIPnL0JiTYa229cL9+wtf9EuykWO73xWRQ3K4DCY5Eiy6pJxRRMTStGEYSUyunegi9qWVxSLe/CEvIdnYVmYt6xDN8g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756486384; c=relaxed/relaxed;
	bh=wnsvaFFQ+aUnebRO0K1Uqp8CvmGlNhUbsRzS3VrExeI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KQvXO6KUx5I/lwwx+9CYopdpfLYsfn6ZRDJsfQmGaQmsEdYdfOhPd+BWWvN5kla6JAuwuC4GvJcpSCAs0tgp0A4YPhlZ/IKfaNC/qRNJ4aRtYb5PEBu76RnwOZzlxOtwoBONIoRw3TbuFQnK4sDLCOuKxLh70v/urt3ucp/9IgmsXTAwmxUSbkOKbuV4w68fEOMSvk6hHnJgIIMxDOcDOwQRS0UiYzrX5mCLz1NLzrGo25Mi+54g/39e8brxLwHRn/6unazHuzKZXlYaVIOOb5JdXIxGrg2quI4kOsvzzlXPG37NnDYcAWsyQE03fKy5HXRvVnAiFi0OkXarDqaSvw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SLXSBEW8; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SLXSBEW8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=skb99@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cD48H4m4bz2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 02:53:03 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57T8HOic012917;
	Fri, 29 Aug 2025 16:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=wnsvaFFQ+aUnebRO0
	K1Uqp8CvmGlNhUbsRzS3VrExeI=; b=SLXSBEW8QRzawnjKz7cQ8SgL2p9ngnQ2W
	8oQP1c3GG2HinKTrmR+GE0dEAaHD6bQ1DJ/FHGNyVtAzwyI2MfUzuV5eozaeKP1C
	m7s2HhVpBS9I1TnPqH5RKMSFP444fI7RKZ9+WoNWv3ei6aS7ptDw3qlFSHusu/pc
	QleTpCMP+HZB8UW4xXponAAwqyxYDiQKDNTjb4ClIy70zAJNngE3eduHtdAucRSr
	Ztg4MhvJN7xmOGT4mGmkDiikVM/2I1f0+RRKdx+HJf5pvsYOvaRkn5JxLU7lyo8a
	q+yRcGJ0fgO4LSpS7gxqpgFv6sR8AQshf/5gcgbrZrPtX29bIqpKw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5aw0qjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 16:52:26 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57TGmj8M028213;
	Fri, 29 Aug 2025 16:52:25 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5aw0qjw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 16:52:25 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57TG9FeP002512;
	Fri, 29 Aug 2025 16:52:24 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qt6mtgep-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 16:52:24 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57TGqKFu52298104
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 16:52:20 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 737402004F;
	Fri, 29 Aug 2025 16:52:20 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AAF6F2004E;
	Fri, 29 Aug 2025 16:52:08 +0000 (GMT)
Received: from li-621bac4c-27c7-11b2-a85c-c2bf7c4b3c07.ibm.com.com (unknown [9.43.115.92])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Aug 2025 16:52:08 +0000 (GMT)
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
Subject: [PATCH bpf-next v2 2/5] powerpc64/bpf: Implement bpf_addr_space_cast instruction
Date: Fri, 29 Aug 2025 22:21:32 +0530
Message-ID: <20250829165135.1273071-3-skb99@linux.ibm.com>
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
X-Proofpoint-GUID: dzZZdhqd2D8mE_aD_yJfrmHuiLou2pmQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfX7fbYf2N605rw
 qRnzikqdP+kwjKFts0oNCrWC92z1xyPo4V+smSLhrG5FGRTPfir9fwSWfZ4QFH61iPEFCi2ygXV
 YUatwfhenBbCY3SQdwiSYKdtO+FEcygwcVqoxMLLPYsADYmmDV3+ZPD9W+HdJrzisWeIwblJRhX
 WAeqGMV2WcVzspuWW70mxFcde18yXUezNhQdmHu8X/gNQ4YiXsrWtjqKb1yfqGDlmToOAoZ1k8K
 1+Uso/DZmsWqwZ1H3lBRsC+dfArerj81uRTyPCYMk4iuKUqL4tFe/z7j62XHwVCd2Of/Gwzgi3g
 oPK75BL8EDAcfc7V9/Y7eZSkLr80wWySTqCqMOtn7sPCE6s0XxgarzzvJYHHzS3D860L8VMUZkH
 l8IC+YYb
X-Proofpoint-ORIG-GUID: 7gZXhimECLSHnbRWpBX8gVIyQXG2ljBB
X-Authority-Analysis: v=2.4 cv=SNNCVPvH c=1 sm=1 tr=0 ts=68b1daca cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=xX9FRuLrfezasQXAf7QA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

LLVM generates bpf_addr_space_cast instruction while translating
pointers between native (zero) address space and
__attribute__((address_space(N))). The addr_space=0 is reserved as
bpf_arena address space.

rY = addr_space_cast(rX, 0, 1) is processed by the verifier and
converted to normal 32-bit move: wX = wY.

rY = addr_space_cast(rX, 1, 0) : used to convert a bpf arena pointer to
a pointer in the userspace vma. This has to be converted by the JIT.

PPC_RAW_RLDICL_DOT, a variant of PPC_RAW_RLDICL is introduced to set
condition register as well.

Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h |  1 +
 arch/powerpc/net/bpf_jit.h            |  1 +
 arch/powerpc/net/bpf_jit_comp.c       |  6 ++++++
 arch/powerpc/net/bpf_jit_comp64.c     | 10 ++++++++++
 4 files changed, 18 insertions(+)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 8053b24afc39..55ca49d18319 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -571,6 +571,7 @@
 					(0x54000001 | ___PPC_RA(d) | ___PPC_RS(a) | __PPC_SH(i) | __PPC_MB(mb) | __PPC_ME(me))
 #define PPC_RAW_RLWIMI(d, a, i, mb, me) (0x50000000 | ___PPC_RA(d) | ___PPC_RS(a) | __PPC_SH(i) | __PPC_MB(mb) | __PPC_ME(me))
 #define PPC_RAW_RLDICL(d, a, i, mb)     (0x78000000 | ___PPC_RA(d) | ___PPC_RS(a) | __PPC_SH64(i) | __PPC_MB64(mb))
+#define PPC_RAW_RLDICL_DOT(d, a, i, mb) (0x78000000 | ___PPC_RA(d) | ___PPC_RS(a) | __PPC_SH64(i) | __PPC_MB64(mb) | 0x1)
 #define PPC_RAW_RLDICR(d, a, i, me)     (0x78000004 | ___PPC_RA(d) | ___PPC_RS(a) | __PPC_SH64(i) | __PPC_ME64(me))
 
 /* slwi = rlwinm Rx, Ry, n, 0, 31-n */
diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 2d095a873305..748e30e8b5b4 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -165,6 +165,7 @@ struct codegen_context {
 	unsigned int exentry_idx;
 	unsigned int alt_exit_addr;
 	u64 arena_vm_start;
+	u64 user_vm_start;
 };
 
 #define bpf_to_ppc(r)	(ctx->b2p[r])
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 7d070232159f..cfa84cab0a18 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -205,6 +205,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	/* Make sure that the stack is quadword aligned. */
 	cgctx.stack_size = round_up(fp->aux->stack_depth, 16);
 	cgctx.arena_vm_start = bpf_arena_get_kern_vm_start(fp->aux->arena);
+	cgctx.user_vm_start = bpf_arena_get_user_vm_start(fp->aux->arena);
 
 	/* Scouting faux-generate pass 0 */
 	if (bpf_jit_build_body(fp, NULL, NULL, &cgctx, addrs, 0, false)) {
@@ -439,6 +440,11 @@ bool bpf_jit_supports_kfunc_call(void)
 	return true;
 }
 
+bool bpf_jit_supports_arena(void)
+{
+	return IS_ENABLED(CONFIG_PPC64);
+}
+
 bool bpf_jit_supports_far_kfunc_call(void)
 {
 	return IS_ENABLED(CONFIG_PPC64);
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 569619f1b31c..76efb47f02a6 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -812,6 +812,16 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		 */
 		case BPF_ALU | BPF_MOV | BPF_X: /* (u32) dst = src */
 		case BPF_ALU64 | BPF_MOV | BPF_X: /* dst = src */
+
+			if (insn_is_cast_user(&insn[i])) {
+				EMIT(PPC_RAW_RLDICL_DOT(tmp1_reg, src_reg, 0, 32));
+				PPC_LI64(dst_reg, (ctx->user_vm_start & 0xffffffff00000000UL));
+				PPC_BCC_SHORT(COND_EQ, (ctx->idx + 2) * 4);
+				EMIT(PPC_RAW_OR(tmp1_reg, dst_reg, tmp1_reg));
+				EMIT(PPC_RAW_MR(dst_reg, tmp1_reg));
+				break;
+			}
+
 			if (imm == 1) {
 				/* special mov32 for zext */
 				EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg, 0, 0, 31));
-- 
2.43.5


