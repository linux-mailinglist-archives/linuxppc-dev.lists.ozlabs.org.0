Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0C8203084
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 09:20:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49r15M3wQXzDqjy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 17:20:07 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49r0tL0y05zDqdS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 17:10:33 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05M73DiU088432; Mon, 22 Jun 2020 03:10:29 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31svf0xkg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 03:10:28 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05M73UkY090034;
 Mon, 22 Jun 2020 03:10:28 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31svf0xkeq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 03:10:28 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05M7AQZA027447;
 Mon, 22 Jun 2020 07:10:26 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 31sa382vjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 07:10:25 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05M7ANoq55574772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Jun 2020 07:10:23 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B6E2A4055;
 Mon, 22 Jun 2020 07:10:23 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96F22A4057;
 Mon, 22 Jun 2020 07:10:20 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.52.56])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 22 Jun 2020 07:10:20 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 5/6] powerpc sstep: introduce macros to retrieve Prefix
 instruction operands
Date: Mon, 22 Jun 2020 12:39:40 +0530
Message-Id: <20200622070941.759307-6-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200622070941.759307-1-bala24@linux.ibm.com>
References: <20200622070941.759307-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-22_02:2020-06-22,
 2020-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=1
 mlxlogscore=568 malwarescore=0 impostorscore=0 priorityscore=1501
 adultscore=0 spamscore=0 cotscore=-2147483648 lowpriorityscore=0
 bulkscore=0 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006220052
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

retrieve prefix instruction operands RA and pc relative bit R values
using macros and adopt it in sstep.c and test_emulate_step.c.

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/include/asm/sstep.h     |  4 ++++
 arch/powerpc/lib/sstep.c             | 12 ++++++------
 arch/powerpc/lib/test_emulate_step.c |  4 ++--
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/sstep.h b/arch/powerpc/include/asm/sstep.h
index 3b01c69a44aa..325975b4ef30 100644
--- a/arch/powerpc/include/asm/sstep.h
+++ b/arch/powerpc/include/asm/sstep.h
@@ -104,6 +104,10 @@ enum instruction_type {
 
 #define MKOP(t, f, s)	((t) | (f) | SIZE(s))
 
+/* Prefix instruction operands */
+#define GET_PREFIX_RA(i)	(((i) >> 16) & 0x1f)
+#define GET_PREFIX_R(i)		((i) & (1ul << 20))
+
 struct instruction_op {
 	int type;
 	int reg;
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 5abe98216dc2..fb4c5767663d 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -200,8 +200,8 @@ static nokprobe_inline unsigned long mlsd_8lsd_ea(unsigned int instr,
 	unsigned int  dd;
 	unsigned long ea, d0, d1, d;
 
-	prefix_r = instr & (1ul << 20);
-	ra = (suffix >> 16) & 0x1f;
+	prefix_r = GET_PREFIX_R(instr);
+	ra = GET_PREFIX_RA(suffix);
 
 	d0 = instr & 0x3ffff;
 	d1 = suffix & 0xffff;
@@ -1339,8 +1339,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 	switch (opcode) {
 #ifdef __powerpc64__
 	case 1:
-		prefix_r = word & (1ul << 20);
-		ra = (suffix >> 16) & 0x1f;
+		prefix_r = GET_PREFIX_R(word);
+		ra = GET_PREFIX_RA(suffix);
 		rd = (suffix >> 21) & 0x1f;
 		op->reg = rd;
 		op->val = regs->gpr[rd];
@@ -2715,8 +2715,8 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		}
 		break;
 	case 1: /* Prefixed instructions */
-		prefix_r = word & (1ul << 20);
-		ra = (suffix >> 16) & 0x1f;
+		prefix_r = GET_PREFIX_R(word);
+		ra = GET_PREFIX_RA(suffix);
 		op->update_reg = ra;
 		rd = (suffix >> 21) & 0x1f;
 		op->reg = rd;
diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index f9825c275c31..f1a447026b6e 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -1229,8 +1229,8 @@ static int __init emulate_compute_instr(struct pt_regs *regs,
 	 * instruction
 	 */
 	if (ppc_inst_prefixed(instr)) {
-		prefix_r = ppc_inst_val(instr) & (1UL << 20);
-		ra = (ppc_inst_suffix(instr) >> 16) & 0x1f;
+		prefix_r = GET_PREFIX_R(ppc_inst_val(instr));
+		ra = GET_PREFIX_RA(ppc_inst_suffix(instr));
 		if (prefix_r && !ra)
 			regs->nip = patch_site_addr(&patch__exec_instr);
 	}
-- 
2.24.1

