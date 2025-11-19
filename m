Return-Path: <linuxppc-dev+bounces-14312-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1D4C6CE36
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 07:22:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBBGJ59BZz2ySq;
	Wed, 19 Nov 2025 17:22:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763533320;
	cv=none; b=mw+wxZ8hA0qd64tns8OTv6mrYkxt7YpVj0H1NB1TGrv7UF0DOUW6fEr5qwE7bhW9mfihtXOcfeXaMgdk/VRrr6Zc6xeXNJ1lsN3QEh8UWhVggRsjKsXNVyW8L7nQIqDa2kxKBPdW3/BtwMkLJtNSg0Bd4t6U0+1jQyd7iSpO5kIAUjPePjiCnWwdafuSk+U7T/5WQh9DoV6K10iF0mATabt4q8MZoVxbPHuJlRmgbbgEOZyfSFZEqlTB4E8zd8CPbRqQlfxU5hC2c2sHkcpTLm8JJDIVQoTFw9HiLurMJS184+qxTZXIR0slAD98UW4MxqW6mDiWnwJDIjS060Cz5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763533320; c=relaxed/relaxed;
	bh=uC9/VEgJqrNfKeKLSwOdGFEZecWWozgo9HO1BCcUEY8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aNWfHcSkMiMt0uF0eb2Rtfdly7o6VNV5yGocha1hm4Bqeh4vsDtrWG6ZMC+L9vEo5YFB05hz7MoonOFLeGneTMNwnfZGETrHYyHCKZWPLZxvuGaRRMtvjiOSXAON9I8YLfRpA/n3oSwwHbNq8rDcI63sawsda9MpbA5sKfjx23wbeAyOsRKMFmbVh5yIlHxh3eVv7TB95/5JStxy/+om8rSrIX1xJiKDwOmah6/wjRzCssEiDps+bkOoT7tEPXoEhcarySaNcHgskZe1S2i0kbbBZH3rOCWZUlIqY+E9JJUy2f9fUFFvIz5QXOgbg2U+ZK6oekS7CfNOQgu4Huxlpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EmZzdsRm; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EmZzdsRm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBBGH4CB8z2xnk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 17:21:58 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIHg5Zk014693;
	Wed, 19 Nov 2025 06:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=uC9/VEgJqrNfKeKLSwOdGFEZecWWozgo9HO1BCcUE
	Y8=; b=EmZzdsRm5sJrQ3jiQfdkJYI1OjA8AAWLtLoySslT57TnpP5Lkor8dOl4w
	wLy0Or9cH8ivigCMwd3YstZM2AipzBbxToyPXgWbYfNSTsJqWslI9sJN7QGtPsR1
	UT+j2WIpjlfbMmfb6kdn5xc4J6z1omhPO3ZqEHFNhcytogZEWLNGF4hzahNtGRv7
	9z6h/79421L8ekFqozDJs5bYnQnsxjmuolVafKcHGiiEDKH5b2BDaFUA3lyTXfET
	xfkUlTwdJC6tGMnBGdEHroY2bmubpVReUbK0gH+VxbVlCNmU076YfA5FGDYzBclt
	WgWDS3fJnelgk/SujmetRYQxdkKoQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk9xtv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:21:36 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJ6LZNf026701;
	Wed, 19 Nov 2025 06:21:35 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk9xtux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:21:35 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ2gKeV030795;
	Wed, 19 Nov 2025 06:21:34 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af47xy8yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:21:34 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJ6LUAC16450014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 06:21:30 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 00B5520043;
	Wed, 19 Nov 2025 06:21:30 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5F7AD20040;
	Wed, 19 Nov 2025 06:21:25 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 06:21:25 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [RFC PATCH v4 00/17] Paravirt CPUs and push task for less vCPU preemption
Date: Wed, 19 Nov 2025 11:50:43 +0530
Message-ID: <20251119062100.1112520-1-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: VYey8elV-47a3hd_RwDnwa9zmUXIBWR9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX7DnlAPAyW1y8
 riOK42vkPxqQlHncLu1H6/e/zuYp94MuftM/q8+ErAxveav7E/A9O74vMh4M/DFJpB1fh3JOgG1
 jbYEFnrJVJCvFBvIJ/qjncdShqt1OX82nkPkZWOLr/cnvxA9UmlBKd1a2yXmNGgJDFICeRphVTP
 sOjY58DbfAK3xl/zvr2y6EdI+yO6OcQeVs6m6y7J15+m2fUo+OKV7PMEkGsabd5u0LnkeKxYpiI
 mHktUE717vA2Zh6lh4uUgnWap3GqVJo+Rv0fJa9zTk3vcjUe81jNd/+4UgNavxwtLEevuukDd5W
 YibqRR1dIaz85xh2mr4LXLvsrr/geE90hH/WhtFhB8e/6ZenKY/sqkThUCrKTSaW+qbAx36FJkV
 /xFibb//KyYkJ33qxJDyKrSVqBea2Q==
X-Proofpoint-ORIG-GUID: lZMj4s8sIgAoU89qtF4BtiDmuNitcRmm
X-Authority-Analysis: v=2.4 cv=XtL3+FF9 c=1 sm=1 tr=0 ts=691d61f0 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=O70rKUZCfzOZp-GHuuIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
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
  helper: disable arch handling if paravirt file being written

 .../ABI/testing/sysfs-devices-system-cpu      |   9 +
 Documentation/scheduler/sched-arch.rst        |  37 +++
 arch/powerpc/include/asm/smp.h                |   1 +
 arch/powerpc/kernel/smp.c                     |   1 +
 arch/powerpc/platforms/pseries/lpar.c         | 223 ++++++++++++++++++
 arch/powerpc/platforms/pseries/pseries.h      |   1 +
 drivers/base/cpu.c                            |  60 ++++-
 include/linux/cpumask.h                       |  20 ++
 include/linux/sched.h                         |   9 +-
 kernel/sched/core.c                           | 106 ++++++++-
 kernel/sched/debug.c                          |   5 +-
 kernel/sched/fair.c                           |  42 +++-
 kernel/sched/rt.c                             |  11 +-
 kernel/sched/sched.h                          |   9 +
 14 files changed, 519 insertions(+), 15 deletions(-)

-- 
2.47.3


