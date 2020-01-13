Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E32138B2F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 06:49:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47x2jB1k4nzDqB3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 16:49:34 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47x2Xn6HqVzDqKX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 16:42:17 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00D5Y1DX062929
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 00:42:15 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xfvsxyhrv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 00:42:15 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Mon, 13 Jan 2020 05:42:13 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 13 Jan 2020 05:42:10 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00D5g9o454198316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 13 Jan 2020 05:42:09 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E4D5AE045;
 Mon, 13 Jan 2020 05:42:09 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4821AE055;
 Mon, 13 Jan 2020 05:42:07 +0000 (GMT)
Received: from dhcp-9-109-246-161.in.ibm.com (unknown [9.124.35.118])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 13 Jan 2020 05:42:07 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 3/3] powerpc test_emulate_step: add testcases for divde[.]
 and divdeu[.] instructions
Date: Mon, 13 Jan 2020 11:11:46 +0530
X-Mailer: git-send-email 2.14.5
In-Reply-To: <20200113054146.10249-1-bala24@linux.ibm.com>
References: <20200113054146.10249-1-bala24@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20011305-4275-0000-0000-0000039702C3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20011305-4276-0000-0000-000038AAF779
Message-Id: <20200113054146.10249-4-bala24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-13_01:2020-01-13,
 2020-01-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 mlxlogscore=314 suspectscore=5 bulkscore=0 phishscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001130044
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
---
 arch/powerpc/lib/test_emulate_step.c | 164 +++++++++++++++++++++++++++++++++++
 1 file changed, 164 insertions(+)

diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index 42347067739c..552b62a70e55 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -53,6 +53,14 @@
 					___PPC_RA(a) | ___PPC_RB(b))
 #define TEST_ADDC_DOT(t, a, b)	(PPC_INST_ADDC | ___PPC_RT(t) |		\
 					___PPC_RA(a) | ___PPC_RB(b) | 0x1)
+#define TEST_DIVDE(t, a, b)	(PPC_INST_DIVDE | ___PPC_RT(t) |	\
+					___PPC_RA(a) | ___PPC_RB(b))
+#define TEST_DIVDE_DOT(t, a, b)	(PPC_INST_DIVDE_DOT | ___PPC_RT(t) |	\
+					___PPC_RA(a) | ___PPC_RB(b))
+#define TEST_DIVDEU(t, a, b)	(PPC_INST_DIVDEU | ___PPC_RT(t) |	\
+					___PPC_RA(a) | ___PPC_RB(b))
+#define TEST_DIVDEU_DOT(t, a, b)(PPC_INST_DIVDEU_DOT | ___PPC_RT(t) |	\
+					___PPC_RA(a) | ___PPC_RB(b))
 
 #define MAX_SUBTESTS	16
 
@@ -837,6 +845,162 @@ static struct compute_test compute_tests[] = {
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
2.14.5

