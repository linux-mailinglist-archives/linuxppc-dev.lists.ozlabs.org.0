Return-Path: <linuxppc-dev+bounces-6457-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B81A43BBD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 11:34:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2DVP2mKDz30Tq;
	Tue, 25 Feb 2025 21:34:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740479645;
	cv=none; b=FhcRiXHXUEV6978bIxgQKPspq9zCXuH6L1cVJxUtjyqEdUkAf8JUQBSn54dapUMLzqIgVvVarHc+J5+I+b7654YT2XuW9ix9ZP1XtwF455kMrVMtzjQjX7hcCZDDlsz0y2rawlfVjVFgilj5kfcHjIc4RMUki1VfcTNMCa69fTxdD8FEk59ADcoMU2Nbw00Gqu8mJ26KAH+HwDerQhmMTvuyt1s+nKrO4SSo2hZxFhP6DnnAV/fLxKs++Jh0cG+VOodnAPo4yY1YHrSjmX+Pq+FiI+0r4JqIC3FuLRbZiFCEQO7zGD69AxermjRW/CoHBAWbUHfOYWqXtGoiLoKYYw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740479645; c=relaxed/relaxed;
	bh=zM+Q8lsfTpXEKoDSQRyVE2jzw9SBiiUToxNEsnjuDi0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oGfJhNbrpchvmTanIu8CxAJPAgulHZ46tPgJMJ2OIq4jbYpy0dSJXw9G7rlTrMimopTh6tepCK2qWSY284HNr8Nu+VGVTkr+Md7SdFs8Tlw0hrBhcuHbcjeknsmM66uN3VTE4YdQNBGtQeXVhffv+bVW46l9Xkt1azNUhuZtYLOLhZzwxYsn/UdzpluO5Ktf5A20LWffKU8BuB/Ysqdjid1d9Cl18T1o/D/jTYila+vWgiJdkYL00Ct/mn22lcI0pbE0FnsdSRrCTTfIa2B2DqU8ohfVvJZwCstpO9PI374/kIs+fP5Q83f7arS99N6Yx1/k7SgNk+3C9J/7JQuPew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hoWFrMzu; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hoWFrMzu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2DVN1n85z30TS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 21:34:03 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P5OIKA005365;
	Tue, 25 Feb 2025 10:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=zM+Q8l
	sfTpXEKoDSQRyVE2jzw9SBiiUToxNEsnjuDi0=; b=hoWFrMzueFTKj3F2ZgpDFV
	Ptx6mrufsOOKIBrYKF+qoqj8pSoJYySPoUiFr5DaOSDr7Asih4UuK9jWrmoQHFpk
	iTGY9ZhzQ+oHOEib0LXQlLEJtCElUd82TmY5YXhePeyhhoAgzwh/DEAEio05W0e3
	lNHJVYlDqTd1gBbeAtP/cBn2cuRXuBqtFe4+MbXRQcthM8x0f16VcWWVOKrVftEh
	x8GbSqmrfTgOH5plcckoRpBAXIFxAVWUkKwS01hqdkiCJe8N5EJKh3rIoXf6OPlQ
	QKF/yoIwx8AYDSa2sbjDcmtHEe/HISX/RA3KL1X/F52NEofjc7F8l2u9t4ex4UOQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4517p8hb3n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 10:33:16 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51PAXGwO003281;
	Tue, 25 Feb 2025 10:33:16 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4517p8hb3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 10:33:16 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51P9SE1a012741;
	Tue, 25 Feb 2025 10:33:15 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44yrwsmjhg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 10:33:15 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51PAXDiD43712838
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Feb 2025 10:33:13 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F95F2004E;
	Tue, 25 Feb 2025 10:33:13 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD4D520043;
	Tue, 25 Feb 2025 10:33:10 +0000 (GMT)
Received: from [9.124.212.192] (unknown [9.124.212.192])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 25 Feb 2025 10:33:10 +0000 (GMT)
Message-ID: <6f83b31b-def0-45b1-939b-1cbb2df9a133@linux.ibm.com>
Date: Tue, 25 Feb 2025 16:03:09 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 0/3] sched/fair: introduce new scheduler group type
 group_parked
