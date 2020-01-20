Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 23FCD1423D9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2020 07:56:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481MsL4Q3RzDqWp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2020 17:56:38 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 481MqL0gzYzDqWf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2020 17:54:53 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00K6q93u041679
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2020 01:54:49 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xmgbnmucj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2020 01:54:49 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Mon, 20 Jan 2020 06:54:48 -0000
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 20 Jan 2020 06:54:46 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 00K6rsWl48234794
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jan 2020 06:53:54 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AC964203F;
 Mon, 20 Jan 2020 06:54:44 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 412BD42045;
 Mon, 20 Jan 2020 06:54:43 +0000 (GMT)
Received: from dhcp-9-109-246-161.in.ibm.com (unknown [9.124.35.118])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Jan 2020 06:54:43 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3 0/3] Add support for divde[.] and divdeu[.] instruction
 emulation
Date: Mon, 20 Jan 2020 12:24:23 +0530
X-Mailer: git-send-email 2.14.5
X-TM-AS-GCONF: 00
x-cbid: 20012006-0020-0000-0000-000003A23E08
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012006-0021-0000-0000-000021F9C7B1
Message-Id: <20200120065426.3259-1-bala24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-19_08:2020-01-16,
 2020-01-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=5 phishscore=0
 mlxlogscore=568 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001200060
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

Hi All,

This patchset adds support to emulate divde, divde., divdeu and divdeu.
instructions and testcases for it.

Changes in v3:
-------------
* Fix suggestion from Sandipan to remove `PPC_INST_DIVDE_DOT` and
  `PPC_INST_DIVDEU_DOT` opcode macros defined in ppc-opcode.h, reuse
  `PPC_INST_DIVDE` and `PPC_INST_DIVDEU` in test_emulate_step.c to derive
  them respectively.

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
[    2.783973] emulate_step_test: divdeu.        : RA = LONG_MIN + 1, RB = LONG_MIN			PASS
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
 arch/powerpc/lib/sstep.c              |  13 ++-
 arch/powerpc/lib/test_emulate_step.c  | 164 ++++++++++++++++++++++++++++++++++
 3 files changed, 184 insertions(+), 1 deletion(-)


base-commit: 20862247a368dbb75d6e97d82345999adaacf3cc
-- 
2.14.5

