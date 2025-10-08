Return-Path: <linuxppc-dev+bounces-12718-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 696D8BC63E0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 08 Oct 2025 20:09:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chgxy2PGyz30NF;
	Thu,  9 Oct 2025 05:09:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759946966;
	cv=none; b=PYYZB+ccM4Ccsx9+VQAri0D7w9U1sVqAWx7t/b1U6gDLqor/SMkL4L1M6baHHn4BqQgd0fOkokmBcoT/LqsACfeCWAoKJB9MKg3G26VPlFNAhNUxV6tEoLcdmBF5LP682eP3sfEYWHlDcCLYrpyE7kZ+utIuEhQiez2ufgKOlNWdIdSoI6QmWWx5TFJLU0LQkxvXGdTcQ4EDETnjc6pqLUK98S/4YGtMJfJ4XiSzJonatXZq19Vaseo5Uh6uQag21sDhRpFFVf1On6ZVubaDE6mDcWDsSW8UCkkF0/9afohIhGnfgopHd55nJKyx2VlYmunClE2mHeLOKBfQoq4dvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759946966; c=relaxed/relaxed;
	bh=SVm74aGAwJF1JJPKZ47yU7o2RREFiloqrOd+wiiilgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GJL6i5SPrqojAvTmjwSDE5SvAgzNT0A/y8sDN78p2tT7/egC1rh/+K49mQ8kwR7wvp40skVZN50dPNJY+B+EHC/gQ14mYjODGcnKAe8OOxRo8FeG3jitpAd9XRyKvtbWFbBPXq+sgxF/TiXgAkMQgsxk3KuGoUof7/52cwzBaN3yVWkeoin5gv+5uDPnuUBraIHv9Nrc36CoNJLn0AMABQXBnSjq/Obk19/McIQtwfdAZAhfBFby/iRYVXuSzFdW7yze4V07jWQ6w/+E742U6pJN5CcFMmisiEwQJ5BaOyEtdhbGv97S84gXX3hBUE8X772WYKtml63uQZTDW0lsAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jLQ59Z3r; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jLQ59Z3r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chgxx212Jz303F
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 05:09:24 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598HI1Hj030370;
	Wed, 8 Oct 2025 18:09:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=SVm74a
	GAwJF1JJPKZ47yU7o2RREFiloqrOd+wiiilgE=; b=jLQ59Z3rcEroH4GK/jdfoT
	3dti22t31wajGZ4XjXXIdGxm9Ohk4oV1UL0dQsYoZ4MFq7DojskI17cKatAjehQh
	J698G49Ja5xY80Ksqh5sSDUsHoHQBf8QqJpouWT+uNO9NtBO3cizmf3ghroEfkGs
	lbeKZ/vOAXXgh1GCeaYKuTl+AFj4v5R189qipVP4OmjJExm7cE/AVDYd+7i6upnh
	0LYC5olNuvAvj9DoTl+cJqIm1F9Gj1F3qtXfU2JJ2bDFWB/LsL47c31AYN0HW/AB
	FjxV1GyrQA3t3u1lXQpLDSzdjZJdRbOaWaVF01bjzQhCNPqbVcCwFxqO7zNQwiew
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49nv81g7bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 18:09:19 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 598I9JL9006311;
	Wed, 8 Oct 2025 18:09:19 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49nv81g7bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 18:09:19 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 598HJsAT022808;
	Wed, 8 Oct 2025 18:09:18 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49nv8v86yf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Oct 2025 18:09:18 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 598I9EBt47710682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Oct 2025 18:09:14 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 98B3320043;
	Wed,  8 Oct 2025 18:09:14 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7335520040;
	Wed,  8 Oct 2025 18:09:12 +0000 (GMT)
Received: from [9.124.216.74] (unknown [9.124.216.74])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Oct 2025 18:09:12 +0000 (GMT)
Message-ID: <86fbf707-9ecf-4941-ae70-3332c360533d@linux.ibm.com>
Date: Wed, 8 Oct 2025 23:39:11 +0530
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
Subject: Re: [bisected][mainline]Kernel warnings at
 kernel/sched/cpudeadline.c:219
To: Peter Zijlstra <peterz@infradead.org>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Cc: LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>, jstultz@google.com,
        stultz@google.com
