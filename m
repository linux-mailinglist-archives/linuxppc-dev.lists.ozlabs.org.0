Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 835345442EF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 07:09:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJXFk31Slz3chs
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 15:09:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z4YKvf9N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+a39afe573ddbd6ff3389+6864+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z4YKvf9N;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJXF7705sz3bkq
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 15:08:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1370MvjFrg636nlGFXu8CpOfBg8+mRgqzhQ7YScZLE8=; b=z4YKvf9NkWQn8P4v8bwSUJFMzO
	wFYfxYFg0PkZgnD659U4rh7iitXqzKlNSVwWTA1C2nrNn5h07lgmlJhc0ReHis19xaonefaZB6sxZ
	+V+P9DVDmD/46UTQmN/JjdZTZZAQC5fMv8RMAMMUgf2fXLubCn2cMrYDqfdfylD9qDdZdNi8P/Svh
	J+9KZ2qoXLt20f3lL7nsIP15svEtGRlcPZ9rH5GjuL/37Zo1WS6wUeHHKMNr3CNoOja+2Q00FXJVs
	gHmBMVQKXvRtoRkoEQ8E3W/0xik7QAo//cz+ATtxhmw/3yPF5rc4z1d9FC8BroUGeyAeuXFwnjhyj
	BRV2y6Ug==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzAPe-00Gnin-I4; Thu, 09 Jun 2022 05:08:54 +0000
Date: Wed, 8 Jun 2022 22:08:54 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH RFC v1 3/7] swiotlb-xen: support highmem for xen specific
 code
Message-ID: <YqGAZoG6/pVX9NqN@infradead.org>
References: <20220609005553.30954-1-dongli.zhang@oracle.com>
 <20220609005553.30954-4-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609005553.30954-4-dongli.zhang@oracle.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: jgross@suse.com, dave.hansen@linux.intel.com, mst@redhat.com, konrad.wilk@oracle.com, jasowang@redhat.com, x86@kernel.org, joe.jin@oracle.com, linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org, hch@infradead.org, iommu@lists.linux-foundation.org, mingo@redhat.com, bp@alien8.de, sstabellini@kernel.org, xen-devel@lists.xenproject.org, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, m.szyprowski@samsung.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 08, 2022 at 05:55:49PM -0700, Dongli Zhang wrote:
> @@ -109,19 +110,25 @@ int xen_swiotlb_fixup(void *buf, unsigned long nslabs, bool high)
>  	int rc;
>  	unsigned int order = get_order(IO_TLB_SEGSIZE << IO_TLB_SHIFT);
>  	unsigned int i, dma_bits = order + PAGE_SHIFT;
> +	unsigned int max_dma_bits = MAX_DMA32_BITS;
>  	dma_addr_t dma_handle;
>  	phys_addr_t p = virt_to_phys(buf);
>  
>  	BUILD_BUG_ON(IO_TLB_SEGSIZE & (IO_TLB_SEGSIZE - 1));
>  	BUG_ON(nslabs % IO_TLB_SEGSIZE);
>  
> +	if (high) {
> +		dma_bits = MAX_DMA64_BITS;
> +		max_dma_bits = MAX_DMA64_BITS;
> +	}
> +

I think you really want to pass the addressing bits or mask to the
remap callback and not do magic with a 'high' flag here.
