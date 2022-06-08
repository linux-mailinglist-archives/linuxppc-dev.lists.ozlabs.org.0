Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7FE543D69
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jun 2022 22:12:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJJKk49bJz3byk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 06:12:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DAy4R+MJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DAy4R+MJ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJJK73tbGz2ypV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 06:11:39 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F19A61CC1;
	Wed,  8 Jun 2022 20:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5128EC34116;
	Wed,  8 Jun 2022 20:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654719096;
	bh=8k4Ru3Gy+AFvhMwirgmAMtpZOoo6pJniIfpDb3kJRPk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=DAy4R+MJ0Y+hlxmsGMa5Ux3JBpY6hkerKaxsCZV9sSxlCMFbPS+sKQjmoLU5jopkK
	 pXERrkV50Nvjo8yDk8Kt+SYyzRXUPtCPuIwvu0z1oIWkIwD+5X/xWtFMQhuodWi7QF
	 iz0B+zrXCFWlDfypWQznJyfGu6qottYir6tHFycALC7cCiE6krAyn3jJeRdxu8Utdf
	 R4Q6F6Y4r3CGVVAUQT2i7n26posKRQk9RDn/REa3jtszJBuEPtpet2emxXKv8Zlg2f
	 DH3Q1UB9BCbaZV5Xcy4KraNzWb7tkf3Og/nh+gEjaFHwWN/ysWBLCfxaF7lg9agESL
	 WGVzaV1BHMNkw==
Date: Wed, 8 Jun 2022 15:11:34 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] PCI/ERR: handle disconnected devices in
 report_error_detected
Message-ID: <20220608201134.GA417165@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220601074024.3481035-1-hch@lst.de>
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
Cc: linux-pci@vger.kernel.org, kbusch@kernel.org, oohall@gmail.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 01, 2022 at 09:40:24AM +0200, Christoph Hellwig wrote:
> When a device is already unplugged by pciehp by the time that the AER
> handler is invoked, the PCIe device will lready be in the
> pci_channel_io_perm_failure state.  In that case we should simply
> return PCI_ERS_RESULT_DISCONNECT instead of trying to do a state
> transition that will fail.
> 
> Also untangle the state transition failure from the lack of methods to
> improve the debugging output in case it will happen ever again.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Applied with Sathy's reviewed-by to pci/err for v5.20, thanks!

> ---
>  drivers/pci/pcie/err.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
> index 0c5a143025af4..59c90d04a609a 100644
> --- a/drivers/pci/pcie/err.c
> +++ b/drivers/pci/pcie/err.c
> @@ -55,10 +55,14 @@ static int report_error_detected(struct pci_dev *dev,
>  
>  	device_lock(&dev->dev);
>  	pdrv = dev->driver;
> -	if (!pci_dev_set_io_state(dev, state) ||
> -		!pdrv ||
> -		!pdrv->err_handler ||
> -		!pdrv->err_handler->error_detected) {
> +	if (pci_dev_is_disconnected(dev)) {
> +		vote = PCI_ERS_RESULT_DISCONNECT;
> +	} else if (!pci_dev_set_io_state(dev, state)) {
> +		pci_info(dev, "can't recover (state transition %u -> %u invalid)\n",
> +			dev->error_state, state);
> +		vote = PCI_ERS_RESULT_NONE;
> +	} else if (!pdrv || !pdrv->err_handler ||
> +		   !pdrv->err_handler->error_detected) {
>  		/*
>  		 * If any device in the subtree does not have an error_detected
>  		 * callback, PCI_ERS_RESULT_NO_AER_DRIVER prevents subsequent
> -- 
> 2.30.2
> 