References: <8218e149-7718-4432-9312-f97297c352b9@linux.ibm.com>
 <20251008095039.GG3245006@noisy.programming.kicks-ass.net>
 <5a248390-ddaa-4127-a58a-794d0d70461a@linux.ibm.com>
 <20251008111314.GI3289052@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20251008111314.GI3289052@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: P_F7Au8kFTcbkE3QRRZuaJdkGp5ZIYO8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX0JM0fo40WeQz
 fvAJEoZ2SNcH5MGWqtYh3LqsSRnUljckWoyWwYESbeCAxHyWbKVEF/5NGzmGUt9rg3g21uxsv5o
 Oj1WuiSBMcaf9FwhWqvpmf54KuNr+3nfIt7oWw9gmTN2qjh/Hl9LF8avwttYu1kuh620gOmGzPu
 MiQNGVS9u2sNZt4t3mSBcOLLmDQ6MkjjgahLJpLIAoY9Te7vxQSWa7eO93e9VXywQ6yLlStg0f7
 3P3d2JhCyDa3XshQVkYApSrwQra87fiIzPhk8s0cLacoa8I4qIO9pK2Ba+kQaRJmt5bn4OAzDOQ
 JQK9S6ZT8BGMFoVBkUln/3O5g3AnF0GqgM87en+ZB3aXOV4VX+zG+vRbcif2D58j2/AfmXEoY3v
 JZ/WkDSXc9FKusIqxhu+/TXkQgXxHw==
X-Authority-Analysis: v=2.4 cv=cKntc1eN c=1 sm=1 tr=0 ts=68e6a8cf cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=pI1YL9lGUCM5EE-SFDYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: FtL4O8A1Ssr1rYusy5EOikEo7bCPOFZS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/8/25 4:43 PM, Peter Zijlstra wrote:
> On Wed, Oct 08, 2025 at 03:47:16PM +0530, Shrikanth Hegde wrote:
>>
>>
>> On 10/8/25 3:20 PM, Peter Zijlstra wrote:
>>> On Wed, Oct 08, 2025 at 07:41:10AM +0530, Venkat Rao Bagalkote wrote:
>>>> Greetings!!!
>>>>
>>>>
>>>> IBM CI has reported a kernel warnings while running CPU hot plug operation
>>>> on IBM Power9 system.
>>>>
>>>>
>>>> Command to reproduce the issue:
>>>>
>>>> drmgr -c cpu -r -q 1
>>>>

> 
> I do not know what drmgr is. I am not familiar with PowerPC tools.
> AFAICT x86 never modifies cpu_present_mask after boot.
> 

It is a tool which allows dynamic addition of cpu/memory. It does indeed changes the present cpus.
Even i am not profound with it :)

>> maybe during drmgr, the dl server gets started again? Maybe that's why above patch it didn't work.
>> Will see and understand this bit more.
> 
> dl_server is per cpu and is started on enqueue of a fair task when:
> 
>    - the runqueue was empty; and
>    - the dl_server wasn't already active
> 
> Once the dl_server is active it has this timer (you already found this),
> this timer is set for the 0-laxity moment (the last possible moment in
> time where it can still run its budget and not be late), during this
> time any fair runtime is accounted against it budget (subtracted from).
> 
> Once the timer fires and it still has budget left; it will enqueue the
> deadline entity. However the more common case is that its budget will be
> depleted, in which case the timer is reset to its period end for
> replenish (where it gets new runtime budget), after which its back to
> the 0-laxity.
> 
> If the deadline entity gets scheduled, it will try and pick a fair task
> and run that. In the case where there is no fair task, it will
> deactivate itself.

ok cool.

