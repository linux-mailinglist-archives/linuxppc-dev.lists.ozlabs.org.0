Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA4820EDE4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 07:55:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wtqk3798zDqkR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 15:55:14 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wtnl69YqzDqbD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 15:53:31 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05U5VjrV167974; Tue, 30 Jun 2020 01:53:27 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ydk9r7ck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 01:53:26 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05U5aejN016690;
 Tue, 30 Jun 2020 05:53:24 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06fra.de.ibm.com with ESMTP id 31wwcgsh33-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 05:53:24 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05U5rLLS46334060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jun 2020 05:53:21 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 41575AE04D;
 Tue, 30 Jun 2020 05:53:21 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 14726AE045;
 Tue, 30 Jun 2020 05:53:18 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.47.9])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 30 Jun 2020 05:53:17 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 1/4] powerpc/sstep: support new VSX vector paired storage
 access instructions
Date: Tue, 30 Jun 2020 11:23:04 +0530
Message-Id: <20200630055307.1154135-2-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200630055307.1154135-1-bala24@linux.ibm.com>
References: <20200630055307.1154135-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-29_21:2020-06-29,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 suspectscore=1 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 cotscore=-2147483648
 impostorscore=0 spamscore=0 priorityscore=1501 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006300037
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

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/lib/sstep.c | 44 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 5abe98216dc2..c92890e71ca7 100644
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
@@ -2382,6 +2386,13 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 			op->vsx_flags = VSX_SPLAT;
 			break;
 
+		case 333:       /* lxvpx */
+			op->reg = VSX_REGISTER_XTP(rd);
+			op->type = MKOP(LOAD_VSX, 0, 32);
+			op->element_size = 32;
+			op->vsx_flags = VSX_CHECK_VEC;
+			break;
+
 		case 364:	/* lxvwsx */
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 4);
@@ -2410,6 +2421,12 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 				VSX_CHECK_VEC;
 			break;
 		}
+		case 461:       /* stxvpx */
+			op->reg = VSX_REGISTER_XTP(rd);
+			op->type = MKOP(STORE_VSX, 0, 32);
+			op->element_size = 32;
+			op->vsx_flags = VSX_CHECK_VEC;
+			break;
 		case 524:	/* lxsspx */
 			op->reg = rd | ((word & 1) << 5);
 			op->type = MKOP(LOAD_VSX, 0, 4);
@@ -2651,6 +2668,21 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 #endif
 
 #ifdef CONFIG_VSX
+	case 6:
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
@@ -2779,12 +2811,24 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
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

base-commit: 64677779e8962c20b580b471790fe42367750599
-- 
2.24.1

