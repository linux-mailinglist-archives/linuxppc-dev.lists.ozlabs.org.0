Return-Path: <linuxppc-dev+bounces-9556-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC59AE0683
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 15:06:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNLV74s43z2yhX;
	Thu, 19 Jun 2025 23:06:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750338415;
	cv=none; b=F13cUWXCLp2OzjqB+E1irhfG/WIYXCDZNGRc9pCnJw8PqgbUXOggBHYqDZH40CyEj2tAl75LYWkScoxnuGwQQsYMUB9KHNT7GcyIwUFboAiU0XtA7nHrxPgkFkg52qYDi0/ZhMH1ySrLBAbJVE3K5kbjPnjmOXfNTN3ZTgjSwMolFNcXHHWNMzOBKeOPxExJY0HQfVQpjhZr/JgzpWuszcv4kxzOI0gi3qVyJL2tANxi56ZeO07LC/pAOMd6seXVbGfEcmeWiNPEcTB+VhUzrzkQzqL31gNcoYcMgGherRnXg7sa3kFBAC6EzrTmndlM8kZWit9/ZFldvHYTUxjhZA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750338415; c=relaxed/relaxed;
	bh=jktagNNxBjLyT1gCDXB2rK9IAYWPETl3Q9PchaYKykg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQiQp8DRXw5ycUh4UKxBB5HRC6/bEGjra84pl1ZR1f+PC388jY93DUpFDk4ufuGsUywPOqvTjTsraVIkmNNOQic19XNscbaXUILY8QCSN5+qKspiljFnrQm0OrgigQ2gYRDgSi2Y34JGyxSuppaltoZ4Tq9i6ocxmDYbFQiE776JXt4MYrNJYo77B1eGke6I2P7YfdnrtjoJg6sWWVrRXZWKM2F5ImzthrNQQ2HA7zCN2UtySK15cKeZooF+bapYE8AAxN96tE2wwUlkkcpqET2KqvmaqYqqWFTZxgKmuwgq+qVPvHGoz0F8+CcJZ/NkdhczdkSI3OCF5zHFm+qV8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eC3DBKvG; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eC3DBKvG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNLV633YXz2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 23:06:54 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 45E7361148;
	Thu, 19 Jun 2025 13:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86C8DC4CEEA;
	Thu, 19 Jun 2025 13:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750338411;
	bh=uSL9ZGnQFzGSFlQq+vqI2UlchlcemJAv0hONIYX6tDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eC3DBKvGSQXvbA5r6xWP0HiddSA/Al/8FiBeEUDpOBM6/SehKPNXwAwHlifTQLtSG
	 u+FADHBYvp/ANrX5IJzrg5hAhBdsISj3hcMIpktlGLDSIa9fkhpPQhbtSD1c2GxnoK
	 oOYNHzMl34SMsohwh5IFfJVCrUUPrBYAbJaU33YD8ElOMZXTnSZLIMFn7Mqb193j33
	 Tnwrw+Go/CaJXG8+yOv+N1dKI4Ptn4maMgZYaheu6idQ4g+C/Ldc2TLMIj/Sh4BK4e
	 RbiIORfDd/MmdL4n+sTJQOzJMg5lTjg5GB8f/uvJauseEg/DN69y9HfSVav7y4janl
	 OqJkBtU2jSxzg==
Date: Thu, 19 Jun 2025 18:36:39 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: mahesh@linux.ibm.com, bhelgaas@google.com, oohall@gmail.com, 
	manivannan.sadhasivam@linaro.org, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI/AER: Use pci_clear_and_set_config_dword() to
 simplify mask updates
Message-ID: <zna2vcwagifaszcvrjg3o6f3kdmjc4zqzc6bh4xdqpayzbpgon@rky4zbodpadz>
References: <20250607155159.805679-1-18255117159@163.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250607155159.805679-1-18255117159@163.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Jun 07, 2025 at 11:51:59PM +0800, Hans Zhang wrote:
> Replace manual read-modify-write sequences in multiple functions with
> pci_clear_and_set_config_dword() to ensure atomic operations and reduce
> code duplication. 
> 

