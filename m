Return-Path: <linuxppc-dev+bounces-5874-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE2CA29B3A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2025 21:31:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YpBjC4VZZz2ysv;
	Thu,  6 Feb 2025 07:31:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738759428;
	cv=none; b=TI0v4Vx9O9AJDho//io/RCCGtlA9GgyWAtNtPiXewR0sMBI6xL4GC203nqMdCN8fr+9EUyzP1rxbKw5503L+6Ue+kFHDYAlp8cYSPaKuey3M0Kp7IeOoqCVMNDAEBZa0FSeo1usKv43e3DU+f3AqLOS4HtUPUz/NRRWi44RmcsI+S9W3WyhH8CrndCR6eHv72aTP2nkAIrsnHbJkLAdOwBuXbgsJVhY7tsA+DGy8RO0npxS43u79nyfklKSUAeHoSO2wg2iOpl6oBsh5p6qHoNjtnM0CRFuspU8WGr8ooSxpuuAtvjb+foLqQCCxlK0EpDXg4Mpijwrr5ET5CgJ61A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738759428; c=relaxed/relaxed;
	bh=x16nOgwjuLx/foemroF2igQ25k8oactAxz5EeUYq6tU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=KyyG73YjexJEPkgwvTvkrgXgW8jCcI5nAE4wD8C5Y6NTEtrz623+aODRW5tgxATXr4y5p+fBMB+NMN+T6ijVdfiZchSsdhqqHslJlV/k0DYxvUtw4862bvsrwJkZQHcZVeeBqoxVu93MJbFSNu1HjnPwnR5Tx0csZ+SCryzvtmnTbjmlTNwnvZCUt2n6FLABjFDhlOhipaljGL5k/FSgIslCwp4iTDzDC57AROlAwVWPGw/LTew388VWbpmRoPH6ksJMtcmzt9XrTXTgrUJfTdQsUiCUyRzIW5LTLa6D/lcQuw1dXizMeIG9FlmVyuARBAV/rGVA4eixl6wS1U9THA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YykoHbqp; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YykoHbqp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yp0KH2zsqz2xFq
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2025 23:43:46 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51518YtW013180
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Feb 2025 12:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=x16nOg
	wjuLx/foemroF2igQ25k8oactAxz5EeUYq6tU=; b=YykoHbqpqHwGJrrRgkg/Fe
	ZI6uSQI7HtYdGZfzqgm2vvqPYQM6kKpFPPMx+3FTIqtECQwfk8fM5E0cWt0Hl1nc
	GvdGjjo3SodZTISy/zd9QqsUfnUVATyHo40tdSMzhm100dTVxJ5DASJdCud7fgFx
	Iubh5fUdYjBnD8/6wjhusJJ6Nl7QM6K6scuuHVImQDqPM7HscdloUQR5qNzbqtnY
	K4BqEfWdXhRpB9XSfCGTq4w10/TC/Q3r1JYZLqXNtk0EGvQOOTyhckFwWxe0irFd
	t9Znse8CUf+cOyF9LS9aM5A7XkBJ0K5BPxuDnNXv/h4FAApB2uharvFZ+ow7xqiw
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44kx29jxxs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Feb 2025 12:43:44 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 515CXFCf024510
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 5 Feb 2025 12:43:42 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44hxxn8run-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Feb 2025 12:43:42 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 515ChfpM28508912
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 12:43:41 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8068258059;
	Wed,  5 Feb 2025 12:43:41 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A170E58058;
	Wed,  5 Feb 2025 12:43:40 +0000 (GMT)
