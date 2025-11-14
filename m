Return-Path: <linuxppc-dev+bounces-14190-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49772C5F9CD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Nov 2025 00:39:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7YWn0zWSz2yvv;
	Sat, 15 Nov 2025 10:39:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763163573;
	cv=none; b=GGKuhobbn67GhJrABr/gEwIje9Wb/I7Zfy2kPtRKDWp8H8vRK9/B6LSOGbAv/tqreCng/KoyQoGzsrI7XXbqjBWTF2f01+iv7OPXt5ZZyb2g6l700XtNbknT7Fv1BGZ6LV83QyyO1iHji1VDil+vG6g6qwVQ908KOB+NU5TZQhYvbY3X3EbUsbJCk7hjx1/sIIX8tbblczP38oQ6Ujb4lNY49x78f+1Z7sbYqHWiVtMAz/s1L4tjWaNl6rG4P4ILzA3FbSLwyaPvXgGXmTmcBX3PpbmVQCsXgBQmuzDvQoQZFPFEtV6i2M79jTfh8obVwPMLIhbn1rZ5srrB2iOlkg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763163573; c=relaxed/relaxed;
	bh=HCUKOH9WKMtxK4g/DWFGMyuwu9fSW5X748bvDlNNYww=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=S5XaFeGGZGG2s7rCJyIKlJgP9Iq9d2KNTQJHE4N47Lns4n6pg2UJe+hdRWhQZ16UHuCRjBssAZybiNklQzOjiBEE+tvpC0Y8hEfwT0fBTWw65hLX6B4aPkf0fcEU0ar0YkUMk4792Nn04XcELsHlDaN9dyw0K22uP1qrpIX1HBEkl0/VHB5U/GFfEvaUvHP9fkEzTkdareKjij1qZ2MRqoaSboVqGGuidEL+m5eKaC5zs9ALC6GDx5q2jcRY20sck3m2lZ5BqmNUVcdanJaHeUnc/GLGYmyYWexHSpbmT81fgCmFINlyUjikZQJb4KI3ZR8vxsU3TivjhV1dz0mHzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cp5gRDVc; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Cp5gRDVc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7YWm1Rm6z2xqk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Nov 2025 10:39:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AAD7F60180;
	Fri, 14 Nov 2025 23:39:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40C90C16AAE;
	Fri, 14 Nov 2025 23:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763163568;
	bh=mMZEYwBQECCPCFF8rmEdIOUMs8DDjVoCSWmS9oPZGwY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Cp5gRDVcjC3odfNuO0uHJbvv0x7lSokw9lbB3VBBnT4oX3LS/AlBEfKF3Gj+5ESrY
	 R7tPcaKBiCXYjqhifGtNAbUwEDcrTo16D5fzXyYonT6qlCTKNSwTZPpiv6vq1E5bkk
	 zjUEOjZCVkdNeAbrH3nCiZcNaG2h2jMBc7O+krrZivj5zeTyLrdFW1kWW/jXeldHer
	 aOfqCv21KD5NIGmiCAK+1+8rqNmAluym4f9WlQj1izWKzay1miKSXj6wwJHvItgjxO
	 368GpWGEeQSiwgFYVsBDE4IcWL/nspVEwAFYM3E8hnrBQ2JP3m/TriIUrwM/aqFQZ6
	 DdtBz42MCPAQw==
Date: Fri, 14 Nov 2025 17:39:27 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Riana Tauro <riana.tauro@intel.com>,
	"Sean C. Dardis" <sean.c.dardis@intel.com>,
	Farhan Ali <alifm@linux.ibm.com>,
	Benjamin Block <bblock@linux.ibm.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Alek Du <alek.du@intel.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, qat-linux@intel.com,
	Dave Jiang <dave.jiang@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH 1/2] PCI: Ensure error recoverability at all times
Message-ID: <20251114233927.GA2340588@bhelgaas>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRd7y8blTOn1XYFE@wunner.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 14, 2025 at 07:58:19PM +0100, Lukas Wunner wrote:
> On Thu, Nov 13, 2025 at 10:15:56AM -0600, Bjorn Helgaas wrote:
> > It seems like there are two things going on here, and I'm not sure
> > they're completely compatible:
> > 
> >   1) Driver calls pci_save_state() to take over device power
> >      management and prevent the PCI core from doing it.
> > 
> >   2) Driver calls pci_save_state() to capture the device state it
> >      wants to restore when recovering from an error.
> > 
> > Shouldn't a driver be able to do 2) without also getting 1)?
> 
> In general, it can:
> 
> A number of drivers already call pci_save_state() on probe to capture
> the state for subsequent error recovery.  If the driver has modified
> config space in its probe hook, then calling pci_save_state() continues
> to make sense.  If the driver has *not* modified config space, then the
> call becomes obsolete once this patch is accepted.

