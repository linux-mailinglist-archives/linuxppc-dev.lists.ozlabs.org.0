Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 042A562C3BE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 17:16:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7Tc5pWZz3f5J
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:16:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fvHJksod;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fvHJksod;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7S54DtHz3dvY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 03:15:17 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BA68C61EB3;
	Wed, 16 Nov 2022 16:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7FF5C433C1;
	Wed, 16 Nov 2022 16:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668615314;
	bh=jVuqpvEFC7W6prrFUac475QeeZYTTYxuYTZUcm0S4nk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=fvHJksodCE+BmfIH4iURixL0h+Qx5bHlH1u2A1T39qpe+ZRm0gW3u9NiL/PoneJHF
	 gBs6qQXnXxNhzk3JCdlSqhJzAeyZXOqDlCIk5tfGzK5J6NfxYqqGsIzhddwZKPhrl5
	 57OynNzSRecGFG2yBpWFUSfl5gJ+5eHVpQzQxC4w0mTIsuwDxjeAvrYGBypV6CylQs
	 lPnDcFmAtgaAtuZ+n4h264NFBubzIca30hLaOzvYoIZxKbiMpOCHnPv/AcUdqIdEnI
	 +i4S8ooMu4HgWl9ykepn/RqU1Nv5fwTeen8jc7KMRbnLel08Q1WvND13agJcsVDK5r
	 sJTVHFkI3A8KQ==
Date: Wed, 16 Nov 2022 10:15:12 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 14/39] PCI/MSI: Let the MSI core free descriptors
Message-ID: <20221116161512.GA1114737@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122014.409654736@linutronix.de>
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

On Fri, Nov 11, 2022 at 02:54:37PM +0100, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <darwi@linutronix.de>
> 
> Let the core do the freeing of descriptors and just keep it around for the
> legacy case.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/irqdomain.c |   10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> --- a/drivers/pci/msi/irqdomain.c
> +++ b/drivers/pci/msi/irqdomain.c
> @@ -24,11 +24,12 @@ void pci_msi_teardown_msi_irqs(struct pc
>  	struct irq_domain *domain;
>  
>  	domain = dev_get_msi_domain(&dev->dev);
> -	if (domain && irq_domain_is_hierarchy(domain))
> +	if (domain && irq_domain_is_hierarchy(domain)) {
>  		msi_domain_free_irqs_descs_locked(domain, &dev->dev);
> -	else
> +	} else {
>  		pci_msi_legacy_teardown_msi_irqs(dev);
> -	msi_free_msi_descs(&dev->dev);
> +		msi_free_msi_descs(&dev->dev);
> +	}
>  }
>  
>  /**
> @@ -170,6 +171,9 @@ struct irq_domain *pci_msi_create_irq_do
>  	if (info->flags & MSI_FLAG_USE_DEF_CHIP_OPS)
>  		pci_msi_domain_update_chip_ops(info);
>  
> +	/* Let the core code free MSI descriptors when freeing interrupts */
> +	info->flags |= MSI_FLAG_FREE_MSI_DESCS;
> +
>  	info->flags |= MSI_FLAG_ACTIVATE_EARLY | MSI_FLAG_DEV_SYSFS;
>  	if (IS_ENABLED(CONFIG_GENERIC_IRQ_RESERVATION_MODE))
>  		info->flags |= MSI_FLAG_MUST_REACTIVATE;
> 
