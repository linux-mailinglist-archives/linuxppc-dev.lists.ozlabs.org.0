Return-Path: <linuxppc-dev+bounces-14633-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86829CA6273
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 06:31:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dN0NF5rZZz2xrk;
	Fri, 05 Dec 2025 16:31:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764912669;
	cv=none; b=GzAPgEY73kRtUprn5uJjNshlNFToBnx8HyRe1jSftGA944ZZ6m5LDOuhTIqQxd7hmA6DuxMEl5Ji6XjD+iwcNyK28qDW++OsrVrLSLvBgyu2GmYy3KM0XdrH9oB3bDPLMubcmNHXE192l3bPEtVf6fV+PQykquuZWb+qzzWFE7KFlj8BzS12AqnqNWAlLZi26hQEym2sF0DU73973bot/7FdxKlALY9FA4KX4/ptj0kIQRqAIM0FuFSYorPias/ucL0rItQxesaOFTBXPhDKgfbwE+3jZYPcqXbCMzM6AitPsxZGI3vcd80fM2iy2Uapfn5GRHjBfXaXwIVkpfzhQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764912669; c=relaxed/relaxed;
	bh=IDi1DYc3BmeXqjTazx86TE3x4dLXzaqQAXgtGK3Dx7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HeDy0/WYbCoWB0cYvUONP62ocJ/7DdzirND8YLL1Fuy+k8tWevwLd9FGEOR/+DDszijdY/Hb0od9y2u0JBKBW0VpBNOmdgT16qfy98PIyYMUk+khntMhn/aeiAvkJHXmRak/Ky3q9BHeGM2Y7GAd3oI6bTaYaGiYsccqSPtjcZzTs769FroaDCtmiDpGE9vzlyQ/v7BypVaPHx4dPyK5hL+PPrZNGMfXLU4g6+MoVaTy6OgbEY32bjcdQ+fm/Pv9PnDq4QXNEp7g86bxx70bWdqB4+SVNDXVXwfnD39/z7IGR0r13LG4DmZ9v/aY5A075nhgYmMjMNus+obH4ippTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a1NbSxUF; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a1NbSxUF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dN0N74J7fz2xP8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 16:31:03 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4KS1Uk018231;
	Fri, 5 Dec 2025 05:30:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=IDi1DY
	c3BmeXqjTazx86TE3x4dLXzaqQAXgtGK3Dx7A=; b=a1NbSxUF1JxCOvRgI1Qd/R
	WUYIjd+gl0P2I/k6WgDhfMp7+ScqAdgxyctxceJ5pNO+xVp1OjiyR0juaT0u6jQN
	I9aEZ3UHiIUCX6RWTywGo5LapAVXLETQZHzBoOhZzJXDhds/CEl79Fm6ettDh+RH
	3hniXO8DobdO1VF93njsElbA9udCI2jXQ2YKUGDzGTFFHsvGw9cIx6Lc+uWRQuL0
	zMQQBloj11rJSJsN9HGr2p0n5XgjZtllPONH9znaEa6TonV/4oU4nEbatX7taetG
	8UbmjrXoLzST48wSHFnjYoqR7y5/KelH2idFxwq0pXzWfKQYX4yn4tq0zvE2xDwQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrg5ubxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 05:30:29 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B55Oe5g026186;
	Fri, 5 Dec 2025 05:30:29 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrg5ubxm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 05:30:29 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B537AFn029338;
	Fri, 5 Dec 2025 05:30:28 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ardv1ue30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Dec 2025 05:30:28 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B55UOPh62849440
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Dec 2025 05:30:24 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E34B20040;
	Fri,  5 Dec 2025 05:30:24 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B49F920043;
	Fri,  5 Dec 2025 05:30:19 +0000 (GMT)
Received: from [9.124.223.52] (unknown [9.124.223.52])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  5 Dec 2025 05:30:19 +0000 (GMT)
Message-ID: <8368868e-48aa-4a90-95d1-1be4de9879e8@linux.ibm.com>
Date: Fri, 5 Dec 2025 11:00:18 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/17] Paravirt CPUs and push task for less vCPU
 preemption
