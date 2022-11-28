Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15403639FD0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 03:54:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL96v6tkrz3f6d
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 13:54:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GdsO7kZ7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GdsO7kZ7;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL8wl16Z4z2xmg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 13:45:58 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS0WYvO024065;
	Mon, 28 Nov 2022 02:45:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=kkb8XBGNZ820tIgYC+hmxCyuaKOq5Y0MliPb3LujOtI=;
 b=GdsO7kZ7ueUqPnkvEmao1OKxNKKLuQH1ya3u8T3zPaopYdGAexA6iMO49Totz4HlpCbo
 Af84Bru7SCI1+rQYpLKtMRTKUVs82ws34fdJboJLbcTE8s5xlvh0Ws69ieWbLCyT1e2o
 r+zVkN25EJMYXBsdSV/8LBRDSN9ArDJDknKuiFb7sLPV88QXg68FfDxIKOMPXOhzr+D1
 MTiRA1b2pxAzJ8ptDfWU0NdZRdX40uGlv+/Kk/ZVrQY5kluZMnBAVTl02AMW5+KDmTkj
 rKJj7nGnzNlMsZdrxV5+tch11RRByRDZ7rQJh8QYcIRbZ73AMxs6nVcY7q/PKI3y+e4B SQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3v8j4c35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 02:45:47 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AS2axim000612;
	Mon, 28 Nov 2022 02:45:45 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06ams.nl.ibm.com with ESMTP id 3m3a2hsurn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 02:45:45 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AS2dJ1t58720600
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 02:39:19 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 742494C04E;
	Mon, 28 Nov 2022 02:45:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C89B94C044;
	Mon, 28 Nov 2022 02:45:42 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 28 Nov 2022 02:45:42 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8BB00600D5;
	Mon, 28 Nov 2022 13:45:37 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 00/13] Add DEXCR support
Date: Mon, 28 Nov 2022 13:44:45 +1100
Message-Id: <20221128024458.46121-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: a-7nEkAIqaiILGrryBIa6W8--vDGTblJ
X-Proofpoint-ORIG-GUID: a-7nEkAIqaiILGrryBIa6W8--vDGTblJ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_02,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=956 malwarescore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280018
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
Cc: ajd@linux.ibm.com, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, cmr@bluescreens.de, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series is based on initial work by Chris Riedl that was not sent
to the list.

Adds a kernel interface for userspace to interact with the DEXCR.
The DEXCR is a SPR that allows control over various execution
'aspects', such as indirect branch prediction and enabling the
hashst/hashchk instructions. Further details are in ISA 3.1B
Book 3 chapter 12.

This RFC proposes an interface for users to interact with the DEXCR.
It aims to support

* Querying supported aspects
* Getting/setting aspects on a per-process level
* Allowing global overrides across all processes

There are some parts that I'm not sure on the best way to approach (hence RFC):

* The feature names in arch/powerpc/kernel/dt_cpu_ftrs.c appear to be unimplemented
  in skiboot, so are being defined by this series. Is being so verbose fine?
* What aspects should be editable by a process? E.g., SBHE has
  effects that potentially bleed into other processes. Should
  it only be system wide configurable?
* Should configuring certain aspects for the process be non-privileged? E.g.,
  Is there harm in always allowing configuration of IBRTPD, SRAPD? The *FORCE_SET*
  action prevents further process local changes regardless of privilege.
* The tests fail Patchwork CI because of the new prctl macros, and the CI
  doesn't run headers_install and add -isystem <buildpath>/usr/include to
  the make command.
