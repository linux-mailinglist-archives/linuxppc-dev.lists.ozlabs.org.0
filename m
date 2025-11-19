Return-Path: <linuxppc-dev+bounces-14347-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1406C6E8AF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 13:45:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBLmf546Cz3c3y;
	Wed, 19 Nov 2025 23:45:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763556322;
	cv=none; b=QT3wqA28RpAFz+Nio281crmENymHNHrOCsr7NsyjfzhKV9SbyfQBbjXH0Ha44nTt+imXEdjumDjJPhQ/oBUaEU1GbKZe3UldklRxOfcpIfjh0e/nt0g7NizKq6VeKvHExAm+kA2ilxLFSYeiS7Dcb063xQGLY5jek9hdx99mhH0MIsTHU6hMlc0yj37amkzHZwdEflTHk1CZaIAHAR/1oQRhApGmgYPrNgzr7bIvzRRqtRdde6EuZrGJK7nSIDPdtmVrzbmG7FkHYiSO5SKV8ZU46QRQwzTuoGYmrL5q08EAsg3I466aUyhLKFnXcpnY31sPfqAo8uzRdPu24Q2cbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763556322; c=relaxed/relaxed;
	bh=447C4OWPFZuQZBvp1MErsafsMFOszcYuYWnd9q0OIeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iEDIbt1lsPNS5bYWo166BNyFy2jxHL4SKJ1E967FSZol1KMx7wYf7buIb1KeTMKSag1oxSgITIpp0dfNh38s4CNMQCmpesmpI4jI7ZPEmx8u0pdmh6h5U+Y1DMVEFoR0vh7HMhMVpgA5ypPE/kS02sfysX9Qez+HfJyRV4KpEYJmtvYrVuMAMeIN7DvsiplyjQgaMillOPQHBtIY2lhHYqCol9Tbsh82UJypzPgzTZA7p6spbTJ81dsdiMew/YQeOaMmRBdlZEsyOBs3Ij3BqfodL5zmcONzgtaYnpBz82lGJqE6skfTId3Q9NDjWh4a5U5JxXJQHOgK0UadscNn9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eHijn7h+; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eHijn7h+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBLmd2DNSz3br7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 23:45:20 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ8G6RO013243;
	Wed, 19 Nov 2025 12:45:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=447C4OWPFZuQZBvp1MErsafsMFOszcYuYWnd9q0OI
	eE=; b=eHijn7h+aFPjeaxJTcCZP+Lp1Tl0W6ULOFhsq4G0xXFrzqa249rzriFF1
	I5DgXBZiCWsCaJW0gwwlrJVy+gWBatWdoQq+HAI9ZLCTNVWRpsZ4QxdCc6GDfpSN
	EHB4IcjAA9cRND9ObJgy4ewEgWFAOreV9P/Do2FmgXHYxUtTli4w77V3NsNVUx3B
	EGROSjMRkufqRzd+Dr0rp4Ie1Xtk9ue+B5ADx9B3GxWT32ZxAyCkRd1MJDvCbMIE
	GQ0/P/OsCnRz9yrDEz7ZWJ2FwLaEatHPmPnVuKevn/qE3/pH+PBOqcegMvkyIW+k
	K94NzjDxQ4BMTpFd2BRVPPrv1I1tg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejmsqnr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:04 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJCf24i021223;
	Wed, 19 Nov 2025 12:45:03 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejmsqnr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:03 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJB3AtM030851;
	Wed, 19 Nov 2025 12:45:02 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af47y0rjs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:02 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJCiwQ326608014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 12:44:58 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C1CEC20043;
	Wed, 19 Nov 2025 12:44:58 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 98B3520040;
	Wed, 19 Nov 2025 12:44:54 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 12:44:54 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 00/17] Paravirt CPUs and push task for less vCPU preemption
Date: Wed, 19 Nov 2025 18:14:32 +0530
Message-ID: <20251119124449.1149616-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5T2v_TEM0ibPySnbDD_LuxdLlRf3LgUu
X-Authority-Analysis: v=2.4 cv=Rv3I7SmK c=1 sm=1 tr=0 ts=691dbbd0 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=O70rKUZCfzOZp-GHuuIA:9
X-Proofpoint-GUID: iwX3yGec8v55SvmPtt59APZm6gLydrD2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX+d1XWAwFNEEZ
 +Mr1y8jEFLCHuMhQ5jw2pGRWISaTdSC+2w5koKAIN9No0OsnDjE/sOPKN9RJtnZ05N3UFTeFzN7
 a93hbracHjhkUWxMmMs80Mapx6fVT40iqfRudFeL+lyswDwmZglhMXo/TEvyDI/4twGIQgjSGJm
 SVbvg+3iAzh6Pfoa5xD3Jb62Jv1TC5Z7CVGPYAKZBjOsmzymEzKmAXHcYLT2UMZwr+bJ+25OC92
 r6CVITpRJSVpO4WFiSHu7JRr+3c3BjJs0kj/fUy3gQ9HQb76jjkuGxqjvGnYnl0YEf0mqGohF7G
 kL3XEH56YGXgKJ6d2NOOpZ75nrhj0zgOwPa4RLwEq6vR1jHh/PdKusRt/sm6mkXNbF7FG1xsJXL
 4zPnr7FvhGeEKIFg9On6LMBPoNPVOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Detailed problem statement and some of the implementation choices were 
