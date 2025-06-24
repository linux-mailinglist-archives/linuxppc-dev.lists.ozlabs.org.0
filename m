Return-Path: <linuxppc-dev+bounces-9686-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7261CAE7255
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 00:34:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRfrX5cJ6z2xHv;
	Wed, 25 Jun 2025 08:34:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750804460;
	cv=none; b=DnpKBneahs9e8jzI1hQvk69T0SHMRBtl/YsATYMYjCRib6gxI2mZ8d/DPIkgOV0MDm2YMYK6m3D2ugFXa2wzv1an3F/hWD4gS+MCFljcvUa2QEz55riiKUlyDw7U6AzcwvaxWKKXebPWOJgndXZfzFLXaRdhXZUBrFmfGYXhbYvNFN0hu1nm53h3Y+QHWHtWhibxwmsdm3KOoQetxICDmJW1zXJ+aqcqTobJG3LRKMCGO2CBEVM6sgc8IynvZ/TN3ntCxGeQNT8cARJ3pXKOZGmzVyDw3aHdgE6t1v3yWPOL8CSM++HRpw+v25U2rwvvrAJ4GMuLHAR58DWe7OLqFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750804460; c=relaxed/relaxed;
	bh=MbJHqvZtls3CPsqM1d5sddHFLkaYUMjqQnlnQ/S25G4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=NPSLCkK5GuVKJwgCmRmnNtg09SnV4A+WWXWy3zfESii+ugDfXR/9eD7nZr+R4tGG/o1K0q8iRBIXv72xD5+WC2jgoesvNFzejAriTTeaZOmhGSPYxlPUphnVOaF6UpxVjkGfqx3JdWIJOxzf0W0fj6PtuzcCPmf+3eXOr7tJPyuajHkKIcICVnPJ6n35drQHiGa96LdjgcUrlnUNdtv3cHpFjGigAR3tbLDTJnCZFTPAUYuBgwKOqBBvcDlVfI96g6ZMVHLsJ3aPPaXT2XapOz6f2m7GVPvPEXUN7p+4zoypgcMY2NqjYdEUJySoXy0+4uUvtFhzWJnzlveQ7SyY+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ek29q7nU; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ek29q7nU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRfrW5Dlkz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 08:34:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E1017A5002C;
	Tue, 24 Jun 2025 22:34:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AFD2C4CEE3;
	Tue, 24 Jun 2025 22:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750804454;
	bh=eK8NMyHuwrl8dXYAwi4q/jdKZLqI0hmkAk2+xKgeAtU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ek29q7nUOQfyYabkxpsHoxJFUrxv8u4oxmuC8/lTDIqS7HHcQq3jGJokZybHqykBW
	 GYtNHfN4SeEJu3pKWIJ03BPB50bQ1A81gHel5osuiCrybLmmE/KwsVCdAH732vdDPI
	 R9+hZSTHcyLv++4A7V9qdoIiJFg+b3d6xycUzlve50qiOSVhGG2K7ZA3Fdl/vNwMwA
	 9t13cQ5CuqKSeXNjcfunzzQHokSH0uiRlFj+XPkahPCeYlm6rXI1YZAZ3Rkvp+hjXb
	 KJPAlk1k+lL33i8KlZUBUKSIYwbjlJhNKvPW2T1ZqJvBj6/8RoBI18cquq3cbaCS27
	 db55Tm0uixDdg==
Date: Tue, 24 Jun 2025 17:34:13 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	christophe leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH v2 6/6] pci/hotplug/pnv_php: Enable third attention
 indicator
Message-ID: <20250624223413.GA1550003@bhelgaas>
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
In-Reply-To: <1469323476.1312174.1750293474949.JavaMail.zimbra@raptorengineeringinc.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 18, 2025 at 07:37:54PM -0500, Timothy Pearson wrote:
> ----- Original Message -----
> > From: "Bjorn Helgaas" <helgaas@kernel.org>
> > To: "Timothy Pearson" <tpearson@raptorengineering.com>
> > Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "linux-pci"
> > <linux-pci@vger.kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>,
> > "christophe leroy" <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>, "Bjorn Helgaas"
> > <bhelgaas@google.com>, "Shawn Anastasio" <sanastasio@raptorengineering.com>
> > Sent: Wednesday, June 18, 2025 2:01:46 PM
> > Subject: Re: [PATCH v2 6/6] pci/hotplug/pnv_php: Enable third attention indicator
> 
> > On Wed, Jun 18, 2025 at 11:58:59AM -0500, Timothy Pearson wrote:
> >>  state
> > 
> > Weird wrapping of last word of subject to here.
> 
> I'll need to see what's up with my git format-patch setup. Apologies
> for that across the multiple series.

