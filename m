Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EA38119C5E2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 17:28:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tRmb0J3KzDrVW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 02:28:47 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tRZJ17jJzDrTP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 02:19:51 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 032F3cFW065746
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 2 Apr 2020 11:19:48 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 305emf0fdk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 11:19:47 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Thu, 2 Apr 2020 16:19:30 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 2 Apr 2020 16:19:27 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 032FJfXJ55246888
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Apr 2020 15:19:41 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 338DEA406E;
 Thu,  2 Apr 2020 15:19:41 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27A94A4059;
 Thu,  2 Apr 2020 15:19:39 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.45.155])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  2 Apr 2020 15:19:38 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v4 3/3] powerpc test_emulate_step: add testcases for divde[.]
 and divdeu[.] instructions
Date: Thu,  2 Apr 2020 20:49:23 +0530
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200402151923.605791-1-bala24@linux.ibm.com>
References: <20200402151923.605791-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20040215-4275-0000-0000-000003B848EA
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040215-4276-0000-0000-000038CD9F86
Message-Id: <20200402151923.605791-4-bala24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-02_05:2020-04-02,
 2020-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=1
 mlxlogscore=588 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 bulkscore=0 mlxscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004020131
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

add testcases for divde, divde., divdeu, divdeu. emulated
instructions to cover few scenarios,
        * with same dividend and divisor to have undefine RT
          for divdeu[.]
        * with divide by zero to have undefine RT for both
          divde[.] and divdeu[.]
        * with negative dividend to cover -|divisor| < r <= 0 if
          the dividend is negative for divde[.]
        * normal case with proper dividend and divisor for both
          divde[.] and divdeu[.]

Reviewed-by: Sandipan Das <sandipan@linux.ibm.com>
Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>
Acked-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/lib/test_emulate_step.c | 164 +++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 53df4146dd32..eb1dea47a637 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -54,6 +54,14 @@
 					___PPC_RA(a) | ___PPC_RB(b))
 #define TEST_ADDC_DOT(t, a, b)	(PPC_INST_ADDC | ___PPC_RT(t) |		\
 					___PPC_RA(a) | ___PPC_RB(b) | 0x1)
+#define TEST_DIVDE(t, a, b)	(PPC_INST_DIVDE | ___PPC_RT(t) |	\
+					___PPC_RA(a) | ___PPC_RB(b))
+#define TEST_DIVDE_DOT(t, a, b)	(PPC_INST_DIVDE | ___PPC_RT(t) |	\
+					___PPC_RA(a) | ___PPC_RB(b) | 0x1)
+#define TEST_DIVDEU(t, a, b)	(PPC_INST_DIVDEU | ___PPC_RT(t) |	\
+					___PPC_RA(a) | ___PPC_RB(b))
+#define TEST_DIVDEU_DOT(t, a, b)(PPC_INST_DIVDEU | ___PPC_RT(t) |	\
+					___PPC_RA(a) | ___PPC_RB(b) | 0x1)
 
 #define MAX_SUBTESTS	16
 
@@ -838,6 +846,162 @@ static struct compute_test compute_tests[] = {
 				}
 			}
 		}
