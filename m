Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 842F423412B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 10:25:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJ0hF61WczDqRM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 18:25:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJ0W830dkzDqc9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 18:17:08 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06V81n6x129252; Fri, 31 Jul 2020 04:17:03 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32m7c5bhh3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 04:17:03 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06V8GZ1F016892;
 Fri, 31 Jul 2020 08:17:01 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 32gcqgq0yf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 08:17:01 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06V8GwIw25821656
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jul 2020 08:16:58 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A36911C050;
 Fri, 31 Jul 2020 08:16:58 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A8FFD11C052;
 Fri, 31 Jul 2020 08:16:56 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.77.199.67])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 31 Jul 2020 08:16:56 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3 3/4] powerpc ppc-opcode: add encoding macros for vsx vector
 paired instructions
Date: Fri, 31 Jul 2020 13:46:36 +0530
Message-Id: <20200731081637.1837559-4-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200731081637.1837559-1-bala24@linux.ibm.com>
References: <20200731081637.1837559-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-31_02:2020-07-31,
 2020-07-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 adultscore=0 clxscore=1015 suspectscore=1 malwarescore=0 impostorscore=0
 mlxlogscore=489 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007310054
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
Cc: ravi.bangoria@linux.ibm.com, Balamuruhan S <bala24@linux.ibm.com>,
 paulus@samba.org, sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

add instruction encoding, extended opcodes, regs and DQ immediate macro
for new vsx vector paired instructions,
        * Load VSX Vector Paired (lxvp)
        * Load VSX Vector Paired Indexed (lxvpx)
	* Prefixed Load VSX Vector Paired (plxvp)
        * Store VSX Vector Paired (stxvp)
        * Store VSX Vector Paired Indexed (stxvpx)
	* Prefixed Store VSX Vector Paired (pstxvp)

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/include/asm/ppc-opcode.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index 4c0bdafb6a7b..6ad23f47d06a 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -78,6 +78,7 @@
 
 #define IMM_L(i)               ((uintptr_t)(i) & 0xffff)
 #define IMM_DS(i)              ((uintptr_t)(i) & 0xfffc)
+#define IMM_DQ(i)		(((uintptr_t)(i) & 0xfff) << 4)
 
 /*
  * 16-bit immediate helper macros: HA() is for use with sign-extending instrs
@@ -272,6 +273,8 @@
 #define PPC_INST_STFD			0xd8000000
 #define PPC_PREFIX_MLS			0x06000000
 #define PPC_PREFIX_8LS			0x04000000
+#define PPC_PLXVP_EX_OP			0xe8000000
+#define PPC_PSTXVP_EX_OP		0xf8000000
 
 /* Prefixed instructions */
 #define PPC_INST_PLD			0xe4000000
@@ -296,6 +299,8 @@
 #define __PPC_XS(s)	((((s) & 0x1f) << 21) | (((s) & 0x20) >> 5))
 #define __PPC_XT(s)	__PPC_XS(s)
 #define __PPC_T_TLB(t)	(((t) & 0x3) << 21)
+#define __PPC_TP(tp)	(((tp) & 0xf) << 22)
+#define __PPC_TX(tx)	(((tx) & 0x1) << 21)
 #define __PPC_WC(w)	(((w) & 0x3) << 21)
 #define __PPC_WS(w)	(((w) & 0x1f) << 11)
 #define __PPC_SH(s)	__PPC_WS(s)
@@ -387,6 +392,18 @@
 #define PPC_RAW_STXVD2X(s, a, b)	(0x7c000798 | VSX_XX1((s), a, b))
 #define PPC_RAW_LXVD2X(s, a, b)		(0x7c000698 | VSX_XX1((s), a, b))
 #define PPC_RAW_MFVRD(a, t)		(0x7c000066 | VSX_XX1((t) + 32, a, R0))
+#define PPC_LXVP(tp, tx, a, i) \
+	(0x18000000 | __PPC_TP(tp) | __PPC_TX(tx) | ___PPC_RA(a) | IMM_DQ(i))
+#define PPC_STXVP(sp, sx, a, i) \
+	(0x18000001 | __PPC_TP(sp) | __PPC_TX(sx) | ___PPC_RA(a) | IMM_DQ(i) | 0x1)
+#define PPC_LXVPX(tp, tx, a, b) \
+	(0x7c00029a | __PPC_TP(tp) | __PPC_TX(tx) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_STXVPX(sp, sx, a, b) \
+	(0x7c00039a | __PPC_TP(sp) | __PPC_TX(sx) | ___PPC_RA(a) | ___PPC_RB(b))
+#define PPC_PLXVP(a, i, pr, tp, tx) \
+	((PPC_PREFIX_8LS | __PPC_PRFX_R(pr) | IMM_H(i)) << 32 | (PPC_PLXVP_EX_OP | __PPC_TP(tp) | __PPC_TX(tx) | ___PPC_RA(a) | IMM_L(i)))
+#define PPC_PSTXVP(a, i, pr, sp, sx) \
+	((PPC_PREFIX_8LS | __PPC_PRFX_R(pr) | IMM_H(i)) << 32 | (PPC_PSTXVP_EX_OP | __PPC_TP(sp) | __PPC_TX(sx) | ___PPC_RA(a) | IMM_L(i)))
 #define PPC_RAW_MTVRD(t, a)		(0x7c000166 | VSX_XX1((t) + 32, a, R0))
 #define PPC_RAW_VPMSUMW(t, a, b)	(0x10000488 | VSX_XX3((t), a, b))
 #define PPC_RAW_VPMSUMD(t, a, b)	(0x100004c8 | VSX_XX3((t), a, b))
-- 
2.24.1

