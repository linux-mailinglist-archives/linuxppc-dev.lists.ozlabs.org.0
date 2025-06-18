Return-Path: <linuxppc-dev+bounces-9511-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56854ADF78D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 22:17:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMw5N6Kfpz3bnc;
	Thu, 19 Jun 2025 06:17:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750277848;
	cv=none; b=LSqGgcneFLGZ6o/yqJ7OtXP9dPODNmQiGcm8LL0SCz4u778Jc5u6PCwd+ETnY/RSTZ5FcoFiH9MEvekfclgp/CeWtL6C+mll7hQVfQZVBn/qd6/DBNkuEWorDQ/+hoLGxu1YCK7s8gYhdBv7XPEAitvl2pSYdXGiEzcI86hvN8yTwcMWJvu0NmEW5ggJS+bnPklVI40GeXyD4Nhw7X9C316hneD42+jdQUgFGNVl7gVkxA5IGPCvVBp1KvgUXT9OVPIBQ8sJNq0/ueFsl1IYbIJ8cRDMzgVhZKnLQ96xICTHCthfKqPC7f7g0jCf9arY1KqgoI5JRmvtvMgmdt5nKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750277848; c=relaxed/relaxed;
	bh=KX/VNcwEknSNnHQK8aKlcyRFXsNv13hLiK2kDNiE/Ys=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MjiN1RXezTaxQKBGMq+U2Fj+TSYcfApYwcNAvM0Z7oAjgMB4sWa3dAE1xHheqFG+P1ADht+mKTnNMh2i6oDhFGIb6Rbs+Q7eSYL9nzYNO0gS0MfYX6ZYRCMUdHZgQ7yioVtjB1izeTRFavR5/jVw0/4XwXOilN0No1n1J2/pk+t89UWJnSXXuOeV1M/jw0FTFoMvoaLnFTDXg0DqTiNZ7ckQbLPpyutCNZxisFENzhL+jMdQSWB0R6ZlGYyE3iIX9mmu9SHoJEE7szRiEmcvc8S83VWo/95EmRWnYCr2mSs4SsxqMjcVT4Gb40DkcSwiaAWVa92FrvqR+n5DWJX1Dg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FOARzafB; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FOARzafB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMw5M5cCJz3bn4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 06:17:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 53D2B5C6214;
	Wed, 18 Jun 2025 20:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BB27C4CEE7;
	Wed, 18 Jun 2025 20:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750277844;
	bh=xt8r64iKztaGluvYHQ+nEmHkrlN0zD8k22lRNBw+eZk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=FOARzafBQCH4mhbZUSX3MH98F55tLlayT4MS64DrQ26ru2cMm/M+yF+FscGystMAK
	 0CQma9JT95xIs7U+K1HMp/Z/U9ZfclyD935P5ZdedHfyuuVMdWfGxcjMxVNDL3VZtq
	 kLYIts2/TIO9aXT4ITDKOIVP7tvcnQnttyhvDkyBX0uRIX6cu8hEVbW11K6/nJVLXU
	 TYCHVddc6BvT/c1MJHUMD20a7ia6cvoqPypNfuKOeSqB50zMSq1UHzbSgjEKU5yZEN
	 /uBRVpWVWLcm5YfhOu/Ug21FEc722Jpq7hOGt8MX4XOpYNYWhXfg3DIgM4PzHSPIPD
	 tf7OpPfRTsrcQ==
Date: Wed, 18 Jun 2025 15:17:22 -0500
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
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v2 2/6] pci/hotplug/pnv_php: Work around switches with
 broken
Message-ID: <20250618201722.GA1220739@bhelgaas>
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
In-Reply-To: <1957898084.1311382.1750276204022.JavaMail.zimbra@raptorengineeringinc.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 18, 2025 at 02:50:04PM -0500, Timothy Pearson wrote:
> ----- Original Message -----
> > From: "Bjorn Helgaas" <helgaas@kernel.org>
> > To: "Timothy Pearson" <tpearson@raptorengineering.com>
> > Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "linux-pci"
> > <linux-pci@vger.kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>,
> > "christophe leroy" <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>, "Bjorn Helgaas"
> > <bhelgaas@google.com>, "Shawn Anastasio" <sanastasio@raptorengineering.com>, "Lukas Wunner" <lukas@wunner.de>
> > Sent: Wednesday, June 18, 2025 2:44:00 PM
> > Subject: Re: [PATCH v2 2/6] pci/hotplug/pnv_php: Work around switches with broken
> 
> > [+cc Lukas, pciehp expert]
> > 
> > On Wed, Jun 18, 2025 at 11:56:54AM -0500, Timothy Pearson wrote:
> >>  presence detection
> > 
> > (subject/commit wrapping seems to be on all of these patches)
> > 
> >> The Microsemi Switchtec PM8533 PFX 48xG3 [11f8:8533] PCIe switch system
> >> was observed to incorrectly assert the Presence Detect Set bit in its
> >> capabilities when tested on a Raptor Computing Systems Blackbird system,
> >> resulting in the hot insert path never attempting a rescan of the bus
> >> and any downstream devices not being re-detected.
> > 
> > Seems like this switch supports standard PCIe hotplug?  Quite a bit of
> > this driver looks similar to things in pciehp.  Is there some reason
> > we can't use pciehp directly?  Maybe pciehp could work if there were
> > hooks for the PPC-specific bits?
> 
> While that is a good long term goal that Raptor is willing to work
> toward, it is non-trivial and will require buy-in from other
> stakeholders (e.g. IBM).  If practical, I'd like to get this series
> merged first, to fix the broken hotplug on our hardware that is
> deployed worldwide, then in parallel see what can be done to merge
> PowerNV support into pciehp.  Would that work?

Yeah, it wouldn't make sense to switch horses at this stage.

I guess I was triggered by this patch, which seems to be a workaround
for a defect in a device that is probably also used on non-PPC
systems, and pciehp would need a similar workaround.  But I guess you
go on to say that pciehp already does something similar, so it guess
it's already covered.

Bjorn

