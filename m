Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6DA7D77DA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 00:30:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ScRxfxyO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SG3X61v60z3dJX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 09:29:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ScRxfxyO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SG3WH3YKFz30f8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 09:29:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 84764CE3BAC;
	Wed, 25 Oct 2023 22:29:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9BBC433C8;
	Wed, 25 Oct 2023 22:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698272950;
	bh=r8HUSzqlDaMXESjFK5gUvBK0xrbNT7QU9T8BuJ2OzII=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ScRxfxyOl3tHVsD6fcTjCUOXcJ82TGdMgHNFaT8XUzABQQmc7KAwIHjiDemvM1Ltp
	 3c7ntN/s0aJuOF+oHuy7Ug+81FFDjFKBZsYXfZThcn9GlltAA2YBfl83yqpwpf2IYx
	 lniZnXD8Q6eXIDByEPPrzjdxRFo/eHlC7gdA7BbQIfZmejEo4sofUelzGjEnF2ywcy
	 lO3qL+/XHITIDaEFdQLL2EmSW+bLzD4bTyIzstq3npT+bEsiSgm/6HQjh42TkOHhC/
	 S4l8V8BUosFGsXqR2VS3+TeiKiFlBRyZUQ96ZyhdxGwPnrVCjNqDkVB5qxtj9Oawqk
	 qAwEVaHlu6gcg==
Date: Wed, 25 Oct 2023 17:29:08 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: Re: [PATCH v6 1/3] PCI/AER: Factor out interrupt toggling into
 helpers
Message-ID: <20231025222908.GA1770972@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230512000014.118942-1-kai.heng.feng@canonical.com>
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
Cc: sathyanarayanan.kuppuswamy@linux.intel.com, mika.westerberg@linux.intel.com, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, koba.ko@canonical.com, Oliver O'Halloran <oohall@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 12, 2023 at 08:00:12AM +0800, Kai-Heng Feng wrote:
> There are many places that enable and disable AER interrupt, so move
> them into helpers.
> 
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

I applied this patch (only 1/3) to pci/aer for v6.7.

I'm not clear on the others yet, so let's look at those again after
v6.7-rc1.  It seemed like there's still a question about disabling
interrupts when we're going to D3hot.

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
> 
