Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E03AB89D71
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 13:59:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466ZBn705GzDqcn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 21:59:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 466Z8x2mgszDqZG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 21:57:34 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9DBBD227A81; Mon, 12 Aug 2019 13:57:26 +0200 (CEST)
Date: Mon, 12 Aug 2019 13:57:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>
Subject: Re: [PATCH 3/6] usb: add a HCD_DMA flag instead of guestimating
 DMA capabilities
Message-ID: <20190812115726.GA9180@lst.de>
References: <20190811080520.21712-1-hch@lst.de>
 <20190811080520.21712-4-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190811080520.21712-4-hch@lst.de>
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
Cc: linux-arch@vger.kernel.org, Gavin Li <git@thegavinli.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Mathias Nyman <mathias.nyman@intel.com>, Geoff Levand <geoff@infradead.org>,
 Olav Kongas <ok@artecdesign.ee>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-usb@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>,
 linux-kernel@vger.kernel.org, Tony Prisk <linux@prisktech.co.nz>,
 iommu@lists.linux-foundation.org, Alan Stern <stern@rowland.harvard.edu>,
 NXP Linux Team <linux-imx@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Minas Harutyunyan <hminas@synopsys.com>, Shawn Guo <shawnguo@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Bin Liu <b-liu@ti.com>,
 linux-arm-kernel@lists.infradead.org,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> diff --git a/drivers/usb/host/ehci-ppc-of.c b/drivers/usb/host/ehci-ppc-of.c
> index 576f7d79ad4e..9d17e0695e35 100644
> --- a/drivers/usb/host/ehci-ppc-of.c
> +++ b/drivers/usb/host/ehci-ppc-of.c
> @@ -31,7 +31,7 @@ static const struct hc_driver ehci_ppc_of_hc_driver = {
>  	 * generic hardware linkage
>  	 */
>  	.irq			= ehci_irq,
> -	.flags			= HCD_MEMORY | HCD_USB2 | HCD_BH,
> +	.flags			= HCD_MEMORY | HC_DMA | HCD_USB2 | HCD_BH,

FYI, the kbuild bot found a little typo here, so even for the unlikely
case that the series is otherwise perfect I'll have to resend it at
least once.