discussed earlier[1].

[1]: https://lore.kernel.org/all/20250910174210.1969750-1-sshegde@linux.ibm.com/

This is likely the version which would be used for LPC2025 discussion on
this topic. Feel free to provide your suggestion and hoping for a solution
that works for different architectures and it's use cases.

All the existing alternatives such as cpu hotplug, creating isolated
partitions etc break the user affinity. Since number of CPUs to use change
depending on the steal time, it is not driven by User. Hence it would be
wrong to break the affinity. This series allows if the task is pinned
only paravirt CPUs, it will continue running there.

Changes compared v3[1]:

- Introduced computation of steal time in powerpc code.
- Derive number of CPUs to use and mark the remaining as paravirt based
  on steal values. 
- Provide debugfs knobs to alter how steal time values being used.
- Removed static key check for paravirt CPUs (Yury)
- Removed preempt_disable/enable while calling stopper (Prateek)
- Made select_idle_sibling and friends aware of paravirt CPUs.
- Removed 3 unused schedstat fields and introduced 2 related to paravirt
  handling.
- Handled nohz_full case by enabling tick on it when there is CFS/RT on
  it.
- Updated helper patch to override arch behaviour for easier debugging
  during development.
- Kept 

Changes compared to v4[2]:
- Last two patches were sent out separate instead of being with series.
  That created confusion. Those two patches are debug patches one can
  make use to check functionality across acrhitectures. Sorry about
  that.
- Use DEVICE_ATTR_RW instead (greg)
- Made it as PATCH since arch specific handling completes the
  functionality.

[2]: https://lore.kernel.org/all/20251119062100.1112520-1-sshegde@linux.ibm.com/

TODO: 

- Get performance numbers on PowerPC, x86 and S390. Hopefully by next
  week. Didn't want to hold the series till then.

- The CPUs to mark as paravirt is very simple and doesn't work when
  vCPUs aren't spread out uniformly across NUMA nodes. Ideal would be splice
  the numbers based on how many CPUs each NUMA node has. It is quite
  tricky to do specially since cpumask can be on stack too. Given
  NR_CPUS can be 8192 and nr_possible_nodes 32. Haven't got my head into
  solving it yet. Maybe there is easier way.

- DLPAR Add/Remove needs to call init of EC/VP cores (powerpc specific)

- Userspace tools awareness such as irqbalance. 

- Delve into design of hint from Hyeprvisor(HW Hint). i.e Host informs
  guest which/how many CPUs it has to use at this moment. This interface
  should work across archs with each arch doing its specific handling.

- Determine the default values for steal time related knobs
  empirically and document them.

- Need to check safety against CPU hotplug specially in process_steal.


Applies cleanly on tip/master:
commit c2ef745151b21d4dcc4b29a1eabf1096f5ba544b


Thanks to srikar for providing the initial code around powerpc steal
time handling code. Thanks to all who went through and provided reviews.

PS: I haven't found a better name. Please suggest if you have any.

Shrikanth Hegde (17):
  sched/docs: Document cpu_paravirt_mask and Paravirt CPU concept
  cpumask: Introduce cpu_paravirt_mask
  sched/core: Dont allow to use CPU marked as paravirt
  sched/debug: Remove unused schedstats
  sched/fair: Add paravirt movements for proc sched file
  sched/fair: Pass current cpu in select_idle_sibling
  sched/fair: Don't consider paravirt CPUs for wakeup and load balance
  sched/rt: Don't select paravirt CPU for wakeup and push/pull rt task
  sched/core: Add support for nohz_full CPUs
  sched/core: Push current task from paravirt CPU
  sysfs: Add paravirt CPU file
  powerpc: method to initialize ec and vp cores
  powerpc: enable/disable paravirt CPUs based on steal time
  powerpc: process steal values at fixed intervals
  powerpc: add debugfs file for controlling handling on steal values
  sysfs: Provide write method for paravirt
  sysfs: disable arch handling if paravirt file being written

 .../ABI/testing/sysfs-devices-system-cpu      |   9 +
 Documentation/scheduler/sched-arch.rst        |  37 +++
 arch/powerpc/include/asm/smp.h                |   1 +
 arch/powerpc/kernel/smp.c                     |   1 +
 arch/powerpc/platforms/pseries/lpar.c         | 223 ++++++++++++++++++
 arch/powerpc/platforms/pseries/pseries.h      |   1 +
 drivers/base/cpu.c                            |  59 +++++
 include/linux/cpumask.h                       |  20 ++
 include/linux/sched.h                         |   9 +-
 kernel/sched/core.c                           | 106 ++++++++-
 kernel/sched/debug.c                          |   5 +-
 kernel/sched/fair.c                           |  42 +++-
 kernel/sched/rt.c                             |  11 +-
 kernel/sched/sched.h                          |   9 +
 14 files changed, 519 insertions(+), 14 deletions(-)

-- 
2.47.3


