Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A7A74E8ED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 10:21:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IzFEM/dE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0YkW65B2z3bjV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 18:21:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IzFEM/dE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0Yjb5SVGz3bXH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 18:21:07 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36B8HYNC001507;
	Tue, 11 Jul 2023 08:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=8u1I5/jiEeYXF+RpZUNNUbYm3YyOlWJRLkoP4oh0a+Q=;
 b=IzFEM/dEpB5ELRE/jmT5dsYpW4Lq7Gc3V8wry27iaL2xRm6IVwrsJeuogYXHicxWWGde
 QCmqogkOcQAEd9OaUXg0lN0qNRPzUapY95RpRaul+p5m/lrrYCJdOYlQyWlZix+pe8ac
 yaAm4V9PqF2b1c1uE0Xz97Qde0R0rFszi+znY4E4mAl2NaEx65pzcINH1Gt2beZRgEzR
 8b1W/nbUjKWDuuzoZZFj3SMKiLC5c88fZ1tnxW5lIEQQRlt67Xc6LExHWcPgPr+QYf/R
 h7XAwOFitpTCtBepz3ZCMCfpPCn7FPouosTzMBkG3UCW5kIic8/irtBF5Oh+3xnYHH5e VA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rs3eq01ap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 08:20:51 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36B8Kom5010745;
	Tue, 11 Jul 2023 08:20:50 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rs3eq01a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 08:20:50 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36B30JPD007910;
	Tue, 11 Jul 2023 08:20:48 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3rpye59p3q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 08:20:48 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36B8KkHY47841694
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jul 2023 08:20:46 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 033D220043;
	Tue, 11 Jul 2023 08:20:46 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F2F620040;
	Tue, 11 Jul 2023 08:20:43 +0000 (GMT)
Received: from [9.43.86.43] (unknown [9.43.86.43])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 11 Jul 2023 08:20:43 +0000 (GMT)
Message-ID: <a865e02b-cc61-ecf2-15d5-2ed67fa1fda3@linux.ibm.com>
Date: Tue, 11 Jul 2023 13:50:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 4/7] mm/hotplug: Allow pageblock alignment via altmap
 reservation
To: "Huang, Ying" <ying.huang@intel.com>
References: <20230711044834.72809-1-aneesh.kumar@linux.ibm.com>
 <20230711044834.72809-5-aneesh.kumar@linux.ibm.com>
 <87ilardl36.fsf@yhuang6-desk2.ccr.corp.intel.com>
Content-Language: en-US
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <87ilardl36.fsf@yhuang6-desk2.ccr.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dklQH766M5Jxqr848dkXvREICvzj6lPf
X-Proofpoint-ORIG-GUID: l73puUuOGK_enMIY0Ir4ypxw7CZ1Z473
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_04,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307110071
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
Cc: Michal Hocko <mhocko@suse.com>, David Hildenbrand <david@redhat.com>, linux-mm@kvack.org, npiggin@gmail.com, Vishal Verma <vishal.l.verma@intel.com>, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/11/23 11:51 AM, Huang, Ying wrote:
> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> 
>> Add a new kconfig option that can be selected if we want to allow
>> pageblock alignment by reserving pages in the vmemmap altmap area.
>> This implies we will be reserving some pages for every memoryblock
>> This also allows the memmap on memory feature to be widely useful
>> with different memory block size values.
>>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  mm/Kconfig          |  9 +++++++
>>  mm/memory_hotplug.c | 59 +++++++++++++++++++++++++++++++++++++--------
>>  2 files changed, 58 insertions(+), 10 deletions(-)
>>
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index 932349271e28..88a1472b2086 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -570,6 +570,15 @@ config MHP_MEMMAP_ON_MEMORY
>>  	depends on MEMORY_HOTPLUG && SPARSEMEM_VMEMMAP
>>  	depends on ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
>>  
>> +config MHP_RESERVE_PAGES_MEMMAP_ON_MEMORY
>> +       bool "Allow Reserving pages for page block aligment"
>> +       depends on MHP_MEMMAP_ON_MEMORY
>> +       help
>> +	This option allows memmap on memory feature to be more useful
>> +	with different memory block sizes. This is achieved by marking some pages
>> +	in each memory block as reserved so that we can get page-block alignment
>> +	for the remaining pages.
>> +
>>  endif # MEMORY_HOTPLUG
>>  
>>  config ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
>> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
>> index 07c99b0cc371..f36aec1f7626 100644
>> --- a/mm/memory_hotplug.c
>> +++ b/mm/memory_hotplug.c
>> @@ -1252,15 +1252,17 @@ static inline bool arch_supports_memmap_on_memory(unsigned long size)
>>  {
>>  	unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
>>  	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
>> -	unsigned long remaining_size = size - vmemmap_size;
>>  
>> -	return IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
>> -		IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT));
>> +	return IS_ALIGNED(vmemmap_size, PMD_SIZE);
>>  }
>>  #endif
>>  
>>  static bool mhp_supports_memmap_on_memory(unsigned long size)
>>  {
>> +	unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
>> +	unsigned long vmemmap_size = nr_vmemmap_pages * sizeof(struct page);
>> +	unsigned long remaining_size = size - vmemmap_size;
>> +
>>  	/*
>>  	 * Besides having arch support and the feature enabled at runtime, we
>>  	 * need a few more assumptions to hold true:
>> @@ -1287,9 +1289,30 @@ static bool mhp_supports_memmap_on_memory(unsigned long size)
>>  	 *       altmap as an alternative source of memory, and we do not exactly
>>  	 *       populate a single PMD.
>>  	 */
>> -	return mhp_memmap_on_memory() &&
>> -		size == memory_block_size_bytes() &&
>> -		arch_supports_memmap_on_memory(size);
>> +	if (!mhp_memmap_on_memory() || size != memory_block_size_bytes())
>> +		return false;
>> +	 /*
>> +	  * Without page reservation remaining pages should be pageblock aligned.
>> +	  */
>> +	if (!IS_ENABLED(CONFIG_MHP_RESERVE_PAGES_MEMMAP_ON_MEMORY) &&
>> +	    !IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT)))
>> +		return false;
>> +
>> +	return arch_supports_memmap_on_memory(size);
>> +}
>> +
>> +static inline unsigned long memory_block_align_base(unsigned long size)
>> +{
>> +	if (IS_ENABLED(CONFIG_MHP_RESERVE_PAGES_MEMMAP_ON_MEMORY)) {
>> +		unsigned long align;
>> +		unsigned long nr_vmemmap_pages = size >> PAGE_SHIFT;
>> +		unsigned long vmemmap_size;
>> +
>> +		vmemmap_size = (nr_vmemmap_pages * sizeof(struct page)) >> PAGE_SHIFT;
> 
> DIV_ROUND_UP()?
> 
>

yes. Will update.

		vmemmap_size = DIV_ROUND_UP(nr_vmemmap_pages * sizeof(struct page), PAGE_SIZE);

-aneesh