No worries.  If you can figure out how to make your mailer use the
normal "On xxx, somebody wrote:" attribution instead of duplicating
all those headers, that would be far more useful :)

> >> +static int pnv_php_get_raw_indicator_status(struct hotplug_slot *slot, u8
> >> *state)
> >> +{
> >> +	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
> >> +	struct pci_dev *bridge = php_slot->pdev;
> >> +	u16 status;
> >> +
> >> +	pcie_capability_read_word(bridge, PCI_EXP_SLTCTL, &status);
> >> +	*state = (status & (PCI_EXP_SLTCTL_AIC | PCI_EXP_SLTCTL_PIC)) >> 6;
> > 
> > Should be able to do this with FIELD_GET().
> 
> I used the same overall structure as the pciehp_hpc driver here.  Do
> you want me to also fix up that driver with FIELD_GET()?

Nope, I think it's fine to keep this looking like pciehp for now.
If somebody wants to use FIELD_GET() in pciehp, I'd probably be OK
with that, but no need for you to open that can of worms.

> > Is the PCI_EXP_SLTCTL_PIC part needed?  It wasn't there before, commit
> > log doesn't mention it, and as far as I can tell, this would be the
> > only driver to do that.  Most expose only the attention status (0=off,
> > 1=on, 2=identify/blink).
> > 
> >> +	return 0;
> >> +}
> >> +
> >> +
> >>  static int pnv_php_get_attention_state(struct hotplug_slot *slot, u8 *state)
> >>  {
> >>  	struct pnv_php_slot *php_slot = to_pnv_php_slot(slot);
> >>  
> >> +	pnv_php_get_raw_indicator_status(slot, &php_slot->attention_state);
> > 
> > This is a change worth noting.  Previously we didn't read the AIC
> > state from PCI_EXP_SLTCTL at all; we used php_slot->attention_state to
> > keep track of whatever had been previously set via
> > pnv_php_set_attention_state().
> > 
> > Now we read the current state from PCI_EXP_SLTCTL.  It's not clear
> > that php_slot->attention_state is still needed at all.
> 
> It probably isn't.  It's unclear why IBM took this path at all,
> given pciehp's attention handlers predate pnv-php's by many years.
> 
> > Previously, the user could write any value at all to the sysfs
> > "attention" file and then read that same value back.  After this
> > patch, the user can still write anything, but reads will only return
> > values with PCI_EXP_SLTCTL_AIC and PCI_EXP_SLTCTL_PIC.
> > 
> >>  	*state = php_slot->attention_state;
> >>  	return 0;
> >>  }
> >> @@ -461,7 +474,7 @@ static int pnv_php_set_attention_state(struct hotplug_slot
> >> *slot, u8 state)
> >>  	mask = PCI_EXP_SLTCTL_AIC;
> >>  
> >>  	if (state)
> >> -		new = PCI_EXP_SLTCTL_ATTN_IND_ON;
> >> +		new = FIELD_PREP(PCI_EXP_SLTCTL_AIC, state);
> > 
> > This changes the behavior in some cases:
> > 
> >  write 0: previously turned indicator off, now writes reserved value
> >  write 2: previously turned indicator on, now sets to blink
> >  write 3: previously turned indicator on, now turns it off
> 
> If we're looking at normalizing with pciehp with an eye toward
> eventually deprecating / removing pnv-php, I can't think of a better
> time to change this behavior.  I suspect we're the only major user
> of this code path at the moment, with most software expecting to see
> pciehp-style handling.  Thoughts?

I'm OK with changing this, but I do think it would be worth calling
out the different behavior in the commit log.

Bjorn