Received: from [9.109.210.79] (unknown [9.109.210.79])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Feb 2025 12:43:40 +0000 (GMT)
Message-ID: <5b9cb993-d4bb-45f7-a8cb-5a80c7f6f846@linux.ibm.com>
Date: Wed, 5 Feb 2025 18:13:39 +0530
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
To: Gaurav Batra <gbatra@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20250130183854.92258-1-gbatra@linux.ibm.com>
Content-Language: en-US
From: Donet Tom <donettom@linux.ibm.com>
In-Reply-To: <20250130183854.92258-1-gbatra@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: z0lJsqKcjkYGKMnDTXdO6wbj2Je-9gfw
X-Proofpoint-ORIG-GUID: z0lJsqKcjkYGKMnDTXdO6wbj2Je-9gfw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-05_05,2025-02-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 suspectscore=0 adultscore=0 mlxlogscore=959 clxscore=1011
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502050100
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On 1/31/25 00:08, Gaurav Batra wrote:
> iommu_mem_notifier() is invoked when RAM is dynamically added/removed. This
> notifier call is responsible to add/remove TCEs from the Dynamic DMA Window
> (DDW) when TCEs are pre-mapped. TCEs are pre-mapped only for RAM and not
> for persistent memory (pmemory). For DMA buffers in pmemory, TCEs are
> dynamically mapped when the device driver instructs to do so.
>
> The issue is 'daxctl' command is capable of adding pmemory as "System RAM"
> after LPAR boot. The command to do so is -
>
> daxctl reconfigure-device --mode=system-ram dax0.0 --force
>
> This will dynamically add pmemory range to LPAR RAM eventually invoking
> iommu_mem_notifier(). The address range of pmemory is way beyond the Max
> RAM that the LPAR can have. Which means, this range is beyond the DDW
> created for the device, at device initialization time.
>
> As a result when TCEs are pre-mapped for the pmemory range, by
> iommu_mem_notifier(), PHYP HCALL returns H_PARAMETER. This failed the
> command, daxctl, to add pmemory as RAM.
>
> The solution is to not pre-map TCEs for pmemory.
>
> Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/mmzone.h      |  1 +
>   arch/powerpc/mm/numa.c                 |  2 +-
>   arch/powerpc/platforms/pseries/iommu.c | 29 ++++++++++++++------------
>   3 files changed, 18 insertions(+), 14 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/mmzone.h b/arch/powerpc/include/asm/mmzone.h
> index d99863cd6cde..049152f8d597 100644
> --- a/arch/powerpc/include/asm/mmzone.h
> +++ b/arch/powerpc/include/asm/mmzone.h
> @@ -29,6 +29,7 @@ extern cpumask_var_t node_to_cpumask_map[];
>   #ifdef CONFIG_MEMORY_HOTPLUG
>   extern unsigned long max_pfn;
>   u64 memory_hotplug_max(void);
> +u64 hot_add_drconf_memory_max(void);
>   #else
>   #define memory_hotplug_max() memblock_end_of_DRAM()
>   #endif
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index 3c1da08304d0..603a0f652ba6 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -1336,7 +1336,7 @@ int hot_add_scn_to_nid(unsigned long scn_addr)
>   	return nid;
>   }
>   
> -static u64 hot_add_drconf_memory_max(void)
> +u64 hot_add_drconf_memory_max(void)
>   {
>   	struct device_node *memory = NULL;
>   	struct device_node *dn = NULL;
> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
> index 29f1a0cc59cd..abd9529a8f41 100644
> --- a/arch/powerpc/platforms/pseries/iommu.c
> +++ b/arch/powerpc/platforms/pseries/iommu.c
> @@ -1284,17 +1284,13 @@ static LIST_HEAD(failed_ddw_pdn_list);
>   
>   static phys_addr_t ddw_memory_hotplug_max(void)
>   {
> -	resource_size_t max_addr = memory_hotplug_max();
> -	struct device_node *memory;
> +	resource_size_t max_addr;
>   
> -	for_each_node_by_type(memory, "memory") {
> -		struct resource res;
> -
> -		if (of_address_to_resource(memory, 0, &res))
> -			continue;
> -
> -		max_addr = max_t(resource_size_t, max_addr, res.end + 1);
> -	}
> +#if defined(CONFIG_NUMA) && defined(CONFIG_MEMORY_HOTPLUG)
> +	max_addr = hot_add_drconf_memory_max();
> +#else
> +	max_addr = memblock_end_of_DRAM();
> +#endif
>   
>   	return max_addr;
>   }
> @@ -1600,7 +1596,7 @@ static bool enable_ddw(struct pci_dev *dev, struct device_node *pdn)
>   
>   	if (direct_mapping) {
>   		/* DDW maps the whole partition, so enable direct DMA mapping */
> -		ret = walk_system_ram_range(0, memblock_end_of_DRAM() >> PAGE_SHIFT,
> +		ret = walk_system_ram_range(0, ddw_memory_hotplug_max() >> PAGE_SHIFT,
>   					    win64->value, tce_setrange_multi_pSeriesLP_walk);
>   		if (ret) {
>   			dev_info(&dev->dev, "failed to map DMA window for %pOF: %d\n",
> @@ -2346,11 +2342,17 @@ static int iommu_mem_notifier(struct notifier_block *nb, unsigned long action,
>   	struct memory_notify *arg = data;
>   	int ret = 0;
>   
> +	/* This notifier can get called when onlining persistent memory as well.
> +	 * TCEs are not pre-mapped for persistent memory. Persistent memory will
> +	 * always be above ddw_memory_hotplug_max()
> +	 */
> +
>   	switch (action) {
>   	case MEM_GOING_ONLINE:
>   		spin_lock(&dma_win_list_lock);
>   		list_for_each_entry(window, &dma_win_list, list) {
> -			if (window->direct) {
> +			if (window->direct && (arg->start_pfn << PAGE_SHIFT) <
> +				ddw_memory_hotplug_max()) {
Hi Gaurav,

Since the pmem_start will be greater than ddw_memory_hotplug_max(), and 
we have not created DDW beyond ddw_memory_hotplug_max(), we are not 
adding TCE for this range, right?

I have tested this patch on my system, and daxctl reconfigure-device is 
able to reconfigure PMEM to system RAM.

~# daxctl reconfigure-device --mode=system-ram dax1.0 --force
[
   {
     "chardev":"dax1.0",
     "size":5362417664,
     "target_node":4,
     "align":65536,
     "mode":"system-ram",
     "online_memblocks":4,
     "total_memblocks":4,
     "movable":true
   }
]
reconfigured 1 device
~#
~# lsmem
RANGE                                  SIZE  STATE REMOVABLE BLOCK
0x0000000000000000-0x000000697fffffff  422G online       yes 0-421
0x0000040380000000-0x000004047fffffff    4G online       yes 4110-4113

Memory block size:         1G
Total online memory:     426G
Total offline memory:      0B
root@ltcden14-lp2:~#

Thanks
Donet
>   				ret |= tce_setrange_multi_pSeriesLP(arg->start_pfn,
>   						arg->nr_pages, window->prop);
>   			}
> @@ -2362,7 +2364,8 @@ static int iommu_mem_notifier(struct notifier_block *nb, unsigned long action,
>   	case MEM_OFFLINE:
>   		spin_lock(&dma_win_list_lock);
>   		list_for_each_entry(window, &dma_win_list, list) {
> -			if (window->direct) {
> +			if (window->direct && (arg->start_pfn << PAGE_SHIFT) <
> +				ddw_memory_hotplug_max()) {
>   				ret |= tce_clearrange_multi_pSeriesLP(arg->start_pfn,
>   						arg->nr_pages, window->prop);
>   			}
>
> base-commit: 95ec54a420b8f445e04a7ca0ea8deb72c51fe1d3

