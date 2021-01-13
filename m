Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D402F3CB3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 01:05:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFnl82NHkzDrQ2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 11:05:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GVJsp8Hx; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFnjQ4ZNhzDr31
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 11:03:53 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id cq1so11267pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 16:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=204axfOsodDE4SR5Rhz3nE2QwCb2/l/oST9wJEOlEFU=;
 b=GVJsp8HxghwwZDLorI5npgTYVZme1OERIt3nW9QQuecITP+ftYJuOYKG8AStJR27+N
 977Jjey3jBQW3DDPrgp1xMApw+T781iDHeT+rfJktEyz7szuAlIxozYrS/TjNCylDPTF
 ORYXeym0mdUyo/9ySZTiARE/t0ZEbryj+JROpnd8Ojt3l1fRvxCISjc1qSfRlMZYA90t
 iLh+eQKxueaIHmLu8NnOmnb1sSZJBl0+4h7TZWRzTeFePWQGnlNJjA2469hXA4jgYCc2
 pKp6x2zgwaDHaUGnvD2N0IZoy4ogSMjgM6MbqpIciRwwfcXNmWU7H5kX4Z0jDZsugmHf
 lAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=204axfOsodDE4SR5Rhz3nE2QwCb2/l/oST9wJEOlEFU=;
 b=jAmvTPNvdR4wd9u2fHZ0PApMgc/Wm20kJrBSZ14SD/SxcnJ6vl3bglcNfZ+gptBS8F
 bF2tD7H/SHP+iKnIXkmUknPVFB5GdtpM7EQpUAPoMcJdViBjed/jj9K7oYKgrjKxfpPA
 lAJIm2akCnNluvhpR9w8nkETRg054TM4LWYHMk8jA2vjb+it1v9ZfvcLLX6t5akGwaS/
 ZIE+bGj6dCRBLuUhn4ZZ/lrVtsw+VQGdVM3YJLsAk4mIhIJ9YOzygobOEtxrx+RCEjFx
 pENc8oiAa84Loy0xCXXOiGwKhRQk/jbiP+9/JGTcfMLQQXQllX5U65BXzr+PsTlCQuK+
 wCVA==
X-Gm-Message-State: AOAM53395/wIcvXtozQpy/7MC8eHkULyHodhwz+VOeA9C/BVSeDe1Z5E
 VlOwrrSYYtcGgKY58EdfgGpoqLv9eHo=
X-Google-Smtp-Source: ABdhPJyKW2yUb6Ef8aahwHWdedosi9OcKlVuhxzK8K/SzaSmQmhd9JsswUPANO1f9dSnpLUacKaCEw==
X-Received: by 2002:a17:902:ff06:b029:db:d4f7:9c7d with SMTP id
 f6-20020a170902ff06b02900dbd4f79c7dmr1866788plj.60.1610496229764; 
 Tue, 12 Jan 2021 16:03:49 -0800 (PST)
Received: from [10.67.48.230] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id h8sm240614pjc.2.2021.01.12.16.03.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 16:03:48 -0800 (PST)
Subject: Re: [RFC PATCH v3 2/6] swiotlb: Add restricted DMA pool
To: Claire Chang <tientzu@chromium.org>, robh+dt@kernel.org,
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 joro@8bytes.org, will@kernel.org, frowand.list@gmail.com,
 konrad.wilk@oracle.com, boris.ostrovsky@oracle.com, jgross@suse.com,
 sstabellini@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
 robin.murphy@arm.com
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-3-tientzu@chromium.org>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 M5kY0ACeNhCZJvZ5g4C2Lc9fcTHu8jxmEkI=
Message-ID: <95ae9c1e-c1f1-5736-fe86-12ced1f648f9@gmail.com>
Date: Tue, 12 Jan 2021 16:03:42 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210106034124.30560-3-tientzu@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: drinkcat@chromium.org, devicetree@vger.kernel.org,
 heikki.krogerus@linux.intel.com, saravanak@google.com, peterz@infradead.org,
 xypron.glpk@gmx.de, rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org,
 andriy.shevchenko@linux.intel.com, tfiga@chromium.org,
 bgolaszewski@baylibre.com, iommu@lists.linux-foundation.org,
 grant.likely@arm.com, rdunlap@infradead.org, gregkh@linuxfoundation.org,
 xen-devel@lists.xenproject.org, dan.j.williams@intel.com, treding@nvidia.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/5/21 7:41 PM, Claire Chang wrote:
> Add the initialization function to create restricted DMA pools from
> matching reserved-memory nodes in the device tree.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>  include/linux/device.h  |   4 ++
>  include/linux/swiotlb.h |   7 +-
>  kernel/dma/Kconfig      |   1 +
>  kernel/dma/swiotlb.c    | 144 ++++++++++++++++++++++++++++++++++------
>  4 files changed, 131 insertions(+), 25 deletions(-)
> 
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 89bb8b84173e..ca6f71ec8871 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -413,6 +413,7 @@ struct dev_links_info {
>   * @dma_pools:	Dma pools (if dma'ble device).
>   * @dma_mem:	Internal for coherent mem override.
>   * @cma_area:	Contiguous memory area for dma allocations
> + * @dma_io_tlb_mem: Internal for swiotlb io_tlb_mem override.
>   * @archdata:	For arch-specific additions.
>   * @of_node:	Associated device tree node.
>   * @fwnode:	Associated device node supplied by platform firmware.
> @@ -515,6 +516,9 @@ struct device {
>  #ifdef CONFIG_DMA_CMA
>  	struct cma *cma_area;		/* contiguous memory area for dma
>  					   allocations */
> +#endif
> +#ifdef CONFIG_SWIOTLB
> +	struct io_tlb_mem	*dma_io_tlb_mem;
>  #endif
>  	/* arch specific additions */
>  	struct dev_archdata	archdata;
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index dd8eb57cbb8f..a1bbd7788885 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -76,12 +76,13 @@ extern enum swiotlb_force swiotlb_force;
>   *
>   * @start:	The start address of the swiotlb memory pool. Used to do a quick
>   *		range check to see if the memory was in fact allocated by this
> - *		API.
> + *		API. For restricted DMA pool, this is device tree adjustable.

Maybe write it as this is "firmware adjustable" such that when/if ACPI
needs something like this, the description does not need updating.

[snip]

> +static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
> +				    struct device *dev)
> +{
> +	struct io_tlb_mem *mem = rmem->priv;
> +	int ret;
> +
> +	if (dev->dma_io_tlb_mem)
> +		return -EBUSY;
> +
> +	if (!mem) {
> +		mem = kzalloc(sizeof(*mem), GFP_KERNEL);
> +		if (!mem)
> +			return -ENOMEM;
> +
> +		if (!memremap(rmem->base, rmem->size, MEMREMAP_WB)) {

MEMREMAP_WB sounds appropriate as a default.
Documentation/devicetree/bindings/reserved-memory/ramoops.txt does
define an "unbuffered" property which in premise could be applied to the
generic reserved memory binding as well and that we may have to be
honoring here, if we were to make it more generic. Oh well, this does
not need to be addressed right now I guess.
-- 
Florian
