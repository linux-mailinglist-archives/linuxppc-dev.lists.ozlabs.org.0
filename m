Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2671E1D3D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 10:25:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49WRq80jxyzDqR0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 May 2020 18:25:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49WRcm0qxGzDqKv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 May 2020 18:16:23 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04Q834U6052392; Tue, 26 May 2020 04:16:15 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 317hehgknd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 May 2020 04:16:15 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04Q83EhW053011;
 Tue, 26 May 2020 04:16:13 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 317hehgkm9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 May 2020 04:16:13 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04Q8FmPW031094;
 Tue, 26 May 2020 08:16:10 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 316uf8j7t5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 26 May 2020 08:16:10 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 04Q8ErvX66060672
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 26 May 2020 08:14:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 401FEA405C;
 Tue, 26 May 2020 08:16:07 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D954A4062;
 Tue, 26 May 2020 08:16:03 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.49.28])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 26 May 2020 08:16:02 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 4/6] powerpc/ppc-opcode: consolidate powerpc instructions from
 bpf_jit.h
Date: Tue, 26 May 2020 13:45:21 +0530
Message-Id: <20200526081523.92463-5-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200526081523.92463-1-bala24@linux.ibm.com>
References: <20200526081523.92463-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-25_12:2020-05-25,
 2020-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 spamscore=0 cotscore=-2147483648 bulkscore=0 mlxscore=0
 suspectscore=1 mlxlogscore=999 malwarescore=0 clxscore=1015 adultscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005260064
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
Cc: christophe.leroy@c-s.fr, ravi.bangoria@linux.ibm.com, jniethe5@gmail.com,
 Balamuruhan S <bala24@linux.ibm.com>, paulus@samba.org, sandipan@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

move macro definitions of powerpc instructions from bpf_jit.h to ppc-opcode.h
and adopt the users of the macros accordingly. `PPC_MR()` is defined twice in
bpf_jit.h, remove the duplicate one.

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Tested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h | 139 +++++++++++++
 arch/powerpc/net/bpf_jit.h            | 166 ++-------------
 arch/powerpc/net/bpf_jit32.h          |  24 +--
 arch/powerpc/net/bpf_jit64.h          |  12 +-
 arch/powerpc/net/bpf_jit_comp.c       | 132 ++++++------
 arch/powerpc/net/bpf_jit_comp64.c     | 278 +++++++++++++-------------
 6 files changed, 378 insertions(+), 373 deletions(-)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index ca3f0351b878..94b889d89395 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -79,6 +79,16 @@
 #define IMM_L(i)               ((uintptr_t)(i) & 0xffff)
 #define IMM_DS(i)              ((uintptr_t)(i) & 0xfffc)
 
+/*
+ * 16-bit immediate helper macros: HA() is for use with sign-extending instrs
+ * (e.g. LD, ADDI).  If the bottom 16 bits is "-ve", add another bit into the
+ * top half to negate the effect (i.e. 0xffff + 1 = 0x(1)0000).
+ */
+#define IMM_H(i)                ((uintptr_t)(i)>>16)
+#define IMM_HA(i)               (((uintptr_t)(i)>>16) +                       \
+					(((uintptr_t)(i) & 0x8000) >> 15))
+
+
 /* opcode and xopcode for instructions */
 #define OP_TRAP 3
 #define OP_TRAP_64 2
@@ -640,6 +650,135 @@
 #define PPC_RAW_ADDC_DOT(t, a, b)	(PPC_INST_ADDC | ___PPC_RT(t) | \
 						___PPC_RA(a) | ___PPC_RB(b) | \
 						0x1)
+#define PPC_RAW_NOP()			(PPC_INST_NOP)
+#define PPC_RAW_BLR()			(PPC_INST_BLR)
+#define PPC_RAW_BLRL()			(PPC_INST_BLRL)
+#define PPC_RAW_MTLR(r)			(PPC_INST_MTLR | ___PPC_RT(r))
+#define PPC_RAW_BCTR()			(PPC_INST_BCTR)
+#define PPC_RAW_MTCTR(r)		(PPC_INST_MTCTR | ___PPC_RT(r))
+#define PPC_RAW_ADDI(d, a, i)		(PPC_INST_ADDI | ___PPC_RT(d) | \
+						___PPC_RA(a) | IMM_L(i))
+#define PPC_RAW_LI(r, i)		PPC_RAW_ADDI(r, 0, i)
+#define PPC_RAW_ADDIS(d, a, i)		(PPC_INST_ADDIS | \
+						___PPC_RT(d) | ___PPC_RA(a) | \
+						IMM_L(i))
+#define PPC_RAW_LIS(r, i)		PPC_RAW_ADDIS(r, 0, i)
+#define PPC_RAW_STDX(r, base, b)	(PPC_INST_STDX | ___PPC_RS(r) | \
+						___PPC_RA(base) | ___PPC_RB(b))
+#define PPC_RAW_STDU(r, base, i)	(PPC_INST_STDU | ___PPC_RS(r) | \
+						___PPC_RA(base) | \
+						((i) & 0xfffc))
+#define PPC_RAW_STW(r, base, i)		(PPC_INST_STW | ___PPC_RS(r) | \
+						___PPC_RA(base) | IMM_L(i))
+#define PPC_RAW_STWU(r, base, i)	(PPC_INST_STWU | ___PPC_RS(r) | \
+						___PPC_RA(base) | IMM_L(i))
+#define PPC_RAW_STH(r, base, i)		(PPC_INST_STH | ___PPC_RS(r) | \
+						___PPC_RA(base) | IMM_L(i))
+#define PPC_RAW_STB(r, base, i)		(PPC_INST_STB | ___PPC_RS(r) | \
+						___PPC_RA(base) | IMM_L(i))
+#define PPC_RAW_LBZ(r, base, i)		(PPC_INST_LBZ | ___PPC_RT(r) | \
+						___PPC_RA(base) | IMM_L(i))
+#define PPC_RAW_LDX(r, base, b)		(PPC_INST_LDX | ___PPC_RT(r) | \
+						___PPC_RA(base) | ___PPC_RB(b))
+#define PPC_RAW_LHZ(r, base, i)		(PPC_INST_LHZ | ___PPC_RT(r) | \
+						___PPC_RA(base) | IMM_L(i))
+#define PPC_RAW_LHBRX(r, base, b)	(PPC_INST_LHBRX | ___PPC_RT(r) | \
+						___PPC_RA(base) | ___PPC_RB(b))
+#define PPC_RAW_LDBRX(r, base, b)	(PPC_INST_LDBRX | ___PPC_RT(r) | \
+						___PPC_RA(base) | ___PPC_RB(b))
+#define PPC_RAW_STWCX(s, a, b)		(PPC_INST_STWCX | ___PPC_RS(s) | \
+						___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_CMPWI(a, i)		(PPC_INST_CMPWI | ___PPC_RA(a) | IMM_L(i))
+#define PPC_RAW_CMPDI(a, i)		(PPC_INST_CMPDI | ___PPC_RA(a) | IMM_L(i))
+#define PPC_RAW_CMPW(a, b)		(PPC_INST_CMPW | ___PPC_RA(a) | \
+		                                ___PPC_RB(b))
+#define PPC_RAW_CMPD(a, b)		(PPC_INST_CMPD | ___PPC_RA(a) | \
+						___PPC_RB(b))
+#define PPC_RAW_CMPLWI(a, i)		(PPC_INST_CMPLWI | ___PPC_RA(a) | IMM_L(i))
+#define PPC_RAW_CMPLDI(a, i)		(PPC_INST_CMPLDI | ___PPC_RA(a) | IMM_L(i))
+#define PPC_RAW_CMPLW(a, b)		(PPC_INST_CMPLW | ___PPC_RA(a) | \
+		                                ___PPC_RB(b))
+#define PPC_RAW_CMPLD(a, b)		(PPC_INST_CMPLD | ___PPC_RA(a) | \
+						___PPC_RB(b))
+#define PPC_RAW_SUB(d, a, b)		(PPC_INST_SUB | ___PPC_RT(d) | \
+		                                ___PPC_RB(a) | ___PPC_RA(b))
+#define PPC_RAW_MULD(d, a, b)		(PPC_INST_MULLD | ___PPC_RT(d) | \
+						___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_MULW(d, a, b)		(PPC_INST_MULLW | ___PPC_RT(d) | \
+		                                ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_MULHWU(d, a, b)		(PPC_INST_MULHWU | ___PPC_RT(d) | \
+		                                ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_MULI(d, a, i)		(PPC_INST_MULLI | ___PPC_RT(d) | \
+						___PPC_RA(a) | IMM_L(i))
+#define PPC_RAW_DIVWU(d, a, b)		(PPC_INST_DIVWU | ___PPC_RT(d) | \
+		                                ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_DIVDU(d, a, b)		(PPC_INST_DIVDU | ___PPC_RT(d) | \
+		                                ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_RAW_AND(d, a, b)		(PPC_INST_AND | ___PPC_RA(d) | \
+		                                ___PPC_RS(a) | ___PPC_RB(b))
+#define PPC_RAW_ANDI(d, a, i)		(PPC_INST_ANDI | ___PPC_RA(d) | \
+						___PPC_RS(a) | IMM_L(i))
+#define PPC_RAW_AND_DOT(d, a, b)	(PPC_INST_ANDDOT | ___PPC_RA(d) | \
+		                                ___PPC_RS(a) | ___PPC_RB(b))
+#define PPC_RAW_OR(d, a, b)		(PPC_INST_OR | ___PPC_RA(d) | \
+		                                ___PPC_RS(a) | ___PPC_RB(b))
+#define PPC_RAW_MR(d, a)		PPC_RAW_OR(d, a, a)
+#define PPC_RAW_ORI(d, a, i)		(PPC_INST_ORI | ___PPC_RA(d) | \
+		                                ___PPC_RS(a) | IMM_L(i))
+#define PPC_RAW_ORIS(d, a, i)		(PPC_INST_ORIS | ___PPC_RA(d) | \
+		                                ___PPC_RS(a) | IMM_L(i))
+#define PPC_RAW_XOR(d, a, b)		(PPC_INST_XOR | ___PPC_RA(d) | \
+						___PPC_RS(a) | ___PPC_RB(b))
+#define PPC_RAW_XORI(d, a, i)		(PPC_INST_XORI | ___PPC_RA(d) | \
+		                                ___PPC_RS(a) | IMM_L(i))
+#define PPC_RAW_XORIS(d, a, i)		(PPC_INST_XORIS | ___PPC_RA(d) | \
+						___PPC_RS(a) | IMM_L(i))
+#define PPC_RAW_EXTSW(d, a)		(PPC_INST_EXTSW | ___PPC_RA(d) | \
+						___PPC_RS(a))
+#define PPC_RAW_SLW(d, a, s)		(PPC_INST_SLW | ___PPC_RA(d) | \
+						___PPC_RS(a) | ___PPC_RB(s))
+#define PPC_RAW_SLD(d, a, s)		(PPC_INST_SLD | ___PPC_RA(d) | \
+						___PPC_RS(a) | ___PPC_RB(s))
+#define PPC_RAW_SRW(d, a, s)		(PPC_INST_SRW | ___PPC_RA(d) | \
+						___PPC_RS(a) | ___PPC_RB(s))
+#define PPC_RAW_SRAW(d, a, s)		(PPC_INST_SRAW | ___PPC_RA(d) | \
+						___PPC_RS(a) | ___PPC_RB(s))
+#define PPC_RAW_SRAWI(d, a, i)		(PPC_INST_SRAWI | ___PPC_RA(d) | \
+						___PPC_RS(a) | __PPC_SH(i))
+#define PPC_RAW_SRD(d, a, s)		(PPC_INST_SRD | ___PPC_RA(d) | \
+						___PPC_RS(a) | ___PPC_RB(s))
+#define PPC_RAW_SRAD(d, a, s)		(PPC_INST_SRAD | ___PPC_RA(d) | \
+						___PPC_RS(a) | ___PPC_RB(s))
+#define PPC_RAW_SRADI(d, a, i)		(PPC_INST_SRADI | ___PPC_RA(d) | \
+						___PPC_RS(a) | __PPC_SH64(i))
+#define PPC_RAW_RLWINM(d, a, i, mb, me)	(PPC_INST_RLWINM | ___PPC_RA(d) | \
+						___PPC_RS(a) | __PPC_SH(i) | \
+						__PPC_MB(mb) | __PPC_ME(me))
+#define PPC_RAW_RLWINM_DOT(d, a, i, mb, me) \
+					(PPC_INST_RLWINM_DOT | ___PPC_RA(d) | \
+						___PPC_RS(a) | __PPC_SH(i) | \
+						__PPC_MB(mb) | __PPC_ME(me))
+#define PPC_RAW_RLWIMI(d, a, i, mb, me) (PPC_INST_RLWIMI | ___PPC_RA(d) | \
+						___PPC_RS(a) | __PPC_SH(i) | \
+						__PPC_MB(mb) | __PPC_ME(me))
+#define PPC_RAW_RLDICL(d, a, i, mb)     (PPC_INST_RLDICL | ___PPC_RA(d) | \
+						___PPC_RS(a) | __PPC_SH64(i) | \
+						__PPC_MB64(mb))
+#define PPC_RAW_RLDICR(d, a, i, me)     (PPC_INST_RLDICR | ___PPC_RA(d) | \
+		                                ___PPC_RS(a) | __PPC_SH64(i) | \
+		                                __PPC_ME64(me))
+
+/* slwi = rlwinm Rx, Ry, n, 0, 31-n */
+#define PPC_RAW_SLWI(d, a, i)		PPC_RAW_RLWINM(d, a, i, 0, 31-(i))
+/* srwi = rlwinm Rx, Ry, 32-n, n, 31 */
+#define PPC_RAW_SRWI(d, a, i)		PPC_RAW_RLWINM(d, a, 32-(i), i, 31)
+/* sldi = rldicr Rx, Ry, n, 63-n */
+#define PPC_RAW_SLDI(d, a, i)		PPC_RAW_RLDICR(d, a, i, 63-(i))
+/* sldi = rldicl Rx, Ry, 64-n, n */
+#define PPC_RAW_SRDI(d, a, i)		PPC_RAW_RLDICL(d, a, 64-(i), i)
+
+#define PPC_RAW_NEG(d, a)		(PPC_INST_NEG | ___PPC_RT(d) | \
+						___PPC_RA(a))
 
 /* Deal with instructions that older assemblers aren't aware of */
 #define	PPC_CP_ABORT		stringify_in_c(.long PPC_INST_CP_ABORT)
diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
index 535d1de4dfee..d0a67a1bbaf1 100644
--- a/arch/powerpc/net/bpf_jit.h
+++ b/arch/powerpc/net/bpf_jit.h
@@ -19,150 +19,10 @@
 #define FUNCTION_DESCR_SIZE	0
 #endif
 
-/*
- * 16-bit immediate helper macros: HA() is for use with sign-extending instrs
- * (e.g. LD, ADDI).  If the bottom 16 bits is "-ve", add another bit into the
- * top half to negate the effect (i.e. 0xffff + 1 = 0x(1)0000).
- */
-#define IMM_H(i)		((uintptr_t)(i)>>16)
-#define IMM_HA(i)		(((uintptr_t)(i)>>16) +			      \
-					(((uintptr_t)(i) & 0x8000) >> 15))
-
 #define PLANT_INSTR(d, idx, instr)					      \
 	do { if (d) { (d)[idx] = instr; } idx++; } while (0)
 #define EMIT(instr)		PLANT_INSTR(image, ctx->idx, instr)
 
-#define PPC_NOP()		EMIT(PPC_INST_NOP)
-#define PPC_BLR()		EMIT(PPC_INST_BLR)
-#define PPC_BLRL()		EMIT(PPC_INST_BLRL)
-#define PPC_MTLR(r)		EMIT(PPC_INST_MTLR | ___PPC_RT(r))
-#define PPC_BCTR()		EMIT(PPC_INST_BCTR)
-#define PPC_MTCTR(r)		EMIT(PPC_INST_MTCTR | ___PPC_RT(r))
-#define PPC_ADDI(d, a, i)	EMIT(PPC_INST_ADDI | ___PPC_RT(d) |	      \
-				     ___PPC_RA(a) | IMM_L(i))
-#define PPC_MR(d, a)		PPC_OR(d, a, a)
-#define PPC_LI(r, i)		PPC_ADDI(r, 0, i)
-#define PPC_ADDIS(d, a, i)	EMIT(PPC_INST_ADDIS |			      \
-				     ___PPC_RT(d) | ___PPC_RA(a) | IMM_L(i))
-#define PPC_LIS(r, i)		PPC_ADDIS(r, 0, i)
-#define PPC_STDX(r, base, b)	EMIT(PPC_INST_STDX | ___PPC_RS(r) |	      \
-				     ___PPC_RA(base) | ___PPC_RB(b))
-#define PPC_STDU(r, base, i)	EMIT(PPC_INST_STDU | ___PPC_RS(r) |	      \
-				     ___PPC_RA(base) | ((i) & 0xfffc))
-#define PPC_STW(r, base, i)	EMIT(PPC_INST_STW | ___PPC_RS(r) |	      \
-				     ___PPC_RA(base) | IMM_L(i))
-#define PPC_STWU(r, base, i)	EMIT(PPC_INST_STWU | ___PPC_RS(r) |	      \
-				     ___PPC_RA(base) | IMM_L(i))
-#define PPC_STH(r, base, i)	EMIT(PPC_INST_STH | ___PPC_RS(r) |	      \
-				     ___PPC_RA(base) | IMM_L(i))
-#define PPC_STB(r, base, i)	EMIT(PPC_INST_STB | ___PPC_RS(r) |	      \
-				     ___PPC_RA(base) | IMM_L(i))
-
-#define PPC_LBZ(r, base, i)	EMIT(PPC_INST_LBZ | ___PPC_RT(r) |	      \
-				     ___PPC_RA(base) | IMM_L(i))
-#define PPC_LDX(r, base, b)	EMIT(PPC_INST_LDX | ___PPC_RT(r) |	      \
-				     ___PPC_RA(base) | ___PPC_RB(b))
-#define PPC_LHZ(r, base, i)	EMIT(PPC_INST_LHZ | ___PPC_RT(r) |	      \
-				     ___PPC_RA(base) | IMM_L(i))
-#define PPC_LHBRX(r, base, b)	EMIT(PPC_INST_LHBRX | ___PPC_RT(r) |	      \
-				     ___PPC_RA(base) | ___PPC_RB(b))
-#define PPC_LDBRX(r, base, b)	EMIT(PPC_INST_LDBRX | ___PPC_RT(r) |	      \
-				     ___PPC_RA(base) | ___PPC_RB(b))
-
-#define PPC_BPF_STWCX(s, a, b)	EMIT(PPC_INST_STWCX | ___PPC_RS(s) |	      \
-					___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_CMPWI(a, i)		EMIT(PPC_INST_CMPWI | ___PPC_RA(a) | IMM_L(i))
-#define PPC_CMPDI(a, i)		EMIT(PPC_INST_CMPDI | ___PPC_RA(a) | IMM_L(i))
-#define PPC_CMPW(a, b)		EMIT(PPC_INST_CMPW | ___PPC_RA(a) |	      \
-					___PPC_RB(b))
-#define PPC_CMPD(a, b)		EMIT(PPC_INST_CMPD | ___PPC_RA(a) |	      \
-					___PPC_RB(b))
-#define PPC_CMPLWI(a, i)	EMIT(PPC_INST_CMPLWI | ___PPC_RA(a) | IMM_L(i))
-#define PPC_CMPLDI(a, i)	EMIT(PPC_INST_CMPLDI | ___PPC_RA(a) | IMM_L(i))
-#define PPC_CMPLW(a, b)		EMIT(PPC_INST_CMPLW | ___PPC_RA(a) |	      \
-					___PPC_RB(b))
-#define PPC_CMPLD(a, b)		EMIT(PPC_INST_CMPLD | ___PPC_RA(a) |	      \
-					___PPC_RB(b))
-
-#define PPC_SUB(d, a, b)	EMIT(PPC_INST_SUB | ___PPC_RT(d) |	      \
-				     ___PPC_RB(a) | ___PPC_RA(b))
-#define PPC_MULD(d, a, b)	EMIT(PPC_INST_MULLD | ___PPC_RT(d) |	      \
-				     ___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_MULW(d, a, b)	EMIT(PPC_INST_MULLW | ___PPC_RT(d) |	      \
-				     ___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_MULHWU(d, a, b)	EMIT(PPC_INST_MULHWU | ___PPC_RT(d) |	      \
-				     ___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_MULI(d, a, i)	EMIT(PPC_INST_MULLI | ___PPC_RT(d) |	      \
-				     ___PPC_RA(a) | IMM_L(i))
-#define PPC_DIVWU(d, a, b)	EMIT(PPC_INST_DIVWU | ___PPC_RT(d) |	      \
-				     ___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_DIVDU(d, a, b)	EMIT(PPC_INST_DIVDU | ___PPC_RT(d) |	      \
-				     ___PPC_RA(a) | ___PPC_RB(b))
-#define PPC_AND(d, a, b)	EMIT(PPC_INST_AND | ___PPC_RA(d) |	      \
-				     ___PPC_RS(a) | ___PPC_RB(b))
-#define PPC_ANDI(d, a, i)	EMIT(PPC_INST_ANDI | ___PPC_RA(d) |	      \
-				     ___PPC_RS(a) | IMM_L(i))
-#define PPC_AND_DOT(d, a, b)	EMIT(PPC_INST_ANDDOT | ___PPC_RA(d) |	      \
-				     ___PPC_RS(a) | ___PPC_RB(b))
-#define PPC_OR(d, a, b)		EMIT(PPC_INST_OR | ___PPC_RA(d) |	      \
-				     ___PPC_RS(a) | ___PPC_RB(b))
-#define PPC_MR(d, a)		PPC_OR(d, a, a)
-#define PPC_ORI(d, a, i)	EMIT(PPC_INST_ORI | ___PPC_RA(d) |	      \
-				     ___PPC_RS(a) | IMM_L(i))
-#define PPC_ORIS(d, a, i)	EMIT(PPC_INST_ORIS | ___PPC_RA(d) |	      \
-				     ___PPC_RS(a) | IMM_L(i))
-#define PPC_XOR(d, a, b)	EMIT(PPC_INST_XOR | ___PPC_RA(d) |	      \
-				     ___PPC_RS(a) | ___PPC_RB(b))
-#define PPC_XORI(d, a, i)	EMIT(PPC_INST_XORI | ___PPC_RA(d) |	      \
-				     ___PPC_RS(a) | IMM_L(i))
-#define PPC_XORIS(d, a, i)	EMIT(PPC_INST_XORIS | ___PPC_RA(d) |	      \
-				     ___PPC_RS(a) | IMM_L(i))
-#define PPC_EXTSW(d, a)		EMIT(PPC_INST_EXTSW | ___PPC_RA(d) |	      \
-				     ___PPC_RS(a))
-#define PPC_SLW(d, a, s)	EMIT(PPC_INST_SLW | ___PPC_RA(d) |	      \
-				     ___PPC_RS(a) | ___PPC_RB(s))
-#define PPC_SLD(d, a, s)	EMIT(PPC_INST_SLD | ___PPC_RA(d) |	      \
-				     ___PPC_RS(a) | ___PPC_RB(s))
-#define PPC_SRW(d, a, s)	EMIT(PPC_INST_SRW | ___PPC_RA(d) |	      \
-				     ___PPC_RS(a) | ___PPC_RB(s))
-#define PPC_SRAW(d, a, s)	EMIT(PPC_INST_SRAW | ___PPC_RA(d) |	      \
-				     ___PPC_RS(a) | ___PPC_RB(s))
-#define PPC_SRAWI(d, a, i)	EMIT(PPC_INST_SRAWI | ___PPC_RA(d) |	      \
-				     ___PPC_RS(a) | __PPC_SH(i))
-#define PPC_SRD(d, a, s)	EMIT(PPC_INST_SRD | ___PPC_RA(d) |	      \
-				     ___PPC_RS(a) | ___PPC_RB(s))
-#define PPC_SRAD(d, a, s)	EMIT(PPC_INST_SRAD | ___PPC_RA(d) |	      \
-				     ___PPC_RS(a) | ___PPC_RB(s))
-#define PPC_SRADI(d, a, i)	EMIT(PPC_INST_SRADI | ___PPC_RA(d) |	      \
-				     ___PPC_RS(a) | __PPC_SH64(i))
-#define PPC_RLWINM(d, a, i, mb, me)	EMIT(PPC_INST_RLWINM | ___PPC_RA(d) | \
-					___PPC_RS(a) | __PPC_SH(i) |	      \
-					__PPC_MB(mb) | __PPC_ME(me))
-#define PPC_RLWINM_DOT(d, a, i, mb, me)	EMIT(PPC_INST_RLWINM_DOT |	      \
-					___PPC_RA(d) | ___PPC_RS(a) |	      \
-					__PPC_SH(i) | __PPC_MB(mb) |	      \
-					__PPC_ME(me))
-#define PPC_RLWIMI(d, a, i, mb, me)	EMIT(PPC_INST_RLWIMI | ___PPC_RA(d) | \
-					___PPC_RS(a) | __PPC_SH(i) |	      \
-					__PPC_MB(mb) | __PPC_ME(me))
-#define PPC_RLDICL(d, a, i, mb)		EMIT(PPC_INST_RLDICL | ___PPC_RA(d) | \
-					___PPC_RS(a) | __PPC_SH64(i) |	      \
-					__PPC_MB64(mb))
-#define PPC_RLDICR(d, a, i, me)		EMIT(PPC_INST_RLDICR | ___PPC_RA(d) | \
-					___PPC_RS(a) | __PPC_SH64(i) |	      \
-					__PPC_ME64(me))
-
-/* slwi = rlwinm Rx, Ry, n, 0, 31-n */
-#define PPC_SLWI(d, a, i)	PPC_RLWINM(d, a, i, 0, 31-(i))
-/* srwi = rlwinm Rx, Ry, 32-n, n, 31 */
-#define PPC_SRWI(d, a, i)	PPC_RLWINM(d, a, 32-(i), i, 31)
-/* sldi = rldicr Rx, Ry, n, 63-n */
-#define PPC_SLDI(d, a, i)	PPC_RLDICR(d, a, i, 63-(i))
-/* sldi = rldicl Rx, Ry, 64-n, n */
-#define PPC_SRDI(d, a, i)	PPC_RLDICL(d, a, 64-(i), i)
-
-#define PPC_NEG(d, a)		EMIT(PPC_INST_NEG | ___PPC_RT(d) | ___PPC_RA(a))
-
 /* Long jump; (unconditional 'branch') */
 #define PPC_JMP(dest)		EMIT(PPC_INST_BRANCH |			      \
 				     (((dest) - (ctx->idx * 4)) & 0x03fffffc))
