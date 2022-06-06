Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9186653EF12
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 22:01:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LH49p3jL3z3bk6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 06:01:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JOBaYIR4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JOBaYIR4;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LH4954nYvz2yn3
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jun 2022 06:00:24 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 256JTG2Z007427;
	Mon, 6 Jun 2022 20:00:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=fXuykce64vZlAH9rivZ/1ZhrX5e9mctMF0eKqPMr4c8=;
 b=JOBaYIR4v+UriCinwnJVhpv+NHj8b+pbQ9/XKSqo1zaF80LU8Sei4gMdRBJEwxV1P50h
 +nx3veULXfThfv7+y5pSCZ2bWNl4BfB1t7UsIz4MaeakVM8jr82uRI4AA/E/3vyCPBZT
 qrZwwEKdTKNIf0qrycHUhnQZI86JVsgJg6Z/Avh8PnxT28UhoNL0CwYI6WdY+4YRGKpj
 JGozGTss4Tl9bVyxi+xdW0wJ6zKUmg5NG3VZlDLXOjAC/uO7kJmVpTlY1Zlg4OE8jEeu
 OLxvl38RKQbg83SrUUdburxvy0aDQ8I0c4H683y20DbXoTPJC/8pQqm/2coBDeiIATKo ow== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ghqsjgfhv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jun 2022 20:00:17 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 256JnXUr014489;
	Mon, 6 Jun 2022 20:00:16 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ghqsjgfhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jun 2022 20:00:16 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 256JZIT8020556;
	Mon, 6 Jun 2022 20:00:16 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
	by ppma02dal.us.ibm.com with ESMTP id 3gfy1abhe9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jun 2022 20:00:16 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 256K0FCD34930984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jun 2022 20:00:15 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56DBB112062;
	Mon,  6 Jun 2022 20:00:15 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18A06112063;
	Mon,  6 Jun 2022 20:00:15 +0000 (GMT)
Received: from localhost (unknown [9.211.52.224])
	by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
	Mon,  6 Jun 2022 20:00:14 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH 0/2] Disabling NMI watchdog during LPM's memory transfer
In-Reply-To: <666cedea-2dbc-254e-467b-c02a3a2d8795@linux.ibm.com>
References: <20220601155315.35109-1-ldufour@linux.ibm.com>
 <87a6av0wxk.fsf@linux.ibm.com>
 <666cedea-2dbc-254e-467b-c02a3a2d8795@linux.ibm.com>
Date: Mon, 06 Jun 2022 15:00:14 -0500
Message-ID: <874k0x1s1d.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9IDLFr5SyVgxc0RzNaHPUDmncQtpI5jI
X-Proofpoint-ORIG-GUID: EmlhjjKCEEcdrMs65C76h5sxpgN6s-ub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-06_06,2022-06-03_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 adultscore=0 mlxscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206060079
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
Cc: linuxppc-dev@lists.ozlabs.org, haren@linux.vnet.ibm.com, paulus@samba.org, linux-kernel@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:
> On 02/06/2022, 19:58:31, Nathan Lynch wrote:
>> Laurent Dufour <ldufour@linux.ibm.com> writes:
>>> When a partition is transferred, once it arrives at the destination node,
>>> the partition is active but much of its memory must be transferred from the
>>> start node.
>>>
>>> It depends on the activity in the partition, but the more CPU the partition
>>> has, the more memory to be transferred is likely to be. This causes latency
>>> when accessing pages that need to be transferred, and often, for large
>>> partitions, it triggers the NMI watchdog.
>> 
>> It also triggers warnings from other watchdogs and subsystems that
>> have soft latency requirements  - softlockup, RCU, workqueue. The issue
>> is more general than the NMI watchdog.
>
> I agree, but, as you can read in the title, this series is focusing on the
> NMI watchdog which may have some dangerous side effects.

Sure, I read the subject line. I'm saying that focus may be too narrow.

>
>>> The NMI watchdog causes the CPU stack to dump where it appears to be
>>> stuck. In this case, it does not bring much information since it can happen
>>> during any memory access of the kernel.
>> 
>> When the site of a watchdog backtrace shows a thread stuck on a routine
>> memory access as opposed to something like a lock acquisition, that is
>> actually useful information that shouldn't be discarded. It tells us the
>> platform is failing to adequately virtualize partition memory. This
>> isn't a benign situation and it's likely to unacceptably affect real
>> workloads. The kernel is ideally situated to detect and warn about this.
>> 
>
> I agree, but the information provided are most of the time misleading,
> pointing to various part in the kernel where the last page fault of a
> series generated by the kernel happened. There is no real added value,
> since this is well known that the memory transfer is introducing latency
> that is detected by the kernel.

