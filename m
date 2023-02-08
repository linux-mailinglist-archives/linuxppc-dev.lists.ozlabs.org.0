Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B8668EE5D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 12:58:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBdnR5gdYz3f5q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 22:58:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=msyt9iJf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBdmX22Ymz3f4s
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 22:58:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=msyt9iJf;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PBdmV297Jz4xP9;
	Wed,  8 Feb 2023 22:58:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1675857482;
	bh=SWjk1pXjdmpn4qzwm4iH2hxmwnamiVa/ar8aNIUm1qQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=msyt9iJfjl/yCaGZF2INYOFGhuHc++OHX6SILrYkFAfTbYXnHm9EElzYKL4zwS/Z4
	 xax6Ma7dUm6TnzKINyTmbTyQ1gabBdILG+JuxORBCjOkeTaoB5O1C4ik2MoZskYyTY
	 j3U6iRbn9kxnn9j7APzMhTvcbeGbp9F4PnjKUMNP5Jp+V5rWAlqmZl3AGNkHFaEx/m
	 dKlveGpBwsgpxPeESO893IpENIhymw6gOWOWecVw8ESexPs/AfeqJkTWjb3guB+rhB
	 +4B0la6Jp5MMFM6HsfVzJCCPXWK2xJqlcUiaMq2QDu/fuYXGx3NeDMtqMI2zOIr47r
	 BTNS6YtHfHoIA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch via B4 Submission Endpoint
 <devnull+nathanl.linux.ibm.com@kernel.org>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Kajol
 Jain <kjain@linux.ibm.com>, Laurent Dufour <ldufour@linux.ibm.com>, Mahesh
 J Salgaonkar <mahesh@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 Nick Child <nnac123@linux.ibm.com>
Subject: Re: [PATCH v2 11/19] powerpc/rtas: add work area allocator
In-Reply-To: <20230125-b4-powerpc-rtas-queue-v2-11-9aa6bd058063@linux.ibm.com>
References: <20230125-b4-powerpc-rtas-queue-v2-0-9aa6bd058063@linux.ibm.com>
 <20230125-b4-powerpc-rtas-queue-v2-11-9aa6bd058063@linux.ibm.com>
Date: Wed, 08 Feb 2023 22:58:01 +1100
Message-ID: <87o7q4wera.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch via B4 Submission Endpoint
<devnull+nathanl.linux.ibm.com@kernel.org> writes:
> diff --git a/arch/powerpc/include/asm/rtas-work-area.h b/arch/powerpc/include/asm/rtas-work-area.h
> new file mode 100644
> index 000000000000..76ccb039cc37
> --- /dev/null
> +++ b/arch/powerpc/include/asm/rtas-work-area.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef POWERPC_RTAS_WORK_AREA_H
> +#define POWERPC_RTAS_WORK_AREA_H

The usual style would be _ASM_POWERPC_RTAS_WORK_AREA_H.

