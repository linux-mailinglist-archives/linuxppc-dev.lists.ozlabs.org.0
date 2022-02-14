Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DDC4B4CAB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 11:54:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jy1LL6Tf7z3cNB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 21:54:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VwpCn7CS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VwpCn7CS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jy15t3B31z3cVP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 21:43:13 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21EAQX2I010442; 
 Mon, 14 Feb 2022 10:42:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=syxqMxbuM7NRQXrqtFkxXwmz0126fiZi6MKSzVoKFAM=;
 b=VwpCn7CSM+64lGNE1BhmEa+D22PBfpmJLM74tBlGJwA4jsx3/R3Cvpaljc5XPMjWHDEi
 /bMvojgoho8Irx3cLMfstoR4fYOx+0sVl1lbmYyqk5iwFSVX4908CHkmzxh8v8trECKQ
 nq6udzx2wuomAH8xYBfbFetdfsQfcVpDKHTY9WqgZIdsZtZgxorESvKq0lwx3xJgbBEx
 w02rFEKQ6xxs3lnovDs30sPEhWppJ382duFyeHLviPZZdXi+6ZjJ3t+mCuVfWlvg9cVO
 xh8QF6Tf9NgRaZ0jtJprmyUICItWPP09rq6aCjIJ9mXkAidg+tAp6P+Sl1B6yheyo9sD SQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e7avevj10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:57 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21EAg5Yg011508;
 Mon, 14 Feb 2022 10:42:57 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e7avevj0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:57 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21EAXfbs028260;
 Mon, 14 Feb 2022 10:42:55 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3e64h9m0up-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Feb 2022 10:42:55 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21EAgoEm46727522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Feb 2022 10:42:50 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D214AE053;
 Mon, 14 Feb 2022 10:42:50 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 239E3AE051;
 Mon, 14 Feb 2022 10:42:48 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.124.167])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Feb 2022 10:42:47 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH powerpc/next 16/17] powerpc64/bpf: Store temp registers' bpf
 to ppc mapping
Date: Mon, 14 Feb 2022 16:11:50 +0530
Message-Id: <0944e2f0fa6dd254ea401f1c946fb6c9a5294278.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1644834730.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TSNur4hFRIAAIjORVza01obUQHZEDUYt
X-Proofpoint-ORIG-GUID: h9BXE6XVYd79JofE8mL_eASkSqeGwgnE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-14_02,2022-02-14_03,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 suspectscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 spamscore=0 adultscore=0
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202140062
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
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Yauheni Kaliuta <yauheni.kaliuta@redhat.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Jordan Niethe <jniethe5@gmail.com>

In bpf_jit_build_body(), the mapping of TMP_REG_1 and TMP_REG_2's bpf
register to ppc register is evalulated at every use despite not
changing. Instead, determine the ppc register once and store the result.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
[Rebased, converted additional usage sites]
Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/net/bpf_jit_comp64.c | 197 +++++++++++++-----------------
 1 file changed, 86 insertions(+), 111 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index ac06efa7022379..b4de0c35c8a4ab 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -357,6 +357,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		u32 dst_reg = b2p[insn[i].dst_reg];
 		u32 src_reg = b2p[insn[i].src_reg];
 		u32 size = BPF_SIZE(code);
+		u32 tmp1_reg = b2p[TMP_REG_1];
+		u32 tmp2_reg = b2p[TMP_REG_2];
 		s16 off = insn[i].off;
 		s32 imm = insn[i].imm;
 		bool func_addr_fixed;
