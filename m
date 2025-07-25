Return-Path: <linuxppc-dev+bounces-10408-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDED7B1251A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jul 2025 22:05:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bpf4Z121Bz30Yb;
	Sat, 26 Jul 2025 06:05:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753473934;
	cv=none; b=j6Q11e3CNRfBmp9cRKuZ3N29qsKI+lcZt4VvmMsXJVRGx5g69ORJH979JaCv5OIlMFMmrcw7MZs/GQOyO1AOxlf3l2uJUWM0pO6L6sL9631WSIFskvaScwvwDx4Tg9Hqg3KvTG1cWdkhYnTWkrrOCRP9jlL5QsIdfGl9ndM691qcB/QQPuNp+0NcsnG0BMePhFjwQjJBavZL6O181xLPDHbvUmAIT81qfOmUgWi48Qvpi5vVRYN52FzlsUKG89P73IMbW/T+hTjNnUjEtHm3XJ2dUNAGZqEyNkll0ythMN2YSy418RCkp5ma5GcgGJm+OVLr5UiNVbi0oqO6QHgqzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753473934; c=relaxed/relaxed;
	bh=QMHalZqBHj5+vLhnCWsCzA0DqNLiKy2tC9hrHiUhNds=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KMs/GJNK1t+Lz0hxekH10p3GadtSIpM0ssamtnplbKlXw/v5tKlQOg4Arnu6ngh842FOZEHk9ISTswmTfpGOEC3NN0+yH/rqSGhGxLA6ehD/bFQV24jfyOqOpOzVHm1TaLXU0xa1pMcCvBvVYRhXxjxJsxVEWzS3LSjRvRc28V9XPr0ZclKXm4WBKAatbiHcnfZinJag0+Qf19R/tqX3Al/sJ178kA3EEhHeyojiLhZzrr7ssfvn+WA6vYlrwJ218QbdNEjlP9RQ0qDTRBqMKcxa2z5YTLzzq+h3uOVT6ONaBHdO5gwGbBs9vBpbd7fMSvTjcHJZBDrSbDqttzIDwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=robin.murphy@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bpf4X6gPCz30Qk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jul 2025 06:05:30 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E344176C;
	Fri, 25 Jul 2025 13:04:51 -0700 (PDT)
Received: from [10.57.4.83] (unknown [10.57.4.83])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 167FB3F6A8;
	Fri, 25 Jul 2025 13:04:52 -0700 (PDT)
Message-ID: <02240cf7-c4d4-4296-9b1e-87b4231874a1@arm.com>
Date: Fri, 25 Jul 2025 21:04:50 +0100
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
Subject: Re: [PATCH 6/8] dma-mapping: fail early if physical address is mapped
 through platform callback
To: Leon Romanovsky <leon@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Alexander Potapenko <glider@google.com>,
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 iommu@lists.linux.dev, virtualization@lists.linux.dev,
 kasan-dev@googlegroups.com, linux-trace-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <cover.1750854543.git.leon@kernel.org>
 <5fc1f0ca52a85834b3e978c5d6a3171d7dd3c194.1750854543.git.leon@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <5fc1f0ca52a85834b3e978c5d6a3171d7dd3c194.1750854543.git.leon@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-06-25 2:19 pm, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> All platforms which implement map_page interface don't support physical
> addresses without real struct page. Add condition to check it.

As-is, the condition also needs to cover iommu-dma, because that also 
still doesn't support non-page-backed addresses. You can't just do a 
simple s/page/phys/ rename and hope it's OK because you happen to get 
away with it for coherent, 64-bit, trusted devices.

Thanks,
Robin.

> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>   kernel/dma/mapping.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index 709405d46b2b..74efb6909103 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -158,6 +158,7 @@ dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
>   {
>   	const struct dma_map_ops *ops = get_dma_ops(dev);
>   	phys_addr_t phys = page_to_phys(page) + offset;
> +	bool is_pfn_valid = true;
>   	dma_addr_t addr;
>   
>   	BUG_ON(!valid_dma_direction(dir));
> @@ -170,8 +171,20 @@ dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
>   		addr = dma_direct_map_phys(dev, phys, size, dir, attrs);
>   	else if (use_dma_iommu(dev))
>   		addr = iommu_dma_map_phys(dev, phys, size, dir, attrs);
> -	else
> +	else {
> +		if (IS_ENABLED(CONFIG_DMA_API_DEBUG))
> +			is_pfn_valid = pfn_valid(PHYS_PFN(phys));
> +
> +		if (unlikely(!is_pfn_valid))
> +			return DMA_MAPPING_ERROR;
> +
> +		/*
> +		 * All platforms which implement .map_page() don't support
> +		 * non-struct page backed addresses.
> +		 */
>   		addr = ops->map_page(dev, page, offset, size, dir, attrs);
> +	}
> +
>   	kmsan_handle_dma(phys, size, dir);
>   	trace_dma_map_phys(dev, phys, addr, size, dir, attrs);
>   	debug_dma_map_phys(dev, phys, size, dir, addr, attrs);


