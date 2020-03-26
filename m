Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD41193C67
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 10:58:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48p0mK2c4czDqhn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 20:58:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48p0kX4rQxzDqhK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 20:56:35 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02Q9ZqYn078460
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 05:56:33 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywf3he6n2-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 05:56:32 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Thu, 26 Mar 2020 09:56:24 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 26 Mar 2020 09:56:20 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02Q9uPYS48038068
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Mar 2020 09:56:25 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3752211C058;
 Thu, 26 Mar 2020 09:56:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9525111C050;
 Thu, 26 Mar 2020 09:56:23 +0000 (GMT)
Received: from [9.199.60.66] (unknown [9.199.60.66])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Mar 2020 09:56:23 +0000 (GMT)
Subject: Re: [PATCH] mm/sparse: Fix kernel crash with pfn_section_valid check
To: Michal Hocko <mhocko@kernel.org>
References: <20200325031914.107660-1-aneesh.kumar@linux.ibm.com>
 <20200326094023.GG27965@dhcp22.suse.cz>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Date: Thu, 26 Mar 2020 15:26:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200326094023.GG27965@dhcp22.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20032609-0020-0000-0000-000003BBB371
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032609-0021-0000-0000-000022143D43
Message-Id: <6ef554a6-313d-2b17-cee0-14078ed225f6@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-25_15:2020-03-24,
 2020-03-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0
 priorityscore=1501 adultscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=2
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003260066
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Baoquan He <bhe@redhat.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/26/20 3:10 PM, Michal Hocko wrote:
> On Wed 25-03-20 08:49:14, Aneesh Kumar K.V wrote:
>> Fixes the below crash
>>
>> BUG: Kernel NULL pointer dereference on read at 0x00000000
>> Faulting instruction address: 0xc000000000c3447c
>> Oops: Kernel access of bad area, sig: 11 [#1]
>> LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>> CPU: 11 PID: 7519 Comm: lt-ndctl Not tainted 5.6.0-rc7-autotest #1
>> ...
>> NIP [c000000000c3447c] vmemmap_populated+0x98/0xc0
>> LR [c000000000088354] vmemmap_free+0x144/0x320
>> Call Trace:
>>   section_deactivate+0x220/0x240
> 
> It would be great to match this to the specific source code.

The crash is due to NULL dereference at

test_bit(idx, ms->usage->subsection_map); due to ms->usage = NULL;

that is explained in later part of the commit.
> 
>>   __remove_pages+0x118/0x170
>>   arch_remove_memory+0x3c/0x150
>>   memunmap_pages+0x1cc/0x2f0
>>   devm_action_release+0x30/0x50
>>   release_nodes+0x2f8/0x3e0
>>   device_release_driver_internal+0x168/0x270
>>   unbind_store+0x130/0x170
>>   drv_attr_store+0x44/0x60
>>   sysfs_kf_write+0x68/0x80
>>   kernfs_fop_write+0x100/0x290
>>   __vfs_write+0x3c/0x70
>>   vfs_write+0xcc/0x240
>>   ksys_write+0x7c/0x140
>>   system_call+0x5c/0x68
>>
>> With commit: d41e2f3bd546 ("mm/hotplug: fix hot remove failure in SPARSEMEM|!VMEMMAP case")
>> section_mem_map is set to NULL after depopulate_section_mem(). This
>> was done so that pfn_page() can work correctly with kernel config that disables
>> SPARSEMEM_VMEMMAP. With that config pfn_to_page does
>>
>> 	__section_mem_map_addr(__sec) + __pfn;
>> where
>>
>> static inline struct page *__section_mem_map_addr(struct mem_section *section)
>> {
>> 	unsigned long map = section->section_mem_map;
>> 	map &= SECTION_MAP_MASK;
>> 	return (struct page *)map;
>> }
>>
>> Now with SPASEMEM_VMEMAP enabled, mem_section->usage->subsection_map is used to
>> check the pfn validity (pfn_valid()). Since section_deactivate release
>> mem_section->usage if a section is fully deactivated, pfn_valid() check after
>> a subsection_deactivate cause a kernel crash.
>>
>> static inline int pfn_valid(unsigned long pfn)
>> {
>> ...
>> 	return early_section(ms) || pfn_section_valid(ms, pfn);
>> }
>>
>> where
>>
>> static inline int pfn_section_valid(struct mem_section *ms, unsigned long pfn)
>> {
> 
>> 	int idx = subsection_map_index(pfn);
>>
>> 	return test_bit(idx, ms->usage->subsection_map);
>> }
>>
>> Avoid this by clearing SECTION_HAS_MEM_MAP when mem_section->usage is freed.
> 
> I am sorry, I haven't noticed that during the review of the commit
> mentioned above. This is all subtle as hell, I have to say.
> 
> Why do we have to free usage before deactivaing section memmap? Now that
> we have a late section_mem_map reset shouldn't we tear down the usage in
> the same branch?
> 

We still need to make the section invalid before we call into 
depopulate_section_memmap(). Because architecture like powerpc can share 
vmemmap area across sections (16MB mapping of vmemmap area) and we use 
vmemmap_popluated() to make that decision.



>> Fixes: d41e2f3bd546 ("mm/hotplug: fix hot remove failure in SPARSEMEM|!VMEMMAP case")
>> Cc: Baoquan He <bhe@redhat.com>
>> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>> ---
>>   mm/sparse.c | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/mm/sparse.c b/mm/sparse.c
>> index aadb7298dcef..3012d1f3771a 100644
>> --- a/mm/sparse.c
>> +++ b/mm/sparse.c
>> @@ -781,6 +781,8 @@ static void section_deactivate(unsigned long pfn, unsigned long nr_pages,
>>   			ms->usage = NULL;
>>   		}
>>   		memmap = sparse_decode_mem_map(ms->section_mem_map, section_nr);
>> +		/* Mark the section invalid */
>> +		ms->section_mem_map &= ~SECTION_HAS_MEM_MAP;
> 
> Btw. this comment is not really helping at all.

That is marking the section invalid so that

static inline int valid_section(struct mem_section *section)
{
	return (section && (section->section_mem_map & SECTION_HAS_MEM_MAP));
}


returns false.

> 		/*
> 		 * section->usage is gone and VMEMMAP's pfn_valid depens
> 		 * on it (see pfn_section_valid)
> 		 */
>>   	}
>>   
>>   	if (section_is_early && memmap)
>> -- 
>> 2.25.1
>>
> 

