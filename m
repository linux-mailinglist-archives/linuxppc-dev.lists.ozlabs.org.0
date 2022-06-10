Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 798D75469F6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 17:59:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKQcg2j9Sz3drY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 01:58:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ASBtC/NZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ASBtC/NZ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKQYt6HRGz3byL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 01:56:34 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AFtrEf011189;
	Fri, 10 Jun 2022 15:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=SgpFwGA9RTkKfBKq1OguzDdqQthzqHGegbMtmXtjgWc=;
 b=ASBtC/NZaE4FWmn68UgoBgMFhIXXUSbUxVd+yGdutH9+61KY2cIR2sKEOMvZH1vzo75a
 H1JxtccPz68puCo/BTyBmQTuPobARSjJCuSDzQAfoN/C8sm/nh7ss1EIHC2FHstAP2gi
 0oqUj7iI4CeZsKLjTZXfNuAgR63LMQ1I1Ros+YhpbDxG2VdLQ1427Oi7gYE53yHWJcWW
 mThrldBhFfX4XHNsH2eZqw3/M0df36QJYrOeOkmwD7ipe5u5bjM/Uo5OUSL6wd+15cGM
 nk2o7KqmpViNCxBZL6JMadEJjfb9AFiMPSwnEKKbswVqGBmXSeSNs28kWQnPEKRIUNw9 eg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm91gr08m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 15:56:15 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25AFuEck011740;
	Fri, 10 Jun 2022 15:56:14 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm91gr080-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 15:56:14 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25AFoWb9021291;
	Fri, 10 Jun 2022 15:56:11 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04ams.nl.ibm.com with ESMTP id 3gfy19geew-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 15:56:11 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25AFu9e722413814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 15:56:09 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4296D4C040;
	Fri, 10 Jun 2022 15:56:09 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8E5434C044;
	Fri, 10 Jun 2022 15:56:05 +0000 (GMT)
Received: from hbathini-workstation.in.ibm.com (unknown [9.203.106.231])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 10 Jun 2022 15:56:05 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: bpf@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 3/5] bpf ppc64: Add instructions for atomic_[cmp]xchg
Date: Fri, 10 Jun 2022 21:25:50 +0530
Message-Id: <20220610155552.25892-4-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220610155552.25892-1-hbathini@linux.ibm.com>
References: <20220610155552.25892-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QBDuw1EA2QflXNjpUmrSV6cp1G3QdAKg
X-Proofpoint-ORIG-GUID: Xup1eUiqYZ7I8PmvCo8BMf9aJDJ2N6w7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 spamscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100061
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Yonghong Song <yhs@fb.com>, KP Singh <kpsingh@kernel.org>, Jordan Niethe <jniethe5@gmail.com>, Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds two atomic opcodes BPF_XCHG and BPF_CMPXCHG on ppc64, both
of which include the BPF_FETCH flag.  The kernel's atomic_cmpxchg
operation fundamentally has 3 operands, but we only have two register
fields. Therefore the operand we compare against (the kernel's API
calls it 'old') is hard-coded to be BPF_REG_R0. Also, kernel's
atomic_cmpxchg returns the previous value at dst_reg + off. JIT the
same for BPF too with return value put in BPF_REG_0.

  BPF_REG_R0 = atomic_cmpxchg(dst_reg + off, BPF_REG_R0, src_reg);

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v2:
* Moved variable declaration to avoid late declaration error on
  some compilers.
* Added an optimization for 32-bit cmpxchg with regard to
  commit see commit 39491867ace5.


 arch/powerpc/net/bpf_jit_comp64.c | 39 +++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index c53236b3a8b1..29ee306d6302 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -360,6 +360,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		u32 size = BPF_SIZE(code);
 		u32 tmp1_reg = bpf_to_ppc(TMP_REG_1);
 		u32 tmp2_reg = bpf_to_ppc(TMP_REG_2);
+		u32 save_reg, ret_reg;
 		s16 off = insn[i].off;
 		s32 imm = insn[i].imm;
 		bool func_addr_fixed;
@@ -778,6 +779,9 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		 */
 		case BPF_STX | BPF_ATOMIC | BPF_W:
 		case BPF_STX | BPF_ATOMIC | BPF_DW:
+			save_reg = tmp2_reg;
+			ret_reg = src_reg;
+
 			/* Get offset into TMP_REG_1 */
 			EMIT(PPC_RAW_LI(tmp1_reg, off));
 			tmp_idx = ctx->idx * 4;
@@ -808,6 +812,24 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			case BPF_XOR | BPF_FETCH:
 				EMIT(PPC_RAW_XOR(tmp2_reg, tmp2_reg, src_reg));
 				break;
+			case BPF_CMPXCHG:
+				/*
+				 * Return old value in BPF_REG_0 for BPF_CMPXCHG &
+				 * in src_reg for other cases.
+				 */
+				ret_reg = bpf_to_ppc(BPF_REG_0);
+
+				/* Compare with old value in BPF_R0 */
+				if (size == BPF_DW)
+					EMIT(PPC_RAW_CMPD(bpf_to_ppc(BPF_REG_0), tmp2_reg));
+				else
+					EMIT(PPC_RAW_CMPW(bpf_to_ppc(BPF_REG_0), tmp2_reg));
+				/* Don't set if different from old value */
+				PPC_BCC_SHORT(COND_NE, (ctx->idx + 3) * 4);
+				fallthrough;
+			case BPF_XCHG:
+				save_reg = src_reg;
+				break;
 			default:
 				pr_err_ratelimited(
 					"eBPF filter atomic op code %02x (@%d) unsupported\n",
@@ -817,15 +839,22 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 
 			/* store new value */
 			if (size == BPF_DW)
-				EMIT(PPC_RAW_STDCX(tmp2_reg, tmp1_reg, dst_reg));
+				EMIT(PPC_RAW_STDCX(save_reg, tmp1_reg, dst_reg));
 			else
-				EMIT(PPC_RAW_STWCX(tmp2_reg, tmp1_reg, dst_reg));
+				EMIT(PPC_RAW_STWCX(save_reg, tmp1_reg, dst_reg));
 			/* we're done if this succeeded */
 			PPC_BCC_SHORT(COND_NE, tmp_idx);
 
-			/* For the BPF_FETCH variant, get old value into src_reg */
-			if (imm & BPF_FETCH)
-				EMIT(PPC_RAW_MR(src_reg, _R0));
+			if (imm & BPF_FETCH) {
+				EMIT(PPC_RAW_MR(ret_reg, _R0));
+				/*
+				 * Skip unnecessary zero-extension for 32-bit cmpxchg.
+				 * For context, see commit 39491867ace5.
+				 */
+				if (size != BPF_DW && imm == BPF_CMPXCHG &&
+				    insn_is_zext(&insn[i + 1]))
+					addrs[++i] = ctx->idx * 4;
+			}
 			break;
 
 		/*
-- 
2.35.3

