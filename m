Return-Path: <linuxppc-dev+bounces-11641-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D7EB40ED8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Sep 2025 22:50:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGdD13f5hz2ySJ;
	Wed,  3 Sep 2025 06:50:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.118.77.11
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756846209;
	cv=none; b=a72/0PRwcG7jzLFcjB5HB3kKDoiun9GFJQTrsmYmZJvBpnAiIMI0PLUs4zkq/a8rmky9585OVwLMhQIVQBIi3nqqc2RZPAVoQKRUsvQpWxKrHuDcx4LHygd539HHQwy+Dy41TSOnfZt2iwTgUaYFY9t90XSArYEvXi+f30omhtSjwk9hAmP/dOcLXw2POLE7j33lhYOq1YtA/2/Cu7WtcU6eLH0JVTgnEXVto656cjxFU5szioYcVAiy0D/9Apa3+s/sdKRlTv/buohNOpakaBQu9CsJZd4Dc9OAdFBAKRyT/hvyK6sHJJE7ERzTiWba1uApp1g2LOZYNCr7gt9kRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756846209; c=relaxed/relaxed;
	bh=cns0fXIAbt1EqvizSg/wAnSv3SWVs6AXpQ/9VbxT1xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=heHwyF2ALUdmicskB2AoMnLlT15VYjmM81w/m4swSwca9CPLRMgvl0DArFiAai3kfMEIX4/khOrfIDDzAN8eFmglNW8ENa/8+b/x5rUVwKqls/tdnhzxl+iwvh43nIOT0DAhUipOlyxEBkXThMiQOkjgWCN2ImD5VHqbUa1WROx0WbcwSxRLMYNxOME0Gm+sL0dgiPZl/DBmE5R0BY8kAiMZvwckBprivM6tmE1d0qYrnp/e+De8c29l6S3vx6/4IpoFjDwctkbJqRMNie6La3OJiOOO11x+6JivD5/SnLz3iPKpLjHXyrwH+mzqwwQmwrk3AYSxIT4/YoWyk5V5ng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com; dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=TCSDXZF2; dkim-atps=neutral; spf=pass (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org) smtp.mailfrom=samsung.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=TCSDXZF2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.11; helo=mailout1.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGdCw5wGlz2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 06:50:01 +1000 (AEST)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250902204951euoutp019772216366e471dce5ab670ff270a1c3~hkk2PqBI40583005830euoutp01b;
	Tue,  2 Sep 2025 20:49:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250902204951euoutp019772216366e471dce5ab670ff270a1c3~hkk2PqBI40583005830euoutp01b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756846191;
	bh=cns0fXIAbt1EqvizSg/wAnSv3SWVs6AXpQ/9VbxT1xc=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=TCSDXZF2Z62YcDiWqMDDa7Dv+pRBN+EUSjgrFZ1mzkO8tak0poyAI0nhbznKNDhqf
	 D8kNvQjhwMLyfbECL2R2+e0uzHGZze/5arbNIj/FB7PwNbK4vxp5cjSUYa4Wb+jDZr
	 M4rtfp2Rgp2ma7OWloLOB4f81ua8G4Rw/nxkJvc0=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250902204950eucas1p1185c6ab6c55958183bb0c347b0396b5b~hkk1r34Tc3157531575eucas1p1q;
	Tue,  2 Sep 2025 20:49:50 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250902204948eusmtip14b51a6d907c8deca19aa6660d162e2c8~hkkz6C6Li1369313693eusmtip1I;
	Tue,  2 Sep 2025 20:49:48 +0000 (GMT)
Message-ID: <2d8e67b2-4ab2-4c1f-9ef3-470810f99d07@samsung.com>
Date: Tue, 2 Sep 2025 22:49:48 +0200
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
Subject: Re: [PATCH v4 14/16] block-dma: migrate to dma_map_phys instead of
 map_page
To: Leon Romanovsky <leon@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Alexander Potapenko
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
In-Reply-To: <22b824931bc8ba090979ab902e4c1c2ec8327b65.1755624249.git.leon@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250902204950eucas1p1185c6ab6c55958183bb0c347b0396b5b
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250819173845eucas1p221cd6842839f5e7130f131cd341df566
X-EPHeader: CA
X-CMS-RootMailID: 20250819173845eucas1p221cd6842839f5e7130f131cd341df566
References: <cover.1755624249.git.leon@kernel.org>
	<CGME20250819173845eucas1p221cd6842839f5e7130f131cd341df566@eucas1p2.samsung.com>
	<22b824931bc8ba090979ab902e4c1c2ec8327b65.1755624249.git.leon@kernel.org>
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 19.08.2025 19:36, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
>
> After introduction of dma_map_phys(), there is no need to convert
> from physical address to struct page in order to map page. So let's
> use it directly.
>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>   block/blk-mq-dma.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/block/blk-mq-dma.c b/block/blk-mq-dma.c
> index ad283017caef..37e2142be4f7 100644
> --- a/block/blk-mq-dma.c
> +++ b/block/blk-mq-dma.c
> @@ -87,8 +87,8 @@ static bool blk_dma_map_bus(struct blk_dma_iter *iter, struct phys_vec *vec)
>   static bool blk_dma_map_direct(struct request *req, struct device *dma_dev,
>   		struct blk_dma_iter *iter, struct phys_vec *vec)
>   {
> -	iter->addr = dma_map_page(dma_dev, phys_to_page(vec->paddr),
> -			offset_in_page(vec->paddr), vec->len, rq_dma_dir(req));
> +	iter->addr = dma_map_phys(dma_dev, vec->paddr, vec->len,
> +			rq_dma_dir(req), 0);
>   	if (dma_mapping_error(dma_dev, iter->addr)) {
>   		iter->status = BLK_STS_RESOURCE;
>   		return false;

I wonder where is the corresponding dma_unmap_page() call and its change 
to dma_unmap_phys()...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