To: Ilya Leoshkevich <iii@linux.ibm.com>, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, gregkh@linuxfoundation.org,
        pbonzini@redhat.com, seanjc@google.com, kprateek.nayak@amd.com,
        vschneid@redhat.com, huschle@linux.ibm.com, rostedt@goodmis.org,
        dietmar.eggemann@arm.com, christophe.leroy@csgroup.eu,
        linux-s390@vger.kernel.org
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
 <4ddbb5a1244cf444f330cc73b7d573f47b02f7eb.camel@linux.ibm.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <4ddbb5a1244cf444f330cc73b7d573f47b02f7eb.camel@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3tmHFW3U2xA0oAhESm6nR3A9UPkgS1V-
X-Authority-Analysis: v=2.4 cv=Ir0Tsb/g c=1 sm=1 tr=0 ts=69326df5 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=NEAV23lmAAAA:8 a=tVq6XiAQccX39fkiOKoA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyMCBTYWx0ZWRfX4jodFYBVAJ2T
 fNb4lqkuXEqgHzOABAIcbG6qeBU+JqszMfryOPonBlqT1jrGm4cX8WmGPY9BcYiNu6raAg6xr+c
 YU/3uK/pE9DfKdqpQOsfttWlHPRwiKne1Y2REN3c+Dtqe/tDBDqCD/ZVpMe727Snc71cXxzbnsm
 wGXeZyfkJ4X9S+JswGthUfB71MTNrLoQMyXL7AHw6Wi/SUTxuVZFbkY//6aEwNXts8oDYu1ETw8
 Ey8XgE4p/879VENKa8jGLtc55R/xrbIqBmV2ub+YygGEUUNHvrneqebzCdsXLYB+thsqeJQqsI9
 hE21TaX6DK7wMx629UPGJy2F1j8VRY3I6+q4mWpEKFuEAZhF/1WMjYMYNznFNc6siqvgYfFjzgJ
 ajEha9YQsouBI5clnR2hcyiB3NeP5A==
