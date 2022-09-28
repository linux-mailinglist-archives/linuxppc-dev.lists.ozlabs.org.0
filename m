Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DB45EE849
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 23:25:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Md8fJ4pbSz3cB8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 07:25:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bmHoUFto;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bmHoUFto;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Md8dm0MyRz301Z
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 07:24:43 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2A38F61FD6;
	Wed, 28 Sep 2022 21:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67572C433C1;
	Wed, 28 Sep 2022 21:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664400280;
	bh=2tsvDWLXjCpSXx1+oUyz7uGKdlBt4GQ4EDst+XULMCw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=bmHoUFtootrIm0LTKeUm87bx+60c5m3zWVFiLeEOk7uVbCQwbOpB61HCSMCjVtfA4
	 a8qzkehPhyuMNZrtF01H54IQLumoZtZ3KUD+NISykk4i973RhMKY7e0r9SfKzTct6a
	 3VkGYvQU/h9/mb8/ZJsBXh4QUU8SFTCioBE0ue8aK8/h5Fgg/fXyaoNtrgZE9FeuWF
	 i7Wb+SCTZLa+xmNRJlAAg+mWrAFnmkdEJifjEUu5j1cHBkT8QzZUWWPbqlN9OwZfdz
	 qP/Lz+I6vT2LNBRxLbraJwYjTNu6LW4XE9wvPQZg5PclAxvCPZftjnRY7nXU8o340N
	 9swtcJP8RWQfg==
Date: Wed, 28 Sep 2022 16:24:38 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH 3/3] PCI/DPC: Disable DPC service on suspend when IRQ is
 shared with PME
Message-ID: <20220928212438.GA1836272@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727013255.269815-3-kai.heng.feng@canonical.com>
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
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, mika.westerberg@linux.intel.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 27, 2022 at 09:32:52AM +0800, Kai-Heng Feng wrote:
> PCIe service that shares IRQ with PME may cause spurious wakeup on
> system suspend.
> 
> Since AER is conditionally disabled in previous patch, also apply the
> same condition to disable DPC which depends on AER to work.
> 
> PCIe Base Spec 5.0, section 5.2 "Link State Power Management" states
> that TLP and DLLP transmission is disabled for a Link in L2/L3 Ready
> (D3hot), L2 (D3cold with aux power) and L3 (D3cold), so we don't lose
> much here to disable DPC during system suspend.
> 
> This is very similar to previous attempts to suspend AER and DPC [1],
> but with a different reason.
> 
> [1] https://lore.kernel.org/linux-pci/20220408153159.106741-1-kai.heng.feng@canonical.com/
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=216295
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/pci/pcie/dpc.c | 52 +++++++++++++++++++++++++++++++++---------
>  1 file changed, 41 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index 3e9afee02e8d1..542f282c43f75 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -343,13 +343,33 @@ void pci_dpc_init(struct pci_dev *pdev)
>  	}
>  }
>  
> +static void dpc_enable(struct pcie_device *dev)
> +{
> +	struct pci_dev *pdev = dev->port;
> +	u16 ctl;
> +
> +	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
> +	ctl = (ctl & 0xfff4) | PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN;
> +	pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl);
> +}

I guess the reason we need this is because we disable interupts in
pci_pm_suspend() first, then we call pci_save_dpc_state() from
pci_pm_suspend_noirq(), so we save the *disabled* control register.
Then when we resume, we restore that disabled control register so we
need to enable DPC again.  Right?

I think we should save a "dpc_enabled" bit in the pci_dev and
conditionally set PCI_EXP_DPC_CTL_INT_EN here.  If we unconditionally
set it here, we depend on portdrv *not* calling dpc_resume() if we
didn't enable DPC at enumeration-time for some reason.

And I would leave PCI_EXP_DPC_CTL_EN_FATAL alone; see below.

> +static void dpc_disable(struct pcie_device *dev)
> +{
> +	struct pci_dev *pdev = dev->port;
> +	u16 ctl;
> +
> +	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
> +	ctl &= ~(PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN);
> +	pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl);

  #define  PCI_EXP_DPC_CTL_EN_FATAL       0x0001
  #define  PCI_EXP_DPC_CTL_INT_EN         0x0008

Clearing PCI_EXP_DPC_CTL_INT_EN makes sense to me, but I don't
understand the PCI_EXP_DPC_CTL_EN_FATAL part.

PCI_EXP_DPC_CTL_EN_FATAL is one of the four values of the two-bit DPC
Trigger Enable, so clearing that bit leaves the field as either 00b
(DPC is disabled) or 10b (DPC enabled and triggered when the port
detects an uncorrectable error or receives an ERR_NONFATAL or
ERR_FATAL message).

I think we should only clear PCI_EXP_DPC_CTL_INT_EN.

> +}
> +
>  #define FLAG(x, y) (((x) & (y)) ? '+' : '-')
>  static int dpc_probe(struct pcie_device *dev)
>  {
>  	struct pci_dev *pdev = dev->port;
>  	struct device *device = &dev->device;
>  	int status;
> -	u16 ctl, cap;
> +	u16 cap;
>  
>  	if (!pcie_aer_is_native(pdev) && !pcie_ports_dpc_native)
>  		return -ENOTSUPP;
> @@ -364,10 +384,7 @@ static int dpc_probe(struct pcie_device *dev)
>  	}
>  
>  	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CAP, &cap);
> -	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
> -
> -	ctl = (ctl & 0xfff4) | PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN;
> -	pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl);

I think we should keep the PCI_EXP_DPC_CTL_EN_FATAL part here. That
just sets the desired trigger mode but AFAICT, has nothing to do with
generating interrupts.

> +	dpc_enable(dev);

Then dpc_enable() could be called something like dpc_enable_irq(), and
it would *only* control interupt generation.

>  	pci_info(pdev, "enabled with IRQ %d\n", dev->irq);
>  
>  	pci_info(pdev, "error containment capabilities: Int Msg #%d, RPExt%c PoisonedTLP%c SwTrigger%c RP PIO Log %d, DL_ActiveErr%c\n",
> @@ -380,14 +397,25 @@ static int dpc_probe(struct pcie_device *dev)
>  	return status;
>  }
>  
> -static void dpc_remove(struct pcie_device *dev)
> +static int dpc_suspend(struct pcie_device *dev)
>  {
> -	struct pci_dev *pdev = dev->port;
> -	u16 ctl;
> +	if (dev->shared_pme_irq)
> +		dpc_disable(dev);
>  
> -	pci_read_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, &ctl);
> -	ctl &= ~(PCI_EXP_DPC_CTL_EN_FATAL | PCI_EXP_DPC_CTL_INT_EN);
> -	pci_write_config_word(pdev, pdev->dpc_cap + PCI_EXP_DPC_CTL, ctl);
> +	return 0;
> +}
> +
> +static int dpc_resume(struct pcie_device *dev)
> +{
> +	if (dev->shared_pme_irq)
> +		dpc_enable(dev);
> +
> +	return 0;
> +}
> +
> +static void dpc_remove(struct pcie_device *dev)
> +{
> +	dpc_disable(dev);
>  }
>  
>  static struct pcie_port_service_driver dpcdriver = {
> @@ -395,6 +423,8 @@ static struct pcie_port_service_driver dpcdriver = {
>  	.port_type	= PCIE_ANY_PORT,
>  	.service	= PCIE_PORT_SERVICE_DPC,
>  	.probe		= dpc_probe,
> +	.suspend	= dpc_suspend,
> +	.resume		= dpc_resume,
>  	.remove		= dpc_remove,
>  };
>  
> -- 
> 2.36.1
> 
