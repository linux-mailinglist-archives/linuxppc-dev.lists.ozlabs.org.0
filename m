Return-Path: <linuxppc-dev+bounces-12747-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0671BC8E9A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 13:54:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cj7bM1nMBz3cZ5;
	Thu,  9 Oct 2025 22:54:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760010895;
	cv=none; b=h8WDAvOC8rC3qf0K8T5PjiNHqsg2fi7IwOcwaLV32RLcDHpEDz+bhLf4yxj8y1UY0aS9PMmqqpGk7bPSv3W9PAf0D5Z9/LgBnguwEQUmxKHz6BjGfx8AY4AhwesAhvEsdRDsmtMoShXwJYcNlUAXKOljVO4NW+rahlesWjWWDfuoIAamUvwQ75xsIzJx41HmkicrNZVS/x73hDZ1OqtvZ8Ci50DejQr4IsnK/G8XIrr3w8pFjeNGk2Dol4/gza5ybXcSXSDAa0jbd4l3cOxb4Gbi3fSl9IxY+iiHPDu7j6B9y3RhiytOaqiDWrWLFLUJzsApmFVvaSX8E8bMAv7Xkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760010895; c=relaxed/relaxed;
	bh=89YoilszcVgtY2WH9xkUBX5haHu7VfKEfNvtGBAHGdM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=JYnx3ivxWvi9kLOZLlcPHYhinJflhMpJP4YDctJTwbYYqAjCR0NzEpu+SDg+idTyidUbN9t7GcTPSe9RfnnrDpWDiVz4IKAzhsDYV9CBjBKu0J3C2UdzC7ZLOnPKadMrVwP9WHz1uL5r4gqaU8C/R1vnbK+H15wZsp0fACF/NpHUkIJQZZZwPT4uNhyhxHB4EGOG8c+i+UXzjfersfh7fQIpNwt1jbI0d+2rn5BFRuzAL4A5cFXVzW49QL7og6+nMYdyr6aJfYqISU0cp+/+ny3rPyzeGlzHsL8U/2tpLMpq/QBCY8okWLWNsKM0O2UBarYbWfMiFQChGWxGcdny8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com; dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=bu192Bjv; dkim-atps=neutral; spf=pass (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org) smtp.mailfrom=samsung.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=bu192Bjv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cj7bG4W5bz3cYH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 22:54:49 +1100 (AEDT)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20251009115436euoutp02562f5140ae7a5d6b627e9d3cc86b4fc2~s0JFSUxQs2248222482euoutp02V
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 11:54:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20251009115436euoutp02562f5140ae7a5d6b627e9d3cc86b4fc2~s0JFSUxQs2248222482euoutp02V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760010877;
	bh=89YoilszcVgtY2WH9xkUBX5haHu7VfKEfNvtGBAHGdM=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=bu192Bjv4DCyMt7YU61OG1pYaDl8eyq6hJkNiecFAvJUn73QTZW1fP9YjBIisqt5f
	 f/wiDSTUCbW6KbHBroFQzToTC/AGg4bO4n6ljDpOTc1+soTZpDNaY+TX7K4lWRGUui
	 9wTa90wgFU9JWr5y2taU+ASF65/nFgLB++a56bOA=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20251009115436eucas1p23974f9afcd730fa3fdf66a7d6919d47f~s0JFAHA-N1574615746eucas1p2s;
	Thu,  9 Oct 2025 11:54:36 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20251009115435eusmtip1e8fd4f06ffd3e6a355d1458090c4b984~s0JEHJ53D1953819538eusmtip1j;
	Thu,  9 Oct 2025 11:54:35 +0000 (GMT)
Message-ID: <0d3eb8e5-5588-4718-b01c-ef32b7dcb4a1@samsung.com>
Date: Thu, 9 Oct 2025 13:54:35 +0200
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
User-Agent: Betterbird (Windows)
Subject: Re: [bisected][mainline]Kernel warnings at
 kernel/sched/cpudeadline.c:219
To: Peter Zijlstra <peterz@infradead.org>, Shrikanth Hegde
	<sshegde@linux.ibm.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>, LKML
	<linux-kernel@vger.kernel.org>, linuxppc-dev
	<linuxppc-dev@lists.ozlabs.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
	jstultz@google.com, stultz@google.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251009080007.GH3245006@noisy.programming.kicks-ass.net>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251009115436eucas1p23974f9afcd730fa3fdf66a7d6919d47f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251009115436eucas1p23974f9afcd730fa3fdf66a7d6919d47f
X-EPHeader: CA
X-CMS-RootMailID: 20251009115436eucas1p23974f9afcd730fa3fdf66a7d6919d47f
References: <8218e149-7718-4432-9312-f97297c352b9@linux.ibm.com>
	<20251008095039.GG3245006@noisy.programming.kicks-ass.net>
	<5a248390-ddaa-4127-a58a-794d0d70461a@linux.ibm.com>
	<20251008111314.GI3289052@noisy.programming.kicks-ass.net>
	<86fbf707-9ecf-4941-ae70-3332c360533d@linux.ibm.com>
	<20251009080007.GH3245006@noisy.programming.kicks-ass.net>
	<CGME20251009115436eucas1p23974f9afcd730fa3fdf66a7d6919d47f@eucas1p2.samsung.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 09.10.2025 10:00, Peter Zijlstra wrote:
> On Wed, Oct 08, 2025 at 11:39:11PM +0530, Shrikanth Hegde wrote:
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

This fixes a similar issue observed on Samsung Exynos SoC based boards 
(ARM 32bit and 64bit) that I've reported in the following thread:

https://lore.kernel.org/all/e56310b5-f7a9-4fad-b79a-dcbcdd3d3883@samsung.com/

Thanks for the fix! Feel free to add:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


