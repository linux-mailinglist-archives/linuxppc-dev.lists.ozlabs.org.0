Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0112874A1CE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 18:08:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pOklfIO+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxhJw6HXCz3c24
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 02:08:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pOklfIO+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxhJ25xQDz3brb
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 02:07:30 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 366FrvSI018319;
	Thu, 6 Jul 2023 16:07:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=EfwFJTBXrAy/0+QUpLOPg8xoAC239JYbRRDW5l7O9Yw=;
 b=pOklfIO+5Ptl6xYcvROdjgtEneNmd4zynvy+VtUQe8bAMatMAVPm6FwHdQ8+fQ2hWbNw
 rclnO1Komlh2qfK1DwvSZPan6+mxlk3zWi2l363vclfacDjrePl6yq1ZBJu6ATsG2l95
 8havYLv3QKtZOlt5R9U0E6IZ6u/kTH3VquE0u5DR2XphZcQXOn5iejAHqbNNdaYV+66p
 CFyt2hcIV7p2rmA8DnQkPdSMEmeklRL73WyJtiuB1P1X8o7xV1afdvavG505lhETzxDk
 mRg9tBSpu4qawXguPzufJLgNZGlo7982pcJHc+h3he9Fk0YbXI6D2Un5fP8TgRnKXGZo 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rp0nhra79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 16:07:07 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 366FuoTN024105;
	Thu, 6 Jul 2023 16:07:05 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rp0nhr9yj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 16:07:05 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 366FdLtr016708;
	Thu, 6 Jul 2023 16:06:58 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3rjbddtgx4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Jul 2023 16:06:58 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 366G6uXP10355414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Jul 2023 16:06:56 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1DB162004D;
	Thu,  6 Jul 2023 16:06:56 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCE3320043;
	Thu,  6 Jul 2023 16:06:53 +0000 (GMT)
Received: from [9.43.113.146] (unknown [9.43.113.146])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Jul 2023 16:06:53 +0000 (GMT)
Message-ID: <1a35cb1c-5be5-3fba-d59f-132b36863312@linux.ibm.com>
Date: Thu, 6 Jul 2023 21:36:52 +0530
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
 <996e226a-2835-5b53-2255-2005c6335f98@linux.ibm.com>
 <e975f02b-1d35-8f22-9f3a-dfe0209306a1@redhat.com>
 <9ca978e7-5c09-6d92-7983-03a731549b25@linux.ibm.com>
 <256bd2f0-1b77-26dc-6393-b26dd363912f@redhat.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <256bd2f0-1b77-26dc-6393-b26dd363912f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YdghUj-MyhSLaeTnANBhfrgf6QSyZsR3
X-Proofpoint-GUID: pAN36dC5SZXeJkH4FVR00TYdN819shXn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-06_11,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 spamscore=0 mlxlogscore=939 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307060144
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

On 7/6/23 6:29 PM, David Hildenbrand wrote:
> On 06.07.23 14:32, Aneesh Kumar K V wrote:
>> On 7/6/23 4:44 PM, David Hildenbrand wrote:
>>> On 06.07.23 11:36, Aneesh Kumar K V wrote:
>>>> On 7/6/23 2:48 PM, David Hildenbrand wrote:
>>>>> On 06.07.23 10:50, Aneesh Kumar K.V wrote:
>>>>>> With memmap on memory, some architecture needs more details w.r.t altmap
>>>>>> such as base_pfn, end_pfn, etc to unmap vmemmap memory.
>>>>>
>>>>> Can you elaborate why ppc64 needs that and x86-64 + aarch64 don't?
>>>>>
>>>>> IOW, why can't ppc64 simply allocate the vmemmap from the start of the memblock (-> base_pfn) and use the stored number of vmemmap pages to calculate the end_pfn?
>>>>>
>>>>> To rephrase: if the vmemmap is not at the beginning and doesn't cover full apgeblocks, memory onlining/offlining would be broken.
>>>>>
>>>>> [...]
>>>>
>>>>
>>>> With ppc64 and 64K pagesize and different memory block sizes, we can end up allocating vmemmap backing memory from outside altmap because
>>>> a single page vmemmap can cover 1024 pages (64 *1024/sizeof(struct page)). and that can point to pages outside the dev_pagemap range.
>>>> So on free we  check
>>>
>>> So you end up with a mixture of altmap and ordinarily-allocated vmemmap pages? That sound wrong (and is counter-intuitive to the feature in general, where we *don't* want to allocate the vmemmap from outside the altmap).
>>>
>>> (64 * 1024) / sizeof(struct page) -> 1024 pages
>>>
>>> 1024 pages * 64k = 64 MiB.
>>>
>>> What's the memory block size on these systems? If it's >= 64 MiB the vmemmap of a single memory block fits into a single page and we should be fine.
>>>
>>> Smells like you want to disable the feature on a 64k system.
>>>
>>
>> But that part of vmemmap_free is common for both dax,dax kmem and the new memmap on memory feature. ie, ppc64 vmemmap_free have checks which require
>> a full altmap structure with all the details in. So for memmap on memmory to work on ppc64 we do require similar altmap struct. Hence the idea
>> of adding vmemmap_altmap to  struct memory_block
> 
> I'd suggest making sure that for the memmap_on_memory case your really *always* allocate from the altmap (that's what the feature is about after all), and otherwise block the feature (i.e., arch_mhp_supports_... should reject it).
>

Sure. How about?

bool mhp_supports_memmap_on_memory(unsigned long size)
{

	unsigned long nr_pages = size >> PAGE_SHIFT;
	unsigned long vmemmap_size = nr_pages * sizeof(struct page);

	if (!radix_enabled())
		return false;
	/*
	 * memmap on memory only supported with memory block size add/remove
	 */
	if (size != memory_block_size_bytes())
		return false;
	/*
	 * Also make sure the vmemmap allocation is fully contianed
	 * so that we always allocate vmemmap memory from altmap area.
	 */
	if (!IS_ALIGNED(vmemmap_size,  PAGE_SIZE))
		return false;
	/*
	 * The pageblock alignment requirement is met by using
	 * reserve blocks in altmap.
	 */
	return true;
}



 
> Then, you can reconstruct the altmap layout trivially
> 
> base_pfn: start of the range to unplug
> end_pfn: base_pfn + nr_vmemmap_pages
> 
> and pass that to the removal code, which will do the right thing, no?
> 
> 
> Sure, remembering the altmap might be a potential cleanup (eventually?), but the basic reasoning why this is required as patch #1 IMHO is wrong: if you say you support memmap_on_memory for a configuration, then you should also properly support it (allocate from the hotplugged memory), not silently fall back to something else.

I guess you want to keep the altmap introduction as a later patch in the series and not the preparatory patch? Or are you ok with just adding the additional check I mentioned above w.r.t size value and keep this patch as patch 1  as a generic cleanup (avoiding
the recomputation of altmap->alloc/base_pfn/end_pfn? 

-aneesh
 

