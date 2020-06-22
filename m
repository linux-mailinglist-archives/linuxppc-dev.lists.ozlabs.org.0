Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F35820307F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 09:17:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49r11s5qkxzDqdx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 17:17:05 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49r0t93HmzzDqfN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 17:10:25 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05M737Y0131312; Mon, 22 Jun 2020 03:10:19 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31sne8ntt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 03:10:19 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05M738cU131346;
 Mon, 22 Jun 2020 03:10:18 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31sne8ntrq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 03:10:18 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05M7A8pA027402;
 Mon, 22 Jun 2020 07:10:16 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 31sa382vjm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 07:10:16 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05M7ADV959768844
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Jun 2020 07:10:13 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FC2EA4040;
 Mon, 22 Jun 2020 07:10:13 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5535BA406D;
 Mon, 22 Jun 2020 07:10:10 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.52.56])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 22 Jun 2020 07:10:09 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 3/6] powerpc test_emulate_step: enhancement to test negative
 scenarios
Date: Mon, 22 Jun 2020 12:39:38 +0530
Message-Id: <20200622070941.759307-4-bala24@linux.ibm.com>
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
 adultscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 suspectscore=1 bulkscore=0
 cotscore=-2147483648 clxscore=1015 spamscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006220048
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

add provision to declare test is a negative scenario, verify
whether emulation fails and avoid executing it.

Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
---
 arch/powerpc/lib/test_emulate_step.c | 46 ++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index e3b1797adfae..79acc899a618 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -703,6 +703,7 @@ struct compute_test {
 		unsigned long flags;
 		struct ppc_inst instr;
 		struct pt_regs regs;
+		bool negative;
 	} subtests[MAX_SUBTESTS + 1];
 };
 
@@ -1202,9 +1203,10 @@ static struct compute_test compute_tests[] = {
 };
 
 static int __init emulate_compute_instr(struct pt_regs *regs,
-					struct ppc_inst instr)
+					struct ppc_inst instr,
+					bool negative)
 {
-	int prefix_r, ra;
+	int prefix_r, ra, analysed;
 	extern s32 patch__exec_instr;
 	struct instruction_op op;
 
@@ -1223,8 +1225,10 @@ static int __init emulate_compute_instr(struct pt_regs *regs,
 			regs->nip = patch_site_addr(&patch__exec_instr);
 	}
 
-	if (analyse_instr(&op, regs, instr) != 1 ||
-	    GETTYPE(op.type) != COMPUTE) {
+	analysed = analyse_instr(&op, regs, instr);
+	if (analysed != 1 || GETTYPE(op.type) != COMPUTE) {
+		if (negative)
+			return -EFAULT;
 		if (!ppc_inst_prefixed(instr)) {
 			pr_info("emulation failed, instruction = 0x%08x\n",
 				ppc_inst_val(instr));
@@ -1235,8 +1239,18 @@ static int __init emulate_compute_instr(struct pt_regs *regs,
 		}
 		return -EFAULT;
 	}
-
-	emulate_update_regs(regs, &op);
+	if (analysed == 1 && negative) {
+		if (!ppc_inst_prefixed(instr)) {
+			pr_info("negative test failed, instruction = 0x%08x\n",
+				ppc_inst_val(instr));
+		} else {
+			pr_info("negative test  failed, instruction = 0x%08x 0x%08x\n",
+				ppc_inst_val(instr),
+				ppc_inst_suffix(instr));
+		}
+	}
+	if (!negative)
+		emulate_update_regs(regs, &op);
 	return 0;
 }
 
@@ -1252,7 +1266,14 @@ static int __init execute_compute_instr(struct pt_regs *regs,
 	/* Patch the NOP with the actual instruction */
 	patch_instruction_site(&patch__exec_instr, instr);
 	if (exec_instr(regs)) {
-		pr_info("execution failed, instruction = 0x%08x\n", ppc_inst_val(instr));
+		if (!ppc_inst_prefixed(instr)) {
+			pr_info("execution failed, instruction = 0x%08x\n",
+				ppc_inst_val(instr));
+		} else {
+			pr_info("execution failed, instruction = 0x%08x 0x%08x\n",
+				ppc_inst_val(instr),
+				ppc_inst_suffix(instr));
+		}
 		return -EFAULT;
 	}
 
@@ -1274,7 +1295,7 @@ static void __init run_tests_compute(void)
 	struct pt_regs *regs, exp, got;
 	unsigned int i, j, k;
 	struct ppc_inst instr;
-	bool ignore_gpr, ignore_xer, ignore_ccr, passed;
+	bool ignore_gpr, ignore_xer, ignore_ccr, passed, rc, negative;
 
 	for (i = 0; i < ARRAY_SIZE(compute_tests); i++) {
 		test = &compute_tests[i];
@@ -1288,6 +1309,7 @@ static void __init run_tests_compute(void)
 			instr = test->subtests[j].instr;
 			flags = test->subtests[j].flags;
 			regs = &test->subtests[j].regs;
+			negative = test->subtests[j].negative;
 			ignore_xer = flags & IGNORE_XER;
 			ignore_ccr = flags & IGNORE_CCR;
 			passed = true;
@@ -1302,8 +1324,12 @@ static void __init run_tests_compute(void)
 			exp.msr = MSR_KERNEL;
 			got.msr = MSR_KERNEL;
 
-			if (emulate_compute_instr(&got, instr) ||
-			    execute_compute_instr(&exp, instr)) {
+			rc = emulate_compute_instr(&got, instr, negative) != 0;
+			if (negative) {
+				/* skip executing instruction */
+				passed = rc;
+				goto print;
+			} else if (rc || execute_compute_instr(&exp, instr)) {
 				passed = false;
 				goto print;
 			}
-- 
2.24.1

