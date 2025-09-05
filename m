Return-Path: <linuxppc-dev+bounces-11801-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF76B45DE0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 18:21:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJM6g4yGHz3dL3;
	Sat,  6 Sep 2025 02:21:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757089291;
	cv=none; b=V8I74yAQapm57IsrGUfSOicr5Z0eMXioixSCdXVcKqN0/PMG9ZlcnlhDYMIll0Wfi58+OM34V25vQdkldoBx87fnnNRfiqwPa0LpMdMxUcy9I4JQRQf2PikIJ2mkKBMldUsgM9kDlyLlFdpmJFXjf7KmSvKa+0JQiVsyS2JKxkNerGXzXm8pIDssfGKUq5KMFbK1wgQ199TnKWn2jqbsZBYd86spIvZGuUvTWEKkf80CVUWbeSQ/UxkKCdyjXxuuxQ5KMUNzHCOFAwCtgBE8hUs4unQSPWDPjEMGakwfrZqbxmWkQjr4iJdNNiypmG/L/34cXtPO7JEwwwIlOziOeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757089291; c=relaxed/relaxed;
	bh=r+uJO0KPgHoqZtk4UB2d6cw6Lk6DbEyEjBWC0P92zgA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=ZB60IN7ssMeRF6nPRiHOllb0FrvnpARf1N8nuHytAuayunMMBDGZS+cYI4n2MtMft7LpkzFJ52b575gvOI5a7mVbe1gQU/XIsz5/VbHjO//u924ASs2VHd+h2OyVm1W6uvdMG97Zi6df3hhyBBdtwxYBBhgKhcgwCOWmSlSj7Q5ydIgMgsQks+KHuDqHhL9fi/4Dz8/K3iIPmJ0aunRw1HcKXK/qemrz1GWDxwf5I2WknqY6HYf/MSQG0leq34NwljIEVlVz6J8E2C0TU8A8aFhUn9iQUww9UGg9mJB+XGig2x+S5B+5Gu4ca6etvBnSW2Q5wtf+WCLeonWuyxSDQg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com; dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=BH1gDTlm; dkim-atps=neutral; spf=pass (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org) smtp.mailfrom=samsung.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=BH1gDTlm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJM6R1plfz3dKL
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Sep 2025 02:21:10 +1000 (AEST)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250905162054euoutp02e77d244e0cafd5d952c3328dee47f20d~ib14B25gK1750017500euoutp02R;
	Fri,  5 Sep 2025 16:20:54 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250905162054euoutp02e77d244e0cafd5d952c3328dee47f20d~ib14B25gK1750017500euoutp02R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757089254;
	bh=r+uJO0KPgHoqZtk4UB2d6cw6Lk6DbEyEjBWC0P92zgA=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=BH1gDTlm5/u+/rXGc9JT+K9NjInJASEOMUNJK2lpN97zPJKhgFZ4BwyWAKG5fWJ4U
	 SwthcsWnGvBGq4ZFisO0dXzRvPNenkJ22SKsGAEN3TZeM/LeDo1/zUbv9zcz1Jnd3W
	 ZVdWIWrJTUMJGFYQL2lzvf5ASBpb6d4tBQU3KY7E=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250905162053eucas1p1b9fec0adff4c7d35b6b6add1249d881b~ib13cmmn22364123641eucas1p1e;
	Fri,  5 Sep 2025 16:20:53 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250905162051eusmtip1e4d21f9bc61a423579ce48c4e618b6af~ib11sI1Nb2344623446eusmtip1s;
	Fri,  5 Sep 2025 16:20:51 +0000 (GMT)
Message-ID: <7557f31e-1504-4f62-b00b-70e25bb793cb@samsung.com>
Date: Fri, 5 Sep 2025 18:20:51 +0200
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
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 00/16] dma-mapping: migrate to physical address-based
 API
To: Jason Gunthorpe <jgg@nvidia.com>, Leon Romanovsky <leon@kernel.org>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Alexander Potapenko
	<glider@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, Danilo
	Krummrich <dakr@kernel.org>, iommu@lists.linux.dev, Jason Wang
	<jasowang@redhat.com>, Jens Axboe <axboe@kernel.dk>, Joerg Roedel
	<joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>, Juergen Gross
	<jgross@suse.com>, kasan-dev@googlegroups.com, Keith Busch
	<kbusch@kernel.org>, linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Michael
	Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>, Miguel
	Ojeda <ojeda@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	rust-for-linux@vger.kernel.org, Sagi Grimberg <sagi@grimberg.me>, Stefano
	Stabellini <sstabellini@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250829131625.GK9469@nvidia.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250905162053eucas1p1b9fec0adff4c7d35b6b6add1249d881b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250829131641eucas1p2ddd687e4e8c16a2bc64a293b6364fa6f
