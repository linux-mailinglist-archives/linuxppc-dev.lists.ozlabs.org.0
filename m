Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DA63B1ED4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 18:40:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G98Br2mcxz3bsg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 02:40:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcdkim header.b=chBY43Ch;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=quicinc.com (client-ip=199.106.114.38;
 helo=alexa-out-sd-01.qualcomm.com; envelope-from=quic_qiancai@quicinc.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256
 header.s=qcdkim header.b=chBY43Ch; dkim-atps=neutral
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com
 [199.106.114.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G98BF4ykwz305n
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 02:39:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1624466389; x=1656002389;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=bD3fHcpKfJA9p2zej1L/UrxZaxu1AH26pxH4pa5HgfE=;
 b=chBY43ChZBjOIp+y7zJ23MPkOfLq97UUl9ZJI63Ntt4gLGLEnj0LqSt8
 FxFPmkP2T+Gi75bpl2tHdzTyY5Hr2KX3cq8sxgBw+uoz5V/0Eqgz/auQ5
 1lPvnjRINg/OYDrms7iRjfmufG8z4gUIDbtXvIrhY724t//fZCbZM/FkT o=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-01.qualcomm.com with ESMTP; 23 Jun 2021 09:39:37 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/AES256-SHA;
 23 Jun 2021 09:39:35 -0700
Received: from [10.38.240.33] (10.80.80.8) by nasanexm03e.na.qualcomm.com
 (10.85.0.48) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 23 Jun
 2021 09:39:31 -0700
Subject: Re: [PATCH v14 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
To: Claire Chang <tientzu@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 <mpe@ellerman.id.au>, Joerg Roedel <joro@8bytes.org>, Will Deacon
 <will@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Konrad Rzeszutek
 Wilk <konrad.wilk@oracle.com>, <boris.ostrovsky@oracle.com>,
 <jgross@suse.com>, Christoph Hellwig <hch@lst.de>, Marek Szyprowski
 <m.szyprowski@samsung.com>
References: <20210619034043.199220-1-tientzu@chromium.org>
 <20210619034043.199220-7-tientzu@chromium.org>
From: Qian Cai <quic_qiancai@quicinc.com>
Message-ID: <76c3343d-72e5-9df3-8924-5474ee698ef4@quicinc.com>
Date: Wed, 23 Jun 2021 12:39:29 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210619034043.199220-7-tientzu@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
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
Cc: heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 mingo@kernel.org, jxgao@google.com, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, matthew.auld@intel.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, bskeggs@redhat.com,
 thomas.hellstrom@linux.intel.com, Jim Quinlan <james.quinlan@broadcom.com>,
 intel-gfx@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 Robin Murphy <robin.murphy@arm.com>, jani.nikula@linux.intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 bhelgaas@google.com, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, airlied@linux.ie,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 daniel@ffwll.ch, thomas.lendacky@amd.com, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/18/2021 11:40 PM, Claire Chang wrote:
> Propagate the swiotlb_force into io_tlb_default_mem->force_bounce and
> use it to determine whether to bounce the data or not. This will be
> useful later to allow for different pools.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> Tested-by: Will Deacon <will@kernel.org>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>

Reverting the rest of the series up to this patch fixed a boot crash with NVMe on today's linux-next.

[   22.286574][    T7] Unable to handle kernel paging request at virtual address dfff80000000000e
[   22.295225][    T7] Mem abort info:
[   22.298743][    T7]   ESR = 0x96000004
[   22.302496][    T7]   EC = 0x25: DABT (current EL), IL = 32 bits
[   22.308525][    T7]   SET = 0, FnV = 0
[   22.312274][    T7]   EA = 0, S1PTW = 0
[   22.316131][    T7]   FSC = 0x04: level 0 translation fault
[   22.321704][    T7] Data abort info:
[   22.325278][    T7]   ISV = 0, ISS = 0x00000004
[   22.329840][    T7]   CM = 0, WnR = 0
[   22.333503][    T7] [dfff80000000000e] address between user and kernel address ranges
[   22.338543][  T256] igb 0006:01:00.0: Intel(R) Gigabit Ethernet Network Connection
[   22.341400][    T7] Internal error: Oops: 96000004 [#1] SMP
[   22.348915][  T256] igb 0006:01:00.0: eth0: (PCIe:2.5Gb/s:Width x1) 4c:38:d5:09:c8:83
[   22.354458][    T7] Modules linked in: igb(+) i2c_algo_bit nvme mlx5_core(+) i2c_core nvme_core firmware_class
[   22.362512][  T256] igb 0006:01:00.0: eth0: PBA No: G69016-004
[   22.372287][    T7] CPU: 13 PID: 7 Comm: kworker/u64:0 Not tainted 5.13.0-rc7-next-20210623+ #47
[   22.372293][    T7] Hardware name: MiTAC RAPTOR EV-883832-X3-0001/RAPTOR, BIOS 1.6 06/28/2020
[   22.372298][    T7] Workqueue: nvme-reset-wq nvme_reset_work [nvme]
[   22.378145][  T256] igb 0006:01:00.0: Using MSI-X interrupts. 4 rx queue(s), 4 tx queue(s)
[   22.386901][    T7] 
[   22.386905][    T7] pstate: 10000005 (nzcV daif -PAN -UAO -TCO BTYPE=--)
[   22.386910][    T7] pc : dma_direct_map_sg+0x304/0x8f0

is_swiotlb_force_bounce at /usr/src/linux-next/./include/linux/swiotlb.h:119
(inlined by) dma_direct_map_page at /usr/src/linux-next/kernel/dma/direct.h:90
(inlined by) dma_direct_map_sg at /usr/src/linux-next/kernel/dma/direct.c:428

[   22.386919][    T7] lr : dma_map_sg_attrs+0x6c/0x118
[   22.386924][    T7] sp : ffff80001dc8eac0
[   22.386926][    T7] x29: ffff80001dc8eac0 x28: ffff0000199e70b0 x27: 0000000000000000
[   22.386935][    T7] x26: ffff000847ee7000 x25: ffff80001158e570 x24: 0000000000000002
[   22.386943][    T7] x23: dfff800000000000 x22: 0000000000000100 x21: ffff0000199e7460
[   22.386951][    T7] x20: ffff0000199e7488 x19: 0000000000000001 x18: ffff000010062670
[   22.386955][  T253] Unable to handle kernel paging request at virtual address dfff80000000000e
[   22.386958][    T7] x17: ffff8000109f6a90 x16: ffff8000109e1b4c x15: ffff800009303420
[   22.386965][  T253] Mem abort info:
[   22.386967][    T7] x14: 0000000000000001 x13: ffff80001158e000
[   22.386970][  T253]   ESR = 0x96000004
[   22.386972][    T7]  x12: 1fffe00108fdce01
[   22.386975][  T253]   EC = 0x25: DABT (current EL), IL = 32 bits
[   22.386976][    T7] x11: 1fffe00108fdce03 x10: ffff000847ee700c x9 : 0000000000000004
[   22.386981][  T253]   SET = 0, FnV = 0
[   22.386983][    T7] 
[   22.386985][    T7] x8 : ffff700003b91d72
[   22.386986][  T253]   EA = 0, S1PTW = 0
[   22.386987][    T7]  x7 : 0000000000000000 x6 : 000000000000000e
[   22.386990][  T253]   FSC = 0x04: level 0 translation fault
[   22.386992][    T7] 
[   22.386994][    T7] x5 : dfff800000000000
[   22.386995][  T253] Data abort info:
[   22.386997][    T7]  x4 : 00000008c7ede000
[   22.386999][  T253]   ISV = 0, ISS = 0x00000004
[   22.386999][    T7]  x3 : 00000008c7ede000
[   22.387003][    T7] x2 : 0000000000001000
[   22.387003][  T253]   CM = 0, WnR = 0
[   22.387006][    T7]  x1 : 0000000000000000 x0 : 0000000000000071
[   22.387008][  T253] [dfff80000000000e] address between user and kernel address ranges
[   22.387011][    T7] 
[   22.387013][    T7] Call trace:
[   22.387016][    T7]  dma_direct_map_sg+0x304/0x8f0
[   22.387022][    T7]  dma_map_sg_attrs+0x6c/0x118
[   22.387026][    T7]  nvme_map_data+0x2ec/0x21d8 [nvme]
[   22.387040][    T7]  nvme_queue_rq+0x274/0x3f0 [nvme]
[   22.387052][    T7]  blk_mq_dispatch_rq_list+0x2ec/0x18a0
[   22.387060][    T7]  __blk_mq_sched_dispatch_requests+0x2a0/0x3e8
[   22.387065][    T7]  blk_mq_sched_dispatch_requests+0xa4/0x100
[   22.387070][    T7]  __blk_mq_run_hw_queue+0x148/0x1d8
[   22.387075][    T7]  __blk_mq_delay_run_hw_queue+0x3f8/0x730
[   22.414539][  T269] igb 0006:01:00.0 enP6p1s0: renamed from eth0
[   22.418957][    T7]  blk_mq_run_hw_queue+0x148/0x248
[   22.418969][    T7]  blk_mq_sched_insert_request+0x2a4/0x330
[   22.418975][    T7]  blk_execute_rq_nowait+0xc8/0x118
[   22.418981][    T7]  blk_execute_rq+0xd4/0x188
[   22.453203][  T255] udevadm (255) used greatest stack depth: 57408 bytes left
[   22.456504][    T7]  __nvme_submit_sync_cmd+0x4e0/0x730 [nvme_core]
[   22.673245][    T7]  nvme_identify_ctrl.isra.0+0x124/0x1e0 [nvme_core]
[   22.679784][    T7]  nvme_init_identify+0x90/0x1868 [nvme_core]
[   22.685713][    T7]  nvme_init_ctrl_finish+0x1a8/0xb88 [nvme_core]
[   22.691903][    T7]  nvme_reset_work+0xe5c/0x2aa4 [nvme]
[   22.697219][    T7]  process_one_work+0x7e4/0x19a0
[   22.702005][    T7]  worker_thread+0x334/0xae0
[   22.706442][    T7]  kthread+0x3bc/0x470
[   22.710359][    T7]  ret_from_fork+0x10/0x18
[   22.714627][    T7] Code: f941ef81 9101c420 1200080e d343fc06 (38f768c6) 
[   22.721407][    T7] ---[ end trace 1f3c4181ae408676 ]---
[   22.726712][    T7] Kernel panic - not syncing: Oops: Fatal exception
[   22.733169][    T7] SMP: stopping secondary CPUs
[   23.765164][    T7] SMP: failed to stop secondary CPUs 13,15
[   23.770818][    T7] Kernel Offset: disabled
[   23.774991][    T7] CPU features: 0x00000251,20000846
[   23.780034][    T7] Memory Limit: none
[   23.783794][    T7] ---[ end Kernel panic - not syncing: Oops: Fatal exception ]---

> ---
>  drivers/xen/swiotlb-xen.c |  2 +-
>  include/linux/swiotlb.h   | 11 +++++++++++
>  kernel/dma/direct.c       |  2 +-
>  kernel/dma/direct.h       |  2 +-
>  kernel/dma/swiotlb.c      |  4 ++++
>  5 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 0c6ed09f8513..4730a146fa35 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -369,7 +369,7 @@ static dma_addr_t xen_swiotlb_map_page(struct device *dev, struct page *page,
>  	if (dma_capable(dev, dev_addr, size, true) &&
>  	    !range_straddles_page_boundary(phys, size) &&
>  		!xen_arch_need_swiotlb(dev, phys, dev_addr) &&
> -		swiotlb_force != SWIOTLB_FORCE)
> +		!is_swiotlb_force_bounce(dev))
>  		goto done;
>  
>  	/*
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index dd1c30a83058..8d8855c77d9a 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -84,6 +84,7 @@ extern enum swiotlb_force swiotlb_force;
>   *		unmap calls.
>   * @debugfs:	The dentry to debugfs.
>   * @late_alloc:	%true if allocated using the page allocator
> + * @force_bounce: %true if swiotlb bouncing is forced
>   */
>  struct io_tlb_mem {
>  	phys_addr_t start;
> @@ -94,6 +95,7 @@ struct io_tlb_mem {
>  	spinlock_t lock;
>  	struct dentry *debugfs;
>  	bool late_alloc;
> +	bool force_bounce;
>  	struct io_tlb_slot {
>  		phys_addr_t orig_addr;
>  		size_t alloc_size;
> @@ -109,6 +111,11 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
>  	return mem && paddr >= mem->start && paddr < mem->end;
>  }
>  
> +static inline bool is_swiotlb_force_bounce(struct device *dev)
> +{
> +	return dev->dma_io_tlb_mem->force_bounce;
> +}
> +
>  void __init swiotlb_exit(void);
>  unsigned int swiotlb_max_segment(void);
>  size_t swiotlb_max_mapping_size(struct device *dev);
> @@ -120,6 +127,10 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
>  {
>  	return false;
>  }
> +static inline bool is_swiotlb_force_bounce(struct device *dev)
> +{
> +	return false;
> +}
>  static inline void swiotlb_exit(void)
>  {
>  }
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 7a88c34d0867..a92465b4eb12 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -496,7 +496,7 @@ size_t dma_direct_max_mapping_size(struct device *dev)
>  {
>  	/* If SWIOTLB is active, use its maximum mapping size */
>  	if (is_swiotlb_active(dev) &&
> -	    (dma_addressing_limited(dev) || swiotlb_force == SWIOTLB_FORCE))
> +	    (dma_addressing_limited(dev) || is_swiotlb_force_bounce(dev)))
>  		return swiotlb_max_mapping_size(dev);
>  	return SIZE_MAX;
>  }
> diff --git a/kernel/dma/direct.h b/kernel/dma/direct.h
> index 13e9e7158d94..4632b0f4f72e 100644
> --- a/kernel/dma/direct.h
> +++ b/kernel/dma/direct.h
> @@ -87,7 +87,7 @@ static inline dma_addr_t dma_direct_map_page(struct device *dev,
>  	phys_addr_t phys = page_to_phys(page) + offset;
>  	dma_addr_t dma_addr = phys_to_dma(dev, phys);
>  
> -	if (unlikely(swiotlb_force == SWIOTLB_FORCE))
> +	if (is_swiotlb_force_bounce(dev))
>  		return swiotlb_map(dev, phys, size, dir, attrs);
>  
>  	if (unlikely(!dma_capable(dev, dma_addr, size, true))) {
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 8a120f42340b..0d294bbf274c 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -179,6 +179,10 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
>  	mem->end = mem->start + bytes;
>  	mem->index = 0;
>  	mem->late_alloc = late_alloc;
> +
> +	if (swiotlb_force == SWIOTLB_FORCE)
> +		mem->force_bounce = true;
> +
>  	spin_lock_init(&mem->lock);
>  	for (i = 0; i < mem->nslabs; i++) {
>  		mem->slots[i].list = IO_TLB_SEGSIZE - io_tlb_offset(i);
> 
