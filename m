Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D38E43418E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 00:44:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYphr5wN8z3bmk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 09:44:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=taEdq55I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=taEdq55I; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYphC4NQDz2yNv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 09:44:11 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3854361154;
 Tue, 19 Oct 2021 22:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634683448;
 bh=/g+wgF+JF3O4Y6H7+V152kAnH9oMhD3tFztz/AZaDXg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=taEdq55I88noCQArDJFBVRb0y+GQm4nLIF+JwfjphkxyTiBMTKaqaVO1LMP9l6ipk
 4xcojsdBrhqBwSlCLOoC0rFkNH5do224KYikvGw/YgXbOOUG/LlgwrLUAOxjU2648E
 FByVYoLxGsqr66Oyr72t+89CrEGLH7+J62Xy8LLgTjjBeQS8te+R29y0rTaJBjOqp5
 CUMVsVLQb8lX/+nf714wjxSPC226yspKH3RO87A9Oj9n/TSyaJKuNbeUez6meaXdTM
 /io3xit3dWXLz/TUpP3Ut6yydOTJ9rHukCFP10z1FZeJqbn5tgrojmQW2aynd9qglr
 lUXhh4/tVJqyw==
Date: Tue, 19 Oct 2021 17:44:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Subject: Re: [PATCH 1/6] PCI/AER: Enable COR/UNCOR error reporting in
 set_device_error_reporting()
Message-ID: <20211019224406.GA2414443@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b583172ece1fb1dab3d75c6007ec8c443323158d.1633369560.git.naveennaidu479@gmail.com>
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
Cc: tsbogend@alpha.franken.de, linux-pci@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, oohall@gmail.com,
 bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 04, 2021 at 11:29:27PM +0530, Naveen Naidu wrote:
> The (PCIe r5.0, sec 7.6.4.3, Table 7-101) and  (PCIe r5.0, sec 7.8.4.6,
> Table 7-104) 

s/7.6.4.3/7.8.4.3/

Cite it like this:

  Per PCIe r5.0, sec 7.8.4.3 and sec 7.8.4.6, the default values ...

> states that the default values for the Uncorrectable Error
> Mask and Correctable Error Mask should be 0b. But the current code does
> not set the default value of these registers when the PCIe bus loads the
> AER service driver.

The defaults specified here are for hardware designers -- this is what
the registers must contain after power-up or reset.  This section of
the spec isn't telling us what the OS is required to write.

If we want to clear these masks, I think we have to:

  1) Analyze every other place that writes the masks to make sure we
  don't break any of them.  There aren't very many, and most of them
  are in drivers, which would be after the aer_probe() path.  There
  might be a conflict with program_hpx_type2(), though.

  2) Make it dependent on pcie_aer_is_native().  Ownership of the AER
  capability can be retained by the platform, in which case the OS
  shouldn't touch it.

> Enable reporting of all correctable and uncorrectable errors during
> aer_probe()
> 
> Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
> ---
>  drivers/pci/pcie/aer.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 9784fdcf3006..88c4ca6098fb 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1212,6 +1212,7 @@ static int set_device_error_reporting(struct pci_dev *dev, void *data)
>  {
>  	bool enable = *((bool *)data);
>  	int type = pci_pcie_type(dev);
> +	int aer = dev->aer_cap;
>  
>  	if ((type == PCI_EXP_TYPE_ROOT_PORT) ||
>  	    (type == PCI_EXP_TYPE_RC_EC) ||
> @@ -1223,8 +1224,18 @@ static int set_device_error_reporting(struct pci_dev *dev, void *data)
>  			pci_disable_pcie_error_reporting(dev);
>  	}
>  
> -	if (enable)
> +	if (enable) {
> +
> +		/* Enable reporting of all uncorrectable errors */
> +		/* Uncorrectable Error Mask - turned on bits disable errors */
> +		pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, 0);
> +
> +		/* Enable reporting of all correctable errors */
> +		/* Correctable Error Mask - turned on bits disable errors */
> +		pci_write_config_dword(dev, aer + PCI_ERR_COR_MASK, 0);
> +
>  		pcie_set_ecrc_checking(dev);
> +	}
>  
>  	return 0;
>  }
> -- 
> 2.25.1
> 
> _______________________________________________
> Linux-kernel-mentees mailing list
> Linux-kernel-mentees@lists.linuxfoundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/linux-kernel-mentees
