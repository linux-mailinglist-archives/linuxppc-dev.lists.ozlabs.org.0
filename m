Return-Path: <linuxppc-dev+bounces-7341-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93673A71927
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Mar 2025 15:46:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZN8k402LNz2yqT;
	Thu, 27 Mar 2025 01:46:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743000379;
	cv=none; b=NrSUtwT5Y9O/YhHoNQN3lZs/jhw7aP7oyO/gZeokpUVWDYC/kDFIyeE/9sfc/TAbpghW2zbdqM/p6uxENBnVUq5nh3XSvbtWNPwxa3Asfthb7yE9Yj/Sdrr0ds5NU9hRptCGXTeL0lhSjvArk+wQRmDRiu8wLJeHaCcGknhE1Z85J1k1MF2oisnuLXXAb5ICT0IxJlu6/ymb+zrPeJHbwDaXqgL36n8zEVpWIsN1lEuZs4Smt5cO8zw1x17P8iCmVLtHRsqKL8Cch194CQqcOfBeTQIANWBICQhROn7lNHHcpW5gNGVBgIki2v58V49txiZ+AaVD0XbTxnMdoKMdog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743000379; c=relaxed/relaxed;
	bh=5s9cqAAV7911tDUE8vM5EUr1soQauf5iRbceIq9JMaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OXPjO0K6RvUTj/jUWD9aV5r1FCqe9ouerRrcwPyD4GxuPF638zoG/P3xYW7bcvnV7V8w9Acr4CxBDzthRNagGO3lC3EY3Cu1i5ORTS7xRjlRS7H9y1xUtroRiwbvgl4qwAe1Qieo1QicGW6NF6uwMsvbI9ah6XCg7dDOBzahwO7W1qcIBslp3fMCTApUZMKR7foGWzk0+z2KdIxuSerzas2r/xv5/ep3XLFh49QKvbsAr24rI4e0EKRtLqC++nYQY2JGs0S8V6hSP1lHLsQ2z+LfRJJbYdqYdjh3mRE2cNzQFE850GypYTw8PVmlZCmsvqfvNEAV0I5ZYXZQjMyBKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CbttrlwV; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CbttrlwV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZN8k20g2yz2ySh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Mar 2025 01:46:17 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q8FpmE032156;
	Wed, 26 Mar 2025 14:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=5s9cqA
	AV7911tDUE8vM5EUr1soQauf5iRbceIq9JMaw=; b=CbttrlwVHZdOyynJW/Jag/
	cWbjoORjwn+xoTSIV1qS73EzZLYBSel3M1Pi85ervQ/LL1AsICyUCvY+Vm/oYZkz
	EOkYLRIylUuRNJvf8vPvslKuIJF33GkDdpsOoDPDocly3IA3uQKzmMbj4vLhk8xE
	TqajBIxH2wHpsWnZwtb7QowwZPXMaGRiueYjgZ1nYYxS3ekajU+vVDl8X8x61vHr
	Kx3pyUQ+voCYMldGHBI+GiBkIAN4HvQ17vYAqwUytz/8EXaoDayg+svnEXCREWIL
	yJKbtuhBXnWRxz3173u9l9SEzTCqhGhi/TtehiPOqHgmSSn/Oh3jqkepljgxT3yA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45m3q0mc5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 14:46:14 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52QBBBND009693;
	Wed, 26 Mar 2025 14:46:14 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45j9rkrjs2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Mar 2025 14:46:14 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52QEkC9k30147072
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Mar 2025 14:46:12 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B13058057;
	Wed, 26 Mar 2025 14:46:12 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2508758059;
	Wed, 26 Mar 2025 14:46:12 +0000 (GMT)
Received: from [9.61.251.233] (unknown [9.61.251.233])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Mar 2025 14:46:12 +0000 (GMT)
Message-ID: <aaab4789-390c-4b8d-9b83-bdb5fd6b0767@linux.ibm.com>
Date: Wed, 26 Mar 2025 09:46:11 -0500
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/pseries/iommu: memory notifier incorrectly adds
 TCEs for pmemory
