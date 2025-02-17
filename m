Return-Path: <linuxppc-dev+bounces-6266-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16911A381C9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Feb 2025 12:33:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YxLBD6k9Fz30N8;
	Mon, 17 Feb 2025 22:33:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739791988;
	cv=none; b=aMah5RDD9Bc78Iep+egPnJkA9pmrEOYqA4Qhzi7z+zC1zQDfHT3PE88hy3byKSCVJXpS0XXgC7WmzUketkSadkZpIAmBV+M5yxoHcJwhVSvVLBh7WK5N1NMwSNjo0Qm19xEeiFZY/XmHNvYEj+g6lemDy+niPZmkZHN2nM9C7TjlTA5ajZN2Sb4NS+temjQBKe9qTuF84mD5TBWMt48oQRbAa4MpJPcx2T1mPnA42EWUWGh2VF7ZElWIyKeU3owISymbBfUb0V9xJVNDJ06ax42aoh3twngp5MSrEd9udU9ZOtHo3twhPhfyQBjEcI76i05KFIvm5mh2AFYFe1LwZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739791988; c=relaxed/relaxed;
	bh=IWw1qBEFfYIm6QclJ1UrfL1To/oRw0rQiumIkfQduD4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VAQGtUbuHPK2NhCht+D1eW5ol4aJVxsRF+H2kNI3TWfJZLwuM+jPYjwyhypmaHJ4ZEV6Wx/wymN3Qzs2nV0NN3E/77drrZM7j+X7AqYlM0Hxojz483Fv6jv36LHYYE3QN2lJSS/Pw+pJIeeFjyWXoqRlFlPlkgyAo3O1QkUT/a4VTgHY2+ji+STDGFQOArYhOdtzXlF9QbwfVAQNQ8PdLV3UZVRyAV4ulJCpZt9r/kSWXB+zw07X51R+YVpmvT6S2PHR3Kjv8Gl7d5NPps3WYlbM7YTrJSRPzOQE3NuvWz/rGTE+WAZs3keI+kHV8eeW0TeiYYL5xIQTKWcUWydwSQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gsjLuHyJ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gsjLuHyJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YxLBB6KM8z3093
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 22:33:06 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51H9KCAK014827;
	Mon, 17 Feb 2025 11:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=IWw1qBEFfYIm6QclJ1UrfL1To/oRw0rQiumIkfQdu
	D4=; b=gsjLuHyJ4DTXNHcjB8Mg1o+pvLwSRG2zJjjP1JvxmUPrqF/xwJ17p3f1D
	rKCAyLA1HfeHeK1L1yxDqE1+xZ0ozA2h3lUmEMgWb0utnxxqLs4PaAyfqL2+qmUT
	78UmvUEZourmF1OT2Ypvs+ma5od3adqcWmDDtz5xj7GTEn4KBKMIpb9kq8y6wrYc
	KoXg0TTCFADLSeTtl2mILmyGvHJs+ufO8kql1H1+2iL8Z1Jh253onrPE5TTjNW2W
	L8eUzM91ao2xkeY5OL+lIhsQEd8V9L6SQwiWbtgbLPiHwVkLF/9L6ETWB8kUR6VD
	xSeHWiR7L8A6sOB6ZBqy5Yxszwejw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ujutkv08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 11:32:54 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51HBF4LT025482;
	Mon, 17 Feb 2025 11:32:54 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ujutkv06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 11:32:54 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51H92rKt000498;
	Mon, 17 Feb 2025 11:32:53 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44u6rknrus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 11:32:53 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51HBWnmp45416852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Feb 2025 11:32:49 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 723F720043;
	Mon, 17 Feb 2025 11:32:49 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9030C20040;
	Mon, 17 Feb 2025 11:32:48 +0000 (GMT)
Received: from IBM-PW0CRK36.ibm.com (unknown [9.179.18.115])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 17 Feb 2025 11:32:48 +0000 (GMT)
From: Tobias Huschle <huschle@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, sshegde@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: [RFC PATCH v2 0/3] sched/fair: introduce new scheduler group type group_parked
Date: Mon, 17 Feb 2025 12:32:49 +0100
Message-Id: <20250217113252.21796-1-huschle@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jisq5b9NzwsiHEJVlQjp-AErtlLHVOEf
X-Proofpoint-GUID: HMGIeooP4puJgdixk0Z1y-LE4DyO9FLr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_05,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 priorityscore=1501 clxscore=1011 mlxlogscore=999
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502170101
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Changes to v1

