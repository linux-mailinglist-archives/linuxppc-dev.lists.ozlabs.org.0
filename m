Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2703DB46DB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 07:30:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XWsk4jCszF49r
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 15:30:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XWqd13j9zF12S
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 15:28:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="JHFW7Vzd"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46XWqS6K4Cz9sNk;
 Tue, 17 Sep 2019 15:28:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1568698124;
 bh=aN50ZIFwgnpq9UgwoGTeDmA66UxmOVUz1V+DPk07KSI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=JHFW7VzdOKGRMHcwPORPAFQRFQb9GgzjT3rqUdIhBrBak5TUzrKz7LvSJicBdUnSz
 +lTsuCsim1mkACJ7AnCkM3JD4r9z1eoWvw2qLbgmHYzSrLSheAIhT7G4tZcnTgFn4y
 Ot+r9Nvb74/peELR+d97R8N9wzEC72TFiDhOiLr8RbNIynB9xprM7lkiJlgjh4aFz+
 ZR+I9qdp9kFj78/sznBtRl2z7btdTYvD8YFCgU5uS6aG0hmf2fN+JPU15Bd0ur9PrB
 x98MOiDFHpwDEbLVm1DR4pLTEF8XPBSWCP3kuYFEaWRI1DexcVcDeSXFCHTjYsTiix
 z7xt1QlKubw/Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Yunsheng Lin <linyunsheng@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, mingo@redhat.com, bp@alien8.de, rth@twiddle.net,
 ink@jurassic.park.msu.ru, mattst88@gmail.com, benh@kernel.crashing.org,
 paulus@samba.org, heiko.carstens@de.ibm.com, gor@linux.ibm.com,
 borntraeger@de.ibm.com, ysato@users.sourceforge.jp, dalias@libc.org,
 davem@davemloft.net, ralf@linux-mips.org, paul.burton@mips.com,
 jhogan@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com
Subject: Re: [PATCH v5] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
In-Reply-To: <1568640481-133352-1-git-send-email-linyunsheng@huawei.com>
References: <1568640481-133352-1-git-send-email-linyunsheng@huawei.com>
Date: Tue, 17 Sep 2019 15:28:32 +1000
Message-ID: <87pnjzsd8f.fsf@mpe.ellerman.id.au>
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
Cc: linux-sh@vger.kernel.org, peterz@infradead.org, dave.hansen@linux.intel.com,
 linux-mips@vger.kernel.org, mwb@linux.vnet.ibm.com, hpa@zytor.com,
 sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 rppt@linux.ibm.com, dledford@redhat.com, jeffrey.t.kirsher@intel.com,
 naveen.n.rao@linux.vnet.ibm.com, len.brown@intel.com,
 anshuman.khandual@arm.com, gregkh@linuxfoundation.org, cai@lca.pw,
 luto@kernel.org, tglx@linutronix.de, mhocko@kernel.org,
 linux-arm-kernel@lists.infradead.org, axboe@kernel.dk, robin.murphy@arm.com,
 linux-kernel@vger.kernel.org, tbogendoerfer@suse.de,
 linux-alpha@vger.kernel.org, rafael@kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Yunsheng Lin <linyunsheng@huawei.com> writes:
> When passing the return value of dev_to_node() to cpumask_of_node()
> without checking if the device's node id is NUMA_NO_NODE, there is
> global-out-of-bounds detected by KASAN.
>
> From the discussion [1], NUMA_NO_NODE really means no node affinity,
> which also means all cpus should be usable. So the cpumask_of_node()
> should always return all cpus online when user passes the node id as
> NUMA_NO_NODE, just like similar semantic that page allocator handles
> NUMA_NO_NODE.
>
> But we cannot really copy the page allocator logic. Simply because the
> page allocator doesn't enforce the near node affinity. It just picks it
> up as a preferred node but then it is free to fallback to any other numa
> node. This is not the case here and node_to_cpumask_map will only restrict
> to the particular node's cpus which would have really non deterministic
> behavior depending on where the code is executed. So in fact we really
> want to return cpu_online_mask for NUMA_NO_NODE.
>
> Some arches were already NUMA_NO_NODE aware, but they return cpu_all_mask,
> which should be identical with cpu_online_mask when those arches do not
> support cpu hotplug, this patch also changes them to return cpu_online_mask
> in order to be consistent and use NUMA_NO_NODE instead of "-1".

