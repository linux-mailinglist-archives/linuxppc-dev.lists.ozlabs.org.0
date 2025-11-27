Return-Path: <linuxppc-dev+bounces-14519-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B3BC8D433
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Nov 2025 08:58:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dH81x2xDwz2yvW;
	Thu, 27 Nov 2025 18:58:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.242.62
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764230309;
	cv=none; b=cDNoDS80qizp+AA9FrmwIcXPICO90E7GZf/PW/Q/LPnvEPspVJbCBTttGsxHJAbJzgf/dv37hAPaIMLoTPfSMXfySML5jzdShYYVc3b0ktGwUM4r9j8d99ZidCE1dDjANYfJyuaDgw2VAo/HDOKJfVSGw0DS6JxbL01lIy3a+OIAtQc0GzUR0CF8Mr5qr69oKPkgwsXmHMxZReQegCjGs0dVmizkUwVk8LFLdlTba+pnUxK28wH1KEiq7eAShtAYfGzDM0Zxy392qZGIiELXr8YwxxCVXonrv+NbJhMQGIf9NbgkDNeCZ23n0YsOzeIs3KoRo9/axDM1h4Lii+MH4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764230309; c=relaxed/relaxed;
	bh=1tg7x7BR+0m5P6k/50iPT9CNKarSbXO1O6KiLVdmuhE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kykKqrULkAxSnqP0YcbFJ4SZ0AwjejC6R2jD9JAsMmRjYU+TeIdXsKeJiILW0jRDEQFArYNTCjQwrEfYlcxKEYhuDxYJmuVRM2X9/CSVwVVuFE0Fd9ye4aIVoR1/upgTbbXx0MqU3vjSJBPxDpZ2H/Y2y9UVZxM6hlQxg1I5m7guo1wEsglglnI1bd8/7E9cdOuftVZGNhEcZaNZ72F02pNn3kV2VyrWbxUWNhpiqBXAGFthwP1tFyqD1Q2Nlrj+Cyx9yXsKOiSCsAjaFlVexUsZr9YtRJlTeqq6fvLl8BQ4o7rZLfBtj0fqpwfleDVtWvrz+2aHzjagba/dataygA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout3.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout3.hostsharing.net (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dH81w1GhWz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 18:58:26 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 534712C000A8;
	Thu, 27 Nov 2025 08:58:22 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 2F6661D8E7; Thu, 27 Nov 2025 08:58:22 +0100 (CET)
Date: Thu, 27 Nov 2025 08:58:22 +0100
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
Message-ID: <aSgEnt12QQLXCfWr@wunner.de>
References: <aSb3Qt6n55Fsl7IF@wunner.de>
 <20251126234603.GA2832326@bhelgaas>
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
In-Reply-To: <20251126234603.GA2832326@bhelgaas>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 26, 2025 at 05:46:03PM -0600, Bjorn Helgaas wrote:
> On Wed, Nov 26, 2025 at 01:49:06PM +0100, Lukas Wunner wrote:
> > In the patch, I made the "pci_dev->state_saved = false" assignment
> > conditional on !pm_runtime_suspended() in the "freeze" codepath.
> > I didn't do the same in the legacy codepath because none of the
> > drivers using legacy PM callbacks seem to be using runtime PM.
> 
> Maybe it's moot because we hope there will be no new users of PCI
> legacy PM with runtime PM, but I don't think there's anything to
> *prevent* that or to protect against out-of-tree drivers.
> 
> The implicit assumption that there are no such drivers makes it look
> like there's something magic involving state_saved, legacy PM, and
> runtime PM.  It might be worth doing the same in the legacy PM path
> just for readability.

Drivers having both legacy callbacks and modern callbacks (including
runtime PM callbacks) cause emission of a WARN splat in
pci_has_legacy_pm_support().

Drivers need to activate runtime PM by dropping a runtime PM reference
on probe (see the code comment in local_pci_probe()).  In theory a
driver could have legacy callbacks but no modern callbacks and still
use runtime PM by calling pm_runtime_put_noidle() on probe.  So I
compiled a list of drivers implementing legacy callbacks (included
at the end of this e-mail for reference), grep'ed through them
for any "pm_runtime" occurrences and found none.

Hence it seems very unlikely that drivers using legacy callbacks and
runtime PM exist.  We probably shouldn't accommodate for such use cases
but should rather try to incentivize conversion to modern callbacks.

When compiling the list I sadly noticed that new drivers do exist
which use legacy callbacks.  A case in point is:

drivers/net/ethernet/google/gve/gve_main.c

... which started using legacy callbacks in 2021 with commit 974365e51861
("gve: Implement suspend/resume/shutdown").

I guess there is no real incentive to convert to modern PM callbacks and
finding someone who has the hardware and can test patches is hard
(most drivers are for ATA, some for really old 1990s hardware).
Plus, a lot of detailed knowledge about PCI PM is necessary to avoid
breakage, making this a task that can't easily be delegated to new
contributors.  And everyone with the knowledge is overworked already.
So we keep dragging this tech debt along which complicates codepaths. :(

> Stepping back, I guess that when drivers use generic PM, we already
> save config state during suspend and restore that state during resume,
> and do the same when entering/leaving hibernation.
> 
> And the point of this patch is to do the same when drivers lack PM or
> use legacy PCI PM, or when devices have no driver?

Right.  To have a consistent logic that state_saved is always cleared
before commencing the suspend sequence, in all codepaths.

> Maybe third try is the charm?
> 
>   For drivers using PCI legacy suspend, save config state at suspend
>   so that state, not any earlier state from enumeration, probe, or
>   error recovery, will be restored when resuming.
> 
>   For devices with no driver or a driver that lacks PM, save config
>   state at hibernate so that state, not any earlier state from
>   enumeration, probe, or error recovery, will be restored when
>   resuming.

Perfect.

> IIUC, after "Ensure error recoverability", the PCI core will always
> save the state during enumeration, so drivers shouldn't use
> pci_save_state() at all unless they make config changes that they want
> restored during error recovery?
> 
> Or, I guess (sigh) if they do their own power management?

Exactly right.

> > Also, in case the meaning of "freeze", "thaw", "restore" isn't clear,
> > here's the order of a hibernation sequence (suspend to disk):
[...]
> Thanks, this is extremely helpful.

FWIW, this is the sequence of suspend-to-memory, obviously much simpler:

  pci_pm_prepare()
  pci_pm_suspend()
  pci_pm_suspend_late()
  pci_pm_suspend_noirq()
  pci_pm_resume_noirq()
  pci_pm_resume_early()
  pci_pm_resume()
  pci_pm_complete()

And runtime PM:

  pci_pm_runtime_suspend()
  pci_pm_runtime_resume()

Thanks,

Lukas

-- >8 --

Drivers with legacy PCI PM callbacks:

  drivers/ata/acard-ahci.c
  drivers/ata/ata_generic.c
  drivers/ata/ata_piix.c
  drivers/ata/pata_acpi.c
  drivers/ata/pata_ali.c
  drivers/ata/pata_amd.c
  drivers/ata/pata_artop.c
  drivers/ata/pata_atiixp.c
  drivers/ata/pata_atp867x.c
  drivers/ata/pata_cmd640.c
  drivers/ata/pata_cmd64x.c
  drivers/ata/pata_cs5520.c
  drivers/ata/pata_cs5530.c
  drivers/ata/pata_cs5535.c
  drivers/ata/pata_cs5536.c
  drivers/ata/pata_cypress.c
  drivers/ata/pata_efar.c
  drivers/ata/pata_hpt366.c
  drivers/ata/pata_hpt3x3.c
  drivers/ata/pata_it8213.c
  drivers/ata/pata_it821x.c
  drivers/ata/pata_jmicron.c
  drivers/ata/pata_macio.c
  drivers/ata/pata_marvell.c
  drivers/ata/pata_mpiix.c
  drivers/ata/pata_netcell.c
  drivers/ata/pata_ninja32.c
  drivers/ata/pata_ns87410.c
  drivers/ata/pata_ns87415.c
  drivers/ata/pata_oldpiix.c
  drivers/ata/pata_opti.c
  drivers/ata/pata_optidma.c
  drivers/ata/pata_pdc2027x.c
  drivers/ata/pata_pdc202xx_old.c
  drivers/ata/pata_piccolo.c
  drivers/ata/pata_radisys.c
  drivers/ata/pata_rdc.c
  drivers/ata/pata_rz1000.c
  drivers/ata/pata_sc1200.c
  drivers/ata/pata_sch.c
  drivers/ata/pata_serverworks.c
  drivers/ata/pata_sil680.c
  drivers/ata/pata_sis.c
  drivers/ata/pata_sl82c105.c
  drivers/ata/pata_triflex.c
  drivers/ata/pata_via.c
  drivers/ata/sata_inic162x.c
  drivers/ata/sata_mv.c
  drivers/ata/sata_nv.c
  drivers/ata/sata_sil.c
  drivers/ata/sata_sil24.c
  drivers/ata/sata_sis.c
  drivers/ata/sata_via.c
  drivers/bluetooth/hci_bcm4377.c
  drivers/gpio/gpio-bt8xx.c
  drivers/message/fusion/mptfc.c
  drivers/message/fusion/mptsas.c
  drivers/message/fusion/mptspi.c
  drivers/mtd/nand/raw/cafe_nand.c
  drivers/net/ethernet/atheros/atl1e/atl1e_main.c
  drivers/net/ethernet/atheros/atlx/atl2.c
  drivers/net/ethernet/google/gve/gve_main.c
  drivers/net/ethernet/microsoft/mana/gdma_main.c
  drivers/net/ethernet/toshiba/tc35815.c
  drivers/net/ethernet/wangxun/ngbe/ngbe_main.c
  drivers/net/wireless/mediatek/mt76/mt7615/pci.c
  drivers/net/wireless/mediatek/mt76/mt76x0/pci.c
  drivers/net/wireless/mediatek/mt76/mt76x2/pci.c
  drivers/scsi/nsp32.c
  drivers/scsi/qedf/qedf_main.c
  drivers/scsi/qedi/qedi_main.c
  drivers/scsi/stex.c
  drivers/tty/serial/serial_txx9.c
  drivers/video/fbdev/chipsfb.c
  drivers/video/fbdev/i810/i810_main.c