> diff --git a/arch/powerpc/kernel/rtas-work-area.c b/arch/powerpc/kernel/rtas-work-area.c
> new file mode 100644
> index 000000000000..75950e13a0fe
> --- /dev/null
> +++ b/arch/powerpc/kernel/rtas-work-area.c
> @@ -0,0 +1,208 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#define pr_fmt(fmt)	"rtas-work-area: " fmt
> +
> +#include <linux/genalloc.h>
> +#include <linux/log2.h>
> +#include <linux/kernel.h>
> +#include <linux/memblock.h>
> +#include <linux/mempool.h>
> +#include <linux/minmax.h>
> +#include <linux/mutex.h>
> +#include <linux/numa.h>
> +#include <linux/sizes.h>
> +#include <linux/wait.h>
> +
> +#include <asm/machdep.h>
> +#include <asm/rtas-work-area.h>
> +
> +enum {
> +	/*
> +	 * Ensure the pool is page-aligned.
> +	 */
> +	RTAS_WORK_AREA_ARENA_ALIGN = PAGE_SIZE,
> +
> +	RTAS_WORK_AREA_ARENA_SZ = SZ_256K,
> +	/*
> +	 * The smallest known work area size is for ibm,get-vpd's
> +	 * location code argument, which is limited to 79 characters
> +	 * plus 1 nul terminator.
> +	 *
> +	 * PAPR+ 7.3.20 ibm,get-vpd RTAS Call
> +	 * PAPR+ 12.3.2.4 Converged Location Code Rules - Length Restrictions
> +	 */
> +	RTAS_WORK_AREA_MIN_ALLOC_SZ = roundup_pow_of_two(80),
> +	/*
> +	 * Don't let a single allocation claim the whole arena.
> +	 */
> +	RTAS_WORK_AREA_MAX_ALLOC_SZ = RTAS_WORK_AREA_ARENA_SZ / 2,
> +};
> +
> +static struct rtas_work_area_allocator_state {
> +	struct gen_pool *gen_pool;
> +	char *arena;
> +	struct mutex mutex; /* serializes allocations */
> +	struct wait_queue_head wqh;
> +	mempool_t descriptor_pool;
> +	bool available;
> +} rwa_state_ = {
> +	.mutex = __MUTEX_INITIALIZER(rwa_state_.mutex),
> +	.wqh = __WAIT_QUEUE_HEAD_INITIALIZER(rwa_state_.wqh),
> +};
> +static struct rtas_work_area_allocator_state *rwa_state = &rwa_state_;

I assumed the pointer was so you could swap this out at runtime or
something, but I don't think you do.

Any reason not to drop the pointer and just use rwa_state.foo accessors?
That would also allow the struct to be anonymous.

Or if you have the pointer you can at least make it NULL prior to init
and avoid the need for "available".

> +/*
> + * A single work area buffer and descriptor to serve requests early in
> + * boot before the allocator is fully initialized.
> + */
> +static bool early_work_area_in_use __initdata;
> +static char early_work_area_buf[SZ_4K] __initdata;

That should be page aligned I think?


> +static struct rtas_work_area early_work_area __initdata = {
> +	.buf = early_work_area_buf,
> +	.size = sizeof(early_work_area_buf),
> +};
> +
> +
> +static struct rtas_work_area * __init rtas_work_area_alloc_early(size_t size)
> +{
> +	WARN_ON(size > early_work_area.size);
> +	WARN_ON(early_work_area_in_use);
> +	early_work_area_in_use = true;
> +	memset(early_work_area.buf, 0, early_work_area.size);
> +	return &early_work_area;
> +}
> +
> +static void __init rtas_work_area_free_early(struct rtas_work_area *work_area)
> +{
> +	WARN_ON(work_area != &early_work_area);
> +	WARN_ON(!early_work_area_in_use);
> +	early_work_area_in_use = false;
> +}
> +
> +struct rtas_work_area * __ref rtas_work_area_alloc(size_t size)
> +{
> +	struct rtas_work_area *area;
> +	unsigned long addr;
> +
> +	might_sleep();
> +
> +	WARN_ON(size > RTAS_WORK_AREA_MAX_ALLOC_SZ);
> +	size = min_t(size_t, size, RTAS_WORK_AREA_MAX_ALLOC_SZ);

This seems unsafe.

If you return a buffer smaller than the caller asks for they're likely
to read/write past the end of it and corrupt memory.

AFAIK genalloc doesn't have guard pages or anything fancy to save us
from that - but maybe I'm wrong, I've never used it.

There's only three callers in the end, seems like we should just return
NULL if the size is too large and have callers check the return value.

> +	if (!rwa_state->available) {
> +		area = rtas_work_area_alloc_early(size);
> +		goto out;
> +	}
> +
> +	/*
> +	 * To ensure FCFS behavior and prevent a high rate of smaller
> +	 * requests from starving larger ones, use the mutex to queue
> +	 * allocations.
> +	 */
> +	mutex_lock(&rwa_state->mutex);
> +	wait_event(rwa_state->wqh,
> +		   (addr = gen_pool_alloc(rwa_state->gen_pool, size)) != 0);
> +	mutex_unlock(&rwa_state->mutex);
> +
> +	area = mempool_alloc(&rwa_state->descriptor_pool, GFP_KERNEL);
> +	*area = (typeof(*area)){
> +		.size = size,
> +		.buf = (char *)addr,
> +	};

That is an odd way to write that :)