Except some of those arches *do* support CPU hotplug, powerpc and sparc
at least. So switching from cpu_all_mask to cpu_online_mask is a
meaningful change.

That doesn't mean it's wrong, but you need to explain why it's the right
change.


> Also there is a debugging version of node_to_cpumask_map() for x86 and
> arm64, which is only used when CONFIG_DEBUG_PER_CPU_MAPS is defined, this
> patch changes it to handle NUMA_NO_NODE as normal node_to_cpumask_map().
>
> [1] https://lore.kernel.org/patchwork/patch/1125789/
> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
> Suggested-by: Michal Hocko <mhocko@kernel.org>
> Acked-by: Michal Hocko <mhocko@suse.com>
> ---
> V5: Drop unsigned "fix" change for x86/arm64, and change comment log
>     according to Michal's comment.
> V4: Have all these changes in a single patch.

This makes it much harder to get the patch merged, you basically have to
get Andrew Morton to merge it now. Sending individual patches for each
arch means each arch maintainer can merge them separately.

cheers

> V3: Change to only handle NUMA_NO_NODE, and return cpu_online_mask
>     for NUMA_NO_NODE case, and change the commit log to better justify
>     the change.
> V2: make the node id checking change to other arches too.
> ---
>  arch/alpha/include/asm/topology.h                | 2 +-
>  arch/arm64/include/asm/numa.h                    | 3 +++
>  arch/arm64/mm/numa.c                             | 3 +++
>  arch/mips/include/asm/mach-ip27/topology.h       | 4 ++--
>  arch/mips/include/asm/mach-loongson64/topology.h | 4 +++-
>  arch/powerpc/include/asm/topology.h              | 6 +++---
>  arch/s390/include/asm/topology.h                 | 3 +++
>  arch/sparc/include/asm/topology_64.h             | 6 +++---
>  arch/x86/include/asm/topology.h                  | 3 +++
>  arch/x86/mm/numa.c                               | 3 +++
>  10 files changed, 27 insertions(+), 10 deletions(-)
>
> diff --git a/arch/alpha/include/asm/topology.h b/arch/alpha/include/asm/topology.h
> index 5a77a40..836c9e2 100644
> --- a/arch/alpha/include/asm/topology.h
> +++ b/arch/alpha/include/asm/topology.h
> @@ -31,7 +31,7 @@ static const struct cpumask *cpumask_of_node(int node)
>  	int cpu;
>  
>  	if (node == NUMA_NO_NODE)
> -		return cpu_all_mask;
> +		return cpu_online_mask;
>  
>  	cpumask_clear(&node_to_cpumask_map[node]);
>  
> diff --git a/arch/arm64/include/asm/numa.h b/arch/arm64/include/asm/numa.h
> index 626ad01..c8a4b31 100644
> --- a/arch/arm64/include/asm/numa.h
> +++ b/arch/arm64/include/asm/numa.h
> @@ -25,6 +25,9 @@ const struct cpumask *cpumask_of_node(int node);
>  /* Returns a pointer to the cpumask of CPUs on Node 'node'. */
>  static inline const struct cpumask *cpumask_of_node(int node)
>  {
> +	if (node == NUMA_NO_NODE)
> +		return cpu_online_mask;
> +
>  	return node_to_cpumask_map[node];
>  }
>  #endif
> diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
> index 4f241cc..f57202d 100644
> --- a/arch/arm64/mm/numa.c
> +++ b/arch/arm64/mm/numa.c
> @@ -46,6 +46,9 @@ EXPORT_SYMBOL(node_to_cpumask_map);
>   */
>  const struct cpumask *cpumask_of_node(int node)
>  {
> +	if (node == NUMA_NO_NODE)
> +		return cpu_online_mask;
> +
>  	if (WARN_ON(node >= nr_node_ids))
>  		return cpu_none_mask;
>  
> diff --git a/arch/mips/include/asm/mach-ip27/topology.h b/arch/mips/include/asm/mach-ip27/topology.h
> index 965f079..04505e6 100644
> --- a/arch/mips/include/asm/mach-ip27/topology.h
> +++ b/arch/mips/include/asm/mach-ip27/topology.h
> @@ -15,8 +15,8 @@ struct cpuinfo_ip27 {
>  extern struct cpuinfo_ip27 sn_cpu_info[NR_CPUS];
>  
>  #define cpu_to_node(cpu)	(sn_cpu_info[(cpu)].p_nodeid)
> -#define cpumask_of_node(node)	((node) == -1 ?				\
> -				 cpu_all_mask :				\
> +#define cpumask_of_node(node)	((node) == NUMA_NO_NODE ?		\
> +				 cpu_online_mask :			\
>  				 &hub_data(node)->h_cpus)
>  struct pci_bus;
>  extern int pcibus_to_node(struct pci_bus *);
> diff --git a/arch/mips/include/asm/mach-loongson64/topology.h b/arch/mips/include/asm/mach-loongson64/topology.h
> index 7ff819a..e78daa6 100644
> --- a/arch/mips/include/asm/mach-loongson64/topology.h
> +++ b/arch/mips/include/asm/mach-loongson64/topology.h
> @@ -5,7 +5,9 @@
>  #ifdef CONFIG_NUMA
>  
>  #define cpu_to_node(cpu)	(cpu_logical_map(cpu) >> 2)
> -#define cpumask_of_node(node)	(&__node_data[(node)]->cpumask)
> +#define cpumask_of_node(node)	((node) == NUMA_NO_NODE ?		\
> +				 cpu_online_mask :			\
> +				 &__node_data[(node)]->cpumask)
>  
>  struct pci_bus;
>  extern int pcibus_to_node(struct pci_bus *);
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index 2f7e1ea..309f847 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -17,9 +17,9 @@ struct device_node;
>  
>  #include <asm/mmzone.h>
>  
> -#define cpumask_of_node(node) ((node) == -1 ?				\
> -			       cpu_all_mask :				\
> -			       node_to_cpumask_map[node])
> +#define cpumask_of_node(node)	((node) == NUMA_NO_NODE ?		\
> +				 cpu_online_mask :			\
> +				 node_to_cpumask_map[node])
>  
>  struct pci_bus;
>  #ifdef CONFIG_PCI
> diff --git a/arch/s390/include/asm/topology.h b/arch/s390/include/asm/topology.h
> index cca406f..1bd2e73 100644
> --- a/arch/s390/include/asm/topology.h
> +++ b/arch/s390/include/asm/topology.h
> @@ -78,6 +78,9 @@ static inline int cpu_to_node(int cpu)
>  #define cpumask_of_node cpumask_of_node
>  static inline const struct cpumask *cpumask_of_node(int node)
>  {
> +	if (node == NUMA_NO_NODE)
> +		return cpu_online_mask;
> +
>  	return &node_to_cpumask_map[node];
>  }
>  
> diff --git a/arch/sparc/include/asm/topology_64.h b/arch/sparc/include/asm/topology_64.h
> index 34c628a..8c29357 100644
> --- a/arch/sparc/include/asm/topology_64.h
> +++ b/arch/sparc/include/asm/topology_64.h
> @@ -11,9 +11,9 @@ static inline int cpu_to_node(int cpu)
>  	return numa_cpu_lookup_table[cpu];
>  }
>  
> -#define cpumask_of_node(node) ((node) == -1 ?				\
> -			       cpu_all_mask :				\
> -			       &numa_cpumask_lookup_table[node])
> +#define cpumask_of_node(node)	((node) == NUMA_NO_NODE ?		\
> +				 cpu_online_mask :			\
> +				 &numa_cpumask_lookup_table[node])
>  
>  struct pci_bus;
>  #ifdef CONFIG_PCI
> diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
> index 4b14d23..7fa82e1 100644
> --- a/arch/x86/include/asm/topology.h
> +++ b/arch/x86/include/asm/topology.h
> @@ -69,6 +69,9 @@ extern const struct cpumask *cpumask_of_node(int node);
>  /* Returns a pointer to the cpumask of CPUs on Node 'node'. */
>  static inline const struct cpumask *cpumask_of_node(int node)
>  {
> +	if (node == NUMA_NO_NODE)
> +		return cpu_online_mask;
> +
>  	return node_to_cpumask_map[node];
>  }
>  #endif
> diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
> index e6dad60..84b28ef 100644
> --- a/arch/x86/mm/numa.c
> +++ b/arch/x86/mm/numa.c
> @@ -861,6 +861,9 @@ void numa_remove_cpu(int cpu)
>   */
>  const struct cpumask *cpumask_of_node(int node)
>  {
> +	if (node == NUMA_NO_NODE)
> +		return cpu_online_mask;
> +
>  	if (node >= nr_node_ids) {
>  		printk(KERN_WARNING
>  			"cpumask_of_node(%d): node > nr_node_ids(%u)\n",
> -- 
> 2.8.1
