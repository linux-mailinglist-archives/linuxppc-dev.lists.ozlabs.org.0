Return-Path: <linuxppc-dev+bounces-6361-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49548A3CD72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2025 00:25:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YysvT5bjPz2yGm;
	Thu, 20 Feb 2025 10:25:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740007541;
	cv=none; b=IPZwpgsRZi40FBil3IiTmH2vqHR72t5OKq84Eoz9Bn3YpCUZGcpsVcnjSkZ+B9Swoin8EZP1t4D6aDh1cuM/4UGUEqdHcAaHhOOup3i3WKvCYdHgDEfjEG2sTzHTuHyr5RP+/iMPDLs1/Higc9lGXp71iL2nKE+g9kxpywE+xoPrmtdf6stVi6swrXr7IVINGWZDvmDPcFFiM+jddDnAVK2325TipE0s2HAJMsVrbrv/v4HihITTLYXQa86XfbCdRCQAf9bTRxuIl46L1lSqizj7Gn+1EkK5sVxLlX6z/E9fzrTBQ2IXxZOPvka1MWXj4SbQXkzoKVXm0LJ/EQFHCA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740007541; c=relaxed/relaxed;
	bh=MMTasebDCcrtL3CYiVpYsdakTw4gen2R/Jig2+VRt8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/IBRnYfAvSHuAl6efV+Zjb1d5QBP3oeLUWXTYcGZOCnbzoAum6u8nCga3pWyUln0NsDTC5z3yGnJNvANAsAyAXfWrvRmBsVRu6XEkRuy9RgpOH3vyVeFr5Dm8xomBg/VOAd/AkC4gvQ7/w/kPUrfEm8e7knjvg+h3i7Hh3AfogiPqhB/jAOV7x9PSQ5s+RSOdaqRiQf+715qbM6Y4PiTLRHZz4qQGjd4VEszxtYJwM/0K0z5BD9WCLMNDx7W1SLI51jQFr3pO0cVmsmZ/4tjpeKtlEfPDUhgOAHEIg7HqHH1ChifqPkK0GN7YXhcpHTtispItc1IqVAMg8x/pMtWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P8h3UOm6; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P8h3UOm6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YysvS54T0z2yFB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2025 10:25:40 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JGt2dL011634;
	Wed, 19 Feb 2025 23:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=MMTase
	bDCcrtL3CYiVpYsdakTw4gen2R/Jig2+VRt8w=; b=P8h3UOm6wHHQUqlWhYpjck
	SRaBK7lLML5QkNGHw/UTFymX9Gd0KdW5RoVn0lSVBl543q9c2I2K54owzvTPElMp
	DMWbWmL3eNYfowgX7j2yH2P6qc4Yh4PSdasn8sG7ulJzKGDG7R4Pn3do1lpOqprN
	VRgk+xP5xXVCBdjzgAGaWBL1tdO0C4/3qH5/wJtJ8oFDKUpwQ4a++LUdgfb5ey9V
	TLLj43m6p4Jrc7atmIUnbVphabWTlQ1G0AhrcG3IWpFsUAoll9hQtr4dSOUAO2cj
	7z2dqSpkxqnnAd3bQT0tPFYAzSXey4+ii1Hp0Hzcvav+jJcmk2W28Ds2fOh1nTlA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44w5c9dujp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 23:25:20 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51JNGINp011880;
	Wed, 19 Feb 2025 23:25:19 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44w5c9dujm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 23:25:19 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51JKmk1I002323;
	Wed, 19 Feb 2025 23:25:18 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44w03x6rh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 23:25:18 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51JNPHQM51053008
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Feb 2025 23:25:18 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CAE7D5803F;
	Wed, 19 Feb 2025 23:25:17 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 833BE5805A;
	Wed, 19 Feb 2025 23:25:17 +0000 (GMT)
Received: from [9.61.242.219] (unknown [9.61.242.219])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Feb 2025 23:25:17 +0000 (GMT)
Message-ID: <e77b6ea0-7989-4c58-9524-ad8e3941a7a8@linux.ibm.com>
Date: Wed, 19 Feb 2025 17:25:17 -0600
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
Subject: Re: [PATCH v2] powerpc/pseries/iommu: Wait until all TCEs are
 unmapped before deleting DDW