@@ -407,8 +409,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			} else if (imm >= -32768 && imm < 32768) {
 				EMIT(PPC_RAW_ADDI(dst_reg, dst_reg, IMM_L(imm)));
 			} else {
-				PPC_LI32(b2p[TMP_REG_1], imm);
-				EMIT(PPC_RAW_ADD(dst_reg, dst_reg, b2p[TMP_REG_1]));
+				PPC_LI32(tmp1_reg, imm);
+				EMIT(PPC_RAW_ADD(dst_reg, dst_reg, tmp1_reg));
 			}
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_SUB | BPF_K: /* (u32) dst -= (u32) imm */
@@ -418,8 +420,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			} else if (imm > -32768 && imm <= 32768) {
 				EMIT(PPC_RAW_ADDI(dst_reg, dst_reg, IMM_L(-imm)));
 			} else {
-				PPC_LI32(b2p[TMP_REG_1], imm);
-				EMIT(PPC_RAW_SUB(dst_reg, dst_reg, b2p[TMP_REG_1]));
+				PPC_LI32(tmp1_reg, imm);
+				EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
 			}
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_MUL | BPF_X: /* (u32) dst *= (u32) src */
@@ -434,32 +436,28 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			if (imm >= -32768 && imm < 32768)
 				EMIT(PPC_RAW_MULI(dst_reg, dst_reg, IMM_L(imm)));
 			else {
-				PPC_LI32(b2p[TMP_REG_1], imm);
+				PPC_LI32(tmp1_reg, imm);
 				if (BPF_CLASS(code) == BPF_ALU)
-					EMIT(PPC_RAW_MULW(dst_reg, dst_reg,
-							b2p[TMP_REG_1]));
+					EMIT(PPC_RAW_MULW(dst_reg, dst_reg, tmp1_reg));
 				else
-					EMIT(PPC_RAW_MULD(dst_reg, dst_reg,
-							b2p[TMP_REG_1]));
+					EMIT(PPC_RAW_MULD(dst_reg, dst_reg, tmp1_reg));
 			}
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_DIV | BPF_X: /* (u32) dst /= (u32) src */
 		case BPF_ALU | BPF_MOD | BPF_X: /* (u32) dst %= (u32) src */
 			if (BPF_OP(code) == BPF_MOD) {
-				EMIT(PPC_RAW_DIVWU(b2p[TMP_REG_1], dst_reg, src_reg));
-				EMIT(PPC_RAW_MULW(b2p[TMP_REG_1], src_reg,
-						b2p[TMP_REG_1]));
-				EMIT(PPC_RAW_SUB(dst_reg, dst_reg, b2p[TMP_REG_1]));
+				EMIT(PPC_RAW_DIVWU(tmp1_reg, dst_reg, src_reg));
+				EMIT(PPC_RAW_MULW(tmp1_reg, src_reg, tmp1_reg));
+				EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
 			} else
 				EMIT(PPC_RAW_DIVWU(dst_reg, dst_reg, src_reg));
 			goto bpf_alu32_trunc;
 		case BPF_ALU64 | BPF_DIV | BPF_X: /* dst /= src */
 		case BPF_ALU64 | BPF_MOD | BPF_X: /* dst %= src */
 			if (BPF_OP(code) == BPF_MOD) {
-				EMIT(PPC_RAW_DIVDU(b2p[TMP_REG_1], dst_reg, src_reg));
-				EMIT(PPC_RAW_MULD(b2p[TMP_REG_1], src_reg,
-						b2p[TMP_REG_1]));
-				EMIT(PPC_RAW_SUB(dst_reg, dst_reg, b2p[TMP_REG_1]));
+				EMIT(PPC_RAW_DIVDU(tmp1_reg, dst_reg, src_reg));
+				EMIT(PPC_RAW_MULD(tmp1_reg, src_reg, tmp1_reg));
+				EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
 			} else
 				EMIT(PPC_RAW_DIVDU(dst_reg, dst_reg, src_reg));
 			break;
@@ -478,35 +476,23 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				}
 			}
 