To: =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
Cc: linuxppc-dev@lists.ozlabs.org, donettom@linux.ibm.com
References: <20250130183854.92258-1-gbatra@linux.ibm.com>
 <Z9r--U_INHB4RjXI@kitsune.suse.cz>
Content-Language: en-US
From: Gaurav Batra <gbatra@linux.ibm.com>
In-Reply-To: <Z9r--U_INHB4RjXI@kitsune.suse.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zwXzBJnlRlDNrirI3JoqsqOMcDYDJnub
X-Proofpoint-GUID: zwXzBJnlRlDNrirI3JoqsqOMcDYDJnub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_07,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503260088
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Michal,

In the patch to fix the pmemory bug, I made some changes to the code 
that determines Max memory an LPAR can have (excluding pmemory). This 
information is needed while creating Dynamic DMA Window (DDW). These 
changes are in the main line code path of DDW creation. This might have 
irritated QEMU somehow, no idea yet on how.

Thanks,

Gaurav

On 3/19/25 12:29 PM, Michal Suchánek wrote:
> Hello,
>
> looks like this upsets some assumption qemu has about these windows.
>
> https://lists.nongnu.org/archive/html/qemu-devel/2025-03/msg05137.html
>
> When Linux kernel that has this patch applied is running inside a qemu
> VM with a PCI device and the VM is rebooted qemu crashes shortly after
> the next Linux kernel starts.
>
> This is quite curious since qemu does AFAIK not support pmemory at all.
>
> Any idea what went wrong there?
>
> Thanks
>
> Michal
>
> On Thu, Jan 30, 2025 at 12:38:54PM -0600, Gaurav Batra wrote:
>> iommu_mem_notifier() is invoked when RAM is dynamically added/removed. This
>> notifier call is responsible to add/remove TCEs from the Dynamic DMA Window
>> (DDW) when TCEs are pre-mapped. TCEs are pre-mapped only for RAM and not
>> for persistent memory (pmemory). For DMA buffers in pmemory, TCEs are
>> dynamically mapped when the device driver instructs to do so.
>>
>> The issue is 'daxctl' command is capable of adding pmemory as "System RAM"
>> after LPAR boot. The command to do so is -
>>
>> daxctl reconfigure-device --mode=system-ram dax0.0 --force
>>
>> This will dynamically add pmemory range to LPAR RAM eventually invoking
>> iommu_mem_notifier(). The address range of pmemory is way beyond the Max
>> RAM that the LPAR can have. Which means, this range is beyond the DDW
>> created for the device, at device initialization time.
>>
>> As a result when TCEs are pre-mapped for the pmemory range, by
>> iommu_mem_notifier(), PHYP HCALL returns H_PARAMETER. This failed the
>> command, daxctl, to add pmemory as RAM.
>>
>> The solution is to not pre-map TCEs for pmemory.
>>
>> Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/mmzone.h      |  1 +
>>   arch/powerpc/mm/numa.c                 |  2 +-
>>   arch/powerpc/platforms/pseries/iommu.c | 29 ++++++++++++++------------
>>   3 files changed, 18 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/mmzone.h b/arch/powerpc/include/asm/mmzone.h
>> index d99863cd6cde..049152f8d597 100644
>> --- a/arch/powerpc/include/asm/mmzone.h
>> +++ b/arch/powerpc/include/asm/mmzone.h
>> @@ -29,6 +29,7 @@ extern cpumask_var_t node_to_cpumask_map[];
>>   #ifdef CONFIG_MEMORY_HOTPLUG
>>   extern unsigned long max_pfn;
>>   u64 memory_hotplug_max(void);
>> +u64 hot_add_drconf_memory_max(void);
>>   #else
>>   #define memory_hotplug_max() memblock_end_of_DRAM()
>>   #endif
>> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
>> index 3c1da08304d0..603a0f652ba6 100644
>> --- a/arch/powerpc/mm/numa.c
>> +++ b/arch/powerpc/mm/numa.c
>> @@ -1336,7 +1336,7 @@ int hot_add_scn_to_nid(unsigned long scn_addr)
>>   	return nid;
>>   }
>>   
>> -static u64 hot_add_drconf_memory_max(void)
>> +u64 hot_add_drconf_memory_max(void)
>>   {
>>   	struct device_node *memory = NULL;
>>   	struct device_node *dn = NULL;
>> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
>> index 29f1a0cc59cd..abd9529a8f41 100644
>> --- a/arch/powerpc/platforms/pseries/iommu.c
>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>> @@ -1284,17 +1284,13 @@ static LIST_HEAD(failed_ddw_pdn_list);
>>   
>>   static phys_addr_t ddw_memory_hotplug_max(void)
>>   {
>> -	resource_size_t max_addr = memory_hotplug_max();
>> -	struct device_node *memory;
>> +	resource_size_t max_addr;
>>   
>> -	for_each_node_by_type(memory, "memory") {
>> -		struct resource res;
>> -
>> -		if (of_address_to_resource(memory, 0, &res))
>> -			continue;
>> -
>> -		max_addr = max_t(resource_size_t, max_addr, res.end + 1);
>> -	}
>> +#if defined(CONFIG_NUMA) && defined(CONFIG_MEMORY_HOTPLUG)
>> +	max_addr = hot_add_drconf_memory_max();
>> +#else
>> +	max_addr = memblock_end_of_DRAM();
>> +#endif
>>   
>>   	return max_addr;
>>   }
>> @@ -1600,7 +1596,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>>   
>>   	if (direct_mapping) {
>>   		/* DDW maps the whole partition, so enable direct DMA mapping */
>> -		ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
>> +		ret = walk_system_ram_range(0, ddw_memory_hotplug_max() >> PAGE_SHIFT,
>>   					    win64->value, tce_setrange_multi_pSeriesLP_walk);
>>   		if (ret) {
>>   			dev_info(&dev->dev, "failed to map DMA window for %pOF: %d\n",
>> @@ -2346,11 +2342,17 @@ static int iommu_mem_notifier(struct notifier_block *nb, unsigned long action,
>>   	struct memory_notify *arg = data;
>>   	int ret = 0;
>>   
>> +	/* This notifier can get called when onlining persistent memory as well.
>> +	 * TCEs are not pre-mapped for persistent memory. Persistent memory will
>> +	 * always be above ddw_memory_hotplug_max()
>> +	 */
>> +
>>   	switch (action) {
>>   	case MEM_GOING_ONLINE:
>>   		spin_lock(&dma_win_list_lock);
>>   		list_for_each_entry(window, &dma_win_list, list) {
>> -			if (window->direct) {
>> +			if (window->direct && (arg->start_pfn << PAGE_SHIFT) <
>> +				ddw_memory_hotplug_max()) {
>>   				ret |= tce_setrange_multi_pSeriesLP(arg->start_pfn,
>>   						arg->nr_pages, window->prop);
>>   			}
>> @@ -2362,7 +2364,8 @@ static int iommu_mem_notifier(struct notifier_block *nb, unsigned long action,
>>   	case MEM_OFFLINE:
>>   		spin_lock(&dma_win_list_lock);
>>   		list_for_each_entry(window, &dma_win_list, list) {
>> -			if (window->direct) {
>> +			if (window->direct && (arg->start_pfn << PAGE_SHIFT) <
>> +				ddw_memory_hotplug_max()) {
>>   				ret |= tce_clearrange_multi_pSeriesLP(arg->start_pfn,
>>   						arg->nr_pages, window->prop);
>>   			}
>>
>> base-commit: 95ec54a420b8f445e04a7ca0ea8deb72c51fe1d3
>> -- 
>> 2.39.3 (Apple Git-146)
>>
>>

