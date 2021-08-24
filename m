Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0703F605A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 16:26:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvBJ66zSnz2yms
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 00:26:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=W/vnTArX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=W/vnTArX; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvBHP0Kytz2xbB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 00:26:08 +1000 (AEST)
Received: by mail-ot1-x329.google.com with SMTP id
 x10-20020a056830408a00b004f26cead745so46521759ott.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 07:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=cLmu7zgJaXKzK4Rf3xZy8rbXQ8G9iiiCS2AqbbVSdr4=;
 b=W/vnTArXnkUTeAWPhVsCsNx9G1AaqqjMh7JGGCeKMkNnaOWP3sAbf+15/nLoCNmR3g
 q5YdGS8A1cXpAtJlYg19EzxhKY4ftiJkULVtdpcPrc3JdAsQuBkyHELZ+nm35chlenyd
 B1EUk7sT/qRPK4Ufw9SGcQJoAGqm8fBuCmyUjLn+ofRgVfuPflWOJHcCCZEENzbQUeyQ
 VmavwAVWpqeeI9XEBe9u66mgOWxsXHJm3RTYGIcz6konO25IcoN22AqYojFn8mbqHxKg
 qRzCfRvKs4A+5DaC8fRnZWJa7UOCRmoYWPgWVuJeEHetkAAVaEkEKj7Ut9tMesrOQeKz
 uFVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=cLmu7zgJaXKzK4Rf3xZy8rbXQ8G9iiiCS2AqbbVSdr4=;
 b=pW/30lPrWTxmiDV/U89JRBGlYfsUGEE3QWNiDqe1I20v47cJPqGLat5KVAJE7/ajFc
 g8EnFkDqPpwVvOqEubC6vB63WFGKw/ON94GW4nbQc5bniMlJxEV/asf6T10Hke7v4zC6
 xPxL2D+qUcapTlc/VoSs5pRPlF98DAUg8IhTl+s2ST6SrmSEpBTz743lDfTe2kVuBxZu
 2DBFeRAvbu7m18TVBhhj/uOW4ZLouCyfb4sloKkp+azh631llAPzlFras8xBnldg88tV
 0nILcut8y6qSzoeZVNIc5gnFno15APs2ONBvjI/0vfG3Q0HvtjUYQUB89efDvP6c3sPV
 +6rA==
X-Gm-Message-State: AOAM532h7r1aJqbwMA8BxoRFekojjYAlJ+qtH+VMtpQcAMtfhEdbm6vB
 kegNQOm7qWJ4toLNd7FgWAA=
X-Google-Smtp-Source: ABdhPJwwcoIM6BcsOG2f+J3p/MRlA0Dk0tp13V1qbyu4iB7WMMjh+hei/xpqfoPCtwiA6Z7Inf6E6w==
X-Received: by 2002:a54:4513:: with SMTP id l19mr3045512oil.143.1629815163193; 
 Tue, 24 Aug 2021 07:26:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 w23sm4515362otk.56.2021.08.24.07.26.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 07:26:02 -0700 (PDT)
Date: Tue, 24 Aug 2021 07:26:01 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH v15 10/12] swiotlb: Add restricted DMA pool initialization
Message-ID: <20210824142601.GA3393158@roeck-us.net>
References: <20210624155526.2775863-1-tientzu@chromium.org>
 <20210624155526.2775863-11-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210624155526.2775863-11-tientzu@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 jxgao@google.com, daniel@ffwll.ch, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, bhelgaas@google.com, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, quic_qiancai@quicinc.com,
 lkml <linux-kernel@vger.kernel.org>, tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 thomas.lendacky@amd.com, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Claire,

On Thu, Jun 24, 2021 at 11:55:24PM +0800, Claire Chang wrote:
> Add the initialization function to create restricted DMA pools from
> matching reserved-memory nodes.
> 
> Regardless of swiotlb setting, the restricted DMA pool is preferred if
> available.
> 
> The restricted DMA pools provide a basic level of protection against the
> DMA overwriting buffer contents at unexpected times. However, to protect
> against general data leakage and system memory corruption, the system
> needs to provide a way to lock down the memory access, e.g., MPU.
> 
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> Tested-by: Will Deacon <will@kernel.org>
> ---
>  include/linux/swiotlb.h |  3 +-
>  kernel/dma/Kconfig      | 14 ++++++++
>  kernel/dma/swiotlb.c    | 76 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 92 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 3b9454d1e498..39284ff2a6cd 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -73,7 +73,8 @@ extern enum swiotlb_force swiotlb_force;
>   *		range check to see if the memory was in fact allocated by this
>   *		API.
>   * @nslabs:	The number of IO TLB blocks (in groups of 64) between @start and
> - *		@end. This is command line adjustable via setup_io_tlb_npages.
> + *		@end. For default swiotlb, this is command line adjustable via
> + *		setup_io_tlb_npages.
>   * @used:	The number of used IO TLB block.
>   * @list:	The free list describing the number of free entries available
>   *		from each index.
> diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
> index 77b405508743..3e961dc39634 100644
> --- a/kernel/dma/Kconfig
> +++ b/kernel/dma/Kconfig
> @@ -80,6 +80,20 @@ config SWIOTLB
>  	bool
>  	select NEED_DMA_MAP_STATE
>  
> +config DMA_RESTRICTED_POOL
> +	bool "DMA Restricted Pool"
> +	depends on OF && OF_RESERVED_MEM
> +	select SWIOTLB

This makes SWIOTLB user configurable, which in turn results in

mips64-linux-ld: arch/mips/kernel/setup.o: in function `arch_mem_init':
setup.c:(.init.text+0x19c8): undefined reference to `plat_swiotlb_setup'
make[1]: *** [Makefile:1280: vmlinux] Error 1

when building mips:allmodconfig.

Should this possibly be "depends on SWIOTLB" ?

Thanks,
Guenter
