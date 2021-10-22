Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92879437F42
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Oct 2021 22:19:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbbKg19HHz3cFM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Oct 2021 07:19:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bLQhnMkl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=brking@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=bLQhnMkl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HbbJv1rkSz2ywK
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Oct 2021 07:18:38 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19MJa95w021094; 
 Fri, 22 Oct 2021 16:18:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=tXrXvPmlGZ4umXTjbk38SRwJiBMEkhsESLWeKy2+rQA=;
 b=bLQhnMklslkboaoq40igDzh12Ta7idNo71IqmhFWq1QMk+vrPUBZa1Yx+u27fX4C0le9
 7CoAgGE+pXCZ+wkECZo9Op5/t245eJuH0wsj9TYMbzMy8n1KARSjwm/eurOI/htjStR2
 DMFAYarMpl0A3wje5mNqMYWyYeICuxDaZWcrym0QGdv7CZFtaMDpbhYAqff9kQE/5YVm
 XfuNIesjt3oaILxSmXP1QQmngNOl9AJqnLFX3cO3h4Qf2YQvIPUoTLu7FNrLLT69phDI
 MaXn44xk6PvBgCnFEYdnyf2hGRX5vf0H/WhwDMO10lshRW343xU5uM41E2z/k7B+1nCC /Q== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bux4ufnem-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Oct 2021 16:18:36 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19MKHlPo029805;
 Fri, 22 Oct 2021 20:18:35 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 3bqpcesrn9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Oct 2021 20:18:35 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19MKIY7311600412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Oct 2021 20:18:34 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C2812AE05F;
 Fri, 22 Oct 2021 20:18:34 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 735D5AE064;
 Fri, 22 Oct 2021 20:18:34 +0000 (GMT)
Received: from [9.211.118.126] (unknown [9.211.118.126])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 22 Oct 2021 20:18:34 +0000 (GMT)
Message-ID: <e4120ddc-8cac-c722-2379-ecc44bd9ef89@linux.vnet.ibm.com>
Date: Fri, 22 Oct 2021 15:18:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] powerpc: Enhance pmem DMA bypass handling
Content-Language: en-US
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20211021174449.120875-1-brking@linux.vnet.ibm.com>
 <84b82d2b-1263-39bb-d966-b432af530ca8@ozlabs.ru>
From: Brian King <brking@linux.vnet.ibm.com>
In-Reply-To: <84b82d2b-1263-39bb-d966-b432af530ca8@ozlabs.ru>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qZf7tipis8Ajem0Yr99SgujCpVe3mkDa
X-Proofpoint-GUID: qZf7tipis8Ajem0Yr99SgujCpVe3mkDa
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-22_05,2021-10-22_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2109230001 definitions=main-2110220112
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/22/21 7:24 AM, Alexey Kardashevskiy wrote:
> 
> 
> On 22/10/2021 04:44, Brian King wrote:
>> If ibm,pmemory is installed in the system, it can appear anywhere
>> in the address space. This patch enhances how we handle DMA for devices when
>> ibm,pmemory is present. In the case where we have enough DMA space to
>> direct map all of RAM, but not ibm,pmemory, we use direct DMA for
>> I/O to RAM and use the default window to dynamically map ibm,pmemory.
>> In the case where we only have a single DMA window, this won't work, > so if the window is not big enough to map the entire address range,
>> we cannot direct map.
> 
> but we want the pmem range to be mapped into the huge DMA window too if we can, why skip it?

This patch should simply do what the comment in this commit mentioned below suggests, which says that
ibm,pmemory can appear anywhere in the address space. If the DMA window is large enough
to map all of MAX_PHYSMEM_BITS, we will indeed simply do direct DMA for everything,
including the pmem. If we do not have a big enough window to do that, we will do
direct DMA for DRAM and dynamic mapping for pmem.


https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/powerpc/platforms/pseries/iommu.c?id=bf6e2d562bbc4d115cf322b0bca57fe5bbd26f48


Thanks,

Brian


> 
> 
>>
>> Signed-off-by: Brian King <brking@linux.vnet.ibm.com>
>> ---
>>   arch/powerpc/platforms/pseries/iommu.c | 19 ++++++++++---------
>>   1 file changed, 10 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
>> index 269f61d519c2..d9ae985d10a4 100644
>> --- a/arch/powerpc/platforms/pseries/iommu.c
>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>> @@ -1092,15 +1092,6 @@ static phys_addr_t ddw_memory_hotplug_max(void)
>>       phys_addr_t max_addr = memory_hotplug_max();
>>       struct device_node *memory;
>>   -    /*
>> -     * The "ibm,pmemory" can appear anywhere in the address space.
>> -     * Assuming it is still backed by page structs, set the upper limit
>> -     * for the huge DMA window as MAX_PHYSMEM_BITS.
>> -     */
>> -    if (of_find_node_by_type(NULL, "ibm,pmemory"))
>> -        return (sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ?
>> -            (phys_addr_t) -1 : (1ULL << MAX_PHYSMEM_BITS);
>> -
>>       for_each_node_by_type(memory, "memory") {
>>           unsigned long start, size;
>>           int n_mem_addr_cells, n_mem_size_cells, len;
>> @@ -1341,6 +1332,16 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>>        */
>>       len = max_ram_len;
>>       if (pmem_present) {
>> +        if (default_win_removed) {
>> +            /*
>> +             * If we only have one DMA window and have pmem present,
>> +             * then we need to be able to map the entire address
>> +             * range in order to be able to do direct DMA to RAM.
>> +             */
>> +            len = order_base_2((sizeof(phys_addr_t) * 8 <= MAX_PHYSMEM_BITS) ?
>> +                    (phys_addr_t) -1 : (1ULL << MAX_PHYSMEM_BITS));
>> +        }
>> +
>>           if (query.largest_available_block >=
>>               (1ULL << (MAX_PHYSMEM_BITS - page_shift)))
>>               len = MAX_PHYSMEM_BITS;
>>
> 


-- 
Brian King
Power Linux I/O
IBM Linux Technology Center

