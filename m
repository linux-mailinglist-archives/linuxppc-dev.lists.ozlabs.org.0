Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9166E90D4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 12:48:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2DsW05Gtz3fSB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 20:48:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y9gOQsRi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=mika.westerberg@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y9gOQsRi;
	dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q2Drb3Mxzz3cCD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 20:47:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681987663; x=1713523663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NHQvgp+/Rj8vc4D0tZlxdL5eAw2LMvWlJhM14S82Uw0=;
  b=Y9gOQsRihxldZ4Pn1buwjxWpo7gT9HlKaUeJ7XjI4HhoJEkTtvO0KbO+
   hfpfyrKaybZ7ry5PcrWH74/hfwGsLpeBcb3M9KFC9/XKPUERsrNqWLZgP
   b3xrADORcwezV2W7cGa+RxoaeiVuYi5ZKtKMeXmP71FEKfq314CrsWf7i
   5FUIg6coxMV+9et1Yz1yiO3S3BWQeg1Shl8URGQ7vYlZWfJx7e1vyUDZi
   mILu8Dfm+vPpqUJqgQLa9TV4Z0IdOK9fC1oed8iqGxMvP1NntF44q0KJc
   eu3XPj1vIZtUEWH5AYtKofdwEyuaR0uuO36rtcVMV0Qc/6eoApjkQ6poe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325307188"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="325307188"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2023 03:47:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="866204834"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; 
   d="scan'208";a="866204834"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 20 Apr 2023 03:47:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id BAB6421E7; Thu, 20 Apr 2023 13:47:40 +0300 (EEST)
Date: Thu, 20 Apr 2023 13:47:40 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v2 2/4] PCI/AER: Factor out interrput toggling into
 helpers
Message-ID: <20230420104740.GL66750@black.fi.intel.com>
References: <20230420015830.309845-1-kai.heng.feng@canonical.com>
 <20230420015830.309845-2-kai.heng.feng@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230420015830.309845-2-kai.heng.feng@canonical.com>
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
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Typo in $subject:

 interrput -> interrupt

On Thu, Apr 20, 2023 at 09:58:28AM +0800, Kai-Heng Feng wrote:
> There are many places that enable and disable AER interrput, so move
> them into helpers.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
> v2:
>  - New patch.
> 
>  drivers/pci/pcie/aer.c | 45 +++++++++++++++++++++++++-----------------
>  1 file changed, 27 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index f6c24ded134c..1420e1f27105 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -1227,6 +1227,28 @@ static irqreturn_t aer_irq(int irq, void *context)
>  	return IRQ_WAKE_THREAD;
>  }
>  
> +static void aer_enable_irq(struct pci_dev *pdev)
> +{
> +	int aer = pdev->aer_cap;
> +	u32 reg32;
> +
> +	/* Enable Root Port's interrupt in response to error messages */
> +	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
> +	reg32 |= ROOT_PORT_INTR_ON_MESG_MASK;
> +	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
> +}
> +
> +static void aer_disable_irq(struct pci_dev *pdev)
> +{
> +	int aer = pdev->aer_cap;
> +	u32 reg32;
> +
> +	/* Disable Root's interrupt in response to error messages */
> +	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
> +	reg32 &= ~ROOT_PORT_INTR_ON_MESG_MASK;
> +	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
> +}
> +
>  /**
>   * aer_enable_rootport - enable Root Port's interrupts when receiving messages
>   * @rpc: pointer to a Root Port data structure
> @@ -1256,10 +1278,7 @@ static void aer_enable_rootport(struct aer_rpc *rpc)
>  	pci_read_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, &reg32);
>  	pci_write_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS, reg32);
>  
> -	/* Enable Root Port's interrupt in response to error messages */
> -	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
> -	reg32 |= ROOT_PORT_INTR_ON_MESG_MASK;
> -	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
> +	aer_enable_irq(pdev);
>  }
>  
>  /**
> @@ -1274,10 +1293,7 @@ static void aer_disable_rootport(struct aer_rpc *rpc)
>  	int aer = pdev->aer_cap;
>  	u32 reg32;
>  
> -	/* Disable Root's interrupt in response to error messages */
> -	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
> -	reg32 &= ~ROOT_PORT_INTR_ON_MESG_MASK;
> -	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
> +	aer_disable_irq(pdev);
>  
>  	/* Clear Root's error status reg */
>  	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_STATUS, &reg32);
> @@ -1372,12 +1388,8 @@ static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
>  	 */
>  	aer = root ? root->aer_cap : 0;
>  
> -	if ((host->native_aer || pcie_ports_native) && aer) {
> -		/* Disable Root's interrupt in response to error messages */
> -		pci_read_config_dword(root, aer + PCI_ERR_ROOT_COMMAND, &reg32);
> -		reg32 &= ~ROOT_PORT_INTR_ON_MESG_MASK;
> -		pci_write_config_dword(root, aer + PCI_ERR_ROOT_COMMAND, reg32);
> -	}
> +	if ((host->native_aer || pcie_ports_native) && aer)
> +		aer_disable_irq(root);
>  
>  	if (type == PCI_EXP_TYPE_RC_EC || type == PCI_EXP_TYPE_RC_END) {
>  		rc = pcie_reset_flr(dev, PCI_RESET_DO_RESET);
> @@ -1396,10 +1408,7 @@ static pci_ers_result_t aer_root_reset(struct pci_dev *dev)
>  		pci_read_config_dword(root, aer + PCI_ERR_ROOT_STATUS, &reg32);
>  		pci_write_config_dword(root, aer + PCI_ERR_ROOT_STATUS, reg32);
>  
> -		/* Enable Root Port's interrupt in response to error messages */
> -		pci_read_config_dword(root, aer + PCI_ERR_ROOT_COMMAND, &reg32);
> -		reg32 |= ROOT_PORT_INTR_ON_MESG_MASK;
> -		pci_write_config_dword(root, aer + PCI_ERR_ROOT_COMMAND, reg32);
> +		aer_enable_irq(root);
>  	}
>  
>  	return rc ? PCI_ERS_RESULT_DISCONNECT : PCI_ERS_RESULT_RECOVERED;
> -- 
> 2.34.1
