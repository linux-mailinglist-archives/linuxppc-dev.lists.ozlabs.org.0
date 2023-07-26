Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8784762A42
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 06:26:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jZZtYeu3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9gp005NSz3bX3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 14:26:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jZZtYeu3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9gn36RGgz2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 14:25:43 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36Q4CP32009998;
	Wed, 26 Jul 2023 04:25:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=uQRLB5NxPmMeT8YhyEQlanbMPOGZ9l+YWGC5Nlog9Zg=;
 b=jZZtYeu3YTxdcOOSgdYz3DW63RY0adgiYm7hyGLimKfeRAD9NiD+M3G28+JNdNkNQZ47
 4H4UJ239j17smkS3SBpUV/otkBG5sh8tg1daVKkHWjvJLQk5EM8T1hjCeZvcFnSq5bfm
 pJJQTFxryDUBUf5D5asS3a/Bs16jf3AlIzG+Ow6pXLgl4gg7LRk8PVzj62A79hlWvorc
 53ZF6zaBi73tYqtVu1qm1MEQKgjbHEhitGvLCZWxHWHVtevkEjugNCXtHSKxh5dRS855
 8OCQo3fFhl3hIjeM6FdWFMSuurrVBPbL9gOvdYDzrSndD492JmMA4vI4VFtrMCkjPrEb 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s2v8m07hq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 04:25:26 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36Q4DfdY014844;
	Wed, 26 Jul 2023 04:25:26 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s2v8m07h9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 04:25:26 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36Q2FagN016569;
	Wed, 26 Jul 2023 04:25:25 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s0v519afq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 04:25:25 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36Q4PO8c7537344
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jul 2023 04:25:24 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0BFAC5805C;
	Wed, 26 Jul 2023 04:25:24 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 269FE5805A;
	Wed, 26 Jul 2023 04:25:20 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.89.11])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Jul 2023 04:25:19 +0000 (GMT)
X-Mailer: emacs 29.0.91 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: Re: [PATCH v5 4/7] mm/hotplug: Support memmap_on_memory when memmap
 is not aligned to pageblocks
In-Reply-To: <e1a4430e-d3ae-711b-7efa-5085934b62fd@redhat.com>
References: <20230725100212.531277-1-aneesh.kumar@linux.ibm.com>
 <20230725100212.531277-5-aneesh.kumar@linux.ibm.com>
 <e1a4430e-d3ae-711b-7efa-5085934b62fd@redhat.com>
