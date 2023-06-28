Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 351C4740E76
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 12:15:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yr+6UWCa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QrcsJ0h6Pz3c8Q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jun 2023 20:15:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yr+6UWCa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qrcj74llSz30PW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 20:08:11 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35SA3Yl4004195;
	Wed, 28 Jun 2023 10:08:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=GYATAPJgEf5n8C1QFvq6gF7ANrUUiLJuPhc2JRfH2cw=;
 b=Yr+6UWCaagmvD3OwwiM7fX/JrcvQ9L1W05eLu23CMQe0QPj2u/quVubkR/tCKYZWatD8
 a3Wvi70xGDetry/GG6pcaWllIhCWWykvJa5oTaiuo95AAwPvSBq1N6FaQpWZd7PC7DYQ
 YSs5VFtc4P6Sxeg02rbm7Uxd28hR00KKHzkwSA5wGcQwZVcUFdKtdQHp/v0OV4wJ89FW
 MTFYLz8WvZTzR58n7+K6qSlIhtnaQde2LPbaHsqPS2m5yl9dn39dZiY9gR7Djff2RIP9
 cRQqb+AjtlmjaYTLl23b6p3yhHCD6D4KKBGjXk/tLLiUDfkCGTgw4R7N0DyAfWC9R+Dl Rg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rgjs5r41s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jun 2023 10:07:58 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35SA3m7o005189;
	Wed, 28 Jun 2023 10:07:31 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rgjs5r37b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jun 2023 10:07:31 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35S1J41S010907;
	Wed, 28 Jun 2023 10:06:02 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3rdr451vwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 Jun 2023 10:06:02 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35SA60OV57999714
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 Jun 2023 10:06:00 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 20EDA20065;
	Wed, 28 Jun 2023 10:06:00 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A3C820043;
	Wed, 28 Jun 2023 10:05:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.171.41.43])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 Jun 2023 10:05:59 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/9]  Introduce SMT level and add PowerPC support
Date: Wed, 28 Jun 2023 12:05:49 +0200
Message-ID: <20230628100558.43482-1-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Mh8j18TQO3BlWq7spvNv71k46Geassb1
X-Proofpoint-ORIG-GUID: tCy5u0t9HvF1n92iDQZFkNza9ljJV4Mw
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_06,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 mlxscore=0 impostorscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306280088
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
 kernel/cpu.c                                  | 116 ++++++++++++++----
 15 files changed, 185 insertions(+), 71 deletions(-)
 create mode 100644 include/linux/cpu_smt.h

-- 
2.41.0

