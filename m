Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 774225469F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 17:58:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKQbv32xWz3dp2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 01:58:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jVv6BO89;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jVv6BO89;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKQYp58xbz3bwg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 01:56:30 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AEuXFJ007584;
	Fri, 10 Jun 2022 15:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dJb/lXj3jl4VfTDeImilpTex2ktNmB2l4+NNwzRr3Vk=;
 b=jVv6BO89bEccN9FwAt90AcZS8oNEYCMZv13bD5WgNgZxvxx09N/lGoGP6A5JQPrtW7t0
 ac0mCCEFhqSWgaf9iIjTLWyuF5qjuUFfNRvQYBdHL9wt158vF35M+ZEBthr1o3B99C8w
 B0hNrRLPg9v2HTZe5cirbYC+rgPhFgbiOL0xS81MdvwmVUxB8byNtCbunmSID5e3dwJi
 isNxbBCIlp/WJp1XrlCfBhvOG8BhRxFnik2vkP4Cs7AsnWHBHYwD7gspcvQxGPOuM71T
 BwGIF/bOdZc74DDbiiIbZ03D4lBOTjx66GpNc2dg8N4cz23kmDSDSFrK+A05VSYEB9DX Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm85ps28b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 15:56:10 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25AFoCEe008049;
	Fri, 10 Jun 2022 15:56:09 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm85ps27q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 15:56:09 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25AFoRX3013860;
	Fri, 10 Jun 2022 15:56:07 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03ams.nl.ibm.com with ESMTP id 3gfy19gefb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 15:56:07 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25AFu5YN21955070
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 15:56:05 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 327704C044;
	Fri, 10 Jun 2022 15:56:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 772214C040;
	Fri, 10 Jun 2022 15:56:01 +0000 (GMT)
Received: from hbathini-workstation.in.ibm.com (unknown [9.203.106.231])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 10 Jun 2022 15:56:01 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: bpf@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 2/5] bpf ppc64: add support for atomic fetch operations
Date: Fri, 10 Jun 2022 21:25:49 +0530
Message-Id: <20220610155552.25892-3-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220610155552.25892-1-hbathini@linux.ibm.com>
References: <20220610155552.25892-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QulAns6e6jerUzYVw0jpQIGkD46kBAgl
X-Proofpoint-ORIG-GUID: l8hK_OLVrbR0Pcu_MpkUN8m6bUpaUcsH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Adding instructions for ppc64 for

atomic[64]_fetch_add
atomic[64]_fetch_and
atomic[64]_fetch_or
atomic[64]_fetch_xor

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

* No changes in v2.


 arch/powerpc/net/bpf_jit_comp64.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index c421bedd0e98..c53236b3a8b1 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -787,17 +787,25 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			else
 				EMIT(PPC_RAW_LWARX(tmp2_reg, tmp1_reg, dst_reg, 0));
 
+			/* Save old value in _R0 */
+			if (imm & BPF_FETCH)
+				EMIT(PPC_RAW_MR(_R0, tmp2_reg));
+
 			switch (imm) {
 			case BPF_ADD:
+			case BPF_ADD | BPF_FETCH:
 				EMIT(PPC_RAW_ADD(tmp2_reg, tmp2_reg, src_reg));
 				break;
 			case BPF_AND:
+			case BPF_AND | BPF_FETCH:
 				EMIT(PPC_RAW_AND(tmp2_reg, tmp2_reg, src_reg));
 				break;
 			case BPF_OR:
+			case BPF_OR | BPF_FETCH:
 				EMIT(PPC_RAW_OR(tmp2_reg, tmp2_reg, src_reg));
 				break;
 			case BPF_XOR:
+			case BPF_XOR | BPF_FETCH:
 				EMIT(PPC_RAW_XOR(tmp2_reg, tmp2_reg, src_reg));
 				break;
 			default:
@@ -807,13 +815,17 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				return -EOPNOTSUPP;
 			}
 
-			/* store result back */
+			/* store new value */
 			if (size == BPF_DW)
 				EMIT(PPC_RAW_STDCX(tmp2_reg, tmp1_reg, dst_reg));
 			else
 				EMIT(PPC_RAW_STWCX(tmp2_reg, tmp1_reg, dst_reg));
 			/* we're done if this succeeded */
 			PPC_BCC_SHORT(COND_NE, tmp_idx);
+
+			/* For the BPF_FETCH variant, get old value into src_reg */
+			if (imm & BPF_FETCH)
+				EMIT(PPC_RAW_MR(src_reg, _R0));
 			break;
 
 		/*
-- 
2.35.3