parked vs idle
- parked CPUs are now never considered to be idle
- a scheduler group is now considered parked iff there are parked CPUs 
  and there are no idle CPUs, i.e. all non parked CPUs are busy or there
  are only parked CPUs. A scheduler group with parked tasks can be
  considered to not be parked, if it has idle CPUs which can pick up
  the parked tasks.
- idle_cpu_without always returns that the CPU will not be idle if the 
  CPU is parked

active balance, no_hz, queuing
- should_we_balance always returns true if a scheduler groups contains 
  a parked CPU and that CPU has a running task
- stopping the tick on parked CPUs is now prevented in sched_can_stop_tick
  if a task is running
- tasks are being prevented to be queued on parked CPUs in ttwu_queue_cond

cleanup
- removed duplicate checks for parked CPUs

CPU capacity
- added a patch which removes parked cpus and their capacity from 
  scheduler statistics


Original description:

Adding a new scheduler group type which allows to remove all tasks 
from certain CPUs through load balancing can help in scenarios where
such CPUs are currently unfavorable to use, for example in a 
virtualized environment.

Functionally, this works as intended. The question would be, if this
could be considered to be added and would be worth going forward 
with. If so, which areas would need additional attention? 
Some cases are referenced below.

The underlying concept and the approach of adding a new scheduler 
group type were presented in the Sched MC of the 2024 LPC.
A short summary:

Some architectures (e.g. s390) provide virtualization on a firmware
level. This implies, that Linux kernels running on such architectures
run on virtualized CPUs.

Like in other virtualized environments, the CPUs are most likely shared
with other guests on the hardware level. This implies, that Linux
kernels running in such an environment may encounter 'steal time'. In
other words, instead of being able to use all available time on a
physical CPU, some of said available time is 'stolen' by other guests.

This can cause side effects if a guest is interrupted at an unfavorable
point in time or if the guest is waiting for one of its other virtual 
CPUs to perform certain actions while those are suspended in favour of 
another guest.

Architectures, like arch/s390, address this issue by providing an
alternative classification for the CPUs seen by the Linux kernel.

The following example is arch/s390 specific:
In the default mode (horizontal CPU polarization), all CPUs are treated
equally and can be subject to steal time equally. 
In the alternate mode (vertical CPU polarization), the underlying
firmware hypervisor assigns the CPUs, visible to the guest, different
types, depending on how many CPUs the guest is entitled to use. Said
entitlement is configured by assigning weights to all active guests.
The three CPU types are:
    - vertical high   : On these CPUs, the guest has always highest
                        priority over other guests. This means
                        especially that if the guest executes tasks on
                        these CPUs, it will encounter no steal time.
    - vertical medium : These CPUs are meant to cover fractions of
                        entitlement.
    - vertical low    : These CPUs will have no priority when being
                        scheduled. This implies especially, that while
                        all other guests are using their full
                        entitlement, these CPUs might not be ran for a
                        significant amount of time.

As a consequence, using vertical lows while the underlying hypervisor
experiences a high load, driven by all defined guests, is to be avoided.

In order to consequently move tasks off of vertical lows, introduce a
new type of scheduler groups: group_parked.
Parked implies, that processes should be evacuated as fast as possible
from these CPUs. This implies that other CPUs should start pulling tasks
immediately, while the parked CPUs should refuse to pull any tasks
themselves.
Adding a group type beyond group_overloaded achieves the expected
behavior. By making its selection architecture dependent, it has
no effect on architectures which will not make use of that group type.

This approach works very well for many kinds of workloads. Tasks are
getting migrated back and forth in line with changing the parked
state of the involved CPUs.

There are a couple of issues and corner cases which need further
considerations:
- rt & dl:      Realtime and deadline scheduling require some additional 
                attention. 
- ext:          Probably affected as well. Needs some conceptional
                thoughts first.
- raciness:     Right now, there are no synchronization efforts. It needs
                to be considered whether those might be necessary or if
                it is alright that the parked-state of a CPU might change
                during load-balancing. 

Patches apply to tip:sched/core

The s390 patch serves as a simplified implementation example.

Tobias Huschle (3):
  sched/fair: introduce new scheduler group type group_parked
  sched/fair: adapt scheduler group weight and capacity for parked CPUs
  s390/topology: Add initial implementation for selection of parked CPUs

 arch/s390/include/asm/smp.h    |   2 +
 arch/s390/kernel/smp.c         |   5 ++
 include/linux/sched/topology.h |  19 ++++++
 kernel/sched/core.c            |  13 ++++-
 kernel/sched/fair.c            | 104 ++++++++++++++++++++++++++++-----
 kernel/sched/syscalls.c        |   3 +
 6 files changed, 130 insertions(+), 16 deletions(-)

-- 
2.34.1


