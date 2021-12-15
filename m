Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2D5475FAB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 18:47:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDjPF4PYRz3c61
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 04:47:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=UkCoNkhq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=UkCoNkhq; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDjNc4CPbz30Bl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 04:46:39 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 21FF8618FF;
 Wed, 15 Dec 2021 17:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAC38C36AE0;
 Wed, 15 Dec 2021 17:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1639590395;
 bh=8eon80aBZeFq23Odf9TNhXLZ0kuufkyxyEQ2UyQvkqg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UkCoNkhqYhaWsFSTKJpb77W8nbK6xBhgXx04HDrtcU3wqKWjQXiGzgyhrmLZyIcpi
 MQjyZk+Z77/94x42VRHSfHDxYxwbhzyU1x8FRVQnYWLIzTIG39Is2wA6fDhqQ2fpqP
 n5B4SefG3RtkmGRq+Q9AMgbeRnK4rPW85FgQYoxs=
Date: Wed, 15 Dec 2021 18:46:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V4 09-01/35] PCI/MSI: Decouple MSI[-X] disable from
 pcim_release()
Message-ID: <Ybop+ZdUQSqGkOxe@kroah.com>
References: <20211210221642.869015045@linutronix.de>
 <20211210221813.740644351@linutronix.de> <87tuf9rdoj.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tuf9rdoj.ffs@tglx>
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
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Stuart Yoder <stuyoder@gmail.com>, Will Deacon <will@kernel.org>,
 Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Jassi Brar <jassisinghbrar@gmail.com>, Sinan Kaya <okaya@kernel.org>,
 iommu@lists.linux-foundation.org, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Jason Gunthorpe <jgg@nvidia.com>, linux-pci@vger.kernel.org,
 xen-devel@lists.xenproject.org, Kevin Tian <kevin.tian@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@kaod.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Megha Dey <megha.dey@intel.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Juergen Gross <jgross@suse.com>,
 Tero Kristo <kristo@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 LKML <linux-kernel@vger.kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Marc Zygnier <maz@kernel.org>, dmaengine@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 15, 2021 at 06:16:44PM +0100, Thomas Gleixner wrote:
> The MSI core will introduce runtime allocation of MSI related data. This
> data will be devres managed and has to be set up before enabling
> PCI/MSI[-X]. This would introduce an ordering issue vs. pcim_release().
> 
> The setup order is:
> 
>    pcim_enable_device()
> 	devres_alloc(pcim_release...);
> 	...
> 	pci_irq_alloc()
> 	  msi_setup_device_data()
> 	     devres_alloc(msi_device_data_release, ...)
> 
> and once the device is released these release functions are invoked in the
> opposite order:
> 
>     msi_device_data_release()
>     ...
>     pcim_release()
>        pci_disable_msi[x]()
> 
> which is obviously wrong, because pci_disable_msi[x]() requires the MSI
> data to be available to tear down the MSI[-X] interrupts.
> 
> Remove the MSI[-X] teardown from pcim_release() and add an explicit action
> to be installed on the attempt of enabling PCI/MSI[-X].
> 
> This allows the MSI core data allocation to be ordered correctly in a
> subsequent step.
> 
> Reported-by: Nishanth Menon <nm@ti.com>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
> V4: New patch


Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
