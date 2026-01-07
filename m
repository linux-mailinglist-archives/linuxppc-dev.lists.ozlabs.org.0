Return-Path: <linuxppc-dev+bounces-15376-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82840CFCD30
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 10:21:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmMxJ0nSMz2yGL;
	Wed, 07 Jan 2026 20:21:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767777715;
	cv=none; b=DfWspcTp1mY8uku/a3gwSkZ7QPzZvztWAyCj3gyTHXCEDeDGnDG1vg3ZwCk6GwVKwQTSjzc/BaWzPLlwp18ZnfKS48+ueEv/EO4P4zc06xWcLpz6MZB5pf8YyESBeOAQ2GWVbsGuof5NXwen03P+hw0fkHFk+OfUzVtMIPEc5p8GGeFhznoWslMiotfRMZ9J5eBVPjCvo4/TeF3fhjoghn/vN2b7SeJF4ZO8ySvHNlhD6axK3bnkgSCghiBMcsuuzFPXRd83EbrQ7JcTJeTQ+cqgcITE7Q2wBFf1sfNCnprzjY/Gpn2DGYNhtAZM/Hb8dED4+pedj/gguCS7Vpa9Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767777715; c=relaxed/relaxed;
	bh=xAR7AyOffi0J4v3IJCrTTVFdDa0/WpVcFlQLdJCCMn4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2qgHK3rSXMuyMvKGsqtwqBGHZK8oaS8ZdiReSb2Iw3LsaKPfuypJdADDZft/kvPvdjndMSAIf5ONpELQxlzpldgRgbpGU+IJHFs1qHMz7mtuGSzARdR3rEvVXh8Hh540FhabQ9qPs0XnqYzemp7wacx/btEbVPmIzTcZqQVb8XEb/B4LotSJIrlpyzUqhWoDV6Nz64dhge5/5JCNmza2GALPAlE9eOhE/d435HEvgINwb3npUXVR4GcTWFRbmBagXHJ4pHCXawHvB8YKsTjNZnzSk7q7k7wX34FBb78k+6Gf6+bYnDU7CZeEvIC7jz/d4o6mpLxqAl+8lTU9VDPew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B6i7g2fH; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B6i7g2fH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmMxH1zP0z2yFq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 20:21:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2CB54417D4;
	Wed,  7 Jan 2026 09:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45B99C4CEF7;
	Wed,  7 Jan 2026 09:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767777713;
	bh=8DINCbuJQD5wwJWcbQ2qfTOQo9DyNZ/cR+d1iKICHx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B6i7g2fHcAv2ATBTCSv0FqR2vlQ505Lrja7YsyJy3Uog16uBI9cthAmju+OuOCB0b
	 8cCziRMahyuh9dHODb37OVBmEKOJSevUWrbP1+SvOz/kT/xZ/YOeBQ7CDrT2j4Lo9a
	 tqLWrUl7ejmvLweAqkIp/NbxrlLGw/WbWy2mG+sFTFYkPaQumBC98H21+6acbKwYGK
	 e3Sa8YQzzjaBFYMDZM/OiVFB58DbmnjsBsMHuekNiYh2VEwTg909mVyvt0BIwDu9tQ
	 2v9AV4p7GFWQKxsQOqJBu/EIDFX+gluLrHM7nXW6nj0FlzsDXNfAqw3Di08OHyVrVi
	 4dLreSbP3bK8w==
Date: Wed, 7 Jan 2026 14:51:45 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lukas Wunner <lukas@wunner.de>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, Giovanni Cabiddu <giovanni.cabiddu@intel.com>, 
	Feng Tang <feng.tang@linux.alibaba.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI/portdev: Disable AER for Titan Ridge 4C 2018
