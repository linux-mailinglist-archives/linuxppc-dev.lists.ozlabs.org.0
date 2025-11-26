Return-Path: <linuxppc-dev+bounces-14501-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D375C89DC0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Nov 2025 13:49:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dGfX25dGzz2xPy;
	Wed, 26 Nov 2025 23:49:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.242.62
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764161362;
	cv=none; b=lyPkiH3jXdsMQNYUeOb/Kf+zshIZ3vMYOipSn/DL/OTv14zJkj0XcrtdfNS8TJ+S5d7yfzhSX42sAj140LP5auSZr9lvcpEHYLZHTeb9f+dsXs/ooJ7GKNVjqUIhrb5uF6BvyGthnzBNk/0gkdyKrXXdS+K106n0+oXb1a+KlwjAJO3WlJVITLv4k0hbk3KS9cfdhBXwaIQ30zJGeEG7fjVyHhWTi6bC9egDarqTfJFek8fCJR1gLaKsQgj7KFpSIY7tlsM2kHZsgkqZC1RnNoQF+VCq/prBp0GZOwLYpEl+KurwKG5JRRAsBW4yuZ94fiCD/jV1caiOGiJObV9ojg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764161362; c=relaxed/relaxed;
	bh=94ggEaXZE/VQL9wDUjwfvffV610AoLLDYZQXDydsu1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FT1bQlEGUpgf1lPIXTNNbR/VZakLVNgueTOTgWE/OkrGUT3NOfxBiZjwY1jcS+sDRt29iahu4TlGKz5dKi13B2BFLAunrSUEv7M2540HPhj3ngJrhPmtYD8HXidrzx3bj9QwCBg/ynH/0vXM/gKVurdWUIjG1UoaqKwGEPmhfP4jtfLizimcZkTMbAtd3aUqmnvwLJ7sptDD9jilGGfDG5EeeriKyNZdJW4zswZX2sGeowYTOod+vSTBql0QgqRa7EwmlAMUT2e3iPwmA1AVE4VMhwVXwJHQDvlEy+afQJpWRscwB9C1xqCZPIXZTX+66PlCIk/eykHbfcbbhCbGmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout3.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout3.hostsharing.net (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dGfX12Fljz2xP8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Nov 2025 23:49:21 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id DD2972C02BBD;
	Wed, 26 Nov 2025 13:49:06 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 9F6761D658; Wed, 26 Nov 2025 13:49:06 +0100 (CET)
Date: Wed, 26 Nov 2025 13:49:06 +0100
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
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] PCI/PM: Reinstate clearing state_saved in legacy
 and !pm codepaths
Message-ID: <aSb3Qt6n55Fsl7IF@wunner.de>
References: <094f2aad64418710daf0940112abe5a0afdc6bce.1763483367.git.lukas@wunner.de>
 <20251125231846.GA2767905@bhelgaas>
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
In-Reply-To: <20251125231846.GA2767905@bhelgaas>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 25, 2025 at 05:18:46PM -0600, Bjorn Helgaas wrote:
> On Wed, Nov 19, 2025 at 09:50:01AM +0100, Lukas Wunner wrote:
> > But there are two corner cases where the PCI core neglects to clear the
> > flag before commencing the suspend sequence:
> > 
> > * If a driver has legacy PCI PM callbacks, pci_legacy_suspend() neglects
> >   to clear the flag.  The (stale) flag is subsequently queried by
> >   pci_legacy_suspend() itself and pci_legacy_suspend_late().
> > 
> > * If a device has no driver or its driver has no PCI PM callbacks,
> >   pci_pm_freeze() neglects to clear the flag.  The (stale) flag is
> >   subsequently queried by pci_pm_freeze_noirq().
> > 
> > The flag may be set prior to suspend if the device went through error
> > recovery:  Drivers commonly invoke pci_restore_state() + pci_save_state()
> > to restore Config Space after reset.
> 
> I guess the only point of pci_save_state() in this case is to set
> state_saved again so a future pci_restore_state() will work, right?
> 
> The actual state being *saved* is pointless, assuming pci_save_state()
> saves exactly the same data that pci_restore_state() restored.
> 
> And these are the pci_save_state() calls you removed with "treewide:
> Drop pci_save_state() after pci_restore_state()".  Too bad we have to
> document the behavior we're about to change, but that's what we need
> to do.  It's just a little clutter to keep in mind for this release.