Date: Wed, 26 Jul 2023 09:55:17 +0530
Message-ID: <875y67xpsi.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0QZdOnYk72aOzjRMWvb8o08sDV-vwPSm
X-Proofpoint-ORIG-GUID: f-4sIxbx64jd7Pd2g1aDwbmwvCWbkHXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-25_14,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 malwarescore=0 bulkscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 mlxscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307260034
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
>> Currently, memmap_on_memory feature is only supported with memory block
>> sizes that result in vmemmap pages covering full page blocks. This is
>> because memory onlining/offlining code requires applicable ranges to be
>> pageblock-aligned, for example, to set the migratetypes properly.
>> 
>> This patch helps to lift that restriction by reserving more pages than
>> required for vmemmap space. This helps the start address to be page
>> block aligned with different memory block sizes. Using this facility
>> implies the kernel will be reserving some pages for every memoryblock.
>> This allows the memmap on memory feature to be widely useful with
>> different memory block size values.
>> 
>> For ex: with 64K page size and 256MiB memory block size, we require 4
>> pages to map vmemmap pages, To align things correctly we end up adding a
>> reserve of 28 pages. ie, for every 4096 pages 28 pages get reserved.
>> 
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   .../admin-guide/mm/memory-hotplug.rst         |  12 ++
>>   mm/memory_hotplug.c                           | 121 ++++++++++++++++--
>>   2 files changed, 119 insertions(+), 14 deletions(-)
>> 
>> diff --git a/Documentation/admin-guide/mm/memory-hotplug.rst b/Documentation/admin-guide/mm/memory-hotplug.rst
>> index bd77841041af..2994958c7ce8 100644
>> --- a/Documentation/admin-guide/mm/memory-hotplug.rst
>> +++ b/Documentation/admin-guide/mm/memory-hotplug.rst
>> @@ -433,6 +433,18 @@ The following module parameters are currently defined:
>>   				 memory in a way that huge pages in bigger
>>   				 granularity cannot be formed on hotplugged
>>   				 memory.
>> +
>> +				 With value "force" it could result in memory
>> +				 wastage due to memmap size limitations. For
>> +				 example, if the memmap for a memory block
>> +				 requires 1 MiB, but the pageblock size is 2
>> +				 MiB, 1 MiB of hotplugged memory will be wasted.
>> +				 Note that there are still cases where the
>> +				 feature cannot be enforced: for example, if the
>> +				 memmap is smaller than a single page, or if the
>> +				 architecture does not support the forced mode
>> +				 in all configurations.
>> +
>>   ``online_policy``		 read-write: Set the basic policy used for
>>   				 automatic zone selection when onlining memory
>>   				 blocks without specifying a target zone.
>> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>> index 457824a6ecb8..5b472e137898 100644
>> --- a/mm/memory_hotplug.c
>> +++ b/mm/memory_hotplug.c
>> @@ -41,17 +41,89 @@
>>   #include "internal.h"
>>   #include "shuffle.h"
>>   
>> +enum {
>> +	MEMMAP_ON_MEMORY_DISABLE = 0,
>> +	MEMMAP_ON_MEMORY_ENABLE,
>> +	MEMMAP_ON_MEMORY_FORCE,
>> +};
>> +
>> +static int memmap_mode __read_mostly = MEMMAP_ON_MEMORY_DISABLE;
>> +
>> +static inline unsigned long memory_block_memmap_pages(void)
>> +{
>> +	unsigned long memmap_size;
>> +
>> +	memmap_size = PHYS_PFN(memory_block_size_bytes()) * sizeof(struct page);
>> +	return memmap_size >> PAGE_SHIFT;
>
> I'd really move a !page variant (memory_block_memmap_size()) to the 
> previous patch and use it in mhp_supports_memmap_on_memory() and 
> arch_supports_memmap_on_memory().
>
> Then, in this patch, reuse that function in 
> memory_block_memmap_on_memory_pages() and ...
>
>> +}
>> +
>> +static inline unsigned long memory_block_memmap_on_memory_pages(void)
>> +{
>> +	unsigned long nr_pages = memory_block_memmap_pages();
>
> ... do here a
>
> nr_pages = PHYS_PFN(memory_block_memmap_size());
>
>
> Conceptually, it would be even cleaner to have here
>
> nr_pages = PFN_UP(memory_block_memmap_size());
>
> even though one can argue that mhp_supports_memmap_on_memory() will make 
> sure that the unaligned value (memory_block_memmap_size()) covers full 
> pages, but at least to me it looks cleaner that way. No strong opinion.
>
>
>> +
>> +	/*
>> +	 * In "forced" memmap_on_memory mode, we add extra pages to align the
>> +	 * vmemmap size to cover full pageblocks. That way, we can add memory
>> +	 * even if the vmemmap size is not properly aligned, however, we might waste
>> +	 * memory.
>> +	 */
>> +	if (memmap_mode == MEMMAP_ON_MEMORY_FORCE)
>> +		return pageblock_align(nr_pages);
>> +	return nr_pages;
>> +}
>> +
>>   #ifdef CONFIG_MHP_MEMMAP_ON_MEMORY
>>   /*
>>    * memory_hotplug.memmap_on_memory parameter
>>    */
>> -static bool memmap_on_memory __ro_after_init;
>> -module_param(memmap_on_memory, bool, 0444);
>> -MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hotplug");
>> +static int set_memmap_mode(const char *val, const struct kernel_param *kp)
>> +{
>> +	int ret, mode;
>> +	bool enabled;
>> +
>> +	if (sysfs_streq(val, "force") ||  sysfs_streq(val, "FORCE")) {
>> +		mode =  MEMMAP_ON_MEMORY_FORCE;
>> +		goto matched;
>> +	}
>
> Avoid the goto + label
>
> } else {
> 	ret = kstrtobool(val, &enabled);
> 	...
> }
>
> *((int *)kp->arg) =  mode;
>
>> +
>> +	ret = kstrtobool(val, &enabled);
>> +	if (ret < 0)
>> +		return ret;
>> +	if (enabled)
>> +		mode =  MEMMAP_ON_MEMORY_ENABLE;
>> +	else
>> +		mode =  MEMMAP_ON_MEMORY_DISABLE;
>> +
>> +matched:
>> +	*((int *)kp->arg) =  mode;
>> +	if (mode == MEMMAP_ON_MEMORY_FORCE) {
>> +		unsigned long memmap_pages = memory_block_memmap_on_memory_pages();
>> +
>> +		pr_info("Memory hotplug will reserve %ld pages in each memory block\n",
>> +			memmap_pages - memory_block_memmap_pages());
>
> pr_info_once() ?
>
>> +	}
>> +	return 0;
>> +}
>> +
>
> [...]
>
>>   	/*
>>   	 * Besides having arch support and the feature enabled at runtime, we
>> @@ -1294,10 +1366,28 @@ static bool mhp_supports_memmap_on_memory(unsigned long size)
>>   	 *       altmap as an alternative source of memory, and we do not exactly
>>   	 *       populate a single PMD.
>>   	 */
>> -	return mhp_memmap_on_memory() &&
>> -	       size == memory_block_size_bytes() &&
>> -	       IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT)) &&
>> -	       arch_supports_memmap_on_memory(size);
>> +	if (!mhp_memmap_on_memory() || size != memory_block_size_bytes())
>> +		return false;
>> +
>> +	/*
>> +	 * Make sure the vmemmap allocation is fully contained
>> +	 * so that we always allocate vmemmap memory from altmap area.
>> +	 */
>> +	if (!IS_ALIGNED(vmemmap_size, PAGE_SIZE))
>> +		return false;
>> +
>> +	/*
>> +	 * start pfn should be pageblock_nr_pages aligned for correctly
>> +	 * setting migrate types
>> +	 */
>> +	if (!pageblock_aligned(memmap_pages))
>> +		return false;
>> +
>> +	if (memmap_pages == PHYS_PFN(memory_block_size_bytes()))
>> +		/* No effective hotplugged memory doesn't make sense. */
>> +		return false;
>> +
>> +	return arch_supports_memmap_on_memory(size);
>>   }
>>   
>>   /*
>> @@ -1310,7 +1400,10 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>>   {
>>   	struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
>>   	enum memblock_flags memblock_flags = MEMBLOCK_NONE;
>> -	struct vmem_altmap mhp_altmap = {};
>> +	struct vmem_altmap mhp_altmap = {
>> +		.base_pfn =  PHYS_PFN(res->start),
>> +		.end_pfn  =  PHYS_PFN(res->end),
>
> Is it required to set .end_pfn, and if so, shouldn't we also set it to 
> base_pfn + memory_block_memmap_on_memory_pages()) ?
>

We use that in ppc64 for checking altmap boundary condition. As we
discussed earlier, ppc64 due to vmemmap mapping size restrictions can't
always allocate vmemmap pages from altmap area even if requested. We
fallback to regular memory alocation in that case (only used now with
pmem). We use altmap.end_pfn for that boundary check. You can refer to
altmap_cross_boundary() for more details.

>
> We also don't set it on the try_remove_memory() part,.
>

We use altmap.end_pfn only in the allocation path. This confusion is
also another motivation to embed altmap in memory block structure as
done in patch 6.

>
>
> With these things addressed, feel free to add
>
> Acked-by: David Hildenbrand <david@redhat.com>
>

Thanks for all your help with review. Attaching the diff against
previous version taking care of the feedback above.

diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 7e46369d57c9..2209d66a034e 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -176,11 +176,8 @@ bool altmap_cross_boundary(struct vmem_altmap *altmap, unsigned long start,
  * alignment requirement is met using altmap->reserve blocks.
  */
 #define arch_supports_memmap_on_memory arch_supports_memmap_on_memory
