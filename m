Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C647B5469FE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 17:59:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKQdX51vcz3dvP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 01:59:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pRdUC0U/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pRdUC0U/;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKQYy2GkQz3c98
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 01:56:37 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AFR7SE025200;
	Fri, 10 Jun 2022 15:56:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=I1afDjTRkcT29LEzqpObNh6JGr7EtIyVa/zoHKUbahQ=;
 b=pRdUC0U/Z6HIsy8Xp+mGDsEIkhb7UZToGW1ZYWq4hwHpeb8tiGFTQVk6CLOSswFkkOru
 l+5lqYysWrICcRKpcuaq1Ya2oTD+GeEyYI565dMhgxkHDZjrbQfdYBodGYDY9iu+rPGD
 3lWdsMLs2KYJReFjsPgxH5UY9uPumHl0jmGoey9UdBkfrzIXsh964c304HVNWnat/HtO
 EsPaoZpkGefuQXkTRw7XaG2DoazEjEr8/phXTFb3D/XsFV3BKrs0IERsGOcmsDrGuAUr
 sJ11HsUxTTIxGPcYSoWMPGWhvYXzflsTLMKSN5ExvSqRgO76JGIm6QZtRnO77u8uLC9B Iw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm8ksggjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 15:56:18 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25AFjClZ015303;
	Fri, 10 Jun 2022 15:56:17 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm8ksggjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 15:56:17 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25AFo4Np029817;
	Fri, 10 Jun 2022 15:56:15 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma06ams.nl.ibm.com with ESMTP id 3gfxnj0gad-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 15:56:14 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25AFuC5B21365010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 15:56:12 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B430E4C040;
	Fri, 10 Jun 2022 15:56:12 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A62D44C04A;
	Fri, 10 Jun 2022 15:56:09 +0000 (GMT)
Received: from hbathini-workstation.in.ibm.com (unknown [9.203.106.231])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 10 Jun 2022 15:56:09 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: bpf@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 4/5] bpf ppc32: add support for BPF_ATOMIC bitwise operations
Date: Fri, 10 Jun 2022 21:25:51 +0530
Message-Id: <20220610155552.25892-5-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220610155552.25892-1-hbathini@linux.ibm.com>
References: <20220610155552.25892-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: al_VxdLHl_xZzFEqvo5VQZZXMCV6U71E
X-Proofpoint-ORIG-GUID: 3BiqQ84zlO9If6zmokbeJHtWTbjnMzL_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 mlxlogscore=942 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

Adding instructions for ppc32 for

atomic_and
atomic_or
atomic_xor
atomic_fetch_add
atomic_fetch_and
atomic_fetch_or
atomic_fetch_xor

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v2:
* Used an additional register (BPF_REG_AX)
    - to avoid clobbering src_reg.
    - to keep the lwarx reservation as intended.
    - to avoid the odd switch/goto construct.
* Zero'ed out the higher 32-bit explicitly when required.

 arch/powerpc/net/bpf_jit_comp32.c | 53 ++++++++++++++++++++++++-------
 1 file changed, 41 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index e46ed1e8c6ca..28dc6a1a8f2f 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -294,6 +294,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		u32 dst_reg_h = dst_reg - 1;
 		u32 src_reg = bpf_to_ppc(insn[i].src_reg);
 		u32 src_reg_h = src_reg - 1;
+		u32 ax_reg = bpf_to_ppc(BPF_REG_AX);
 		u32 tmp_reg = bpf_to_ppc(TMP_REG);
 		u32 size = BPF_SIZE(code);
 		s16 off = insn[i].off;
@@ -798,25 +799,53 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		 * BPF_STX ATOMIC (atomic ops)
 		 */
 		case BPF_STX | BPF_ATOMIC | BPF_W:
-			if (imm != BPF_ADD) {
-				pr_err_ratelimited("eBPF filter atomic op code %02x (@%d) unsupported\n",
-						   code, i);
-				return -ENOTSUPP;
-			}
-
-			/* *(u32 *)(dst + off) += src */
-
 			bpf_set_seen_register(ctx, tmp_reg);
+			bpf_set_seen_register(ctx, ax_reg);
+
 			/* Get offset into TMP_REG */
 			EMIT(PPC_RAW_LI(tmp_reg, off));
+			tmp_idx = ctx->idx * 4;
 			/* load value from memory into r0 */
 			EMIT(PPC_RAW_LWARX(_R0, tmp_reg, dst_reg, 0));
-			/* add value from src_reg into this */
-			EMIT(PPC_RAW_ADD(_R0, _R0, src_reg));
-			/* store result back */
+
+			/* Save old value in BPF_REG_AX */
+			if (imm & BPF_FETCH)
+				EMIT(PPC_RAW_MR(ax_reg, _R0));
+
+			switch (imm) {
+			case BPF_ADD:
+			case BPF_ADD | BPF_FETCH:
+				EMIT(PPC_RAW_ADD(_R0, _R0, src_reg));
+				break;
+			case BPF_AND:
+			case BPF_AND | BPF_FETCH:
+				EMIT(PPC_RAW_AND(_R0, _R0, src_reg));
+				break;
+			case BPF_OR:
+			case BPF_OR | BPF_FETCH:
+				EMIT(PPC_RAW_OR(_R0, _R0, src_reg));
+				break;
+			case BPF_XOR:
+			case BPF_XOR | BPF_FETCH:
+				EMIT(PPC_RAW_XOR(_R0, _R0, src_reg));
+				break;
+			default:
+				pr_err_ratelimited("eBPF filter atomic op code %02x (@%d) unsupported\n",
+						   code, i);
+				return -EOPNOTSUPP;
+			}
+
+			/* store new value */
 			EMIT(PPC_RAW_STWCX(_R0, tmp_reg, dst_reg));
 			/* we're done if this succeeded */
-			PPC_BCC_SHORT(COND_NE, (ctx->idx - 3) * 4);
+			PPC_BCC_SHORT(COND_NE, tmp_idx);
+
+			/* For the BPF_FETCH variant, get old data into src_reg */
+			if (imm & BPF_FETCH) {
+				EMIT(PPC_RAW_MR(src_reg, ax_reg));
+				if (!fp->aux->verifier_zext)
+					EMIT(PPC_RAW_LI(src_reg_h, 0));
+			}
 			break;
 
 		case BPF_STX | BPF_ATOMIC | BPF_DW: /* *(u64 *)(dst + off) += src */
-- 
2.35.3