-			PPC_LI32(b2p[TMP_REG_1], imm);
+			PPC_LI32(tmp1_reg, imm);
 			switch (BPF_CLASS(code)) {
 			case BPF_ALU:
 				if (BPF_OP(code) == BPF_MOD) {
-					EMIT(PPC_RAW_DIVWU(b2p[TMP_REG_2],
-							dst_reg,
-							b2p[TMP_REG_1]));
-					EMIT(PPC_RAW_MULW(b2p[TMP_REG_1],
-							b2p[TMP_REG_1],
-							b2p[TMP_REG_2]));
-					EMIT(PPC_RAW_SUB(dst_reg, dst_reg,
-							b2p[TMP_REG_1]));
+					EMIT(PPC_RAW_DIVWU(tmp2_reg, dst_reg, tmp1_reg));
+					EMIT(PPC_RAW_MULW(tmp1_reg, tmp1_reg, tmp2_reg));
+					EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
 				} else
-					EMIT(PPC_RAW_DIVWU(dst_reg, dst_reg,
-							b2p[TMP_REG_1]));
+					EMIT(PPC_RAW_DIVWU(dst_reg, dst_reg, tmp1_reg));
 				break;
 			case BPF_ALU64:
 				if (BPF_OP(code) == BPF_MOD) {
-					EMIT(PPC_RAW_DIVDU(b2p[TMP_REG_2],
-							dst_reg,
-							b2p[TMP_REG_1]));
-					EMIT(PPC_RAW_MULD(b2p[TMP_REG_1],
-							b2p[TMP_REG_1],
-							b2p[TMP_REG_2]));
-					EMIT(PPC_RAW_SUB(dst_reg, dst_reg,
-							b2p[TMP_REG_1]));
+					EMIT(PPC_RAW_DIVDU(tmp2_reg, dst_reg, tmp1_reg));
+					EMIT(PPC_RAW_MULD(tmp1_reg, tmp1_reg, tmp2_reg));
+					EMIT(PPC_RAW_SUB(dst_reg, dst_reg, tmp1_reg));
 				} else
-					EMIT(PPC_RAW_DIVDU(dst_reg, dst_reg,
-							b2p[TMP_REG_1]));
+					EMIT(PPC_RAW_DIVDU(dst_reg, dst_reg, tmp1_reg));
 				break;
 			}
 			goto bpf_alu32_trunc;