X-Proofpoint-GUID: WvKRZDUUP65yUwcALCLmBb8P5VcoltYU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_01,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511290020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 12/4/25 6:58 PM, Ilya Leoshkevich wrote:
> On Wed, 2025-11-19 at 18:14 +0530, Shrikanth Hegde wrote:
>> Detailed problem statement and some of the implementation choices
>> were
>> discussed earlier[1].
>>
>> [1]:
>> https://lore.kernel.org/all/20250910174210.1969750-1-sshegde@linux.ibm.com/
>>
>> This is likely the version which would be used for LPC2025 discussion
>> on
>> this topic. Feel free to provide your suggestion and hoping for a
>> solution
>> that works for different architectures and it's use cases.
>>
>> All the existing alternatives such as cpu hotplug, creating isolated
>> partitions etc break the user affinity. Since number of CPUs to use
>> change
>> depending on the steal time, it is not driven by User. Hence it would
>> be
>> wrong to break the affinity. This series allows if the task is pinned
>> only paravirt CPUs, it will continue running there.
>>
>> Changes compared v3[1]:
>>
>> - Introduced computation of steal time in powerpc code.
>> - Derive number of CPUs to use and mark the remaining as paravirt
>> based
>>    on steal values.
>> - Provide debugfs knobs to alter how steal time values being used.
>> - Removed static key check for paravirt CPUs (Yury)
>> - Removed preempt_disable/enable while calling stopper (Prateek)
>> - Made select_idle_sibling and friends aware of paravirt CPUs.
>> - Removed 3 unused schedstat fields and introduced 2 related to
>> paravirt
>>    handling.
>> - Handled nohz_full case by enabling tick on it when there is CFS/RT
>> on
>>    it.
>> - Updated helper patch to override arch behaviour for easier
>> debugging
>>    during development.
>> - Kept
>>
>> Changes compared to v4[2]:
>> - Last two patches were sent out separate instead of being with
>> series.
>>    That created confusion. Those two patches are debug patches one can
>>    make use to check functionality across acrhitectures. Sorry about
>>    that.
>> - Use DEVICE_ATTR_RW instead (greg)
>> - Made it as PATCH since arch specific handling completes the
>>    functionality.
>>
>> [2]:
>> https://lore.kernel.org/all/20251119062100.1112520-1-sshegde@linux.ibm.com/
>>
>> TODO:
>>
>> - Get performance numbers on PowerPC, x86 and S390. Hopefully by next
>>    week. Didn't want to hold the series till then.
>>
>> - The CPUs to mark as paravirt is very simple and doesn't work when
>>    vCPUs aren't spread out uniformly across NUMA nodes. Ideal would be
>> splice
>>    the numbers based on how many CPUs each NUMA node has. It is quite
>>    tricky to do specially since cpumask can be on stack too. Given
>>    NR_CPUS can be 8192 and nr_possible_nodes 32. Haven't got my head
>> into
>>    solving it yet. Maybe there is easier way.
>>
>> - DLPAR Add/Remove needs to call init of EC/VP cores (powerpc
>> specific)
>>
>> - Userspace tools awareness such as irqbalance.
>>
>> - Delve into design of hint from Hyeprvisor(HW Hint). i.e Host
>> informs
>>    guest which/how many CPUs it has to use at this moment. This
>> interface
>>    should work across archs with each arch doing its specific
>> handling.
>>
>> - Determine the default values for steal time related knobs
>>    empirically and document them.
>>
>> - Need to check safety against CPU hotplug specially in
>> process_steal.
>>
>>
>> Applies cleanly on tip/master:
>> commit c2ef745151b21d4dcc4b29a1eabf1096f5ba544b
>>
>>
>> Thanks to srikar for providing the initial code around powerpc steal
>> time handling code. Thanks to all who went through and provided
>> reviews.
>>
>> PS: I haven't found a better name. Please suggest if you have any.
>>
>> Shrikanth Hegde (17):
>>    sched/docs: Document cpu_paravirt_mask and Paravirt CPU concept
>>    cpumask: Introduce cpu_paravirt_mask
>>    sched/core: Dont allow to use CPU marked as paravirt
>>    sched/debug: Remove unused schedstats
>>    sched/fair: Add paravirt movements for proc sched file
>>    sched/fair: Pass current cpu in select_idle_sibling
>>    sched/fair: Don't consider paravirt CPUs for wakeup and load
>> balance
>>    sched/rt: Don't select paravirt CPU for wakeup and push/pull rt
>> task
>>    sched/core: Add support for nohz_full CPUs
>>    sched/core: Push current task from paravirt CPU
>>    sysfs: Add paravirt CPU file
>>    powerpc: method to initialize ec and vp cores
>>    powerpc: enable/disable paravirt CPUs based on steal time
>>    powerpc: process steal values at fixed intervals
>>    powerpc: add debugfs file for controlling handling on steal values
>>    sysfs: Provide write method for paravirt
>>    sysfs: disable arch handling if paravirt file being written
>>
>>   .../ABI/testing/sysfs-devices-system-cpu      |   9 +
>>   Documentation/scheduler/sched-arch.rst        |  37 +++
>>   arch/powerpc/include/asm/smp.h                |   1 +
>>   arch/powerpc/kernel/smp.c                     |   1 +
>>   arch/powerpc/platforms/pseries/lpar.c         | 223
>> ++++++++++++++++++
>>   arch/powerpc/platforms/pseries/pseries.h      |   1 +
>>   drivers/base/cpu.c                            |  59 +++++
>>   include/linux/cpumask.h                       |  20 ++
>>   include/linux/sched.h                         |   9 +-
>>   kernel/sched/core.c                           | 106 ++++++++-
>>   kernel/sched/debug.c                          |   5 +-
>>   kernel/sched/fair.c                           |  42 +++-
>>   kernel/sched/rt.c                             |  11 +-
>>   kernel/sched/sched.h                          |   9 +
>>   14 files changed, 519 insertions(+), 14 deletions(-)
> 
> The capability to temporarily exclude CPUs from scheduling might be
> beneficial for s390x, where users often run Linux using a proprietary
> hypervisor called PR/SM and with high overcommit. In these
> circumstances virtual CPUs may not be scheduled by a hypervisor for a
> very long time.
> 
> Today we have an upstream feature called "Hiperdispatch", which
> determines that this is about to happen and uses Capacity Aware
> Scheduling to prevent processes from being placed on the affected CPUs.
> However, at least when used for this purpose, Capacity Aware Scheduling
> is best effort and fails to move tasks away from the affected CPUs
> under high load.
> 
> Therefore I have decided to smoke test this series.
> 
> For the purposes of smoke testing, I set up a number of KVM virtual
> machines and start the same benchmark inside each one. Then I collect
> and compare the aggregate throughput numbers. I have not done testing
> with PR/SM yet, but I plan to do this and report back. I also have not
> tested this with VMs that are not 100% utilized yet.
> 

