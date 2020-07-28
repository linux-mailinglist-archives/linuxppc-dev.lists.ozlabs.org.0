Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A6CC2230B41
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 15:16:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGHJ449XnzDr0V
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 23:16:36 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGH1N37ZxzDqhY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 23:03:52 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SD3KKE080111; Tue, 28 Jul 2020 09:03:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jgm87pxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 09:03:46 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06SD3jV2082407;
 Tue, 28 Jul 2020 09:03:45 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jgm87pvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 09:03:45 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06SD0Pjw018132;
 Tue, 28 Jul 2020 13:03:42 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 32gcq0t8y6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 13:03:42 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06SD3dau38862980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jul 2020 13:03:39 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E7124C04A;
 Tue, 28 Jul 2020 13:03:39 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40A844C040;
 Tue, 28 Jul 2020 13:03:37 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.79.208.115])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Jul 2020 13:03:37 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v4 3/3] powerpc test_emulate_step: add testcases for divde[.]
 and divdeu[.] instructions
Date: Tue, 28 Jul 2020 18:33:08 +0530
Message-Id: <20200728130308.1790982-4-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200728130308.1790982-1-bala24@linux.ibm.com>
References: <20200728130308.1790982-1-bala24@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_11:2020-07-28,
 2020-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 mlxlogscore=850 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007280099
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
 arch/powerpc/lib/test_emulate_step.c | 156 +++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/arch/powerpc/lib/test_emulate_step.c b/arch/powerpc/lib/test_emulate_step.c
index d242e9f72e0c..0a201b771477 100644
--- a/arch/powerpc/lib/test_emulate_step.c
+++ b/arch/powerpc/lib/test_emulate_step.c
@@ -1019,6 +1019,162 @@ static struct compute_test compute_tests[] = {
 			}
 		}
 	},
+	{
+		.mnemonic = "divde",
+		.subtests = {
+			{
+				.descr = "RA = LONG_MIN, RB = LONG_MIN",
+				.instr = ppc_inst(PPC_RAW_DIVDE(20, 21, 22)),
+				.regs = {
+					.gpr[21] = LONG_MIN,
+					.gpr[22] = LONG_MIN,
+				}
+			},
+			{
+				.descr = "RA = 1L, RB = 0",
+				.instr = ppc_inst(PPC_RAW_DIVDE(20, 21, 22)),
+				.flags = IGNORE_GPR(20),
+				.regs = {
+					.gpr[21] = 1L,
+					.gpr[22] = 0,
+				}
+			},
+			{
+				.descr = "RA = LONG_MIN, RB = LONG_MAX",
+				.instr = ppc_inst(PPC_RAW_DIVDE(20, 21, 22)),
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
+				.instr = ppc_inst(PPC_RAW_DIVDE_DOT(20, 21, 22)),
+				.regs = {
+					.gpr[21] = LONG_MIN,
+					.gpr[22] = LONG_MIN,
+				}
+			},
+			{
+				.descr = "RA = 1L, RB = 0",
+				.instr = ppc_inst(PPC_RAW_DIVDE_DOT(20, 21, 22)),
+				.flags = IGNORE_GPR(20),
+				.regs = {
+					.gpr[21] = 1L,
+					.gpr[22] = 0,
+				}
+			},
+			{
+				.descr = "RA = LONG_MIN, RB = LONG_MAX",
+				.instr = ppc_inst(PPC_RAW_DIVDE_DOT(20, 21, 22)),
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
+				.instr = ppc_inst(PPC_RAW_DIVDEU(20, 21, 22)),
+				.flags = IGNORE_GPR(20),
+				.regs = {
+					.gpr[21] = LONG_MIN,
+					.gpr[22] = LONG_MIN,
+				}
+			},
+			{
+				.descr = "RA = 1L, RB = 0",
+				.instr = ppc_inst(PPC_RAW_DIVDEU(20, 21, 22)),
+				.flags = IGNORE_GPR(20),
+				.regs = {
+					.gpr[21] = 1L,
+					.gpr[22] = 0,
+				}
+			},
+			{
+				.descr = "RA = LONG_MIN, RB = LONG_MAX",
+				.instr = ppc_inst(PPC_RAW_DIVDEU(20, 21, 22)),
+				.regs = {
+					.gpr[21] = LONG_MIN,
+					.gpr[22] = LONG_MAX,
+				}
+			},
+			{
+				.descr = "RA = LONG_MAX - 1, RB = LONG_MAX",
+				.instr = ppc_inst(PPC_RAW_DIVDEU(20, 21, 22)),
+				.regs = {
+					.gpr[21] = LONG_MAX - 1,
+					.gpr[22] = LONG_MAX,
+				}
+			},
+			{
+				.descr = "RA = LONG_MIN + 1, RB = LONG_MIN",
+				.instr = ppc_inst(PPC_RAW_DIVDEU(20, 21, 22)),
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
+				.instr = ppc_inst(PPC_RAW_DIVDEU_DOT(20, 21, 22)),
+				.flags = IGNORE_GPR(20),
+				.regs = {
+					.gpr[21] = LONG_MIN,
+					.gpr[22] = LONG_MIN,
+				}
+			},
+			{
+				.descr = "RA = 1L, RB = 0",
+				.instr = ppc_inst(PPC_RAW_DIVDEU_DOT(20, 21, 22)),
+				.flags = IGNORE_GPR(20),
+				.regs = {
+					.gpr[21] = 1L,
+					.gpr[22] = 0,
+				}
+			},
+			{
+				.descr = "RA = LONG_MIN, RB = LONG_MAX",
+				.instr = ppc_inst(PPC_RAW_DIVDEU_DOT(20, 21, 22)),
+				.regs = {
+					.gpr[21] = LONG_MIN,
+					.gpr[22] = LONG_MAX,
+				}
+			},
+			{
+				.descr = "RA = LONG_MAX - 1, RB = LONG_MAX",
+				.instr = ppc_inst(PPC_RAW_DIVDEU_DOT(20, 21, 22)),
+				.regs = {
+					.gpr[21] = LONG_MAX - 1,
+					.gpr[22] = LONG_MAX,
+				}
+			},
+			{
+				.descr = "RA = LONG_MIN + 1, RB = LONG_MIN",
+				.instr = ppc_inst(PPC_RAW_DIVDEU_DOT(20, 21, 22)),
+				.flags = IGNORE_GPR(20),
+				.regs = {
+					.gpr[21] = LONG_MIN + 1,
+					.gpr[22] = LONG_MIN,
+				}
+			}
+		}
+	},
 	{
 		.mnemonic = "paddi",
 		.cpu_feature = CPU_FTR_ARCH_31,
-- 
2.24.1

