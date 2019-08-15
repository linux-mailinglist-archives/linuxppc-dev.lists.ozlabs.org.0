Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F838ECF9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 15:35:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468SBW0mBKzDqxs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 23:35:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468S6h6DFkzDqW4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 23:32:12 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id AA62D68BFE; Thu, 15 Aug 2019 15:32:04 +0200 (CEST)
Date: Thu, 15 Aug 2019 15:32:04 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 6/6] driver core: initialize a default DMA mask for
 platform device
Message-ID: <20190815133204.GD12036@lst.de>
References: <20190811080520.21712-1-hch@lst.de>
 <20190811080520.21712-7-hch@lst.de>
 <fbea6e6d-7721-b51d-0501-582e8446e9c9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbea6e6d-7721-b51d-0501-582e8446e9c9@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Gavin Li <git@thegavinli.com>, Shawn Guo <shawnguo@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Christoph Hellwig <hch@lst.de>,
 linux-arch@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Alan Stern <stern@rowland.harvard.edu>, NXP Linux Team <linux-imx@nxp.com>,
 Mathias Nyman <mathias.nyman@intel.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Minas Harutyunyan <hminas@synopsys.com>, Olav Kongas <ok@artecdesign.ee>,
 Bin Liu <b-liu@ti.com>, linux-arm-kernel@lists.infradead.org,
 Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Tony Prisk <linux@prisktech.co.nz>,
 iommu@lists.linux-foundation.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 14, 2019 at 04:49:13PM +0100, Robin Murphy wrote:
>> because we have to support platform_device structures that are
>> statically allocated.
>
> This would be a good point to also get rid of the long-standing bodge in 
> platform_device_register_full().

platform_device_register_full looks odd to start with, especially
as the coumentation is rather lacking..

>>   +static void setup_pdev_archdata(struct platform_device *pdev)
>
> Bikeshed: painting the generic DMA API properties as "archdata" feels a bit 
> off-target :/
>
>> +{
>> +	if (!pdev->dev.coherent_dma_mask)
>> +		pdev->dev.coherent_dma_mask = DMA_BIT_MASK(32);
>> +	if (!pdev->dma_mask)
>> +		pdev->dma_mask = DMA_BIT_MASK(32);
>> +	if (!pdev->dev.dma_mask)
>> +		pdev->dev.dma_mask = &pdev->dma_mask;
>> +	arch_setup_pdev_archdata(pdev);
>
> AFAICS m68k's implementation of that arch hook becomes entirely redundant 
> after this change, so may as well go. That would just leave powerpc's 
> actual archdata, which at a glance looks like it could probably be cleaned 
> up with not *too* much trouble.

Actually I think we can just kill both off.  At the point archdata
is indeed entirely misnamed.
