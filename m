Return-Path: <linuxppc-dev+bounces-10881-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A22A4B23474
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 20:40:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1gLT0Rmfz2xPx;
	Wed, 13 Aug 2025 04:40:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755024049;
	cv=none; b=S1ENSc5IEuUVF45j5+4bk0dqmADluKUF289vs4zjh7SaAhnuc2wee99ATfq6+jqcGJUEwwxdmWjVcLm3x3mTqqE6Nw7KT5xBp1cUSs29kQHE7atnBDac0KiIFpuB9LVsu7CGYPGmW0Zdv14XPmVcxPSLAQS/iPEd+SQe6wWjWabAMfnmY6sTwkbe93Nwqa/dYsfIgtnyVlVlVEtcbZhTmojPFS/s2P5K0tlBz6M6AuIyx1LNfu8UG5a2fRWIy0B9xcy8nSmgSV06wXP36X4mJkQ8EFg5kn1bG1c2SBw/nJdVPyRhYrwjkycQxX0iSaIVlkpfn3meUH/zTHI9/BG9wA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755024049; c=relaxed/relaxed;
	bh=Dwdw7ey5fRL5qqeZFjdhC9YXXZ9B60w7oqkX7t2MDb4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RNXmqJIUB/xiAj4ab4gzLcidYK3ha2lApuMi8UNw4H2Flv/i6HmotUFH4BqtNjJjafF0tJ1PZq13s+lXP+evY7I3DHGcwiG/rKj1Hl9JMt7zGNF8u/lVYf3jEp+ITm77/8CfLDFhFEokTGy0URoi15X8liJakDH5k39YWIVf8teaYESRcZ6PESQE8g7CWl1a68b7LZY5r/gusYPXLl5thjm7Ld3hjhUkUYXr0NxS7KQ1H/DWRyzu1EmbA7YsQv36waXY5tUvkvF05yahOQ/R9n/g9/4wowFza7j2v8xX8/rRM35a58DPvv+q5mc/6RqdVM1AlyiR1De5pW2qWzfCNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K6c+3NAM; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K6c+3NAM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1gLS0FPBz2xPw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 04:40:47 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57CGbbAH032042;
	Tue, 12 Aug 2025 18:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Dwdw7e
	y5fRL5qqeZFjdhC9YXXZ9B60w7oqkX7t2MDb4=; b=K6c+3NAMiSEvIo7vs29dRX
	2OaDmcT4iif8dSxgnC4+IuP6ZvE3/l0PnK+bEs3SHPsRGAM6Rw8HhnhPDWCIUzkP
	+rns66F+UMQo5aJtRb2g5Dohm7vx5+EGb+luaQNTHoXEkNzvv1Jjkhah5sReHJYo
	JP/EFOw7E6qhRkUXcEuOn+DiSDwdn9ujVx6DmPuDUKjj2BHU0WquQF2f3tSVbsof
	tF1z/IFArzCrinymQpddzWiApo22TEsgvJ6JpEIO8kJkk4mVb/4p2WB8CaGhsr99
	Jy1iZMnLXc388rMZICjtvgPLXepKXf4EUMemIw5GtVlafqoS4I5CaJN23Ridcmwg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dvrp0305-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 18:40:33 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57CIeJWK008152;
	Tue, 12 Aug 2025 18:40:32 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48dvrp02yy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 18:40:32 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57CIUiDo025638;
	Tue, 12 Aug 2025 18:40:31 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 48ejvmbkvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Aug 2025 18:40:31 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57CIeRJU17695028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Aug 2025 18:40:28 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDA602004B;
	Tue, 12 Aug 2025 18:40:27 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 709D120040;
	Tue, 12 Aug 2025 18:40:24 +0000 (GMT)
Received: from [9.39.29.151] (unknown [9.39.29.151])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 12 Aug 2025 18:40:24 +0000 (GMT)
Message-ID: <d87c4b4f-959b-4726-9b4b-4ddeb7488b37@linux.ibm.com>
Date: Wed, 13 Aug 2025 00:10:23 +0530
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
Subject: Re: [RFC v2 6/9] sched/core: Push current task out if CPU is marked
 as avoid
To: yury.norov@gmail.com
Cc: vschneid@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org,
        mingo@redhat.com, peterz@infradead.org, kprateek.nayak@amd.com,
        huschle@linux.ibm.com, srikar@linux.ibm.com,
        linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu,
        linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org,
        maddy@linux.ibm.com, tglx@linutronix.de, juri.lelli@redhat.com,
        vincent.guittot@linaro.org
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
 <20250625191108.1646208-7-sshegde@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250625191108.1646208-7-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEyMDE3NiBTYWx0ZWRfXw8+z2SX9DDiz
 EG041ZhTJJ52b/zAzS+T8BIrNS1sPAym/RCB2jmHtPeDMkL0pkq0iPiKNAebCq01T0M4m93NkF5
 ert2vyO/qXtqECBN3cvtpjxoOQwRe8dXjjqieAw6grHmS1paA/3lD8CgOpfzQHBA8zoagQO8SE1
 LizaCpPzY/irZ5inva/v17+5GtjZ2SEX4oaLiAZGcNiNbcZe4PRSwfrpZr1EdgIaQAiE3RrjGDu
 xjb6geiGRT6/2476xcVg/CBiXgxgY6X2sA5XuC3lPbs5HORr4TMBDOpGkyNAtQa6DXGpu4RHhn3
 v901tOozmbAVFwMOnIZIh0Bu90BA9AZLpopW27zwQRuh9sMbRgenituXTJOnoMDmtaI/M4AxuH1
 E/dAztjnfc8CKYdMTz+QsdZPmrKB8g6S/3cgwdxPmeLCjxbVcOGOe9tFrGj4SbXBm4EVynxT
