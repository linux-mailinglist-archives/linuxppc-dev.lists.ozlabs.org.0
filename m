Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DB66F19C5B2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 17:21:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tRcV4y6gzDrTG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 02:21:46 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tRZ45vN4zDrPT
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 02:19:40 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 032F3OWT064743
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 2 Apr 2020 11:19:37 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 302071m23t-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 11:19:37 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Thu, 2 Apr 2020 16:19:34 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 2 Apr 2020 16:19:31 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 032FJWJM46792728
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Apr 2020 15:19:32 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F980A404D;
 Thu,  2 Apr 2020 15:19:32 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D846A4053;
 Thu,  2 Apr 2020 15:19:30 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.45.155])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  2 Apr 2020 15:19:29 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v4 0/3] Add support for divde[.] and divdeu[.] instruction
 emulation
Date: Thu,  2 Apr 2020 20:49:20 +0530
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20040215-0028-0000-0000-000003F0B66F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040215-0029-0000-0000-000024B64139
Message-Id: <20200402151923.605791-1-bala24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-02_05:2020-04-02,
 2020-04-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=876 suspectscore=1
 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004020131
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
[    2.777518] emulate_step_test: divde          : RA = LONG_MIN, RB = LONG_MIN                         PASS
[    2.777882] emulate_step_test: divde          : RA = 1L, RB = 0					PASS
[    2.778432] emulate_step_test: divde          : RA = LONG_MIN, RB = LONG_MAX                         PASS
[    2.778880] emulate_step_test: divde.         : RA = LONG_MIN, RB = LONG_MIN                         PASS
[    2.780172] emulate_step_test: divde.         : RA = 1L, RB = 0					PASS
[    2.780582] emulate_step_test: divde.         : RA = LONG_MIN, RB = LONG_MAX                         PASS
[    2.780983] emulate_step_test: divdeu         : RA = LONG_MIN, RB = LONG_MIN                         PASS
[    2.781276] emulate_step_test: divdeu         : RA = 1L, RB = 0					PASS
[    2.781579] emulate_step_test: divdeu         : RA = LONG_MIN, RB = LONG_MAX                         PASS
[    2.781820] emulate_step_test: divdeu         : RA = LONG_MAX - 1, RB = LONG_MAX                     PASS
[    2.782056] emulate_step_test: divdeu         : RA = LONG_MIN + 1, RB = LONG_MIN                     PASS
[    2.782296] emulate_step_test: divdeu.        : RA = LONG_MIN, RB = LONG_MIN                         PASS
[    2.782556] emulate_step_test: divdeu.        : RA = 1L, RB = 0					PASS
[    2.783502] emulate_step_test: divdeu.        : RA = LONG_MIN, RB = LONG_MAX                         PASS
[    2.783748] emulate_step_test: divdeu.        : RA = LONG_MAX - 1, RB = LONG_MAX                     PASS
[    2.783973] emulate_step_test: divdeu.        : RA = LONG_MIN + 1, RB = LONG_MIN                     PASS
[    2.789617] registered taskstats version 1
[    2.794779] printk: console [netcon0] enabled
[    2.794931] netconsole: network logging started
[    2.795327] hctosys: unable to open rtc device (rtc0)
[    2.953449] Freeing unused kernel memory: 5120K
[    2.953639] This architecture does not have kernel memory protection.
[    2.953918] Run /init as init process
[    3.173573] mount (54) used greatest stack depth: 12576 bytes left
[    3.252465] mount (55) used greatest stack depth: 12544 bytes left

Welcome to Buildroot
buildroot login:

Balamuruhan S (3):
  powerpc ppc-opcode: add divde and divdeu opcodes
  powerpc sstep: add support for divde[.] and divdeu[.] instructions
  powerpc test_emulate_step: add testcases for divde[.] and divdeu[.]
    instructions

 arch/powerpc/include/asm/ppc-opcode.h |   8 ++
 arch/powerpc/lib/sstep.c              |  13 +-
 arch/powerpc/lib/test_emulate_step.c  | 164 ++++++++++++++++++++++++++
 3 files changed, 184 insertions(+), 1 deletion(-)


base-commit: 9c17a47d827c00401c2ff2ba71d7ecf08ed5b677
-- 
2.24.1