X-EPHeader: CA
X-CMS-RootMailID: 20250829131641eucas1p2ddd687e4e8c16a2bc64a293b6364fa6f
References: <cover.1755624249.git.leon@kernel.org>
	<CGME20250829131641eucas1p2ddd687e4e8c16a2bc64a293b6364fa6f@eucas1p2.samsung.com>
	<20250829131625.GK9469@nvidia.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 29.08.2025 15:16, Jason Gunthorpe wrote:
> On Tue, Aug 19, 2025 at 08:36:44PM +0300, Leon Romanovsky wrote:
>
>> This series does the core code and modern flows. A followup series
>> will give the same treatment to the legacy dma_ops implementation.
> I took a quick check over this to see that it is sane.  I think using
> phys is an improvement for most of the dma_ops implemenations.
>
>    arch/sparc/kernel/pci_sun4v.c
>    arch/sparc/kernel/iommu.c
>      Uses __pa to get phys from the page, never touches page
>
>    arch/alpha/kernel/pci_iommu.c
>    arch/sparc/mm/io-unit.c
>    drivers/parisc/ccio-dma.c
>    drivers/parisc/sba_iommu.c
>      Does page_addres() and later does __pa on it. Doesn't touch struct page
>
>    arch/x86/kernel/amd_gart_64.c
>    drivers/xen/swiotlb-xen.c
>    arch/mips/jazz/jazzdma.c
>      Immediately does page_to_phys(), never touches struct page
>
>    drivers/vdpa/vdpa_user/vduse_dev.c
>      Does page_to_phys() to call iommu_map()
>
>    drivers/xen/grant-dma-ops.c
>      Does page_to_pfn() and nothing else
>
>    arch/powerpc/platforms/ps3/system-bus.c
>     This is a maze but I think it wants only phys and the virt is only
>     used for debug prints.
>
> The above all never touch a KVA and just want a phys_addr_t.
>
> The below are touching the KVA somehow:
>
>    arch/sparc/mm/iommu.c
>    arch/arm/mm/dma-mapping.c
>      Uses page_address to cache flush, would be happy with phys_to_virt()
>      and a PhysHighMem()
>
>    arch/powerpc/kernel/dma-iommu.c
>    arch/powerpc/platforms/pseries/vio.c
>     Uses iommu_map_page() which wants phys_to_virt(), doesn't touch
>     struct page
>
>    arch/powerpc/platforms/pseries/ibmebus.c
>      Returns phys_to_virt() as dma_addr_t.
>
> The two PPC ones are weird, I didn't figure out how that was working..
>
> It would be easy to make map_phys patches for about half of these, in
> the first grouping. Doing so would also grant those arches
> map_resource capability.
>
> Overall I didn't think there was any reduction in maintainability in
> these places. Most are improvements eliminating code, and some are
> just switching to phys_to_virt() from page_address(), which we could
> further guard with DMA_ATTR_MMIO and a check for highmem.

Thanks for this summary.

However I would still like to get an answer for the simple question - 
why all this work cannot be replaced by a simple use of dma_map_resource()?

I've checked the most advertised use case in 
https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/log/?h=dmabuf-vfio 
and I still don't see the reason why it cannot be based 
on dma_map_resource() API? I'm aware of the little asymmetry of the 
client calls is such case, indeed it is not preety, but this should work 
even now:

phys = phys_vec[i].paddr;

if (is_mmio)
     dma_map_resource(phys, len, ...);
else
     dma_map_page(phys_to_page(phys), offset_in_page(phys), ...);

What did I miss?

I'm not against this rework, but I would really like to know the 
rationale. I know that the 2-step dma-mapping API also use phys 
addresses and this is the same direction.

This patchset focuses only on the dma_map_page -> dma_map_phys rework. 
There are also other interfaces, like dma_alloc_pages() and so far 
nothing has been proposed for them so far.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


