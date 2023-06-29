Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3227374287D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 16:33:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HC79Xd3r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QsLY90g98z3c4D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 00:33:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HC79Xd3r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QsLWM5XR3z2xq5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 00:32:15 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35TEMAqF030331;
	Thu, 29 Jun 2023 14:31:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=PgkKmvKoXWdV8E7x/QtCAbTgetf5V95w91yWR0QNxXU=;
 b=HC79Xd3rZ8F47qC6eNtnNILy1yBN6ApgcH1YmEimwMbh5hXNHYMr0tj8Z3Dg1ASvl/X0
 Yo9BYyvzAb50msju06cQ4mJnA64HnbqWniCOuKvSMBTdwLIJzSbB2ulgxVjFRnfv0JCH
 N1W2m2/T+99XB08jpSIvcNFMccSfTGh5bKgntLWRnwOgquoPULO8WYoHDmqicO5NycA+
 OKF/4U+SsNMJ9VZHfiibmWY7I1+K1tAcrLsDzvap+EQRfjkbKrgYGWkpae6edfQLrBsP
 H3JPl92u1PlvJWovoXEW+70LBjT8sjgIp4cs4Pgi2mpKU9MJXZL3yK8WhaX/x2pI3exz Yw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rhbnf08be-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2023 14:31:57 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35TENke0004150;
	Thu, 29 Jun 2023 14:31:56 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rhbnf089y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2023 14:31:56 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35T4RLxX032704;
	Thu, 29 Jun 2023 14:31:54 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3rdr453d7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Jun 2023 14:31:53 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35TEVpP422741684
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 29 Jun 2023 14:31:51 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F98620043;
	Thu, 29 Jun 2023 14:31:51 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1041A20040;
	Thu, 29 Jun 2023 14:31:51 +0000 (GMT)
Received: from pomme.tlslab.ibm.com (unknown [9.101.4.33])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 29 Jun 2023 14:31:50 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/9] Introduce SMT level and add PowerPC support
Date: Thu, 29 Jun 2023 16:31:40 +0200
Message-ID: <20230629143149.79073-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KnQKqTYL1ux1N6LbZbIv59sbgWflxRND
X-Proofpoint-ORIG-GUID: I0FfXe544_ewxmg6_4UIwmxfARBnRcst
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-29_03,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306290131
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
Cc: linux-arch@vger.kernel.org, dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, mingo@redhat.com, bp@alien8.de, npiggin@gmail.com, tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I'm taking over the series Michael sent previously [1] which is smartly
reviewing the initial series I sent [2].  This series is addressing the
comments sent by Thomas and me on the Michael's one.

Here is a short introduction to the issue this series is addressing:

When a new CPU is added, the kernel is activating all its threads. This
leads to weird, but functional, result when adding CPU on a SMT 4 system
for instance.

Here the newly added CPU 1 has 8 threads while the other one has 4 threads
active (system has been booted with the 'smt-enabled=4' kernel option):

ltcden3-lp12:~ # ppc64_cpu --info
Core   0:    0*    1*    2*    3*    4     5     6     7
Core   1:    8*    9*   10*   11*   12*   13*   14*   15*

This mixed SMT level may confused end users and/or some applications.

There is no SMT level recorded in the kernel (common code), neither in user
space, as far as I know. Such a level is helpful when adding new CPU or
when optimizing the energy efficiency (when reactivating CPUs).

When SMP and HOTPLUG_SMT are defined, this series is adding a new SMT level
(cpu_smt_num_threads) and few callbacks allowing the architecture code to
fine control this value, setting a max and a "at boot" level, and
controling whether a thread should be onlined or not.

v3:
  Fix a build error in the patch 6/9
v2:
  As Thomas suggested,
    Reword some commit's description
    Remove topology_smt_supported()
    Remove topology_smt_threads_supported()
    Introduce CONFIG_SMT_NUM_THREADS_DYNAMIC
    Remove switch() in __store_smt_control()
  Update kernel-parameters.txt

[1] https://lore.kernel.org/linuxppc-dev/20230524155630.794584-1-mpe@ellerman.id.au/
[2] https://lore.kernel.org/linuxppc-dev/20230331153905.31698-1-ldufour@linux.ibm.com/

Laurent Dufour (1):
  cpu/SMT: Remove topology_smt_supported()

Michael Ellerman (8):
  cpu/SMT: Move SMT prototypes into cpu_smt.h
  cpu/SMT: Move smt/control simple exit cases earlier
  cpu/SMT: Store the current/max number of threads
  cpu/SMT: Create topology_smt_thread_allowed()
  cpu/SMT: Allow enabling partial SMT states via sysfs
  powerpc/pseries: Initialise CPU hotplug callbacks earlier
  powerpc: Add HOTPLUG_SMT support
  powerpc/pseries: Honour current SMT state when DLPAR onlining CPUs

 .../ABI/testing/sysfs-devices-system-cpu      |   1 +
 .../admin-guide/kernel-parameters.txt         |   4 +-
 arch/Kconfig                                  |   3 +
 arch/powerpc/Kconfig                          |   2 +
 arch/powerpc/include/asm/topology.h           |  15 +++
 arch/powerpc/kernel/smp.c                     |   8 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c  |  30 +++--
 arch/powerpc/platforms/pseries/pseries.h      |   2 +
 arch/powerpc/platforms/pseries/setup.c        |   2 +
 arch/x86/include/asm/topology.h               |   4 +-
 arch/x86/kernel/cpu/bugs.c                    |   3 +-
 arch/x86/kernel/smpboot.c                     |   8 --
 include/linux/cpu.h                           |  25 +---
 include/linux/cpu_smt.h                       |  33 +++++
 kernel/cpu.c                                  | 118 ++++++++++++++----
 15 files changed, 187 insertions(+), 71 deletions(-)
 create mode 100644 include/linux/cpu_smt.h

-- 
2.41.0

