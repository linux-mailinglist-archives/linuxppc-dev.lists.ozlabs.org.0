Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4425442E8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 07:07:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJXCk3Nspz3cCx
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 15:07:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kYmHjR7g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+a39afe573ddbd6ff3389+6864+infradead.org+hch@bombadil.srs.infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kYmHjR7g;
	dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJXC40zrhz3blC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 15:07:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TvPXHMQO6PU//nHDA0WgcCETKSRRfJH2DEgRCxwDbVs=; b=kYmHjR7gMPF1i+IrBOvuM8YJYv
	JS56zj46eCdXv6HizKLwWK6BBJX65b+pjfOUjohLpFK2UZWT0nc39riUnjJa9KdbSNswiMY1Wf8pW
	BeK204Hw7PCKtQiDfxkbHFRDDBh4d7SeK4+7H/ecJcy6NPU9wTuqwFvK+vowvACpLgMReGOnkxRTZ
	5cCR0G2QrtAuXf7Msmn6xuLzKhR7rk7bI0LOAHyZBtYiAE/U219aV9w9pAMoHOBXScvVJzJ1ITweb
	q41BtyqfX5T02Awsmk9AVmPe1SxBXJvV+k6GtG4ovM5N310b1iJCPRLX5pcqbpP2HDax2X2Zm/YmJ
	KajG5p+w==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzANu-00GnN3-B4; Thu, 09 Jun 2022 05:07:06 +0000
Date: Wed, 8 Jun 2022 22:07:06 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Dongli Zhang <dongli.zhang@oracle.com>
Subject: Re: [PATCH RFC v1 6/7] virtio: use io_tlb_high_mem if it is active
Message-ID: <YqF/+tqMA7GtjfAY@infradead.org>
References: <20220609005553.30954-1-dongli.zhang@oracle.com>
 <20220609005553.30954-7-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609005553.30954-7-dongli.zhang@oracle.com>
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

On Wed, Jun 08, 2022 at 05:55:52PM -0700, Dongli Zhang wrote:
>  /* Unique numbering for virtio devices. */
> @@ -241,6 +243,12 @@ static int virtio_dev_probe(struct device *_d)
>  	u64 device_features;
>  	u64 driver_features;
>  	u64 driver_features_legacy;
> +	struct device *parent = dev->dev.parent;
> +	u64 dma_mask = min_not_zero(*parent->dma_mask,
> +				    parent->bus_dma_limit);
> +
> +	if (dma_mask == DMA_BIT_MASK(64))
> +		swiotlb_use_high(parent);

The driver already very clearly communicated its addressing
requirements.  The underlying swiotlb code needs to transparently
pick the right pool.