-static inline bool arch_supports_memmap_on_memory(unsigned long size)
+static inline bool arch_supports_memmap_on_memory(unsigned long vmemmap_size)
 {
-	unsigned long nr_pages = size >> PAGE_SHIFT;
-	unsigned long vmemmap_size = nr_pages * sizeof(struct page);
-
 	if (!radix_enabled())
 		return false;
 	/*
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 1c9069cc0263..cadf4209d7c4 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -49,17 +49,14 @@ enum {
 
 static int memmap_mode __read_mostly = MEMMAP_ON_MEMORY_DISABLE;
 
-static inline unsigned long memory_block_memmap_pages(void)
+static inline unsigned long memory_block_memmap_size(void)
 {
-	unsigned long memmap_size;
-
-	memmap_size = PHYS_PFN(memory_block_size_bytes()) * sizeof(struct page);
-	return memmap_size >> PAGE_SHIFT;
+	return PHYS_PFN(memory_block_size_bytes()) * sizeof(struct page);
 }
 
 static inline unsigned long memory_block_memmap_on_memory_pages(void)
 {
-	unsigned long nr_pages = memory_block_memmap_pages();
+	unsigned long nr_pages = PFN_UP(memory_block_memmap_size());
 
 	/*
 	 * In "forced" memmap_on_memory mode, we add extra pages to align the
@@ -83,18 +80,15 @@ static int set_memmap_mode(const char *val, const struct kernel_param *kp)
 
 	if (sysfs_streq(val, "force") ||  sysfs_streq(val, "FORCE")) {
 		mode =  MEMMAP_ON_MEMORY_FORCE;
-		goto matched;
+	} else {
+		ret = kstrtobool(val, &enabled);
+		if (ret < 0)
+			return ret;
+		if (enabled)
+			mode = MEMMAP_ON_MEMORY_ENABLE;
+		else
+			mode = MEMMAP_ON_MEMORY_DISABLE;
 	}
-
-	ret = kstrtobool(val, &enabled);
-	if (ret < 0)
-		return ret;
-	if (enabled)
-		mode =  MEMMAP_ON_MEMORY_ENABLE;
-	else
-		mode =  MEMMAP_ON_MEMORY_DISABLE;
-
-matched:
 	/*
 	 * Avoid changing memmap mode during hotplug.
 	 */
@@ -104,8 +98,8 @@ static int set_memmap_mode(const char *val, const struct kernel_param *kp)
 	if (mode == MEMMAP_ON_MEMORY_FORCE) {
 		unsigned long memmap_pages = memory_block_memmap_on_memory_pages();
 
-		pr_info("Memory hotplug will reserve %ld pages in each memory block\n",
-			memmap_pages - memory_block_memmap_pages());
+		pr_info_once("Memory hotplug will reserve %ld pages in each memory block\n",
+			     memmap_pages - PFN_UP(memory_block_memmap_size()));
 	}
 	return 0;
 }
@@ -1327,11 +1321,8 @@ static int online_memory_block(struct memory_block *mem, void *arg)
 }
 
 #ifndef arch_supports_memmap_on_memory
-static inline bool arch_supports_memmap_on_memory(unsigned long size)
+static inline bool arch_supports_memmap_on_memory(unsigned long vmemmap_size)
 {
-	unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
-	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
-
 	/*
 	 * As default, we want the vmemmap to span a complete PMD such that we
 	 * can map the vmemmap using a single PMD if supported by the
@@ -1343,8 +1334,7 @@ static inline bool arch_supports_memmap_on_memory(unsigned long size)
 
 static bool mhp_supports_memmap_on_memory(unsigned long size)
 {
-	unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
-	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
+	unsigned long vmemmap_size = memory_block_memmap_size();
 	unsigned long memmap_pages = memory_block_memmap_on_memory_pages();
 
 	/*
@@ -1394,7 +1384,7 @@ static bool mhp_supports_memmap_on_memory(unsigned long size)
 		/* No effective hotplugged memory doesn't make sense. */
 		return false;
 
-	return arch_supports_memmap_on_memory(size);
+	return arch_supports_memmap_on_memory(vmemmap_size);
 }
 
 /*