To: Yunsheng Lin <linyunsheng@huawei.com>,
        Jesper Dangaard Brouer <hawk@kernel.org>, maddy@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, brking@linux.vnet.ibm.com,
        mpe@ellerman.id.au, iommu@lists.linux.dev, ilias.apalodimas@linaro.org,
        Netdev <netdev@vger.kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Mina Almasry <almasrymina@google.com>
References: <20250213171051.63748-1-gbatra@linux.ibm.com>
 <3e6505a4-ba21-4dd6-8ad2-8e0ef8846fc3@kernel.org>
 <f45fa065-a72c-46d6-a196-f4bc1d9f395e@huawei.com>
Content-Language: en-US
From: Gaurav Batra <gbatra@linux.ibm.com>
In-Reply-To: <f45fa065-a72c-46d6-a196-f4bc1d9f395e@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: H-JTGzv7SVgsEnZfBJ8_wiislZhZzU5q
X-Proofpoint-GUID: rtK4WXl0ULkdpucHY4-7AjZZYIZa8pVJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_10,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011 bulkscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 adultscore=0 impostorscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502190169
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

I agree the right fix for this issue would be in the page_pool code. I 
will see if we can reproduce the issue and try out the patch

Thanks,

Gaurav

On 2/19/25 5:17 AM, Yunsheng Lin wrote:
> On 2025/2/18 22:40, Jesper Dangaard Brouer wrote:
>> Cc. netdev and Yunsheng Lin
> Thanks for Cc'ing.
>
>> On 13/02/2025 18.10, Gaurav Batra wrote:
>>> Some of the network drivers, like Mellanox, use core linux page_pool APIs
>>> to manage DMA buffers. These page_pool APIs cache DMA buffers with
>>> infrequent map/unmap calls for DMA mappings, thus increasing performance.
>>>
>>> When a device is initialized, the drivers makes a call to the page_pool API
>>> to create a DMA buffer pool. Hence forth DMA buffers are allocated and
>>> freed from this pool by the driver. The DMA map/unmap is done by the core
>>> page_pool infrastructure.
>>>
>>> These DMA buffers could be allocated for RX/TX buffer rings for the device
>>> or could be in-process by the network stack.
>>>
>>> When a network device is closed, driver will release all DMA mapped
>>> buffers. All the DMA buffers allocated to the RX/TX rings are released back
>>> to the page_pool by the driver. Some of the DMA mapped buffers could still
>>> be allocated and in-process by the network stack.
>>>
>>> DMA buffers that are relased by the Network driver are synchronously
>>> unmapped by the page_pool APIs. But, DMA buffers that are passed to the
>>> network stack and still in-process are unmapped later asynchronously by the
>>> page_pool infrastructure.
>>>
>>> This asynchronous unmapping of the DMA buffers, by the page_pool, can lead
>>> to issues when a network device is dynamically removed in PowerPC
>>> architecture.  When a network device is DLPAR removed, the driver releases
>>> all the mapped DMA buffers and stops using the device. Driver returns
>>> successfully. But, at this stage there still could be mapped DMA buffers
>>> which are in-process by the network stack.
>>>
>>> DLPAR code proceeds to remove the device from the device tree, deletes
>>> Dynamic DMA Window (DDW) and associated IOMMU tables. DLPAR of the device
>>> succeeds.
>>>
>>> Later, when network stack release some of the DMA buffers, page_pool
>>> proceeds to unmap them. The page_pool relase path calls into PowerPC TCE
>>> management to release the TCE. This is where the LPAR OOPses since the DDW
>>> and associated resources for the device are already free'ed.
> Yes, the above seems like a similar issue the below patch is trying to
> fix too. After several iteration of trying to fixing the bug, the generic
> fix seems to avoid calling the DMA API after driver has unbound, which
> means page_pool need to keep track of all the inflight pages and do the
> dma unmapping for all the inflight page when page_pool_destroy() is called.
>
> It would be good if the below patchset is tested to see if it fix the
> problem for iommu problem in this patch for powerpc system.
>
> https://lore.kernel.org/all/20250212092552.1779679-3-linyunsheng@huawei.com/
>
>>> This issue was exposed during (Live Partition Migration) LPM from a Power9
>>> to Power10 machine with HNV configuration. The bonding device is Virtual
>>> Ethernet with SR-IOV. During LPM, I/O is switched from SR-IOV to passive
>>> Virtual Ethernet and DLPAR remove of SR-IOV is initiated. This lead to the
>>> above mentioned scenario.
>>>
>>> It is possible to hit this issue by just Dynamically removing SR-IOV device
>>> which is under heavy I/O load, a scenario where some of the mapped DMA
>>> buffers are in-process somewhere in the network stack and not mapped to the
>>> RX/TX ring of the device.
>>>
>>> The issue is only encountered when TCEs are dynamically managed. In this
>>> scenario map/unmap of TCEs goes into the PowerPC TCE management path as and
>>> when DMA bufffers are mapped/unmaped and accesses DDW resources. When RAM
>>> is directly mapped during device initialization, this dynamic TCE
>>> management is by-passed and LPAR doesn't OOPses.
>>>
>>> Solution:
>>>
>>> During DLPAR remove of the device, before deleting the DDW and associated
>>> resources, check to see if there are any outstanding TCEs. If there are
>>> outstanding TCEs, sleep for 50ms and check again, until all the TCEs are
>>> unmapped.
>>>
>>> Once all the TCEs are unmapped, DDW is removed and DLPAR succeeds. This
>>> ensures there will be no reference to the DDW after it is deleted.
>>>
>>> Here is the stack for reference
>>>
>>> [ 3610.403820] tce_freemulti_pSeriesLP: 48 callbacks suppressed
>>> [ 3610.403833] tce_freemulti_pSeriesLP: plpar_tce_stuff failed
>>> [ 3610.403869]  rc      = -4
>>> [ 3610.403872]  index   = 0x70000016
>>> [ 3610.403876]  limit     = 0x1
>>> [ 3610.403879]  tce       = 0x80000061ee00000
>>> [ 3610.403882]  pgshift = 0x10
>>> [ 3610.403884]  npages  = 0x1
>>> [ 3610.403887]  tbl     = 000000003a6a2145
>>> [ 3610.403912] CPU: 86 PID: 97129 Comm: kworker/86:2 Kdump: loaded Tainted: G            E        6.4.0-623164-default #1 SLE15-SP6 763d454e096eda7d91355fd5b171013052d83ed3
>>> [ 3610.403928] Hardware name: IBM,9080-M9S POWER9 (raw) 0x4e2101 0xf000005 of:IBM,FW950.80 (VH950_131) hv:phyp pSeries
>>> [ 3610.403937] Workqueue: events page_pool_release_retry
>>> [ 3610.404003] Call Trace:
>>> [ 3610.404006] [c000055034e6bb30] [c000000000f63108] dump_stack_lvl+0x6c/0x9c (unreliable)
>>> [ 3610.404039] [c000055034e6bb60] [c000000000101258] tce_freemulti_pSeriesLP+0x1e8/0x1f0
>>> [ 3610.404070] [c000055034e6bbf0] [c00000000005d248] __iommu_free+0x118/0x220
>>> [ 3610.404086] [c000055034e6bc80] [c00000000005d4e8] iommu_free+0x28/0x70
>>> [ 3610.404106] [c000055034e6bcb0] [c00000000005c4b4] dma_iommu_unmap_page+0x24/0x40
>>> [ 3610.404113] [c000055034e6bcd0] [c00000000024b56c] dma_unmap_page_attrs+0x1ac/0x1e0
>>> [ 3610.404139] [c000055034e6bd30] [c000000000cfa178] page_pool_return_page+0x58/0x1b0
>>> [ 3610.404146] [c000055034e6bd60] [c000000000cfb7bc] page_pool_release+0x10c/0x270^
>>> [ 3610.404152] [c000055034e6be00] [c000000000cfbb2c] page_pool_release_retry+0x2c/0x110
>>> [ 3610.404159] [c000055034e6be70] [c00000000018e294] process_one_work+0x314/0x620
>>> [ 3610.404173] [c000055034e6bf10] [c00000000018ee88] worker_thread+0x78/0x620
>>> [ 3610.404179] [c000055034e6bf90] [c00000000019b958] kthread+0x148/0x150
>>> [ 3610.404188] [c000055034e6bfe0] [c00000000000ded8] start_kernel_thread+0x14/0x18
>>>
>>> Signed-off-by: Gaurav Batra <gbatra@linux.ibm.com>
>>> ---
>>>    arch/powerpc/kernel/iommu.c            | 22 ++++++++++++++++++++--
>>>    arch/powerpc/platforms/pseries/iommu.c |  8 ++++----
>>>    2 files changed, 24 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
>>> index 76381e14e800..af7511a8f480 100644
>>> --- a/arch/powerpc/kernel/iommu.c
>>> +++ b/arch/powerpc/kernel/iommu.c
>>> @@ -14,6 +14,7 @@
>>>    #include <linux/types.h>
>>>    #include <linux/slab.h>
>>>    #include <linux/mm.h>
>>> +#include <linux/delay.h>
>>>    #include <linux/spinlock.h>
>>>    #include <linux/string.h>
>>>    #include <linux/dma-mapping.h>
>>> @@ -803,6 +804,7 @@ bool iommu_table_in_use(struct iommu_table *tbl)
>>>    static void iommu_table_free(struct kref *kref)
>>>    {
>>>        struct iommu_table *tbl;
>>> +    unsigned long start_time;
>>>          tbl = container_of(kref, struct iommu_table, it_kref);
>>>    @@ -817,8 +819,24 @@ static void iommu_table_free(struct kref *kref)
>>>        iommu_debugfs_del(tbl);
>>>          /* verify that table contains no entries */
>>> -    if (iommu_table_in_use(tbl))
>>> -        pr_warn("%s: Unexpected TCEs\n", __func__);
>>> +    start_time = jiffies;
>>> +    while (iommu_table_in_use(tbl)) {
>>> +        int sec;
>>> +
>>> +        pr_info("%s: Unexpected TCEs, wait for 50ms\n", __func__);
>>> +        msleep(50);
>>> +
>>> +        /* Come out of the loop if we have already waited for 120 seconds
>>> +         * for the TCEs to be free'ed. TCE are being free'ed
>>> +         * asynchronously by some DMA buffer management API - like
>>> +         * page_pool.
>>> +         */
>>> +        sec = (s32)((u32)jiffies - (u32)start_time) / HZ;
>>> +        if (sec >= 120) {
>>> +            pr_warn("%s: TCEs still mapped even after 120 seconds\n", __func__);
>>> +            break;
>>> +        }
> As mentioned in the above patch, the delay doesn't really work for the
> case 2 below:
> "Currently it seems there are at least two cases that the page
> is not released fast enough causing dma unmmapping done after
> driver has already unbound:
> 1. ipv4 packet defragmentation timeout: this seems to cause
>     delay up to 30 secs.
> 2. skb_defer_free_flush(): this may cause infinite delay if
>     there is no triggering for net_rx_action()."
>
>
>>> +    }
>>>          /* free bitmap */
>>>        vfree(tbl->it_map);
>>> diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
>>> index 534cd159e9ab..925494b6fafb 100644
>>> --- a/arch/powerpc/platforms/pseries/iommu.c
>>> +++ b/arch/powerpc/platforms/pseries/iommu.c
>>> @@ -2390,6 +2390,10 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
>>>          switch (action) {
>>>        case OF_RECONFIG_DETACH_NODE:
>>> +        if (pci && pci->table_group)
>>> +            iommu_pseries_free_group(pci->table_group,
>>> +                    np->full_name);
>>> +
>>>            /*
>>>             * Removing the property will invoke the reconfig
>>>             * notifier again, which causes dead-lock on the
>>> @@ -2400,10 +2404,6 @@ static int iommu_reconfig_notifier(struct notifier_block *nb, unsigned long acti
>>>            if (remove_dma_window_named(np, false, DIRECT64_PROPNAME, true))
>>>                remove_dma_window_named(np, false, DMA64_PROPNAME, true);
>>>    -        if (pci && pci->table_group)
>>> -            iommu_pseries_free_group(pci->table_group,
>>> -                    np->full_name);
>>> -
>>>            spin_lock(&dma_win_list_lock);
>>>            list_for_each_entry(window, &dma_win_list, list) {
>>>                if (window->device == np) {
>>>
>>> base-commit: 6e4436539ae182dc86d57d13849862bcafaa4709

