Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3577139135
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 13:44:47 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xCwB5X9dzDqLh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 23:44:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xCqV4FDnzDqJ3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 23:40:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=iLyhMRJO; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47xCqV1GvFz9sS3;
 Mon, 13 Jan 2020 23:40:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1578919238;
 bh=BeCTTENuA6Ry5iPRQA86/ZoWJkKG2p30hjyTYtCPTDo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=iLyhMRJOgQuA6cAfS3kX+lI5n2uODzdJBnIqVKIv7KmWcU77TQCtFC3fDyDCURqpm
 aQ9VIkDKSiOduioreWN9qoEFYi9celMUH+TjNUMN1X556etGyoCpLT5+Gw8+7YDjdq
 9B6JfKlvQzHO6fOFvfp2Xsb1QsKjYyzoWgJ9SewS71KnX0qj3KKAO4Q5lwBrg7utw4
 ThxBYpx+b1vD27s2PSnRFqlciDUO1vsqS6ZREvxF6MxGSvaJnL44ZiRidv/jKvY2PS
 NglIUxOotuBT+gI48JgLYhEQzgkssW85MXdsqKxKmTOqJHaJ0eGepjcdq3Eaj+D1q9
 ppPSz13nZybpg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v3] powerpc/smp: Use nid as fallback for package_id
In-Reply-To: <20191216142119.5937-1-srikar@linux.vnet.ibm.com>
References: <20191216142119.5937-1-srikar@linux.vnet.ibm.com>
Date: Mon, 13 Jan 2020 23:40:41 +1100
Message-ID: <87zher7cmu.fsf@mpe.ellerman.id.au>
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
Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Srikar,

Still some comments sorry ...

Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> Package_id is to find out all cores that are part of the same chip. On
> PowerNV machines, package_id defaults to chip_id. However ibm,chip_id
> property is not present in device-tree of PowerVM Lpars. Hence lscpu
> output shows one core per socket and multiple cores.
>
> To overcome this, use nid as the package_id on PowerVM Lpars.
>
> Before the patch.
> ---------------
> Architecture:        ppc64le
> Byte Order:          Little Endian
> CPU(s):              128
> On-line CPU(s) list: 0-127
> Thread(s) per core:  8
> Core(s) per socket:  1                           <----------------------
> Socket(s):           16                          <----------------------
> NUMA node(s):        2
> Model:               2.2 (pvr 004e 0202)
> Model name:          POWER9 (architected), altivec supported
> Hypervisor vendor:   pHyp
> Virtualization type: para
> L1d cache:           32K
> L1i cache:           32K
> L2 cache:            512K
> L3 cache:            10240K
> NUMA node0 CPU(s):   0-63
> NUMA node1 CPU(s):   64-127
>  #
>  # cat /sys/devices/system/cpu/cpu0/topology/physical_package_id
>  -1
>  #
>
> After the patch
> ---------------
> Architecture:        ppc64le
> Byte Order:          Little Endian
> CPU(s):              128
> On-line CPU(s) list: 0-127
> Thread(s) per core:  8			<------------------------------
> Core(s) per socket:  8			<------------------------------
> Socket(s):           2
> NUMA node(s):        2
> Model:               2.2 (pvr 004e 0202)
> Model name:          POWER9 (architected), altivec supported
> Hypervisor vendor:   pHyp
> Virtualization type: para
> L1d cache:           32K
> L1i cache:           32K
> L2 cache:            512K
> L3 cache:            10240K
> NUMA node0 CPU(s):   0-63
> NUMA node1 CPU(s):   64-127
>  #
>  # cat /sys/devices/system/cpu/cpu0/topology/physical_package_id
>  0
>  #
> Now lscpu output is more in line with the system configuration.
>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
> Cc: Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>
> ---
> Changelog from v2: https://patchwork.ozlabs.org/patch/1151649
> - Rebased to v5.5-rc2
> - Renamed the new function to cpu_to_nid
> - Removed checks to fadump property. (Looked too excessive)
> - Moved pseries specific code to pseries/lpar.c
>
> Changelog from v1: https://patchwork.ozlabs.org/patch/1126145
> - In v1 cpu_to_chip_id was overloaded to fallback on nid.  Michael
>   Ellerman wasn't comfortable with nid being shown up as chip_id.
>
>  arch/powerpc/include/asm/topology.h   |  7 ++++++-
>  arch/powerpc/kernel/smp.c             |  6 +++---
>  arch/powerpc/platforms/pseries/lpar.c | 22 ++++++++++++++++++++++
>  3 files changed, 31 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index 2f7e1ea5089e..7422ef913c75 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -130,11 +130,16 @@ static inline void shared_proc_topology_init(void) {}
>  
>  #ifdef CONFIG_SMP
>  #include <asm/cputable.h>
> +#ifdef CONFIG_PPC_SPLPAR
> +int cpu_to_nid(int);
> +#else
> +#define cpu_to_nid(cpu)		cpu_to_chip_id(cpu)
> +#endif

