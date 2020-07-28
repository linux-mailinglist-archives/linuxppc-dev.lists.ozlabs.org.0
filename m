Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBB9230AF4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 15:07:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BGH5M2JXKzDqHJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jul 2020 23:07:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BGH1C2BXtzDqS4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jul 2020 23:03:42 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06SD0oAq114696; Tue, 28 Jul 2020 09:03:37 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jkw51h6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 09:03:37 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06SD1ESs117141;
 Tue, 28 Jul 2020 09:03:36 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32jkw51h4y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 09:03:36 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06SD18dC003224;
 Tue, 28 Jul 2020 13:03:34 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 32gcpwa84t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2020 13:03:34 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06SD3V1S62456022
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Jul 2020 13:03:31 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 605F34C04E;
 Tue, 28 Jul 2020 13:03:31 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C495D4C058;
 Tue, 28 Jul 2020 13:03:28 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.79.208.115])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Jul 2020 13:03:28 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v4 0/3] Add support for divde[.] and divdeu[.] instruction
 emulation
Date: Tue, 28 Jul 2020 18:33:05 +0530
Message-Id: <20200728130308.1790982-1-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-28_07:2020-07-28,
 2020-07-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 impostorscore=0 suspectscore=1 spamscore=0 mlxlogscore=998
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007280095
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

Hi All,

This patchset adds support to emulate divde, divde., divdeu and divdeu.
instructions and testcases for it.

Resend v4: rebased on latest powerpc next branch

Changes in v4:
-------------
Fix review comments from Naveen,
* replace TEST_DIVDEU() instead of wrongly used TEST_DIVDEU_DOT() in
  divdeu testcase.
* Include `acked-by` tag from Naveen for the series.
* Rebase it on latest mpe's merge tree.

Changes in v3:
-------------
* Fix suggestion from Sandipan to remove `PPC_INST_DIVDE_DOT` and
  `PPC_INST_DIVDEU_DOT` opcode macros defined in ppc-opcode.h, reuse
  `PPC_INST_DIVDE` and `PPC_INST_DIVDEU` in test_emulate_step.c to
  derive them respectively.

Changes in v2:
-------------
* Fix review comments from Paul to make divde_dot and divdeu_dot simple
  by using divde and divdeu, then goto `arith_done` instead of
  `compute_done`.
* Include `Reviewed-by` tag from Sandipan Das.
* Rebase with recent mpe's merge tree.

I would request for your review and suggestions for making it better.

Boot Log:
--------
:: ::
:: ::
291494043: (291493996): [    0.352649][    T1] emulate_step_test: divde          : RA = LONG_MIN, RB = LONG_MIN                       PASS
291517665: (291517580): [    0.352695][    T1] emulate_step_test: divde          : RA = 1L, RB = 0                                    PASS
291541357: (291541234): [    0.352742][    T1] emulate_step_test: divde          : RA = LONG_MIN, RB = LONG_MAX                       PASS
291565107: (291564946): [    0.352788][    T1] emulate_step_test: divde.         : RA = LONG_MIN, RB = LONG_MIN                       PASS
291588757: (291588558): [    0.352834][    T1] emulate_step_test: divde.         : RA = 1L, RB = 0                                    PASS
291612477: (291612240): [    0.352881][    T1] emulate_step_test: divde.         : RA = LONG_MIN, RB = LONG_MAX                       PASS
291636201: (291635926): [    0.352927][    T1] emulate_step_test: divdeu         : RA = LONG_MIN, RB = LONG_MIN                       PASS
291659830: (291659517): [    0.352973][    T1] emulate_step_test: divdeu         : RA = 1L, RB = 0                                    PASS
291683529: (291683178): [    0.353019][    T1] emulate_step_test: divdeu         : RA = LONG_MIN, RB = LONG_MAX                       PASS
291707248: (291706859): [    0.353066][    T1] emulate_step_test: divdeu         : RA = LONG_MAX - 1, RB = LONG_MAX                   PASS
291730962: (291730535): [    0.353112][    T1] emulate_step_test: divdeu         : RA = LONG_MIN + 1, RB = LONG_MIN                   PASS
291754714: (291754249): [    0.353158][    T1] emulate_step_test: divdeu.        : RA = LONG_MIN, RB = LONG_MIN                       PASS
291778371: (291777868): [    0.353205][    T1] emulate_step_test: divdeu.        : RA = 1L, RB = 0                                    PASS
291802098: (291801557): [    0.353251][    T1] emulate_step_test: divdeu.        : RA = LONG_MIN, RB = LONG_MAX                       PASS
291825844: (291825265): [    0.353297][    T1] emulate_step_test: divdeu.        : RA = LONG_MAX - 1, RB = LONG_MAX                   PASS
291849586: (291848969): [    0.353344][    T1] emulate_step_test: divdeu.        : RA = LONG_MIN + 1, RB = LONG_MIN                   PASS
:: ::
:: ::
292520225: (292519608): [    0.354654][    T1] registered taskstats version 1
292584751: (292584134): [    0.354780][    T1] pstore: Using crash dump compression: deflate
296454422: (296453805): [    0.362338][    T1] Freeing unused kernel memory: 1408K
296467838: (296467221): [    0.362364][    T1] This architecture does not have kernel memory protection.
296485387: (296484770): [    0.362398][    T1] Run /init as init process
297987339: (297986761): [    0.365332][   T46] mount (46) used greatest stack depth: 12512 bytes left
298889548: (298888992): [    0.367094][   T47] mount (47) used greatest stack depth: 11824 bytes left

355356256: (355355821): Welcome to Buildroot
355376898: (355376463): buildroot login:

Balamuruhan S (3):
  powerpc ppc-opcode: add divde and divdeu opcodes
  powerpc sstep: add support for divde[.] and divdeu[.] instructions
  powerpc test_emulate_step: add testcases for divde[.] and divdeu[.]
    instructions

 arch/powerpc/include/asm/ppc-opcode.h |   6 +
 arch/powerpc/lib/sstep.c              |  13 ++-
 arch/powerpc/lib/test_emulate_step.c  | 156 ++++++++++++++++++++++++++
 3 files changed, 174 insertions(+), 1 deletion(-)


base-commit: 7a9912e4cf048b607c8fafcfbdca7566660f1d78
-- 
2.24.1