@@ -528,8 +514,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				EMIT(PPC_RAW_ANDI(dst_reg, dst_reg, IMM_L(imm)));
 			else {
 				/* Sign-extended */
-				PPC_LI32(b2p[TMP_REG_1], imm);
-				EMIT(PPC_RAW_AND(dst_reg, dst_reg, b2p[TMP_REG_1]));
+				PPC_LI32(tmp1_reg, imm);
+				EMIT(PPC_RAW_AND(dst_reg, dst_reg, tmp1_reg));
 			}
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_OR | BPF_X: /* dst = (u32) dst | (u32) src */
@@ -540,8 +526,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		case BPF_ALU64 | BPF_OR | BPF_K:/* dst = dst | imm */
 			if (imm < 0 && BPF_CLASS(code) == BPF_ALU64) {
 				/* Sign-extended */
-				PPC_LI32(b2p[TMP_REG_1], imm);
-				EMIT(PPC_RAW_OR(dst_reg, dst_reg, b2p[TMP_REG_1]));
+				PPC_LI32(tmp1_reg, imm);
+				EMIT(PPC_RAW_OR(dst_reg, dst_reg, tmp1_reg));
 			} else {
 				if (IMM_L(imm))
 					EMIT(PPC_RAW_ORI(dst_reg, dst_reg, IMM_L(imm)));
@@ -557,8 +543,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		case BPF_ALU64 | BPF_XOR | BPF_K: /* dst ^= imm */
 			if (imm < 0 && BPF_CLASS(code) == BPF_ALU64) {
 				/* Sign-extended */
-				PPC_LI32(b2p[TMP_REG_1], imm);
-				EMIT(PPC_RAW_XOR(dst_reg, dst_reg, b2p[TMP_REG_1]));
+				PPC_LI32(tmp1_reg, imm);
+				EMIT(PPC_RAW_XOR(dst_reg, dst_reg, tmp1_reg));
 			} else {
 				if (IMM_L(imm))
 					EMIT(PPC_RAW_XORI(dst_reg, dst_reg, IMM_L(imm)));
@@ -659,11 +645,11 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			switch (imm) {
 			case 16:
 				/* Rotate 8 bits left & mask with 0x0000ff00 */
-				EMIT(PPC_RAW_RLWINM(b2p[TMP_REG_1], dst_reg, 8, 16, 23));
+				EMIT(PPC_RAW_RLWINM(tmp1_reg, dst_reg, 8, 16, 23));
 				/* Rotate 8 bits right & insert LSB to reg */
-				EMIT(PPC_RAW_RLWIMI(b2p[TMP_REG_1], dst_reg, 24, 24, 31));
+				EMIT(PPC_RAW_RLWIMI(tmp1_reg, dst_reg, 24, 24, 31));
 				/* Move result back to dst_reg */
-				EMIT(PPC_RAW_MR(dst_reg, b2p[TMP_REG_1]));
+				EMIT(PPC_RAW_MR(dst_reg, tmp1_reg));
 				break;
 			case 32:
 				/*
@@ -671,28 +657,28 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				 * 2 bytes are already in their final position
 				 * -- byte 2 and 4 (of bytes 1, 2, 3 and 4)
 				 */
-				EMIT(PPC_RAW_RLWINM(b2p[TMP_REG_1], dst_reg, 8, 0, 31));
+				EMIT(PPC_RAW_RLWINM(tmp1_reg, dst_reg, 8, 0, 31));
 				/* Rotate 24 bits and insert byte 1 */
-				EMIT(PPC_RAW_RLWIMI(b2p[TMP_REG_1], dst_reg, 24, 0, 7));
+				EMIT(PPC_RAW_RLWIMI(tmp1_reg, dst_reg, 24, 0, 7));
 				/* Rotate 24 bits and insert byte 3 */
-				EMIT(PPC_RAW_RLWIMI(b2p[TMP_REG_1], dst_reg, 24, 16, 23));
-				EMIT(PPC_RAW_MR(dst_reg, b2p[TMP_REG_1]));
+				EMIT(PPC_RAW_RLWIMI(tmp1_reg, dst_reg, 24, 16, 23));
+				EMIT(PPC_RAW_MR(dst_reg, tmp1_reg));
 				break;
 			case 64:
 				/* Store the value to stack and then use byte-reverse loads */
 				EMIT(PPC_RAW_STD(dst_reg, _R1, bpf_jit_stack_local(ctx)));
-				EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], _R1, bpf_jit_stack_local(ctx)));
+				EMIT(PPC_RAW_ADDI(tmp1_reg, _R1, bpf_jit_stack_local(ctx)));
 				if (cpu_has_feature(CPU_FTR_ARCH_206)) {
-					EMIT(PPC_RAW_LDBRX(dst_reg, 0, b2p[TMP_REG_1]));
+					EMIT(PPC_RAW_LDBRX(dst_reg, 0, tmp1_reg));
 				} else {
-					EMIT(PPC_RAW_LWBRX(dst_reg, 0, b2p[TMP_REG_1]));
+					EMIT(PPC_RAW_LWBRX(dst_reg, 0, tmp1_reg));
 					if (IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN))
 						EMIT(PPC_RAW_SLDI(dst_reg, dst_reg, 32));
-					EMIT(PPC_RAW_LI(b2p[TMP_REG_2], 4));
-					EMIT(PPC_RAW_LWBRX(b2p[TMP_REG_2], b2p[TMP_REG_2], b2p[TMP_REG_1]));
+					EMIT(PPC_RAW_LI(tmp2_reg, 4));
+					EMIT(PPC_RAW_LWBRX(tmp2_reg, tmp2_reg, tmp1_reg));
 					if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
-						EMIT(PPC_RAW_SLDI(b2p[TMP_REG_2], b2p[TMP_REG_2], 32));
-					EMIT(PPC_RAW_OR(dst_reg, dst_reg, b2p[TMP_REG_2]));
+						EMIT(PPC_RAW_SLDI(tmp2_reg, tmp2_reg, 32));
+					EMIT(PPC_RAW_OR(dst_reg, dst_reg, tmp2_reg));
 				}
 				break;
 			}