> +out:
> +	pr_devel("%ps -> %s() -> buf=%p size=%zu\n",
> +		 (void *)_RET_IP_, __func__, area->buf, area->size);

Can we drop those? They need a recompile to enable, so if someone needs
debugging they can just rewrite them - or use some sort of tracing instead.

> +	return area;
> +}
> +
> +void __ref rtas_work_area_free(struct rtas_work_area *area)
> +{
> +	pr_devel("%ps -> %s() -> buf=%p size=%zu\n",
> +		 (void *)_RET_IP_, __func__, area->buf, area->size);

Ditto.
 
> +	if (!rwa_state->available) {
> +		rtas_work_area_free_early(area);
> +		return;
> +	}
> +
> +	gen_pool_free(rwa_state->gen_pool, (unsigned long)area->buf, area->size);
> +	mempool_free(area, &rwa_state->descriptor_pool);
> +	wake_up(&rwa_state->wqh);
> +}
> +
> +/*
> + * Initialization of the work area allocator happens in two parts. To
> + * reliably reserve an arena that satisfies RTAS addressing
> + * requirements, we must perform a memblock allocation early,
> + * immmediately after RTAS instantiation. Then we have to wait until
> + * the slab allocator is up before setting up the descriptor mempool
> + * and adding the arena to a gen_pool.
> + */
> +static __init int rtas_work_area_allocator_init(void)
> +{
> +	const unsigned int order = ilog2(RTAS_WORK_AREA_MIN_ALLOC_SZ);
> +	const phys_addr_t pa_start = __pa(rwa_state->arena);
> +	const phys_addr_t pa_end = pa_start + RTAS_WORK_AREA_ARENA_SZ - 1;
> +	struct gen_pool *pool;
> +	const int nid = NUMA_NO_NODE;
> +	int err;
> +
> +	err = -ENOMEM;
> +	if (!rwa_state->arena)
> +		goto err_out;
> +
> +	pool = gen_pool_create(order, nid);
> +	if (!pool)
> +		goto err_out;
> +	/*
> +	 * All RTAS functions that consume work areas are OK with
> +	 * natural alignment, when they have alignment requirements at
> +	 * all.
> +	 */
> +	gen_pool_set_algo(pool, gen_pool_first_fit_order_align, NULL);
> +
> +	err = gen_pool_add(pool, (unsigned long)rwa_state->arena,
> +			   RTAS_WORK_AREA_ARENA_SZ, nid);
> +	if (err)
> +		goto err_destroy;
> +
> +	err = mempool_init_kmalloc_pool(&rwa_state->descriptor_pool, 1,
> +					sizeof(struct rtas_work_area));
> +	if (err)
> +		goto err_destroy;
> +
> +	rwa_state->gen_pool = pool;
> +	rwa_state->available = true;
> +
> +	pr_debug("arena [%pa-%pa] (%uK), min/max alloc sizes %u/%u\n",
> +		 &pa_start, &pa_end,
> +		 RTAS_WORK_AREA_ARENA_SZ / SZ_1K,
> +		 RTAS_WORK_AREA_MIN_ALLOC_SZ,
> +		 RTAS_WORK_AREA_MAX_ALLOC_SZ);
> +
> +	return 0;
> +
> +err_destroy:
> +	gen_pool_destroy(pool);
> +err_out:
> +	return err;
> +}
> +machine_arch_initcall(pseries, rtas_work_area_allocator_init);

Should it live in platforms/pseries then?

> +/**
> + * rtas_work_area_reserve_arena() - reserve memory suitable for RTAS work areas.
> + */
> +int __init rtas_work_area_reserve_arena(const phys_addr_t limit)
> +{
> +	const phys_addr_t align = RTAS_WORK_AREA_ARENA_ALIGN;
> +	const phys_addr_t size = RTAS_WORK_AREA_ARENA_SZ;
> +	const phys_addr_t min = MEMBLOCK_LOW_LIMIT;
> +	const int nid = NUMA_NO_NODE;

This should probably also be restricted to pseries?


cheers
