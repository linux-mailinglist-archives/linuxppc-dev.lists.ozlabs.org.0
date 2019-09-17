Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC07B475C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 08:22:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XY1L25TqzF441
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 16:22:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=linyunsheng@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XXzC4HBMzF3fn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 16:20:21 +1000 (AEST)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 843776B7F0E73A559E86;
 Tue, 17 Sep 2019 14:20:15 +0800 (CST)
Received: from [127.0.0.1] (10.74.191.121) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Tue, 17 Sep 2019
 14:20:11 +0800
Subject: Re: [PATCH v5] numa: make node_to_cpumask_map() NUMA_NO_NODE aware
To: Michael Ellerman <mpe@ellerman.id.au>, <catalin.marinas@arm.com>,
 <will@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>, <rth@twiddle.net>,
 <ink@jurassic.park.msu.ru>, <mattst88@gmail.com>, <benh@kernel.crashing.org>, 
 <paulus@samba.org>, <heiko.carstens@de.ibm.com>, <gor@linux.ibm.com>,
 <borntraeger@de.ibm.com>, <ysato@users.sourceforge.jp>, <dalias@libc.org>,
 <davem@davemloft.net>, <ralf@linux-mips.org>, <paul.burton@mips.com>,
 <jhogan@kernel.org>, <jiaxun.yang@flygoat.com>, <chenhc@lemote.com>
References: <1568640481-133352-1-git-send-email-linyunsheng@huawei.com>
 <87pnjzsd8f.fsf@mpe.ellerman.id.au>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <d748aae4-4d48-6f8a-2f6d-67fad5224ba9@huawei.com>
Date: Tue, 17 Sep 2019 14:20:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <87pnjzsd8f.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.74.191.121]
X-CFilter-Loop: Reflected
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

On 2019/9/17 13:28, Michael Ellerman wrote:
> Yunsheng Lin <linyunsheng@huawei.com> writes:
>> When passing the return value of dev_to_node() to cpumask_of_node()
>> without checking if the device's node id is NUMA_NO_NODE, there is
>> global-out-of-bounds detected by KASAN.
>>
>> From the discussion [1], NUMA_NO_NODE really means no node affinity,
>> which also means all cpus should be usable. So the cpumask_of_node()
>> should always return all cpus online when user passes the node id as
>> NUMA_NO_NODE, just like similar semantic that page allocator handles
>> NUMA_NO_NODE.
>>
>> But we cannot really copy the page allocator logic. Simply because the
>> page allocator doesn't enforce the near node affinity. It just picks it
>> up as a preferred node but then it is free to fallback to any other numa
>> node. This is not the case here and node_to_cpumask_map will only restrict
>> to the particular node's cpus which would have really non deterministic
>> behavior depending on where the code is executed. So in fact we really
>> want to return cpu_online_mask for NUMA_NO_NODE.
>>
>> Some arches were already NUMA_NO_NODE aware, but they return cpu_all_mask,
>> which should be identical with cpu_online_mask when those arches do not
>> support cpu hotplug, this patch also changes them to return cpu_online_mask
>> in order to be consistent and use NUMA_NO_NODE instead of "-1".
> 
> Except some of those arches *do* support CPU hotplug, powerpc and sparc
> at least. So switching from cpu_all_mask to cpu_online_mask is a
> meaningful change.

Yes, thanks for pointing out.

> 
> That doesn't mean it's wrong, but you need to explain why it's the right
> change.

How about adding the below to the commit log:
Even if some of the arches do support CPU hotplug, it does not make sense
to return the cpu that has been hotplugged.

Any suggestion?

> 
> 
>> Also there is a debugging version of node_to_cpumask_map() for x86 and
>> arm64, which is only used when CONFIG_DEBUG_PER_CPU_MAPS is defined, this
>> patch changes it to handle NUMA_NO_NODE as normal node_to_cpumask_map().
>>
>> [1] https://lore.kernel.org/patchwork/patch/1125789/
>> Signed-off-by: Yunsheng Lin <linyunsheng@huawei.com>
>> Suggested-by: Michal Hocko <mhocko@kernel.org>
>> Acked-by: Michal Hocko <mhocko@suse.com>
>> ---
>> V5: Drop unsigned "fix" change for x86/arm64, and change comment log
>>     according to Michal's comment.
>> V4: Have all these changes in a single patch.
> 
> This makes it much harder to get the patch merged, you basically have to
> get Andrew Morton to merge it now. Sending individual patches for each
> arch means each arch maintainer can merge them separately.

