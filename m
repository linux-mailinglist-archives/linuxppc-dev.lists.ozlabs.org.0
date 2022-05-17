Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5923252AE28
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 00:29:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2rQN3SsZz3cNb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 08:29:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IyMMjg5h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=IyMMjg5h; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2rPj4mXcz3cG7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 08:28:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2A27CB81D0D;
 Tue, 17 May 2022 22:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C17C385B8;
 Tue, 17 May 2022 22:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652826532;
 bh=qVAlvmeQlhu1YZJFufPFz1VtxpX4m7jT2Rh3w53ctKU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=IyMMjg5hPEBP2Jmo+GjF51uM92OIvbH6Q3C8C91C6uQuRiuebTZ7WiIBZBKVYyvfg
 U5SlB1hNbffYdgVFgO9Yue4sAiylnTd7T6fNGfB/d2iKwGusrRmgQ9NkimEJHp9R5X
 lOjX7AoREotjGFTZEsOwnN05E0m6U+IDEsNJ7uYnY/2mIW9P3z1zhEeZ/7fibNHqK/
 CHVrNKMenpSFpUJJBntAoRyu/wZRowkRJJxf1gBDutpnsMRu48g0DZpqxlSp8jnWSw
 IHVrJJaASVQMd5itvpL+8DNI2gVI6VGyQ869CXfl1mrRuyBZGBFfiVxUD9x/TYoVZ8
 67L+/jmOqpDCg==
Date: Tue, 17 May 2022 17:28:49 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v3] PCI/AER: Handle Multi UnCorrectable/Correctable
 errors properly
Message-ID: <20220517222849.GA1113887@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54ab824c-44a9-239a-9380-2f051f26a079@linux.intel.com>
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Oliver OHalloran <oohall@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 11, 2022 at 05:29:45PM -0700, Sathyanarayanan Kuppuswamy wrote:
> 
> 
> On 5/11/22 4:40 PM, Bjorn Helgaas wrote:
> > On Mon, Apr 18, 2022 at 03:02:37PM +0000, Kuppuswamy Sathyanarayanan wrote:
> > > Currently the aer_irq() handler returns IRQ_NONE for cases without bits
> > > PCI_ERR_ROOT_UNCOR_RCV or PCI_ERR_ROOT_COR_RCV are set. But this
> > > assumption is incorrect.
> > > 
> > > Consider a scenario where aer_irq() is triggered for a correctable
> > > error, and while we process the error and before we clear the error
> > > status in "Root Error Status" register, if the same kind of error
> > > is triggered again, since aer_irq() only clears events it saw, the
> > > multi-bit error is left in tact. This will cause the interrupt to fire
> > > again, resulting in entering aer_irq() with just the multi-bit error
> > > logged in the "Root Error Status" register.
> > > 
> > > Repeated AER recovery test has revealed this condition does happen
> > > and this prevents any new interrupt from being triggered. Allow to
> > > process interrupt even if only multi-correctable (BIT 1) or
> > > multi-uncorrectable bit (BIT 3) is set.
> > > 
> > > Also note that, for cases with only multi-bit error is set, since this
> > > is not the first occurrence of the error, PCI_ERR_ROOT_ERR_SRC may have
> > > zero or some junk value. So we cannot cleanly process this error
> > > information using aer_isr_one_error(). All we are attempting with this
> > > fix is to make sure error interrupt processing can continue in this
> > > scenario.
> > > 
> > > This error can be reproduced by making following changes to the
> > > aer_irq() function and by executing the given test commands.
> > > 
> > >   static irqreturn_t aer_irq(int irq, void *context)
> > >           struct aer_err_source e_src = {};
> > > 
> > >           pci_read_config_dword(rp, aer + PCI_ERR_ROOT_STATUS,
> > > 				&e_src.status);
> > >   +       pci_dbg(pdev->port, "Root Error Status: %04x\n",
> > >   +		e_src.status);
> > >           if (!(e_src.status & AER_ERR_STATUS_MASK))
> > 
> > Do you mean
> > 
> >    if (!(e_src.status & (PCI_ERR_ROOT_UNCOR_RCV|PCI_ERR_ROOT_COR_RCV)))
> > 
> > here?  AER_ERR_STATUS_MASK would be after this fix.
> 
> Yes. You are correct. Do you want me to update it and Fixes tag
> and send next version?

I moved the repro details to a bugzilla, updated the commit log as
below, and applied to pci/error for v5.19, thanks!


commit 203926da2bff ("PCI/AER: Clear MULTI_ERR_COR/UNCOR_RCV bits")
Author: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Date:   Mon Apr 18 15:02:37 2022 +0000

    PCI/AER: Clear MULTI_ERR_COR/UNCOR_RCV bits
    
    When a Root Port or Root Complex Event Collector receives an error Message
    e.g., ERR_COR, it sets PCI_ERR_ROOT_COR_RCV in the Root Error Status
    register and logs the Requester ID in the Error Source Identification
    register.  If it receives a second ERR_COR Message before software clears
    PCI_ERR_ROOT_COR_RCV, hardware sets PCI_ERR_ROOT_MULTI_COR_RCV and the
    Requester ID is lost.
    
    In the following scenario, PCI_ERR_ROOT_MULTI_COR_RCV was never cleared:
    
      - hardware receives ERR_COR message
      - hardware sets PCI_ERR_ROOT_COR_RCV
      - aer_irq() entered
      - aer_irq(): status = pci_read_config_dword(PCI_ERR_ROOT_STATUS)
      - aer_irq(): now status == PCI_ERR_ROOT_COR_RCV
      - hardware receives second ERR_COR message
      - hardware sets PCI_ERR_ROOT_MULTI_COR_RCV
      - aer_irq(): pci_write_config_dword(PCI_ERR_ROOT_STATUS, status)
      - PCI_ERR_ROOT_COR_RCV is cleared; PCI_ERR_ROOT_MULTI_COR_RCV is set
      - aer_irq() entered again
      - aer_irq(): status = pci_read_config_dword(PCI_ERR_ROOT_STATUS)
      - aer_irq(): now status == PCI_ERR_ROOT_MULTI_COR_RCV
      - aer_irq() exits because PCI_ERR_ROOT_COR_RCV not set
      - PCI_ERR_ROOT_MULTI_COR_RCV is still set
    
    The same problem occurred with ERR_NONFATAL/ERR_FATAL Messages and
    PCI_ERR_ROOT_UNCOR_RCV and PCI_ERR_ROOT_MULTI_UNCOR_RCV.
    
    Fix the problem by queueing an AER event and clearing the Root Error Status
    bits when any of these bits are set:
    
      PCI_ERR_ROOT_COR_RCV
      PCI_ERR_ROOT_UNCOR_RCV
      PCI_ERR_ROOT_MULTI_COR_RCV
      PCI_ERR_ROOT_MULTI_UNCOR_RCV
    
    See the bugzilla link for details from Eric about how to reproduce this
    problem.
    
    [bhelgaas: commit log, move repro details to bugzilla]
    Fixes: e167bfcaa4cd ("PCI: aerdrv: remove magical ROOT_ERR_STATUS_MASKS")
    Link: https://bugzilla.kernel.org/show_bug.cgi?id=215992
    Link: https://lore.kernel.org/r/20220418150237.1021519-1-sathyanarayanan.kuppuswamy@linux.intel.com
    Reported-by: Eric Badger <ebadger@purestorage.com>
    Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
    Reviewed-by: Ashok Raj <ashok.raj@intel.com>
