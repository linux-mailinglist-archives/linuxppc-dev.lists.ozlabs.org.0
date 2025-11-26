Return-Path: <linuxppc-dev+bounces-14506-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 686C9C8C60D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Nov 2025 00:46:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dGx5s5810z2yvN;
	Thu, 27 Nov 2025 10:46:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764200769;
	cv=none; b=Oy8XSL03EI7FkdI6tBEOyOnH2rJMfoVPTCd8FeHezKbhFTN8Oh1MaMOOG9SRv8lGXPp/ogP/RN6qxwSE8LWD1vOG+reZMdROFtYNd9IshtPZTbmbysELx0x16ANa3MLNTBbViBSBNc32DGAOV2USXkK72iITw0diRVFHuUN18+KCwTdgQukFYyhiTC74fpw0CTqrgUbme58Ygt8e7HSvz3Q9pDt6XDyqDIdT01LxNRMUhjOxkAR9u+HlBBfIlSg82v3DmMSMDVtlvgQzqm64S2AZJixYD8ZH7Hi8tMA8jh/Zg9NQMVoMG/P+tz4BFJjo6cVlY3KGcpfLBZ5SBfZn1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764200769; c=relaxed/relaxed;
	bh=p6wPe4YsznjwOGWvXFju/enSYyZOpaViRS9GRnAj2Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=oPDkWDolXTiH/TnnXftd4EaATTeelymyHfMNyjvtVw668KYG4S+LBCfkUYVFoDW02UowgwfRQDHW278Ty+1GzghnaRVeZA4cDPh1L7eiZCeCE+2XTeb9nErbjftRkowXa+WfXC6Ux5xh8Hnmi5jsNB/79sBJPf+5ex9wF+BMXabTObxu7xm5SMYMvbB9jlVqXJ0h3aXWWRuS2uvCPI8HmHCDzOVztlIdUDKLCdGv6PLeyUvsGI8pkbz1gDm+ygbxz5zvohL1cBUfqI3s2JTNvH6dinbWEeZlA16Pp7v1njgEi6tZ0eFd4QdfXxSqb79FhxxJgDo47brDhrYpZs7Teg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HWxIZAIv; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HWxIZAIv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dGx5r3DDfz2xP8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 10:46:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 87B1760177;
	Wed, 26 Nov 2025 23:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D66C4CEF7;
	Wed, 26 Nov 2025 23:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764200765;
	bh=jLSo+HaqFDdXCrl+AzMOfDRdPEoc0iJrUIlW7wVPTAo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=HWxIZAIv7DqHXVOIWKg0XqGmcA/cw760bg7EOuLUqfbnON0a2r98gNBTz0B1B3sFn
	 q+QdMqL+0xR4iLicVYTxUdNcPAu1wUanrVk71GPSJ7pA+W7jtR9864FPLJgddNXb6e
	 u8EHh9Oc2OcD97pAWdQ0EkLCIw3nC2bu7G3Cp9/h4H3RdDFeXNE9MkzGl/iIIGG4Hl
	 +9GiB82Jgps53tHtwrewVL3erFApaNs5llhDIafDhise/G4foSILF/dhxtvKrN2a18
	 gbvz3V2UGpy7ug9xF2IVn8xTsavKE+q0KSWomVXN0jjWmkcOk+0YWbcxz5NbXBpdFj
	 BKQfu2uhCgqiA==
Date: Wed, 26 Nov 2025 17:46:03 -0600
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
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 1/3] PCI/PM: Reinstate clearing state_saved in legacy
 and !pm codepaths
