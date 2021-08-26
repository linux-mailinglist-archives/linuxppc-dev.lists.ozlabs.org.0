Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADABA3F891E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 15:37:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwP6W059Xz3050
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 23:37:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Lu+J12iZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Lu+J12iZ; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwP5q67mNz2yJq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 23:37:03 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GwP5n50dRz9sXM;
 Thu, 26 Aug 2021 23:37:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629985022;
 bh=gi637oEY8yvyXlzJf0XX7PQkBjzwKF0FIbxFESPwAYA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Lu+J12iZRa6LzDfM60dDGP6Ndqb3g+tZLd4U3/LRDRxZ2GHg+PckTcJh+jAR4tSWL
 MY7jo+1DuH9lc5yTph3axDm1ricMfEj0wuB4vykkabBIOMk6vqJ/gT7Ymj2HRqADqK
 7TR2DgemE7DX35LvtNJFspIwnGFnj4AGjqDKCQGs/NF2iUME8unmjTfEsgq2mzFkw3
 lb80k2eYyBaaTMlmJiePt5jE7eR+0C70Ya56cu8lUg6zgLKbDLBEPNpDbscOoZBKLT
 9usFeolAEdYWyZGaUDhFYYymUDcAbyCnOfo761i7sPz2OqIZ3qu4iqmyu0pmL0vBgV
 JOCjgqO3TSVQQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 3/3] powerpc/numa: Fill distance_lookup_table for
 offline nodes
In-Reply-To: <20210821102535.169643-4-srikar@linux.vnet.ibm.com>
References: <20210821102535.169643-1-srikar@linux.vnet.ibm.com>
 <20210821102535.169643-4-srikar@linux.vnet.ibm.com>
Date: Thu, 26 Aug 2021 23:36:53 +1000
Message-ID: <875yvsba4q.fsf@mpe.ellerman.id.au>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Ingo Molnar <mingo@kernel.org>, Laurent Dufour <ldufour@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> Scheduler expects unique number of node distances to be available at
> boot.

I think it needs "the number of unique node distances" ?

> It uses node distance to calculate this unique node distances.

It iterates over all pairs of nodes and records node_distance() for that
pair, and then calculates the set of unique distances.

> On POWER, node distances for offline nodes is not available. However,
> POWER already knows unique possible node distances.

I think it would be more accurate to say PAPR rather than POWER there.
It's PAPR that defines the way we determine distances and imposes that
limitation.

> Fake the offline node's distance_lookup_table entries so that all
> possible node distances are updated.

Does this work if we have a single node offline at boot?

Say we start with:

node distances:
node   0   1
  0:  10  20
  1:  20  10

And node 2 is offline at boot. We can only initialise that nodes entries
in the distance_lookup_table:

		while (i--)
			distance_lookup_table[node][i] = node;

By filling them all with 2 that causes node_distance(2, X) to return the
maximum distance for all other nodes X, because we won't break out of
the loop in __node_distance():

	for (i = 0; i < distance_ref_points_depth; i++) {
		if (distance_lookup_table[a][i] == distance_lookup_table[b][i])
			break;

		/* Double the distance for each NUMA level */
		distance *= 2;
	}

If distance_ref_points_depth was 4 we'd return 160.

That'd leave us with 3 unique distances at boot, 10, 20, 160.

But when node 2 comes online it might introduce more than 1 new distance
value, eg. it could be that the actual distances are:

node distances:
node   0   1   2
  0:  10  20  40
  1:  20  10  80
  2:  40  80  10

ie. we now have 4 distances, 10, 20, 40, 80.

What am I missing?

> However this only needs to be done if the number of unique node
> distances that can be computed for online nodes is less than the
> number of possible unique node distances as represented by
> distance_ref_points_depth.

Looking at a few machines they all have distance_ref_points_depth = 2.

So maybe that explains it, in practice we only see 10, 20, 40.


> When the node is actually onlined, distance_lookup_table will be
> updated with actual entries.

> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> Cc: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
> Cc: Laurent Dufour <ldufour@linux.ibm.com>
> Cc: kernel test robot <lkp@intel.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>  arch/powerpc/mm/numa.c | 70 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
>
> Changelog:
> v1: https://lore.kernel.org/linuxppc-dev/20210701041552.112072-3-srikar@linux.vnet.ibm.com/t/#u
> [ Fixed a missing prototype warning Reported-by: kernel test robot <lkp@intel.com>]
>
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 3c124928a16d..0ee79a08c9e1 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -856,6 +856,75 @@ void __init dump_numa_cpu_topology(void)
>  	}
>  }
>  
> +/*
> + * Scheduler expects unique number of node distances to be available at
> + * boot. It uses node distance to calculate this unique node distances. On
> + * POWER, node distances for offline nodes is not available. However, POWER
> + * already knows unique possible node distances. Fake the offline node's
> + * distance_lookup_table entries so that all possible node distances are
> + * updated.
> + */

> +static void __init fake_update_distance_lookup_table(void)
> +{
> +	unsigned long distance_map;
> +	int i, nr_levels, nr_depth, node;

Are they distances, depths, or levels? :)

Bit more consistency in the variable names might make the code easier to
follow.

> +
> +	if (!numa_enabled)
> +		return;
> +
> +	if (!form1_affinity)
> +		return;

That doesn't exist since Aneesh's FORM2 series, so that will need a
rebase, and possibly some more rework to interact with that series.

> +	/*
> +	 * distance_ref_points_depth lists the unique numa domains
> +	 * available. However it ignore LOCAL_DISTANCE. So add +1
> +	 * to get the actual number of unique distances.
> +	 */
> +	nr_depth = distance_ref_points_depth + 1;

num_depths would be a better name IMHO.

> +
> +	WARN_ON(nr_depth > sizeof(distance_map));

Warn but then continue, and corrupt something on the stack? Seems like a
bad idea :)

I guess it's too early to use bitmap_alloc(). But can we at least return
if nr_depth is too big.

> +
> +	bitmap_zero(&distance_map, nr_depth);
> +	bitmap_set(&distance_map, 0, 1);
> +
> +	for_each_online_node(node) {
> +		int nd, distance = LOCAL_DISTANCE;
> +
> +		if (node == first_online_node)
> +			continue;
> +
> +		nd = __node_distance(node, first_online_node);
> +		for (i = 0; i < nr_depth; i++, distance *= 2) {

		for (i = 0, distance = LOCAL_DISTANCE; i < nr_depth; i++, distance *= 2) {

Could make it clearer what the for loop is doing I think.

> +			if (distance == nd) {
> +				bitmap_set(&distance_map, i, 1);
> +				break;
> +			}
> +		}
> +		nr_levels = bitmap_weight(&distance_map, nr_depth);
> +		if (nr_levels == nr_depth)
> +			return;
> +	}
> +
> +	for_each_node(node) {
> +		if (node_online(node))
> +			continue;
> +
> +		i = find_first_zero_bit(&distance_map, nr_depth);
> +		if (i >= nr_depth || i == 0) {

Neither of those can happen can they?

We checked the bitmap weight in the previous for loop, or at the bottom
of this one, and returned if we'd filled the map already.

And we set bit zero explicitly with bitmap_set().

> +			pr_warn("Levels(%d) not matching levels(%d)", nr_levels, nr_depth);
> +			return;
> +		}
> +
> +		bitmap_set(&distance_map, i, 1);
> +		while (i--)
> +			distance_lookup_table[node][i] = node;

That leaves distance_lookup_table[node][i+1] and so on uninitialised, or
initialised to zero because it's static, is that OK?

> +		nr_levels = bitmap_weight(&distance_map, nr_depth);
> +		if (nr_levels == nr_depth)
> +			return;
> +	}
> +}
> +
>  /* Initialize NODE_DATA for a node on the local memory */
>  static void __init setup_node_data(int nid, u64 start_pfn, u64 end_pfn)
>  {
> @@ -971,6 +1040,7 @@ void __init mem_topology_setup(void)
>  		 */
>  		numa_setup_cpu(cpu);
>  	}
> +	fake_update_distance_lookup_table();
>  }
>  
>  void __init initmem_init(void)


cheers
