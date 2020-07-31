Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9D92340C3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 10:04:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BJ0DM5hJjzDqcQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 18:04:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BJ0B84FLdzDqJs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 18:02:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pPeyl5/N; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BJ0B64wr3z9sTM;
 Fri, 31 Jul 2020 18:02:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596182544;
 bh=VIvlFmLeEbazI6X4NrR2A4yECMiZVAa1vCybgh1Mduk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pPeyl5/NlC4K+MRg9yrpan6haPOfQboM84UFywQ+27jiRB4Must46goJhWYfneqsu
 1XXxWssioctiie7J4pqqq0j82L9DowqWmz/t5CPrb04JcnDIB8+MYnCSISCaX21r7k
 u0f8C5XhEMU79kJe5jmL2nHyQhxBumAeP01uS22XlMe6bvgDDHBgUidQhfXSV/KSPF
 9Wy8MWamdDLnJ6rQ0ioFp+OyTSVYKlmmCtUaliXRwX4vX35GGhe904HqzGmXuYeTSZ
 LIsPpgbPzfc+9O6W5OdjiOM5lL8D++64sV6bPTGp3qeOYvcGW/o4f01d+qd4iZlNQw
 lA8SX9b6z+spw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v4 10/10] powerpc/smp: Implement cpu_to_coregroup_id
In-Reply-To: <20200727053230.19753-11-srikar@linux.vnet.ibm.com>
References: <20200727053230.19753-1-srikar@linux.vnet.ibm.com>
 <20200727053230.19753-11-srikar@linux.vnet.ibm.com>
Date: Fri, 31 Jul 2020 18:02:21 +1000
Message-ID: <87wo2k3yeq.fsf@mpe.ellerman.id.au>
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
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> Lookup the coregroup id from the associativity array.

It's slightly strange that this is called in patch 9, but only properly
implemented here in patch 10.

I'm not saying you have to squash them together, but it would be good if
the change log for patch 9 mentioned that a subsequent commit will
complete the implementation and how that affects the behaviour.

cheers

> If unable to detect the coregroup id, fallback on the core id.
> This way, ensure sched_domain degenerates and an extra sched domain is
> not created.
>
> Ideally this function should have been implemented in
> arch/powerpc/kernel/smp.c. However if its implemented in mm/numa.c, we
> don't need to find the primary domain again.
>
> If the device-tree mentions more than one coregroup, then kernel
> implements only the last or the smallest coregroup, which currently
> corresponds to the penultimate domain in the device-tree.
>
> Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
> Cc: LKML <linux-kernel@vger.kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Anton Blanchard <anton@ozlabs.org>
> Cc: Oliver O'Halloran <oohall@gmail.com>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Michael Neuling <mikey@neuling.org>
> Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: Jordan Niethe <jniethe5@gmail.com>
> Reviewed-by : Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
> Changelog v1 -> v2:
> 	Move coregroup_enabled before getting associativity (Gautham)
>
>  arch/powerpc/mm/numa.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 0d57779e7942..8b3b3ec7fcc4 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -1218,6 +1218,26 @@ int find_and_online_cpu_nid(int cpu)
>  
>  int cpu_to_coregroup_id(int cpu)
>  {
> +	__be32 associativity[VPHN_ASSOC_BUFSIZE] = {0};
> +	int index;
> +
> +	if (cpu < 0 || cpu > nr_cpu_ids)
> +		return -1;
> +
> +	if (!coregroup_enabled)
> +		goto out;
> +
> +	if (!firmware_has_feature(FW_FEATURE_VPHN))
> +		goto out;
> +
> +	if (vphn_get_associativity(cpu, associativity))
> +		goto out;
> +
> +	index = of_read_number(associativity, 1);
> +	if (index > min_common_depth + 1)
> +		return of_read_number(&associativity[index - 1], 1);
> +
> +out:
>  	return cpu_to_core_id(cpu);
>  }
>  
> -- 
> 2.17.1
