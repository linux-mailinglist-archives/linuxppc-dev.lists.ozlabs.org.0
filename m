Return-Path: <linuxppc-dev+bounces-13914-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D2CC3E85E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 06:32:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2nkk6m12z3bsN;
	Fri,  7 Nov 2025 16:32:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:1000::53df:5f64:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762493550;
	cv=none; b=fsPXP99+Qf9hUmZW/ArcWdKmketHy4r/9XpLVWjQwqRPY9XjT0zadAhD9+pG1qfnHPW7i04VM9kdtyBKOSJ4hJ7Qt4khITlo0EvXvPR6pzJBh7c3LcFVuMMND5WxIlc8hfn6BvKyWyhLQzxulUUjhQQvtN6IdGpdYftq3R9BhTM4EyP3c/2BVxiItSNvVJMfrCl03RZ1BDuF4GbBroo+HRXGDq1IUkuVlY1AOcIuMNRoKXvXNBhTBnw7fx8OiCO2IFFhX/kgf8EcphGDgCgrT6U6RVXdtpnXrRsyyrRBmbe6gS2EiyuX1D7kkiIaPOuyPwpVwINsJ7XCMXJYZLBO5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762493550; c=relaxed/relaxed;
	bh=M1Uj8bcyJkYvmaUPKCAZkiskq4zx5MDDw2tx7dtH+8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b05T69rZT4Idn3BZDjIq8cYTfdFFONDOVVmipMRtTF6zPsubQtuC8l5O4yiqrvKIy9vQkVf80Vn3W69qHIFKSmxeh5iz0IjaYnclv9m8E7eH63yuqaKUzbHPraordxshrEg7nrgtCUmRkuZENSdO6YfQATDjEsYmBJ/rDgdH13XD5vyyGcP9lJH46ypbunTqv5ATotLk5Ye1mRqsQkTwldXQCNWwqP8k0U80r2Hmd/4qMkR1HPln/Cyx8PV36jezRhti0bhEY+aPlna5J3XCUGo6L7zPiPzlAVamrLHeVOIzP/GEFquiwAncHpvdHAMHA147QGBTD1TzPcsPldU0Qw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout1.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout1.hostsharing.net (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2nkj3y57z2yrF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 16:32:29 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id B9D872C06417;
	Fri,  7 Nov 2025 06:32:14 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id A8078444; Fri,  7 Nov 2025 06:32:14 +0100 (CET)
Date: Fri, 7 Nov 2025 06:32:14 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org, Christian Zigotzky <chzigotzky@xenosoft.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	mad skateman <madskateman@gmail.com>,
	"R . T . Dickinson" <rtd2@xtra.co.nz>,
	Darren Stevens <darren@stevens-zone.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	luigi burdo <intermediadc@hotmail.com>, Al <al@datazap.net>,
	Roland <rol7and@gmx.com>, Hongxing Zhu <hongxing.zhu@nxp.com>,
	hypexed@yahoo.com.au, linuxppc-dev@lists.ozlabs.org,
	debian-powerpc@lists.debian.org, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH 1/2] PCI/ASPM: Cache Link Capabilities so quirks can
 override them
Message-ID: <aQ2EXqDvnxjyXq_7@wunner.de>
References: <20251106183643.1963801-1-helgaas@kernel.org>
 <20251106183643.1963801-2-helgaas@kernel.org>
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
In-Reply-To: <20251106183643.1963801-2-helgaas@kernel.org>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 06, 2025 at 12:36:38PM -0600, Bjorn Helgaas wrote:
> Cache the PCIe Link Capabilities register in struct pci_dev so quirks can
> remove features to avoid hardware defects.  The idea is:
> 
>   - set_pcie_port_type() reads PCIe Link Capabilities and caches it in
>     dev->lnkcap
> 
>   - HEADER quirks can update the cached dev->lnkcap to remove advertised
>     features that don't work correctly
> 
>   - pcie_aspm_cap_init() relies on dev->lnkcap and ignores any features not
>     advertised there

I realize that memory is cheap, but it still feels a bit wasteful
to cache the entire 32-bit register wholesale.  It contains
reserved bits as of PCIe r7.0, various uninteresting bits and
portions of it are already cached elsewhere and thus now duplicated.
I'm wondering if it would make sense to instead only cache the ASPM bits
that are relevant here?  That's the approach we've followed so far.

You're initializing the link_active_reporting bit from the newly
cached lnkcap register, I'd prefer having a static inline instead
which extracts the bit from the cached register on demand,
thus obviating the need to have a duplicate cached copy of the bit.

pci_set_bus_speed() caches bus->max_bus_speed from the Link
Capabilities register and isn't converted by this patch to use
the cached register.  There are various others, e.g.
get_port_device_capability() in drivers/pci/pcie/portdrv.c
could also get PCI_EXP_LNKCAP_LBNC from the cached lnkcap
register.  Same for pcie_get_supported_speeds().  If the
intention is to convert these in a separate step in v6.19,
it would be good to mention that in the changelog.

Thanks,

Lukas

