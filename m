Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BE61B6EC3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 09:17:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497lqK6npLzDqNb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 17:17:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497lfF5L6fzDq72
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 17:09:25 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03O72Efb082132
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 03:09:23 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30kppdqsa4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 03:09:23 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Fri, 24 Apr 2020 08:08:55 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 24 Apr 2020 08:08:53 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 03O79HP459703716
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Apr 2020 07:09:17 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BDDEA4051;
 Fri, 24 Apr 2020 07:09:17 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64F1AA404D;
 Fri, 24 Apr 2020 07:09:15 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.95.110])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 24 Apr 2020 07:09:15 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [RFC PATCH v2 3/7] powerpc/bpf_jit: reuse instruction macros from
 ppc-opcode.h
Date: Fri, 24 Apr 2020 12:38:49 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200424070853.443969-1-bala24@linux.ibm.com>
References: <20200424070853.443969-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20042407-0012-0000-0000-000003AA41E3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042407-0013-0000-0000-000021E798E8
Message-Id: <20200424070853.443969-4-bala24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-24_02:2020-04-23,
 2020-04-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 phishscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004240048
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com,
 Balamuruhan S <bala24@linux.ibm.com>, paulus@samba.org, sandipan@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

remove duplicate macro definitions from bpf_jit.h and reuse the macros from
ppc-opcode.h

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/net/bpf_jit.h        | 18 +-----------------
 arch/powerpc/net/bpf_jit32.h      | 10 +++++-----
 arch/powerpc/net/bpf_jit64.h      |  4 ++--
 arch/powerpc/net/bpf_jit_comp.c   |  2 +-
 arch/powerpc/net/bpf_jit_comp64.c | 20 ++++++++++----------
 5 files changed, 19 insertions(+), 35 deletions(-)

diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 55d4377ccfae..535d1de4dfee 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -11,6 +11,7 @@
 #ifndef __ASSEMBLY__
 
 #include <asm/types.h>
+#include <asm/ppc-opcode.h>
 
 #ifdef PPC64_ELF_ABI_v1
 #define FUNCTION_DESCR_SIZE	24
@@ -26,7 +27,6 @@
 #define IMM_H(i)		((uintptr_t)(i)>>16)
 #define IMM_HA(i)		(((uintptr_t)(i)>>16) +			      \
 					(((uintptr_t)(i) & 0x8000) >> 15))
-#define IMM_L(i)		((uintptr_t)(i) & 0xffff)
 
 #define PLANT_INSTR(d, idx, instr)					      \
 	do { if (d) { (d)[idx] = instr; } idx++; } while (0)
@@ -45,8 +45,6 @@
 #define PPC_ADDIS(d, a, i)	EMIT(PPC_INST_ADDIS |			      \
 				     ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
 #define PPC_LIS(r, i)		PPC_ADDIS(r, 0, i)
-#define PPC_STD(r, base, i)	EMIT(PPC_INST_STD | ___PPC_RS(r) |	      \
-				     ___PPC_RA(base) | ((i) & 0xfffc))
 #define PPC_STDX(r, base, b)	EMIT(PPC_INST_STDX | ___PPC_RS(r) |	      \
 				     ___PPC_RA(base) | ___PPC_RB(b))
 #define PPC_STDU(r, base, i)	EMIT(PPC_INST_STDU | ___PPC_RS(r) |	      \
@@ -62,12 +60,8 @@
 
 #define PPC_LBZ(r, base, i)	EMIT(PPC_INST_LBZ | ___PPC_RT(r) |	      \
 				     ___PPC_RA(base) | IMM_L(i))
-#define PPC_LD(r, base, i)	EMIT(PPC_INST_LD | ___PPC_RT(r) |	      \
-				     ___PPC_RA(base) | ((i) & 0xfffc))
 #define PPC_LDX(r, base, b)	EMIT(PPC_INST_LDX | ___PPC_RT(r) |	      \
 				     ___PPC_RA(base) | ___PPC_RB(b))
-#define PPC_LWZ(r, base, i)	EMIT(PPC_INST_LWZ | ___PPC_RT(r) |	      \
-				     ___PPC_RA(base) | IMM_L(i))
 #define PPC_LHZ(r, base, i)	EMIT(PPC_INST_LHZ | ___PPC_RT(r) |	      \
 				     ___PPC_RA(base) | IMM_L(i))
 #define PPC_LHBRX(r, base, b)	EMIT(PPC_INST_LHBRX | ___PPC_RT(r) |	      \
@@ -75,16 +69,8 @@
 #define PPC_LDBRX(r, base, b)	EMIT(PPC_INST_LDBRX | ___PPC_RT(r) |	      \
 				     ___PPC_RA(base) | ___PPC_RB(b))
 