Hmm, I don't understand why it would be considered misleading when the
stack trace shows where the thread has been stuck. And this behavior of
the platform, where resolving post-resume memory accesses takes multiple
seconds under certain conditions has not been well-understood by us
until recently.

> Furthermore, soft lockups are still
> triggered and report as well this latency without any side effect.

It's fair to say that the softlockup watchdog does not panic in the
configurations that our internal test environments happen to use. But
real users can (and do) enable these:

/proc/sys/kernel/hardlockup_panic
/proc/sys/kernel/hung_task_panic
/proc/sys/kernel/panic_on_rcu_stall
/proc/sys/kernel/softlockup_panic

And if so, they likely expect that the OS will simply panic and reboot
when a condition arises that causes memory access times to exceed the
corresponding timeout or threshold. Even during a partition migration.


>>> In addition, the NMI interrupt mechanism is not secure and can generate a
>>> dump system in the event that the interruption is taken while
>>> MSR[RI]=0.
>> 
>> This sounds like a general problem with that facility that isn't
>> specific to partition migration? Maybe it should be disabled altogether
>> until that can be fixed?
>
> We already discuss that with Nick and it sounds that it is not so easy to
> fix that. Furthermore, the NMI watchdog is considered as last option for
> analyzing a potential dying system. So taking the risk of generating a
> crash because of the NMI interrupt looks acceptable. But disabling it
> totally because of that is not the right option.

OK.

> In the LPM's case, the system is dependent on the LPM's latency, it is not
> really dying or in a really bad shape, so that risk is too expansive.

I would say the partition OS is actually in very bad shape if memory
accesses are taking dozens of seconds or more. Any real workload is
likely to be affected to an unacceptable degree. It depends on the
situation, but some users may prefer a panic+reboot to waiting for the
situation to resolve. And this change would effectively prevent the
kernel from carrying out that policy.

> Fixing the latency at the source is definitively the best option, and the
> PHYP team is already investigating that. But, in the meantime, there is a
> way to prevent the system to die because of that side effect by disabling
> the NMI watchdog during the memory transfer.
>
>> 
>>> Given how often hard lockups are detected when transferring large
>>> partitions, it seems best to disable the watchdog NMI until the memory
>>> transfer from the start node is complete.
>> 
>> At this time, I'm far from convinced. Disabling the watchdog is going to
>> make the underlying problems in the platform and/or network harder to
>> understand.
>
> I was also reluctant, and would like the NMI watchdog to remain active
> during LPM. But there is currently no other way to work around the LPM's
> latency, and its potential risk of system crash.
>
> I've spent a lot of time analyzing many crashes happening during LPM and
> all of them are now pointing to the NMI watchdog issue. Furthermore, on a
> system with thousands of CPUs, I saw a system crash because a CPU was not
> able to respond in time (1s) to the NMI interrupt and thus generate
> the panic.
>
> In addition, we now know that a RTAS call, made right after the system is
> running again on the arrival side, is taking ages and is most of the time
> triggering the NMI watchdog.

That's good to know.

> There are  ongoing investigations to clarify where and how this latency is
> happening. I'm not excluding any other issue in the Linux kernel, but right
> now, this looks to be the best option to prevent system crash during
> LPM.

It will prevent the likely crash mode for enterprise distros with
default watchdog tunables that our internal test environments happen to
use. But if someone were to run the same scenario with softlockup_panic
enabled, or with the RCU stall timeout lower than the watchdog
threshold, the failure mode would be different.

Basically I'm saying:
* Some users may actually want the OS to panic when it's in this state,
  because their applications can't work correctly.
* But if we're going to inhibit one watchdog, we should inhibit them
  all.

I wonder if we should freeze processes across the suspend, thawing them
on the destination only after the device tree update is complete,
perhaps even waiting until the VASI state transitions to "Completed".
Suspending the workload for some time after resume would reduce the
number of demand faults that have to be serviced. If that provides
better overall behavior then we could avoid disabling watchdogs.
