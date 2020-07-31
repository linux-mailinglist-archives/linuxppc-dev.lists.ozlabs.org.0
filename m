Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C05F234120
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 10:21:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJ0c75Hn6zDqcJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 18:21:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJ0W60vYdzDqbX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 18:17:05 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06V83MEK185411; Fri, 31 Jul 2020 04:16:58 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32mf988kr1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 04:16:58 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06V8GHju028921;
 Fri, 31 Jul 2020 08:16:57 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 32gcqk49w6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 31 Jul 2020 08:16:56 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06V8Gs5x60162118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 Jul 2020 08:16:54 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FCEE11C050;
 Fri, 31 Jul 2020 08:16:54 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D692311C058;
 Fri, 31 Jul 2020 08:16:51 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.77.199.67])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 31 Jul 2020 08:16:51 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3 1/4] powerpc/sstep: support new VSX vector paired storage
 access instructions
Date: Fri, 31 Jul 2020 13:46:34 +0530
Message-Id: <20200731081637.1837559-2-bala24@linux.ibm.com>
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
 priorityscore=1501
 impostorscore=0 bulkscore=0 mlxlogscore=980 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=1 lowpriorityscore=0 phishscore=0 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007310059
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

VSX Vector Paired instructions loads/stores an octword (32 bytes)
from/to storage into two sequential VSRs. Add `analyse_instr()` support
to these new instructions,
        * Load VSX Vector Paired (lxvp)
        * Load VSX Vector Paired Indexed (lxvpx)
        * Prefixed Load VSX Vector Paired (plxvp)
        * Store VSX Vector Paired (stxvp)
        * Store VSX Vector Paired Indexed (stxvpx)
        * Prefixed Store VSX Vector Paired (pstxvp)

Suggested-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/lib/sstep.c | 45 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index c58ea9e787cb..22147257d74d 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -32,6 +32,10 @@ extern char system_call_vectored_emulate[];
 #define XER_OV32	0x00080000U
 #define XER_CA32	0x00040000U
 
+#ifdef CONFIG_VSX
+#define VSX_REGISTER_XTP(rd)   ((((rd) & 1) << 5) | ((rd) & 0xfe))
+#endif
+
 #ifdef CONFIG_PPC_FPU
 /*
  * Functions in ldstfp.S
@@ -2386,6 +2390,14 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			op->vsx_flags = VSX_SPLAT;
 			break;
 
+		case 333:       /* lxvpx */
+			if (!cpu_has_feature(CPU_FTR_ARCH_31))
+				return -1;
+			op->reg = VSX_REGISTER_XTP(rd);
+			op->type = MKOP(LOAD_VSX, 0, 32);
+			op->element_size = 32;
+			break;
+
 		case 364:	/* lxvwsx */
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 4);
@@ -2414,6 +2426,13 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 				VSX_CHECK_VEC;
 			break;
 		}
+		case 461:       /* stxvpx */
+			if (!cpu_has_feature(CPU_FTR_ARCH_31))
+				return -1;
+			op->reg = VSX_REGISTER_XTP(rd);
+			op->type = MKOP(STORE_VSX, 0, 32);
+			op->element_size = 32;
+			break;
 		case 524:	/* lxsspx */
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 4);
@@ -2655,6 +2674,22 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 #endif
 
 #ifdef CONFIG_VSX
+	case 6:
+		if (!cpu_has_feature(CPU_FTR_ARCH_31))
+			return -1;
+		op->ea = dqform_ea(word, regs);
+		op->reg = VSX_REGISTER_XTP(rd);
+		op->element_size = 32;
+		switch (word & 0xf) {
+		case 0:         /* lxvp */
+			op->type = MKOP(LOAD_VSX, 0, 32);
+			break;
+		case 1:         /* stxvp */
+			op->type = MKOP(STORE_VSX, 0, 32);
+			break;
+		}
+		break;
+
 	case 61:	/* stfdp, lxv, stxsd, stxssp, stxv */
 		switch (word & 7) {
 		case 0:		/* stfdp with LSB of DS field = 0 */
@@ -2783,12 +2818,22 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			case 57:	/* pld */
 				op->type = MKOP(LOAD, PREFIXED, 8);
 				break;
+			case 58:        /* plxvp */
+				op->reg = VSX_REGISTER_XTP(rd);
+				op->type = MKOP(LOAD_VSX, PREFIXED, 32);
+				op->element_size = 32;
+				break;
 			case 60:        /* stq */
 				op->type = MKOP(STORE, PREFIXED, 16);
 				break;
 			case 61:	/* pstd */
 				op->type = MKOP(STORE, PREFIXED, 8);
 				break;
+			case 62:        /* pstxvp */
+				op->reg = VSX_REGISTER_XTP(rd);
+				op->type = MKOP(STORE_VSX, PREFIXED, 32);
+				op->element_size = 32;
+				break;
 			}
 			break;
 		case 1: /* Type 01 Eight-Byte Register-to-Register */
-- 
2.24.1

