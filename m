Return-Path: <linuxppc-dev+bounces-3787-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E63479E38A9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 12:22:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3FVf0YrZz30WY;
	Wed,  4 Dec 2024 22:22:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733311353;
	cv=none; b=JQd45evXdS8wEHWcASoUPX8C2bibEB0GeMryGWwu4UydYeKID/VMsvaeDyBwH81LnpM7iOSILLpmBw0fDg9seUP28puSsPgIeucJUib0/RS6tGo27BNIx0aUq2t8BES++W7qosIquZyyHtPqOZ3Ntm8e1JkmQs+MSvbUwzR6gM/mK9+lGM1vBI1Qzwjdbmn2kVWMPXud5eexMeu+GAZm9wrKrj3TJaQtgJf+oifGLEH3ybrq5aUTAXJY51H1+1eOUgbLzG0hdW1MGoyoex8j/0gTHeWgmxYWECXt2CKw312D0SIAksGcGzRFgACjtHXOrhjb7fzIv7eINb7vyEJB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733311353; c=relaxed/relaxed;
	bh=GxVgtAf8P4SUMfimwoMw6gyNiS7g+I6hF1pNORe1k94=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AEn+yj9t/Oow5IlBlA9HfYAx2sib3+8+GVFLOjC9LIfRONGREQdewmd2rbvC3at/Wptz3EwsnX8lTCoUJmq4/pnXKlrzIYJ829caN+Lu8ORJlj409WAPCNXuNtob+Jw6c01bOA0qgrHG0JKkEv5vcSuBNvzM2jz68Fa+SpB1i6aCXIMaUttW+3VlVMJZOIfC1qRVO6FqIWgaiwCbxnbCclIaxAvb6CxMscCC0eKwX/uG/AMRXNACPmJukYqOCAY3dnsfbujl6iU3QHq4CyVEjsGgiDkShwltlFxvsPahsr7lrIgeEqfV+06pCLi/ugRvL/tOdKuQlweYTGFp0VqiCw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bWzMLmK6; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bWzMLmK6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=huschle@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3FVc411gz30WT
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Dec 2024 22:22:32 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B49MwxA014510;
	Wed, 4 Dec 2024 11:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=GxVgtAf8P4SUMfimwoMw6gyNiS7g+I6hF1pNORe1k
	94=; b=bWzMLmK6vs09Tuitg27Katu2V6KjG+Nx/X8Foq912FmIe6IALNf05ZYfd
	X0Fb0HM5GEeoKlkJEyQAcPp1Bu0tiDH1kZ1YMtAnsG3nGsefSdMVkwXzNf3uLtF9
	tY1ifzaaZJr6kz3hnMkkPEc/Kvw50iQUnKcVKzecWkIUI3JnG0GP362d9gcNX2jX
	JgmLvEbg+O2nBnd+bpYwBAYxwubaCJCXGrafGW+u2zW3ByX3xNbM9IsUlyWOKCod
	zIperZZrd1oT+GXM/J+Kkh0KWF3ikU/UJeNFYIo4IXTmQXWbiwuyUgGXuwwGomiI
	kFy+6ap9NkbpF/EiJzxhk+8erc39g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 437tbxq27w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 11:21:56 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B4BF5vC031019;
	Wed, 4 Dec 2024 11:21:55 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 437tbxq27s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 11:21:55 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4B1xuk031778;
	Wed, 4 Dec 2024 11:21:54 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 438ehm0j0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 11:21:54 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B4BLpWh48234856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Dec 2024 11:21:51 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 290F920043;
	Wed,  4 Dec 2024 11:21:51 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A84D20040;
	Wed,  4 Dec 2024 11:21:50 +0000 (GMT)
Received: from IBM-PW0CRK36.ibm.com (unknown [9.171.34.7])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  4 Dec 2024 11:21:50 +0000 (GMT)
From: Tobias Huschle <huschle@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, linux-s390@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, sshegde@linux.ibm.com
Subject: [RFC PATCH 0/2] sched/fair: introduce new scheduler group type group_parked
Date: Wed,  4 Dec 2024 12:21:47 +0100
Message-Id: <20241204112149.25872-1-huschle@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: LuHQQqjJCkWme8YbWMlpHYJZ0yP3ZBEy
X-Proofpoint-GUID: XLRTwxkGZFuGw3gP5EDeUtRaL_gio7WX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 mlxscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501 bulkscore=0
 phishscore=0 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040086
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

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
- no_hz:        While the scheduler tick can and should still be disabled
                on idle CPUs, it should not be disabled on parked CPUs
                which run only one task, as that task will not be
                scheduled away in time. Side effects and completeness
                need to be further investigated. One option might be to
                allow dynamic changes to tick_nohz_full_mask. It is also
                possible to handle this in exclusively fair.c, but that 
                seems not to be the best environment to do so.
- pinned tasks: If a task is pinned to CPUs which are all parked, it will
                get moved to other CPUs. Like during CPU hotplug, the 
                information about the tasks initial CPU mask gets lost.
- rt & dl:      Realtime and deadline scheduling require some additional 
                attention. 
- ext:          Probably affected as well. Needs some conceptional
                thoughts first.
- idle vs parked: It could be considered whether an idle parked CPU
                would contribute to the count of idle CPUs. It is
                usually preferable to utilize idle CPUs, but parked CPUs
                should not be used. So a scheduler group with many idle, 
                but parked, CPUs, should not be the target for additional 
                workload. At this point, some more thought needs to be 
                spent to evaluate if it would be ok to not set the idle 
                flag on parked CPUs.
- optimization: It is probably possible to cut some corners. In order to
                avoid tampering with scheduler statistics too much, the
                actions based on the parkedness on the CPU are not always
                taken on the earliest possible occasion yet.
- raciness:     Right now, there are no synchronization efforts. It needs
                to be considered whether those might be necessary or if
                it is alright that the parked-state of a CPU might change
                during load-balancing. 

Patches apply to tip:sched/core

The s390 patch serves as a simplified implementation example.

Tobias Huschle (2):
  sched/fair: introduce new scheduler group type group_parked
  s390/topology: Add initial implementation for selection of parked CPUs

 arch/s390/include/asm/topology.h |   3 +
 arch/s390/kernel/topology.c      |   5 ++
 include/linux/sched/topology.h   |  20 +++++
 kernel/sched/core.c              |  10 ++-
 kernel/sched/fair.c              | 122 +++++++++++++++++++++++++------
 5 files changed, 135 insertions(+), 25 deletions(-)

-- 
2.34.1


