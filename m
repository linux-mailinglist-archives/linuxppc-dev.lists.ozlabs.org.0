Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE7E7498A0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 11:38:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bUz4/1ds;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxWfd0b11z3bw3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 19:38:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bUz4/1ds;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxWdk2c6jz30FW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 19:37:14 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3669PVbs031615;
	Thu, 6 Jul 2023 09:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=lsEuEouBJM/oM6T4HZoDCXVCcTnotXLPBnZ//YxJqIY=;
 b=bUz4/1ds3TfbInLcU8q9D6pPD8X+35zeQWR5pZ4IPIbgkG04IfMRKYP3XfICvxh/4enl
 fZGGy6sjguohUK0gj79zLoJxDjpM2BfVdHK0mIpI/BvDoqlOxcG2MQ1kTK5TKBMU/sGQ
 YfSgzXJN6K0F/ybmZBMzMTgc6OyRHHkLm+4bRgMVR/3v2SbU3WVs3SM4JQxcxIfLwtVE
 oLuALNd+2mQWPG2Ab2vBqaRUEMCv/igWTVLh6M15tEn5tw7mwiyi0evyGEePchm+7rI8
 7zN3xiV2sYKlfIoGpqdv2/y9ZNi8a8KZ8iXassi2v59iQvfWxHQQUguSrSYmzSShviD3 AA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rntyhr9bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 09:37:01 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3669R2eW003555;
	Thu, 6 Jul 2023 09:36:59 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rntyhr98r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 09:36:59 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3666h16a021407;
	Thu, 6 Jul 2023 09:36:55 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3rjbde37yu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 09:36:55 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3669arkA17891984
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jul 2023 09:36:53 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3467020043;
	Thu,  6 Jul 2023 09:36:53 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1924F20040;
	Thu,  6 Jul 2023 09:36:51 +0000 (GMT)
Received: from [9.109.212.144] (unknown [9.109.212.144])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Jul 2023 09:36:50 +0000 (GMT)
Message-ID: <996e226a-2835-5b53-2255-2005c6335f98@linux.ibm.com>
Date: Thu, 6 Jul 2023 15:06:50 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 1/5] mm/hotplug: Embed vmem_altmap details in memory
 block
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
References: <20230706085041.826340-1-aneesh.kumar@linux.ibm.com>
 <20230706085041.826340-2-aneesh.kumar@linux.ibm.com>
 <72488b8a-8f1e-c652-ab48-47e38290441f@redhat.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <72488b8a-8f1e-c652-ab48-47e38290441f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FqosHItVZtqNEHwhJZKaBfzW0Dg2__Cc
X-Proofpoint-GUID: On65A8KHq7Qb9JUHMO3uSYqEYXV64uh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_06,2023-07-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxlogscore=777
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060084
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

On 7/6/23 2:48 PM, David Hildenbrand wrote:
> On 06.07.23 10:50, Aneesh Kumar K.V wrote:
>> With memmap on memory, some architecture needs more details w.r.t altmap
>> such as base_pfn, end_pfn, etc to unmap vmemmap memory.
> 
> Can you elaborate why ppc64 needs that and x86-64 + aarch64 don't?
> 
> IOW, why can't ppc64 simply allocate the vmemmap from the start of the memblock (-> base_pfn) and use the stored number of vmemmap pages to calculate the end_pfn?
> 
> To rephrase: if the vmemmap is not at the beginning and doesn't cover full apgeblocks, memory onlining/offlining would be broken.
> 
> [...]


With ppc64 and 64K pagesize and different memory block sizes, we can end up allocating vmemmap backing memory from outside altmap because 
a single page vmemmap can cover 1024 pages (64 *1024/sizeof(struct page)). and that can point to pages outside the dev_pagemap range. 
So on free we  check 

vmemmap_free() {
...
	if (altmap) {
		alt_start = altmap->base_pfn;
		alt_end = altmap->base_pfn + altmap->reserve +
			  altmap->free + altmap->alloc + altmap->align;
	}

...
		if (base_pfn >= alt_start && base_pfn < alt_end) {
			vmem_altmap_free(altmap, nr_pages);

to see whether we did use altmap for the vmemmap allocation. 

> 
>>   +/**
>> + * struct vmem_altmap - pre-allocated storage for vmemmap_populate
>> + * @base_pfn: base of the entire dev_pagemap mapping
>> + * @reserve: pages mapped, but reserved for driver use (relative to @base)
>> + * @free: free pages set aside in the mapping for memmap storage
>> + * @align: pages reserved to meet allocation alignments
>> + * @alloc: track pages consumed, private to vmemmap_populate()
>> + */
>> +struct vmem_altmap {
>> +    unsigned long base_pfn;
>> +    const unsigned long end_pfn;
>> +    const unsigned long reserve;
>> +    unsigned long free;
>> +    unsigned long align;
>> +    unsigned long alloc;
>> +};
> 
> Instead of embedding that, what about conditionally allocating it and store a pointer to it in the "struct memory_block"?
> 
> In the general case as of today, we don't have an altmap.
> 

Sure but with memmap on memory option it is essentially adding that right?. Is the concern related to the increase in the size of
struct memory_block  ?

>> +
>>   struct memory_block {
>>       unsigned long start_section_nr;
>>       unsigned long state;        /* serialized by the dev->lock */
>> @@ -77,11 +94,7 @@ struct memory_block {
>>        */
>>       struct zone *zone;
>>       struct device dev;
>> -    /*
>> -     * Number of vmemmap pages. These pages
>> -     * lay at the beginning of the memory block.
>> -     */
>> -    unsigned long nr_vmemmap_pages;
>> +    struct vmem_altmap altmap;
>>       struct memory_group *group;    /* group (if any) for this block */
>>       struct list_head group_next;    /* next block inside memory group */
>>   #if defined(CONFIG_MEMORY_FAILURE) && defined(CONFIG_MEMORY_HOTPLUG)
>> @@ -147,7 +160,7 @@ static inline int hotplug_memory_notifier(notifier_fn_t fn, int pri)
>>   extern int register_memory_notifier(struct notifier_block *nb);
>>   extern void unregister_memory_notifier(struct notifier_block *nb);
>>   int create_memory_block_devices(unsigned long start, unsigned long size,
> 
> [...]
> 
>>   static int check_cpu_on_node(int nid)
>> @@ -2036,9 +2042,8 @@ EXPORT_SYMBOL(try_offline_node);
>>     static int __ref try_remove_memory(u64 start, u64 size)
>>   {
>> -    struct vmem_altmap mhp_altmap = {};
>> +    int ret;
>>       struct vmem_altmap *altmap = NULL;
>> -    unsigned long nr_vmemmap_pages;
>>       int rc = 0, nid = NUMA_NO_NODE;
>>         BUG_ON(check_hotplug_memory_range(start, size));
>> @@ -2060,24 +2065,16 @@ static int __ref try_remove_memory(u64 start, u64 size)
>>        * We only support removing memory added with MHP_MEMMAP_ON_MEMORY in
>>        * the same granularity it was added - a single memory block.
>>        */
>> +
> 
> ^ unrealted change?
> 