Message-ID: <20251126234603.GA2832326@bhelgaas>
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
In-Reply-To: <aSb3Qt6n55Fsl7IF@wunner.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 26, 2025 at 01:49:06PM +0100, Lukas Wunner wrote:
> On Tue, Nov 25, 2025 at 05:18:46PM -0600, Bjorn Helgaas wrote:
> > On Wed, Nov 19, 2025 at 09:50:01AM +0100, Lukas Wunner wrote:
> > > But there are two corner cases where the PCI core neglects to clear the
> > > flag before commencing the suspend sequence:
> > > 
> > > * If a driver has legacy PCI PM callbacks, pci_legacy_suspend() neglects
> > >   to clear the flag.  The (stale) flag is subsequently queried by
> > >   pci_legacy_suspend() itself and pci_legacy_suspend_late().
> > > 
> > > * If a device has no driver or its driver has no PCI PM callbacks,
> > >   pci_pm_freeze() neglects to clear the flag.  The (stale) flag is
> > >   subsequently queried by pci_pm_freeze_noirq().
> > > 
> > > The flag may be set prior to suspend if the device went through error
> > > recovery:  Drivers commonly invoke pci_restore_state() + pci_save_state()
> > > to restore Config Space after reset.
> > 
> > I guess the only point of pci_save_state() in this case is to set
> > state_saved again so a future pci_restore_state() will work, right?
> > 
> > The actual state being *saved* is pointless, assuming pci_save_state()
> > saves exactly the same data that pci_restore_state() restored.
> > 
> > And these are the pci_save_state() calls you removed with "treewide:
> > Drop pci_save_state() after pci_restore_state()".  Too bad we have to
> > document the behavior we're about to change, but that's what we need
> > to do.  It's just a little clutter to keep in mind for this release.
> 
> Yes.  All of your comments above are correct.
> 
> > > The flag may also be set if drivers call pci_save_state() on probe to
> > > allow for recovery from subsequent errors.
> > > 
> > > The result is that pci_legacy_suspend_late() and pci_pm_freeze_noirq()
> > > don't call pci_save_state() and so the state that will be restored on
> > > resume is the one recorded on last error recovery or on probe, not the one
> > > that the device had on suspend.  If the two states happen to be identical,
> > > there's no problem.
> > 
> > So IIUC the effect is that after this change and the "treewide"
> > change,
> > 
> >   - If the driver uses legacy PM, the state restored on resume will be
> >     the state from suspend instead of the state on probe.
> 
> Right.
> 
> >   - For devices with no driver or a driver without PM, if the device
> >     has already been runtime-suspended, we avoid a pointless
> >     pci_save_state(), so it's an optimization and not logically
> >     related to the legacy PM case.
> 
> It's slightly different:
> 
>   - For devices with no driver or a driver without PM, the state restored
>     on "thaw" and "restore" will be the state from "freeze" instead of the
>     state on probe.
> 
> So the same problem that we have for drivers using legacy PM, we also
> have for devices with no driver or a driver without (modern) PM callbacks,
> but only in the "freeze" codepath (for hibernation).
> 
> In the patch, I made the "pci_dev->state_saved = false" assignment
> conditional on !pm_runtime_suspended() in the "freeze" codepath.
> I didn't do the same in the legacy codepath because none of the
> drivers using legacy PM callbacks seem to be using runtime PM.

Maybe it's moot because we hope there will be no new users of PCI
legacy PM with runtime PM, but I don't think there's anything to
*prevent* that or to protect against out-of-tree drivers.

The implicit assumption that there are no such drivers makes it look
like there's something magic involving state_saved, legacy PM, and
runtime PM.  It might be worth doing the same in the legacy PM path
just for readability.

> The purpose of making it conditional on !pm_runtime_suspended()
> is just that we'd otherwise call pci_save_state() twice:  Once in
> pci_pm_runtime_suspend() and once more in pci_pm_freeze().
> That would be pointless.
> 
> In the commit message, I provided a rationale for the conditionality,
> but inadvertently caused confusion.
> 
> > I'm thinking of something like this for the merge commit and eventual
> > pull request; please correct me if this isn't right:
> > 
> >   Restore the suspend config state, not the state from probe or error
> >   recovery, for drivers using legacy PCI suspend.
> > 
> >   Avoid saving config state again for devices without driver PM if
> >   their state was already saved by runtime suspend.
> 
> I'd suggest instead (feel free to wordsmith as you see fit):
> 
>   Restore the suspend config state, not the state from probe or error
>   recovery, for drivers using legacy PCI suspend.   [ <- unmodified ]
> 
>   Same for devices with no driver or a driver without PM callbacks
>   when the system is hibernated.                   [ <- replacement ]

Stepping back, I guess that when drivers use generic PM, we already
save config state during suspend and restore that state during resume,
and do the same when entering/leaving hibernation.

And the point of this patch is to do the same when drivers lack PM or
use legacy PCI PM, or when devices have no driver?

Maybe third try is the charm?

  For drivers using PCI legacy suspend, save config state at suspend
  so that state, not any earlier state from enumeration, probe, or
  error recovery, will be restored when resuming.

  For devices with no driver or a driver that lacks PM, save config
  state at hibernate so that state, not any earlier state from
  enumeration, probe, or error recovery, will be restored when
  resuming.

IIUC, after "Ensure error recoverability", the PCI core will always
save the state during enumeration, so drivers shouldn't use
pci_save_state() at all unless they make config changes that they want
restored during error recovery?

Or, I guess (sigh) if they do their own power management?

> Mentioning the runtime PM conditionality in the high-level changelog
> is probably not worth it.
> 
> Was I able to clarify all questions?  Please ask again if not.
> 
> Also, in case the meaning of "freeze", "thaw", "restore" isn't clear,
> here's the order of a hibernation sequence (suspend to disk):
> 
>   pci_pm_prepare()
>   pci_pm_freeze()
>   pci_pm_freeze_noirq()
>   <system image is generated>
>   pci_pm_thaw_noirq()
>   pci_pm_thaw()
>   pci_pm_complete()
>   pci_pm_prepare()
>   pci_pm_poweroff()
>   pci_pm_poweroff_late()
>   pci_pm_poweroff_noirq()
>   <system is asleep, then restarted with boot kernel>
>   pci_pm_prepare()
>   pci_pm_freeze()
>   pci_pm_freeze_noirq()
>   <system image is restored, replacing the boot kernel>
>   pci_pm_restore_noirq()
>   pci_pm_restore()
>   pci_pm_complete()
> 
> Note that "freeze" happens twice in the whole sequence.

Thanks, this is extremely helpful.  Copied into my notes.  I guess
this is essentially condensed from
Documentation/driver-api/pm/devices.rst, but it's very helpful to see
the bare bones and your annotations.

Bjorn