@@ -731,7 +717,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				break;
 			case STF_BARRIER_SYNC_ORI:
 				EMIT(PPC_RAW_SYNC());
-				EMIT(PPC_RAW_LD(b2p[TMP_REG_1], _R13, 0));
+				EMIT(PPC_RAW_LD(tmp1_reg, _R13, 0));
 				EMIT(PPC_RAW_ORI(_R31, _R31, 0));
 				break;
 			case STF_BARRIER_FALLBACK:
@@ -751,36 +737,36 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 		case BPF_STX | BPF_MEM | BPF_B: /* *(u8 *)(dst + off) = src */
 		case BPF_ST | BPF_MEM | BPF_B: /* *(u8 *)(dst + off) = imm */
 			if (BPF_CLASS(code) == BPF_ST) {
-				EMIT(PPC_RAW_LI(b2p[TMP_REG_1], imm));
-				src_reg = b2p[TMP_REG_1];
+				EMIT(PPC_RAW_LI(tmp1_reg, imm));
+				src_reg = tmp1_reg;
 			}
 			EMIT(PPC_RAW_STB(src_reg, dst_reg, off));
 			break;
 		case BPF_STX | BPF_MEM | BPF_H: /* (u16 *)(dst + off) = src */
 		case BPF_ST | BPF_MEM | BPF_H: /* (u16 *)(dst + off) = imm */
 			if (BPF_CLASS(code) == BPF_ST) {
-				EMIT(PPC_RAW_LI(b2p[TMP_REG_1], imm));
-				src_reg = b2p[TMP_REG_1];
+				EMIT(PPC_RAW_LI(tmp1_reg, imm));
+				src_reg = tmp1_reg;
 			}
 			EMIT(PPC_RAW_STH(src_reg, dst_reg, off));
 			break;
 		case BPF_STX | BPF_MEM | BPF_W: /* *(u32 *)(dst + off) = src */
 		case BPF_ST | BPF_MEM | BPF_W: /* *(u32 *)(dst + off) = imm */
 			if (BPF_CLASS(code) == BPF_ST) {
-				PPC_LI32(b2p[TMP_REG_1], imm);
-				src_reg = b2p[TMP_REG_1];
+				PPC_LI32(tmp1_reg, imm);
+				src_reg = tmp1_reg;
 			}
 			EMIT(PPC_RAW_STW(src_reg, dst_reg, off));
 			break;
 		case BPF_STX | BPF_MEM | BPF_DW: /* (u64 *)(dst + off) = src */
 		case BPF_ST | BPF_MEM | BPF_DW: /* *(u64 *)(dst + off) = imm */
 			if (BPF_CLASS(code) == BPF_ST) {
-				PPC_LI32(b2p[TMP_REG_1], imm);
-				src_reg = b2p[TMP_REG_1];
+				PPC_LI32(tmp1_reg, imm);
+				src_reg = tmp1_reg;
 			}
 			if (off % 4) {
-				EMIT(PPC_RAW_LI(b2p[TMP_REG_2], off));
-				EMIT(PPC_RAW_STDX(src_reg, dst_reg, b2p[TMP_REG_2]));
+				EMIT(PPC_RAW_LI(tmp2_reg, off));
+				EMIT(PPC_RAW_STDX(src_reg, dst_reg, tmp2_reg));
 			} else {
 				EMIT(PPC_RAW_STD(src_reg, dst_reg, off));
 			}
@@ -800,14 +786,14 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			/* *(u32 *)(dst + off) += src */
 
 			/* Get EA into TMP_REG_1 */
-			EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], dst_reg, off));
+			EMIT(PPC_RAW_ADDI(tmp1_reg, dst_reg, off));
 			tmp_idx = ctx->idx * 4;
 			/* load value from memory into TMP_REG_2 */
