Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE2C7633C8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 12:32:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hKWwu+T/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9qwZ59C3z3cRg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 20:32:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hKWwu+T/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9qvd6DDsz2yDc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 20:31:57 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36QA4Iw1010433;
	Wed, 26 Jul 2023 10:31:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=LQQM7CL5yMWrnv0EtglPenUF9jRbfhq/8jZW/TvoWZA=;
 b=hKWwu+T/lZU1Prkzc6NulPTELnDNojEhDg0VEekosG40GBO4zmZpQ6NvVbZ49BMdmC15
 W0UFXzkEtwupLB6tsSa0KsEoPJk45J/qQVaT6PDOVpRFd+K8HrzxNOU9rhUIGlsper1K
 9FgVV8j0evSDgWV2+FmcPPq8q1+1yKDGJZHdaXumDeHmfwyuGNirA7I0VTBXYjo/65cI
 9QVc054BvCj2dfHTZGb//98dUV9VZ7M3UMncbG9wbjcsqNzeIExkTBn2WD3/S5PeEfQj
 6nR4+BwVlcyPEXjylx71bjVejHDog1XlUpePBaLfDzTRV8PwiQn8YHFCfDzMCKl8jt3o hQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s314311x2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 10:31:44 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36QAIIT2023278;
	Wed, 26 Jul 2023 10:31:43 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s314311ws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 10:31:43 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36Q9fk66026197;
	Wed, 26 Jul 2023 10:31:42 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s0ses4enp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 10:31:42 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36QAVf4p37224732
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jul 2023 10:31:42 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A842558061;
	Wed, 26 Jul 2023 10:31:41 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0538C58058;
	Wed, 26 Jul 2023 10:31:38 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.89.11])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Jul 2023 10:31:37 +0000 (GMT)
X-Mailer: emacs 29.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: Re: [PATCH v5 6/7] mm/hotplug: Embed vmem_altmap details in memory
 block
In-Reply-To: <aa27b96e-5296-0324-d9d3-07ab1ee969d0@redhat.com>
References: <20230725100212.531277-1-aneesh.kumar@linux.ibm.com>
 <20230725100212.531277-7-aneesh.kumar@linux.ibm.com>
 <aa27b96e-5296-0324-d9d3-07ab1ee969d0@redhat.com>
Date: Wed, 26 Jul 2023 16:01:35 +0530
Message-ID: <87wmynvu9k.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qyMLr5xiGtHK7tM5RK5b_B_ozDujiRLw
X-Proofpoint-GUID: DisUdeHjiT-X_5NIYBlZ2GjESzLFLZCF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_04,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307260089
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
Cc: Vishal Verma <vishal.l.verma@intel.com>, Michal Hocko <mhocko@suse.com>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Hildenbrand <david@redhat.com> writes:

