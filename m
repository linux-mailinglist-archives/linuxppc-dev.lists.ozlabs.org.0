Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5C152475B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 09:49:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KzP6w4YDMz3dP0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 May 2022 17:49:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZhY5eK31;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZhY5eK31; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KzP4B4q5vz3bxt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 May 2022 17:46:50 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24C6BqbD020435;
 Thu, 12 May 2022 07:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=zW69QzzKdn6pdlFyINgDJeQ9IV/TqDbLws5a/2XMiXE=;
 b=ZhY5eK31LX3VyXlJFEdNTR9JQo3IcDVlFYuyCvwCgKgMJAoQ6GECYjVbmNv1HzReOE4l
 djNgr7mCS5yxsHviuvq1CpeEDZ0mzSFQUXQ0ZoxrFjNR0ge3bll10Ic2UOIAcLRM6RxW
 j/qtQWj0HqdC3Thfs4QQKil2OeAPSCnl/P+H06N55sYfT/+BxtNxjoni344K2p3rOkCE
 yqhIC1RJS+Ag8KzIPWfaPa5DsfqMLspMrnFDhhtISDlwOx0580hqQg/dy05qD539vyUR
 JSYusyfCvaoYPowRTv76cTqCRdrE7BhbMVnhCk6CNqgpGS/Gon/Riw0eZHJN/Grzy+aS Og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g0vrnhpgn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 07:46:29 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24C7fQAK003894;
 Thu, 12 May 2022 07:46:28 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g0vrnhpg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 07:46:28 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24C7cDU3028748;
 Thu, 12 May 2022 07:46:26 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3fwgd8w5qu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 May 2022 07:46:26 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24C7kNE344368192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 May 2022 07:46:23 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1132A4051;
 Thu, 12 May 2022 07:46:23 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC729A404D;
 Thu, 12 May 2022 07:46:15 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.com (unknown [9.211.109.30])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 12 May 2022 07:46:15 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: bpf@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/5] bpf ppc64: Add instructions for atomic_[cmp]xchg
Date: Thu, 12 May 2022 13:15:44 +0530
Message-Id: <20220512074546.231616-4-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220512074546.231616-1-hbathini@linux.ibm.com>
References: <20220512074546.231616-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dq8kMBU5arO40FMNmGDzMnS6KZZX_aAy
X-Proofpoint-ORIG-GUID: xxorlEwL9ikIAJ6ni7lLw8Rh_YesTnoT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_07,2022-05-12_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 impostorscore=0 clxscore=1015 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205120034
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
Cc: Song Liu <songliubraving@fb.com>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, Alexei Starovoitov <ast@kernel.org>,
 Andrii Nakryiko <andrii@kernel.org>, netdev@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Yonghong Song <yhs@fb.com>,
 KP Singh <kpsingh@kernel.org>, Jordan Niethe <jniethe5@gmail.com>,
 Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
 arch/powerpc/net/bpf_jit_comp64.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 504fa459f9f3..df9e20b22ccb 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -783,6 +783,9 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		 */
 		case BPF_STX | BPF_ATOMIC | BPF_W:
 		case BPF_STX | BPF_ATOMIC | BPF_DW:
+			u32 save_reg = tmp2_reg;
+			u32 ret_reg = src_reg;
+
 			/* Get offset into TMP_REG_1 */
 			EMIT(PPC_RAW_LI(tmp1_reg, off));
 			tmp_idx = ctx->idx * 4;
@@ -813,6 +816,24 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
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
@@ -822,15 +843,14 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 
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
 			if (imm & BPF_FETCH)
-				EMIT(PPC_RAW_MR(src_reg, _R0));
+				EMIT(PPC_RAW_MR(ret_reg, _R0));
 			break;
 
 		/*
-- 
2.35.1