-			EMIT(PPC_RAW_LWARX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1], 0));
+			EMIT(PPC_RAW_LWARX(tmp2_reg, 0, tmp1_reg, 0));
 			/* add value from src_reg into this */
-			EMIT(PPC_RAW_ADD(b2p[TMP_REG_2], b2p[TMP_REG_2], src_reg));
+			EMIT(PPC_RAW_ADD(tmp2_reg, tmp2_reg, src_reg));
 			/* store result back */
-			EMIT(PPC_RAW_STWCX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1]));
+			EMIT(PPC_RAW_STWCX(tmp2_reg, 0, tmp1_reg));
 			/* we're done if this succeeded */
 			PPC_BCC_SHORT(COND_NE, tmp_idx);
 			break;
@@ -820,11 +806,11 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			}
 			/* *(u64 *)(dst + off) += src */
 
-			EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], dst_reg, off));
+			EMIT(PPC_RAW_ADDI(tmp1_reg, dst_reg, off));
 			tmp_idx = ctx->idx * 4;
-			EMIT(PPC_RAW_LDARX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1], 0));
-			EMIT(PPC_RAW_ADD(b2p[TMP_REG_2], b2p[TMP_REG_2], src_reg));
-			EMIT(PPC_RAW_STDCX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1]));
+			EMIT(PPC_RAW_LDARX(tmp2_reg, 0, tmp1_reg, 0));
+			EMIT(PPC_RAW_ADD(tmp2_reg, tmp2_reg, src_reg));
+			EMIT(PPC_RAW_STDCX(tmp2_reg, 0, tmp1_reg));
 			PPC_BCC_SHORT(COND_NE, tmp_idx);
 			break;
 
@@ -850,12 +836,12 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			 * set dst_reg=0 and move on.
 			 */
 			if (BPF_MODE(code) == BPF_PROBE_MEM) {
-				EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], src_reg, off));
+				EMIT(PPC_RAW_ADDI(tmp1_reg, src_reg, off));
 				if (IS_ENABLED(CONFIG_PPC_BOOK3E_64))
-					PPC_LI64(b2p[TMP_REG_2], 0x8000000000000000ul);
+					PPC_LI64(tmp2_reg, 0x8000000000000000ul);
 				else /* BOOK3S_64 */
-					PPC_LI64(b2p[TMP_REG_2], PAGE_OFFSET);
-				EMIT(PPC_RAW_CMPLD(b2p[TMP_REG_1], b2p[TMP_REG_2]));
+					PPC_LI64(tmp2_reg, PAGE_OFFSET);
+				EMIT(PPC_RAW_CMPLD(tmp1_reg, tmp2_reg));
 				PPC_BCC_SHORT(COND_GT, (ctx->idx + 3) * 4);
 				EMIT(PPC_RAW_LI(dst_reg, 0));
 				/*
@@ -880,8 +866,8 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				break;
 			case BPF_DW:
 				if (off % 4) {
-					EMIT(PPC_RAW_LI(b2p[TMP_REG_1], off));
-					EMIT(PPC_RAW_LDX(dst_reg, src_reg, b2p[TMP_REG_1]));
+					EMIT(PPC_RAW_LI(tmp1_reg, off));
+					EMIT(PPC_RAW_LDX(dst_reg, src_reg, tmp1_reg));
 				} else {
 					EMIT(PPC_RAW_LD(dst_reg, src_reg, off));
 				}
@@ -925,7 +911,7 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			 * we'll just fall through to the epilogue.
 			 */
 			if (i != flen - 1) {
-				ret = bpf_jit_emit_exit_insn(image, ctx, b2p[TMP_REG_1], exit_addr);
+				ret = bpf_jit_emit_exit_insn(image, ctx, tmp1_reg, exit_addr);
 				if (ret)
 					return ret;
 			}