So I guess "state_saved == true" means "driver does its own power
management and PCI core shouldn't do it", and drivers that want 2) but
not 1) just need to set state_saved = false after they call
pci_save_state()?

That makes sense in sort of a weird way that makes my head hurt every
time I try to understand it.  I think it's the sequence of
"pci_save_state(); dev->state_saved = false" that seems
counter-intuitive: we just saved the state; why would we immediately
turn around and say we didn't?  Maybe "state_saved" isn't the most
appropriate name.

After error recovery, those drivers will see the state the driver
identified when it called pci_save_state().  But after resume, they
will see the state the PCI core saved at suspend time.  Right?

> The reason I'm using the "in general" qualifier:
> 
> I've identified two corner cases where the PCI core neglects to set
> state_saved = false before commencing the suspend sequence:
> 
> * If a driver has legacy PCI PM callbacks, pci_legacy_suspend() neglects
>   to set state_saved = false.  Yet both pci_legacy_suspend() and
>   pci_legacy_suspend_late() subsequently query the state_saved flag.

> * If a device is unbound or its driver has no PM callbacks
>   (driver->pm == NULL), pci_pm_freeze() neglects to set state_saved = false.
>   Yet pci_pm_freeze_noirq() subsequently queries the state_saved flag.
> 
> In these corner cases, pci_legacy_suspend() and pci_pm_freeze() depend
> on some other part of the PCI core to set state_saved = false.
> For a freshly enumerated device, the flag is initialized to false by
> kzalloc() and pci_device_add() also explicitly sets it to false for good
> measure.  On resume (or thaw or restore), the flag is set to false by
> pci_restore_state().  The latter is preserved as is by my patch and the
> former is moved to pci_bus_add_device() to retain the current behavior.
> 
> Clearly, the two corner cases should be fixed and then setting
> state_saved = false in pci_bus_add_device() becomes unnecessary.
> 
> I'd prefer doing that in a separate step though.
> 
> So drivers which use legacy PCI PM callbacks or have no PM callbacks
> should currently not call pci_save_state() on probe without manually
> setting state_saved = false afterwards.  If they neglect that, then
> pci_legacy_suspend_late() and pci_pm_freeze_noirq() will not call
> pci_save_state() on the next suspend cycle and so the state that
> will be restored on resume is the one recorded on probe, not the
> one that the device had on suspend.  If these two states happen
> to be identical, there's no problem.
> 
> > > > > +++ b/drivers/pci/bus.c
> > > > > @@ -358,6 +358,13 @@ void pci_bus_add_device(struct pci_dev *dev)
> > > > >  	pci_bridge_d3_update(dev);
> > > > >  
> > > > >  	/*
> > > > > +	 * Save config space for error recoverability.  Clear state_saved
> > > > > +	 * to detect whether drivers invoked pci_save_state() on suspen
> [...]
> > > > Can we expand this a little to explain how this is detected and what
> > > > drivers *should* be doing?
> [...]
> > Yes.  I should have proposed some text for the comment, e.g.,
> > 
> >   Save config space for error recoverability.  Clear state_saved.  If
> >   driver calls pci_save_state() again, state_saved will be set and
> >   we'll know that on suspend, the PCI core shouldn't call
> >   pci_save_state() or change the device power state.
> 
> I'm fine with rewording the code comment like this, as well as splitting
> the code comment as suggested by Rafael.  Would you prefer amending the
> code comment when applying or should I respin with a reworded comment?
> 
> Again, clearing state_saved in pci_bus_add_device() is just a temporary
> measure to retain the existing behavior.  It (and an accompanying code
> comment) can be dropped once pci_legacy_suspend() and pci_pm_freeze()
> are fixed.
> 
> > I'm just wishing for a more concrete mention of "pci_save_state()",
> > since that's where the critical "state_saved" flag is updated.
> > 
> > And I'm not sure Documentation/ includes anything about the idea of
> > a driver using pci_save_state() to capture the state it wants to
> > restore after an error.  I guess that's obvious now that I write it
> > down, but I'm sure learning a lot from this conversation :)
> 
> Okay, noted that the documentation could be improved.  I'd be glad
> if this could be postponed to a separate step as well though.
> I can only address problems one at a time. :)

Absolutely.  Would you mind posting an update with the tweaks above?
I'm not at all confident about doing it myself.

Bjorn

