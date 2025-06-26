Return-Path: <linuxppc-dev+bounces-9818-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8C3AEA0A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 16:33:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSh4r3H0Mz30Pg;
	Fri, 27 Jun 2025 00:33:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750948412;
	cv=none; b=GfSRhljVg6jTlMwOpY/EAMzXAqpAhf0BN+WhNrT5GpE/L+IP/DFXxYSDfxEc+5TjTMvrpclVuWC2PH4U5Ay2kgxCCcHpWdAk+PEYxnJlaAqvr7n4iqiHqZlWy0yCPieO35uyD5c3r75yE02lo1/qZ9QvBhSPqHOSzVqqoJwKHQcB3Z7BAv2qBNvByNb6eF/rTZ/q9Ky3mnDpvmE6As3Krq06GF5/Vg2E1mtg11OZSMTp5z6wk+TGusQysauQgTYP7wg5vgB7smwtX3LtA275NVCmHvzRtmCUS1t7Yjg0UmifYrpkPT6Z6q9E6FyX1naWIUmJNMie+NxWAbmDz2dz7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750948412; c=relaxed/relaxed;
	bh=gl7lOn997NWw20ZLbk9RgTdcxAX+Ipfh+MLsmOI9QKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BgoMyhxosZm5VgxBDdxWE6rtKZihYl0xyiflOVC/Yi4mwWgTOwBS1sPMLkgQkTTJod2UUOLNMEEdYu+iSbIvAlyFX7YXTb0RJz+k2frcWm7KTD+RAPnmV899Kq2W6v65k4UdDOb7uoYGVpZYdG7LIqVOffa0BQ+e9aMToQ3waOR2ZAYGdZe6ctawOtR7IF7K+u7M6MGGkvwze0x8aZFlBtnBsNEkpXu8yN9Ag/yBy6ZJN8L5EFeQmfKvk23rLBeURzXz2yvZs8OfdCLCoUufF88vy9QwvQDwKBfZdwQNVOUgj4NsLZmdrglZusypRLsFF2yjPxQ41jJi7e+6r0fUiQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=REF5nKXu; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=REF5nKXu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSh4p5mylz30PF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 00:33:30 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QCpoJU015795;
	Thu, 26 Jun 2025 14:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=gl7lOn
	997NWw20ZLbk9RgTdcxAX+Ipfh+MLsmOI9QKs=; b=REF5nKXuX/qsrM1Dmh3laH
	IIIW8xMonU2Uo3TzHOSpwveuDvpzAVCHSd9VJoQgcq8BFexrdYUBrMRgDampBAwn
	V81jGXdT/UatFCCLMe0Ojt01ciLHYfy7fiTTWACnyu1GQH/N9WFihLx0nsWM9tZ0
	uYOs5SbB2j4Z8wjRM9/eh7WshZIDyoaGIvpE1LC8zqGCkhkvebY3zfxh/3DZ57Vn
	19uyKIj6mV/mivzYkHziF9Lw/x1uLu3HFLgIbT5BiNWH9TjF2kMUrTcsJqMvBmWZ
	G4q+ZNHle8wpImS54SBgos1v2DwtLex03EyxyZ+AborE74Y2jPty7KwacoUMdnuw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8jq9ck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 14:33:14 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55QE7mjK028180;
	Thu, 26 Jun 2025 14:33:14 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8jq9ce-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 14:33:13 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55QCScU1030552;
	Thu, 26 Jun 2025 14:33:12 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e7f07g1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jun 2025 14:33:12 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55QEX8nK59048412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jun 2025 14:33:08 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6245220043;
	Thu, 26 Jun 2025 14:33:08 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2456720040;
	Thu, 26 Jun 2025 14:33:05 +0000 (GMT)