Best results would be when it works as HW hint from hypervisor.

> Benchmark parameters:
> 
> $ sysbench cpu run --threads=$(nproc) --time=10
> $ schbench -r 10 --json --no-locking
> $ hackbench --groups 10 --process --loops 5000
> $ pgbench -h $WORKDIR --client=$(nproc) --time=10
> 
> Figures:
> 
> s390x (16 host CPUs):
> 
> Benchmark      #VMs    #CPUs/VM  ΔRPS (%)
> -----------  ------  ----------  ----------
> hackbench        16           4  60.58%
> pgbench          16           4  50.01%
> hackbench         8           8  46.18%
> hackbench         4           8  43.54%
> hackbench         2          16  43.23%
> hackbench        12           4  42.92%
> hackbench         8           4  35.53%
> hackbench         4          16  30.98%
> pgbench          12           4  18.41%
> hackbench         2          24  7.32%
> pgbench           8           4  6.84%
> pgbench           2          24  3.38%
> pgbench           2          16  3.02%
> pgbench           4          16  2.08%
> hackbench         2          32  1.46%
> pgbench           4           8  1.30%
> schbench          2          16  0.72%
> schbench          4           8  -0.09%
> schbench          4           4  -0.20%
> schbench          8           8  -0.41%
> sysbench          8           4  -0.46%
> sysbench          4           8  -0.53%
> schbench          8           4  -0.65%
> sysbench          2          16  -0.76%
> schbench          2           8  -0.77%
> sysbench          8           8  -1.72%
> schbench          2          24  -1.98%
> schbench         12           4  -2.03%
> sysbench         12           4  -2.13%
> pgbench           2          32  -3.15%
> sysbench         16           4  -3.17%
> schbench         16           4  -3.50%
> sysbench          2           8  -4.01%
> pgbench           8           8  -4.10%
> schbench          4          16  -5.93%
> sysbench          4           4  -5.94%
> pgbench           2           4  -6.40%
> hackbench         2           8  -10.04%
> hackbench         4           4  -10.91%
> pgbench           4           4  -11.05%
> sysbench          2          24  -13.07%
> sysbench          4          16  -13.59%
> hackbench         2           4  -13.96%
> pgbench           2           8  -16.16%
> schbench          2           4  -24.14%
> schbench          2          32  -24.25%
> sysbench          2           4  -24.98%
> sysbench          2          32  -32.84%
> 
> x86_64 (32 host CPUs):
> 
> Benchmark      #VMs    #CPUs/VM  ΔRPS (%)
> -----------  ------  ----------  ----------
> hackbench         4          32  87.02%
> hackbench         8          16  48.45%
> hackbench         4          24  47.95%
> hackbench         2           8  42.74%
> hackbench         2          32  34.90%
> pgbench          16           8  27.87%
> pgbench          12           8  25.17%
> hackbench         8           8  24.92%
> hackbench        16           8  22.41%
> hackbench        16           4  20.83%
> pgbench           8          16  20.40%
> hackbench        12           8  20.37%
> hackbench         4          16  20.36%
> pgbench          16           4  16.60%
> pgbench           8           8  14.92%
> hackbench        12           4  14.49%
> pgbench           4          32  9.49%
> pgbench           2          32  7.26%
> hackbench         2          24  6.54%
> pgbench           4           4  4.67%
> pgbench           8           4  3.24%
> pgbench          12           4  2.66%
> hackbench         4           8  2.53%
> pgbench           4           8  1.96%
> hackbench         2          16  1.93%
> schbench          4          32  1.24%
> pgbench           2           8  0.82%
> schbench          4           4  0.69%
> schbench          2          32  0.44%
> schbench          2          16  0.25%
> schbench         12           8  -0.02%
> sysbench          2           4  -0.02%
> schbench          4          24  -0.12%
> sysbench          2          16  -0.17%
> schbench         12           4  -0.18%
> schbench          2           4  -0.19%
> sysbench          4           8  -0.23%
> schbench          8           4  -0.24%
> sysbench          2           8  -0.24%
> schbench          4           8  -0.28%
> sysbench          8           4  -0.30%
> schbench          4          16  -0.37%
> schbench          2          24  -0.39%
> schbench          8          16  -0.49%
> schbench          2           8  -0.67%
> pgbench           4          16  -0.68%
> schbench          8           8  -0.83%
> sysbench          4           4  -0.92%
> schbench         16           4  -0.94%
> sysbench         12           4  -0.98%
> sysbench          8          16  -1.52%
> sysbench         16           4  -1.57%
> pgbench           2           4  -1.62%
> sysbench         12           8  -1.69%
> schbench         16           8  -1.97%
> sysbench          8           8  -2.08%
> hackbench         8           4  -2.11%
> pgbench           4          24  -3.20%
> pgbench           2          24  -3.35%
> sysbench          2          24  -3.81%
> pgbench           2          16  -4.55%
> sysbench          4          16  -5.10%
> sysbench         16           8  -6.56%
> sysbench          2          32  -8.24%
> sysbench          4          32  -13.54%
> sysbench          4          24  -13.62%
> hackbench         2           4  -15.40%
> hackbench         4           4  -17.71%
> 
> There are some huge wins, especially for hackbench, which corresponds
> to Shrikanth's findings. There are some significant degradations too,
> which I plan to debug. This may simply have to do with the simplistic
> heuristic I am using for testing [1].
> 