Message-ID: <65j2ah57lotdhzocczw4jq5zsc2w37aj6wskv6zfptpsi6kpmk@qz7oiiovzjgb>
References: <20260107081445.1100-1-atharvatiwarilinuxdev@gmail.com>
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
In-Reply-To: <20260107081445.1100-1-atharvatiwarilinuxdev@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 07, 2026 at 08:14:35AM +0000, Atharva Tiwari wrote:
> Changes since v1:
> 	Transferred logic to drivers/pci/quicks.c
> 
> Disable AER for Intel Titan Ridge 4C 2018
> (used in T2 iMacs, where the warnings appear)
> that generate continuous pcieport warnings. such as:
> 
> pcieport 0000:00:1c.4: AER: Correctable error message received from 0000:07:00.0
> pcieport 0000:07:00.0: PCIe Bus Error: severity=Correctable, type=Data Link Layer, (Receiver ID)
> pcieport 0000:07:00.0:   device [8086:15ea] error status/mask=00000080/00002000
> pcieport 0000:07:00.0:    [ 7] BadDLLP
> 
> (see: https://bugzilla.kernel.org/show_bug.cgi?id=220651)
> 
> macOS also disables AER for Thunderbolt devices and controllers in their drivers.
> 
> Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>

Discussion in v1 of this patch is not yet concluded and you have sent v2. This
is not going to help merge this patch.

Since you don't know why AER is happening, you should wait for a response from
the Intel/Thunderbolt folks who know more about the hardware.

- Mani

> ---
>  drivers/pci/pcie/aer.c     | 3 +++
>  drivers/pci/pcie/portdrv.c | 2 +-
>  drivers/pci/quirks.c       | 9 +++++++++
>  include/linux/pci.h        | 1 +
>  4 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index e0bcaa896803..45604564ce6f 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -389,6 +389,9 @@ void pci_aer_init(struct pci_dev *dev)
>  {
>  	int n;
>  
> +	if (dev->no_aer)
> +		return;
> +
>  	dev->aer_cap = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ERR);
>  	if (!dev->aer_cap)
>  		return;
> diff --git a/drivers/pci/pcie/portdrv.c b/drivers/pci/pcie/portdrv.c
> index 38a41ccf79b9..ab904a224296 100644
> --- a/drivers/pci/pcie/portdrv.c
> +++ b/drivers/pci/pcie/portdrv.c
> @@ -240,7 +240,7 @@ static int get_port_device_capability(struct pci_dev *dev)
>  	if ((pci_pcie_type(dev) == PCI_EXP_TYPE_ROOT_PORT ||
>               pci_pcie_type(dev) == PCI_EXP_TYPE_RC_EC) &&
>  	    dev->aer_cap && pci_aer_available() &&
> -	    (pcie_ports_native || host->native_aer))
> +	    (pcie_ports_native || host->native_aer) && !dev->no_aer)
>  		services |= PCIE_PORT_SERVICE_AER;
>  #endif
>  
> diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> index b9c252aa6fe0..d36dd3f8bbf6 100644
> --- a/drivers/pci/quirks.c
> +++ b/drivers/pci/quirks.c
> @@ -6340,4 +6340,13 @@ static void pci_mask_replay_timer_timeout(struct pci_dev *pdev)
>  }
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9750, pci_mask_replay_timer_timeout);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9755, pci_mask_replay_timer_timeout);
> +
> +static void pci_disable_aer(struct pci_dev *pdev)
> +{
> +	pdev->no_aer = 1;
> +}
> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x15EA, pci_disable_aer);
> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x15EB, pci_disable_aer);
> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x15EC, pci_disable_aer);
> +
>  #endif
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 864775651c6f..f447f86c6bdf 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -440,6 +440,7 @@ struct pci_dev {
>  	unsigned int	multifunction:1;	/* Multi-function device */
>  
>  	unsigned int	is_busmaster:1;		/* Is busmaster */
> +	unsigned int	no_aer:1;		/* May not use AER */
>  	unsigned int	no_msi:1;		/* May not use MSI */
>  	unsigned int	no_64bit_msi:1;		/* May only use 32-bit MSIs */
>  	unsigned int	block_cfg_access:1;	/* Config space access blocked */
> -- 
> 2.43.0
> 
> 

-- 
மணிவண்ணன் சதாசிவம்

