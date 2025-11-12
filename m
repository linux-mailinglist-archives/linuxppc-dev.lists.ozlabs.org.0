Return-Path: <linuxppc-dev+bounces-14127-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C63C52BF4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Nov 2025 15:40:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d65fx03kgz2yvJ;
	Thu, 13 Nov 2025 01:40:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.242.62
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762958440;
	cv=none; b=U0QX83hTwJoA4Fz+71liRgc+vMFujI9AbyICp243aoNQ+18mslo2W5Ywis/4SvVmT756A050FAaxV9Lz0KilfvAf8Dn58cJLzEH2EPd7mpteR27gti7X3ozQiAWOGBm5puml4G7/wWaqwTn3itr1N80EmbgKAq3oGim4JLxZbzVNBagv1FPvt2LgtgyYU9LASL65fiPPZ/81c9jMTmlH7Rg70wGatF3FFmUedjr5+MugbtOMBkNhEX3I5GAZcSMP/h0xNgUIHQIwsHsgRT7rmjlahde5Z9UQPathSlLfxyv9rmG8Kj7J0bgGwPR1fFPnpO6OuJzD3frzelcgo8XpjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762958440; c=relaxed/relaxed;
	bh=WC3E6BD73GgPha6nZHc4OSxq0fpx4NrvupkItIIJvNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAHpjo8kCbpofre223Jr40aq17gVv8Fs8i427hOkf9a/uWSUPZScFmgfFjrllpTKfvY9XhK9kLBnwW2UAYU85leHlbJ3KKOEsvttvArF+NmRzBpnMwkqtX/frOsUTXhYa95MgN+a4GNPsKuvl5mmFYW9a/nUbAPbWCOI/ymOf9D/q4v/VFA4EiPTF8jX7sO5lptXLu/S5YVnFAIAEH8TySl92U5oHjPIdto+04yw7GfUNGfnSiURkpCl3iktC1DNxUpSlONrxm537GOu3FC78kz0lZHo4vMAnTM0Rh2+ku4YFok4qxzQo8x9NjC+YFtHP+lmgQ0VbjAH/xLxmntozw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout3.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout3.hostsharing.net (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d65fv3ssdz2yhD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Nov 2025 01:40:39 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id A35832C051E8;
	Wed, 12 Nov 2025 15:40:26 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 73C00162D4; Wed, 12 Nov 2025 15:40:26 +0100 (CET)
Date: Wed, 12 Nov 2025 15:40:26 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, Christian Zigotzky <chzigotzky@xenosoft.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	mad skateman <madskateman@gmail.com>,
	"R . T . Dickinson" <rtd2@xtra.co.nz>,
	Darren Stevens <darren@stevens-zone.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	luigi burdo <intermediadc@hotmail.com>, Al <al@datazap.net>,
	Hongxing Zhu <hongxing.zhu@nxp.com>, hypexed@yahoo.com.au,
	linuxppc-dev@lists.ozlabs.org, debian-powerpc@lists.debian.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] PCI/ASPM: Allow quirks to avoid L0s and L1
Message-ID: <aRScWjHRy1FrGiwC@wunner.de>
References: <aRMC9z93mI5BKbW0@wunner.de>
 <20251111154445.GA2175922@bhelgaas>
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
In-Reply-To: <20251111154445.GA2175922@bhelgaas>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 11, 2025 at 09:44:45AM -0600, Bjorn Helgaas wrote:
> On Tue, Nov 11, 2025 at 10:33:43AM +0100, Lukas Wunner wrote:
> > I note that a number of drivers call pci_disable_link_state() or
> > pci_disable_link_state_locked() to disable ASPM on probe.
> > Can we convert (all of) these to quirks which use the new helper
> > introduced here?
[...]
> I definitely agree.  I forgot to follow up on all of those cases.
> There aren't that many of them, but it looks like probably too many to
> address for v6.18, and I *think* it's safe to wait and deal with them
> for v6.19.

Yes I agree this isn't necessary for v6.18.

It may even be too late for v6.19 given the amount of time to come up
with patches, get them reviewed and allow sufficient time to soak in
linux-next.  And this would be a cleanup, so not really urgent.

I note that a lot of material has queued up in patchwork and only few
new features have been applied to pci.git this cycle, which I guess
has been caused by the unusual number of regressions introduced
during the merge window.  Given that, I'd down-prioritize conversion
of pci_disable_link_state() calls.

One feature I'd be keen to get in for v6.19 (if time permits) is this one:

https://lore.kernel.org/all/cover.1760274044.git.lukas@wunner.de/

I'm worried that the "pci_save_state() after pci_restore_state()"
anti-pattern gets cargo-culted to more drivers if it's not removed soon.
I can split patch [2/2] in that series into smaller patches and funnel
them through the individual subsystem trees if you'd rather not apply
them wholesale in one large treewide patch.

Thanks,

Lukas