No, pci_clear_and_set_config_dword() doesn't ensure atomicity. It just provides
a helper to avoid code duplication for RMW kind of operations. Nothing
guarantees the function to be atomic.

> Signed-off-by: Hans Zhang <18255117159@163.com>

But the change LGTM. With the above wording corrected,

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> ---
> Changes for v2:
> - The patch commit message were modified.
> - New optimizations for the functions disable_ecrc_checking, aer_enable_irq, and aer_disable_irq have been added.
> ---
>  drivers/pci/pcie/aer.c | 30 +++++++++++-------------------
>  1 file changed, 11 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index 70ac66188367..86cbd204a73f 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -176,14 +176,13 @@ static int enable_ecrc_checking(struct pci_dev *dev)
>  static int disable_ecrc_checking(struct pci_dev *dev)
>  {
>  	int aer = dev->aer_cap;
> -	u32 reg32;
>  
>  	if (!aer)
>  		return -ENODEV;
>  
> -	pci_read_config_dword(dev, aer + PCI_ERR_CAP, &reg32);
> -	reg32 &= ~(PCI_ERR_CAP_ECRC_GENE | PCI_ERR_CAP_ECRC_CHKE);
> -	pci_write_config_dword(dev, aer + PCI_ERR_CAP, reg32);
> +	pci_clear_and_set_config_dword(dev, aer + PCI_ERR_CAP,
> +				       PCI_ERR_CAP_ECRC_GENE |
> +				       PCI_ERR_CAP_ECRC_CHKE, 0);
>  
>  	return 0;
>  }
> @@ -1101,15 +1100,12 @@ static bool find_source_device(struct pci_dev *parent,
>  static void pci_aer_unmask_internal_errors(struct pci_dev *dev)
>  {
>  	int aer = dev->aer_cap;
> -	u32 mask;
>  
> -	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, &mask);
> -	mask &= ~PCI_ERR_UNC_INTN;
> -	pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_MASK, mask);
> +	pci_clear_and_set_config_dword(dev, aer + PCI_ERR_UNCOR_MASK,
> +				       PCI_ERR_UNC_INTN, 0);
>  
> -	pci_read_config_dword(dev, aer + PCI_ERR_COR_MASK, &mask);
> -	mask &= ~PCI_ERR_COR_INTERNAL;
> -	pci_write_config_dword(dev, aer + PCI_ERR_COR_MASK, mask);
> +	pci_clear_and_set_config_dword(dev, aer + PCI_ERR_COR_MASK,
> +				       PCI_ERR_COR_INTERNAL, 0);
>  }
>  
>  static bool is_cxl_mem_dev(struct pci_dev *dev)
> @@ -1555,23 +1551,19 @@ static irqreturn_t aer_irq(int irq, void *context)
>  static void aer_enable_irq(struct pci_dev *pdev)
>  {
>  	int aer = pdev->aer_cap;
> -	u32 reg32;
>  
>  	/* Enable Root Port's interrupt in response to error messages */
> -	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
> -	reg32 |= ROOT_PORT_INTR_ON_MESG_MASK;
> -	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
> +	pci_clear_and_set_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND,
> +				       0, ROOT_PORT_INTR_ON_MESG_MASK);
>  }
>  
>  static void aer_disable_irq(struct pci_dev *pdev)
>  {
>  	int aer = pdev->aer_cap;
> -	u32 reg32;
>  
>  	/* Disable Root Port's interrupt in response to error messages */
> -	pci_read_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, &reg32);
> -	reg32 &= ~ROOT_PORT_INTR_ON_MESG_MASK;
> -	pci_write_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND, reg32);
> +	pci_clear_and_set_config_dword(pdev, aer + PCI_ERR_ROOT_COMMAND,
> +				       ROOT_PORT_INTR_ON_MESG_MASK, 0);
>  }
>  
>  /**
> 
> base-commit: ec7714e4947909190ffb3041a03311a975350fe0
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

