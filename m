Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4653F3BD819
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 16:01:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GK43t0zxWz3bZv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 00:01:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4GK43R1zqsz2yM5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 00:01:21 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E5E031B;
 Tue,  6 Jul 2021 07:01:18 -0700 (PDT)
Received: from [10.57.40.45] (unknown [10.57.40.45])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 461163F73B;
 Tue,  6 Jul 2021 07:01:11 -0700 (PDT)
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
To: Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>
References: <CALiNf2-a-haQN0-4+gX8+wa++52-0CnO2O4BEkxrQCxoTa_47w@mail.gmail.com>
 <20210630114348.GA8383@willie-the-truck>
 <YNyUQwiagNeZ9YeJ@Ryzen-9-3900X.localdomain>
 <20210701074045.GA9436@willie-the-truck>
 <ea28db1f-846e-4f0a-4f13-beb67e66bbca@kernel.org>
 <20210702135856.GB11132@willie-the-truck>
 <0f7bd903-e309-94a0-21d7-f0e8e9546018@arm.com>
 <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain>
 <20210705190352.GA19461@willie-the-truck> <20210706044848.GA13640@lst.de>
 <20210706132422.GA20327@willie-the-truck>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <a59f771f-3289-62f0-ca50-8f3675d9b166@arm.com>
Date: Tue, 6 Jul 2021 15:01:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210706132422.GA20327@willie-the-truck>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Jim Quinlan <james.quinlan@broadcom.com>, heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Jianxiong Gao <jxgao@google.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, matthew.auld@intel.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, bskeggs@redhat.com,
 Nicolas Boichat <drinkcat@chromium.org>, thomas.hellstrom@linux.intel.com,
 jgross@suse.com, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 intel-gfx@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 jani.nikula@linux.intel.com, Nathan Chancellor <nathan@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, Claire Chang <tientzu@chromium.org>,
 Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 boris.ostrovsky@oracle.com, airlied@linux.ie,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Qian Cai <quic_qiancai@quicinc.com>, lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, xypron.glpk@gmx.de,
 Tom Lendacky <thomas.lendacky@amd.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-07-06 14:24, Will Deacon wrote:
> On Tue, Jul 06, 2021 at 06:48:48AM +0200, Christoph Hellwig wrote:
>> On Mon, Jul 05, 2021 at 08:03:52PM +0100, Will Deacon wrote:
>>> So at this point, the AMD IOMMU driver does:
>>>
>>> 	swiotlb        = (iommu_default_passthrough() || sme_me_mask) ? 1 : 0;
>>>
>>> where 'swiotlb' is a global variable indicating whether or not swiotlb
>>> is in use. It's picked up a bit later on by pci_swiotlb_late_init(), which
>>> will call swiotlb_exit() if 'swiotlb' is false.
>>>
>>> Now, that used to work fine, because swiotlb_exit() clears
>>> 'io_tlb_default_mem' to NULL, but now with the restricted DMA changes, I
>>> think that all the devices which have successfully probed beforehand will
>>> have stale pointers to the freed structure in their 'dev->dma_io_tlb_mem'
>>> field.
>>
>> Yeah.  I don't think we can do that anymore, and I also think it is
>> a bad idea to start with.
> 
> I've had a crack at reworking things along the following lines:
> 
>    - io_tlb_default_mem now lives in the BSS, the flexible array member
>      is now a pointer and that part is allocated dynamically (downside of
>      this is an extra indirection to get at the slots).
> 
>    - io_tlb_default_mem.nslabs tells you whether the thing is valid
> 
>    - swiotlb_exit() frees the slots array and clears the rest of the
>      structure to 0. I also extended it to free the actual slabs, but I'm
>      not sure why it wasn't doing that before.
> 
> So a non-NULL dev->dma_io_tlb_mem should always be valid to follow.

FWIW I was pondering the question of whether to do something along those 
lines or just scrap the default assignment entirely, so since I hadn't 
got round to saying that I've gone ahead and hacked up the alternative 
(similarly untested) for comparison :)

TBH I'm still not sure which one I prefer...

Robin.

----->8-----
diff --git a/drivers/base/core.c b/drivers/base/core.c
index ea5b85354526..394abf184c1a 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2847,9 +2847,6 @@ void device_initialize(struct device *dev)
      defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
  	dev->dma_coherent = dma_default_coherent;
  #endif
