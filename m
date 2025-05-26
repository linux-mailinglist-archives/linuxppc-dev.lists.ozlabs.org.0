Return-Path: <linuxppc-dev+bounces-8947-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AD4AC437F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 May 2025 19:42:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5jkd4jNFz2xS2;
	Tue, 27 May 2025 03:42:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748281321;
	cv=none; b=hCDjiXB7+QnpRI3HUhygamBoI3s0Uu0VtESuWM1jDOJbG7ODxca/2Rvi/ARFEnQ7C2x2vbTBNu/Vsudk2QlQ3W8bHb8OPGf/TQGnFtggvoMwpDMYdSC5KiZVAvglH4oOxZdTK5qnK8l8A1H2a4SMj+jbuiGqfqfETDdCHorrLPjzupjpl4g1vItf0WNuVhBAgi0wK0/o4Tpbt/Mr/BJp3VRwWWMlWvcWrziwtCIZmkkaRpG1UdqKKlnQp13k2okUobWmWOZd6xffZHOGLkfNSPZ4fkzdyQJ2CguEizbedCNr9yujsk8fW5thzha6kpp5CVe54wwfAoJ8K6lBOM9Y8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748281321; c=relaxed/relaxed;
	bh=fQ+WUDB5Y8pI027l1zY1J7qLyvrUIBQdC7VY633SH2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VO4/VUQdaU6kOCCAUPEaRt1MUXS/jyQ3iPxrw0n5yhuSPIeCTI6X4FFl1ES7ojVrCjhKUi+D78QIJ8AhMtPQYp4lU6B16FEdX7VPDkiDyPTo8Vch7ShaGZT7fIttgFaJ8pJ/JeucF37VRH0yiFHKCjrQ59xtuc/TJMB09LWJnsGjlxaghoOJmu9FpPAqXkEe6N+Nis2pbo7rxs9zvFZV2RyD31Cpv7ouhXQetFcuMiMVnHfJifiv/iAadPBn1FwaN6Iwzau2u/+iJre5l0sYMdwkV+ea0prBpJKYQQA66o0a86z5uyc5Xyg0NVcGVuJUPvB97e/ufzeGchdBAk4sww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zs1OiE6J; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Zs1OiE6J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b5jkc52T0z2xRw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 May 2025 03:42:00 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54Q9elv4014591;
	Mon, 26 May 2025 17:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=fQ+WUD
	B5Y8pI027l1zY1J7qLyvrUIBQdC7VY633SH2g=; b=Zs1OiE6JOefxF+CEbpkEBY
	CuPMHh8qTazFj0twr4pl4fikTB0z2YDNtJyiGUJoCVJ460BzRTK29YndXcbTJqhl
	F5JvBYpr0KP5dypcvZosVXSpu+bymKw1C7v/V+VAvjBUg8DXUKFhvPxXFQMmWugR
	b4JiFs1+w9S1oUYVEFH+5jM14Ga1FS1g1QKGo1PVQ6Hhyy0D/ByPq0aBfm5Hc01b
	vaT6/SM4q171BEgbaoAHfynoLDWVoTDxwONDcIGYgh2dWvDLPKqi7i8sCkwP5SSn
	KmLfD60Gapxln7TG+Re2TRqhrH+7ItUDPJIdzRF9tjWNhqg4bZU6XeRbvsqSum0Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46u5ucja65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 17:41:43 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54QHcufN010810;
	Mon, 26 May 2025 17:41:43 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46u5ucja61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 17:41:43 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54QGXIQq010753;
	Mon, 26 May 2025 17:41:42 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46uru0f7h6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 May 2025 17:41:42 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54QHfeSS27787998
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 May 2025 17:41:40 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF67F58056;
	Mon, 26 May 2025 17:41:40 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 91BA45803F;
	Mon, 26 May 2025 17:41:34 +0000 (GMT)
Received: from [9.124.208.192] (unknown [9.124.208.192])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 26 May 2025 17:41:34 +0000 (GMT)
Message-ID: <456ea698-aced-4f65-b5ba-37640632360e@linux.ibm.com>
Date: Mon, 26 May 2025 23:11:32 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] drivers/base/node: Optimize memory block
 registration to reduce boot time
