Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C107D221C7E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 08:18:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B6kZl0NsqzDqby
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 16:18:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B6kXy1hh4zDqZT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 16:16:33 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06G626oO175769; Thu, 16 Jul 2020 02:16:27 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32afvktee4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 02:16:27 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06G62CR0176300;
 Thu, 16 Jul 2020 02:16:26 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32afvktedb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 02:16:26 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06G6FNBj014255;
 Thu, 16 Jul 2020 06:16:25 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3274pgw3t6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jul 2020 06:16:25 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06G6GM8x27591148
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Jul 2020 06:16:22 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 289124205C;
 Thu, 16 Jul 2020 06:16:22 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2CC5042049;
 Thu, 16 Jul 2020 06:16:18 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.79.215.148])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 16 Jul 2020 06:16:17 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 0/4] VSX 32-byte vector paired load/store instructions
Date: Thu, 16 Jul 2020 11:45:54 +0530
Message-Id: <20200716061558.1532199-1-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-15_12:2020-07-15,
 2020-07-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=978
 bulkscore=0 clxscore=1015 spamscore=0 adultscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=1 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007160042
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

VSX vector paired instructions operates with octword (32-byte) operand
for loads and stores between storage and a pair of two sequential Vector-Scalar
Registers (VSRs). There are 4 word instructions and 2 prefixed instructions
that provides this 32-byte storage access operations - lxvp, lxvpx, stxvp,
stxvpx, plxvpx, pstxvpx.

Emulation infrastructure doesn't have support for these instructions, to
operate with 32-byte storage access and to operate with 2 VSX registers.
This patch series enables the instruction emulation support and adds test
cases for them respectively.

Changes in v2:
-------------
* Fix suggestion from Sandipan, wrap ISA 3.1 instructions with
  cpu_has_feature(CPU_FTR_ARCH_31) check.

* Rebase on latest powerpc next branch.

Balamuruhan S (4):
  powerpc/sstep: support new VSX vector paired storage access
    instructions
  powerpc/sstep: support emulation for vsx vector paired storage access
    instructions
  powerpc ppc-opcode: add opcodes for vsx vector paired instructions
  powerpc sstep: add testcases for vsx load/store instructions

 arch/powerpc/include/asm/ppc-opcode.h |  11 ++
 arch/powerpc/include/asm/sstep.h      |   2 +-
 arch/powerpc/lib/sstep.c              | 110 ++++++++++-
 arch/powerpc/lib/test_emulate_step.c  | 273 ++++++++++++++++++++++++++
 4 files changed, 386 insertions(+), 10 deletions(-)


base-commit: b2b46304e9360f3dda49c9d8ba4a1478b9eecf1d
-- 
2.24.1

