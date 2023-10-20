Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F0B37D0F6D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 14:11:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e9TqWrBe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBk3540Lkz3vXY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 23:11:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e9TqWrBe;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBk295hKxz3c3x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 23:10:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697803857;
	bh=/HckR+M1mxBNYCIWuwimSUGXw7EZ5xADrWwBDlURdXI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=e9TqWrBeU32SOvCoYR7IxqdQN/zg7cZc7Yz4gTolFOM7fIUw/D8/zdhaZCzpVEZg4
	 aNMXl97h8zHBltivT9j0huh6jW7pz1zSD3NO3Q3wr3hDwgItWhJyEMBwWB8RAZ9uI2
	 DhmM+HLmTMaBLcDV8PkvN5zrniWtLSdQI9mAtvxRhEUGUo9TO1op/Izln6pziPF7rr
	 Ed0Mehc99/BuVGephN1hR4YTZNR7blq+xHRqbPjrArhVc7XXyN+uvEam9gO384z5Vh
	 mb1RemZ3xLv4Wa6hvI/P/ODLK0+eQ63yNg/S8FMkSdOayYgfCzW/QFLmc7Wk7llV9j
	 gyEn1TkwOZ+gA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SBk273JJ4z4xM1;
	Fri, 20 Oct 2023 23:10:55 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/smp: Dynamically build powerpc topology
In-Reply-To: <20230830122614.73067-1-srikar@linux.vnet.ibm.com>
References: <20230830122614.73067-1-srikar@linux.vnet.ibm.com>
Date: Fri, 20 Oct 2023 23:10:55 +1100
Message-ID: <874jil5wa8.fsf@mail.lhotse>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Peter Zijlstra <peterz@infradead.org>, ndesaulniers@google.com, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> Currently there are four powerpc specific sched topologies.  These are
> all statically defined.  However not all these topologies are used by
> all powerpc systems.
>
> To avoid unnecessary degenerations by the scheduler , masks and flags
> are compared. However if the sched topologies are build dynamically then
> the code is simpler and there are greater chances of avoiding
> degenerations.
>
> Even x86 builds its sched topologies dynamically and new changes are
> very similar to the way x86 is building its topologies.
>
> System Configuration
> type=Shared mode=Uncapped smt=8 lcpu=128 mem=1063126592 kB cpus=96 ent=40.00
>
> $ lscpu
> Architecture:                    ppc64le
> Byte Order:                      Little Endian
> CPU(s):                          1024
> On-line CPU(s) list:             0-1023
> Model name:                      POWER10 (architected), altivec supported
> Model:                           2.0 (pvr 0080 0200)
> Thread(s) per core:              8
> Core(s) per socket:              32
> Socket(s):                       4
> Hypervisor vendor:               pHyp
> Virtualization type:             para
> L1d cache:                       8 MiB (256 instances)
> L1i cache:                       12 MiB (256 instances)
> NUMA node(s):                    4
>
> From dmesg of v6.5
> [    0.174444] smp: Bringing up secondary CPUs ...
> [    3.918535] smp: Brought up 4 nodes, 1024 CPUs
> [   38.001402] sysrq: Changing Loglevel
> [   38.001446] sysrq: Loglevel set to 9
>
> From dmesg of v6.5 + patch
> [    0.174462] smp: Bringing up secondary CPUs ...
> [    3.421462] smp: Brought up 4 nodes, 1024 CPUs
> [   35.417917] sysrq: Changing Loglevel
> [   35.417959] sysrq: Loglevel set to 9
>
> 5 runs of ppc64_cpu --smt=1 (time measured: lesser is better)
> Kernel  N  Min     Max     Median  Avg      Stddev     %Change
> v6.5    5  518.08  574.27  528.61  535.388  22.341542
> +patch  5  481.73  495.47  484.21  486.402  5.7997     -9.14963
>
> 5 runs of ppc64_cpu --smt=8 (time measured: lesser is better)
> Kernel  N  Min      Max      Median   Avg       Stddev     %Change
> v6.5    5  1094.12  1117.1   1108.97  1106.3    8.606361
> +patch  5  1067.5   1090.03  1073.89  1076.574  9.4189347  -2.68697
>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/smp.c | 78 ++++++++++++++-------------------------
>  1 file changed, 28 insertions(+), 50 deletions(-)
>
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 48b8161179a8..c16443a04c26 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -92,15 +92,6 @@ EXPORT_PER_CPU_SYMBOL(cpu_l2_cache_map);
>  EXPORT_PER_CPU_SYMBOL(cpu_core_map);
>  EXPORT_SYMBOL_GPL(has_big_cores);
>  
> -enum {
> -#ifdef CONFIG_SCHED_SMT
> -	smt_idx,
> -#endif
> -	cache_idx,
> -	mc_idx,
> -	die_idx,
> -};
> -
>  #define MAX_THREAD_LIST_SIZE	8
>  #define THREAD_GROUP_SHARE_L1   1
>  #define THREAD_GROUP_SHARE_L2_L3 2
> @@ -1048,16 +1039,6 @@ static const struct cpumask *cpu_mc_mask(int cpu)
>  	return cpu_coregroup_mask(cpu);
>  }
>  
> -static struct sched_domain_topology_level powerpc_topology[] = {
> -#ifdef CONFIG_SCHED_SMT
> -	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
> -#endif
> -	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
> -	{ cpu_mc_mask, powerpc_shared_proc_flags, SD_INIT_NAME(MC) },
> -	{ cpu_cpu_mask, powerpc_shared_proc_flags, SD_INIT_NAME(DIE) },
> -	{ NULL, },
> -};

This doesn't apply on my next or upstream.

It looks like it depends on your other 6-patch series. Please append
this patch to that series.

cheers
