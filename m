Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3EB20AF46
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 11:56:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tXMW1F50zDqjh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 19:56:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tXHH0HxmzDr1Q
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 19:52:26 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05Q9WaFn103399; Fri, 26 Jun 2020 05:52:21 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31w3a3tphs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 05:52:21 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05Q9Wonq104548;
 Fri, 26 Jun 2020 05:52:21 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31w3a3tpha-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 05:52:21 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05Q9phnW009478;
 Fri, 26 Jun 2020 09:52:19 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 31uusjjsfu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 09:52:19 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05Q9qGU58061148
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jun 2020 09:52:16 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 958A4AE051;
 Fri, 26 Jun 2020 09:52:16 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54F8DAE056;
 Fri, 26 Jun 2020 09:52:13 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.77.194.240])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jun 2020 09:52:12 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 1/4] powerpc test_emulate_step: enhancement to test
 negative scenarios
Date: Fri, 26 Jun 2020 15:21:55 +0530
Message-Id: <20200626095158.1031507-2-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200626095158.1031507-1-bala24@linux.ibm.com>
References: <20200626095158.1031507-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-26_05:2020-06-26,
 2020-06-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 clxscore=1015
 adultscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=1
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0
 cotscore=-2147483648 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006260067
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
 arch/powerpc/lib/test_emulate_step.c | 30 +++++++++++++++++++---------
 1 file changed, 21 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 0ca2b7cc8d8c..7c30a69c174f 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -118,6 +118,7 @@
 #define IGNORE_GPR(n)	(0x1UL << (n))
 #define IGNORE_XER	(0x1UL << 32)
 #define IGNORE_CCR	(0x1UL << 33)
+#define NEGATIVE_TEST	(0x1UL << 63)
 
 static void __init init_pt_regs(struct pt_regs *regs)
 {
@@ -1202,8 +1203,10 @@ static struct compute_test compute_tests[] = {
 };
 
 static int __init emulate_compute_instr(struct pt_regs *regs,
-					struct ppc_inst instr)
+					struct ppc_inst instr,
+					bool negative)
 {
+	int analysed;
 	extern s32 patch__exec_instr;
 	struct instruction_op op;
 
@@ -1212,13 +1215,17 @@ static int __init emulate_compute_instr(struct pt_regs *regs,
 
 	regs->nip = patch_site_addr(&patch__exec_instr);
 
-	if (analyse_instr(&op, regs, instr) != 1 ||
-	    GETTYPE(op.type) != COMPUTE) {
-		pr_info("execution failed, instruction = %s\n", ppc_inst_as_str(instr));
+	analysed = analyse_instr(&op, regs, instr);
+	if (analysed != 1 || GETTYPE(op.type) != COMPUTE) {
+		if (negative)
+			return -EFAULT;
+		pr_info("emulation failed, instruction = %s\n", ppc_inst_as_str(instr));
 		return -EFAULT;
 	}
-
-	emulate_update_regs(regs, &op);
+	if (analysed == 1 && negative)
+		pr_info("negative test failed, instruction = %s\n", ppc_inst_as_str(instr));
+	if (!negative)
+		emulate_update_regs(regs, &op);
 	return 0;
 }
 
@@ -1256,7 +1263,7 @@ static void __init run_tests_compute(void)
 	struct pt_regs *regs, exp, got;
 	unsigned int i, j, k;
 	struct ppc_inst instr;
-	bool ignore_gpr, ignore_xer, ignore_ccr, passed;
+	bool ignore_gpr, ignore_xer, ignore_ccr, passed, rc, negative;
 
 	for (i = 0; i < ARRAY_SIZE(compute_tests); i++) {
 		test = &compute_tests[i];
@@ -1270,6 +1277,7 @@ static void __init run_tests_compute(void)
 			instr = test->subtests[j].instr;
 			flags = test->subtests[j].flags;
 			regs = &test->subtests[j].regs;
+			negative = flags & NEGATIVE_TEST;
 			ignore_xer = flags & IGNORE_XER;
 			ignore_ccr = flags & IGNORE_CCR;
 			passed = true;
@@ -1284,8 +1292,12 @@ static void __init run_tests_compute(void)
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

