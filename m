Return-Path: <linuxppc-dev+bounces-14132-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED264C53AC2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 18:27:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d69MR584wz2yvJ;
	Thu, 13 Nov 2025 04:27:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762968451;
	cv=none; b=ezt7GbttA6Gi17dfVwwY5kOAiMq91IIIBaEIAuxja71jJD8Z3OmQtSODNmoYU5Wher5M6pgOLpK0xd1VRQBMCOSdOJ9yGWn3hnRn40ZAzKlCmJTWd28zQtkzmoT0lp1pdUoUcgWyVx/3OY/w3RGhtTN3niZMw22uboeeYevxXZ9O9kjJJZUgVSf6OsXPb0/22LCrQDXp/oSRg0u46XcECbE9n0omWVUc7GZmfdA8FnqTuPtiXQLVNpy0gc7vnJdG6u9KQKg6hNFLh1fYvUPLq20ol7+0unGSUwNwArmD/M8NjBYS28i5dmler7V9NdsFOoa+TItVNNglfJcals4xRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762968451; c=relaxed/relaxed;
	bh=/MHu+4AB43Bk0NhBtlWelD/MARvV3HFZd2TK5ME+pp8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YabhxaT6a4vLFUHkKcGgOuv+6qhaAKTtRzQ2j5KXU5kgUAC7FSaz+GYPWBXN2O8PBSrXTF/zFHPBHAHGQ3j1ElVHrXGKTOvInXdG6OKtZe6pxXWmcgeWdwKKj40cbnYLottWozFCs2fe/KcHEOpVUlIhCsSnZyzNGjx9FgBsDH8CSYf9Kw8sTYvILTRCWUOeiMPlDV/KqGAgEbc82ZOQqalTeOM4g7l9rz9o/1NktBHX6ujj/6ZHVGR27gW5jCE4orc51KXFWUJcgFXChYiqQdeMxIPnu/TENBcb5o6aN2Un9NFhN206bor1en1CvtjIULoG0NuV//plfvVdtDsqMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J2e9xUty; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J2e9xUty;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d69MQ4W17z2yFT
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 04:27:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7176A601D0;
	Wed, 12 Nov 2025 17:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CAD1C19424;
	Wed, 12 Nov 2025 17:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762968447;
	bh=7qJu6hxk6QNjW6m7PnkDRSFXCijC1JmS6gfHLufAYyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J2e9xUty5WyHXfj+KhPSJEF8UeixC7K4OO+ydfOeq0s6rVjC/o2M7+WvW2sv00byK
	 ghoXIaNf8XRhCXwVEObGQvM/+TurALvw3OW2q4s9QEjCmlxpyh1BRMku30qd4JFUE7
	 3X87kf67iXbG8osZYowne/siQAz+U9YmDANEkGH6o9mYgjAIdicAIZk3xwmajCMIAy
	 Z934/pxNKmfJwZe/sgA1NGkAtI1iKk8MBmV55UxLZFwFg2SP9cvyHg6lS6S5YERRHb
	 2RP5IaPbA0EWpn1fwhdDXC6hGLRQoVfKGwGUjGW7oRR3UvxcFpS6ezyIrOCj0idbvV
	 pDFNEZ9Fr4nQA==
Date: Wed, 12 Nov 2025 22:57:07 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, Christian Zigotzky <chzigotzky@xenosoft.de>, 
	mad skateman <madskateman@gmail.com>, "R . T . Dickinson" <rtd2@xtra.co.nz>, 
	Darren Stevens <darren@stevens-zone.net>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Lukas Wunner <lukas@wunner.de>, luigi burdo <intermediadc@hotmail.com>, Al <al@datazap.net>, 
	Roland <rol7and@gmx.com>, Hongxing Zhu <hongxing.zhu@nxp.com>, hypexed@yahoo.com.au, 
	linuxppc-dev@lists.ozlabs.org, debian-powerpc@lists.debian.org, linux-kernel@vger.kernel.org, 
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v2 2/4] PCI/ASPM: Add pcie_aspm_remove_cap() to override
 advertised link states
Message-ID: <xkrehb72sk7x5iyxbkvydu356hgo5t2xr3asnwiddvhtz5eqam@jlzd6gwg256n>
References: <20251110222929.2140564-1-helgaas@kernel.org>
 <20251110222929.2140564-3-helgaas@kernel.org>
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
In-Reply-To: <20251110222929.2140564-3-helgaas@kernel.org>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Nov 10, 2025 at 04:22:26PM -0600, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> Add pcie_aspm_remove_cap().  A quirk can use this to prevent use of ASPM
> L0s or L1 link states, even if the device advertised support for them.
> 
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/pci.h       |  2 ++
>  drivers/pci/pcie/aspm.c | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 4492b809094b..36f8c0985430 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -958,6 +958,7 @@ void pci_save_aspm_l1ss_state(struct pci_dev *dev);
>  void pci_restore_aspm_l1ss_state(struct pci_dev *dev);
>  
>  #ifdef CONFIG_PCIEASPM
> +void pcie_aspm_remove_cap(struct pci_dev *pdev, u32 lnkcap);
>  void pcie_aspm_init_link_state(struct pci_dev *pdev);
>  void pcie_aspm_exit_link_state(struct pci_dev *pdev);
>  void pcie_aspm_pm_state_change(struct pci_dev *pdev, bool locked);
> @@ -965,6 +966,7 @@ void pcie_aspm_powersave_config_link(struct pci_dev *pdev);
>  void pci_configure_ltr(struct pci_dev *pdev);
>  void pci_bridge_reconfigure_ltr(struct pci_dev *pdev);
>  #else
> +static inline void pcie_aspm_remove_cap(struct pci_dev *pdev, u32 lnkcap) { }
>  static inline void pcie_aspm_init_link_state(struct pci_dev *pdev) { }
>  static inline void pcie_aspm_exit_link_state(struct pci_dev *pdev) { }
>  static inline void pcie_aspm_pm_state_change(struct pci_dev *pdev, bool locked) { }
> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
> index 15d50c089070..bc3cb8bc7018 100644
> --- a/drivers/pci/pcie/aspm.c
> +++ b/drivers/pci/pcie/aspm.c
> @@ -1542,6 +1542,19 @@ int pci_enable_link_state_locked(struct pci_dev *pdev, int state)
>  }
>  EXPORT_SYMBOL(pci_enable_link_state_locked);
>  
> +void pcie_aspm_remove_cap(struct pci_dev *pdev, u32 lnkcap)
> +{
> +	if (lnkcap & PCI_EXP_LNKCAP_ASPM_L0S)
> +		pdev->aspm_l0s_support = 0;
> +	if (lnkcap & PCI_EXP_LNKCAP_ASPM_L1)
> +		pdev->aspm_l1_support = 0;
> +
> +	pci_info(pdev, "ASPM:%s%s removed from Link Capabilities to avoid device defect\n",
> +		 lnkcap & PCI_EXP_LNKCAP_ASPM_L0S ? " L0s" : "",
> +		 lnkcap & PCI_EXP_LNKCAP_ASPM_L1 ? " L1" : "");

I think this gives a false impression that the ASPM CAPs are being removed from
the LnkCap register. This function is just removing it from the internal cache
and the LnkCap register is left unchanged.

IMO, either we need to disable relevant CAPs in LnkCap register also or change
the log in this and quirks patches.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

