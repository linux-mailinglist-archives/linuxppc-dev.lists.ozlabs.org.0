Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BBD462CC2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 07:27:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3C2M1kk3z3cFX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 17:27:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3C1w0N38z2xYG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 17:27:31 +1100 (AEDT)
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4J3Byk5GSHz1DJpF;
 Tue, 30 Nov 2021 14:24:46 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 30 Nov 2021 14:27:26 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Tue, 30 Nov 2021 14:27:25 +0800
Message-ID: <ab9b7446-e955-67da-b9f3-1e1c15566fdb@huawei.com>
Date: Tue, 30 Nov 2021 14:27:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH RFC 3/4] mm: percpu: Add generic pcpu_fc_alloc/free
 funciton
Content-Language: en-US
To: Dennis Zhou <dennis@kernel.org>
References: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
 <20211121093557.139034-4-wangkefeng.wang@huawei.com>
 <YaVYGCB+I7QLZo0+@fedora>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <YaVYGCB+I7QLZo0+@fedora>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
 dggpemm500001.china.huawei.com (7.185.36.107)
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
Cc: linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, paulus@samba.org,
 hpa@zytor.com, sparclinux@vger.kernel.org, cl@linux.com, will@kernel.org,
 linux-riscv@lists.infradead.org, x86@kernel.org, mingo@redhat.com,
 catalin.marinas@arm.com, aou@eecs.berkeley.edu, bp@alien8.de,
 paul.walmsley@sifive.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org, tsbogend@alpha.franken.de,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, palmer@dabbelt.com,
 tj@kernel.org, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2021/11/30 6:45, Dennis Zhou wrote:
> On Sun, Nov 21, 2021 at 05:35:56PM +0800, Kefeng Wang wrote:
>> With previous patch, we could add a generic pcpu first chunk
>> allocation and free function to cleanup the duplicated definations
>> on each architecture.
>>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
>> ---
>>   arch/mips/mm/init.c            | 16 +--------
>>   arch/powerpc/kernel/setup_64.c | 51 ++------------------------
>>   arch/sparc/kernel/smp_64.c     | 50 +-------------------------
>>   arch/x86/kernel/setup_percpu.c | 59 +-----------------------------
>>   drivers/base/arch_numa.c       | 19 +---------
>>   include/linux/percpu.h         |  9 +----
>>   mm/percpu.c                    | 66 ++++++++++++++++++----------------
>>   7 files changed, 42 insertions(+), 228 deletions(-)
...
>> diff --git a/include/linux/percpu.h b/include/linux/percpu.h
>> index 41bb54715b0c..d73c97ef4ff4 100644
>> --- a/include/linux/percpu.h
>> +++ b/include/linux/percpu.h
>> @@ -95,9 +95,6 @@ extern const char * const pcpu_fc_names[PCPU_FC_NR];
>>   extern enum pcpu_fc pcpu_chosen_fc;
>>   
>>   typedef int (pcpu_fc_cpu_to_node_fn_t)(int cpu);
>> -typedef void * (*pcpu_fc_alloc_fn_t)(unsigned int cpu, size_t size, size_t align,
>> -				     pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn);
>> -typedef void (*pcpu_fc_free_fn_t)(void *ptr, size_t size);
>>   typedef void (*pcpu_fc_populate_pte_fn_t)(unsigned long addr);
>>   typedef int (pcpu_fc_cpu_distance_fn_t)(unsigned int from, unsigned int to);
>>   
>> @@ -112,15 +109,11 @@ extern void __init pcpu_setup_first_chunk(const struct pcpu_alloc_info *ai,
>>   extern int __init pcpu_embed_first_chunk(size_t reserved_size, size_t dyn_size,
>>   				size_t atom_size,
>>   				pcpu_fc_cpu_distance_fn_t cpu_distance_fn,
>> -				pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn,
>> -				pcpu_fc_alloc_fn_t alloc_fn,
>> -				pcpu_fc_free_fn_t free_fn);
>> +				pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn);
>>   #endif
>>   
>>   #ifdef CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK
>>   extern int __init pcpu_page_first_chunk(size_t reserved_size,
>> -				pcpu_fc_alloc_fn_t alloc_fn,
>> -				pcpu_fc_free_fn_t free_fn,
>>   				pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn,
>>   				pcpu_fc_populate_pte_fn_t populate_pte_fn);
>>   #endif
>> diff --git a/mm/percpu.c b/mm/percpu.c
>> index 3f6cf1ff0be2..efaa1cbaf73d 100644
>> --- a/mm/percpu.c
>> +++ b/mm/percpu.c
>> @@ -2992,6 +2992,30 @@ static struct pcpu_alloc_info * __init __flatten pcpu_build_alloc_info(
>>   
>>   	return ai;
>>   }
>> +
>> +static void * __init pcpu_fc_alloc(unsigned int cpu, size_t size, size_t align,
>> +				   pcpu_fc_cpu_to_node_fn_t cpu_to_nd_fn)
>> +{
>> +	const unsigned long goal = __pa(MAX_DMA_ADDRESS);
>> +	int node = NUMA_NO_NODE;
>> +	void *ptr;
>> +
>> +	if (cpu_to_nd_fn)
>> +		node = cpu_to_nd_fn(cpu);
>> +
>> +	if (node == NUMA_NO_NODE || !node_online(node) || !NODE_DATA(node)) {
>> +		ptr = memblock_alloc_from(size, align, goal);
>> +	} else {
>> +		ptr = memblock_alloc_try_nid(size, align, goal,
>> +					     MEMBLOCK_ALLOC_ACCESSIBLE, node);
>> +	}
>> +	return ptr;
>> +}
> My preference here would be to keep this identical to the x86
> implementation where we #ifdef CONFIG_NUMA.

I will add back '#ifdef CONFIG_NUMA',  also will add back the 
pr_debug/pr_info part as x86 does,

> Overall this makes sense.
>
> Thanks,
> Dennis
> .
