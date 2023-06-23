Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98B3F73BADF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 16:56:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l3RPP/o3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QngLQ3vRfz3bv2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Jun 2023 00:56:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=l3RPP/o3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QngKT01Mhz3bPJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jun 2023 00:55:56 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35NEaulh009317;
	Fri, 23 Jun 2023 14:55:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=jpQ6m6wjZqLJkkjhYviBEvZmhe34w4C9NNFVSCRCwEI=;
 b=l3RPP/o3WfTqnsJ2KzSjWeehqP0iFkY/rPMmOmeyBCgFTxq6tZbHSlAFua/QfD87wgQr
 gc8TjZ2ikMotcX6yQMRILK12CAc1rvMJJ3ihBrLTUw5srDPo6QgtrHfZuDyegN6V1wJq
 nZrxUFOxG7ouF6gd7SkgP6BZnV2ZgNycEM/nOWBsGRFCKbtJPXiDVfN57YGQpETq+o0Z
 HHXtlu9U57sJJC7rAYi+k8EeTT5PCyLyyH3U+X1Smst01AudjTg1aIAfEOYJvUKf/SKw
 FATvEaQxtZ+D99A3EMdA4oPwQZSIikyEngv7r8vTSLLUh9PFgMgqRwKxww4CfoqNc26o 7A== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rdcjg1pxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jun 2023 14:55:49 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35NCuHDV020227;
	Fri, 23 Jun 2023 14:55:48 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3r94f6qcgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jun 2023 14:55:48 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35NEtl1721299568
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Jun 2023 14:55:47 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B126C58051;
	Fri, 23 Jun 2023 14:55:47 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 582BB5805C;
	Fri, 23 Jun 2023 14:55:47 +0000 (GMT)
Received: from [9.67.61.118] (unknown [9.67.61.118])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Jun 2023 14:55:47 +0000 (GMT)
Message-ID: <6c6de9d0-1d40-c1f6-2b9a-b00eb3673b44@linux.vnet.ibm.com>
Date: Fri, 23 Jun 2023 09:55:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH] powerpc/iommu: TCEs are incorrectly manipulated with
 DLPAR add/remove of memory
From: Gaurav Batra <gbatra@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
References: <20230613171641.15641-1-gbatra@linux.vnet.ibm.com>
 <ee63bcc9-4e06-198b-b3a2-5519bc11a83c@linux.vnet.ibm.com>
Content-Language: en-US
In-Reply-To: <ee63bcc9-4e06-198b-b3a2-5519bc11a83c@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CrBVtambl4-IzHdCA7tuZZuOx-AHq-K5
X-Proofpoint-ORIG-GUID: CrBVtambl4-IzHdCA7tuZZuOx-AHq-K5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_08,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306230131
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
Cc: Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Michael,

Did you get a chance to look into this patch? I don't mean to rush you. 
Just wondering if there is anything I can do to help make the patch to 
Upstream.

Thanks,

Gaurav

