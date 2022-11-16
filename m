Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4D262C3BA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 17:15:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7Sd0RWDz3f3l
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:15:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KVVezaQS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KVVezaQS;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7Rk6PYcz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 03:14:58 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 07A19B81DDE;
	Wed, 16 Nov 2022 16:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6597FC433C1;
	Wed, 16 Nov 2022 16:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668615293;
	bh=3jHYcM7FuEy5OUC4SwSTcV7zvFrD7SfjF+WS6WLSYEU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=KVVezaQSNPVYb6hCL4ff6+8gaVLjNQPJM+j7z7JCIaGpO+komsTUSuLi7AaGOzhwx
	 2rzkGF4vJTL4L7hBaRSzNaVbPIYhYPStj02V14xUHiisGRvUlK97HBEKE7M7Bww+0X
	 K2AiIEkcCTiXODDdyPz+Klh3LYdqOhQvDfsiQD12zd2yPyAmpfMrzUeYXtGZaIDhoy
	 vzKRttMPALCM9fC3pVepzYVkmusgvF4WHsoHiaKoujfx367H6rM2jc5t0gd8uaauiJ
	 krqJoKnB7FA/Id3APLTOCSgHib6+yUeAXjphnnV/0nn1YS28xUBriVTZGV1HdkLYZf
	 pGD5rJUG1OPSQ==
Date: Wed, 16 Nov 2022 10:14:52 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 13/39] PCI/MSI: Use msi_domain_info::bus_token
Message-ID: <20221116161452.GA1114659@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122014.352437595@linutronix.de>
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

On Fri, Nov 11, 2022 at 02:54:35PM +0100, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <darwi@linutronix.de>
> 
> Set the bus token in the msi_domain_info structure and let the core code
> handle the update.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/irqdomain.c |   11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> --- a/drivers/pci/msi/irqdomain.c
> +++ b/drivers/pci/msi/irqdomain.c
> @@ -162,8 +162,6 @@ struct irq_domain *pci_msi_create_irq_do
>  					     struct msi_domain_info *info,
>  					     struct irq_domain *parent)
>  {
> -	struct irq_domain *domain;
> -
>  	if (WARN_ON(info->flags & MSI_FLAG_LEVEL_CAPABLE))
>  		info->flags &= ~MSI_FLAG_LEVEL_CAPABLE;
>  
> @@ -178,13 +176,10 @@ struct irq_domain *pci_msi_create_irq_do
>  
>  	/* PCI-MSI is oneshot-safe */
>  	info->chip->flags |= IRQCHIP_ONESHOT_SAFE;
> +	/* Let the core update the bus token */
> +	info->bus_token = DOMAIN_BUS_PCI_MSI;
>  
> -	domain = msi_create_irq_domain(fwnode, info, parent);
> -	if (!domain)
> -		return NULL;
> -
> -	irq_domain_update_bus_token(domain, DOMAIN_BUS_PCI_MSI);
> -	return domain;
> +	return msi_create_irq_domain(fwnode, info, parent);
>  }
>  EXPORT_SYMBOL_GPL(pci_msi_create_irq_domain);
>  
> 
