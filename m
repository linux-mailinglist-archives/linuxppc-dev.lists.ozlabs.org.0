Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2EA62C476
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 17:31:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC7qF4BjBz3cdy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 03:31:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lchBLUmI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lchBLUmI;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC7kB4c2kz3f7Q
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 03:27:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0DBB61ED9;
	Wed, 16 Nov 2022 16:27:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DCEC433C1;
	Wed, 16 Nov 2022 16:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668616048;
	bh=r6evYLgCFK3vWA5BdOirS4iuO3KS6qHZMh2iJoUYxhg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=lchBLUmINWLXBZZsz2dj+jHnFDfSkQsj4e76xKJFbZdSH9hWx3HeMQjZAaeAvIIWZ
	 w/5RKX6PkoY9m75TXAkyzW36dFHpyKrwaSBlE9q5acW3K9OQjFnBWMqYCRk2W8WRDj
	 Rg97dpmiBt0BAnZ9N3WUfV9y/fAKY/sSiwS6SLK5vtNUgo9tgvZ8SyUzGVnYsvPxW8
	 48ihwzximGEEwJUlZZxdeqpUbsy0Szm1evRNcwkKFLaaGIrtf8iWpgwa86Lzg8RUVG
	 8vT9gDdtLOL7rhIwsOF9TxBOXaMRUu+YRt6IYtKzUJpPAkrl+a6qtBc2ZJsTcY+DOo
	 Td8hFPlIJALKA==
Date: Wed, 16 Nov 2022 10:27:26 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 31/39] Documentation: PCI: Add reference to PCI/MSI
 device driver APIs
Message-ID: <20221116162726.GA1116017@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221111122015.397739421@linutronix.de>
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

On Fri, Nov 11, 2022 at 02:55:04PM +0100, Thomas Gleixner wrote:
> From: Ahmed S. Darwish <darwi@linutronix.de>
> 
> All exported device-driver MSI APIs are now grouped in one place at
> drivers/pci/msi/api.c with comprehensive kernel-docs added.
> 
> Reference these kernel-docs in the official PCI/MSI howto.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  Documentation/PCI/msi-howto.rst |   10 ++++++++++
>  1 file changed, 10 insertions(+)
> ---
> --- a/Documentation/PCI/msi-howto.rst
> +++ b/Documentation/PCI/msi-howto.rst
> @@ -285,3 +285,13 @@ to bridges between the PCI root and the
>  It is also worth checking the device driver to see whether it supports MSIs.
>  For example, it may contain calls to pci_alloc_irq_vectors() with the
>  PCI_IRQ_MSI or PCI_IRQ_MSIX flags.
> +
> +
> +List of device drivers MSI(-X) APIs
> +===================================
> +
> +The PCI/MSI subystem has a dedicated C file for its exported device driver
> +APIs — `drivers/pci/msi/api.c`. The following functions are exported:
> +
> +.. kernel-doc:: drivers/pci/msi/api.c
> +   :export:
> 
