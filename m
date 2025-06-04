Return-Path: <linuxppc-dev+bounces-9149-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 105CDACDF09
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jun 2025 15:28:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bC7gN5L2qz2yN2;
	Wed,  4 Jun 2025 23:28:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749043680;
	cv=none; b=jTLpjkCrDuUCaBufSLoOlhsNb4odgS746Y22kJ8GZPTVUPxQQdoU60jX/BIT85+GbLSI90wmBFalu+KKHtZYputM6AZjgaD3L56IX7djCOsUVN0n15hddtq/CSeA+GCtElN9lP/w1Z5g+6fkE+Clwiu4RZLCb2OTvfAk5nQ0Ft+qkefN91DSFcTDMYEHlFxAysDCzKsOmJS+N7KNJgxMiojyaJ3Pk5BIr/LnGjWB7n79//Lu9UoCelbrzpZrz+uWfRI/pAGTa14G3alzIAvd7hhgWWqb0JuoT0xEpfJBt2mRutmH5OXUsxHcZ+uAQrXvpJoDZX6/8AK1gEy1c96wuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749043680; c=relaxed/relaxed;
	bh=SvJHtpwU5FS2FH2sEMqFtRQCjQKN+NWI1URkJw+uf/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZAr7mErnVQwwTzwjivlw5BV97T0eMTn4Q/t8pOeI41PmpKhWFkA/DxEzpavUc+TXMVpEVcJtcO/iRKr8q8n5/vgB5CWATEdvdfazA8FH48JECW0XLTRDOzZJkhV6Kz8cv3mgGBl0Vyj/6y8Atq4hpmu6W8abcyF1ENsIt2w3yF9kD7iqx9ug8gvEsjvxRawy/GOUG8qXL6e8B3y8G5hmQNedEjgYdRUp9zJhLMGpwLBTIIbLCgu7LX2+b68db5q3MfESpn3ZVM0bycplH98nEoAmEcZicPGhFtmDdhVlr8RIUyZiwfFO+PkOWELbIXyMeLy4Zfk1HV8D21XgtDj17Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R0bw2sZX; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R0bw2sZX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bC7gM6PdRz2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jun 2025 23:27:59 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5545LKpO017568;
	Wed, 4 Jun 2025 13:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=SvJHtp
	wU5FS2FH2sEMqFtRQCjQKN+NWI1URkJw+uf/s=; b=R0bw2sZXalP3XqKFeDpVzu
	+TcPYlnNHzVQjJHMjUrxeSElXJ29OS40ej9JPJhXsbFjXiimbOIQfXyB9fvBgpgn
	uIwVnezweKWoU+wjzJr4FkxC4NYEgJWMxmYcMSqRxErIlVfC3ha0VTJ5Xt/+E08A
	uOZpAeLjSwKlLHVxLvPJ73ztIwzm/z41zAt+fs65EupYx6B6NDxSnBBODp4cXeXC
	Fn+38DBD8/utOII8cM4smO+su3D6S50opeNwAldphKH/dEjMqL477ozTLJbxudTO
	p77oRyI8gXGGKvjgcAXDm78sNyp70UfMjLTlDaHVtJqCm11UkawcIG6oUxGAR0hQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 472fwuj9bs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 13:27:43 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 554CSsEt002771;
	Wed, 4 Jun 2025 13:27:42 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 472fwuj9bp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 13:27:42 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 554C6lla022517;
	Wed, 4 Jun 2025 13:27:41 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 470c3tg2vu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 13:27:41 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 554DReDo66978170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Jun 2025 13:27:40 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE36A58068;
	Wed,  4 Jun 2025 13:27:40 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 22F4558052;
	Wed,  4 Jun 2025 13:27:35 +0000 (GMT)
Received: from [9.39.21.166] (unknown [9.39.21.166])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  4 Jun 2025 13:27:34 +0000 (GMT)
Message-ID: <de209828-d237-4912-905b-8c7de7e5734d@linux.ibm.com>
Date: Wed, 4 Jun 2025 18:57:33 +0530
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
Subject: Re: [PATCH v7 1/5] drivers/base/node: Optimize memory block
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
References: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
 <96f7d3a2-2d85-442c-a9f7-e558d4a2ba06@redhat.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <96f7d3a2-2d85-442c-a9f7-e558d4a2ba06@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA5OSBTYWx0ZWRfXxiJQTUViqBo6 OtNBqFwnEI9WPhS5L1uY2nsJCC7M8xU0oaFcjoM/T0Nx35L1QAe77bXRfMyP3EcFz8qGEl935Xp T30qAwnCUj/+cWKSapXi644sUy+Ns7rXss6dgmCFQ7kbY4xTakQxBph5taxdEREEd/abcn5FY6Z
 2NzHZkF6kgkq1pCiFe/g/a8xjxjtSGzhJ+9nEOiD13z6Dgm9nRGkGQ+fIfgPj/8cxleIzGuLntz ZL0y3XGAPJnQofHSG996UrJW4AbwkiNykVonVOouz6yT3IcI4GsiKn3a2aWlfg6JF+HVp4pqvT/ HAO6s91DERzqTQ/se6qmV+1AbA88qyj/e3/hFMtoJiZMvnzxNBuZzQCjMAmiWOkMJo4y6WF0B6B
 WjbCXuHSn/jkOSq4maxnKEhpjmX6ekNYoD0ImSu0g2G17zWhOP2OTHVRkQSLwEds8BRGVcSe
X-Proofpoint-GUID: FBl9wL6YPj3JybCsg8I_1eEkECyG6JgZ
X-Proofpoint-ORIG-GUID: CxxGID8KN88eUD0mhbUT-kQgr7rrf0OX
X-Authority-Analysis: v=2.4 cv=QtVe3Uyd c=1 sm=1 tr=0 ts=684049cf cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=20KFwNOVAAAA:8 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=VnNF1IyMAAAA:8
 a=4TbcEkYQSb79-EmCaOUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506040099
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 6/4/25 3:08 PM, David Hildenbrand wrote:
> On 28.05.25 19:18, Donet Tom wrote:
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
>> Acked-by: David Hildenbrand <david@redhat.com>
>> Acked-by: Oscar Salvador <osalvador@suse.de>
>> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>> Acked-by: Zi Yan <ziy@nvidia.com>
>> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
>>
>> ---
>
> [...]
>
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
> ^ Nit: unrelated change?


Thank you David

I’ll make the change and send the next revision.



