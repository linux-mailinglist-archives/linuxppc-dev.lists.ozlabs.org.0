Return-Path: <linuxppc-dev+bounces-12740-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DA9BC85BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 11:47:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cj4mq28Gzz3cDN;
	Thu,  9 Oct 2025 20:47:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760003275;
	cv=none; b=itmH51mz3jb3HLfbIoT/x2XSn4DjUp7s17boorSemEVz6lV2t7jGmuYbQzmDR8koFQEjCIU5XSf7NncCkHSP52UjF/T363Tj0ZbblEu8t0B3Kmz96yyuiTfbK0Z2R+MbkrejO2Rn7wMHshCK2o/Uh+GGgl+5ovxEw4zlqEVA0F6fNsGYVlrMHID7a03OCxHG4ahmwx8btI0b0nPwUti7IpPlRbvVrwyuXAGAMNE1EpEbW4w5p+/zJPWZfVp8uyOaoGAgNnOIwjilMtHpG+9cfY2046t9YavNRRSbqlF61vejSYH3qqjDCO748xkAApLGFCD7Ji+LY71GVUo4BMzHFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760003275; c=relaxed/relaxed;
	bh=b3iuP75s/7HuEbGbD6UiSI1R1j7C7WmLHEin761aULI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oi2Mwwfl2VZWqhU+voGGBEN+ks392BvXg1sOsDx/VpP4YusOC8VuY1v6dHzeOzWXPWFRv/HVB+Z6UPAxxlzN5pTZ8BkCARJcW42LJliwRWVzt4nYUlEc+lyZQzboDjAh0GVbGgwMrY0hEMBeohD2IsvLXal0uO21kPyBz+Y2Y0tPMmJfsa1l/EyVG0y5aWi0tUNNDeQCpr+onZlDjPlNoG+12i15cMdwJnqm0OtkzuZz6QHFeM1+eUppQvih/uebJpFTYAABkXUcvfGdQ5jnpEKOEDoB0McqTyIMFd8BJFncqXv+JMYTdfTPWr1KgR77zPjH1ToVT7lv00fgDM+2JA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E6aAN1hB; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=E6aAN1hB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cj4mp1zVXz2xQ3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 20:47:53 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59967VtM031169;
	Thu, 9 Oct 2025 09:47:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=b3iuP7
	5s/7HuEbGbD6UiSI1R1j7C7WmLHEin761aULI=; b=E6aAN1hBIw4ca7rz5sY4/Z
	AvDBOEb3J7kLbTQybT+gDhHcdkGg6MoyIBnu1QlZDBVkDENYw91rmMm+Jui6qyrD
	C1yy4ahijs6WWzZXZ0aAGAcwsE36jnVB7C6zMSltVLUx36QTALARLD9PGMq0nk21
	5RAzGkjEHMIW0tv8GpsfM5lszIPhTcu0lL/irHM94ZR5cQuquNV93HvgfqHYKCS6
	mszQjm/09HLp24sPkt//PQTDNOu8R9Sz4blVua1IeFjHH9gXrQ25hHF3xsmjOb20
	zJWSQd6WeDrErsXCIpszuk1GgAQTnuvkPUzel5n+lbVJ6F/YREWzKLkkCWyY094A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49nv81kwnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 09:47:48 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5999jww5014959;
	Thu, 9 Oct 2025 09:47:47 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49nv81kwna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 09:47:47 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5998LJLq020997;
	Thu, 9 Oct 2025 09:47:47 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49nv9muuea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 09:47:47 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5999lheP53084626
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Oct 2025 09:47:43 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0CAB200DE;
	Thu,  9 Oct 2025 09:47:42 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 55C0F200DD;
	Thu,  9 Oct 2025 09:47:41 +0000 (GMT)
Received: from [9.109.215.252] (unknown [9.109.215.252])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  9 Oct 2025 09:47:41 +0000 (GMT)
Message-ID: <ccac0b98-fd05-403f-8cd2-6143f6e8cbdd@linux.ibm.com>
Date: Thu, 9 Oct 2025 15:17:40 +0530
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
To: Peter Zijlstra <peterz@infradead.org>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>, jstultz@google.com,
        stultz@google.com
References: <8218e149-7718-4432-9312-f97297c352b9@linux.ibm.com>
 <20251008095039.GG3245006@noisy.programming.kicks-ass.net>
 <5a248390-ddaa-4127-a58a-794d0d70461a@linux.ibm.com>
 <20251008111314.GI3289052@noisy.programming.kicks-ass.net>
 <86fbf707-9ecf-4941-ae70-3332c360533d@linux.ibm.com>
 <20251009080007.GH3245006@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20251009080007.GH3245006@noisy.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ywjW_IJhW58weh_YLD-WyXllKI9qTpkB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXw2N3hF6dYV6b
 D7ZboDvfpXcvaPgRJNZdD3DrKcKPchW4fOO+BEKMRf5lCTsgLR07bctiuLMfW+ZWPB2kae+3NZ5
 O5zwDoliDL7TYsUdBlYNL0mnCAs5XVSDxzBp3hrYCFaPR+mI/fXe/F3W4+C3LLeB8rESk26NnRG
 kPEW3cZeSEVZysPZnFgLwbZ0hjPKMcSRj7fjV0rn6Tb3fpIdv1EJ/eowFq3wpj6ugsW0OiIBDwD
 EMFuznZLksI6OE60a04NEwjeD1DuvUZPFm4e+miPyxZMwznXM9RBtzKh6+5aoXmXFMmgx0iNB8m
 tNDl/6YWSAdtZXaPMlEHLN0WBg+YOIE4dd6XNn0AOa6XHHR9EWdTfVnPig5t4aPJvd7DHlP9KQJ
 c4SF2X4s12ZPg0pKZdN55eUZ7jkbHQ==