To: David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
        Zi Yan <ziy@nvidia.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Nilay Shroff
 <nilay@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <bc754a238aa91fa36be463985ccde66aac7055e7.1748270306.git.donettom@linux.ibm.com>
 <13707f7a-3ed6-4a79-bc55-46d331f8b051@redhat.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <13707f7a-3ed6-4a79-bc55-46d331f8b051@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _Kz1DhUuE_MPO_9aI6oI6UtCg-P98TZV
X-Proofpoint-GUID: _vmmaXJVfkCh86Scf4XWKKMdwdC_azP7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI2MDE0OSBTYWx0ZWRfX2YaIcQiZbGhL /QLlfmZyZIUOK7Od+Cz5vz3BRgETRfB/mjcpMta7ZU828WXVMy/NSizB6yJT2og00w8CjQ25Wmk Bg8IoVwLKxz6f+h87AXllhFl/uZSfXRaeqrr/u0bE9/6tgjpzP7/Ekmu01TUX9fjz+mMdC3LWVm
 P6gM2uN7blGGBJWZSUtYDdsZmVZqkNkl8v1jppiAKAi28R00OvP3vKTVCcHE8qZa9kcaHKg2pew 6xJxibHG0g+hXk+ZMmKUJuSWeAinosvGYIfi528/mrAPc/Ckif91Nf4SnsgDsHgI3IJlexJIhRs qPksbKHAf/gDpE061ZB07b3qbtCFtMpcgqV3gJbBpIhbCo92EYfPHwZNpWVUihbXoCtatjjPeU5
 ZZ3AU6VSdF/DU4b0VQEE4ykTwYbIZ4++VPOyeEPKeCbP4ugGqR+XkyEDpWPzSo1UeiPKAw5V