* On handling an exception, I don't check if the NPHIE bit is enabled in the DEXCR.
  To do so would require reading both the DEXCR and HDEXCR, for little gain (it
  should only matter that the current instruction was a hashchk. If so, the only
  reason it would cause an exception is the failed check. If the instruction is
  rewritten between exception and check we'd be wrong anyway).

The series is based on the earlier selftest utils series[1], so the tests won't build
at all without applying that first. The kernel side should build fine on ppc/next
247f34f7b80357943234f93f247a1ae6b6c3a740 though.

[1]: https://patchwork.ozlabs.org/project/linuxppc-dev/cover/20221122231103.15829-1-bgray@linux.ibm.com/

Benjamin Gray (13):
  powerpc/book3s: Add missing <linux/sched.h> include
  powerpc: Add initial Dynamic Execution Control Register (DEXCR)
    support
  powerpc/dexcr: Handle hashchk exception
  powerpc/dexcr: Support userspace ROP protection
  prctl: Define PowerPC DEXCR interface
  powerpc/dexcr: Add prctl implementation
  powerpc/dexcr: Add sysctl entry for SBHE system override
  powerpc/dexcr: Add enforced userspace ROP protection config
  selftests/powerpc: Add more utility macros
  selftests/powerpc: Add hashst/hashchk test
  selftests/powerpc: Add DEXCR prctl, sysctl interface test
  selftests/powerpc: Add DEXCR status utility lsdexcr
  Documentation: Document PowerPC kernel DEXCR interface

 Documentation/powerpc/dexcr.rst               | 183 +++++++++++
 Documentation/powerpc/index.rst               |   1 +
 arch/powerpc/Kconfig                          |   5 +
 arch/powerpc/include/asm/book3s/64/kexec.h    |   6 +
 arch/powerpc/include/asm/book3s/64/kup.h      |   1 +
 arch/powerpc/include/asm/cputable.h           |   8 +-
 arch/powerpc/include/asm/ppc-opcode.h         |   1 +
 arch/powerpc/include/asm/processor.h          |  33 ++
 arch/powerpc/include/asm/reg.h                |   7 +
 arch/powerpc/kernel/Makefile                  |   1 +
 arch/powerpc/kernel/dexcr.c                   | 310 ++++++++++++++++++
 arch/powerpc/kernel/dt_cpu_ftrs.c             |   4 +
 arch/powerpc/kernel/process.c                 |  31 +-
 arch/powerpc/kernel/prom.c                    |   4 +
 arch/powerpc/kernel/traps.c                   |   6 +
 include/uapi/linux/prctl.h                    |  14 +
 kernel/sys.c                                  |  16 +
 tools/testing/selftests/powerpc/Makefile      |   1 +
 .../selftests/powerpc/dexcr/.gitignore        |   3 +
 .../testing/selftests/powerpc/dexcr/Makefile  |  11 +
 tools/testing/selftests/powerpc/dexcr/cap.c   |  72 ++++
 tools/testing/selftests/powerpc/dexcr/cap.h   |  18 +
 tools/testing/selftests/powerpc/dexcr/dexcr.c | 118 +++++++
 tools/testing/selftests/powerpc/dexcr/dexcr.h |  54 +++
 .../selftests/powerpc/dexcr/dexcr_test.c      | 241 ++++++++++++++
 .../selftests/powerpc/dexcr/hashchk_test.c    | 229 +++++++++++++
 .../testing/selftests/powerpc/dexcr/lsdexcr.c | 178 ++++++++++
 tools/testing/selftests/powerpc/include/reg.h |   4 +
 .../testing/selftests/powerpc/include/utils.h |  44 +++
 29 files changed, 1602 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/powerpc/dexcr.rst
 create mode 100644 arch/powerpc/kernel/dexcr.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/.gitignore
 create mode 100644 tools/testing/selftests/powerpc/dexcr/Makefile
 create mode 100644 tools/testing/selftests/powerpc/dexcr/cap.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/cap.h
 create mode 100644 tools/testing/selftests/powerpc/dexcr/dexcr.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/dexcr.h
 create mode 100644 tools/testing/selftests/powerpc/dexcr/dexcr_test.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/hashchk_test.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/lsdexcr.c


base-commit: 9dc58a6040662faaf24c8932861f485670fce7ff
--
2.38.1
