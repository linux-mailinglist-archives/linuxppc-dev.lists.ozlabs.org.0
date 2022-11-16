Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDEDF62C4B0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 17:36:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7wZ5QxCz3f7x
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:36:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Urqx4Sx2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Urqx4Sx2;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7qC4jGLz3fJV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 03:31:51 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 43215B81DE0;
	Wed, 16 Nov 2022 16:31:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F9BC433D7;
	Wed, 16 Nov 2022 16:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616308;
	bh=c2dGFGQmMW2gB2BJno36TKOH8N1LNl8BA42e1b1583s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Urqx4Sx2y6ausq1Rn2h6VkOvD255FnIz/7hpaGtRnK/GkCaZc7J2KQE1uahowu90y
	 x6zgeaqkjifqlzgOa+s/9Ro/XMCj+c60OuROzOkw0ipMQ5Jm6cQtmavrMNfgamkClT
	 CdHQGa5nNMHH5GQMPpJpLVaYLjPsNGEUXbEjqJM3Yq++ug4pim6YNt5RctzENyPC6n
	 QUK682mQ3rSJqmEdy3B8WIl9nT5h9LYJTnM9/xfw/Rh2psUf3pJbWiyj72M4puxlrz
	 0IJGc+asGHOcW40Rkn4RvFxYc+KFboPzNMeJtTjyDo4num4U31ij0Jr+HG8WOeNSDa
	 TKUQ8fu3mYxbA==
Date: Wed, 16 Nov 2022 10:31:46 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 35/39] PCI/MSI: Reject MSI-X early
Message-ID: <20221116163146.GA1116406@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122015.631728309@linutronix.de>
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 11, 2022 at 02:55:11PM +0100, Thomas Gleixner wrote:
> Similar to PCI multi-MSI reject MSI-X enablement when a irq domain is
> attached to the device which does not support MSI-X.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/msi.c |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -760,6 +760,10 @@ int __pci_enable_msix_range(struct pci_d
>  	if (WARN_ON_ONCE(dev->msix_enabled))
>  		return -EINVAL;
>  
> +	/* Check MSI-X early on irq domain enabled architectures */
> +	if (!pci_msi_domain_supports(dev, MSI_FLAG_PCI_MSIX, ALLOW_LEGACY))
> +		return -ENOTSUPP;
> +
>  	if (!pci_msi_supported(dev, nvec) || dev->current_state != PCI_D0)
>  		return -EINVAL;
>  
> 
