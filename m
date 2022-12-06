Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B79B644AE6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Dec 2022 19:10:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRT4C4gKGz3bby
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 05:10:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qJhJSixf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qJhJSixf;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRT3F4Pb8z2xFx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Dec 2022 05:10:01 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 798BA6182F;
	Tue,  6 Dec 2022 18:09:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A501CC433C1;
	Tue,  6 Dec 2022 18:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670350197;
	bh=opSBu2zzyIqLHG9zK6v0tzpsie4Ks4lyGVD5qH9u17M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=qJhJSixfltLB0oBCKJDghRSl7IVmh4HXcgQJGmWhGODjMUHawruvRWPCXBKtm6naZ
	 qC27p50XL4bkKUNiQIZOrmqqer/5Vt3PQhp7ehZfa7F2VeS4N2ululacIJ2tESCLI0
	 15O4ML+g6PGJPTAwfh4Zx3i3CxvaZyMYGFX0R2jlgEYVFAZqiCl2ZxIZyRvyQeXbD5
	 vk85Hpg/5UWJWSHvBZWOOjx6kPQqH9uXTwvpWRTShbrdsHjDiuGIZ7n/5n4QeXCkyZ
	 wz8z7KBqwQQdO/9ykDIXoKg5EYW2o5t3N6UDIoPuuJtT4XPMoegYkA/WNEwg2Tpr3e
	 Ju5MTnrhk3BIQ==
Date: Tue, 6 Dec 2022 12:09:56 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Serge Semin <fancer.lancer@gmail.com>
Subject: Re: [PATCH v3 3/9] NTB: Remove pci_aer_clear_nonfatal_status() call
Message-ID: <20221206180956.GA1361309@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220928110355.emf2nucmdmpb3vbu@mobilestation>
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
Cc: allenbh@gmail.com, sathyanarayanan.kuppuswamy@linux.intel.com, dave.jiang@intel.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, linux-pci@vger.kernel.org, jejb@linux.ibm.com, Zhuo Chen <chenzhuo.1@bytedance.com>, james.smart@broadcom.com, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, oohall@gmail.com, jdmason@kudzu.us, bhelgaas@google.com, dick.kennedy@broadcom.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 28, 2022 at 02:03:55PM +0300, Serge Semin wrote:
> On Wed, Sep 28, 2022 at 06:59:40PM +0800, Zhuo Chen wrote:
> > There is no need to clear error status during init code, so remove it.
> 
> Why do you think there isn't? Justify in more details.

Thanks for taking a look, Sergey!  I agree we should leave it or add
the rationale here.

> > Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
> > ---
> >  drivers/ntb/hw/idt/ntb_hw_idt.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/ntb/hw/idt/ntb_hw_idt.c b/drivers/ntb/hw/idt/ntb_hw_idt.c
> > index 0ed6f809ff2e..fed03217289d 100644
> > --- a/drivers/ntb/hw/idt/ntb_hw_idt.c
> > +++ b/drivers/ntb/hw/idt/ntb_hw_idt.c
> > @@ -2657,8 +2657,6 @@ static int idt_init_pci(struct idt_ntb_dev *ndev)
> >  	ret = pci_enable_pcie_error_reporting(pdev);
> >  	if (ret != 0)
> >  		dev_warn(&pdev->dev, "PCIe AER capability disabled\n");
> > -	else /* Cleanup nonfatal error status before getting to init */
> > -		pci_aer_clear_nonfatal_status(pdev);

I do think drivers should not need to clear errors; I think the PCI
core should be responsible for that.

And I think the core *does* do that in this path:

  pci_init_capabilities
    pci_aer_init
      pci_aer_clear_status
        pci_aer_raw_clear_status
          pci_write_config_dword(pdev, aer + PCI_ERR_COR_STATUS)
          pci_write_config_dword(pdev, aer + PCI_ERR_UNCOR_STATUS)

pci_aer_clear_nonfatal_status() clears only non-fatal uncorrectable
errors, while pci_aer_init() clears all correctable and all
uncorrectable errors, so the PCI core is already doing more than
idt_init_pci() does.

So I think this change is good because it removes some work from the
driver, but let me know if you think otherwise.

> >  
> >  	/* First enable the PCI device */
> >  	ret = pcim_enable_device(pdev);
> > -- 
> > 2.30.1 (Apple Git-130)
> > 