@@ -175,11 +35,11 @@
 #define PPC_LI32(d, i)		do {					      \
 		if ((int)(uintptr_t)(i) >= -32768 &&			      \
 				(int)(uintptr_t)(i) < 32768)		      \
-			PPC_LI(d, i);					      \
+			EMIT(PPC_RAW_LI(d, i));				      \
 		else {							      \
-			PPC_LIS(d, IMM_H(i));				      \
+			EMIT(PPC_RAW_LIS(d, IMM_H(i)));			      \
 			if (IMM_L(i))					      \
-				PPC_ORI(d, d, IMM_L(i));		      \
+				EMIT(PPC_RAW_ORI(d, d, IMM_L(i)));	      \
 		} } while(0)
 
 #define PPC_LI64(d, i)		do {					      \
@@ -188,19 +48,21 @@
 			PPC_LI32(d, i);					      \
 		else {							      \
 			if (!((uintptr_t)(i) & 0xffff800000000000ULL))	      \
-				PPC_LI(d, ((uintptr_t)(i) >> 32) & 0xffff);   \
+				EMIT(PPC_RAW_LI(d, ((uintptr_t)(i) >> 32) &   \
+						0xffff));		      \
 			else {						      \
-				PPC_LIS(d, ((uintptr_t)(i) >> 48));	      \
+				EMIT(PPC_RAW_LIS(d, ((uintptr_t)(i) >> 48))); \
 				if ((uintptr_t)(i) & 0x0000ffff00000000ULL)   \
-					PPC_ORI(d, d,			      \
-					  ((uintptr_t)(i) >> 32) & 0xffff);   \
+					EMIT(PPC_RAW_ORI(d, d,		      \
+					  ((uintptr_t)(i) >> 32) & 0xffff));  \
 			}						      \
-			PPC_SLDI(d, d, 32);				      \
+			EMIT(PPC_RAW_SLDI(d, d, 32));			      \
 			if ((uintptr_t)(i) & 0x00000000ffff0000ULL)	      \
-				PPC_ORIS(d, d,				      \
-					 ((uintptr_t)(i) >> 16) & 0xffff);    \
+				EMIT(PPC_RAW_ORIS(d, d,			      \
+					 ((uintptr_t)(i) >> 16) & 0xffff));   \
 			if ((uintptr_t)(i) & 0x000000000000ffffULL)	      \
-				PPC_ORI(d, d, (uintptr_t)(i) & 0xffff);	      \
+				EMIT(PPC_RAW_ORI(d, d, (uintptr_t)(i) &       \
+							0xffff));             \
 		} } while (0)
 
 #ifdef CONFIG_PPC64
@@ -224,7 +86,7 @@ static inline bool is_nearbranch(int offset)
 #define PPC_BCC(cond, dest)	do {					      \
 		if (is_nearbranch((dest) - (ctx->idx * 4))) {		      \
 			PPC_BCC_SHORT(cond, dest);			      \
-			PPC_NOP();					      \
+			EMIT(PPC_RAW_NOP());				      \
 		} else {						      \
 			/* Flip the 'T or F' bit to invert comparison */      \
 			PPC_BCC_SHORT(cond ^ COND_CMP_TRUE, (ctx->idx+2)*4);  \
diff --git a/arch/powerpc/net/bpf_jit32.h b/arch/powerpc/net/bpf_jit32.h
index 753c244a7cf9..448dfd4d98e1 100644
--- a/arch/powerpc/net/bpf_jit32.h
+++ b/arch/powerpc/net/bpf_jit32.h
@@ -72,21 +72,21 @@ DECLARE_LOAD_FUNC(sk_load_half);
 DECLARE_LOAD_FUNC(sk_load_byte);
 DECLARE_LOAD_FUNC(sk_load_byte_msh);
 
-#define PPC_LBZ_OFFS(r, base, i) do { if ((i) < 32768) PPC_LBZ(r, base, i);   \
-		else {	PPC_ADDIS(r, base, IMM_HA(i));			      \
-			PPC_LBZ(r, r, IMM_L(i)); } } while(0)
+#define PPC_LBZ_OFFS(r, base, i) do { if ((i) < 32768) EMIT(PPC_RAW_LBZ(r, base, i));   \
+		else {	EMIT(PPC_RAW_ADDIS(r, base, IMM_HA(i)));	      \
+			EMIT(PPC_RAW_LBZ(r, r, IMM_L(i))); } } while(0)
 
 #define PPC_LD_OFFS(r, base, i) do { if ((i) < 32768) EMIT(PPC_RAW_LD(r, base, i));     \
-		else {	PPC_ADDIS(r, base, IMM_HA(i));			      \
+		else {	EMIT(PPC_RAW_ADDIS(r, base, IMM_HA(i)));			\
 			EMIT(PPC_RAW_LD(r, r, IMM_L(i))); } } while(0)
 
 #define PPC_LWZ_OFFS(r, base, i) do { if ((i) < 32768) EMIT(PPC_RAW_LWZ(r, base, i));   \
-		else {	PPC_ADDIS(r, base, IMM_HA(i));			      \
+		else {	EMIT(PPC_RAW_ADDIS(r, base, IMM_HA(i)));			\
 			EMIT(PPC_RAW_LWZ(r, r, IMM_L(i))); } } while(0)
 
-#define PPC_LHZ_OFFS(r, base, i) do { if ((i) < 32768) PPC_LHZ(r, base, i);   \
-		else {	PPC_ADDIS(r, base, IMM_HA(i));			      \
-			PPC_LHZ(r, r, IMM_L(i)); } } while(0)
+#define PPC_LHZ_OFFS(r, base, i) do { if ((i) < 32768) EMIT(PPC_RAW_LHZ(r, base, i));   \
+		else {	EMIT(PPC_RAW_ADDIS(r, base, IMM_HA(i)));			\
+			EMIT(PPC_RAW_LHZ(r, r, IMM_L(i))); } } while(0)
 
 #ifdef CONFIG_PPC64
 #define PPC_LL_OFFS(r, base, i) do { PPC_LD_OFFS(r, base, i); } while(0)
@@ -107,11 +107,11 @@ DECLARE_LOAD_FUNC(sk_load_byte_msh);
 	} while(0)
 #endif
 #else
-#define PPC_BPF_LOAD_CPU(r) do { PPC_LI(r, 0); } while(0)
+#define PPC_BPF_LOAD_CPU(r) do { EMIT(PPC_RAW_LI(r, 0)); } while(0)
 #endif
 
 #define PPC_LHBRX_OFFS(r, base, i) \
-		do { PPC_LI32(r, i); PPC_LHBRX(r, r, base); } while(0)
+		do { PPC_LI32(r, i); EMIT(PPC_RAW_LHBRX(r, r, base)); } while(0)
 #ifdef __LITTLE_ENDIAN__
 #define PPC_NTOHS_OFFS(r, base, i)	PPC_LHBRX_OFFS(r, base, i)
 #else
@@ -119,8 +119,8 @@ DECLARE_LOAD_FUNC(sk_load_byte_msh);
 #endif
 
 #define PPC_BPF_LL(r, base, i) do { EMIT(PPC_RAW_LWZ(r, base, i)); } while(0)
-#define PPC_BPF_STL(r, base, i) do { PPC_STW(r, base, i); } while(0)
-#define PPC_BPF_STLU(r, base, i) do { PPC_STWU(r, base, i); } while(0)
+#define PPC_BPF_STL(r, base, i) do { EMIT(PPC_RAW_STW(r, base, i)); } while(0)
+#define PPC_BPF_STLU(r, base, i) do { EMIT(PPC_RAW_STWU(r, base, i)); } while(0)
 
 #define SEEN_DATAREF 0x10000 /* might call external helpers */
 #define SEEN_XREG    0x20000 /* X reg is used */
