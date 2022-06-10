Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35609546A02
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 18:00:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKQfG0nlcz3dxd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jun 2022 02:00:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mgB29cJu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mgB29cJu;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKQZ03gkmz3cBB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jun 2022 01:56:40 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25AEuah3007690;
	Fri, 10 Jun 2022 15:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=s32GZyBD7QhYHjhNHiY86tpczYjEJMbszSFFN4zdBfM=;
 b=mgB29cJuYGOYivogWqXHujPbuYV5E+MCcRdo8ImqyvKOvDyUPLPfwdPyLUs6rGz5Wm4G
 O2vm0i3/8TKYsQOOyQcPB1AfuRMSvVAZRyBOGvNP4ddMevgimvCZQWmt3UrAEqEjZ1c+
 UnR/Vyv+YNNTHAx4uCLGghwjtdxr3/5sZb3N03Rrg1bA1rn4ZsANsMHWOACFs6eeYpsR
 +5FDc0TYWpJxDjWzgE0B5YlBnaa8fOkCU3saJsbwFoVnG7dGZ6xH3A18hYhtA/gPsUOS
 Ox1phGpED0+NsfmGeWRw3uQfqeYRO+w4an0qu9PqoidgpWY3SuvJD440U2rQmOd5SwIc HA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm85ps2c9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 15:56:21 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25AF0ZEX016927;
	Fri, 10 Jun 2022 15:56:20 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm85ps2bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 15:56:20 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25AFpdpW020876;
	Fri, 10 Jun 2022 15:56:18 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma05fra.de.ibm.com with ESMTP id 3gfy18xp6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 15:56:18 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25AFuGCJ22479224
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 15:56:16 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02A064C046;
	Fri, 10 Jun 2022 15:56:16 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0975A4C040;
	Fri, 10 Jun 2022 15:56:13 +0000 (GMT)
Received: from hbathini-workstation.in.ibm.com (unknown [9.203.106.231])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 10 Jun 2022 15:56:12 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: bpf@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 5/5] bpf ppc32: Add instructions for atomic_[cmp]xchg
Date: Fri, 10 Jun 2022 21:25:52 +0530
Message-Id: <20220610155552.25892-6-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220610155552.25892-1-hbathini@linux.ibm.com>
References: <20220610155552.25892-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZetIobXS02btdggG2UPwAI2nq-1RNAk7
X-Proofpoint-ORIG-GUID: xVhgE7kk95bUxARjKoukvRZo7kdqN2Gm
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

This adds two atomic opcodes BPF_XCHG and BPF_CMPXCHG on ppc32, both
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
* Tried to make code readable and compact.


 arch/powerpc/net/bpf_jit_comp32.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp32.c b/arch/powerpc/net/bpf_jit_comp32.c
index 28dc6a1a8f2f..43f1c76d48ce 100644
--- a/arch/powerpc/net/bpf_jit_comp32.c
+++ b/arch/powerpc/net/bpf_jit_comp32.c
@@ -297,6 +297,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		u32 ax_reg = bpf_to_ppc(BPF_REG_AX);
 		u32 tmp_reg = bpf_to_ppc(TMP_REG);
 		u32 size = BPF_SIZE(code);
+		u32 save_reg, ret_reg;
 		s16 off = insn[i].off;
 		s32 imm = insn[i].imm;
 		bool func_addr_fixed;
@@ -799,6 +800,9 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		 * BPF_STX ATOMIC (atomic ops)
 		 */
 		case BPF_STX | BPF_ATOMIC | BPF_W:
+			save_reg = _R0;
+			ret_reg = src_reg;
+
 			bpf_set_seen_register(ctx, tmp_reg);
 			bpf_set_seen_register(ctx, ax_reg);
 
@@ -829,6 +833,21 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			case BPF_XOR | BPF_FETCH:
 				EMIT(PPC_RAW_XOR(_R0, _R0, src_reg));
 				break;
+			case BPF_CMPXCHG:
+				/*
+				 * Return old value in BPF_REG_0 for BPF_CMPXCHG &
+				 * in src_reg for other cases.
+				 */
+				ret_reg = bpf_to_ppc(BPF_REG_0);
+
+				/* Compare with old value in BPF_REG_0 */
+				EMIT(PPC_RAW_CMPW(bpf_to_ppc(BPF_REG_0), _R0));
+				/* Don't set if different from old value */
+				PPC_BCC_SHORT(COND_NE, (ctx->idx + 3) * 4);
+				fallthrough;
+			case BPF_XCHG:
+				save_reg = src_reg;
+				break;
 			default:
 				pr_err_ratelimited("eBPF filter atomic op code %02x (@%d) unsupported\n",
 						   code, i);
@@ -836,15 +855,15 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			}
 
 			/* store new value */
-			EMIT(PPC_RAW_STWCX(_R0, tmp_reg, dst_reg));
+			EMIT(PPC_RAW_STWCX(save_reg, tmp_reg, dst_reg));
 			/* we're done if this succeeded */
 			PPC_BCC_SHORT(COND_NE, tmp_idx);
 
 			/* For the BPF_FETCH variant, get old data into src_reg */
 			if (imm & BPF_FETCH) {
-				EMIT(PPC_RAW_MR(src_reg, ax_reg));
+				EMIT(PPC_RAW_MR(ret_reg, ax_reg));
 				if (!fp->aux->verifier_zext)
-					EMIT(PPC_RAW_LI(src_reg_h, 0));
+					EMIT(PPC_RAW_LI(ret_reg - 1, 0)); /* higher 32-bit */
 			}
 			break;
 
-- 
2.35.3

