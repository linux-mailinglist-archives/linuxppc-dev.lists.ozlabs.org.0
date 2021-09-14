Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B8C40B817
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 21:32:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8D4m503Tz305j
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 05:32:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G8Gg4WVR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=G8Gg4WVR; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8D471w7qz2yJ5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 05:31:35 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CC5F9600CD;
 Tue, 14 Sep 2021 19:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631647892;
 bh=rtU/2+qXzD9rMj/5qvRqlaMb6+rl/c8gaobcTM2RoZU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=G8Gg4WVRPmjz/9XSBLK2UBMDnzY6QRwAGHokL7EzKXilrV5MReMBdYVw5IBSPxY1n
 xxLcj4EzUmt25fOzHkVwsx+7+X/RRvY2oV1VEME0z8NaHUC4RA4J4ZQmjOWiw50bDE
 clnk6kXMMAvL2BGBSDBhdX93MRbE1m6BrgmR88IWe5O/hu3hi6HVXN/Nzk3jOXGNVO
 WXkJyh7g9WbbJ9gINjUHOG4ZrEa1mPTJDplhrksxuatqeM7MlwK8rl51xjRF6QWM11
 2soen3+AGB6udu99EmWBakOoUhwwg0Y35X1BP1PiPh5tR+gZZcBnNmfaCTN0oggdva
 C71x4iUVn6cYA==
Date: Tue, 14 Sep 2021 14:31:30 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Subject: Re: [PATCH 1/1] powerpc: Drop superfluous pci_dev_is_added() calls
Message-ID: <20210914193130.GA1447657@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210910141940.2598035-2-schnelle@linux.ibm.com>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 10, 2021 at 04:19:40PM +0200, Niklas Schnelle wrote:
> On powerpc, pci_dev_is_added() is called as part of SR-IOV fixups
> that are done under pcibios_add_device() which in turn is only called in
> pci_device_add() whih is called when a PCI device is scanned.
> 
> Now pci_dev_assign_added() is called in pci_bus_add_device() which is
> only called after scanning the device. Thus pci_dev_is_added() is always
> false and can be dropped.
> 
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

Reviewed-by: Bjorn Helgaas <bhelgaas@google.com>

This doesn't touch the PCI core, so maybe makes sense for you to take
it, Michael?  But let me know if you think otherwise.

Thanks a lot for cleaning this up, Niklas.

> ---
>  arch/powerpc/platforms/powernv/pci-sriov.c | 6 ------
>  arch/powerpc/platforms/pseries/setup.c     | 3 +--
>  2 files changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/pci-sriov.c b/arch/powerpc/platforms/powernv/pci-sriov.c
> index 28aac933a439..deddbb233fde 100644
> --- a/arch/powerpc/platforms/powernv/pci-sriov.c
> +++ b/arch/powerpc/platforms/powernv/pci-sriov.c
> @@ -9,9 +9,6 @@
>  
>  #include "pci.h"
>  
> -/* for pci_dev_is_added() */
> -#include "../../../../drivers/pci/pci.h"
> -
>  /*
>   * The majority of the complexity in supporting SR-IOV on PowerNV comes from
>   * the need to put the MMIO space for each VF into a separate PE. Internally
> @@ -228,9 +225,6 @@ static void pnv_pci_ioda_fixup_iov_resources(struct pci_dev *pdev)
>  
>  void pnv_pci_ioda_fixup_iov(struct pci_dev *pdev)
>  {
> -	if (WARN_ON(pci_dev_is_added(pdev)))
> -		return;
> -
>  	if (pdev->is_virtfn) {
>  		struct pnv_ioda_pe *pe = pnv_ioda_get_pe(pdev);
>  
> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
> index f79126f16258..2188054470c1 100644
> --- a/arch/powerpc/platforms/pseries/setup.c
> +++ b/arch/powerpc/platforms/pseries/setup.c
> @@ -74,7 +74,6 @@
>  #include <asm/hvconsole.h>
>  
>  #include "pseries.h"
> -#include "../../../../drivers/pci/pci.h"
>  
>  DEFINE_STATIC_KEY_FALSE(shared_processor);
>  EXPORT_SYMBOL(shared_processor);
> @@ -750,7 +749,7 @@ static void pseries_pci_fixup_iov_resources(struct pci_dev *pdev)
>  	const int *indexes;
>  	struct device_node *dn = pci_device_to_OF_node(pdev);
>  
> -	if (!pdev->is_physfn || pci_dev_is_added(pdev))
> +	if (!pdev->is_physfn)
>  		return;
>  	/*Firmware must support open sriov otherwise dont configure*/
>  	indexes = of_get_property(dn, "ibm,open-sriov-vf-bar-info", NULL);
> -- 
> 2.25.1
> 