diff --git a/arch/powerpc/net/bpf_jit64.h b/arch/powerpc/net/bpf_jit64.h
index c144a3777158..2e33c6673ff9 100644
--- a/arch/powerpc/net/bpf_jit64.h
+++ b/arch/powerpc/net/bpf_jit64.h
@@ -70,19 +70,21 @@ static const int b2p[] = {
  */
 #define PPC_BPF_LL(r, base, i) do {					      \
 				if ((i) % 4) {				      \
-					PPC_LI(b2p[TMP_REG_2], (i));	      \
-					PPC_LDX(r, base, b2p[TMP_REG_2]);     \
+					EMIT(PPC_RAW_LI(b2p[TMP_REG_2], (i)));\
+					EMIT(PPC_RAW_LDX(r, base,	      \
+							b2p[TMP_REG_2]));     \
 				} else					      \
 					EMIT(PPC_RAW_LD(r, base, i));	      \
 				} while(0)
 #define PPC_BPF_STL(r, base, i) do {					      \
 				if ((i) % 4) {				      \
-					PPC_LI(b2p[TMP_REG_2], (i));	      \
-					PPC_STDX(r, base, b2p[TMP_REG_2]);    \
+					EMIT(PPC_RAW_LI(b2p[TMP_REG_2], (i)));\
+					EMIT(PPC_RAW_STDX(r, base,	      \
+							b2p[TMP_REG_2]));     \
 				} else					      \
 					EMIT(PPC_RAW_STD(r, base, i));	      \
 				} while(0)
-#define PPC_BPF_STLU(r, base, i) do { PPC_STDU(r, base, i); } while(0)
+#define PPC_BPF_STLU(r, base, i) do { EMIT(PPC_RAW_STDU(r, base, i)); } while(0)
 
 #define SEEN_FUNC	0x1000 /* might call external helpers */
 #define SEEN_STACK	0x2000 /* uses BPF stack */
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index abcf56c00be5..16d09b36fe06 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -61,7 +61,7 @@ static void bpf_jit_build_prologue(struct bpf_prog *fp, u32 *image,
 		PPC_LWZ_OFFS(r_scratch1, r_skb, offsetof(struct sk_buff,
 							 data_len));
 		PPC_LWZ_OFFS(r_HL, r_skb, offsetof(struct sk_buff, len));
-		PPC_SUB(r_HL, r_HL, r_scratch1);
+		EMIT(PPC_RAW_SUB(r_HL, r_HL, r_scratch1));
 		PPC_LL_OFFS(r_D, r_skb, offsetof(struct sk_buff, data));
 	}
 
@@ -70,12 +70,12 @@ static void bpf_jit_build_prologue(struct bpf_prog *fp, u32 *image,
 		 * TODO: Could also detect whether first instr. sets X and
 		 * avoid this (as below, with A).
 		 */
-		PPC_LI(r_X, 0);
+		EMIT(PPC_RAW_LI(r_X, 0));
 	}
 
 	/* make sure we dont leak kernel information to user */
 	if (bpf_needs_clear_a(&filter[0]))
-		PPC_LI(r_A, 0);
+		EMIT(PPC_RAW_LI(r_A, 0));
 }
 
 static void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
@@ -83,10 +83,10 @@ static void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
 	int i;
 
 	if (ctx->seen & (SEEN_MEM | SEEN_DATAREF)) {
-		PPC_ADDI(1, 1, BPF_PPC_STACKFRAME);
+		EMIT(PPC_RAW_ADDI(1, 1, BPF_PPC_STACKFRAME));
 		if (ctx->seen & SEEN_DATAREF) {
 			PPC_BPF_LL(0, 1, PPC_LR_STKOFF);
-			PPC_MTLR(0);
+			EMIT(PPC_RAW_MTLR(0));
 			PPC_BPF_LL(r_D, 1, -(REG_SZ*(32-r_D)));
 			PPC_BPF_LL(r_HL, 1, -(REG_SZ*(32-r_HL)));
 		}
@@ -100,7 +100,7 @@ static void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
 	}
 	/* The RETs have left a return value in R3. */
 
-	PPC_BLR();
+	EMIT(PPC_RAW_BLR());
 }
 
 #define CHOOSE_LOAD_FUNC(K, func) \
@@ -139,119 +139,119 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 		case BPF_ALU | BPF_ADD | BPF_K: /* A += K; */
 			if (!K)
 				break;
-			PPC_ADDI(r_A, r_A, IMM_L(K));
+			EMIT(PPC_RAW_ADDI(r_A, r_A, IMM_L(K)));
 			if (K >= 32768)
-				PPC_ADDIS(r_A, r_A, IMM_HA(K));
+				EMIT(PPC_RAW_ADDIS(r_A, r_A, IMM_HA(K)));
 			break;
 		case BPF_ALU | BPF_SUB | BPF_X: /* A -= X; */
 			ctx->seen |= SEEN_XREG;
-			PPC_SUB(r_A, r_A, r_X);
+			EMIT(PPC_RAW_SUB(r_A, r_A, r_X));
 			break;
 		case BPF_ALU | BPF_SUB | BPF_K: /* A -= K */
 			if (!K)
 				break;
-			PPC_ADDI(r_A, r_A, IMM_L(-K));
+			EMIT(PPC_RAW_ADDI(r_A, r_A, IMM_L(-K)));
 			if (K >= 32768)
-				PPC_ADDIS(r_A, r_A, IMM_HA(-K));
+				EMIT(PPC_RAW_ADDIS(r_A, r_A, IMM_HA(-K)));
 			break;
 		case BPF_ALU | BPF_MUL | BPF_X: /* A *= X; */
 			ctx->seen |= SEEN_XREG;
-			PPC_MULW(r_A, r_A, r_X);
+			EMIT(PPC_RAW_MULW(r_A, r_A, r_X));
 			break;
 		case BPF_ALU | BPF_MUL | BPF_K: /* A *= K */
 			if (K < 32768)
-				PPC_MULI(r_A, r_A, K);
+				EMIT(PPC_RAW_MULI(r_A, r_A, K));
 			else {
 				PPC_LI32(r_scratch1, K);
-				PPC_MULW(r_A, r_A, r_scratch1);
+				EMIT(PPC_RAW_MULW(r_A, r_A, r_scratch1));
 			}
 			break;
 		case BPF_ALU | BPF_MOD | BPF_X: /* A %= X; */
 		case BPF_ALU | BPF_DIV | BPF_X: /* A /= X; */
 			ctx->seen |= SEEN_XREG;
-			PPC_CMPWI(r_X, 0);
+			EMIT(PPC_RAW_CMPWI(r_X, 0));
 			if (ctx->pc_ret0 != -1) {
 				PPC_BCC(COND_EQ, addrs[ctx->pc_ret0]);
 			} else {
 				PPC_BCC_SHORT(COND_NE, (ctx->idx*4)+12);
-				PPC_LI(r_ret, 0);
+				EMIT(PPC_RAW_LI(r_ret, 0));
 				PPC_JMP(exit_addr);
 			}
 			if (code == (BPF_ALU | BPF_MOD | BPF_X)) {
-				PPC_DIVWU(r_scratch1, r_A, r_X);
-				PPC_MULW(r_scratch1, r_X, r_scratch1);
-				PPC_SUB(r_A, r_A, r_scratch1);
+				EMIT(PPC_RAW_DIVWU(r_scratch1, r_A, r_X));
+				EMIT(PPC_RAW_MULW(r_scratch1, r_X, r_scratch1));
+				EMIT(PPC_RAW_SUB(r_A, r_A, r_scratch1));
 			} else {
-				PPC_DIVWU(r_A, r_A, r_X);
+				EMIT(PPC_RAW_DIVWU(r_A, r_A, r_X));
 			}
 			break;
 		case BPF_ALU | BPF_MOD | BPF_K: /* A %= K; */
 			PPC_LI32(r_scratch2, K);
-			PPC_DIVWU(r_scratch1, r_A, r_scratch2);
-			PPC_MULW(r_scratch1, r_scratch2, r_scratch1);
-			PPC_SUB(r_A, r_A, r_scratch1);
+			EMIT(PPC_RAW_DIVWU(r_scratch1, r_A, r_scratch2));
+			EMIT(PPC_RAW_MULW(r_scratch1, r_scratch2, r_scratch1));
+			EMIT(PPC_RAW_SUB(r_A, r_A, r_scratch1));
 			break;
 		case BPF_ALU | BPF_DIV | BPF_K: /* A /= K */
 			if (K == 1)
 				break;
 			PPC_LI32(r_scratch1, K);
-			PPC_DIVWU(r_A, r_A, r_scratch1);
+			EMIT(PPC_RAW_DIVWU(r_A, r_A, r_scratch1));
 			break;
 		case BPF_ALU | BPF_AND | BPF_X:
 			ctx->seen |= SEEN_XREG;
-			PPC_AND(r_A, r_A, r_X);
+			EMIT(PPC_RAW_AND(r_A, r_A, r_X));
 			break;
 		case BPF_ALU | BPF_AND | BPF_K:
 			if (!IMM_H(K))
-				PPC_ANDI(r_A, r_A, K);
+				EMIT(PPC_RAW_ANDI(r_A, r_A, K));
 			else {
 				PPC_LI32(r_scratch1, K);
-				PPC_AND(r_A, r_A, r_scratch1);
+				EMIT(PPC_RAW_AND(r_A, r_A, r_scratch1));
 			}
 			break;
 		case BPF_ALU | BPF_OR | BPF_X:
 			ctx->seen |= SEEN_XREG;
-			PPC_OR(r_A, r_A, r_X);
+			EMIT(PPC_RAW_OR(r_A, r_A, r_X));
 			break;
 		case BPF_ALU | BPF_OR | BPF_K:
 			if (IMM_L(K))
-				PPC_ORI(r_A, r_A, IMM_L(K));
+				EMIT(PPC_RAW_ORI(r_A, r_A, IMM_L(K)));
 			if (K >= 65536)
-				PPC_ORIS(r_A, r_A, IMM_H(K));
+				EMIT(PPC_RAW_ORIS(r_A, r_A, IMM_H(K)));
 			break;
 		case BPF_ANC | SKF_AD_ALU_XOR_X:
 		case BPF_ALU | BPF_XOR | BPF_X: /* A ^= X */
 			ctx->seen |= SEEN_XREG;
-			PPC_XOR(r_A, r_A, r_X);
+			EMIT(PPC_RAW_XOR(r_A, r_A, r_X));
 			break;
 		case BPF_ALU | BPF_XOR | BPF_K: /* A ^= K */
 			if (IMM_L(K))
-				PPC_XORI(r_A, r_A, IMM_L(K));
+				EMIT(PPC_RAW_XORI(r_A, r_A, IMM_L(K)));
 			if (K >= 65536)
-				PPC_XORIS(r_A, r_A, IMM_H(K));
+				EMIT(PPC_RAW_XORIS(r_A, r_A, IMM_H(K)));
 			break;
 		case BPF_ALU | BPF_LSH | BPF_X: /* A <<= X; */
 			ctx->seen |= SEEN_XREG;
-			PPC_SLW(r_A, r_A, r_X);
+			EMIT(PPC_RAW_SLW(r_A, r_A, r_X));
 			break;
 		case BPF_ALU | BPF_LSH | BPF_K:
 			if (K == 0)
 				break;
 			else
-				PPC_SLWI(r_A, r_A, K);
+				EMIT(PPC_RAW_SLWI(r_A, r_A, K));
 			break;
 		case BPF_ALU | BPF_RSH | BPF_X: /* A >>= X; */
 			ctx->seen |= SEEN_XREG;
-			PPC_SRW(r_A, r_A, r_X);
+			EMIT(PPC_RAW_SRW(r_A, r_A, r_X));
 			break;
 		case BPF_ALU | BPF_RSH | BPF_K: /* A >>= K; */
 			if (K == 0)
 				break;
 			else