-#define PPC_BPF_LDARX(t, a, b, eh) EMIT(PPC_INST_LDARX | ___PPC_RT(t) |	      \
-					___PPC_RA(a) | ___PPC_RB(b) |	      \
-					__PPC_EH(eh))
-#define PPC_BPF_LWARX(t, a, b, eh) EMIT(PPC_INST_LWARX | ___PPC_RT(t) |	      \
-					___PPC_RA(a) | ___PPC_RB(b) |	      \
-					__PPC_EH(eh))
 #define PPC_BPF_STWCX(s, a, b)	EMIT(PPC_INST_STWCX | ___PPC_RS(s) |	      \
 					___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_BPF_STDCX(s, a, b)	EMIT(PPC_INST_STDCX | ___PPC_RS(s) |	      \
-					___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_CMPWI(a, i)		EMIT(PPC_INST_CMPWI | ___PPC_RA(a) | IMM_L(i))
 #define PPC_CMPDI(a, i)		EMIT(PPC_INST_CMPDI | ___PPC_RA(a) | IMM_L(i))
 #define PPC_CMPW(a, b)		EMIT(PPC_INST_CMPW | ___PPC_RA(a) |	      \
@@ -100,8 +86,6 @@
 
 #define PPC_SUB(d, a, b)	EMIT(PPC_INST_SUB | ___PPC_RT(d) |	      \
 				     ___PPC_RB(a) | ___PPC_RA(b))
-#define PPC_ADD(d, a, b)	EMIT(PPC_INST_ADD | ___PPC_RT(d) |	      \
-				     ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_MULD(d, a, b)	EMIT(PPC_INST_MULLD | ___PPC_RT(d) |	      \
 				     ___PPC_RA(a) | ___PPC_RB(b))
 #define PPC_MULW(d, a, b)	EMIT(PPC_INST_MULLW | ___PPC_RT(d) |	      \
diff --git a/arch/powerpc/net/bpf_jit32.h b/arch/powerpc/net/bpf_jit32.h
index 4ec2a9f14f84..753c244a7cf9 100644
--- a/arch/powerpc/net/bpf_jit32.h
+++ b/arch/powerpc/net/bpf_jit32.h
@@ -76,13 +76,13 @@ DECLARE_LOAD_FUNC(sk_load_byte_msh);
 		else {	PPC_ADDIS(r, base, IMM_HA(i));			      \
 			PPC_LBZ(r, r, IMM_L(i)); } } while(0)
 
-#define PPC_LD_OFFS(r, base, i) do { if ((i) < 32768) PPC_LD(r, base, i);     \
+#define PPC_LD_OFFS(r, base, i) do { if ((i) < 32768) EMIT(PPC_RAW_LD(r, base, i));     \
 		else {	PPC_ADDIS(r, base, IMM_HA(i));			      \
-			PPC_LD(r, r, IMM_L(i)); } } while(0)
+			EMIT(PPC_RAW_LD(r, r, IMM_L(i))); } } while(0)
 
-#define PPC_LWZ_OFFS(r, base, i) do { if ((i) < 32768) PPC_LWZ(r, base, i);   \
+#define PPC_LWZ_OFFS(r, base, i) do { if ((i) < 32768) EMIT(PPC_RAW_LWZ(r, base, i));   \
 		else {	PPC_ADDIS(r, base, IMM_HA(i));			      \
-			PPC_LWZ(r, r, IMM_L(i)); } } while(0)
+			EMIT(PPC_RAW_LWZ(r, r, IMM_L(i))); } } while(0)
 
 #define PPC_LHZ_OFFS(r, base, i) do { if ((i) < 32768) PPC_LHZ(r, base, i);   \
 		else {	PPC_ADDIS(r, base, IMM_HA(i));			      \
@@ -118,7 +118,7 @@ DECLARE_LOAD_FUNC(sk_load_byte_msh);
 #define PPC_NTOHS_OFFS(r, base, i)	PPC_LHZ_OFFS(r, base, i)
 #endif
 
-#define PPC_BPF_LL(r, base, i) do { PPC_LWZ(r, base, i); } while(0)
+#define PPC_BPF_LL(r, base, i) do { EMIT(PPC_RAW_LWZ(r, base, i)); } while(0)
 #define PPC_BPF_STL(r, base, i) do { PPC_STW(r, base, i); } while(0)
 #define PPC_BPF_STLU(r, base, i) do { PPC_STWU(r, base, i); } while(0)
 
diff --git a/arch/powerpc/net/bpf_jit64.h b/arch/powerpc/net/bpf_jit64.h
index cf3a7e337f02..c144a3777158 100644
--- a/arch/powerpc/net/bpf_jit64.h
+++ b/arch/powerpc/net/bpf_jit64.h
@@ -73,14 +73,14 @@ static const int b2p[] = {
 					PPC_LI(b2p[TMP_REG_2], (i));	      \
 					PPC_LDX(r, base, b2p[TMP_REG_2]);     \
 				} else					      \
-					PPC_LD(r, base, i);		      \
+					EMIT(PPC_RAW_LD(r, base, i));	      \
 				} while(0)
 #define PPC_BPF_STL(r, base, i) do {					      \
 				if ((i) % 4) {				      \
 					PPC_LI(b2p[TMP_REG_2], (i));	      \
 					PPC_STDX(r, base, b2p[TMP_REG_2]);    \
 				} else					      \
