Return-Path: <linuxppc-dev+bounces-658-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F18E96209E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 09:18:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtwkj1xXsz301w;
	Wed, 28 Aug 2024 17:18:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=94.231.106.210
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724826395;
	cv=none; b=dNZuWOTE4kHO+L++15Eabc2tfEqzJI6dJeBjsy81qdQovSKNH+s37oi7F7Kx4x3zbh2PAfyA0r1BBc1QC4mqB5enXyssJVsgNKUB812/GAmt5i2h0COLAnQgC/F9VxrPssbmjEP/CYs/YvfTRnOuaIbE0jcvvhjAc1Ds4dAhcvgpvKUAp5THNgCYmr/Mn5SgP+YB2md0Fytn+gpx1mDZMLsVNkHusuUoRbAf9Ep3WX953kSdjqIUA4XOZw5id80xQ+VbPIS9Ld9YakSyG3IWdMo4QjxvEKPl5vgZGknpAW8gs2wmt2vE9DPtP4ZnzYwsIsMo3+s5bE2t2Pnn98RHFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724826395; c=relaxed/relaxed;
	bh=MZjaRsFFki5Bx5B5FHnglUd9d4H7fBDSxyu2jHiKATQ=;
	h=X-Greylist:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=YvdxoqRV3c2KiXkabNDNPQG+d6EY1+MF8psl4YSzfqKpEElpw71isAC4gNupbUHRyE3uoco626wKUTY/5RcPKNXMo+PRh6oJgSxAZXIMHUDaObNVqesnRI9w3lvsSXJMhKCraFy6LL8mIXPXiRSQGVA6ffhyF3Tk1NRlrLuSxg3paleTai9PrZUgDkpg4g5d1jbwNW/wa2BfEAFeLAHPQZINknsiPney0rNXlca+zjfPzdaachMaRGNGmGgkIpfbseXqmDYMNP4qOabq7nCXO9M35U45tnr7f1oeBxBKE3jPNXdjUh315Z41fQOZxe5MePIhQFOkdnPoWX7SZCJUBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; dkim=pass (1024-bit key; secure) header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=unoeuro header.b=H9fF3GHs; dkim-atps=neutral; spf=pass (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org) smtp.mailfrom=gaisler.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=unoeuro header.b=H9fF3GHs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gaisler.com (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 308 seconds by postgrey-1.37 at boromir; Wed, 28 Aug 2024 16:26:32 AEST
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WtvZJ4gjMz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 16:26:32 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4WtvSD4CTtz1FXRy;
	Wed, 28 Aug 2024 08:21:16 +0200 (CEST)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4WtvSC6CZ0z1DPkN;
	Wed, 28 Aug 2024 08:21:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=unoeuro; t=1724826076;
	bh=MZjaRsFFki5Bx5B5FHnglUd9d4H7fBDSxyu2jHiKATQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=H9fF3GHsObx42DQlccYjWkCaI8H7IjrygcJqC6jNaK4z0Z18apld5cXSgQVOUCs01
	 KKScBf0M+KhxqxD5GBoovtvU90uovoSytFCOkAnhgzKqOSnS+qVrnNytVlHc49wNmn
	 MMSVwYK7ONDpeF3VHN8cIXWAeIenPfu7ecQ0hXO8=
Message-ID: <12a0f286-3114-4dac-8b75-3a638d9c8635@gaisler.com>
Date: Wed, 28 Aug 2024 08:21:14 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dma-mapping: clearly mark DMA ops as an architecture
 feature
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bingbu Cao <bingbu.cao@intel.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-media@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 Thomas Gleixner <tglx@linutronix.de>
References: <20240828061104.1925127-1-hch@lst.de>
 <20240828061104.1925127-3-hch@lst.de>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20240828061104.1925127-3-hch@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2024-08-28 08:10, Christoph Hellwig wrote:
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -177,8 +177,8 @@ config XEN_GRANT_DMA_ALLOC
>  
>  config SWIOTLB_XEN
>  	def_bool y
> +	depends on ARCH_DMA_OPS

Rename to ARCH_HAS_DMA_OPS in v2 is missing here

>  	depends on XEN_PV || ARM || ARM64
> -	select DMA_OPS
>  	select SWIOTLB
>  
>  config XEN_PCI_STUB
> @@ -348,10 +348,10 @@ config XEN_GRANT_DMA_IOMMU
>  
>  config XEN_GRANT_DMA_OPS
>  	bool
> -	select DMA_OPS
>  
>  config XEN_VIRTIO
>  	bool "Xen virtio support"
> +	depends on ARCH_DMA_OPS

and here.

Cheers,
Andreas


