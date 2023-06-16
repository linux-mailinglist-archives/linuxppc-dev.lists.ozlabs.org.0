Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 412457325FE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 05:50:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gfF2CqGG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qj4td11MRz3bhp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 13:50:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gfF2CqGG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qj4sh3v2Pz304p
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 13:49:28 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35G3Igfa001604;
	Fri, 16 Jun 2023 03:49:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=4AmzWwIjyMT0ExotR4NpU9bARYIfqmRTjp47EoZc/m8=;
 b=gfF2CqGGJGF7fmlAEXmlcIx8uwDfnqBwMoFFL0O4nLe91z6wI6dFS3SkXNp+M3MkT1r7
 8bmFnZaVwDGM9xRUYirih15qlcn9ATysgcy2MYb/+JczuyxZP8ICnopD7n7ZOPG1BU9W
 k0IK63UxH/bhJ7DscvD7LfZMCWf27QO7OiZj5+UXiGq0Br32di5V3W8sWu7xxGxgiSLD
 4F9WsSuIYHn70jJtZteZCD0SdXQjS0m0NeipSW7b5JLef7M7gJJrZdjaCNEFUo3jwIIP
 zUTpjRp56YngnTKhFB4hpygvwSetVOEd/Kg3J4MI6BVDwA2IcffS3MSKCcCLEJhEmuWl DA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8fqargw6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:20 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35G3hk99005575;
	Fri, 16 Jun 2023 03:49:20 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8fqargvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:20 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35G2sNN3031597;
	Fri, 16 Jun 2023 03:49:18 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r4gee44ex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:18 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35G3nGXD10420782
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jun 2023 03:49:16 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 109F22004E;
	Fri, 16 Jun 2023 03:49:16 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8CF6420040;
	Fri, 16 Jun 2023 03:49:15 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jun 2023 03:49:15 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.43.205.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id EB32060125;
	Fri, 16 Jun 2023 13:49:08 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 00/11] Add static DEXCR support
Date: Fri, 16 Jun 2023 13:48:35 +1000
Message-Id: <20230616034846.311705-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: foegCWUF8uAG-hQihwjtSBYFcPPaVUOg
X-Proofpoint-GUID: Ub7paTz4HP9yWVN2F_VbZkbPvDf-m5aB
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_17,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306160032
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
Cc: Benjamin Gray <bgray@linux.ibm.com>, ajd@linux.ibm.com, npiggin@gmail.com, ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

v3:	* Expose (H)DEXCR in ptrace as 64 bits
	* Remove build config for DEXCR, always enable NPHIE
	* Fix up documentation to reflect this
	* Some commit message fixes

Previous versions:
v2: https://lore.kernel.org/all/20230330055040.434133-1-bgray@linux.ibm.com/
v1: https://lore.kernel.org/all/20230322054612.1340573-1-bgray@linux.ibm.com/
RFC: https://lore.kernel.org/all/20221128024458.46121-1-bgray@linux.ibm.com/

Benjamin Gray (11):
  powerpc/book3s: Add missing <linux/sched.h> include
  powerpc/ptrace: Add missing <linux/regset.h> include
  powerpc/dexcr: Add initial Dynamic Execution Control Register (DEXCR)
    support
  powerpc/dexcr: Handle hashchk exception
  powerpc/dexcr: Support userspace ROP protection
  powerpc/ptrace: Expose DEXCR and HDEXCR registers to ptrace
  powerpc/ptrace: Expose HASHKEYR register to ptrace
  Documentation: Document PowerPC kernel DEXCR interface
  selftests/powerpc: Add more utility macros
  selftests/powerpc/dexcr: Add hashst/hashchk test
  selftests/powerpc/dexcr: Add DEXCR status utility lsdexcr

 Documentation/powerpc/dexcr.rst               |  58 +++++
 Documentation/powerpc/index.rst               |   1 +
 arch/powerpc/include/asm/book3s/64/kexec.h    |   5 +
 arch/powerpc/include/asm/book3s/64/kup.h      |   1 +
 arch/powerpc/include/asm/cputable.h           |   4 +-
 arch/powerpc/include/asm/ppc-opcode.h         |   1 +
 arch/powerpc/include/asm/processor.h          |   1 +
 arch/powerpc/include/asm/reg.h                |  11 +
 arch/powerpc/include/uapi/asm/elf.h           |   2 +
 arch/powerpc/kernel/cpu_setup_power.c         |   8 +
 arch/powerpc/kernel/process.c                 |  17 ++
 arch/powerpc/kernel/prom.c                    |   1 +
 arch/powerpc/kernel/ptrace/ptrace-decl.h      |   6 +
 arch/powerpc/kernel/ptrace/ptrace-view.c      |  72 +++++-
 arch/powerpc/kernel/traps.c                   |  16 ++
 include/uapi/linux/elf.h                      |   2 +
 tools/testing/selftests/powerpc/Makefile      |   1 +
 .../selftests/powerpc/dexcr/.gitignore        |   2 +
 .../testing/selftests/powerpc/dexcr/Makefile  |   9 +
 tools/testing/selftests/powerpc/dexcr/dexcr.c | 132 ++++++++++
 tools/testing/selftests/powerpc/dexcr/dexcr.h |  49 ++++
 .../selftests/powerpc/dexcr/hashchk_test.c    | 227 ++++++++++++++++++
 .../testing/selftests/powerpc/dexcr/lsdexcr.c | 141 +++++++++++
 tools/testing/selftests/powerpc/include/reg.h |   4 +
 .../testing/selftests/powerpc/include/utils.h |  31 ++-
 .../powerpc/pmu/sampling_tests/misc.h         |   2 -
 tools/testing/selftests/powerpc/utils.c       |  24 ++
 27 files changed, 823 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/powerpc/dexcr.rst
 create mode 100644 tools/testing/selftests/powerpc/dexcr/.gitignore
 create mode 100644 tools/testing/selftests/powerpc/dexcr/Makefile
 create mode 100644 tools/testing/selftests/powerpc/dexcr/dexcr.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/dexcr.h
 create mode 100644 tools/testing/selftests/powerpc/dexcr/hashchk_test.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/lsdexcr.c

--
2.40.1
