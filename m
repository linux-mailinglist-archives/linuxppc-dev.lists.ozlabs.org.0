Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3498ECCC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 15:27:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468S1M18MSzDr5J
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 23:27:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linuxfoundation.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="PIdKCMQ/"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 468RwW2NxYzDqsm
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 23:23:22 +1000 (AEST)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B11572084D;
 Thu, 15 Aug 2019 13:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565875400;
 bh=v8T3qwF6qiZM++7vAT7AL0JPe0r/NT0kv4QeyOYP/rE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PIdKCMQ/Lb50XgkTlSzI4dcJJpEBGXjfxY4vMHFbCuhE6F7PCaSzRKr5kWXihgsd6
 CYq+SBnCJXFALaYcaG3aif6qNMb45WH5wI6jKS8CZyb2VbP+PYmponIEA+124IIRAp
 rJJ2vhvhUrSSeOp1mohuc3t3W+bL3ZyLQHR5jtR4=
Date: Thu, 15 Aug 2019 15:23:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: next take at setting up a dma mask by default for platform devices
Message-ID: <20190815132318.GA27208@kroah.com>
References: <20190811080520.21712-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190811080520.21712-1-hch@lst.de>
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

On Sun, Aug 11, 2019 at 10:05:14AM +0200, Christoph Hellwig wrote:
> Hi all,
> 
> this is another attempt to make sure the dma_mask pointer is always
> initialized for platform devices.  Not doing so lead to lots of
> boilerplate code, and makes platform devices different from all our
> major busses like PCI where we always set up a dma_mask.  In the long
> run this should also help to eventually make dma_mask a scalar value
> instead of a pointer and remove even more cruft.
> 
> The bigger blocker for this last time was the fact that the usb
> subsystem uses the presence or lack of a dma_mask to check if the core
> should do dma mapping for the driver, which is highly unusual.  So we
> fix this first.  Note that this has some overlap with the pending
> desire to use the proper dma_mmap_coherent helper for mapping usb
> buffers.  The first two patches from this series should probably
> go into 5.3 and then uses as the basis for the decision to use
> dma_mmap_coherent.

I've taken the first 2 patches for 5.3-final.  Given that patch 3 needs
to be fixed, I'll wait for a respin of these before considering them.

thanks,

greg k-h