@@ -1058,14 +1044,10 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 			case BPF_JMP | BPF_JSET | BPF_X:
 			case BPF_JMP32 | BPF_JSET | BPF_X:
 				if (BPF_CLASS(code) == BPF_JMP) {
-					EMIT(PPC_RAW_AND_DOT(b2p[TMP_REG_1], dst_reg,
-						    src_reg));
+					EMIT(PPC_RAW_AND_DOT(tmp1_reg, dst_reg, src_reg));
 				} else {
-					int tmp_reg = b2p[TMP_REG_1];
-
-					EMIT(PPC_RAW_AND(tmp_reg, dst_reg, src_reg));
-					EMIT(PPC_RAW_RLWINM_DOT(tmp_reg, tmp_reg, 0, 0,
-						       31));
+					EMIT(PPC_RAW_AND(tmp1_reg, dst_reg, src_reg));
+					EMIT(PPC_RAW_RLWINM_DOT(tmp1_reg, tmp1_reg, 0, 0, 31));
 				}
 				break;
 			case BPF_JMP | BPF_JNE | BPF_K:
@@ -1094,14 +1076,12 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 						EMIT(PPC_RAW_CMPLDI(dst_reg, imm));
 				} else {
 					/* sign-extending load */
-					PPC_LI32(b2p[TMP_REG_1], imm);
+					PPC_LI32(tmp1_reg, imm);
 					/* ... but unsigned comparison */
 					if (is_jmp32)
-						EMIT(PPC_RAW_CMPLW(dst_reg,
-							  b2p[TMP_REG_1]));
+						EMIT(PPC_RAW_CMPLW(dst_reg, tmp1_reg));
 					else
-						EMIT(PPC_RAW_CMPLD(dst_reg,
-							  b2p[TMP_REG_1]));
+						EMIT(PPC_RAW_CMPLD(dst_reg, tmp1_reg));
 				}
 				break;
 			}
@@ -1126,13 +1106,11 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 					else
 						EMIT(PPC_RAW_CMPDI(dst_reg, imm));
 				} else {
-					PPC_LI32(b2p[TMP_REG_1], imm);
+					PPC_LI32(tmp1_reg, imm);
 					if (is_jmp32)
-						EMIT(PPC_RAW_CMPW(dst_reg,
-							 b2p[TMP_REG_1]));
+						EMIT(PPC_RAW_CMPW(dst_reg, tmp1_reg));
 					else
-						EMIT(PPC_RAW_CMPD(dst_reg,
-							 b2p[TMP_REG_1]));
+						EMIT(PPC_RAW_CMPD(dst_reg, tmp1_reg));
 				}
 				break;
 			}
@@ -1141,19 +1119,16 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, struct codegen_context *
 				/* andi does not sign-extend the immediate */
 				if (imm >= 0 && imm < 32768)
 					/* PPC_ANDI is _only/always_ dot-form */
-					EMIT(PPC_RAW_ANDI(b2p[TMP_REG_1], dst_reg, imm));
+					EMIT(PPC_RAW_ANDI(tmp1_reg, dst_reg, imm));
 				else {
-					int tmp_reg = b2p[TMP_REG_1];
-
-					PPC_LI32(tmp_reg, imm);
+					PPC_LI32(tmp1_reg, imm);
 					if (BPF_CLASS(code) == BPF_JMP) {
-						EMIT(PPC_RAW_AND_DOT(tmp_reg, dst_reg,
-							    tmp_reg));
+						EMIT(PPC_RAW_AND_DOT(tmp1_reg, dst_reg,
+								     tmp1_reg));
 					} else {
-						EMIT(PPC_RAW_AND(tmp_reg, dst_reg,
-							tmp_reg));
-						EMIT(PPC_RAW_RLWINM_DOT(tmp_reg, tmp_reg,
-							       0, 0, 31));
+						EMIT(PPC_RAW_AND(tmp1_reg, dst_reg, tmp1_reg));
+						EMIT(PPC_RAW_RLWINM_DOT(tmp1_reg, tmp1_reg,
+									0, 0, 31));
 					}
 				}
 				break;
-- 
2.35.1