-				PPC_SRWI(r_A, r_A, K);
+				EMIT(PPC_RAW_SRWI(r_A, r_A, K));
 			break;
 		case BPF_ALU | BPF_NEG:
-			PPC_NEG(r_A, r_A);
+			EMIT(PPC_RAW_NEG(r_A, r_A));
 			break;
 		case BPF_RET | BPF_K:
 			PPC_LI32(r_ret, K);
@@ -277,24 +277,24 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 				if (ctx->seen)
 					PPC_JMP(exit_addr);
 				else
-					PPC_BLR();
+					EMIT(PPC_RAW_BLR());
 			}
 			break;
 		case BPF_RET | BPF_A:
-			PPC_MR(r_ret, r_A);
+			EMIT(PPC_RAW_MR(r_ret, r_A));
 			if (i != flen - 1) {
 				if (ctx->seen)
 					PPC_JMP(exit_addr);
 				else
-					PPC_BLR();
+					EMIT(PPC_RAW_BLR());
 			}
 			break;
 		case BPF_MISC | BPF_TAX: /* X = A */
-			PPC_MR(r_X, r_A);
+			EMIT(PPC_RAW_MR(r_X, r_A));
 			break;
 		case BPF_MISC | BPF_TXA: /* A = X */
 			ctx->seen |= SEEN_XREG;
-			PPC_MR(r_A, r_X);
+			EMIT(PPC_RAW_MR(r_A, r_X));
 			break;
 
 			/*** Constant loads/M[] access ***/
@@ -305,19 +305,19 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 			PPC_LI32(r_X, K);
 			break;
 		case BPF_LD | BPF_MEM: /* A = mem[K] */
-			PPC_MR(r_A, r_M + (K & 0xf));
+			EMIT(PPC_RAW_MR(r_A, r_M + (K & 0xf)));
 			ctx->seen |= SEEN_MEM | (1<<(K & 0xf));
 			break;
 		case BPF_LDX | BPF_MEM: /* X = mem[K] */
-			PPC_MR(r_X, r_M + (K & 0xf));
+			EMIT(PPC_RAW_MR(r_X, r_M + (K & 0xf)));
 			ctx->seen |= SEEN_MEM | (1<<(K & 0xf));
 			break;
 		case BPF_ST: /* mem[K] = A */
-			PPC_MR(r_M + (K & 0xf), r_A);
+			EMIT(PPC_RAW_MR(r_M + (K & 0xf), r_A));
 			ctx->seen |= SEEN_MEM | (1<<(K & 0xf));
 			break;
 		case BPF_STX: /* mem[K] = X */
-			PPC_MR(r_M + (K & 0xf), r_X);
+			EMIT(PPC_RAW_MR(r_M + (K & 0xf), r_X));
 			ctx->seen |= SEEN_XREG | SEEN_MEM | (1<<(K & 0xf));
 			break;
 		case BPF_LD | BPF_W | BPF_LEN: /*	A = skb->len; */
@@ -346,13 +346,13 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 						type) != 2);
 			PPC_LL_OFFS(r_scratch1, r_skb, offsetof(struct sk_buff,
 								dev));
-			PPC_CMPDI(r_scratch1, 0);
+			EMIT(PPC_RAW_CMPDI(r_scratch1, 0));
 			if (ctx->pc_ret0 != -1) {
 				PPC_BCC(COND_EQ, addrs[ctx->pc_ret0]);
 			} else {
 				/* Exit, returning 0; first pass hits here. */
 				PPC_BCC_SHORT(COND_NE, ctx->idx * 4 + 12);
-				PPC_LI(r_ret, 0);
+				EMIT(PPC_RAW_LI(r_ret, 0));
 				PPC_JMP(exit_addr);
 			}
 			if (code == (BPF_ANC | SKF_AD_IFINDEX)) {
@@ -383,9 +383,9 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 		case BPF_ANC | SKF_AD_VLAN_TAG_PRESENT:
 			PPC_LBZ_OFFS(r_A, r_skb, PKT_VLAN_PRESENT_OFFSET());
 			if (PKT_VLAN_PRESENT_BIT)
-				PPC_SRWI(r_A, r_A, PKT_VLAN_PRESENT_BIT);
+				EMIT(PPC_RAW_SRWI(r_A, r_A, PKT_VLAN_PRESENT_BIT));
 			if (PKT_VLAN_PRESENT_BIT < 7)
-				PPC_ANDI(r_A, r_A, 1);
+				EMIT(PPC_RAW_ANDI(r_A, r_A, 1));
 			break;
 		case BPF_ANC | SKF_AD_QUEUE:
 			BUILD_BUG_ON(sizeof_field(struct sk_buff,
@@ -395,8 +395,8 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 			break;
 		case BPF_ANC | SKF_AD_PKTTYPE:
 			PPC_LBZ_OFFS(r_A, r_skb, PKT_TYPE_OFFSET());
-			PPC_ANDI(r_A, r_A, PKT_TYPE_MAX);
-			PPC_SRWI(r_A, r_A, 5);
+			EMIT(PPC_RAW_ANDI(r_A, r_A, PKT_TYPE_MAX));
+			EMIT(PPC_RAW_SRWI(r_A, r_A, 5));
 			break;
 		case BPF_ANC | SKF_AD_CPU:
 			PPC_BPF_LOAD_CPU(r_A);
@@ -414,9 +414,9 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 			/* Load from [K]. */
 			ctx->seen |= SEEN_DATAREF;
 			PPC_FUNC_ADDR(r_scratch1, func);
-			PPC_MTLR(r_scratch1);
+			EMIT(PPC_RAW_MTLR(r_scratch1));
 			PPC_LI32(r_addr, K);
-			PPC_BLRL();
+			EMIT(PPC_RAW_BLRL());
 			/*
 			 * Helper returns 'lt' condition on error, and an
 			 * appropriate return value in r3
@@ -440,11 +440,11 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 			 */
 			ctx->seen |= SEEN_DATAREF | SEEN_XREG;
 			PPC_FUNC_ADDR(r_scratch1, func);
-			PPC_MTLR(r_scratch1);
-			PPC_ADDI(r_addr, r_X, IMM_L(K));
+			EMIT(PPC_RAW_MTLR(r_scratch1));
+			EMIT(PPC_RAW_ADDI(r_addr, r_X, IMM_L(K)));
 			if (K >= 32768)
-				PPC_ADDIS(r_addr, r_addr, IMM_HA(K));
-			PPC_BLRL();
+				EMIT(PPC_RAW_ADDIS(r_addr, r_addr, IMM_HA(K)));
+			EMIT(PPC_RAW_BLRL());
 			/* If error, cr0.LT set */
 			PPC_BCC(COND_LT, exit_addr);
 			break;
@@ -489,30 +489,30 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 			case BPF_JMP | BPF_JGE | BPF_X:
 			case BPF_JMP | BPF_JEQ | BPF_X:
 				ctx->seen |= SEEN_XREG;
-				PPC_CMPLW(r_A, r_X);
+				EMIT(PPC_RAW_CMPLW(r_A, r_X));
 				break;
 			case BPF_JMP | BPF_JSET | BPF_X:
 				ctx->seen |= SEEN_XREG;
-				PPC_AND_DOT(r_scratch1, r_A, r_X);
+				EMIT(PPC_RAW_AND_DOT(r_scratch1, r_A, r_X));
 				break;
 			case BPF_JMP | BPF_JEQ | BPF_K:
 			case BPF_JMP | BPF_JGT | BPF_K:
 			case BPF_JMP | BPF_JGE | BPF_K:
 				if (K < 32768)
-					PPC_CMPLWI(r_A, K);
+					EMIT(PPC_RAW_CMPLWI(r_A, K));
 				else {
 					PPC_LI32(r_scratch1, K);
-					PPC_CMPLW(r_A, r_scratch1);
+					EMIT(PPC_RAW_CMPLW(r_A, r_scratch1));
 				}
 				break;
 			case BPF_JMP | BPF_JSET | BPF_K:
 				if (K < 32768)
 					/* PPC_ANDI is /only/ dot-form */
-					PPC_ANDI(r_scratch1, r_A, K);
+					EMIT(PPC_RAW_ANDI(r_scratch1, r_A, K));
 				else {
 					PPC_LI32(r_scratch1, K);
-					PPC_AND_DOT(r_scratch1, r_A,
-						    r_scratch1);
+					EMIT(PPC_RAW_AND_DOT(r_scratch1, r_A,
+						    r_scratch1));
 				}
 				break;
 			}
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index f721fbe6ca4d..022103c6a201 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -95,12 +95,12 @@ static void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 	 * invoked through a tail call.
 	 */
 	if (ctx->seen & SEEN_TAILCALL) {
-		PPC_LI(b2p[TMP_REG_1], 0);
+		EMIT(PPC_RAW_LI(b2p[TMP_REG_1], 0));
 		/* this goes in the redzone */
 		PPC_BPF_STL(b2p[TMP_REG_1], 1, -(BPF_PPC_STACK_SAVE + 8));
 	} else {
-		PPC_NOP();
-		PPC_NOP();
+		EMIT(PPC_RAW_NOP());
+		EMIT(PPC_RAW_NOP());
 	}
 
 #define BPF_TAILCALL_PROLOGUE_SIZE	8
@@ -129,8 +129,8 @@ static void bpf_jit_build_prologue(u32 *image, struct codegen_context *ctx)
 
 	/* Setup frame pointer to point to the bpf stack area */
 	if (bpf_is_seen_register(ctx, BPF_REG_FP))
-		PPC_ADDI(b2p[BPF_REG_FP], 1,
-				STACK_FRAME_MIN_SIZE + ctx->stack_size);
+		EMIT(PPC_RAW_ADDI(b2p[BPF_REG_FP], 1,
+				STACK_FRAME_MIN_SIZE + ctx->stack_size));
 }
 
 static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx)
@@ -144,10 +144,10 @@ static void bpf_jit_emit_common_epilogue(u32 *image, struct codegen_context *ctx
 
 	/* Tear down our stack frame */
 	if (bpf_has_stack_frame(ctx)) {
-		PPC_ADDI(1, 1, BPF_PPC_STACKFRAME + ctx->stack_size);
+		EMIT(PPC_RAW_ADDI(1, 1, BPF_PPC_STACKFRAME + ctx->stack_size));
 		if (ctx->seen & SEEN_FUNC) {
 			PPC_BPF_LL(0, 1, PPC_LR_STKOFF);
-			PPC_MTLR(0);
+			EMIT(PPC_RAW_MTLR(0));
 		}
 	}
 }
@@ -157,9 +157,9 @@ static void bpf_jit_build_epilogue(u32 *image, struct codegen_context *ctx)
 	bpf_jit_emit_common_epilogue(image, ctx);
 
 	/* Move result to r3 */
-	PPC_MR(3, b2p[BPF_REG_0]);
+	EMIT(PPC_RAW_MR(3, b2p[BPF_REG_0]));
 
-	PPC_BLR();
+	EMIT(PPC_RAW_BLR());
 }
 
 static void bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx,
@@ -171,7 +171,7 @@ static void bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx,
 	/* Load actual entry point from function descriptor */
 	PPC_BPF_LL(b2p[TMP_REG_1], b2p[TMP_REG_2], 0);
 	/* ... and move it to LR */
-	PPC_MTLR(b2p[TMP_REG_1]);
+	EMIT(PPC_RAW_MTLR(b2p[TMP_REG_1]));
 	/*
 	 * Load TOC from function descriptor at offset 8.
 	 * We can clobber r2 since we get called through a
@@ -182,9 +182,9 @@ static void bpf_jit_emit_func_call_hlp(u32 *image, struct codegen_context *ctx,
 #else
 	/* We can clobber r12 */
 	PPC_FUNC_ADDR(12, func);
