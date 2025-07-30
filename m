Return-Path: <linuxppc-dev+bounces-10470-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A358BB164C4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 18:33:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsd73072jz3blF;
	Thu, 31 Jul 2025 02:33:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753893182;
	cv=none; b=Uh3FIakwLThumaB19RPN93FatNrB0JJ3ACHudpbGbfLtKvAPplsYB318Uez7JnA+vy3Yrx7q5Ea4OT4OG8hJrsCm1WowHGS1UUGAHngRziCFr70X/QgPzazPR8ZBPFjXW1S9lxFqnSRVg+PjetMAlf2lsTTxskYvGStPHX+R+e8qomDPzOlxRcWHNl6KxU0XipJEDDL4PLjPuV7PnX0SIPdUotKxboAWp/WhtjtIkzhvimbeEyebPGOisFFWIYJet9LsC8Ci3MeqnlAqKwDlZxMKgBi1UxbH9v/udDI55OMQLeqMdFxrhCmyI48UN8nwrix1MZrBsXhpuWbO/zRWig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753893182; c=relaxed/relaxed;
	bh=BSL5Fd5ey+NSvWwk5RIT5oUBgeHAV3OrGjQZ6pf7CNI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=lyqRjyuf1aGF+iITsl8H903SbraBIDgRrKYp4fzFE+BFmI1APRChTsd5Ux/jxLB9zQf97KLwGM3YyDFqBSCl0/HjFntA/87zBiWDjrQOUVTnnhqrHq3hsZ9lMWeFSfRusLEKfGHX1S8i95VsW6OFCnHOeBYBLbTDmuho7aRWQ3LvleN5mTVE/nufeD+kGr77Mb3ftYNmiXWfSSX+oL+pbRt6vtvnXDamqC3IXQSwPLbTXOxWj/aF3eo833g3hdBDNLcnnn21ZdC9wH/GsItKTKwYc4M2ImJngwPOb+vsZ4kxjgCqHZ8GK9PsnRV129Wdqdhh/Iy2xnlIlwFBCYUNiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com; dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=tQBF5gQj; dkim-atps=neutral; spf=pass (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org) smtp.mailfrom=samsung.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=tQBF5gQj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsd7012Vrz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Jul 2025 02:32:58 +1000 (AEST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250730163247euoutp0268bc01041077f4adcd2d4651827909b7~XFIsjipxU0495504955euoutp02N
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 16:32:47 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250730163247euoutp0268bc01041077f4adcd2d4651827909b7~XFIsjipxU0495504955euoutp02N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1753893167;
	bh=BSL5Fd5ey+NSvWwk5RIT5oUBgeHAV3OrGjQZ6pf7CNI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=tQBF5gQjRFWWD3NkMzd2sWMQdocEpPuublYXo+DODrhkpC+sAkqpV7G/5+SLj9y3k
	 FAXICFoay1/ibpDiaHyufgBQba2SMsBA7uyao3fLdxKNV0z8FjK9Dw3fJfuRxBPoak
	 rpKYzTJHpu47CanwUZWJZBKrP3JwtACld7b3bvho=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250730163246eucas1p2c966d8d5061fc0214cf993906aeab2f5~XFIrva-kQ2815928159eucas1p2i;
	Wed, 30 Jul 2025 16:32:46 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250730163244eusmtip2f48699419babf589223e18bf9ee0d79d~XFIp1n5Qn1925219252eusmtip2o;
	Wed, 30 Jul 2025 16:32:44 +0000 (GMT)
Message-ID: <ff84b386-4bfa-423b-9364-040598a1ece0@samsung.com>
Date: Wed, 30 Jul 2025 18:32:44 +0200
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
Subject: Re: [PATCH 0/8] dma-mapping: migrate to physical address-based API
To: Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
	Leon Romanovsky <leon@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
	Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
	<xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
	<eperezma@redhat.com>, Alexander Potapenko <glider@google.com>, Marco Elver
	<elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masami Hiramatsu
	<mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	=?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Andrew Morton
	<akpm@linux-foundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	iommu@lists.linux.dev, virtualization@lists.linux.dev,
	kasan-dev@googlegroups.com, linux-trace-kernel@vger.kernel.org,
	linux-mm@kvack.org, Jason Gunthorpe <jgg@ziepe.ca>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <f912c446-1ae9-4390-9c11-00dce7bf0fd3@arm.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250730163246eucas1p2c966d8d5061fc0214cf993906aeab2f5
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf
X-EPHeader: CA
X-CMS-RootMailID: 20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf
References: <CGME20250625131920eucas1p271b196cde042bd39ac08fb12beff5baf@eucas1p2.samsung.com>
	<cover.1750854543.git.leon@kernel.org>
	<35df6f2a-0010-41fe-b490-f52693fe4778@samsung.com>
	<20250627170213.GL17401@unreal> <20250630133839.GA26981@lst.de>
	<69b177dc-c149-40d3-bbde-3f6bad0efd0e@samsung.com>
	<f912c446-1ae9-4390-9c11-00dce7bf0fd3@arm.com>
X-Spam-Status: No, score=-5.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 30.07.2025 13:11, Robin Murphy wrote:
> On 2025-07-08 11:27 am, Marek Szyprowski wrote:
>> On 30.06.2025 15:38, Christoph Hellwig wrote:
>>> On Fri, Jun 27, 2025 at 08:02:13PM +0300, Leon Romanovsky wrote:
>>>>> Thanks for this rework! I assume that the next step is to add 
>>>>> map_phys
>>>>> callback also to the dma_map_ops and teach various dma-mapping 
>>>>> providers
>>>>> to use it to avoid more phys-to-page-to-phys conversions.
>>>> Probably Christoph will say yes, however I personally don't see any
>>>> benefit in this. Maybe I wrong here, but all existing .map_page()
>>>> implementation platforms don't support p2p anyway. They won't benefit
>>>> from this such conversion.
>>> I think that conversion should eventually happen, and rather sooner 
>>> than
>>> later.
>>
>> Agreed.
>>
>> Applied patches 1-7 to my dma-mapping-next branch. Let me know if one
>> needs a stable branch with it.
>
> As the maintainer of iommu-dma, please drop the iommu-dma patch 
> because it is broken. It does not in any way remove the struct page 
> dependency from iommu-dma, it merely hides it so things can crash more 
> easily in circumstances that clearly nobody's bothered to test.
>
>> Leon, it would be great if You could also prepare an incremental patch
>> adding map_phys callback to the dma_maps_ops, so the individual
>> arch-specific dma-mapping providers can be then converted (or simplified
>> in many cases) too.
>
> Marek, I'm surprised that even you aren't seeing why that would at 
> best be pointless churn. The fundamental design of dma_map_page() 
> operating on struct page is that it sits in between alloc_pages() at 
> the caller and kmap_atomic() deep down in the DMA API implementation 
> (which also subsumes any dependencies on having a kernel virtual 
> address at the implementation end). The natural working unit for 
> whatever replaces dma_map_page() will be whatever the replacement for 
> alloc_pages() returns, and the replacement for kmap_atomic() operates 
> on. Until that exists (and I simply cannot believe it would be an 
> unadorned physical address) there cannot be any *meaningful* progress 
> made towards removing the struct page dependency from the DMA API. If 
> there is also a goal to kill off highmem before then, then logically 
> we should just wait for that to land, then revert back to 
> dma_map_single() being the first-class interface, and dma_map_page() 
> can turn into a trivial page_to_virt() wrapper for the long tail of 
> caller conversions.
>
> Simply obfuscating the struct page dependency today by dressing it up 
> as a phys_addr_t with implicit baggage is not not in any way helpful. 
> It only makes the code harder to understand and more bug-prone. 
> Despite the disingenuous claims, it is quite blatantly the opposite of 
> "efficient" for callers to do extra work to throw away useful 
> information with page_to_phys(), and the implementation then have to 
> re-derive that information with pfn_valid()/phys_to_page().
>
> And by "bug-prone" I also include greater distractions like this 
> misguided idea that the same API could somehow work for non-memory 
> addresses too, so then everyone can move on bikeshedding VFIO while 
> overlooking the fundamental flaws in the whole premise. I mean, 
> besides all the issues I've already pointed out in that regard, not 
> least the glaring fact that it's literally just a worse version of *an 
> API we already have*, as DMA API maintainer do you *really* approve of 
> a design that depends on callers abusing DMA_ATTR_SKIP_CPU_SYNC, yet 
> will still readily blow up if they did then call a dma_sync op?
>
Robin, Your concerns are right. I missed the fact that making everything 
depend on phys_addr_t would make DMA-mapping API prone for various 
abuses. I need to think a bit more on this and try to understand more 
the PCI P2P case, what means that I will probably miss this merge 
window. I'm sorry for the lack of being active in the discussion, but I 
just got back from my holidays and I'm trying to catch up.


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