-#ifdef CONFIG_SWIOTLB
-	dev->dma_io_tlb_mem = io_tlb_default_mem;
-#endif
  }
  EXPORT_SYMBOL_GPL(device_initialize);

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 39284ff2a6cd..620f16d89a98 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -107,16 +107,21 @@ struct io_tlb_mem {
  };
  extern struct io_tlb_mem *io_tlb_default_mem;

+static inline struct io_tlb_mem *dev_iotlb_mem(struct device *dev)
+{
+	return dev->dma_io_tlb_mem ?: io_tlb_default_mem;
+}
+
  static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t 
paddr)
  {
-	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+	struct io_tlb_mem *mem = dev_iotlb_mem(dev);

  	return mem && paddr >= mem->start && paddr < mem->end;
  }

  static inline bool is_swiotlb_force_bounce(struct device *dev)
  {
-	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+	struct io_tlb_mem *mem = dev_iotlb_mem(dev);

  	return mem && mem->force_bounce;
  }
@@ -167,7 +172,7 @@ bool swiotlb_free(struct device *dev, struct page 
*page, size_t size);

  static inline bool is_swiotlb_for_alloc(struct device *dev)
  {
-	return dev->dma_io_tlb_mem->for_alloc;
+	return dev_iotlb_mem(dev)->for_alloc;
  }
  #else
  static inline struct page *swiotlb_alloc(struct device *dev, size_t size)
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index b7f76bca89bf..f4942149f87d 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -359,7 +359,7 @@ static unsigned int swiotlb_align_offset(struct 
device *dev, u64 addr)
  static void swiotlb_bounce(struct device *dev, phys_addr_t tlb_addr, 
size_t size,
  			   enum dma_data_direction dir)
  {
-	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+	struct io_tlb_mem *mem = dev_iotlb_mem(dev);
  	int index = (tlb_addr - mem->start) >> IO_TLB_SHIFT;
  	phys_addr_t orig_addr = mem->slots[index].orig_addr;
  	size_t alloc_size = mem->slots[index].alloc_size;
@@ -440,7 +440,7 @@ static unsigned int wrap_index(struct io_tlb_mem 
*mem, unsigned int index)
  static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
  			      size_t alloc_size)
  {
-	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+	struct io_tlb_mem *mem = dev_iotlb_mem(dev);
  	unsigned long boundary_mask = dma_get_seg_boundary(dev);
  	dma_addr_t tbl_dma_addr =
  		phys_to_dma_unencrypted(dev, mem->start) & boundary_mask;
@@ -522,7 +522,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device 
*dev, phys_addr_t orig_addr,
  		size_t mapping_size, size_t alloc_size,
  		enum dma_data_direction dir, unsigned long attrs)
  {
-	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+	struct io_tlb_mem *mem = dev_iotlb_mem(dev);
  	unsigned int offset = swiotlb_align_offset(dev, orig_addr);
  	unsigned int i;
  	int index;
@@ -565,7 +565,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device 
*dev, phys_addr_t orig_addr,

  static void swiotlb_release_slots(struct device *dev, phys_addr_t 
tlb_addr)
  {
-	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+	struct io_tlb_mem *mem = dev_iotlb_mem(dev);
  	unsigned long flags;
  	unsigned int offset = swiotlb_align_offset(dev, tlb_addr);
  	int index = (tlb_addr - offset - mem->start) >> IO_TLB_SHIFT;
@@ -682,7 +682,7 @@ size_t swiotlb_max_mapping_size(struct device *dev)

  bool is_swiotlb_active(struct device *dev)
  {
-	return dev->dma_io_tlb_mem != NULL;
+	return dev_iotlb_mem(dev) != NULL;
  }
  EXPORT_SYMBOL_GPL(is_swiotlb_active);

@@ -729,7 +729,7 @@ static void rmem_swiotlb_debugfs_init(struct 
reserved_mem *rmem)

  struct page *swiotlb_alloc(struct device *dev, size_t size)
  {
-	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+	struct io_tlb_mem *mem = dev_iotlb_mem(dev);
  	phys_addr_t tlb_addr;
  	int index;

@@ -792,7 +792,7 @@ static int rmem_swiotlb_device_init(struct 
reserved_mem *rmem,
  static void rmem_swiotlb_device_release(struct reserved_mem *rmem,
  					struct device *dev)
  {
-	dev->dma_io_tlb_mem = io_tlb_default_mem;
+	dev->dma_io_tlb_mem = NULL;
  }

  static const struct reserved_mem_ops rmem_swiotlb_ops = {