-	PPC_MTLR(12);
+	EMIT(PPC_RAW_MTLR(12));
 #endif
-	PPC_BLRL();
+	EMIT(PPC_RAW_BLRL());
 }
 
 static void bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx,
@@ -206,7 +206,7 @@ static void bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx,
 	 * that PPC_LI64() can emit.
 	 */
 	for (i = ctx->idx - ctx_idx; i < 5; i++)
-		PPC_NOP();
+		EMIT(PPC_RAW_NOP());
 
 #ifdef PPC64_ELF_ABI_v1
 	/*
@@ -220,8 +220,8 @@ static void bpf_jit_emit_func_call_rel(u32 *image, struct codegen_context *ctx,
 	PPC_BPF_LL(12, 12, 0);
 #endif
 
-	PPC_MTLR(12);
-	PPC_BLRL();
+	EMIT(PPC_RAW_MTLR(12));
+	EMIT(PPC_RAW_BLRL());
 }
 
 static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 out)
@@ -240,8 +240,8 @@ static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32
 	 *   goto out;
 	 */
 	EMIT(PPC_RAW_LWZ(b2p[TMP_REG_1], b2p_bpf_array, offsetof(struct bpf_array, map.max_entries)));
-	PPC_RLWINM(b2p_index, b2p_index, 0, 0, 31);
-	PPC_CMPLW(b2p_index, b2p[TMP_REG_1]);
+	EMIT(PPC_RAW_RLWINM(b2p_index, b2p_index, 0, 0, 31));
+	EMIT(PPC_RAW_CMPLW(b2p_index, b2p[TMP_REG_1]));
 	PPC_BCC(COND_GE, out);
 
 	/*
@@ -249,17 +249,17 @@ static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32
 	 *   goto out;
 	 */
 	PPC_BPF_LL(b2p[TMP_REG_1], 1, bpf_jit_stack_tailcallcnt(ctx));
-	PPC_CMPLWI(b2p[TMP_REG_1], MAX_TAIL_CALL_CNT);
+	EMIT(PPC_RAW_CMPLWI(b2p[TMP_REG_1], MAX_TAIL_CALL_CNT));
 	PPC_BCC(COND_GT, out);
 
 	/*
 	 * tail_call_cnt++;
 	 */
-	PPC_ADDI(b2p[TMP_REG_1], b2p[TMP_REG_1], 1);
+	EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], b2p[TMP_REG_1], 1));
 	PPC_BPF_STL(b2p[TMP_REG_1], 1, bpf_jit_stack_tailcallcnt(ctx));
 
 	/* prog = array->ptrs[index]; */
-	PPC_MULI(b2p[TMP_REG_1], b2p_index, 8);
+	EMIT(PPC_RAW_MULI(b2p[TMP_REG_1], b2p_index, 8));
 	EMIT(PPC_RAW_ADD(b2p[TMP_REG_1], b2p[TMP_REG_1], b2p_bpf_array));
 	PPC_BPF_LL(b2p[TMP_REG_1], b2p[TMP_REG_1], offsetof(struct bpf_array, ptrs));
 
@@ -267,24 +267,24 @@ static void bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32
 	 * if (prog == NULL)
 	 *   goto out;
 	 */
-	PPC_CMPLDI(b2p[TMP_REG_1], 0);
+	EMIT(PPC_RAW_CMPLDI(b2p[TMP_REG_1], 0));
 	PPC_BCC(COND_EQ, out);
 
 	/* goto *(prog->bpf_func + prologue_size); */
 	PPC_BPF_LL(b2p[TMP_REG_1], b2p[TMP_REG_1], offsetof(struct bpf_prog, bpf_func));
 #ifdef PPC64_ELF_ABI_v1
 	/* skip past the function descriptor */
-	PPC_ADDI(b2p[TMP_REG_1], b2p[TMP_REG_1],
-			FUNCTION_DESCR_SIZE + BPF_TAILCALL_PROLOGUE_SIZE);
+	EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], b2p[TMP_REG_1],
+			FUNCTION_DESCR_SIZE + BPF_TAILCALL_PROLOGUE_SIZE));
 #else
-	PPC_ADDI(b2p[TMP_REG_1], b2p[TMP_REG_1], BPF_TAILCALL_PROLOGUE_SIZE);
+	EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], b2p[TMP_REG_1], BPF_TAILCALL_PROLOGUE_SIZE));
 #endif
-	PPC_MTCTR(b2p[TMP_REG_1]);
+	EMIT(PPC_RAW_MTCTR(b2p[TMP_REG_1]));
 
 	/* tear down stack, restore NVRs, ... */
 	bpf_jit_emit_common_epilogue(image, ctx);
 
-	PPC_BCTR();
+	EMIT(PPC_RAW_BCTR());
 	/* out: */
 }
 
@@ -344,7 +344,7 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_SUB | BPF_X: /* (u32) dst -= (u32) src */
 		case BPF_ALU64 | BPF_SUB | BPF_X: /* dst -= src */
-			PPC_SUB(dst_reg, dst_reg, src_reg);
+			EMIT(PPC_RAW_SUB(dst_reg, dst_reg, src_reg));
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_ADD | BPF_K: /* (u32) dst += (u32) imm */
 		case BPF_ALU | BPF_SUB | BPF_K: /* (u32) dst -= (u32) imm */