Yes.  All of your comments above are correct.

> > The flag may also be set if drivers call pci_save_state() on probe to
> > allow for recovery from subsequent errors.
> > 
> > The result is that pci_legacy_suspend_late() and pci_pm_freeze_noirq()
> > don't call pci_save_state() and so the state that will be restored on
> > resume is the one recorded on last error recovery or on probe, not the one
> > that the device had on suspend.  If the two states happen to be identical,
> > there's no problem.
> 
> So IIUC the effect is that after this change and the "treewide"
> change,
> 
>   - If the driver uses legacy PM, the state restored on resume will be
>     the state from suspend instead of the state on probe.

Right.

> 
>   - For devices with no driver or a driver without PM, if the device
>     has already been runtime-suspended, we avoid a pointless
>     pci_save_state(), so it's an optimization and not logically
>     related to the legacy PM case.

It's slightly different:

  - For devices with no driver or a driver without PM, the state restored
    on "thaw" and "restore" will be the state from "freeze" instead of the
    state on probe.

So the same problem that we have for drivers using legacy PM, we also
have for devices with no driver or a driver without (modern) PM callbacks,
but only in the "freeze" codepath (for hibernation).

In the patch, I made the "pci_dev->state_saved = false" assignment
conditional on !pm_runtime_suspended() in the "freeze" codepath.
I didn't do the same in the legacy codepath because none of the
drivers using legacy PM callbacks seem to be using runtime PM.

The purpose of making it conditional on !pm_runtime_suspended()
is just that we'd otherwise call pci_save_state() twice:  Once in
pci_pm_runtime_suspend() and once more in pci_pm_freeze().
That would be pointless.

In the commit message, I provided a rationale for the conditionality,
but inadvertently caused confusion.

> I'm thinking of something like this for the merge commit and eventual
> pull request; please correct me if this isn't right:
> 
>   Restore the suspend config state, not the state from probe or error
>   recovery, for drivers using legacy PCI suspend.
> 
>   Avoid saving config state again for devices without driver PM if
>   their state was already saved by runtime suspend.

I'd suggest instead (feel free to wordsmith as you see fit):

  Restore the suspend config state, not the state from probe or error
  recovery, for drivers using legacy PCI suspend.   [ <- unmodified ]

  Same for devices with no driver or a driver without PM callbacks
  when the system is hibernated.                   [ <- replacement ]

Mentioning the runtime PM conditionality in the high-level changelog
is probably not worth it.

Was I able to clarify all questions?  Please ask again if not.

Also, in case the meaning of "freeze", "thaw", "restore" isn't clear,
here's the order of a hibernation sequence (suspend to disk):

  pci_pm_prepare()
  pci_pm_freeze()
  pci_pm_freeze_noirq()
  <system image is generated>
  pci_pm_thaw_noirq()
  pci_pm_thaw()
  pci_pm_complete()
  pci_pm_prepare()
  pci_pm_poweroff()
  pci_pm_poweroff_late()
  pci_pm_poweroff_noirq()
  <system is asleep, then restarted with boot kernel>
  pci_pm_prepare()
  pci_pm_freeze()
  pci_pm_freeze_noirq()
  <system image is restored, replacing the boot kernel>
  pci_pm_restore_noirq()
  pci_pm_restore()
  pci_pm_complete()

Note that "freeze" happens twice in the whole sequence.

Thanks,

Lukas

