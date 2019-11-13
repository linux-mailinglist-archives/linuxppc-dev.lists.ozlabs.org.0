Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C13FB2A7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 15:34:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CnDn3JbNzF52J
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 01:34:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="l5woY5f+"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Cn9w6vYszF6td
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 01:31:48 +1100 (AEDT)
Received: from localhost (173-25-83-245.client.mchsi.com [173.25.83.245])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3EB5E22466;
 Wed, 13 Nov 2019 14:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573655505;
 bh=tE8WXy9944L3yf6UfmB6Q/LfiN+2WIWDMBHg+6DQEuE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=l5woY5f+aBW0tqC5hgr0PC/dXIp9asNvrjjrSZ1/lXM/np6GDp/7gIPhqbuWjVYPh
 cVxpjqSXnytPnvYR3fDobPYsjHWnBR3cYHasRng3b8fEmH53f+h1YikpmILixs9w5h
 yDMDwrcD85gMEI+8Y6A6y+Pb6I06LJcPLuAWl8+M=
Date: Wed, 13 Nov 2019 08:31:43 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH] powerpc/powernv: Disable native PCIe port management
Message-ID: <20191113143143.GA54971@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191113094035.22394-1-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 13, 2019 at 08:40:35PM +1100, Oliver O'Halloran wrote:
> On PowerNV the PCIe topology is (currently) managed the powernv platform
> code in cooperation with firmware. The PCIe-native service drivers bypass
> both and this can cause problems.
> 
> Historically this hasn't been a big deal since the only port service
> driver that saw much use was the AER driver. The AER driver relies
> a kernel service to report when errors occur rather than acting autonmously
> so it's fairly easy to ignore. On PowerNV (and pseries) AER events are
> handled through EEH, which ignores the AER service, so it's never been
> an issue.
> 
> Unfortunately, the hotplug port service driver (pciehp) does act
> autonomously and conflicts with the platform specific hotplug
> driver (pnv_php). The main issue is that pciehp claims the interrupt
> associated with the PCIe capability which in turn prevents pnv_php from
> claiming it.
> 
> This results in hotplug events being handled by pciehp which does not
> notify firmware when the PCIe topology changes, and does not setup/teardown
> the arch specific PCI device structures (pci_dn) when the topology changes.
> The end result is that hot-added devices cannot be enabled and hot-removed
> devices may not be fully torn-down on removal.
> 
> We can fix these problems by setting the "pcie_ports_disabled" flag during
> platform initialisation. The flag indicates the platform owns the PCIe
> ports which stops the portbus driver being registered.
> 
> Cc: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
> Fixes: 66725152fb9f ("PCI/hotplug: PowerPC PowerNV PCI hotplug driver")
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
> Sergey, just FYI. I'll try sort out the rest of the hotplug
> trainwreck in 5.6.
> 
> The Fixes: here is for the patch that added pnv_php in 4.8. It's been
> a problem since then, but wasn't noticed until people started testing
> it after the EEH fixes in commit 799abe283e51 ("powerpc/eeh: Clean up
> EEH PEs after recovery finishes") went in earlier in the 5.4 cycle.
> ---
>  arch/powerpc/platforms/powernv/pci.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci.c b/arch/powerpc/platforms/powernv/pci.c
> index 2825d00..ae62583 100644
> --- a/arch/powerpc/platforms/powernv/pci.c
> +++ b/arch/powerpc/platforms/powernv/pci.c
> @@ -941,6 +941,23 @@ void __init pnv_pci_init(void)
>  
>  	pci_add_flags(PCI_CAN_SKIP_ISA_ALIGN);
>  
> +#ifdef CONFIG_PCIEPORTBUS
> +	/*
> +	 * On PowerNV PCIe devices are (currently) managed in cooperation
> +	 * with firmware. This isn't *strictly* required, but there's enough
> +	 * assumptions baked into both firmware and the platform code that
> +	 * it's unwise to allow the portbus services to be used.
> +	 *
> +	 * We need to fix this eventually, but for now set this flag to disable
> +	 * the portbus driver. The AER service isn't required since that AER
> +	 * events are handled via EEH. The pciehp hotplug driver can't work
> +	 * without kernel changes (and portbus binding breaks pnv_php). The
> +	 * other services also require some thinking about how we're going
> +	 * to integrate them.
> +	 */
> +	pcie_ports_disabled = true;
> +#endif

This is fine, but it feels like sort of a blunt instrument.  Is there
any practical way to clear pci_host_bridge.native_pcie_hotplug (and
native_aer if appropriate) for the PHBs in question?  That would also
prevent pciehp from binding.

We might someday pull portdrv into the PCI core directly instead of as
a separate driver, and I'm thinking that might be easier if we have
more specific indications of what the core shouldn't use.

>  	/* If we don't have OPAL, eg. in sim, just skip PCI probe */
>  	if (!firmware_has_feature(FW_FEATURE_OPAL))
>  		return;
> -- 
> 2.9.5
> 