> On 25.07.23 12:02, Aneesh Kumar K.V wrote:
>> With memmap on memory, some architecture needs more details w.r.t altmap
>> such as base_pfn, end_pfn, etc to unmap vmemmap memory. Instead of
>> computing them again when we remove a memory block, embed vmem_altmap
>> details in struct memory_block if we are using memmap on memory block
>> feature.
>> 
>> No functional change in this patch
>> 
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>
> [...]
>
>>   
>>   static int add_memory_block(unsigned long block_id, unsigned long state,
>> -			    unsigned long nr_vmemmap_pages,
>> +			    struct vmem_altmap *altmap,
>>   			    struct memory_group *group)
>>   {
>>   	struct memory_block *mem;
>> @@ -744,7 +751,14 @@ static int add_memory_block(unsigned long block_id, unsigned long state,
>>   	mem->start_section_nr = block_id * sections_per_block;
>>   	mem->state = state;
>>   	mem->nid = NUMA_NO_NODE;
>> -	mem->nr_vmemmap_pages = nr_vmemmap_pages;
>> +	if (altmap) {
>> +		mem->altmap = kmalloc(sizeof(struct vmem_altmap), GFP_KERNEL);
>> +		if (!mem->altmap) {
>> +			kfree(mem);
>> +			return -ENOMEM;
>> +		}
>> +		memcpy(mem->altmap, altmap, sizeof(*altmap));
>> +	}
>
> I'm wondering if we should instead let the caller do the alloc/free. So we would alloc
> int the caller and would only store the pointer.
>
> Before removing the memory block, we would clear the pointer and free it in the caller.
>
> IOW, when removing a memory block and we still have an altmap set, something would be wrong.
>
> See below on try_remove_memory() handling.
>
> [...]
>
>> -static int get_nr_vmemmap_pages_cb(struct memory_block *mem, void *arg)
>> +static int get_vmemmap_altmap_cb(struct memory_block *mem, void *arg)
>>   {
>> +	struct vmem_altmap *altmap = (struct vmem_altmap *)arg;
>>   	/*
>> -	 * If not set, continue with the next block.
>> +	 * If we have any pages allocated from altmap
>> +	 * return the altmap details and break callback.
>>   	 */
>> -	return mem->nr_vmemmap_pages;
>> +	if (mem->altmap) {
>> +		memcpy(altmap, mem->altmap, sizeof(struct vmem_altmap));
>> +		return 1;
>> +	}
>> +	return 0;
>>   }
>>   
>>   static int check_cpu_on_node(int nid)
>> @@ -2146,9 +2152,8 @@ EXPORT_SYMBOL(try_offline_node);
>>   
>>   static int __ref try_remove_memory(u64 start, u64 size)
>>   {
>> -	struct vmem_altmap mhp_altmap = {};
>> -	struct vmem_altmap *altmap = NULL;
>> -	unsigned long nr_vmemmap_pages;
>> +	int ret;
>> +	struct vmem_altmap mhp_altmap, *altmap = NULL;
>>   	int rc = 0, nid = NUMA_NO_NODE;
>>   
>>   	BUG_ON(check_hotplug_memory_range(start, size));
>> @@ -2171,24 +2176,15 @@ static int __ref try_remove_memory(u64 start, u64 size)
>>   	 * the same granularity it was added - a single memory block.
>>   	 */
>>   	if (mhp_memmap_on_memory()) {
>> -		nr_vmemmap_pages = walk_memory_blocks(start, size, NULL,
>> -						      get_nr_vmemmap_pages_cb);
>> -		if (nr_vmemmap_pages) {
>> +		ret = walk_memory_blocks(start, size, &mhp_altmap,
>> +					 get_vmemmap_altmap_cb);
>> +		if (ret) {
>>   			if (size != memory_block_size_bytes()) {
>>   				pr_warn("Refuse to remove %#llx - %#llx,"
>>   					"wrong granularity\n",
>>   					start, start + size);
>>   				return -EINVAL;
>>   			}
>> -
>> -			/*
>> -			 * Let remove_pmd_table->free_hugepage_table do the
>> -			 * right thing if we used vmem_altmap when hot-adding
>> -			 * the range.
>> -			 */
>> -			mhp_altmap.base_pfn = PHYS_PFN(start);
>> -			mhp_altmap.free = nr_vmemmap_pages;
>> -			mhp_altmap.alloc = nr_vmemmap_pages;
>>   			altmap = &mhp_altmap;
>>   		}
>
>
> Instead of that, I suggest (whitespace damage expected):
>
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 3f231cf1b410..f6860df64549 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1956,12 +1956,19 @@ static int check_memblock_offlined_cb(struct memory_block *mem, void *arg)
>          return 0;
>   }
>   
> -static int get_nr_vmemmap_pages_cb(struct memory_block *mem, void *arg)
> +static int test_has_altmap_cb(struct memory_block *mem, void *arg)
>   {
> -       /*
> -        * If not set, continue with the next block.
> -        */
> -       return mem->nr_vmemmap_pages;
> +       struct memory_block **mem_ptr = (struct memory_block **)arg;
> +
> +       if (mem->altmap) {
> +               /*
> +                * We're not taking a reference on the memory block; it
> +                * it cannot vanish while we're about to that memory ourselves.
> +                */
> +               *mem_ptr = mem;
> +               return 1;
> +       }
> +       return 0;
>   }
>   
>   static int check_cpu_on_node(int nid)
> @@ -2036,9 +2043,7 @@ EXPORT_SYMBOL(try_offline_node);
>   
>   static int __ref try_remove_memory(u64 start, u64 size)
>   {
> -       struct vmem_altmap mhp_altmap = {};
>          struct vmem_altmap *altmap = NULL;
> -       unsigned long nr_vmemmap_pages;
>          int rc = 0, nid = NUMA_NO_NODE;
>   
>          BUG_ON(check_hotplug_memory_range(start, size));
> @@ -2061,9 +2066,9 @@ static int __ref try_remove_memory(u64 start, u64 size)
>           * the same granularity it was added - a single memory block.
>           */
>          if (mhp_memmap_on_memory()) {
> -               nr_vmemmap_pages = walk_memory_blocks(start, size, NULL,
> -                                                     get_nr_vmemmap_pages_cb);
> -               if (nr_vmemmap_pages) {
> +               struct memory_block *mem;
> +
> +               if (walk_memory_blocks(start, size, &mem, test_has_altmap_cb)) {
>                          if (size != memory_block_size_bytes()) {
>                                  pr_warn("Refuse to remove %#llx - %#llx,"
>                                          "wrong granularity\n",
> @@ -2072,12 +2077,11 @@ static int __ref try_remove_memory(u64 start, u64 size)
>                          }
>   
>                          /*
> -                        * Let remove_pmd_table->free_hugepage_table do the
> -                        * right thing if we used vmem_altmap when hot-adding
> -                        * the range.
> +                        * Clear the altmap from the memory block before we
> +                        * remove it; we'll take care of freeing the altmap.
>                           */
> -                       mhp_altmap.alloc = nr_vmemmap_pages;
> -                       altmap = &mhp_altmap;
> +                       altmap = mem->altmap;
> +                       mem->altmap = NULL;
>                  }
>          }
>   
> @@ -2094,6 +2098,9 @@ static int __ref try_remove_memory(u64 start, u64 size)
>   
>          arch_remove_memory(start, size, altmap);
>   
> +       if (altmap)
> +               kfree(altmap);
> +
>          if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK)) {
>                  memblock_phys_free(start, size);
>                  memblock_remove(start, size);
>

Is this any better. Any specific reason we want the alloc and free in
the caller? 

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 0210ed7b7696..271cfdf8f6b6 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -106,7 +106,7 @@ static void memory_block_release(struct device *dev)
 {
 	struct memory_block *mem = to_memory_block(dev);
 
-	kfree(mem->altmap);
+	WARN_ON(mem->altmap);
 	kfree(mem);
 }
 
@@ -751,14 +751,8 @@ static int add_memory_block(unsigned long block_id, unsigned long state,
 	mem->start_section_nr = block_id * sections_per_block;
 	mem->state = state;
 	mem->nid = NUMA_NO_NODE;
-	if (altmap) {
-		mem->altmap = kmalloc(sizeof(struct vmem_altmap), GFP_KERNEL);
-		if (!mem->altmap) {
-			kfree(mem);
-			return -ENOMEM;
-		}
-		memcpy(mem->altmap, altmap, sizeof(*altmap));
-	}
+	if (altmap)
+		mem->altmap = altmap;
 	INIT_LIST_HEAD(&mem->group_next);
 
 #ifndef CONFIG_NUMA
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 2bad1bf0e9e3..1c7d88332e0e 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1445,8 +1445,13 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
 	 */
 	if (mhp_flags & MHP_MEMMAP_ON_MEMORY) {
 		if (mhp_supports_memmap_on_memory(size)) {
+
 			mhp_altmap.free = memory_block_memmap_on_memory_pages();
-			params.altmap = &mhp_altmap;
+			params.altmap = kzalloc(sizeof(struct vmem_altmap), GFP_KERNEL);
+			if (!params.altmap)
+				goto error;
+
+			memcpy(params.altmap, &mhp_altmap, sizeof(mhp_altmap));
 		}
 		/* fallback to not using altmap  */
 	}
@@ -2067,13 +2072,14 @@ static int check_memblock_offlined_cb(struct memory_block *mem, void *arg)
 
 static int get_vmemmap_altmap_cb(struct memory_block *mem, void *arg)
 {
-	struct vmem_altmap *altmap = (struct vmem_altmap *)arg;
+	struct vmem_altmap **altmap = (struct vmem_altmap **)arg;
 	/*
 	 * If we have any pages allocated from altmap
 	 * return the altmap details and break callback.
 	 */
 	if (mem->altmap) {
-		memcpy(altmap, mem->altmap, sizeof(struct vmem_altmap));
+		*altmap = mem->altmap;
+		mem->altmap = NULL;
 		return 1;
 	}
 	return 0;
@@ -2152,7 +2158,7 @@ EXPORT_SYMBOL(try_offline_node);
 static int __ref try_remove_memory(u64 start, u64 size)
 {
 	int ret;
-	struct vmem_altmap mhp_altmap, *altmap = NULL;
+	struct vmem_altmap *altmap = NULL;
 	int rc = 0, nid = NUMA_NO_NODE;
 
 	BUG_ON(check_hotplug_memory_range(start, size));
@@ -2174,7 +2180,7 @@ static int __ref try_remove_memory(u64 start, u64 size)
 	 * We only support removing memory added with MHP_MEMMAP_ON_MEMORY in
 	 * the same granularity it was added - a single memory block.
 	 */
-	ret = walk_memory_blocks(start, size, &mhp_altmap,
+	ret = walk_memory_blocks(start, size, &altmap,
 				 get_vmemmap_altmap_cb);
 	if (ret) {
 		if (size != memory_block_size_bytes()) {
@@ -2183,7 +2189,6 @@ static int __ref try_remove_memory(u64 start, u64 size)
 				start, start + size);
 			return -EINVAL;
 		}
-		altmap = &mhp_altmap;
 	}
 
 	/* remove memmap entry */
@@ -2203,8 +2208,10 @@ static int __ref try_remove_memory(u64 start, u64 size)
 	 * Now that we are tracking alloc and free correctly
 	 * we can add check to verify altmap free pages.
 	 */
-	if (altmap)
+	if (altmap) {
 		WARN(altmap->alloc, "Altmap not fully unmapped");
+		kfree(altmap);
+	}
 
 	if (IS_ENABLED(CONFIG_ARCH_KEEP_MEMBLOCK)) {
 		memblock_phys_free(start, size);