To: Tobias Huschle <huschle@linux.ibm.com>, linux-kernel@vger.kernel.org,
        rostedt@goodmis.org
Cc: mingo@redhat.com, peterz@infradead.org, vincent.guittot@linaro.org,
        dietmar.eggemann@arm.com, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, juri.lelli@redhat.com
References: <20250217113252.21796-1-huschle@linux.ibm.com>
 <cc6996cc-c5c1-429d-ade0-9978b859f207@linux.ibm.com>
 <e44c0761-ea50-4c44-b42c-415dffdb441d@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <e44c0761-ea50-4c44-b42c-415dffdb441d@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uBQa6t8PHDxYSVOe0ps-MDWXWQ09fG2V
X-Proofpoint-ORIG-GUID: e7yiZjWDd4gx_gAfkr9zYchBRzRcqxuh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_03,2025-02-24_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 impostorscore=0 clxscore=1011 mlxscore=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502250073
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2/20/25 16:25, Tobias Huschle wrote:
> 
> 
> On 18/02/2025 06:58, Shrikanth Hegde wrote:
> [...]
>>>
>>> There are a couple of issues and corner cases which need further
>>> considerations:
>>> - rt & dl:      Realtime and deadline scheduling require some additional
>>>                  attention.
>>
>> I think we need to address atleast rt, there would be some non percpu 
>> kworker threads which need to move out of parked cpus.
>>
> 
> Yea, sounds reasonable. Would probably make sense to go next for that one.

Ok. I was experimenting with rt code. Its all quite new to me.
Was able to get non-bound rt tasks honor the cpu parked state. However it works only
if the rt tasks performs some wakeups. (for example, start hackbench with chrt -r 10)

If it is continuously running (for example stress-ng with chrt -r 10), then it doesn't pack at runtime when
CPUs become parked after it started running. Not sure how many RT tasks behave that way.
It packs when starting afresh when CPUs are already parked and unpacks when CPUs become unparked though.


Added some prints in rt code to understand. A few observations:
1. balance_rt or rt_pull_tasks don't get called once stress-ng starts running.
That means there is no opportunity to pull the tasks or load balance?
It gets called when migration is running, but that can't be balanced.
Is there a way to trigger load balance of rt tasks when the task doesn't give up the CPU?

2. Regular load balance (sched_balance_rq) does get called even when the CPU is only
running the rt tasks. It tries to do the load balance (i.e passes update_sd_lb_stats etc),
but will not do a actual balance because it only works on src_rq->cfs_tasks.
That maybe a opportunity to skip the load balance if the CPU is running the RT task?
i.e CPU is not idle and chosen as the CPU do the load balancing because its the first CPU
in the group and its running only RT task.

Can Point 1 be addressed? and Is point 2 makes sense?
Also please suggest a better way if there is one compared to the patch below.

diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index 4b8e33c615b1..4da2e60da9a8 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -462,6 +462,9 @@ static inline bool rt_task_fits_capacity(struct task_struct *p, int cpu)
         unsigned int max_cap;
         unsigned int cpu_cap;
  
+       if (arch_cpu_parked(cpu))
+               return false;
+
         /* Only heterogeneous systems can benefit from this check */
         if (!sched_asym_cpucap_active())
                 return true;
@@ -476,6 +479,9 @@ static inline bool rt_task_fits_capacity(struct task_struct *p, int cpu)
  #else
  static inline bool rt_task_fits_capacity(struct task_struct *p, int cpu)
  {
+       if (arch_cpu_parked(cpu))
+               return false;
+
         return true;
  }
  #endif
@@ -1801,6 +1807,8 @@ static int find_lowest_rq(struct task_struct *task)
         int this_cpu = smp_processor_id();
         int cpu      = task_cpu(task);
         int ret;
