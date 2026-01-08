Return-Path: <linuxppc-dev+bounces-15413-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40449D01F50
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 10:54:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dn0cD4nMwz2yG7;
	Thu, 08 Jan 2026 20:54:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767866060;
	cv=none; b=e0W2PQfJho5i10z0Tc7reUWtVM7swKqP3B3sW6j52apXpN6vqovLPWIOBX+FAWgtU7l52+5K1eVX7NtfeJcXWNvtq0mZvQSLOdGQHamQH+2yMPN2mYHJho3JA/ZimFsFFM+PGBHSUmjn83qk8UBSU2SEfywQMcH2wdZvJwuL1oVFPdkBreh1Qnhq4ansyRCxpDpzINTtTEnHDmrwXcMEDZm96ACbXFCWc4HvARd+NwbRb9qJ5n6vK2sOUNrVFQsWnLejVetaN3RwLmTS3KBpDQnTC3BToW9+HzzI+/K74PjltMgyQefA1HVcQIAV0TsCUmNGZadWFvWKAOxfBOkT9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767866060; c=relaxed/relaxed;
	bh=LGsHsV8KN+YUPeBcIMWzFSrULuonNAhFUkaLQtspEos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fgcRrMdlfafzjGM5bO43SxOzfU8wrdNHoCkMJfU7+f5PNefFEHDPxbBC6MrPvaB94ugYJUlNC82LQ5jGVL76AKWaqv0HZ5MkYPnpsWggVfkJpPoXCtWBZiPtzXplww1Jt3idrRn3nOFSmgumrZ6Ti+Gw0pGX2Aht9vEtoh6koBfrWTcr0mkhDlnWIlYgmT33IO//m9dm8LnRqRqLCXvBwci24aOZwW31DC/whOUX05QsbrdLEU7FmY3Z6yRtAtwoUkV1XJk75MkxjYLfONEIpLJ3HwqfICPpt9UjGqbG53AlOqSzgDSmmxYUUVf2iju1il5MuFDwi/fgwjBdKYHxRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ffnq/PRo; dkim-atps=neutral; spf=pass (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ffnq/PRo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.18; helo=mgamail.intel.com; envelope-from=mika.westerberg@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Thu, 08 Jan 2026 20:54:17 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dn0c93MP5z2y8c
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 20:54:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767866058; x=1799402058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=9nGfb2nb9qwAdK8ep4zjgYtfhP16TKJPZKiS1YSSzqM=;
  b=ffnq/PRovtUJHGmFu32atRh46rBbHP/xx9SJlIO/jZjY1O9LKrMcupq/
   2VjZ5e9bSkvLu+j3TwcN7ZbVmLREqyrrtx9JQcHAe4CYDxdtZ3WCg4WzQ
   hzrIMUrps4jmXcnZP+kvPHoDX6RF6J5geH7Ey39voH2pgGnxcU+MQUvm3
   66z/+NYJKTAJoo6YS/jbNFkITUS7ncl18x+BBdYpWKua+JBnDHwEIknpR
   y4WxmTZ0XddUo/X202SpfNcrtT+Y5AXmMWNpC2xHkITLYspjet6jZABba
   Uui8eqPEvxF/VOaEsVrOmEVWiFi0EzsglW/KOF1cs5fwcxZCCbYQErUaa
   A==;
X-CSE-ConnectionGUID: kN/pWJdUSW+TESw3D5Ux5A==
X-CSE-MsgGUID: PdX4zxlOThqgwzu+1dWlEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="69291045"
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="69291045"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 01:53:09 -0800
X-CSE-ConnectionGUID: e0n0ZgFpSO22RaTzTv9LXQ==
X-CSE-MsgGUID: 75/h7ctORO282RVyHWr1Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,210,1763452800"; 
   d="scan'208";a="233869142"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 08 Jan 2026 01:53:05 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id F11E398; Thu, 08 Jan 2026 10:53:03 +0100 (CET)
Date: Thu, 8 Jan 2026 10:53:03 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Lukas Wunner <lukas@wunner.de>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Feng Tang <feng.tang@linux.alibaba.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] PCI/portdev: Disable AER for Titan Ridge 4C 2018
Message-ID: <20260108095303.GQ2275908@black.igk.intel.com>
References: <20260108082509.3028-1-atharvatiwarilinuxdev@gmail.com>
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
In-Reply-To: <20260108082509.3028-1-atharvatiwarilinuxdev@gmail.com>
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 08, 2026 at 08:25:03AM +0000, Atharva Tiwari wrote:
> Disable AER for Intel Titan Ridge 4C 2018
> (used in T2 iMacs, where the warnings appear)
> that generate continuous pcieport warnings. such as:

Did you try the v6.19-rcX as Lukas suggested? What was the result?

I asked also to provide full dmesg and 'sudo lspci -vv' output but you did
not provide them. You also did not provide details of what device you
connect to this system.

It would be good to try to understand what is going on before we add any
quirks.

> pcieport 0000:00:1c.4: AER: Correctable error message received from 0000:07:00.0
> pcieport 0000:07:00.0: PCIe Bus Error: severity=Correctable, type=Data Link Layer, (Receiver ID)
> pcieport 0000:07:00.0:   device [8086:15ea] error status/mask=00000080/00002000
> pcieport 0000:07:00.0:    [ 7] BadDLLP
> 
> macOS also disables AER for Thunderbolt devices and controllers in their drivers.
> 
> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=220651
> Signed-off-by: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
> 
> ---
> Chnages since v3:
> - Fixed Grammer mistakes
> Changes since v2:
> - Transferred logic to arch/x86/pci/fixup.c to only target x86
> - Added DMI quirk to only target Apple Systems
> Changes since v1:
> - Transferred logic to drivers/pci/quicks.c
> ---
> ---
>  arch/x86/pci/fixup.c       | 12 ++++++++++++
>  drivers/pci/pcie/aer.c     |  3 +++
>  drivers/pci/pcie/portdrv.c |  2 +-
>  include/linux/pci.h        |  1 +
>  4 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/pci/fixup.c b/arch/x86/pci/fixup.c
> index 25076a5acd96..bd72f7cf5db9 100644
> --- a/arch/x86/pci/fixup.c
> +++ b/arch/x86/pci/fixup.c
> @@ -1081,3 +1081,15 @@ static void quirk_tuxeo_rp_d3(struct pci_dev *pdev)
>  }
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_AMD, 0x1502, quirk_tuxeo_rp_d3);
>  #endif /* CONFIG_SUSPEND */
> +
> +#ifdef CONFIG_PCIEAER
> +
> +static void quirk_disable_aer(struct pci_dev *pdev)
> +{
> +	if (dmi_match(DMI_SYS_VENDOR, "Apple"))
> +		pdev->no_aer = 1;
> +}
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x15EA, quirk_disable_aer);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x15EB, quirk_disable_aer);
> +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_INTEL, 0x15EC, quirk_disable_aer);

Use small letters in hex: 0x15ea etc.

> +#endif /* CONFIG_PCIEAER */
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

