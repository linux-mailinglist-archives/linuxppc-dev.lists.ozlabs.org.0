Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE23118150
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 08:24:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47XBPr6NwHzDqXM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 18:24:00 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47XBKD1CPCzDqWr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 18:19:53 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBA7HbMw002620
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 02:19:50 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wt2ksqjqm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 02:19:50 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bala24@linux.ibm.com>;
 Tue, 10 Dec 2019 07:19:48 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 10 Dec 2019 07:19:45 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBA7Jhmg50725082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Dec 2019 07:19:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6D0F4C05A;
 Tue, 10 Dec 2019 07:19:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AB5E4C050;
 Tue, 10 Dec 2019 07:19:42 +0000 (GMT)
Received: from dhcp-9-120-237-107.in.ibm.com (unknown [9.120.237.107])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 10 Dec 2019 07:19:41 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 0/3] Add support for divde[.] and divdeu[.] instruction
 emulation
Date: Tue, 10 Dec 2019 12:49:01 +0530
X-Mailer: git-send-email 2.14.5
X-TM-AS-GCONF: 00
x-cbid: 19121007-0012-0000-0000-000003736220
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121007-0013-0000-0000-000021AF3337
Message-Id: <20191210071904.31013-1-bala24@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-10_01:2019-12-10,2019-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=5 spamscore=0
 mlxscore=0 adultscore=0 mlxlogscore=616 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-1912100065
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

I would request for your review and suggestions for making it better.

Boot Log:
--------

:: ::
:: ::
[    2.732268] emulate_step_test: divde          : RA = LONG_MIN, RB = LONG_MIN				PASS
[    2.732628] emulate_step_test: divde          : RA = 1L, RB = 0					PASS
[    2.732991] emulate_step_test: divde          : RA = LONG_MIN, RB = LONG_MAX				PASS
[    2.733436] emulate_step_test: divde.         : RA = LONG_MIN, RB = LONG_MIN				PASS
[    2.733813] emulate_step_test: divde.         : RA = 1L, RB = 0					PASS
[    2.734537] emulate_step_test: divde.         : RA = LONG_MIN, RB = LONG_MAX				PASS
[    2.735555] emulate_step_test: divdeu         : RA = LONG_MIN, RB = LONG_MIN				PASS
[    2.736348] emulate_step_test: divdeu         : RA = 1L, RB = 0					PASS
[    2.736986] emulate_step_test: divdeu         : RA = LONG_MIN, RB = LONG_MAX				PASS
[    2.737417] emulate_step_test: divdeu         : RA = LONG_MAX - 1, RB = LONG_MAX			PASS
[    2.737778] emulate_step_test: divdeu         : RA = LONG_MIN + 1, RB = LONG_MIN			PASS
[    2.738155] emulate_step_test: divdeu.        : RA = LONG_MIN, RB = LONG_MIN				PASS
[    2.738530] emulate_step_test: divdeu.        : RA = 1L, RB = 0					PASS
[    2.738900] emulate_step_test: divdeu.        : RA = LONG_MIN, RB = LONG_MAX				PASS
[    2.739254] emulate_step_test: divdeu.        : RA = LONG_MAX - 1, RB = LONG_MAX			PASS
[    2.740228] emulate_step_test: divdeu.        : RA = LONG_MIN + 1, RB = LONG_MIN			PASS
[    2.751784] registered taskstats version 1
[    2.757052] printk: console [netcon0] enabled
[    2.757191] netconsole: network logging started
[    2.757466] hctosys: unable to open rtc device (rtc0)
[    2.921837] Freeing unused kernel memory: 4864K
[    2.922021] This architecture does not have kernel memory protection.
[    2.922203] Run /init as init process
[    3.183894] mount (54) used greatest stack depth: 12224 bytes left

Welcome to Buildroot
buildroot login:

Balamuruhan S (3):
  powerpc ppc-opcode: add divde, divde_dot, divdeu and divdeu_dot
    opcodes
  powerpc sstep: add support for divde[.] and divdeu[.] instructions
  powerpc test_emulate_step: add testcases for divde[.] and divdeu[.]
    instructions

 arch/powerpc/include/asm/ppc-opcode.h |  16 ++++
 arch/powerpc/lib/sstep.c              |  27 +++++-
 arch/powerpc/lib/test_emulate_step.c  | 164 ++++++++++++++++++++++++++++++++++
 3 files changed, 206 insertions(+), 1 deletion(-)


base-commit: 42159d2de18ffa66c2714d988a8c162db8b03956
-- 
2.14.5