Received: from [9.39.23.153] (unknown [9.39.23.153])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 26 Jun 2025 14:33:04 +0000 (GMT)
Message-ID: <b941d8f2-9df1-4b1a-9519-6076cd36ce9d@linux.ibm.com>
Date: Thu, 26 Jun 2025 20:03:04 +0530
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
Subject: Re: [RFC v2 0/9] cpu avoid state and push task mechanism
To: Yury Norov <yury.norov@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, maddy@linux.ibm.com,
        vschneid@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org,
        kprateek.nayak@amd.com, huschle@linux.ibm.com, srikar@linux.ibm.com,
        linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
 <aFxwaKwBykv5shN4@yury>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <aFxwaKwBykv5shN4@yury>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyMSBTYWx0ZWRfX69UbiPpDfrja 1CNOCzBG5s3icGgwv0v1Uef1dWfoZIVzjvRK86YHGU+fudRpQHvJboLsnUlcAwUtOLYLRI1wFPy 70MpfK09ciZQWLeg6GNvx/iJSjyxFebp/t9clnDvIs+Y4bQeA8zElCLId8WwvjbbpkSOjfvxqI+
 yAK3zIM2nA/i3ABKzDJdgHSDAEdO4iQxYXfmN8i4YRBQGFawzjsE+XZ94STsKzd9L23fLsoXsdm jxVQIzlA0VUw+zHlgQ9tJ5u7WLC2mxT8EdWZNqykwJeFLGjG/kxrcUx7n1Cya6x38tPY7k1gtRR iLzbaDQCtW8egyEF7odd0Kn7SAVRVzmOdJKoxX+ZXF4+Wx/NlyvD9xO2yCinVd/MRp7A3JrAxV/
 x5KQYIamwfTnisJ0pRdH7FW/FTKNrP4Ev1BsvZQuTtgam9ZEAL452n6cqUGscdflHmAZI8RT
X-Proofpoint-GUID: WflfNwVc5Gioxw0ubxil642ynRdApN32
X-Proofpoint-ORIG-GUID: TiIUGEzwDeNoQQbmaupyPA_FO17d0KPq
X-Authority-Analysis: v=2.4 cv=combk04i c=1 sm=1 tr=0 ts=685d5a2a cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=9Ng4NLojh00e9vYZGIoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260121
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 6/26/25 03:25, Yury Norov wrote:
> On Thu, Jun 26, 2025 at 12:40:59AM +0530, Shrikanth Hegde wrote:
>> This is a followup version if [1] with few additions. This is still an RFC
>> and would like get feedback on the idea and suggestions on improvement.
>>
>> v1->v2:
>> - Renamed to cpu_avoid_mask in place of cpu_parked_mask.
> 
> This one is not any better to the previous. Why avoid? When avoid?
> I already said that: for objects, having positive self-explaining
> noun names is much better than negative and/or function-style verb
> names. I suggested cpu_paravirt_mask, and I still believe it's a much
> better option.
> 

ok. only reason is CPU is always para virtualized in those environment right?
When there is contention for pCPU, only then we want set this mask.
So i thought it might have to reflect that.


I can keep cpu_paravirt_mask. Could you please suggest set/get names which could
go with it? cpu_paravirt(cpu)?

>> - Used a static key such that no impact to regular case.
> 
> Static keys are not free and designed for different purpose. You have
> CONFIG_PARAVIRT, and I don't understand why you're trying to avoid
> using it.
> 
> I don't mind about static keys, if you prefer them, I just want to
> have feature-specific code under corresponding config.
> 
> Can you please print bloat-o-meter report for CONFIG_PARAVIRT=n?
> Have you any perf numbers to advocate static keys here?
> 

I wanted to see if there could be any other use cases apart from paravirt case.

One I thought was, in SMT systems under low utilization, it could help higher IPC by keeping the tasks on
only 1 thread.. if base_slice is kept low, latency could be relatively low.

Other was, workloads or system usage can be dynamic in nature with peaks and troughs. when it is in trough, one may not want to use all
the cores(instead use SMT siblings), thereby saving some power.


Using CONFIG_PARAVIRT could end up sprinkling a bit of ifdefs. Need to see how I could minimize it.
Let me get back with bloat-o-meter numbers and performance numbers.