On 6/13/23 12:17 PM, Gaurav Batra wrote:
> Hello Michael,
>
> I found this bug while going though the code. This bug is exposed when 
> DDW is smaller than the max memory of the LPAR. This will result in 
> creating DDW which will have Dynamically mapped TCEs (no direct mapping).
>
> I would like to stress that this  bug is exposed only in Upstream 
> kernel. Current kernel level in Distros are not exposed to this since 
> they don't have the  concept of "dynamically mapped" DDW.
>
> I didn't have access to any of the P10 boxes with large amount of 
> memory to  re-create the scenario. On P10 we have 2MB TCEs, which 
> results in DDW large enough to be able to cover  max memory I could 
> have for the LPAR. As a result,  IO Bus Addresses generated were 
> always within DDW limits and no H_PARAMETER was returned by HCALL.
>
> So, I hacked the kernel to force the use of 64K TCEs. This resulted in 
> DDW smaller than max memory.
>
> When I tried to DLPAR ADD memory, it failed with error code of -4 
> (H_PARAMETER) from HCALL (H_PUT_TCE/H_PUT_TCE_INDIRECT), when 
> iommu_mem_notifier() invoked tce_setrange_multi_pSeriesLP().
>
> I didn't test the DLPAR REMOVE path, to verify if incorrect TCEs are 
> removed by tce_clearrange_multi_pSeriesLP(), since I would need to 
> hack kernel to force dynamically added TCEs to the high IO Bus 
> Addresses. But, the concept is  same.
>
> Thanks,
>
> Gaurav
>
> On 6/13/23 12:16 PM, Gaurav Batra wrote:
>> When memory is dynamically added/removed, iommu_mem_notifier() is 
>> invoked. This
>> routine traverses through all the DMA windows (DDW only, not default 
>> windows)
>> to add/remove "direct" TCE mappings. The routines for this purpose are
>> tce_clearrange_multi_pSeriesLP() and tce_clearrange_multi_pSeriesLP().
>>
>> Both these routines are designed for Direct mapped DMA windows only.
>>
>> The issue is that there could be some DMA windows in the list which 
>> are not
>> "direct" mapped. Calling these routines will either,
>>
>> 1) remove some dynamically mapped TCEs, Or
>> 2) try to add TCEs which are out of bounds and HCALL returns H_PARAMETER
>>
>> Here are the side affects when these routines are incorrectly invoked 
>> for
>> "dynamically" mapped DMA windows.
>>
>> tce_setrange_multi_pSeriesLP()
>>
>> This adds direct mapped TCEs. Now, this could invoke HCALL to add 
>> TCEs with
>> out-of-bound range. In this scenario, HCALL will return H_PARAMETER 
>> and DLAR
>> ADD of memory will fail.
>>
>> tce_clearrange_multi_pSeriesLP()
>>
>> This will remove range of TCEs. The TCE range that is calculated, 
>> depending on
>> the memory range being added, could infact be mapping some other memory
>> address (for dynamic DMA window scenario). This will wipe out those 
>> TCEs.
>>
>> The solution is for iommu_mem_notifier() to only invoke these 
>> routines for
>> "direct" mapped DMA windows.
>>
>> Signed-off-by: Gaurav Batra <gbatra@linux.vnet.ibm.com>
>> Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
>> ---
>>   arch/powerpc/platforms/pseries/iommu.c | 17 +++++++++++++----
>>   1 file changed, 13 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/iommu.c 
>> b/arch/powerpc/platforms/pseries/iommu.c
>> index 918f511837db..24dd61636400 100644
>> --- a/arch/powerpc/platforms/pseries/iommu.c
>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>> @@ -363,6 +363,7 @@ struct dynamic_dma_window_prop {
>>   struct dma_win {
>>       struct device_node *device;
>>       const struct dynamic_dma_window_prop *prop;
>> +    bool    direct;
>>       struct list_head list;
>>   };
>>
>> @@ -1409,6 +1410,8 @@ static bool enable_ddw(struct pci_dev *dev, 
>> struct device_node *pdn)
>>           goto out_del_prop;
>>
>>       if (direct_mapping) {
>> +        window->direct = true;
>> +
>>           /* DDW maps the whole partition, so enable direct DMA 
>> mapping */
>>           ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> 
>> PAGE_SHIFT,
>>                           win64->value, 
>> tce_setrange_multi_pSeriesLP_walk);
>> @@ -1425,6 +1428,8 @@ static bool enable_ddw(struct pci_dev *dev, 
>> struct device_node *pdn)
>>           int i;
>>           unsigned long start = 0, end = 0;
>>
>> +        window->direct = false;
>> +
>>           for (i = 0; i < ARRAY_SIZE(pci->phb->mem_resources); i++) {
>>               const unsigned long mask = IORESOURCE_MEM_64 | 
>> IORESOURCE_MEM;
>>
>> @@ -1587,8 +1592,10 @@ static int iommu_mem_notifier(struct 
>> notifier_block *nb, unsigned long action,
>>       case MEM_GOING_ONLINE:
>>           spin_lock(&dma_win_list_lock);
>>           list_for_each_entry(window, &dma_win_list, list) {
>> -            ret |= tce_setrange_multi_pSeriesLP(arg->start_pfn,
>> -                    arg->nr_pages, window->prop);
>> +            if (window->direct) {
>> +                ret |= tce_setrange_multi_pSeriesLP(arg->start_pfn,
>> +                        arg->nr_pages, window->prop);
>> +            }
>>               /* XXX log error */
>>           }
>>           spin_unlock(&dma_win_list_lock);
>> @@ -1597,8 +1604,10 @@ static int iommu_mem_notifier(struct 
>> notifier_block *nb, unsigned long action,
>>       case MEM_OFFLINE:
>>           spin_lock(&dma_win_list_lock);
>>           list_for_each_entry(window, &dma_win_list, list) {
>> -            ret |= tce_clearrange_multi_pSeriesLP(arg->start_pfn,
>> -                    arg->nr_pages, window->prop);
>> +            if (window->direct) {
>> +                ret |= tce_clearrange_multi_pSeriesLP(arg->start_pfn,
>> +                        arg->nr_pages, window->prop);
>> +            }
>>               /* XXX log error */
>>           }
>>           spin_unlock(&dma_win_list_lock);