-					PPC_STD(r, base, i);		      \
+					EMIT(PPC_RAW_STD(r, base, i));	      \
 				} while(0)
 #define PPC_BPF_STLU(r, base, i) do { PPC_STDU(r, base, i); } while(0)
 
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 0acc9d5fb19e..abcf56c00be5 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -134,7 +134,7 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 			/*** ALU ops ***/
 		case BPF_ALU | BPF_ADD | BPF_X: /* A += X; */
 			ctx->seen |= SEEN_XREG;
-			PPC_ADD(r_A, r_A, r_X);
+			EMIT(PPC_RAW_ADD(r_A, r_A, r_X));
 			break;
 		case BPF_ALU | BPF_ADD | BPF_K: /* A += K; */
 			if (!K)
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index be3517ef0574..f721fbe6ca4d 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -239,7 +239,7 @@ static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32
 	 * if (index >= array->map.max_entries)
 	 *   goto out;
 	 */
-	PPC_LWZ(b2p[TMP_REG_1], b2p_bpf_array, offsetof(struct bpf_array, map.max_entries));
+	EMIT(PPC_RAW_LWZ(b2p[TMP_REG_1], b2p_bpf_array, offsetof(struct bpf_array, map.max_entries)));
 	PPC_RLWINM(b2p_index, b2p_index, 0, 0, 31);
 	PPC_CMPLW(b2p_index, b2p[TMP_REG_1]);
 	PPC_BCC(COND_GE, out);
@@ -260,7 +260,7 @@ static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32
 
 	/* prog = array->ptrs[index]; */
 	PPC_MULI(b2p[TMP_REG_1], b2p_index, 8);
-	PPC_ADD(b2p[TMP_REG_1], b2p[TMP_REG_1], b2p_bpf_array);
+	EMIT(PPC_RAW_ADD(b2p[TMP_REG_1], b2p[TMP_REG_1], b2p_bpf_array));
 	PPC_BPF_LL(b2p[TMP_REG_1], b2p[TMP_REG_1], offsetof(struct bpf_array, ptrs));
 
 	/*
@@ -340,7 +340,7 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 		 */
 		case BPF_ALU | BPF_ADD | BPF_X: /* (u32) dst += (u32) src */
 		case BPF_ALU64 | BPF_ADD | BPF_X: /* dst += src */
-			PPC_ADD(dst_reg, dst_reg, src_reg);
+			EMIT(PPC_RAW_ADD(dst_reg, dst_reg, src_reg));
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_SUB | BPF_X: /* (u32) dst -= (u32) src */
 		case BPF_ALU64 | BPF_SUB | BPF_X: /* dst -= src */
@@ -357,7 +357,7 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 					PPC_ADDI(dst_reg, dst_reg, IMM_L(imm));
 				else {
 					PPC_LI32(b2p[TMP_REG_1], imm);
-					PPC_ADD(dst_reg, dst_reg, b2p[TMP_REG_1]);
+					EMIT(PPC_RAW_ADD(dst_reg, dst_reg, b2p[TMP_REG_1]));
 				}
 			}
 			goto bpf_alu32_trunc;
@@ -689,9 +689,9 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 			PPC_ADDI(b2p[TMP_REG_1], dst_reg, off);
 			tmp_idx = ctx->idx * 4;
 			/* load value from memory into TMP_REG_2 */
-			PPC_BPF_LWARX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1], 0);
+			EMIT(PPC_RAW_LWARX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1], 0));
 			/* add value from src_reg into this */
-			PPC_ADD(b2p[TMP_REG_2], b2p[TMP_REG_2], src_reg);
+			EMIT(PPC_RAW_ADD(b2p[TMP_REG_2], b2p[TMP_REG_2], src_reg));
 			/* store result back */
 			PPC_BPF_STWCX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1]);
 			/* we're done if this succeeded */
@@ -701,9 +701,9 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 		case BPF_STX | BPF_XADD | BPF_DW:
 			PPC_ADDI(b2p[TMP_REG_1], dst_reg, off);
 			tmp_idx = ctx->idx * 4;
-			PPC_BPF_LDARX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1], 0);
-			PPC_ADD(b2p[TMP_REG_2], b2p[TMP_REG_2], src_reg);
-			PPC_BPF_STDCX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1]);
+			EMIT(PPC_RAW_LDARX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1], 0));
+			EMIT(PPC_RAW_ADD(b2p[TMP_REG_2], b2p[TMP_REG_2], src_reg));
+			EMIT(PPC_RAW_STDCX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1]));
 			PPC_BCC_SHORT(COND_NE, tmp_idx);
 			break;
 
@@ -724,7 +724,7 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 			break;
 		/* dst = *(u32 *)(ul) (src + off) */
 		case BPF_LDX | BPF_MEM | BPF_W:
-			PPC_LWZ(dst_reg, src_reg, off);
+			EMIT(PPC_RAW_LWZ(dst_reg, src_reg, off));
 			if (insn_is_zext(&insn[i + 1]))
 				addrs[++i] = ctx->idx * 4;
 			break;
-- 
2.24.1