X-Authority-Analysis: v=2.4 cv=cKntc1eN c=1 sm=1 tr=0 ts=68e784c4 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=RDWyn_YapoD0ENg9tjYA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ml748-No0PCCasYfTsSrrS_2M9j6c7Dc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/9/25 1:30 PM, Peter Zijlstra wrote:
> On Wed, Oct 08, 2025 at 11:39:11PM +0530, Shrikanth Hegde wrote:
> 
>> *It pointed to this*
>>
>> NIP [c0000000001fd798] dl_server_start+0x50/0xd8
>> LR [c0000000001d9534] enqueue_task_fair+0x228/0x8ec
>> Call Trace:
>> [c000006684a579c0] [0000000000000001] 0x1 (unreliable)
>> [c000006684a579f0] [c0000000001d9534] enqueue_task_fair+0x228/0x8ec
>> [c000006684a57a60] [c0000000001bb344] enqueue_task+0x5c/0x1c8
>> [c000006684a57aa0] [c0000000001c5fc0] ttwu_do_activate+0x98/0x2fc
>> [c000006684a57af0] [c0000000001c671c] try_to_wake_up+0x2e0/0xa60
>> [c000006684a57b80] [c00000000019fb48] kthread_park+0x7c/0xf0
>> [c000006684a57bb0] [c00000000015fefc] takedown_cpu+0x60/0x194
>> [c000006684a57c00] [c000000000161924] cpuhp_invoke_callback+0x1f4/0x9a4
>> [c000006684a57c90] [c0000000001621a4] __cpuhp_invoke_callback_range+0xd0/0x188
>> [c000006684a57d30] [c000000000165aec] _cpu_down+0x19c/0x560
>> [c000006684a57df0] [c0000000001637c0] __cpu_down_maps_locked+0x2c/0x3c
>> [c000006684a57e10] [c00000000018a100] work_for_cpu_fn+0x38/0x54
>> [c000006684a57e40] [c00000000019075c] process_one_work+0x1d8/0x554
>> [c000006684a57ef0] [c00000000019165c] worker_thread+0x308/0x46c
>> [c000006684a57f90] [c00000000019e474] kthread+0x16c/0x19c
>> [c000006684a57fe0] [c00000000000dd58] start_kernel_thread+0x14/0x18
>>
>> It is takedown_cpu called from CPU0(boot CPU) and it wakes up kthread
>> which is CPU Bound I guess.  Since happens after rq was marked
>> offline, it ends up starting the deadline server again.
>>
>> So i think it is sensible idea to stop the deadline server if the cpu
>> is going down.  Once we stop the server we will return
>> HRTIMER_NORESTART.
> 
> D'0h.. that stop was far too early.
> 
> How about moving that dl_server_stop() into sched_cpu_dying() like so.
> 
> This seems to survive a few hotplugs for me.
> 
> ---
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 198d2dd45f59..f1ebf67b48e2 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -8571,10 +8571,12 @@ int sched_cpu_dying(unsigned int cpu)
>   	sched_tick_stop(cpu);
>   
>   	rq_lock_irqsave(rq, &rf);
> +	update_rq_clock(rq);
>   	if (rq->nr_running != 1 || rq_has_pinned_tasks(rq)) {
>   		WARN(true, "Dying CPU not properly vacated!");
>   		dump_rq_tasks(rq, KERN_WARNING);
>   	}
> +	dl_server_stop(&rq->fair_server);
>   	rq_unlock_irqrestore(rq, &rf);
>   
>   	calc_load_migrate(rq);
> diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
> index 615411a0a881..7b7671060bf9 100644
> --- a/kernel/sched/deadline.c
> +++ b/kernel/sched/deadline.c
> @@ -1582,6 +1582,9 @@ void dl_server_start(struct sched_dl_entity *dl_se)
>   	if (!dl_server(dl_se) || dl_se->dl_server_active)
>   		return;
>   
> +	if (WARN_ON_ONCE(!cpu_online(cpu_of(rq))))
> +		return;
> +
>   	dl_se->dl_server_active = 1;
>   	enqueue_dl_entity(dl_se, ENQUEUE_WAKEUP);
>   	if (!dl_task(dl_se->rq->curr) || dl_entity_preempt(dl_se, &rq->curr->dl))

Yes. This works. no warning with drmgr or chcpu.

shall i write changelog and send it as patch?