+       int parked_cpu = 0;
+       int tmp_cpu;
  
         /* Make sure the mask is initialized first */
         if (unlikely(!lowest_mask))
@@ -1809,11 +1817,18 @@ static int find_lowest_rq(struct task_struct *task)
         if (task->nr_cpus_allowed == 1)
                 return -1; /* No other targets possible */
  
+       for_each_cpu(tmp_cpu, cpu_online_mask) {
+               if (arch_cpu_parked(tmp_cpu)) {
+                       parked_cpu = tmp_cpu;
+                       break;
+               }
+       }
+
         /*
          * If we're on asym system ensure we consider the different capacities
          * of the CPUs when searching for the lowest_mask.
          */
-       if (sched_asym_cpucap_active()) {
+       if (sched_asym_cpucap_active() || parked_cpu > -1) {
  
                 ret = cpupri_find_fitness(&task_rq(task)->rd->cpupri,
                                           task, lowest_mask,
@@ -1835,14 +1850,14 @@ static int find_lowest_rq(struct task_struct *task)
          * We prioritize the last CPU that the task executed on since
          * it is most likely cache-hot in that location.
          */
-       if (cpumask_test_cpu(cpu, lowest_mask))
+       if (cpumask_test_cpu(cpu, lowest_mask) && !arch_cpu_parked(cpu))
                 return cpu;
  
         /*
          * Otherwise, we consult the sched_domains span maps to figure
          * out which CPU is logically closest to our hot cache data.
          */
-       if (!cpumask_test_cpu(this_cpu, lowest_mask))
+       if (!cpumask_test_cpu(this_cpu, lowest_mask) || arch_cpu_parked(this_cpu))
                 this_cpu = -1; /* Skip this_cpu opt if not among lowest */
  
         rcu_read_lock();
@@ -1862,7 +1877,7 @@ static int find_lowest_rq(struct task_struct *task)
  
                         best_cpu = cpumask_any_and_distribute(lowest_mask,
                                                               sched_domain_span(sd));
-                       if (best_cpu < nr_cpu_ids) {
+                       if (best_cpu < nr_cpu_ids  && !arch_cpu_parked(best_cpu)) {
                                 rcu_read_unlock();
                                 return best_cpu;
                         }
@@ -1879,7 +1894,7 @@ static int find_lowest_rq(struct task_struct *task)
                 return this_cpu;
  
         cpu = cpumask_any_distribute(lowest_mask);
-       if (cpu < nr_cpu_ids)
+       if (cpu < nr_cpu_ids && !arch_cpu_parked(cpu))
                 return cpu;
  
         return -1;


Meanwhile, i will continue looking at code to understand it better.

> 
>>> - ext:          Probably affected as well. Needs some conceptional
>>>                  thoughts first.
>>> - raciness:     Right now, there are no synchronization efforts. It 
>>> needs
>>>                  to be considered whether those might be necessary or if
>>>                  it is alright that the parked-state of a CPU might 
>>> change
>>>                  during load-balancing.
>>>
>>> Patches apply to tip:sched/core
>>>
>>> The s390 patch serves as a simplified implementation example.
>>
>>
>> Gave it a try on powerpc with the debugfs file. it works for 
>> sched_normal tasks.
>>
> 
> That's great to hear!
> 
>>>
>>> Tobias Huschle (3):
>>>    sched/fair: introduce new scheduler group type group_parked
>>>    sched/fair: adapt scheduler group weight and capacity for parked CPUs
>>>    s390/topology: Add initial implementation for selection of parked 
>>> CPUs
>>>
>>>   arch/s390/include/asm/smp.h    |   2 +
>>>   arch/s390/kernel/smp.c         |   5 ++
>>>   include/linux/sched/topology.h |  19 ++++++
>>>   kernel/sched/core.c            |  13 ++++-
>>>   kernel/sched/fair.c            | 104 ++++++++++++++++++++++++++++-----
>>>   kernel/sched/syscalls.c        |   3 +
>>>   6 files changed, 130 insertions(+), 16 deletions(-)
>>>
>>
> 