I am new to the arch change here, and not sure which is the best way to get
the multi-arches change merged.

Do you think it is better to resend this as individual patches for each arch
after megre window?

thanks for reviewing.

> 
> cheers
> 
>> V3: Change to only handle NUMA_NO_NODE, and return cpu_online_mask
>>     for NUMA_NO_NODE case, and change the commit log to better justify
>>     the change.
>> V2: make the node id checking change to other arches too.
>> ---
>>  arch/alpha/include/asm/topology.h                | 2 +-
>>  arch/arm64/include/asm/numa.h                    | 3 +++
>>  arch/arm64/mm/numa.c                             | 3 +++
>>  arch/mips/include/asm/mach-ip27/topology.h       | 4 ++--
>>  arch/mips/include/asm/mach-loongson64/topology.h | 4 +++-
>>  arch/powerpc/include/asm/topology.h              | 6 +++---
>>  arch/s390/include/asm/topology.h                 | 3 +++
>>  arch/sparc/include/asm/topology_64.h             | 6 +++---
>>  arch/x86/include/asm/topology.h                  | 3 +++
>>  arch/x86/mm/numa.c                               | 3 +++
>>  10 files changed, 27 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/alpha/include/asm/topology.h b/arch/alpha/include/asm/topology.h
>> index 5a77a40..836c9e2 100644
>> --- a/arch/alpha/include/asm/topology.h
>> +++ b/arch/alpha/include/asm/topology.h
>> @@ -31,7 +31,7 @@ static const struct cpumask *cpumask_of_node(int node)
>>  	int cpu;
>>  
>>  	if (node == NUMA_NO_NODE)
>> -		return cpu_all_mask;
>> +		return cpu_online_mask;
>>  
>>  	cpumask_clear(&node_to_cpumask_map[node]);
>>  
>> diff --git a/arch/arm64/include/asm/numa.h b/arch/arm64/include/asm/numa.h
>> index 626ad01..c8a4b31 100644
>> --- a/arch/arm64/include/asm/numa.h
>> +++ b/arch/arm64/include/asm/numa.h
>> @@ -25,6 +25,9 @@ const struct cpumask *cpumask_of_node(int node);
>>  /* Returns a pointer to the cpumask of CPUs on Node 'node'. */
>>  static inline const struct cpumask *cpumask_of_node(int node)
>>  {
>> +	if (node == NUMA_NO_NODE)
>> +		return cpu_online_mask;
>> +
>>  	return node_to_cpumask_map[node];
>>  }
>>  #endif
>> diff --git a/arch/arm64/mm/numa.c b/arch/arm64/mm/numa.c
>> index 4f241cc..f57202d 100644
>> --- a/arch/arm64/mm/numa.c
>> +++ b/arch/arm64/mm/numa.c
>> @@ -46,6 +46,9 @@ EXPORT_SYMBOL(node_to_cpumask_map);
>>   */
>>  const struct cpumask *cpumask_of_node(int node)
>>  {
>> +	if (node == NUMA_NO_NODE)
>> +		return cpu_online_mask;
>> +
>>  	if (WARN_ON(node >= nr_node_ids))
>>  		return cpu_none_mask;
>>  
>> diff --git a/arch/mips/include/asm/mach-ip27/topology.h b/arch/mips/include/asm/mach-ip27/topology.h
>> index 965f079..04505e6 100644
>> --- a/arch/mips/include/asm/mach-ip27/topology.h
>> +++ b/arch/mips/include/asm/mach-ip27/topology.h
>> @@ -15,8 +15,8 @@ struct cpuinfo_ip27 {
>>  extern struct cpuinfo_ip27 sn_cpu_info[NR_CPUS];
>>  
>>  #define cpu_to_node(cpu)	(sn_cpu_info[(cpu)].p_nodeid)
>> -#define cpumask_of_node(node)	((node) == -1 ?				\
>> -				 cpu_all_mask :				\
>> +#define cpumask_of_node(node)	((node) == NUMA_NO_NODE ?		\
>> +				 cpu_online_mask :			\
>>  				 &hub_data(node)->h_cpus)
>>  struct pci_bus;
>>  extern int pcibus_to_node(struct pci_bus *);
>> diff --git a/arch/mips/include/asm/mach-loongson64/topology.h b/arch/mips/include/asm/mach-loongson64/topology.h
>> index 7ff819a..e78daa6 100644
>> --- a/arch/mips/include/asm/mach-loongson64/topology.h
>> +++ b/arch/mips/include/asm/mach-loongson64/topology.h
>> @@ -5,7 +5,9 @@
>>  #ifdef CONFIG_NUMA
>>  
>>  #define cpu_to_node(cpu)	(cpu_logical_map(cpu) >> 2)
>> -#define cpumask_of_node(node)	(&__node_data[(node)]->cpumask)
>> +#define cpumask_of_node(node)	((node) == NUMA_NO_NODE ?		\
>> +				 cpu_online_mask :			\
>> +				 &__node_data[(node)]->cpumask)
>>  
>>  struct pci_bus;
>>  extern int pcibus_to_node(struct pci_bus *);
>> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
>> index 2f7e1ea..309f847 100644
>> --- a/arch/powerpc/include/asm/topology.h
>> +++ b/arch/powerpc/include/asm/topology.h
>> @@ -17,9 +17,9 @@ struct device_node;
>>  
>>  #include <asm/mmzone.h>
>>  
>> -#define cpumask_of_node(node) ((node) == -1 ?				\
>> -			       cpu_all_mask :				\
>> -			       node_to_cpumask_map[node])
>> +#define cpumask_of_node(node)	((node) == NUMA_NO_NODE ?		\
>> +				 cpu_online_mask :			\
>> +				 node_to_cpumask_map[node])
>>  
>>  struct pci_bus;
>>  #ifdef CONFIG_PCI
>> diff --git a/arch/s390/include/asm/topology.h b/arch/s390/include/asm/topology.h
>> index cca406f..1bd2e73 100644
>> --- a/arch/s390/include/asm/topology.h
>> +++ b/arch/s390/include/asm/topology.h
>> @@ -78,6 +78,9 @@ static inline int cpu_to_node(int cpu)
>>  #define cpumask_of_node cpumask_of_node
>>  static inline const struct cpumask *cpumask_of_node(int node)
>>  {
>> +	if (node == NUMA_NO_NODE)
>> +		return cpu_online_mask;
>> +
>>  	return &node_to_cpumask_map[node];
>>  }
>>  
>> diff --git a/arch/sparc/include/asm/topology_64.h b/arch/sparc/include/asm/topology_64.h
>> index 34c628a..8c29357 100644
>> --- a/arch/sparc/include/asm/topology_64.h
>> +++ b/arch/sparc/include/asm/topology_64.h
>> @@ -11,9 +11,9 @@ static inline int cpu_to_node(int cpu)
>>  	return numa_cpu_lookup_table[cpu];
>>  }
>>  
>> -#define cpumask_of_node(node) ((node) == -1 ?				\
>> -			       cpu_all_mask :				\
>> -			       &numa_cpumask_lookup_table[node])
>> +#define cpumask_of_node(node)	((node) == NUMA_NO_NODE ?		\
>> +				 cpu_online_mask :			\
>> +				 &numa_cpumask_lookup_table[node])
>>  
>>  struct pci_bus;
>>  #ifdef CONFIG_PCI
>> diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
>> index 4b14d23..7fa82e1 100644
>> --- a/arch/x86/include/asm/topology.h
>> +++ b/arch/x86/include/asm/topology.h
>> @@ -69,6 +69,9 @@ extern const struct cpumask *cpumask_of_node(int node);
>>  /* Returns a pointer to the cpumask of CPUs on Node 'node'. */
>>  static inline const struct cpumask *cpumask_of_node(int node)
>>  {
>> +	if (node == NUMA_NO_NODE)
>> +		return cpu_online_mask;
>> +
>>  	return node_to_cpumask_map[node];
>>  }
>>  #endif
>> diff --git a/arch/x86/mm/numa.c b/arch/x86/mm/numa.c
>> index e6dad60..84b28ef 100644
>> --- a/arch/x86/mm/numa.c
>> +++ b/arch/x86/mm/numa.c
>> @@ -861,6 +861,9 @@ void numa_remove_cpu(int cpu)
>>   */
>>  const struct cpumask *cpumask_of_node(int node)
>>  {
>> +	if (node == NUMA_NO_NODE)
>> +		return cpu_online_mask;
>> +
>>  	if (node >= nr_node_ids) {
>>  		printk(KERN_WARNING
>>  			"cpumask_of_node(%d): node > nr_node_ids(%u)\n",
>> -- 
>> 2.8.1
> 
> .
> 

