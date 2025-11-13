Return-Path: <linuxppc-dev+bounces-14148-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39165C56A25
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Nov 2025 10:38:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d6ZvY0SWPz2yvb;
	Thu, 13 Nov 2025 20:38:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.242.62
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763026696;
	cv=none; b=YxpfjFKLVwTpQ+Wy31Jw7RW+B8qFwm5o+27xZfa2Gcfo/44Q33eo8RLHo7wWkHVQgtij/oeA3jEkLA7GtBszwdLZEFrAmJ/GM++K+GJRRoj0F/rc3xI0XxpYCwFC8qnRFun99JbxCaDKtyK9DelIdgg+LAMLv+Ds8MS4k8ycNCBNt3a3ZTs/DivjkeXXZP7sGG0HH9J8EzFz88Dxy2dnqG/yNfWIcRxOrpPrQ/RKPpP+93+ZsHRlfU0D1dV4OUEkEQ/nSVAfvgB54t8/1JTI/dCT3QIrKhZI8Kwd4jBWbonnQUVraaJMclCHAw2TCrmCgGPP7Jcr2Kzt6y9WYwzxfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763026696; c=relaxed/relaxed;
	bh=tXuItvXgERirCiLWAwQEeGMq3Gov8mLEWwB3mr34SNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQH6XPv2FzQqZrTbnB48YYZHIkEcXF1A3EXMUbgWI/+xN57PpYLz6uuQQRy12PDyNEToEWKFXfhmOHeDmyaPY0Z4P/xE3dawMLu9L/EH0ht0WXtvxXCHgBHZ32DAgvYcc/hNf7Tl45e9JpkXPsL+mEJn1u9NjXsnxUzbGwDj4gNGL84TjPEJ99rtReNtdfJLux4QZaaAf5OQAGhRDk1LUZxQqlLQbHowiQqcMf1nXjbcsi4L5TsIqzOJGwMJhyrxBFPXDU+h9Y5mKkiXvATonfccrfVbuK+34T1jnOVWmqQr6/pPqBRqt8uVKrrUHoR0NG3vTER1Bt/MDBGN8U1KvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout3.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout3.hostsharing.net (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d6ZvW6Tzmz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 20:38:13 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id B6DD32C02BAE;
	Thu, 13 Nov 2025 10:38:09 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 9BB47192C; Thu, 13 Nov 2025 10:38:09 +0100 (CET)
Date: Thu, 13 Nov 2025 10:38:09 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Bjorn Helgaas <helgaas@kernel.org>
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
Message-ID: <aRWnAd-PZuHMqBwd@wunner.de>
References: <070a03221dbec25f478d36d7bc76e0da81985c5d.1760274044.git.lukas@wunner.de>
 <20251112223831.GA2245026@bhelgaas>
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
In-Reply-To: <20251112223831.GA2245026@bhelgaas>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 12, 2025 at 04:38:31PM -0600, Bjorn Helgaas wrote:
> On Sun, Oct 12, 2025 at 03:25:01PM +0200, Lukas Wunner wrote:
> > Despite these workarounds, recoverability at all times is not guaranteed:
> > E.g. when a PCIe port goes through a runtime suspend and resume cycle,
> > the "saved_state" flag is cleared by:
> > 
> >   pci_pm_runtime_resume()
> >     pci_pm_default_resume_early()
> >       pci_restore_state()
> > 
> > ... and hence on a subsequent AER event, the port's Config Space cannot be
> > restored.  
> 
> I guess this restore would be done by a driver's
> pci_error_handlers.slot_reset() or .reset_done() calling
> pci_restore_state()?

Yes.  Restoration of config space after an error-recovery-induced reset
is currently always the job of the device driver.

E.g. in the case of portdrv, it happens in pcie_portdrv_slot_reset().

We could revisit this design decision and change the behavior to have
pcie_do_recovery() call pci_restore_state(), thus reducing boilerplate
in the drivers.  But that would be a separate effort, orthogonal to the
present patch.

> > +++ b/drivers/pci/bus.c
> > @@ -358,6 +358,13 @@ void pci_bus_add_device(struct pci_dev *dev)
> >  	pci_bridge_d3_update(dev);
> >  
> >  	/*
> > +	 * Save config space for error recoverability.  Clear state_saved
> > +	 * to detect whether drivers invoked pci_save_state() on suspend.
> 
> Can we expand this a little to explain how this is detected and what
> drivers *should* be doing?

That is documented in Documentation/power/pci.rst, "3.1.2. suspend()":

   "This callback is expected to quiesce the device and prepare it to be
    put into a low-power state by the PCI subsystem.  It is not required
    (in fact it even is not recommended) that a PCI driver's suspend()
    callback save the standard configuration registers of the device [...]

    However, in some rare case it is convenient to carry out these
    operations in a PCI driver.  Then, pci_save_state() [...] should be
    used to save the device's standard configuration registers [...].
    Moreover, if the driver calls pci_save_state(), the PCI subsystem will
    not execute either pci_prepare_to_sleep(), or pci_set_power_state()
    for its device, so the driver is then responsible for handling the
    device as appropriate."

> I think the reason is that the PCI core
> can invoke pci_save_state() on suspend if the driver did not.

Right.  By calling pci_save_state(), a driver signals to the PCI core
that it assumes responsibility for putting the device into a low power
state.  If a driver wants to keep a device in D0, it could call
pci_save_state() and thus prevent the PCI core from putting it e.g.
into D3.

> I assume:
> 
>   - PCI core always calls pci_save_state() and clears state_saved when
>     device is enumerated (below)
> 
>   - When it has configured the device to the state it wants restore,
>     the driver may call pci_save_state() again, which will set
>     state_saved
> 
>   - If driver has not called pci_save_state(), i.e., state_saved is
>     still clear, we want the PCI core to call pci_save_state() during
>     suspend

Right.

> This sounds sensible to me.  It would be nice if there were a few more
> words about pci_save_state() and pci_restore_state() in
> Documentation/.
> 
> pci_save_state() isn't mentioned at all in Documentation/PCI

Right, it's documented in the Documentation/power directory. :)

The "state_saved" flag in struct pci_dev is an internal flag used by
the PCI core to keep track of whether a driver called pci_save_state()
on suspend.

The logic to update the flag is not modified by the patch, deliberately so
to avoid any breakage.  The flag is currently initialized to false in
pci_device_add() (even though it already is false due to kzalloc() zeroing
the memory).  I'm now later calling pci_save_state() in pci_bus_add_device(),
which sets the flag to true.  To preserve the existing logic, I am resetting
the flag to false again.

The only change made by the patch is to not invalidate the saved state
upon pci_restore_state() and thus allow re-using it for error recovery.
The patch seeks to avoid changing the behavior of suspend/resume.
I wanted to keep this minimal, non-intrusive and as low risk as possible.

Thanks,

Lukas