X-Authority-Analysis: v=2.4 cv=GrpC+l1C c=1 sm=1 tr=0 ts=689b8aa1 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=0SY00xeoSHbpX606VFoA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ufIpwGsGi6HRf-h28LZjALTD051XfJxN
X-Proofpoint-ORIG-GUID: CsJOBVsWmIyZ2A5EZ0OhOgkYFABvy75L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_07,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 clxscore=1015 adultscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508120176
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


Sorry for the delay in response to bloat-o-meter report. Since stop_one_cpu_nowait needs protection
against race, need to add a field in rq. So ifdef check of CONFIG_PARAVIRT makes sense.

> 
> Since the task is running, need to use the stopper class to push the
> task out. Use __balance_push_cpu_stop to achieve that.
> 
> This currently works only CFS and RT.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>   kernel/sched/core.c  | 44 ++++++++++++++++++++++++++++++++++++++++++++
>   kernel/sched/sched.h |  1 +
>   2 files changed, 45 insertions(+)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 13e44d7a0b90..aea4232e3ec4 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -5577,6 +5577,10 @@ void sched_tick(void)
>   
>   	sched_clock_tick();
>   
> +	/* push the current task out if cpu is marked as avoid */
> +	if (cpu_avoid(cpu))
> +		push_current_task(rq);
> +
>   	rq_lock(rq, &rf);
>   	donor = rq->donor;
>   
> @@ -8028,6 +8032,43 @@ static void balance_hotplug_wait(void)
>   			   TASK_UNINTERRUPTIBLE);
>   }
>   
> +static DEFINE_PER_CPU(struct cpu_stop_work, push_task_work);
> +
> +/* A CPU is marked as Avoid when there is contention for underlying
> + * physical CPU and using this CPU will lead to hypervisor preemptions.
> + * It is better not to use this CPU.
> + *
> + * In case any task is scheduled on such CPU, move it out. In
> + * select_fallback_rq a non_avoid CPU will be chosen and henceforth
> + * task shouldn't come back to this CPU
> + */
> +void push_current_task(struct rq *rq)
> +{
> +	struct task_struct *push_task = rq->curr;
> +	unsigned long flags;
> +
> +	/* idle task can't be pused out */
> +	if (rq->curr == rq->idle || !cpu_avoid(rq->cpu))
> +		return;
> +
> +	/* Do for only SCHED_NORMAL AND RT for now */
> +	if (push_task->sched_class != &fair_sched_class &&
> +	    push_task->sched_class != &rt_sched_class)
> +		return;
> +
> +	if (kthread_is_per_cpu(push_task) ||
> +	    is_migration_disabled(push_task))
> +		return;
> +
> +	local_irq_save(flags);
> +	get_task_struct(push_task);
> +	preempt_disable();
> +
> +	stop_one_cpu_nowait(rq->cpu, __balance_push_cpu_stop, push_task,
> +			    this_cpu_ptr(&push_task_work));

Doing a perf record occasionally caused the crash. This happens because stop_one_cpu_nowait
expects the callers to sync and push_task_work should be untouched until the stopper executes.

So, i had to do something similar to whats done in active_balance.
Add a field in rq and set/unset accordingly.

Using this field in __balance_push_cpu_stop is also hacky. I have to do something like below,
	if (rq->balance_callback != &balance_push_callback)
		rq->push_task_work_pending = 0;
or i have to copy __balance_push_cpu_stop and do the above.

After this, it makes sense to put all this under CONFIG_PARAVIRT.


(Also, i did explore using stop_one_cpu variant, got to it via scheduling a work and then execute it at
preemptible context. That occasionally ends up in deadlock. due to some issues at my end, haven't debugged that
further. a backup option for nowait)

> +	preempt_enable();
> +	local_irq_restore(flags);
> +}
>   #else /* !CONFIG_HOTPLUG_CPU: */
>   
>   static inline void balance_push(struct rq *rq)
> @@ -8042,6 +8083,9 @@ static inline void balance_hotplug_wait(void)
>   {
>   }
>   
> +void push_current_task(struct rq *rq)
> +{
> +}
>   #endif /* !CONFIG_HOTPLUG_CPU */
>   
>   void set_rq_online(struct rq *rq)
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 105190b18020..b9614873762e 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1709,6 +1709,7 @@ struct rq_flags {
>   };
>   
>   extern struct balance_callback balance_push_callback;
> +void push_current_task(struct rq *rq);
>   
>   #ifdef CONFIG_SCHED_CLASS_EXT
>   extern const struct sched_class ext_sched_class;

Hopefully i should be able to send out v3 soon addressing the comments.

Namewise, going to keep it cpu_paravirt_mask and cpu_paravirt(cpu).