@@ -354,7 +354,7 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 				imm = -imm;
 			if (imm) {
 				if (imm >= -32768 && imm < 32768)
-					PPC_ADDI(dst_reg, dst_reg, IMM_L(imm));
+					EMIT(PPC_RAW_ADDI(dst_reg, dst_reg, IMM_L(imm)));
 				else {
 					PPC_LI32(b2p[TMP_REG_1], imm);
 					EMIT(PPC_RAW_ADD(dst_reg, dst_reg, b2p[TMP_REG_1]));
@@ -364,43 +364,43 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 		case BPF_ALU | BPF_MUL | BPF_X: /* (u32) dst *= (u32) src */
 		case BPF_ALU64 | BPF_MUL | BPF_X: /* dst *= src */
 			if (BPF_CLASS(code) == BPF_ALU)
-				PPC_MULW(dst_reg, dst_reg, src_reg);
+				EMIT(PPC_RAW_MULW(dst_reg, dst_reg, src_reg));
 			else
-				PPC_MULD(dst_reg, dst_reg, src_reg);
+				EMIT(PPC_RAW_MULD(dst_reg, dst_reg, src_reg));
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_MUL | BPF_K: /* (u32) dst *= (u32) imm */
 		case BPF_ALU64 | BPF_MUL | BPF_K: /* dst *= imm */
 			if (imm >= -32768 && imm < 32768)
-				PPC_MULI(dst_reg, dst_reg, IMM_L(imm));
+				EMIT(PPC_RAW_MULI(dst_reg, dst_reg, IMM_L(imm)));
 			else {
 				PPC_LI32(b2p[TMP_REG_1], imm);
 				if (BPF_CLASS(code) == BPF_ALU)
-					PPC_MULW(dst_reg, dst_reg,
-							b2p[TMP_REG_1]);
+					EMIT(PPC_RAW_MULW(dst_reg, dst_reg,
+							b2p[TMP_REG_1]));
 				else
-					PPC_MULD(dst_reg, dst_reg,
-							b2p[TMP_REG_1]);
+					EMIT(PPC_RAW_MULD(dst_reg, dst_reg,
+							b2p[TMP_REG_1]));
 			}
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_DIV | BPF_X: /* (u32) dst /= (u32) src */
 		case BPF_ALU | BPF_MOD | BPF_X: /* (u32) dst %= (u32) src */
 			if (BPF_OP(code) == BPF_MOD) {
-				PPC_DIVWU(b2p[TMP_REG_1], dst_reg, src_reg);
-				PPC_MULW(b2p[TMP_REG_1], src_reg,
-						b2p[TMP_REG_1]);
-				PPC_SUB(dst_reg, dst_reg, b2p[TMP_REG_1]);
+				EMIT(PPC_RAW_DIVWU(b2p[TMP_REG_1], dst_reg, src_reg));
+				EMIT(PPC_RAW_MULW(b2p[TMP_REG_1], src_reg,
+						b2p[TMP_REG_1]));
+				EMIT(PPC_RAW_SUB(dst_reg, dst_reg, b2p[TMP_REG_1]));
 			} else
-				PPC_DIVWU(dst_reg, dst_reg, src_reg);
+				EMIT(PPC_RAW_DIVWU(dst_reg, dst_reg, src_reg));
 			goto bpf_alu32_trunc;
 		case BPF_ALU64 | BPF_DIV | BPF_X: /* dst /= src */
 		case BPF_ALU64 | BPF_MOD | BPF_X: /* dst %= src */
 			if (BPF_OP(code) == BPF_MOD) {
-				PPC_DIVDU(b2p[TMP_REG_1], dst_reg, src_reg);
-				PPC_MULD(b2p[TMP_REG_1], src_reg,
-						b2p[TMP_REG_1]);
-				PPC_SUB(dst_reg, dst_reg, b2p[TMP_REG_1]);
+				EMIT(PPC_RAW_DIVDU(b2p[TMP_REG_1], dst_reg, src_reg));
+				EMIT(PPC_RAW_MULD(b2p[TMP_REG_1], src_reg,
+						b2p[TMP_REG_1]));
+				EMIT(PPC_RAW_SUB(dst_reg, dst_reg, b2p[TMP_REG_1]));
 			} else
-				PPC_DIVDU(dst_reg, dst_reg, src_reg);
+				EMIT(PPC_RAW_DIVDU(dst_reg, dst_reg, src_reg));
 			break;
 		case BPF_ALU | BPF_MOD | BPF_K: /* (u32) dst %= (u32) imm */
 		case BPF_ALU | BPF_DIV | BPF_K: /* (u32) dst /= (u32) imm */
@@ -415,35 +415,37 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 			switch (BPF_CLASS(code)) {
 			case BPF_ALU:
 				if (BPF_OP(code) == BPF_MOD) {
-					PPC_DIVWU(b2p[TMP_REG_2], dst_reg,
-							b2p[TMP_REG_1]);
-					PPC_MULW(b2p[TMP_REG_1],
+					EMIT(PPC_RAW_DIVWU(b2p[TMP_REG_2],
+							dst_reg,
+							b2p[TMP_REG_1]));
+					EMIT(PPC_RAW_MULW(b2p[TMP_REG_1],
 							b2p[TMP_REG_1],
-							b2p[TMP_REG_2]);
-					PPC_SUB(dst_reg, dst_reg,
-							b2p[TMP_REG_1]);
+							b2p[TMP_REG_2]));
+					EMIT(PPC_RAW_SUB(dst_reg, dst_reg,
+							b2p[TMP_REG_1]));
 				} else
-					PPC_DIVWU(dst_reg, dst_reg,
-							b2p[TMP_REG_1]);
+					EMIT(PPC_RAW_DIVWU(dst_reg, dst_reg,
+							b2p[TMP_REG_1]));
 				break;
 			case BPF_ALU64:
 				if (BPF_OP(code) == BPF_MOD) {
-					PPC_DIVDU(b2p[TMP_REG_2], dst_reg,
-							b2p[TMP_REG_1]);
-					PPC_MULD(b2p[TMP_REG_1],
+					EMIT(PPC_RAW_DIVDU(b2p[TMP_REG_2],
+							dst_reg,
+							b2p[TMP_REG_1]));
+					EMIT(PPC_RAW_MULD(b2p[TMP_REG_1],
 							b2p[TMP_REG_1],
-							b2p[TMP_REG_2]);
-					PPC_SUB(dst_reg, dst_reg,
-							b2p[TMP_REG_1]);
+							b2p[TMP_REG_2]));
+					EMIT(PPC_RAW_SUB(dst_reg, dst_reg,
+							b2p[TMP_REG_1]));
 				} else
-					PPC_DIVDU(dst_reg, dst_reg,
-							b2p[TMP_REG_1]);
+					EMIT(PPC_RAW_DIVDU(dst_reg, dst_reg,
+							b2p[TMP_REG_1]));
 				break;
 			}
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_NEG: /* (u32) dst = -dst */
 		case BPF_ALU64 | BPF_NEG: /* dst = -dst */
-			PPC_NEG(dst_reg, dst_reg);
+			EMIT(PPC_RAW_NEG(dst_reg, dst_reg));
 			goto bpf_alu32_trunc;
 
 		/*
@@ -451,101 +453,101 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 		 */
 		case BPF_ALU | BPF_AND | BPF_X: /* (u32) dst = dst & src */
 		case BPF_ALU64 | BPF_AND | BPF_X: /* dst = dst & src */
-			PPC_AND(dst_reg, dst_reg, src_reg);
+			EMIT(PPC_RAW_AND(dst_reg, dst_reg, src_reg));
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_AND | BPF_K: /* (u32) dst = dst & imm */
 		case BPF_ALU64 | BPF_AND | BPF_K: /* dst = dst & imm */
 			if (!IMM_H(imm))
-				PPC_ANDI(dst_reg, dst_reg, IMM_L(imm));
+				EMIT(PPC_RAW_ANDI(dst_reg, dst_reg, IMM_L(imm)));
 			else {
 				/* Sign-extended */
 				PPC_LI32(b2p[TMP_REG_1], imm);
-				PPC_AND(dst_reg, dst_reg, b2p[TMP_REG_1]);
+				EMIT(PPC_RAW_AND(dst_reg, dst_reg, b2p[TMP_REG_1]));
 			}
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_OR | BPF_X: /* dst = (u32) dst | (u32) src */
 		case BPF_ALU64 | BPF_OR | BPF_X: /* dst = dst | src */
-			PPC_OR(dst_reg, dst_reg, src_reg);
+			EMIT(PPC_RAW_OR(dst_reg, dst_reg, src_reg));
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_OR | BPF_K:/* dst = (u32) dst | (u32) imm */
 		case BPF_ALU64 | BPF_OR | BPF_K:/* dst = dst | imm */
 			if (imm < 0 && BPF_CLASS(code) == BPF_ALU64) {
 				/* Sign-extended */
 				PPC_LI32(b2p[TMP_REG_1], imm);
-				PPC_OR(dst_reg, dst_reg, b2p[TMP_REG_1]);
+				EMIT(PPC_RAW_OR(dst_reg, dst_reg, b2p[TMP_REG_1]));
 			} else {
 				if (IMM_L(imm))
-					PPC_ORI(dst_reg, dst_reg, IMM_L(imm));
+					EMIT(PPC_RAW_ORI(dst_reg, dst_reg, IMM_L(imm)));
 				if (IMM_H(imm))
-					PPC_ORIS(dst_reg, dst_reg, IMM_H(imm));
+					EMIT(PPC_RAW_ORIS(dst_reg, dst_reg, IMM_H(imm)));
 			}
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_XOR | BPF_X: /* (u32) dst ^= src */
 		case BPF_ALU64 | BPF_XOR | BPF_X: /* dst ^= src */
-			PPC_XOR(dst_reg, dst_reg, src_reg);
+			EMIT(PPC_RAW_XOR(dst_reg, dst_reg, src_reg));
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_XOR | BPF_K: /* (u32) dst ^= (u32) imm */
 		case BPF_ALU64 | BPF_XOR | BPF_K: /* dst ^= imm */
 			if (imm < 0 && BPF_CLASS(code) == BPF_ALU64) {
 				/* Sign-extended */
 				PPC_LI32(b2p[TMP_REG_1], imm);
-				PPC_XOR(dst_reg, dst_reg, b2p[TMP_REG_1]);
+				EMIT(PPC_RAW_XOR(dst_reg, dst_reg, b2p[TMP_REG_1]));
 			} else {
 				if (IMM_L(imm))
-					PPC_XORI(dst_reg, dst_reg, IMM_L(imm));
+					EMIT(PPC_RAW_XORI(dst_reg, dst_reg, IMM_L(imm)));
 				if (IMM_H(imm))
-					PPC_XORIS(dst_reg, dst_reg, IMM_H(imm));
+					EMIT(PPC_RAW_XORIS(dst_reg, dst_reg, IMM_H(imm)));
 			}
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_LSH | BPF_X: /* (u32) dst <<= (u32) src */
 			/* slw clears top 32 bits */
-			PPC_SLW(dst_reg, dst_reg, src_reg);
+			EMIT(PPC_RAW_SLW(dst_reg, dst_reg, src_reg));
 			/* skip zero extension move, but set address map. */
 			if (insn_is_zext(&insn[i + 1]))
 				addrs[++i] = ctx->idx * 4;
 			break;
 		case BPF_ALU64 | BPF_LSH | BPF_X: /* dst <<= src; */
-			PPC_SLD(dst_reg, dst_reg, src_reg);
+			EMIT(PPC_RAW_SLD(dst_reg, dst_reg, src_reg));
 			break;
 		case BPF_ALU | BPF_LSH | BPF_K: /* (u32) dst <<== (u32) imm */
 			/* with imm 0, we still need to clear top 32 bits */
-			PPC_SLWI(dst_reg, dst_reg, imm);
+			EMIT(PPC_RAW_SLWI(dst_reg, dst_reg, imm));
 			if (insn_is_zext(&insn[i + 1]))
 				addrs[++i] = ctx->idx * 4;
 			break;
 		case BPF_ALU64 | BPF_LSH | BPF_K: /* dst <<== imm */
 			if (imm != 0)
-				PPC_SLDI(dst_reg, dst_reg, imm);
+				EMIT(PPC_RAW_SLDI(dst_reg, dst_reg, imm));
 			break;
 		case BPF_ALU | BPF_RSH | BPF_X: /* (u32) dst >>= (u32) src */
-			PPC_SRW(dst_reg, dst_reg, src_reg);
+			EMIT(PPC_RAW_SRW(dst_reg, dst_reg, src_reg));
 			if (insn_is_zext(&insn[i + 1]))
 				addrs[++i] = ctx->idx * 4;
 			break;
 		case BPF_ALU64 | BPF_RSH | BPF_X: /* dst >>= src */
-			PPC_SRD(dst_reg, dst_reg, src_reg);
+			EMIT(PPC_RAW_SRD(dst_reg, dst_reg, src_reg));
 			break;
 		case BPF_ALU | BPF_RSH | BPF_K: /* (u32) dst >>= (u32) imm */
-			PPC_SRWI(dst_reg, dst_reg, imm);
+			EMIT(PPC_RAW_SRWI(dst_reg, dst_reg, imm));
 			if (insn_is_zext(&insn[i + 1]))
 				addrs[++i] = ctx->idx * 4;
 			break;
 		case BPF_ALU64 | BPF_RSH | BPF_K: /* dst >>= imm */
 			if (imm != 0)
-				PPC_SRDI(dst_reg, dst_reg, imm);
+				EMIT(PPC_RAW_SRDI(dst_reg, dst_reg, imm));
 			break;
 		case BPF_ALU | BPF_ARSH | BPF_X: /* (s32) dst >>= src */
-			PPC_SRAW(dst_reg, dst_reg, src_reg);
+			EMIT(PPC_RAW_SRAW(dst_reg, dst_reg, src_reg));
 			goto bpf_alu32_trunc;
 		case BPF_ALU64 | BPF_ARSH | BPF_X: /* (s64) dst >>= src */
-			PPC_SRAD(dst_reg, dst_reg, src_reg);
+			EMIT(PPC_RAW_SRAD(dst_reg, dst_reg, src_reg));
 			break;
 		case BPF_ALU | BPF_ARSH | BPF_K: /* (s32) dst >>= imm */
-			PPC_SRAWI(dst_reg, dst_reg, imm);
+			EMIT(PPC_RAW_SRAWI(dst_reg, dst_reg, imm));
 			goto bpf_alu32_trunc;
 		case BPF_ALU64 | BPF_ARSH | BPF_K: /* (s64) dst >>= imm */
 			if (imm != 0)
-				PPC_SRADI(dst_reg, dst_reg, imm);
+				EMIT(PPC_RAW_SRADI(dst_reg, dst_reg, imm));
 			break;
 
 		/*
@@ -555,10 +557,10 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 		case BPF_ALU64 | BPF_MOV | BPF_X: /* dst = src */
 			if (imm == 1) {
 				/* special mov32 for zext */
-				PPC_RLWINM(dst_reg, dst_reg, 0, 0, 31);
+				EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg, 0, 0, 31));
 				break;
 			}
-			PPC_MR(dst_reg, src_reg);
+			EMIT(PPC_RAW_MR(dst_reg, src_reg));
 			goto bpf_alu32_trunc;
 		case BPF_ALU | BPF_MOV | BPF_K: /* (u32) dst = imm */
 		case BPF_ALU64 | BPF_MOV | BPF_K: /* dst = (s64) imm */
@@ -572,7 +574,7 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 bpf_alu32_trunc:
 		/* Truncate to 32-bits */
 		if (BPF_CLASS(code) == BPF_ALU && !fp->aux->verifier_zext)
-			PPC_RLWINM(dst_reg, dst_reg, 0, 0, 31);
+			EMIT(PPC_RAW_RLWINM(dst_reg, dst_reg, 0, 0, 31));
 		break;
 
 		/*
@@ -590,11 +592,11 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 			switch (imm) {
 			case 16:
 				/* Rotate 8 bits left & mask with 0x0000ff00 */
-				PPC_RLWINM(b2p[TMP_REG_1], dst_reg, 8, 16, 23);
+				EMIT(PPC_RAW_RLWINM(b2p[TMP_REG_1], dst_reg, 8, 16, 23));
 				/* Rotate 8 bits right & insert LSB to reg */
-				PPC_RLWIMI(b2p[TMP_REG_1], dst_reg, 24, 24, 31);
+				EMIT(PPC_RAW_RLWIMI(b2p[TMP_REG_1], dst_reg, 24, 24, 31));
 				/* Move result back to dst_reg */
-				PPC_MR(dst_reg, b2p[TMP_REG_1]);
+				EMIT(PPC_RAW_MR(dst_reg, b2p[TMP_REG_1]));
 				break;
 			case 32:
 				/*
@@ -602,12 +604,12 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 				 * 2 bytes are already in their final position
 				 * -- byte 2 and 4 (of bytes 1, 2, 3 and 4)
 				 */
-				PPC_RLWINM(b2p[TMP_REG_1], dst_reg, 8, 0, 31);
+				EMIT(PPC_RAW_RLWINM(b2p[TMP_REG_1], dst_reg, 8, 0, 31));
 				/* Rotate 24 bits and insert byte 1 */
-				PPC_RLWIMI(b2p[TMP_REG_1], dst_reg, 24, 0, 7);
+				EMIT(PPC_RAW_RLWIMI(b2p[TMP_REG_1], dst_reg, 24, 0, 7));
 				/* Rotate 24 bits and insert byte 3 */
-				PPC_RLWIMI(b2p[TMP_REG_1], dst_reg, 24, 16, 23);
-				PPC_MR(dst_reg, b2p[TMP_REG_1]);
+				EMIT(PPC_RAW_RLWIMI(b2p[TMP_REG_1], dst_reg, 24, 16, 23));
+				EMIT(PPC_RAW_MR(dst_reg, b2p[TMP_REG_1]));
 				break;
 			case 64:
 				/*
@@ -619,8 +621,8 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 				 * same across all passes
 				 */
 				PPC_BPF_STL(dst_reg, 1, bpf_jit_stack_local(ctx));