X-Authority-Analysis: v=2.4 cv=fJM53Yae c=1 sm=1 tr=0 ts=6834a7d8 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=VnNF1IyMAAAA:8 a=20KFwNOVAAAA:8
 a=muvWoay6l_c5xTQpIb4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-26_09,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505260149
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 5/26/25 10:47 PM, David Hildenbrand wrote:
> On 26.05.25 16:50, Donet Tom wrote:
>> During node device initialization, `memory blocks` are registered under
>> each NUMA node. The `memory blocks` to be registered are identified 
>> using
>> the node’s start and end PFNs, which are obtained from the node's 
>> pg_data
>>
>> However, not all PFNs within this range necessarily belong to the same
>> node—some may belong to other nodes. Additionally, due to the
>> discontiguous nature of physical memory, certain sections within a
>> `memory block` may be absent.
>>
>> As a result, `memory blocks` that fall between a node’s start and end
>> PFNs may span across multiple nodes, and some sections within those 
>> blocks
>> may be missing. `Memory blocks` have a fixed size, which is architecture
>> dependent.
>>
>> Due to these considerations, the memory block registration is currently
>> performed as follows:
>>
>> for_each_online_node(nid):
>>      start_pfn = pgdat->node_start_pfn;
>>      end_pfn = pgdat->node_start_pfn + node_spanned_pages;
>>      for_each_memory_block_between(PFN_PHYS(start_pfn), 
>> PFN_PHYS(end_pfn))
>>          mem_blk = memory_block_id(pfn_to_section_nr(pfn));
>> pfn_mb_start=section_nr_to_pfn(mem_blk->start_section_nr)
>>          pfn_mb_end = pfn_start + memory_block_pfns - 1
>>          for (pfn = pfn_mb_start; pfn < pfn_mb_end; pfn++):
>>              if (get_nid_for_pfn(pfn) != nid):
>>                  continue;
>>              else
>>                  do_register_memory_block_under_node(nid, mem_blk,
>> MEMINIT_EARLY);
>>
>> Here, we derive the start and end PFNs from the node's pg_data, then
>> determine the memory blocks that may belong to the node. For each
>> `memory block` in this range, we inspect all PFNs it contains and check
>> their associated NUMA node ID. If a PFN within the block matches the
>> current node, the memory block is registered under that node.
>>
>> If CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, get_nid_for_pfn() 
>> performs
>> a binary search in the `memblock regions` to determine the NUMA node ID
>> for a given PFN. If it is not enabled, the node ID is retrieved directly
>> from the struct page.
>>
>> On large systems, this process can become time-consuming, especially 
>> since
>> we iterate over each `memory block` and all PFNs within it until a 
>> match is
>> found. When CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, the additional
>> overhead of the binary search increases the execution time 
>> significantly,
>> potentially leading to soft lockups during boot.
>>
>> In this patch, we iterate over `memblock region` to identify the
>> `memory blocks` that belong to the current NUMA node. `memblock regions`
>> are contiguous memory ranges, each associated with a single NUMA 
>> node, and
>> they do not span across multiple nodes.
>>
>> for_each_memory_region(r): // r => region
>>    if (!node_online(r->nid)):
>>      continue;
>>    else
>>      for_each_memory_block_between(r->base, r->base + r->size - 1):
>>        do_register_memory_block_under_node(r->nid, mem_blk, 
>> MEMINIT_EARLY);
>>
>> We iterate over all memblock regions, and if the node associated with 
>> the
>> region is online, we calculate the start and end memory blocks based 
>> on the
>> region's start and end PFNs. We then register all the memory blocks 
>> within
>> that range under the region node.
>>
>> Test Results on My system with 32TB RAM
>> =======================================
>> 1. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled.
>>
>> Without this patch
>> ------------------
>> Startup finished in 1min 16.528s (kernel)
>>
>> With this patch
>> ---------------
>> Startup finished in 17.236s (kernel) - 78% Improvement
>>
>> 2. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT disabled.
>>
>> Without this patch
>> ------------------
>> Startup finished in 28.320s (kernel)
>>
>> With this patch
>> ---------------
>> Startup finished in 15.621s (kernel) - 46% Improvement
>>
>> Acked-by: Oscar Salvador <osalvador@suse.de>
>> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> Acked-by: Zi Yan <ziy@nvidia.com>
>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>>
>
>
> Only a couple of nits:
>
>> diff --git a/drivers/base/node.c b/drivers/base/node.c
>> index cd13ef287011..20b6f4496e1b 100644
>> --- a/drivers/base/node.c
>> +++ b/drivers/base/node.c
>> @@ -20,6 +20,7 @@
>>   #include <linux/pm_runtime.h>
>>   #include <linux/swap.h>
>>   #include <linux/slab.h>
>> +#include <linux/memblock.h>
>>     static const struct bus_type node_subsys = {
>>       .name = "node",
>> @@ -850,6 +851,47 @@ void unregister_memory_block_under_nodes(struct 
>> memory_block *mem_blk)
>> kobject_name(&node_devices[mem_blk->nid]->dev.kobj));
>>   }
>>   +/*
>> + * register_memory_blocks_under_nodes : Register the memory blocks
> > + *                 under the nodes.> + *
>> + * This function registers all memory blocks to their corresponding 
>> nodes
>> + * based on the associated memory regions. Each memory region is 
>> tied to
>> + * a specific node and does not span multiple nodes. Therefore, all 
>> memory
>> + * blocks within a given region are considered to belong to that 
>> node. The
>> + * function iterates through each memory region and registers the 
>> memory
>> + * blocks contained within that region to the respective node. Since 
>> memory
>> + * blocks can span across multiple regions (and hence multiple 
>> nodes), a
>> + * single memory block may be registered under more than one node if it
>> + * overlaps with regions belonging to different nodes.
>
> a) Do we need excessive doc for that?
>
> b) It looks partially like kerneldoc, do we want to convert it to 
> proper one?
>
> /**
>  * register_memory_blocks_under_nodes - register all memory blocks
>  *                     under the corresponding nodes
>  *
>  ...
>
> c) Maybe add a line break .. or two to make it a bit more readable.


Sure David, I will change it to a proper comment.


>
> > + */> +static void register_memory_blocks_under_nodes(void)
>> +{
>> +    struct memblock_region *r;
>> +
>> +    for_each_mem_region(r) {
>> +        const unsigned long start_block_id = phys_to_block_id(r->base);
>> +        const unsigned long end_block_id = phys_to_block_id(r->base 
>> + r->size - 1);
>> +        unsigned long block_id;
>> +        int nid = memblock_get_region_node(r);
>
> const int nid = memblock_get_region_node(r);
> unsigned long block_id;


Sure. I will change it.


>
>> +
>> +        if (!node_online(nid))
>> +            continue;
>> +
>> +        for (block_id = start_block_id; block_id <= end_block_id; 
>> block_id++) {
>> +            struct memory_block *mem;
>> +
>> +            mem = find_memory_block_by_id(block_id);
>> +            if (!mem)
>> +                continue;
>> +
>> +            do_register_memory_block_under_node(nid, mem, 
>> MEMINIT_EARLY);
>> +            put_device(&mem->dev);
>> +        }
>> +
>> +    }
>> +}
>> +
>>   void register_memory_blocks_under_node(int nid, unsigned long 
>> start_pfn,
>>                          unsigned long end_pfn,
>>                          enum meminit_context context)
>> @@ -971,11 +1013,16 @@ void __init node_dev_init(void)
>>         /*
>>        * Create all node devices, which will properly link the node
>> -     * to applicable memory block devices and already created cpu 
>> devices.
>> +     * to already created cpu devices.
>>        */
>>       for_each_online_node(i) {
>> -        ret = register_one_node(i);
>> +        ret =  __register_one_node(i);
>>           if (ret)
>>               panic("%s() failed to add node: %d\n", __func__, ret);
>>       }
>> +
>> +    /*
>> +     * Link the node to memory block devices
>> +     */
>
>
> This comment is rather ... superfluous.  ... and it would fit into a 
> single line.


