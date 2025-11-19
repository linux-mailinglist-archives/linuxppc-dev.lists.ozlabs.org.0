Return-Path: <linuxppc-dev+bounces-14343-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 407CAC6DDCF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 11:02:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBH8h24Qxz3bx1;
	Wed, 19 Nov 2025 21:02:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.78.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763546548;
	cv=none; b=ag5Lesovo50rCjfYA+QCaIkJWbso7iPcbGGXBKiycwse1zUcm/Pjh1IoHEnuYo/xO+PYssMcoACdTKERb0cO5ehigDThwaW9jrGdREM2KjuP2mP99YpDPm+Nm2kSzQzOiBipJXa/BbHHkmiP5AWD2w5YnsXBr5Z0OqENM3PT9hKAlOUH/8ioVU/8c9pbU/PytvYxrVzzMtxgbHSm8JEQJBS7wURmqZN38815ikUzwrRU65pniKs/ZwZmiOMz8JvSnGHElv8Fx7zu351V9d6tRiQ14KZh9MR+3HBxGMeSMF1dDheuCr8TMqc4kdFb9wC3L++E0/UFHT6TgtMSkcqX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763546548; c=relaxed/relaxed;
	bh=4ZDz7MRWz+GhYM97bB1IjCVo7vmzXOA1S1iAZz6UbiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=klgPXb7uz+esJQr/hMcwwHNJCMZXmqFzG2LKJ8UwOnJdvNaFSCgecPtI+M69f01N+yAA4qInHf4knWmyHS55q+1WopXe+NJ4fmmyWmgzSVTAQvaASRr5TwFv3TAhvixVrjxsVG6fvZhPtFUxhkD0+HmaVUOX3v7Oji2k7T0XTpzrAREPpzPxa5/YxDLLYMnR2A3p/daTaG703jCOnqgX+u+KEwKSH6OFru142JVSvx9iKnpIsFO/GNqV8mHQoT6ivuiqByFCkFJFrNhFiElWvdLlJ0XCi3jw2YSgliO/Q+pSYIMdEhcT6goRCljsjNK4/6nzSg/HCZ2J0MqWakbVaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBH8g2PQTz3brm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 21:02:26 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id B4DB920083D4;
	Wed, 19 Nov 2025 11:02:23 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id A7718D5EC; Wed, 19 Nov 2025 11:02:23 +0100 (CET)
Date: Wed, 19 Nov 2025 11:02:23 +0100
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
Message-ID: <aR2VrxHGAxwpWQxF@wunner.de>
References: <aRd7y8blTOn1XYFE@wunner.de>
 <20251114233927.GA2340588@bhelgaas>
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
In-Reply-To: <20251114233927.GA2340588@bhelgaas>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 14, 2025 at 05:39:27PM -0600, Bjorn Helgaas wrote:
> On Fri, Nov 14, 2025 at 07:58:19PM +0100, Lukas Wunner wrote:
> > On Thu, Nov 13, 2025 at 10:15:56AM -0600, Bjorn Helgaas wrote:
> > > It seems like there are two things going on here, and I'm not sure
> > > they're completely compatible:
> > > 
> > >   1) Driver calls pci_save_state() to take over device power
> > >      management and prevent the PCI core from doing it.
> > > 
> > >   2) Driver calls pci_save_state() to capture the device state it
> > >      wants to restore when recovering from an error.
> > > 
> > > Shouldn't a driver be able to do 2) without also getting 1)?
> > 
> > In general, it can:
> > 
> > A number of drivers already call pci_save_state() on probe to capture
> > the state for subsequent error recovery.  If the driver has modified
> > config space in its probe hook, then calling pci_save_state() continues
> > to make sense.  If the driver has *not* modified config space, then the
> > call becomes obsolete once this patch is accepted.
> 
> So I guess "state_saved == true" means "driver does its own power
> management and PCI core shouldn't do it", and drivers that want 2) but
> not 1) just need to set state_saved = false after they call
> pci_save_state()?
> 
> That makes sense in sort of a weird way that makes my head hurt every
> time I try to understand it.

I agree it defies common sense.  So I've just submitted a series
which adds the missing "state_saved = false" in the legacy suspend
and !pm codepaths:

https://lore.kernel.org/r/094f2aad64418710daf0940112abe5a0afdc6bce.1763483367.git.lukas@wunner.de/

After this patch, the flag is always cleared before commencing the
suspend sequence and hence there is no longer a need for drivers to
clear state_saved after they call pci_save_state().  They can just
call pci_save_state() if they've modified Config Space in their
probe hook and be done with it.

> After error recovery, those drivers will see the state the driver
> identified when it called pci_save_state().  But after resume, they
> will see the state the PCI core saved at suspend time.  Right?

Correct.  The expectation is generally that they're identical.

E.g. I've just double-checked that we're enabling wakeup *after*
pci_save_state() in pci_pm_suspend_noirq().  So when the saved
state is restored on resume and later re-used for error recovery,
we're restoring the device with wakeup disabled, which is the
right thing to do because the device is in D0 after error recovery
issues a reset.

(pci_pm_suspend_noirq() first calls pci_save_state() and then calls
pci_prepare_to_sleep(), which enables wakeup.)

Thanks,

Lukas