Thank you very much!! for running these numbers.

> sysbench, for example, is not supposed to benefit from this series,
> because it is not affected by overcommit. However, it definitely should
> not degrade by 30%. Interestingly enough, this happens only with
> certain combinations of VM and CPU counts, and this is reproducible.
> 

is the host baremetal? is those cases cpufreq governer ramp up or down
might play a role. (speculating)

> Initially I have seen degradations as bad as -80% with schbench. It
> turned out this was caused by userspace per-CPU locking it implements;
> turning it off caused the degradation to go away. To me this looks like
> something synthetic and not something used by real-world application,
> but please correct me if I am wrong - then this will have to be
> resolved.
> 

That's nice to hear. I was concerned with schbench rps. Now i am bit relieved.


Is this with schbench -L option?
I ran with it. and regression i was seeing earlier is gone now.

> 
> One note regarding the PARAVIRT Kconfig gating: s390x does not
> select PARAVIRT	today. For example, steal time we determine based on
> CPU timers and clocks, and not hypervisor hints. For now I had to add
> dummy paravirt headers to test this series. But I would appreciate if
> Kconfig gating was removed.
> 

Keeping PARAVIRT checks on is probably right thing. I will wait to see if
anyone objects.

> Others have already commented on the naming, and I would agree that
> "paravirt" is really misleading. I cannot say that the previous "cpu-
> avoid" one was perfect, but it was much better.
> 
> 
> [1] https://github.com/iii-i/linux/commits/iii/poc/cpu-avoid/v3/

Will look into it. one thing to to be careful are CPU numbers.

