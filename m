Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FF876C440
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 06:48:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cMXXFtlN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFzy710qQz306t
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Aug 2023 14:48:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cMXXFtlN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFzxD5Hwtz2yD4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Aug 2023 14:47:44 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3724hUVN008396;
	Wed, 2 Aug 2023 04:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=JFw7hHzZOf+ON7J4oo8aOkciqxzopnT79nPV0gBC474=;
 b=cMXXFtlNKedm3pRL/OaOVRuhauLujhQ8w2bezz/Run0RtcdQp2ch1Y1vN9gBExSJjrr1
 IvzdYLRsazyESh2CvSdddiFFjUlsktd/YrdvUwXSb3cTZJgVyDeg7IwhrdaRbUidCsAm
 PLgyoY9PrsTZdU7Lwe8IoYOz00xPBc0fKTOE7mZvR3cxZ1r6N7ytjZup93JRcvWeeam0
 UYQD8rTMVDNbHYoHCOh0lpXaUWyYBoHV7tZP6xpN7oPEOX6ge4XLz9TpMFf4yvKzS10C
 XAm/w5ckyLC/mftvNG9VJWZEeGqh/7Go3CMdH/Yv5flU6RzyQxtpJSqwF/Us1RMlxHJJ yw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s7g0dgdkx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 04:47:29 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3724jYhw013211;
	Wed, 2 Aug 2023 04:47:29 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s7g0dgdkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 04:47:29 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3723cuVi017005;
	Wed, 2 Aug 2023 04:47:28 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s5dfy9xsx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 02 Aug 2023 04:47:28 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3724lQP459244852
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 2 Aug 2023 04:47:26 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 257FC2004B;
	Wed,  2 Aug 2023 04:47:26 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF68A20043;
	Wed,  2 Aug 2023 04:47:23 +0000 (GMT)
Received: from [9.43.11.83] (unknown [9.43.11.83])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  2 Aug 2023 04:47:23 +0000 (GMT)
Message-ID: <db0b450c-e9e8-74d3-8db2-99c22810e085@linux.ibm.com>
Date: Wed, 2 Aug 2023 10:17:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 6/7] mm/memory_hotplug: Embed vmem_altmap details in
 memory block
Content-Language: en-US
To: "Verma, Vishal L" <vishal.l.verma@intel.com>,
        "linux-mm@kvack.org" <linux-mm@kvack.org>,
        "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "npiggin@gmail.com" <npiggin@gmail.com>,
        "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>
References: <20230801044116.10674-1-aneesh.kumar@linux.ibm.com>
 <20230801044116.10674-7-aneesh.kumar@linux.ibm.com>
 <715042319ceb86016a4986862a82756e5629d725.camel@intel.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <715042319ceb86016a4986862a82756e5629d725.camel@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: U9fPAIQYB6PCJIIyuJcKN09_fD8n4lv5
X-Proofpoint-GUID: bXFNebUh7kWWccHrBlWCuddNUSZ6HRaw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-02_02,2023-08-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=879 malwarescore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308020040
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
Cc: "Hocko, Michal" <mhocko@suse.com>, "david@redhat.com" <david@redhat.com>, "osalvador@suse.de" <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 8/2/23 4:40 AM, Verma, Vishal L wrote:
> On Tue, 2023-08-01 at 10:11 +0530, Aneesh Kumar K.V wrote:
>> With memmap on memory, some architecture needs more details w.r.t altmap
>> such as base_pfn, end_pfn, etc to unmap vmemmap memory. Instead of
>> computing them again when we remove a memory block, embed vmem_altmap
>> details in struct memory_block if we are using memmap on memory block
>> feature.
>>
>> Acked-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>  drivers/base/memory.c  | 27 +++++++++++++--------
>>  include/linux/memory.h |  8 ++----
>>  mm/memory_hotplug.c    | 55 ++++++++++++++++++++++++++----------------
>>  3 files changed, 53 insertions(+), 37 deletions(-)
>>
> <snip>
> 
>> @@ -2136,10 +2148,10 @@ EXPORT_SYMBOL(try_offline_node);
>>  
>>  static int __ref try_remove_memory(u64 start, u64 size)
>>  {
>> -       struct vmem_altmap mhp_altmap = {};
>> -       struct vmem_altmap *altmap = NULL;
>> -       unsigned long nr_vmemmap_pages;
>> +       int ret;
> 
> Minor nit - there is already an 'int rc' below - just use that, or
> rename it to 'ret' if that's better for consistency.
> 


I reused the existing rc variable. 

>> +       struct memory_block *mem;
>>         int rc = 0, nid = NUMA_NO_NODE;
>> +       struct vmem_altmap *altmap = NULL;
>>  
>>         BUG_ON(check_hotplug_memory_range(start, size));
>>  
>> @@ -2161,25 +2173,20 @@ static int __ref try_remove_memory(u64 start, u64 size)
>>          * the same granularity it was added - a single memory block.
>>          */
>>         if (mhp_memmap_on_memory()) {
>> -               nr_vmemmap_pages = walk_memory_blocks(start, size, NULL,
>> -                                                     get_nr_vmemmap_pages_cb);
>> -               if (nr_vmemmap_pages) {
>> +               ret = walk_memory_blocks(start, size, &mem, test_has_altmap_cb);
>> +               if (ret) {
>>                         if (size != memory_block_size_bytes()) {
>>                                 pr_warn("Refuse to remove %#llx - %#llx,"
>>                                         "wrong granularity\n",
>>                                         start, start + size);
>>                                 return -EINVAL;
>>                         }
>> -
>> +                       altmap = mem->altmap;
>>                         /*
>> -                        * Let remove_pmd_table->free_hugepage_table do the
>> -                        * right thing if we used vmem_altmap when hot-adding
>> -                        * the range.
>> +                        * Mark altmap NULL so that we can add a debug
>> +                        * check on memblock free.
>>                          */
>> -                       mhp_altmap.base_pfn = PHYS_PFN(start);
>> -                       mhp_altmap.free = nr_vmemmap_pages;
>> -                       mhp_altmap.alloc = nr_vmemmap_pages;
>> -                       altmap = &mhp_altmap;
>> +                       mem->altmap = NULL;
>>                 }
>>         }
>>  


Thank you for taking the time to review the patch.

-aneesh
