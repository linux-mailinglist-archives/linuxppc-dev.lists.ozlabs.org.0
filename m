Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B3C221C89
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 08:20:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6kdH3Z8qzDqV4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 16:20:19 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6kY148KwzDqby
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 16:16:37 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06G626KY175835; Thu, 16 Jul 2020 02:16:32 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32afvktegj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 02:16:32 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06G64XJf183144;
 Thu, 16 Jul 2020 02:16:32 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32afvktefy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 02:16:32 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06G6FX23010204;
 Thu, 16 Jul 2020 06:16:30 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 327527wcmm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 06:16:30 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06G6GRMa64684300
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 06:16:27 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02E8C42063;
 Thu, 16 Jul 2020 06:16:27 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E15DE42042;
 Thu, 16 Jul 2020 06:16:22 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.79.215.148])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 Jul 2020 06:16:22 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 1/4] powerpc/sstep: support new VSX vector paired storage
 access instructions
Date: Thu, 16 Jul 2020 11:45:55 +0530
Message-Id: <20200716061558.1532199-2-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200716061558.1532199-1-bala24@linux.ibm.com>
References: <20200716061558.1532199-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_12:2020-07-15,
 2020-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=1 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007160042
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

VSX Vector Paired instructions loads/stores an octword (32 bytes)
from/to storage into two sequential VSRs. Add `analyse_instr()` support
to these new instructions,
        * Load VSX Vector Paired (lxvp)
        * Load VSX Vector Paired Indexed (lxvpx)
        * Prefixed Load VSX Vector Paired (plxvp)
        * Store VSX Vector Paired (stxvp)
        * Store VSX Vector Paired Indexed (stxvpx)
        * Prefixed Store VSX Vector Paired (pstxvp)

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/lib/sstep.c | 52 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 5abe98216dc2..1af8c1920b36 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -31,6 +31,10 @@ extern char system_call_common[];
 #define XER_OV32	0x00080000U
 #define XER_CA32	0x00040000U
 
+#ifdef CONFIG_VSX
+#define VSX_REGISTER_XTP(rd)   ((((rd) & 1) << 5) | ((rd) & 0xfe))
+#endif
+
 #ifdef CONFIG_PPC_FPU
 /*
  * Functions in ldstfp.S
@@ -2382,6 +2386,15 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			op->vsx_flags = VSX_SPLAT;
 			break;
 
+		case 333:       /* lxvpx */
+			if (!cpu_has_feature(CPU_FTR_ARCH_31))
+				return -1;
+			op->reg = VSX_REGISTER_XTP(rd);
+			op->type = MKOP(LOAD_VSX, 0, 32);
+			op->element_size = 32;
+			op->vsx_flags = VSX_CHECK_VEC;
+			break;
+
 		case 364:	/* lxvwsx */
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 4);
@@ -2410,6 +2423,14 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 				VSX_CHECK_VEC;
 			break;
 		}
+		case 461:       /* stxvpx */
+			if (!cpu_has_feature(CPU_FTR_ARCH_31))
+				return -1;
+			op->reg = VSX_REGISTER_XTP(rd);
+			op->type = MKOP(STORE_VSX, 0, 32);
+			op->element_size = 32;
+			op->vsx_flags = VSX_CHECK_VEC;
+			break;
 		case 524:	/* lxsspx */
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 4);
@@ -2651,6 +2672,23 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 #endif
 
 #ifdef CONFIG_VSX
+	case 6:
+		if (!cpu_has_feature(CPU_FTR_ARCH_31))
+			return -1;
+		op->ea = dqform_ea(word, regs);
+		op->reg = VSX_REGISTER_XTP(rd);
+		op->element_size = 32;
+		op->vsx_flags = VSX_CHECK_VEC;
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
@@ -2715,6 +2753,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		}
 		break;
 	case 1: /* Prefixed instructions */
+		if (!cpu_has_feature(CPU_FTR_ARCH_31))
+			return -1;
 		prefix_r = word & (1ul << 20);
 		ra = (suffix >> 16) & 0x1f;
 		op->update_reg = ra;
@@ -2779,12 +2819,24 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			case 57:	/* pld */
 				op->type = MKOP(LOAD, PREFIXED, 8);
 				break;
+			case 58:        /* plxvp */
+				op->reg = VSX_REGISTER_XTP(rd);
+				op->type = MKOP(LOAD_VSX, PREFIXED, 32);
+				op->element_size = 32;
+				op->vsx_flags = VSX_CHECK_VEC;
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
+				op->vsx_flags = VSX_CHECK_VEC;
+				break;
 			}
 			break;
 		case 1: /* Type 01 Eight-Byte Register-to-Register */
-- 
2.24.1

