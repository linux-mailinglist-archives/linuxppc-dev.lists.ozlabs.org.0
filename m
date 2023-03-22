Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F30D56C425A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 06:47:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PhHYZ6QjNz3cff
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 16:47:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ec+5l2ct;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ec+5l2ct;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PhHXg690vz3c6P
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 16:46:43 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32M2EeuM015263
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=NbDB3sqAJI8YjsUkvs3De2aVZgoy+DptZYtx7sfBn1s=;
 b=Ec+5l2ctexCJlPHel1SEF8RKguOO/oVxP7dv64Jjhg5MP6BCxpaLgSssM7eOrZV2ckZj
 FgMJdSq2pU6A6BWdN+e8yH4lyoIF8CcMsH4a3uRjiMHpbbiP6u+SrGhvd/RnobNa+zWU
 ggrGZdZ8CgNXy5B+X9325VdKQaFuqZYqjhTg4UY0TRpMUI907nWdWd3ZGwpPIfjR0wjs
 9U3M1l0gp2aFREW/B6ovntk4FbSRKIinAjyBiZZU6E2SzwNrj1C+NwAKxIwEDS5UmstR
 UPY9Er/CuATwiBSyiOdYUrWajrPZVNHh+uEe4z2hc+2hEqXCr/84/bIt20R4faoJRVDA tQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pfrqg3cuh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:40 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32M1rIGa015024
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:38 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3pd4jfdftk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:38 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32M5kZlJ12190226
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:35 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A76D12004D
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:35 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2833020043
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 05:46:35 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7F51E6010A;
	Wed, 22 Mar 2023 16:46:32 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/9] Add static DEXCR support
Date: Wed, 22 Mar 2023 16:46:03 +1100
Message-Id: <20230322054612.1340573-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MpMbjqkZLM5iuka_al_YXoyKrKfjA2yv
X-Proofpoint-GUID: MpMbjqkZLM5iuka_al_YXoyKrKfjA2yv
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_11,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303220039
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series is a partial iteration of the RFC [1]. It strips out the dynamic
support and just adds the supporting infrastructure and static DEXCR
configuration. It should therefore not be introducing any new userspace ABI.

I could keep iterating and refactoring, but I figure there's enough
here to get useful feedback on the design.

[1]: https://lore.kernel.org/all/20221128024458.46121-1-bgray@linux.ibm.com/

Benjamin Gray (9):
  powerpc/book3s: Add missing <linux/sched.h> include
  powerpc/dexcr: Add initial Dynamic Execution Control Register (DEXCR)
    support
  powerpc/dexcr: Handle hashchk exception
  powerpc/dexcr: Support userspace ROP protection
  powerpc/dexcr: Support custom default DEXCR value
  Documentation: Document PowerPC kernel DEXCR interface
  selftests/powerpc: Add more utility macros
  selftests/powerpc/dexcr: Add hashst/hashchk test
  selftests/powerpc/dexcr: Add DEXCR status utility lsdexcr

 Documentation/powerpc/dexcr.rst               |  41 ++++
 Documentation/powerpc/index.rst               |   1 +
 arch/powerpc/Kconfig                          |  14 ++
 arch/powerpc/include/asm/book3s/64/kexec.h    |   5 +
 arch/powerpc/include/asm/book3s/64/kup.h      |   1 +
 arch/powerpc/include/asm/cputable.h           |   4 +-
 arch/powerpc/include/asm/ppc-opcode.h         |   1 +
 arch/powerpc/include/asm/processor.h          |  10 +
 arch/powerpc/include/asm/reg.h                |   7 +
 arch/powerpc/kernel/Makefile                  |   1 +
 arch/powerpc/kernel/cpu_setup_power.c         |   9 +
 arch/powerpc/kernel/dexcr.c                   |  36 +++
 arch/powerpc/kernel/process.c                 |  17 ++
 arch/powerpc/kernel/prom.c                    |   1 +
 arch/powerpc/kernel/traps.c                   |  10 +
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
 26 files changed, 776 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/powerpc/dexcr.rst
 create mode 100644 arch/powerpc/kernel/dexcr.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/.gitignore
 create mode 100644 tools/testing/selftests/powerpc/dexcr/Makefile
 create mode 100644 tools/testing/selftests/powerpc/dexcr/dexcr.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/dexcr.h
 create mode 100644 tools/testing/selftests/powerpc/dexcr/hashchk_test.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/lsdexcr.c


base-commit: 065ffaee73892e8a3629b4cfbe635697807a3c6f
--
2.39.2
