Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B71E48EC58
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 15:05:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468RXP1V94zDr72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 23:05:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="uwl+0uYf"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468RTZ49dvzDr4Q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 23:03:30 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3B2B2206C1;
 Thu, 15 Aug 2019 13:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565874207;
 bh=05FKrWR8u7yXNSzvDhK14jodYXXtJLhq05DEOB370o0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uwl+0uYfDOJT/3Ymv4Xv86Es37VhW5Szs/xP6ombz3PRSN6J0RcO0roRJ6TqaUrJ4
 WSmNGttTeaVHYBoDy9MKtrR1Llvej761IhslQEAv61f/O4h2cwf8/2SbbMxIjcxa/O
 n3hqpkpGHdq3IH3OCwePPEUClxHF6VmSJ+8p6W2E=
Date: Thu, 15 Aug 2019 15:03:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 6/6] driver core: initialize a default DMA mask for
 platform device
Message-ID: <20190815130325.GB17065@kroah.com>
References: <20190811080520.21712-1-hch@lst.de>
 <20190811080520.21712-7-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190811080520.21712-7-hch@lst.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Gavin Li <git@thegavinli.com>, Fabio Estevam <festevam@gmail.com>,
 linux-arch@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Alan Stern <stern@rowland.harvard.edu>, NXP Linux Team <linux-imx@nxp.com>,
 Mathias Nyman <mathias.nyman@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Minas Harutyunyan <hminas@synopsys.com>, Olav Kongas <ok@artecdesign.ee>,
 Bin Liu <b-liu@ti.com>, linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Geoff Levand <geoff@infradead.org>,
 Shawn Guo <shawnguo@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tony Prisk <linux@prisktech.co.nz>,
 iommu@lists.linux-foundation.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Aug 11, 2019 at 10:05:20AM +0200, Christoph Hellwig wrote:
> We still treat devices without a DMA mask as defaulting to 32-bits for
> both mask, but a few releases ago we've started warning about such
> cases, as they require special cases to work around this sloppyness.
> Add a dma_mask field to struct platform_object so that we can initialize
> the dma_mask pointer in struct device and initialize both masks to
> 32-bits by default.  Architectures can still override this in
> arch_setup_pdev_archdata if needed.
> 
> Note that the code looks a little odd with the various conditionals
> because we have to support platform_device structures that are
> statically allocated.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/base/platform.c         | 15 +++++++++++++--
>  include/linux/platform_device.h |  1 +
>  2 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index ec974ba9c0c4..b216fcb0a8af 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -264,6 +264,17 @@ struct platform_object {
>  	char name[];
>  };
>  
> +static void setup_pdev_archdata(struct platform_device *pdev)
> +{
> +	if (!pdev->dev.coherent_dma_mask)
> +		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
> +	if (!pdev->dma_mask)
> +		pdev->dma_mask = DMA_BIT_MASK(32);
> +	if (!pdev->dev.dma_mask)
> +		pdev->dev.dma_mask = &pdev->dma_mask;
> +	arch_setup_pdev_archdata(pdev);
> +};
> +
>  /**
>   * platform_device_put - destroy a platform device
>   * @pdev: platform device to free
> @@ -310,7 +321,7 @@ struct platform_device *platform_device_alloc(const char *name, int id)
>  		pa->pdev.id = id;
>  		device_initialize(&pa->pdev.dev);
>  		pa->pdev.dev.release = platform_device_release;
> -		arch_setup_pdev_archdata(&pa->pdev);
> +		setup_pdev_archdata(&pa->pdev);
>  	}
>  
>  	return pa ? &pa->pdev : NULL;
> @@ -512,7 +523,7 @@ EXPORT_SYMBOL_GPL(platform_device_del);
>  int platform_device_register(struct platform_device *pdev)
>  {
>  	device_initialize(&pdev->dev);
> -	arch_setup_pdev_archdata(pdev);
> +	setup_pdev_archdata(pdev);
>  	return platform_device_add(pdev);
>  }
>  EXPORT_SYMBOL_GPL(platform_device_register);
> diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
> index 9bc36b589827..a2abde2aef25 100644
> --- a/include/linux/platform_device.h
> +++ b/include/linux/platform_device.h
> @@ -24,6 +24,7 @@ struct platform_device {
>  	int		id;
>  	bool		id_auto;
>  	struct device	dev;
> +	u64		dma_mask;

Why is the dma_mask in 'struct device' which is part of this structure,
not sufficient here?  Shouldn't the "platform" be setting that up
correctly already in the "archdata" type callback?

confused,

greg k-h
