Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD0E708F24
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 07:05:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QMvtC4qmqz3fMb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 15:05:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gSc9URSv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gSc9URSv;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QMvqN6vX0z3cfw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 15:02:56 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34J4o6Po027193;
	Fri, 19 May 2023 05:02:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=oYHBTAAsf05FkKOglVoa2lj67VtxroOts/0MeMaBIVI=;
 b=gSc9URSvb0Ot1jpdsAMu4Qpju6y4TSB2w15bPdrnfeMeszktz0WsP3nnOyLummG+Fba2
 yDAuKEu8yFxO3dlMS1GPpOi4wIbv+ZE5NzLq9eutQJanyeJnuY+v5moJV7KamW3Ehupt
 JiwdQeScnH7jqH8vuXriVT3Gwj2REqI6IkkvBHJs4zdS5bMWxZofPlh/9g16RWnixYnn
 3/eW168D+U+P62dy3XD1Ckm7JTKKc/aR7YbKR9WFUFb1KyKi3v9oDc4VY55SQZLKCbMP
 cDCNlQEv15fU+YJ2/BL5eDfBCWUGcBfDfewVIjCdCpOmKHHSqoI0bNQni9tXwes1gpTg DQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qp0ke2shx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 05:02:53 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34J4mKRM022080;
	Fri, 19 May 2023 05:02:52 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qp0ke2sgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 05:02:52 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34J4qgdU000446;
	Fri, 19 May 2023 05:02:51 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3qj2652fva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 May 2023 05:02:50 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34J52m0I60621106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 May 2023 05:02:48 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 81EA620043;
	Fri, 19 May 2023 05:02:48 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8706A20040;
	Fri, 19 May 2023 05:02:47 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 19 May 2023 05:02:47 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 52DFC6013C;
	Fri, 19 May 2023 15:02:45 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 00/12] Add static DEXCR support
Date: Fri, 19 May 2023 15:02:24 +1000
Message-Id: <20230519050236.144847-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VNXo5b6ZybXRMD8K543vf2cDra7D3KQo
X-Proofpoint-ORIG-GUID: MEvF8V39ts4Or0EhkGcPzikC2nXB7YAM
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-19_02,2023-05-17_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305190038
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

The DEXCR is a SPR that allows control over various execution
'aspects', such as indirect branch prediction and enabling the
hashst/hashchk instructions. Further details are in ISA 3.1B
Book 3 chapter 9.

This series adds static (compile time) support for initialising
the DEXCR, and basic HASHKEYR bookkeeping.

v3:	* Address Russell's comments
v2:	* Add ptrace/coredump support

Previous versions:
v2: https://lore.kernel.org/all/20230330055040.434133-1-bgray@linux.ibm.com/
v1: https://lore.kernel.org/all/20230322054612.1340573-1-bgray@linux.ibm.com/
RFC: https://lore.kernel.org/all/20221128024458.46121-1-bgray@linux.ibm.com/


Benjamin Gray (12):
  powerpc/book3s: Add missing <linux/sched.h> include
  powerpc/ptrace: Add missing <linux/regset.h> include
  powerpc/dexcr: Add initial Dynamic Execution Control Register (DEXCR)
    support
  powerpc/dexcr: Handle hashchk exception
  powerpc/dexcr: Support userspace ROP protection
  powerpc/dexcr: Support custom default DEXCR value
  powerpc/ptrace: Expose DEXCR and HDEXCR registers to ptrace
  powerpc/ptrace: Expose HASHKEYR register to ptrace
  Documentation: Document PowerPC kernel DEXCR interface
  selftests/powerpc: Add more utility macros
  selftests/powerpc/dexcr: Add hashst/hashchk test
  selftests/powerpc/dexcr: Add DEXCR status utility lsdexcr

 Documentation/powerpc/dexcr.rst               |  58 +++++
 Documentation/powerpc/index.rst               |   1 +
 arch/powerpc/Kconfig                          |  14 ++
 arch/powerpc/include/asm/book3s/64/kexec.h    |   5 +
 arch/powerpc/include/asm/book3s/64/kup.h      |   1 +
 arch/powerpc/include/asm/cputable.h           |   4 +-
 arch/powerpc/include/asm/ppc-opcode.h         |   1 +
 arch/powerpc/include/asm/processor.h          |   1 +
 arch/powerpc/include/asm/reg.h                |  10 +
 arch/powerpc/include/uapi/asm/elf.h           |   2 +
 arch/powerpc/kernel/cpu_setup_power.c         |   9 +
 arch/powerpc/kernel/process.c                 |  17 ++
 arch/powerpc/kernel/prom.c                    |   1 +
 arch/powerpc/kernel/ptrace/ptrace-decl.h      |   6 +
 arch/powerpc/kernel/ptrace/ptrace-view.c      |  67 +++++-
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
 28 files changed, 832 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/powerpc/dexcr.rst
 create mode 100644 tools/testing/selftests/powerpc/dexcr/.gitignore
 create mode 100644 tools/testing/selftests/powerpc/dexcr/Makefile
 create mode 100644 tools/testing/selftests/powerpc/dexcr/dexcr.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/dexcr.h
 create mode 100644 tools/testing/selftests/powerpc/dexcr/hashchk_test.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/lsdexcr.c


base-commit: 547124f858ea52b2f7e58e8c0d39170a9fa66b4b
--
2.40.1