> 
> The patch I sent earlier would force stop the deadline timer on CPU
> offline.
> 
> 
>> Also, i tried this below diff which fixes it. Just ignore the hrtimer if the cpu is offline.
>> Does this makes sense?
>> ---
>>
>> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
>> index 615411a0a881..a342cf5e4624 100644
>> --- a/kernel/sched/deadline.c
>> +++ b/kernel/sched/deadline.c
>> @@ -1160,6 +1160,9 @@ static enum hrtimer_restart dl_server_timer(struct hrtimer *timer, struct sched_
>>   	scoped_guard (rq_lock, rq) {
>>   		struct rq_flags *rf = &scope.rf;
>> +		if (!cpu_online(rq->cpu))
>> +			return HRTIMER_NORESTART;
>> +
>>   		if (!dl_se->dl_throttled || !dl_se->dl_runtime)
>>   			return HRTIMER_NORESTART;
> 
> This could leave the dl_server in inconsistent state. It would have to
> call dl_server_stop() or something along those lines.
> 
> Also, this really should not happen; per my previous patch we should be
> stopping the timer when we go offline.
> 
> Since you can readily reproduce this; perhaps you could stick something
> like this in dl_server_start():
> 
> 	WARN_ON_ONCE(!cpu_online(rq->cpu))
> 
> See if anybody is (re)starting the thing ?

So i did use this diff to get who is enabling it again, after it was stopped in offline.

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 198d2dd45f59..83e77bbbb6b4 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -8328,6 +8328,8 @@ static inline void sched_set_rq_offline(struct rq *rq, int cpu)
                 BUG_ON(!cpumask_test_cpu(cpu, rq->rd->span));
                 set_rq_offline(rq);
         }
+       dl_server_stop(&rq->fair_server);
+
         rq_unlock_irqrestore(rq, &rf);
  }
  
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 615411a0a881..5847540bdc18 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1582,6 +1582,8 @@ void dl_server_start(struct sched_dl_entity *dl_se)
         if (!dl_server(dl_se) || dl_se->dl_server_active)
                 return;
  
+       WARN_ON(!rq->online);
+
         dl_se->dl_server_active = 1;
         enqueue_dl_entity(dl_se, ENQUEUE_WAKEUP);
         if (!dl_task(dl_se->rq->curr) || dl_entity_preempt(dl_se, &rq->curr->dl))

*It pointed to this*

NIP [c0000000001fd798] dl_server_start+0x50/0xd8
LR [c0000000001d9534] enqueue_task_fair+0x228/0x8ec
Call Trace:
[c000006684a579c0] [0000000000000001] 0x1 (unreliable)
[c000006684a579f0] [c0000000001d9534] enqueue_task_fair+0x228/0x8ec
[c000006684a57a60] [c0000000001bb344] enqueue_task+0x5c/0x1c8
[c000006684a57aa0] [c0000000001c5fc0] ttwu_do_activate+0x98/0x2fc
[c000006684a57af0] [c0000000001c671c] try_to_wake_up+0x2e0/0xa60
[c000006684a57b80] [c00000000019fb48] kthread_park+0x7c/0xf0
[c000006684a57bb0] [c00000000015fefc] takedown_cpu+0x60/0x194
[c000006684a57c00] [c000000000161924] cpuhp_invoke_callback+0x1f4/0x9a4
[c000006684a57c90] [c0000000001621a4] __cpuhp_invoke_callback_range+0xd0/0x188
[c000006684a57d30] [c000000000165aec] _cpu_down+0x19c/0x560
[c000006684a57df0] [c0000000001637c0] __cpu_down_maps_locked+0x2c/0x3c
[c000006684a57e10] [c00000000018a100] work_for_cpu_fn+0x38/0x54
[c000006684a57e40] [c00000000019075c] process_one_work+0x1d8/0x554
[c000006684a57ef0] [c00000000019165c] worker_thread+0x308/0x46c
[c000006684a57f90] [c00000000019e474] kthread+0x16c/0x19c
[c000006684a57fe0] [c00000000000dd58] start_kernel_thread+0x14/0x18

It is takedown_cpu called from CPU0(boot CPU) and it wakes up kthread which is CPU Bound I guess.
Since happens after rq was marked offline, it ends up starting the deadline server again.

So i think it is sensible idea to stop the deadline server if the cpu is going down.
Once we stop the server we will return HRTIMER_NORESTART.

This does fix the warning. Does this look any good?

---
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 615411a0a881..831797b9ec0f 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -1160,11 +1160,14 @@ static enum hrtimer_restart dl_server_timer(struct hrtimer *timer, struct sched_
         scoped_guard (rq_lock, rq) {
                 struct rq_flags *rf = &scope.rf;
  
+               update_rq_clock(rq);
+               if (!cpu_online(rq->cpu))
+                       dl_server_stop(dl_se);
+
                 if (!dl_se->dl_throttled || !dl_se->dl_runtime)
                         return HRTIMER_NORESTART;
  
                 sched_clock_tick();
-               update_rq_clock(rq);
  
                 if (!dl_se->dl_runtime)
                         return HRTIMER_NORESTART;

----

Also below check is duplicate. We do the same check above.

if (!dl_se->dl_runtime)
                         return HRTIMER_NORESTART;

