Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6C55EE891
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 23:46:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Md9701kMYz3cBF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 07:46:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MFj660pB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MFj660pB;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Md96M1sJCz2xtF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 07:46:03 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 94E9261FF0;
	Wed, 28 Sep 2022 21:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA194C433D6;
	Wed, 28 Sep 2022 21:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664401559;
	bh=ZImTpZIu1Oe/UGX3YTfpv34oAqqGDVjjQAwxKC7tMS0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=MFj660pBOrMYHQoas/9wCNwNCnFH8hiE2aXMVVjE621A0IAbNHp9IDdTCc2/ymELq
	 EPKfRfEI6vwNjcDL0/72pbOhTpWWPv0D2We2IuSV8En7RBMUQK57X8ZG+XY7YEp8U1
	 cdZwKL3rLoI8euNyPPw6bITZQBDYNTGUW6rMdsbAFcp94IeGZvKvkyU3j/bI/OT7pZ
	 0evYbRVsI00MtictJpn/qLofVAYigAFymh6WrOisW0e5mHzc0Bi4EUv8dzFDbRPLoy
	 J5xbrKMorcy9XQPFt4ZSJjBUjFJMugBK/QMUvfu88XAOMgQgjlf29xTLu9TfMTLYfH
	 7ieEQ6DSQwILw==
Date: Wed, 28 Sep 2022 16:45:57 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH 2/3] PCI/AER: Disable AER service on suspend when IRQ is
 shared with PME
Message-ID: <20220928214557.GA1840266@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220727013255.269815-2-kai.heng.feng@canonical.com>
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

On Wed, Jul 27, 2022 at 09:32:51AM +0800, Kai-Heng Feng wrote:
> PCIe service that shares IRQ with PME may cause spurious wakeup on
> system suspend.
> 
> PCIe Base Spec 5.0, section 5.2 "Link State Power Management" states
> that TLP and DLLP transmission is disabled for a Link in L2/L3 Ready
> (D3hot), L2 (D3cold with aux power) and L3 (D3cold), so we don't lose
> much here to disable AER during system suspend.
> 
> This is very similar to previous attempts to suspend AER and DPC [1],
> but with a different reason.
> 
> [1] https://lore.kernel.org/linux-pci/20220408153159.106741-1-kai.heng.feng@canonical.com/
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=216295
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>  drivers/pci/pcie/aer.c | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 7952e5efd6cf3..60cc373754af2 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1372,6 +1372,26 @@ static int aer_probe(struct pcie_device *dev)
>  	return 0;
>  }
>  
> +static int aer_suspend(struct pcie_device *dev)
> +{
> +	struct aer_rpc *rpc = get_service_data(dev);
> +
> +	if (dev->shared_pme_irq)
> +		aer_disable_rootport(rpc);

aer_disable_rootport() seems like it might be overkill.  IIUC, what
we want to do here is disable AER interrupts, which should only
require clearing ROOT_PORT_INTR_ON_MESG_MASK in PCI_ERR_ROOT_COMMAND.

In addition to clearing ROOT_PORT_INTR_ON_MESG_MASK,
aer_disable_rootport() traverses the whole hierarchy, clearing
PCI_EXP_AER_FLAGS (CERE | NFERE | FERE | URRE) in PCI_EXP_DEVCTL.
I don't think these DEVCTL bits control interrupt generation, so I
don't know why we need to touch them.

aer_disable_rootport() also clears PCI_ERR_ROOT_STATUS, which I think
we should not do during suspend either.  We might want to clear it
on resume (which we already do in pci_restore_state()), but I think
generally we should preserve error information as long as it doesn't
cause trouble.

Your thoughts please :)

> +
> +	return 0;
> +}
> +
> +static int aer_resume(struct pcie_device *dev)
> +{
> +	struct aer_rpc *rpc = get_service_data(dev);
> +
> +	if (dev->shared_pme_irq)
> +		aer_enable_rootport(rpc);
> +
> +	return 0;
> +}
> +
>  /**
>   * aer_root_reset - reset Root Port hierarchy, RCEC, or RCiEP
>   * @dev: pointer to Root Port, RCEC, or RCiEP
> @@ -1441,8 +1461,9 @@ static struct pcie_port_service_driver aerdriver = {
>  	.name		= "aer",
>  	.port_type	= PCIE_ANY_PORT,
>  	.service	= PCIE_PORT_SERVICE_AER,
> -
>  	.probe		= aer_probe,
> +	.suspend	= aer_suspend,
> +	.resume		= aer_resume,
>  	.remove		= aer_remove,
>  };
>  
> -- 
> 2.36.1
> 
