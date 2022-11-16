Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7FA62C3D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 17:17:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7Vc44hqz3f6s
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:17:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OKLQAXun;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OKLQAXun;
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7Sk0yxRz3f3h
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 03:15:50 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 8D325CE1BD1;
	Wed, 16 Nov 2022 16:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A606C433D6;
	Wed, 16 Nov 2022 16:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668615346;
	bh=sDJKa1fbG0u3Us3nL6jtxWazW2/yIEjiBXrsp/ZezNI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=OKLQAXunR0A8tOp3VcPtuOkm+Fb0sHJnqyryDeFuwlCNZXpvXInros6PSED8376eZ
	 IBexbk15bbBAN/CfADlMufcqkmkWw6VXAz9VYupLJ4TgYr2A5AD1mX2byD7cPqT1Vj
	 LGeKraHBrWKWwFbCgk94zdAjCm1WoA+1WwuEOlx7B1udWeFdG4VadEko0xYYydS2Eu
	 BNSE0qfMHIvhe7yuA1sQiBzZUjdvk3v3+q7EMfl1FWZBI1D1KDW16Gpg9AZNoePjCd
	 IUbfeGRLsFunbPknRv0RhY9W8ziRmH2o+xa7hahtABjosB43Dxe9cl9/XwAzh/xkT0
	 uGk0NsCdAk7WQ==
Date: Wed, 16 Nov 2022 10:15:45 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 17/39] PCI/MSI: Get rid of externs in msi.h
Message-ID: <20221116161545.GA1114836@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221111122014.582175082@linutronix.de>
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

On Fri, Nov 11, 2022 at 02:54:42PM +0100, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <darwi@linutronix.de>
> 
> Follow the style of <linux/pci.h>
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/msi/msi.h |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> --- a/drivers/pci/msi/msi.h
> +++ b/drivers/pci/msi/msi.h
> @@ -5,12 +5,12 @@
>  
>  #define msix_table_size(flags)	((flags & PCI_MSIX_FLAGS_QSIZE) + 1)
>  
> -extern int pci_msi_setup_msi_irqs(struct pci_dev *dev, int nvec, int type);
> -extern void pci_msi_teardown_msi_irqs(struct pci_dev *dev);
> +int pci_msi_setup_msi_irqs(struct pci_dev *dev, int nvec, int type);
> +void pci_msi_teardown_msi_irqs(struct pci_dev *dev);
>  
>  #ifdef CONFIG_PCI_MSI_ARCH_FALLBACKS
> -extern int pci_msi_legacy_setup_msi_irqs(struct pci_dev *dev, int nvec, int type);
> -extern void pci_msi_legacy_teardown_msi_irqs(struct pci_dev *dev);
> +int pci_msi_legacy_setup_msi_irqs(struct pci_dev *dev, int nvec, int type);
> +void pci_msi_legacy_teardown_msi_irqs(struct pci_dev *dev);
>  #else
>  static inline int pci_msi_legacy_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
>  {
> 
