Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ACD6CFB0C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 07:58:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnCQJ4f6Kz3fnp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 16:58:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KyKL5QSy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KyKL5QSy;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnCG13gJMz3f4k
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 16:51:05 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32U2bJBa029486;
	Thu, 30 Mar 2023 05:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=LFw3lvtOXW9MFUx7xW/xYTSL3bIl9XlT0XdOOTQ+b/o=;
 b=KyKL5QSyv6N8rPN5aYOCYLs2MR/1Uj/iGQGjRdGndJucQ0ymMJuyVaCXb8m6yhYeHJoh
 SupampbPlu4H/hcWVDegH9SBtfYj17cEVF6Wy+TzoYtPRDKmiUTJRaMralaCMaTrkgY2
 qr8U1bNg3cvwElT7oomWWk94SQiZkCexkYFxSzAPWhFm5Pcd2Znj6RxbEnjT54oZzyve
 n4c8HmJ6AcJs8W7bLtjFCkdher7unGTsapURg4J804WR84D7v9KB0qnqbTycyrfate9Q
 lBMtR+MWSTWwt1R/II4c2RFxyqufP/ywAS7q3DFnBRv2zAGsvWZVatRaZmGULqI1LmYh 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmpr3m8nr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 05:50:57 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32U5A5Rk009123;
	Thu, 30 Mar 2023 05:50:57 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pmpr3m8n4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 05:50:56 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32TKZf9P019202;
	Thu, 30 Mar 2023 05:50:54 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3phrk6nkey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Mar 2023 05:50:54 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32U5oqql47120642
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Mar 2023 05:50:52 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DF822004E;
	Thu, 30 Mar 2023 05:50:52 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DD4A20040;
	Thu, 30 Mar 2023 05:50:51 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Mar 2023 05:50:51 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 41956602FC;
	Thu, 30 Mar 2023 16:50:48 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 00/12] Add static DEXCR support
Date: Thu, 30 Mar 2023 16:50:28 +1100
Message-Id: <20230330055040.434133-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -uesqjPh8yfnwNoYc5H4PCowA1pZdhoZ
X-Proofpoint-ORIG-GUID: WeDSJrbGxnNCfNgXdOi2teuGWCnRJxet
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-30_02,2023-03-30_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2303300043
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
Cc: npiggin@gmail.com, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Respin with requested ptrace/coredump support.

The new support is tested by making a core dump. The result has the expected

  LINUX 0x00000008 Unknown note type: (0x00000111) description data: 00 00 00 04 00 00 00 00
  LINUX 0x00000008 Unknown note type: (0x00000112) description data: 53 6c dd 5e 23 eb 5e 03

Entries when the dump is read with readelf (DEXCR hash NPHIE, HDEXCR is clear,
HASHKEYR is random). Endianness is the same as all the other register printers.

v2:	* Add ptrace/coredump support

Previous versions:
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
 arch/powerpc/include/asm/processor.h          |  10 +
 arch/powerpc/include/asm/reg.h                |  10 +
 arch/powerpc/include/uapi/asm/elf.h           |   2 +
 arch/powerpc/kernel/Makefile                  |   1 +
 arch/powerpc/kernel/cpu_setup_power.c         |   9 +
 arch/powerpc/kernel/dexcr.c                   |  36 +++
 arch/powerpc/kernel/process.c                 |  17 ++
 arch/powerpc/kernel/prom.c                    |   1 +
 arch/powerpc/kernel/ptrace/ptrace-decl.h      |   6 +
 arch/powerpc/kernel/ptrace/ptrace-view.c      |  67 +++++-
 arch/powerpc/kernel/traps.c                   |  10 +
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
 30 files changed, 872 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/powerpc/dexcr.rst
 create mode 100644 arch/powerpc/kernel/dexcr.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/.gitignore
 create mode 100644 tools/testing/selftests/powerpc/dexcr/Makefile
 create mode 100644 tools/testing/selftests/powerpc/dexcr/dexcr.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/dexcr.h
 create mode 100644 tools/testing/selftests/powerpc/dexcr/hashchk_test.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/lsdexcr.c


base-commit: 0f98241d5ef5c3bb4c5ca07ceee3a825d79999fd
--
2.39.2