-				PPC_ADDI(b2p[TMP_REG_1], 1, bpf_jit_stack_local(ctx));
-				PPC_LDBRX(dst_reg, 0, b2p[TMP_REG_1]);
+				EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], 1, bpf_jit_stack_local(ctx)));
+				EMIT(PPC_RAW_LDBRX(dst_reg, 0, b2p[TMP_REG_1]));
 				break;
 			}
 			break;
@@ -629,14 +631,14 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 			switch (imm) {
 			case 16:
 				/* zero-extend 16 bits into 64 bits */
-				PPC_RLDICL(dst_reg, dst_reg, 0, 48);
+				EMIT(PPC_RAW_RLDICL(dst_reg, dst_reg, 0, 48));
 				if (insn_is_zext(&insn[i + 1]))
 					addrs[++i] = ctx->idx * 4;
 				break;
 			case 32:
 				if (!fp->aux->verifier_zext)
 					/* zero-extend 32 bits into 64 bits */
-					PPC_RLDICL(dst_reg, dst_reg, 0, 32);
+					EMIT(PPC_RAW_RLDICL(dst_reg, dst_reg, 0, 32));
 				break;
 			case 64:
 				/* nop */
@@ -650,18 +652,18 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 		case BPF_STX | BPF_MEM | BPF_B: /* *(u8 *)(dst + off) = src */
 		case BPF_ST | BPF_MEM | BPF_B: /* *(u8 *)(dst + off) = imm */
 			if (BPF_CLASS(code) == BPF_ST) {
-				PPC_LI(b2p[TMP_REG_1], imm);
+				EMIT(PPC_RAW_LI(b2p[TMP_REG_1], imm));
 				src_reg = b2p[TMP_REG_1];
 			}
-			PPC_STB(src_reg, dst_reg, off);
+			EMIT(PPC_RAW_STB(src_reg, dst_reg, off));
 			break;
 		case BPF_STX | BPF_MEM | BPF_H: /* (u16 *)(dst + off) = src */
 		case BPF_ST | BPF_MEM | BPF_H: /* (u16 *)(dst + off) = imm */
 			if (BPF_CLASS(code) == BPF_ST) {
-				PPC_LI(b2p[TMP_REG_1], imm);
+				EMIT(PPC_RAW_LI(b2p[TMP_REG_1], imm));
 				src_reg = b2p[TMP_REG_1];
 			}
-			PPC_STH(src_reg, dst_reg, off);
+			EMIT(PPC_RAW_STH(src_reg, dst_reg, off));
 			break;
 		case BPF_STX | BPF_MEM | BPF_W: /* *(u32 *)(dst + off) = src */
 		case BPF_ST | BPF_MEM | BPF_W: /* *(u32 *)(dst + off) = imm */
@@ -669,7 +671,7 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 				PPC_LI32(b2p[TMP_REG_1], imm);
 				src_reg = b2p[TMP_REG_1];
 			}
-			PPC_STW(src_reg, dst_reg, off);
+			EMIT(PPC_RAW_STW(src_reg, dst_reg, off));
 			break;
 		case BPF_STX | BPF_MEM | BPF_DW: /* (u64 *)(dst + off) = src */
 		case BPF_ST | BPF_MEM | BPF_DW: /* *(u64 *)(dst + off) = imm */
@@ -686,20 +688,20 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 		/* *(u32 *)(dst + off) += src */
 		case BPF_STX | BPF_XADD | BPF_W:
 			/* Get EA into TMP_REG_1 */
-			PPC_ADDI(b2p[TMP_REG_1], dst_reg, off);
+			EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], dst_reg, off));
 			tmp_idx = ctx->idx * 4;
 			/* load value from memory into TMP_REG_2 */
 			EMIT(PPC_RAW_LWARX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1], 0));
 			/* add value from src_reg into this */
 			EMIT(PPC_RAW_ADD(b2p[TMP_REG_2], b2p[TMP_REG_2], src_reg));
 			/* store result back */
-			PPC_BPF_STWCX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1]);
+			EMIT(PPC_RAW_STWCX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1]));
 			/* we're done if this succeeded */
 			PPC_BCC_SHORT(COND_NE, tmp_idx);
 			break;
 		/* *(u64 *)(dst + off) += src */
 		case BPF_STX | BPF_XADD | BPF_DW:
-			PPC_ADDI(b2p[TMP_REG_1], dst_reg, off);
+			EMIT(PPC_RAW_ADDI(b2p[TMP_REG_1], dst_reg, off));
 			tmp_idx = ctx->idx * 4;
 			EMIT(PPC_RAW_LDARX(b2p[TMP_REG_2], 0, b2p[TMP_REG_1], 0));
 			EMIT(PPC_RAW_ADD(b2p[TMP_REG_2], b2p[TMP_REG_2], src_reg));
@@ -712,13 +714,13 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 		 */
 		/* dst = *(u8 *)(ul) (src + off) */
 		case BPF_LDX | BPF_MEM | BPF_B:
-			PPC_LBZ(dst_reg, src_reg, off);
+			EMIT(PPC_RAW_LBZ(dst_reg, src_reg, off));
 			if (insn_is_zext(&insn[i + 1]))
 				addrs[++i] = ctx->idx * 4;
 			break;
 		/* dst = *(u16 *)(ul) (src + off) */
 		case BPF_LDX | BPF_MEM | BPF_H:
-			PPC_LHZ(dst_reg, src_reg, off);
+			EMIT(PPC_RAW_LHZ(dst_reg, src_reg, off));
 			if (insn_is_zext(&insn[i + 1]))
 				addrs[++i] = ctx->idx * 4;
 			break;
@@ -775,7 +777,7 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 			else
 				bpf_jit_emit_func_call_rel(image, ctx, func_addr);
 			/* move return value from r3 to BPF_REG_0 */
-			PPC_MR(b2p[BPF_REG_0], 3);
+			EMIT(PPC_RAW_MR(b2p[BPF_REG_0], 3));
 			break;
 
 		/*
@@ -860,9 +862,9 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 			case BPF_JMP32 | BPF_JNE | BPF_X:
 				/* unsigned comparison */
 				if (BPF_CLASS(code) == BPF_JMP32)
-					PPC_CMPLW(dst_reg, src_reg);
+					EMIT(PPC_RAW_CMPLW(dst_reg, src_reg));
 				else
-					PPC_CMPLD(dst_reg, src_reg);
+					EMIT(PPC_RAW_CMPLD(dst_reg, src_reg));
 				break;
 			case BPF_JMP | BPF_JSGT | BPF_X:
 			case BPF_JMP | BPF_JSLT | BPF_X:
@@ -874,21 +876,21 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 			case BPF_JMP32 | BPF_JSLE | BPF_X:
 				/* signed comparison */
 				if (BPF_CLASS(code) == BPF_JMP32)
-					PPC_CMPW(dst_reg, src_reg);
+					EMIT(PPC_RAW_CMPW(dst_reg, src_reg));
 				else
-					PPC_CMPD(dst_reg, src_reg);
+					EMIT(PPC_RAW_CMPD(dst_reg, src_reg));
 				break;
 			case BPF_JMP | BPF_JSET | BPF_X:
 			case BPF_JMP32 | BPF_JSET | BPF_X:
 				if (BPF_CLASS(code) == BPF_JMP) {
-					PPC_AND_DOT(b2p[TMP_REG_1], dst_reg,
-						    src_reg);
+					EMIT(PPC_RAW_AND_DOT(b2p[TMP_REG_1], dst_reg,
+						    src_reg));
 				} else {
 					int tmp_reg = b2p[TMP_REG_1];
 
-					PPC_AND(tmp_reg, dst_reg, src_reg);
-					PPC_RLWINM_DOT(tmp_reg, tmp_reg, 0, 0,
-						       31);
+					EMIT(PPC_RAW_AND(tmp_reg, dst_reg, src_reg));
+					EMIT(PPC_RAW_RLWINM_DOT(tmp_reg, tmp_reg, 0, 0,
+						       31));
 				}
 				break;
 			case BPF_JMP | BPF_JNE | BPF_K:
@@ -912,19 +914,19 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 				 */
 				if (imm >= 0 && imm < 32768) {
 					if (is_jmp32)
-						PPC_CMPLWI(dst_reg, imm);
+						EMIT(PPC_RAW_CMPLWI(dst_reg, imm));
 					else
-						PPC_CMPLDI(dst_reg, imm);
+						EMIT(PPC_RAW_CMPLDI(dst_reg, imm));
 				} else {
 					/* sign-extending load */
 					PPC_LI32(b2p[TMP_REG_1], imm);
 					/* ... but unsigned comparison */
 					if (is_jmp32)
-						PPC_CMPLW(dst_reg,
-							  b2p[TMP_REG_1]);
+						EMIT(PPC_RAW_CMPLW(dst_reg,
+							  b2p[TMP_REG_1]));
 					else
-						PPC_CMPLD(dst_reg,
-							  b2p[TMP_REG_1]);
+						EMIT(PPC_RAW_CMPLD(dst_reg,
+							  b2p[TMP_REG_1]));
 				}
 				break;
 			}
@@ -945,17 +947,17 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 				 */
 				if (imm >= -32768 && imm < 32768) {
 					if (is_jmp32)
-						PPC_CMPWI(dst_reg, imm);
+						EMIT(PPC_RAW_CMPWI(dst_reg, imm));
 					else
-						PPC_CMPDI(dst_reg, imm);
+						EMIT(PPC_RAW_CMPDI(dst_reg, imm));
 				} else {
 					PPC_LI32(b2p[TMP_REG_1], imm);
 					if (is_jmp32)
-						PPC_CMPW(dst_reg,
-							 b2p[TMP_REG_1]);
+						EMIT(PPC_RAW_CMPW(dst_reg,
+							 b2p[TMP_REG_1]));
 					else
-						PPC_CMPD(dst_reg,
-							 b2p[TMP_REG_1]);
+						EMIT(PPC_RAW_CMPD(dst_reg,
+							 b2p[TMP_REG_1]));
 				}
 				break;
 			}
@@ -964,19 +966,19 @@ static int bpf_jit_build_body(struct bpf_prog *fp, u32 *image,
 				/* andi does not sign-extend the immediate */
 				if (imm >= 0 && imm < 32768)
 					/* PPC_ANDI is _only/always_ dot-form */
-					PPC_ANDI(b2p[TMP_REG_1], dst_reg, imm);
+					EMIT(PPC_RAW_ANDI(b2p[TMP_REG_1], dst_reg, imm));
 				else {
 					int tmp_reg = b2p[TMP_REG_1];
 
 					PPC_LI32(tmp_reg, imm);
 					if (BPF_CLASS(code) == BPF_JMP) {
-						PPC_AND_DOT(tmp_reg, dst_reg,
-							    tmp_reg);
+						EMIT(PPC_RAW_AND_DOT(tmp_reg, dst_reg,
+							    tmp_reg));
 					} else {
-						PPC_AND(tmp_reg, dst_reg,
-							tmp_reg);
-						PPC_RLWINM_DOT(tmp_reg, tmp_reg,
-							       0, 0, 31);
+						EMIT(PPC_RAW_AND(tmp_reg, dst_reg,
+							tmp_reg));
+						EMIT(PPC_RAW_RLWINM_DOT(tmp_reg, tmp_reg,
+							       0, 0, 31));
 					}
 				}
 				break;
-- 
2.24.1