>> - add sysfs file to show avoid CPUs.
>> - Make RT understand avoid CPUs.
>> - Add documentation patch
>> - Took care of reported compile error in [1] when NR_CPUS=1
>>
>> -----------------
>> Problem statement
>> -----------------
>> vCPU - Virtual CPUs - CPU in VM world.
>> pCPU - Physical CPUs - CPU in baremetal world.
>>
>> A hypervisor is managing these vCPUs from different VMs. When a vCPU
>> requests for CPU, hypervisor does the job of scheduling them on a pCPU.
>>
>> So this issue occurs when there are more vCPUs(combined across all VMs)
>> than the pCPU. So when *all* vCPUs are requesting for CPUs, hypervisor
>> can only run a few of them and remaining will be preempted(waiting for pCPU).
>>
>> If we take two VM's, When hypervisor preempts vCPU from VM1 to run vCPU from
>> VM2, it has to do save/restore VM context.Instead if VM's can co-ordinate among
>> each other and request for *limited*  vCPUs, it avoids the above overhead and
>                                         ^
> Did this extra whitespace escaped from the previous line, or the following?
>

Thanks for noticing it.
                                           v
>> there is context switching within vCPU(less expensive). Even if hypervisor
>> is preempting one vCPU to run another within the same VM, it is still more
>> expensive than the task preemption within the vCPU. So *basic* aim to avoid
>> vCPU preemption.
>>
>> So to achieve this, use "CPU Avoid" concept, where it is better
>> if workload avoids these vCPUs at this moment.
>> (vCPUs stays online, we don't want the overhead of sched domain rebuild).
>>
>> Contention is dynamic in nature. When there is contention for pCPU is to be
>> detected and determined by architecture. Archs needs to update the mask
>> accordingly.
>>
>> When there is contention, use limited vCPUs as indicated by arch.
>> When there is no contention, use all vCPUs.
>>
>> -------------------------
>> To be done and Questions:
>> -------------------------
>> 1. IRQ - still don't understand this cpu_avoid_mask. Maybe irqbalance
>> code could be modified to do the same. Ran stress-ng --hrtimers, irq
>> moved out of avoid cpu though. So need to see if changes to irqbalance is
>> required or not.
>>
>> 2. If a task is spawned by affining to only avoid CPUs. Should that fail
>> or throw a warning to user.
> 
> I think it's possible that existing codebase will do that. And because
> you don't want to break userspace, you should not restrict.

ok got it. currently it is allowed.

> 
>> 3. Other classes such as SCHED_EXT, SCHED_DL won't understand this infra
>> yet.
>>
>> 4. Performance testing yet to be done. RFC only verified the functional
>> aspects of whether task move out of avoid CPUs or not. Move happens quite
>> fast (around 1-2 seconds even on large systems with very high utilization)
>>
>> 5. Haven't come up an infra which could combine all push task related
>> changes. It is currently spread across rt, dl, fair. Maybe some
>> consolidation can be done. but which tasks to push/pull still remains in
>> the class.
>>
>> 6. cpu_avoid_mask may need some sort of locking to ensure read/write is
>> correct.
>>
>> [1]: https://lore.kernel.org/all/20250523181448.3777233-1-sshegde@linux.ibm.com/
>>
>> Shrikanth Hegde (9):
>>    sched/docs: Document avoid_cpu_mask and avoid CPU concept
>>    cpumask: Introduce cpu_avoid_mask
>>    sched/core: Don't allow to use CPU marked as avoid
>>    sched/fair: Don't use CPU marked as avoid for wakeup and load balance
>>    sched/rt: Don't select CPU marked as avoid for wakeup and push/pull rt task
>>    sched/core: Push current task out if CPU is marked as avoid
>>    sched: Add static key check for cpu_avoid
>>    sysfs: Add cpu_avoid file
>>    powerpc: add debug file for set/unset cpu avoid
>>
>>   Documentation/scheduler/sched-arch.rst | 25 +++++++++++++
>>   arch/powerpc/include/asm/paravirt.h    |  2 ++
>>   arch/powerpc/kernel/smp.c              | 50 ++++++++++++++++++++++++++
>>   drivers/base/cpu.c                     |  8 +++++
>>   include/linux/cpumask.h                | 17 +++++++++
>>   kernel/cpu.c                           |  3 ++
>>   kernel/sched/core.c                    | 50 +++++++++++++++++++++++++-
>>   kernel/sched/fair.c                    | 11 +++++-
>>   kernel/sched/rt.c                      |  9 +++--
>>   kernel/sched/sched.h                   | 10 ++++++
>>   10 files changed, 181 insertions(+), 4 deletions(-)
>>
>> -- 
>> 2.43.0


