Return-Path: <linuxppc-dev+bounces-12757-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8731BCACDB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 09 Oct 2025 22:29:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cjM0L3rDcz2ySJ;
	Fri, 10 Oct 2025 07:28:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760041730;
	cv=none; b=HicPkthvbIqun05MjWZTh2RFe8kaCc/UseEa5eBRj7Lvc7Wd503bfr4LW9EcDW2MLm4Gq0w/wk/JfNKpYPLpe1Iwb8ghCh7S5itOJ1996Ug+Cc0TTkkaU1ge5zwP2Njbodv14VOm/F1Ijjki441f9gw3liBClJBh1lUDXQosXQPi7S5I6+WLPgIygJUbxTqNlpN4TclbRAZ3YxOzveFBRZ5VyrSocohGz7eopVrt0Kpb5VdJnodKboaU9XpibXc16makhiNh5iU+JxFlYNM/ymbXrM9ukX/fIA00GNOvNCBC8Q0sEmncBahdebS0+FkjrFr+QQoLltTMX5AJ4uOzlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760041730; c=relaxed/relaxed;
	bh=PEQt2CgrK+lTlqZJv4b9gffvbDj0I0LwSr+EGVx7o+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=ST8TURHGBkILWXqUvs++Y755CD+2hRTcHqR/xaDrRe5xY5mWbOsVvXHSUZc3ZyNnf1Hyrgb7bImPWxe3f98urz1TrROwQSNJXfMWasKN9xbS3Ituzsf/NzAe+jucTDaVTx3drKRM8Kl1ugWzl7RJ+yM0efEjUcGOAW80ODWHhsP950pvCbt5uqFAA5e09vCQPaEJqSsVpdAyGGKEN0IfgnCLQ10aWlUwoi1jD0zVsNAgjVLhS5jDdkOAeYDJFeZ9uorVqlcCD7ScnQixSRzKQsNRD5jHoQ0fDAGE5NFaas4oasG3WpUMFjyC4Wu4JfKtCWYZFvK9eEaVxyJxRdK5HQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com; dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=nlk+4kPQ; dkim-atps=neutral; spf=pass (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org) smtp.mailfrom=samsung.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=nlk+4kPQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cjM0H3cjwz2xnt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Oct 2025 07:28:44 +1100 (AEDT)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20251009202834euoutp01b9c98413b5a01ee193f98d27bb119aeb~s7J1JIviX2911029110euoutp019
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 20:28:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20251009202834euoutp01b9c98413b5a01ee193f98d27bb119aeb~s7J1JIviX2911029110euoutp019
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1760041714;
	bh=PEQt2CgrK+lTlqZJv4b9gffvbDj0I0LwSr+EGVx7o+M=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=nlk+4kPQaPH0OjKtHU2HerZ8oqVXQX4STzkU4FDKBWC0gUTfdoPuTHMZfbgtYCibG
	 03yoUe2MA2Qxuh6NkMpF8kRek6DVa/wnlrP/KZ1iNNWcYsT8pS53vLrJn2LugbRm22
	 UGSZ2fwrvO806Tjez4WYllNy7CsGXCm6jmB07FaM=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20251009202834eucas1p1bfe2bd8fdb6360bc836fa09dd2208a58~s7J0yGgka2691726917eucas1p1y;
	Thu,  9 Oct 2025 20:28:34 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20251009202833eusmtip29563cfd0864227c6682b23fe26571a5b~s7Jz4niFS2491624916eusmtip2D;
	Thu,  9 Oct 2025 20:28:33 +0000 (GMT)
Message-ID: <58f317d8-3137-4847-9a27-cbdf0f54eff2@samsung.com>
Date: Thu, 9 Oct 2025 22:28:32 +0200
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
Subject: Re: [PATCH] sched/deadline: stop dl_server before CPU goes offline
To: Shrikanth Hegde <sshegde@linux.ibm.com>, peterz@infradead.org,
	juri.lelli@redhat.com
Cc: mingo@redhat.com, vincent.guittot@linaro.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	venkat88@linux.ibm.com, jstultz@google.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20251009184727.673081-1-sshegde@linux.ibm.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20251009202834eucas1p1bfe2bd8fdb6360bc836fa09dd2208a58
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20251009202834eucas1p1bfe2bd8fdb6360bc836fa09dd2208a58
X-EPHeader: CA
X-CMS-RootMailID: 20251009202834eucas1p1bfe2bd8fdb6360bc836fa09dd2208a58
References: <20251009184727.673081-1-sshegde@linux.ibm.com>
	<CGME20251009202834eucas1p1bfe2bd8fdb6360bc836fa09dd2208a58@eucas1p1.samsung.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 09.10.2025 20:47, Shrikanth Hegde wrote:
> From: Peter Zijlstra (Intel) <peterz@infradead.org>
>
> IBM CI tool reported kernel warning[1] when running a CPU removal
> operation through drmgr[2]. i.e "drmgr -c cpu -r -q 1"
>
> WARNING: CPU: 0 PID: 0 at kernel/sched/cpudeadline.c:219 cpudl_set+0x58/0x170
> NIP [c0000000002b6ed8] cpudl_set+0x58/0x170
> LR [c0000000002b7cb8] dl_server_timer+0x168/0x2a0
> Call Trace:
> [c000000002c2f8c0] init_stack+0x78c0/0x8000 (unreliable)
> [c0000000002b7cb8] dl_server_timer+0x168/0x2a0
> [c00000000034df84] __hrtimer_run_queues+0x1a4/0x390
> [c00000000034f624] hrtimer_interrupt+0x124/0x300
> [c00000000002a230] timer_interrupt+0x140/0x320
>
> Git bisects to: commit 4ae8d9aa9f9d ("sched/deadline: Fix dl_server getting stuck")
>
> This happens since:
> - dl_server hrtimer gets enqueued close to cpu offline, when
>    kthread_park enqueues a fair task.
> - CPU goes offline and drmgr removes it from cpu_present_mask.
> - hrtimer fires and warning is hit.
>
> Fix it by stopping the dl_server before CPU is marked dead.
>
> [1]: https://lore.kernel.org/all/8218e149-7718-4432-9312-f97297c352b9@linux.ibm.com/
> [2]: https://github.com/ibm-power-utilities/powerpc-utils/tree/next/src/drmgr
>
> [sshegde: wrote the changelog and tested it]
> Fixes: 4ae8d9aa9f9d ("sched/deadline: Fix dl_server getting stuck")
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
> Closes: https://lore.kernel.org/all/8218e149-7718-4432-9312-f97297c352b9@linux.ibm.com
Closes: 
https://lore.kernel.org/all/e56310b5-f7a9-4fad-b79a-dcbcdd3d3883@samsung.com/
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>   kernel/sched/core.c     | 2 ++
>   kernel/sched/deadline.c | 3 +++
>   2 files changed, 5 insertions(+)
>
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

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