We already have cpu_to_node(), which returns the numa node (nid) for a
given CPU, so I think introducing a new accessor with an almost
identical name is going to cause confusion. ie. when should code use
cpu_to_node() and when should it use cpu_to_nid()?

>  #ifdef CONFIG_PPC64
>  #include <asm/smp.h>
>  
> -#define topology_physical_package_id(cpu)	(cpu_to_chip_id(cpu))
> +#define topology_physical_package_id(cpu)	(cpu_to_nid(cpu))

I think you should be overriding topology_physical_package_id() instead
of introducing cpu_to_nid().

>  #define topology_sibling_cpumask(cpu)	(per_cpu(cpu_sibling_map, cpu))
>  #define topology_core_cpumask(cpu)	(per_cpu(cpu_core_map, cpu))
>  #define topology_core_id(cpu)		(cpu_to_core_id(cpu))
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index ea6adbf6a221..b0c1438d8d9a 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1188,7 +1188,7 @@ static inline void add_cpu_to_smallcore_masks(int cpu)
>  static void add_cpu_to_masks(int cpu)
>  {
>  	int first_thread = cpu_first_thread_sibling(cpu);
> -	int chipid = cpu_to_chip_id(cpu);
> +	int nid = cpu_to_nid(cpu);

And here you should be using topology_physical_package_id(), rather than
cpu_to_nid() directly.

>  	int i;
>  
>  	/*
> @@ -1217,11 +1217,11 @@ static void add_cpu_to_masks(int cpu)
>  	for_each_cpu(i, cpu_l2_cache_mask(cpu))
>  		set_cpus_related(cpu, i, cpu_core_mask);
>  
> -	if (chipid == -1)
> +	if (nid == -1)
>  		return;
>  
>  	for_each_cpu(i, cpu_online_mask)
> -		if (cpu_to_chip_id(i) == chipid)
> +		if (cpu_to_nid(i) == nid)
>  			set_cpus_related(cpu, i, cpu_core_mask);
>  }
>  
> diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
> index 60cb29ae4739..99583b9f00e4 100644
> --- a/arch/powerpc/platforms/pseries/lpar.c
> +++ b/arch/powerpc/platforms/pseries/lpar.c
> @@ -650,6 +650,28 @@ static int __init vcpudispatch_stats_procfs_init(void)

I think this function should actually be in smp.c or numa.c

That's because it will be called on non-pseries platforms when we build
a multi platform kernel (pseries & powernv). So it's not really pseries
specific code.

>  }
>  
>  machine_device_initcall(pseries, vcpudispatch_stats_procfs_init);
> +
> +int cpu_to_nid(cpu)
> +{
> +	int nid = cpu_to_chip_id(cpu);
> +
> +	/*
> +	 * If the platform is PowerNV or Guest on KVM, ibm,chip-id is
> +	 * defined. Hence we would return the chip-id as the
> +	 * cpu_to_nid.
> +	 */
> +	if (nid == -1 && firmware_has_feature(FW_FEATURE_LPAR)) {
> +		struct device_node *np = of_get_cpu_node(cpu, NULL);
> +
> +		if (np) {
> +			nid = of_node_to_nid(np);
> +			of_node_put(np);
> +		}
> +	}
> +	return nid;
> +}
> +EXPORT_SYMBOL(cpu_to_nid);

Should be GPL.


cheers