+	},
+	{
+		.mnemonic = "divde",
+		.subtests = {
+			{
+				.descr = "RA = LONG_MIN, RB = LONG_MIN",
+				.instr = TEST_DIVDE(20, 21, 22),
+				.regs = {
+					.gpr[21] = LONG_MIN,
+					.gpr[22] = LONG_MIN,
+				}
+			},
+			{
+				.descr = "RA = 1L, RB = 0",
+				.instr = TEST_DIVDE(20, 21, 22),
+				.flags = IGNORE_GPR(20),
+				.regs = {
+					.gpr[21] = 1L,
+					.gpr[22] = 0,
+				}
+			},
+			{
+				.descr = "RA = LONG_MIN, RB = LONG_MAX",
+				.instr = TEST_DIVDE(20, 21, 22),
+				.regs = {
+					.gpr[21] = LONG_MIN,
+					.gpr[22] = LONG_MAX,
+				}
+			}
+		}
+	},
+	{
+		.mnemonic = "divde.",
+		.subtests = {
+			{
+				.descr = "RA = LONG_MIN, RB = LONG_MIN",
+				.instr = TEST_DIVDE_DOT(20, 21, 22),
+				.regs = {
+					.gpr[21] = LONG_MIN,
+					.gpr[22] = LONG_MIN,
+				}
+			},
+			{
+				.descr = "RA = 1L, RB = 0",
+				.instr = TEST_DIVDE_DOT(20, 21, 22),
+				.flags = IGNORE_GPR(20),
+				.regs = {
+					.gpr[21] = 1L,
+					.gpr[22] = 0,
+				}
+			},
+			{
+				.descr = "RA = LONG_MIN, RB = LONG_MAX",
+				.instr = TEST_DIVDE_DOT(20, 21, 22),
+				.regs = {
+					.gpr[21] = LONG_MIN,
+					.gpr[22] = LONG_MAX,
+				}
+			}
+		}
+	},
+	{
+		.mnemonic = "divdeu",
+		.subtests = {
+			{
+				.descr = "RA = LONG_MIN, RB = LONG_MIN",
+				.instr = TEST_DIVDEU(20, 21, 22),
+				.flags = IGNORE_GPR(20),
+				.regs = {
+					.gpr[21] = LONG_MIN,
+					.gpr[22] = LONG_MIN,
+				}
+			},
+			{
+				.descr = "RA = 1L, RB = 0",
+				.instr = TEST_DIVDEU(20, 21, 22),
+				.flags = IGNORE_GPR(20),
+				.regs = {
+					.gpr[21] = 1L,
+					.gpr[22] = 0,
+				}
+			},
+			{
+				.descr = "RA = LONG_MIN, RB = LONG_MAX",
+				.instr = TEST_DIVDEU(20, 21, 22),
+				.regs = {
+					.gpr[21] = LONG_MIN,
+					.gpr[22] = LONG_MAX,
+				}
+			},
+			{
+				.descr = "RA = LONG_MAX - 1, RB = LONG_MAX",
+				.instr = TEST_DIVDEU(20, 21, 22),
+				.regs = {
+					.gpr[21] = LONG_MAX - 1,
+					.gpr[22] = LONG_MAX,
+				}
+			},
+			{
+				.descr = "RA = LONG_MIN + 1, RB = LONG_MIN",
+				.instr = TEST_DIVDEU(20, 21, 22),
+				.flags = IGNORE_GPR(20),
+				.regs = {
+					.gpr[21] = LONG_MIN + 1,
+					.gpr[22] = LONG_MIN,
+				}
+			}
+		}
+	},
+	{
+		.mnemonic = "divdeu.",
+		.subtests = {
+			{
+				.descr = "RA = LONG_MIN, RB = LONG_MIN",
+				.instr = TEST_DIVDEU_DOT(20, 21, 22),
+				.flags = IGNORE_GPR(20),
+				.regs = {
+					.gpr[21] = LONG_MIN,
+					.gpr[22] = LONG_MIN,
+				}
+			},
+			{
+				.descr = "RA = 1L, RB = 0",
+				.instr = TEST_DIVDEU_DOT(20, 21, 22),
+				.flags = IGNORE_GPR(20),
+				.regs = {
+					.gpr[21] = 1L,
+					.gpr[22] = 0,
+				}
+			},
+			{
+				.descr = "RA = LONG_MIN, RB = LONG_MAX",
+				.instr = TEST_DIVDEU_DOT(20, 21, 22),
+				.regs = {
+					.gpr[21] = LONG_MIN,
+					.gpr[22] = LONG_MAX,
+				}
+			},
+			{
+				.descr = "RA = LONG_MAX - 1, RB = LONG_MAX",
+				.instr = TEST_DIVDEU_DOT(20, 21, 22),
+				.regs = {
+					.gpr[21] = LONG_MAX - 1,
+					.gpr[22] = LONG_MAX,
+				}
+			},
+			{
+				.descr = "RA = LONG_MIN + 1, RB = LONG_MIN",
+				.instr = TEST_DIVDEU_DOT(20, 21, 22),
+				.flags = IGNORE_GPR(20),
+				.regs = {
+					.gpr[21] = LONG_MIN + 1,
+					.gpr[22] = LONG_MIN,
+				}
+			}
+		}
 	}
 };
 
-- 
2.24.1