I will remove it.


>
>> +    register_memory_blocks_under_nodes();
>>   }
>> diff --git a/include/linux/memory.h b/include/linux/memory.h
>> index 12daa6ec7d09..2a61088e17ad 100644
>> --- a/include/linux/memory.h
>> +++ b/include/linux/memory.h
>> @@ -171,12 +171,30 @@ struct memory_group 
>> *memory_group_find_by_id(int mgid);
>>   typedef int (*walk_memory_groups_func_t)(struct memory_group *, 
>> void *);
>>   int walk_dynamic_memory_groups(int nid, walk_memory_groups_func_t 
>> func,
>>                      struct memory_group *excluded, void *arg);
>> +struct memory_block *find_memory_block_by_id(unsigned long block_id);
>>   #define hotplug_memory_notifier(fn, pri) ({        \
>>       static __meminitdata struct notifier_block fn##_mem_nb =\
>>           { .notifier_call = fn, .priority = pri };\
>>       register_memory_notifier(&fn##_mem_nb);            \
>>   })
>>   +extern int sections_per_block;
>> +
>> +static inline unsigned long memory_block_id(unsigned long section_nr)
>> +{
>> +    return section_nr / sections_per_block;
>> +}
>> +
>> +static inline unsigned long pfn_to_block_id(unsigned long pfn)
>> +{
>> +    return memory_block_id(pfn_to_section_nr(pfn));
>> +}
>> +
>> +static inline unsigned long phys_to_block_id(unsigned long phys)
>> +{
>> +    return pfn_to_block_id(PFN_DOWN(phys));
>> +}
>> +
>>   #ifdef CONFIG_NUMA
>>   void memory_block_add_nid(struct memory_block *mem, int nid,
>>                 enum meminit_context context);
>> @@ -188,5 +206,4 @@ void memory_block_add_nid(struct memory_block 
>> *mem, int nid,
>>    * can sleep.
>>    */
>>   extern struct mutex text_mutex;
>> -
>
> Unrelated change.
>
>
> Thanks
>
> Acked-by: David Hildenbrand <david@redhat.com>


Thank you.


