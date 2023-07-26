Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F877632F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 11:58:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D1jyif9p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R9q8v6Xptz3cHP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jul 2023 19:58:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D1jyif9p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R9q831Ggdz2yV0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jul 2023 19:57:38 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36Q9hvcl031650;
	Wed, 26 Jul 2023 09:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BqZYcT6XfXu2gr81b+6q3Ti6ZXZwQJQOHCHVljmuHhU=;
 b=D1jyif9puAJyl74UZxCM1C6BiGgOxiPjmZuFMwn6JBwl6TMv4Dy7hJT7smsmRKAU3KtN
 +Zp3ro8bBhuMUusBAzKNlZMl+JnZ6RfD4NjNx4pKm7ky1xMwXitntwQPDcPEHlLfX8XX
 HB3l3mMYvxkPUVf/qc+HmIjWC63LUSVolyVAIdMugwColwQUE0D/z+qcJmFBzCtyhwgU
 oGFpqc1CbO42jO19i96rjZhwJoySEoOg9K0HDkKRIytc7vaayL1F8sW5G3/8EwXhBqfk
 6xK48uc7n3aZ6uATMUkvrMP0erAX2Viy6Nn7Zw/PVkFQk8gKp9XZ8uZAx7Dsnd1uKbN5 rw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s314309x7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 09:57:24 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36Q9j7r2002249;
	Wed, 26 Jul 2023 09:57:24 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s314309x0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 09:57:24 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36Q9tSAC016644;
	Wed, 26 Jul 2023 09:57:23 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s0v51b8n3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Jul 2023 09:57:23 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36Q9vLI115073956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Jul 2023 09:57:21 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B77B220043;
	Wed, 26 Jul 2023 09:57:21 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D71E920040;
	Wed, 26 Jul 2023 09:57:18 +0000 (GMT)
Received: from [9.43.89.11] (unknown [9.43.89.11])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Jul 2023 09:57:18 +0000 (GMT)
Message-ID: <9d1448d3-a43a-5305-68aa-d82111fe077a@linux.ibm.com>
Date: Wed, 26 Jul 2023 15:27:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 4/7] mm/hotplug: Support memmap_on_memory when memmap
 is not aligned to pageblocks
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org,
        akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
References: <20230725100212.531277-1-aneesh.kumar@linux.ibm.com>
 <20230725100212.531277-5-aneesh.kumar@linux.ibm.com>
 <e1a4430e-d3ae-711b-7efa-5085934b62fd@redhat.com>
 <875y67xpsi.fsf@linux.ibm.com>
 <aeab0767-457a-a2d1-8b23-4dde5acf48f4@redhat.com>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <aeab0767-457a-a2d1-8b23-4dde5acf48f4@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: __LZwCwYv89qe4Q6dxbtD00gSbpiZfZp
X-Proofpoint-GUID: t3rQNMuH6pogHCaHshYnMjI3WPPkFLS-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_03,2023-07-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 mlxlogscore=831 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307260084
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

On 7/26/23 2:34 PM, David Hildenbrand wrote:
> 
>>>>    /*
>>>> @@ -1310,7 +1400,10 @@ int __ref add_memory_resource(int nid, struct resource *res, mhp_t mhp_flags)
>>>>    {
>>>>        struct mhp_params params = { .pgprot = pgprot_mhp(PAGE_KERNEL) };
>>>>        enum memblock_flags memblock_flags = MEMBLOCK_NONE;
>>>> -    struct vmem_altmap mhp_altmap = {};
>>>> +    struct vmem_altmap mhp_altmap = {
>>>> +        .base_pfn =  PHYS_PFN(res->start),
>>>> +        .end_pfn  =  PHYS_PFN(res->end),
>>>
>>> Is it required to set .end_pfn, and if so, shouldn't we also set it to
>>> base_pfn + memory_block_memmap_on_memory_pages()) ?
>>>
>>
>> We use that in ppc64 for checking altmap boundary condition. As we
>> discussed earlier, ppc64 due to vmemmap mapping size restrictions can't
>> always allocate vmemmap pages from altmap area even if requested. We
>> fallback to regular memory alocation in that case (only used now with
>> pmem). We use altmap.end_pfn for that boundary check. You can refer to
>> altmap_cross_boundary() for more details.
> 
> But even then, setting the end to the end of the resource size is wrong, no? We don't want anybody to allocate beyond base_pfn + memory_block_memmap_on_memory_pages().
> 

altmap.end is the end pfn of the resource

__nvdimm_setup_pfn()
...
        resource_size_t end = nsio->res.end - end_trunc;
	struct vmem_altmap __altmap = {
		.base_pfn = init_altmap_base(base),
		.reserve = init_altmap_reserve(base),
		.end_pfn = PHYS_PFN(end),
	};


And we use it to find that the page_to_pfn mapping we use by allocating a page from altmap doesn't point to a pfn that is outside the resource range.

-aneesh
