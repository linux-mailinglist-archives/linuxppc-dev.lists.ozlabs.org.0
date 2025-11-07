Return-Path: <linuxppc-dev+bounces-13937-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF5DC40933
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 16:25:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d32vN3jJcz3btL;
	Sat,  8 Nov 2025 02:25:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762529152;
	cv=none; b=eHsHKJeEwxYf7p/OtsQKPbfUxxBOEcctciv/GIFElAHJz4g29+BpezCQvQIvlHWiVki2E/GJtHd84RIdfPgrJSnYYOMRemR2yy/tYYOQbelM5iKLEV0g/QeYZ2+QmbabbxitRbp+A/yTRCTl06Gxl0IUNBEz4cnhvnfkwPi9c1nV2aG5RCyOkw9q+b5suovQlu2eF17pQLw8K0fuhpdi9ZHC7FfN73ilMFhIsGeCftwdK7lELFrC6x49mYzKzp08kiH+wUvFNQIDhF/zTbWLEhb12bHeu2ODm9xHRt5y3HT2hjhr3+NpqcZ04OJxWP2TBsTwIRudS7GDNEd1hwlibw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762529152; c=relaxed/relaxed;
	bh=wBME+C4djKEkoAhqIAB293BkWLprPCJiAeuqYhMIqKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=C9dKJe76WJ6zhfY9kT/1s9+pcn9STP3sUAB/IoClJQGe+g2yHPc7C6nXBuZn9OAT7d5y/Kb5LvVQd4Nq+9Y5EmHIZAaiXs3h3dpeIgBOwdmwwR0TVVhhPpQQR5aeSm0eYrHjrEzojdZdrOdh/SCwiRAQtGac8HqNfQuLIWfQMMmu9S3qusB/RiM/J5rqq2WOEOxm+67+1215WBwJjqVQXXGSGi2CP5Rp37j2wnrv17i/bZzPvrh6VIHxG1oTF7LFM8GUP9/qM1AuI67/NoJaNbCfuZp6IXAgN2yUMQmQP944uViuWmiD1TAk7ntTOsYrFreXerrZ0PPv3HI5HYe1iA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TRF8DAfe; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TRF8DAfe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d32vM3Zylz2yrF
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 02:25:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EB7B46190E;
	Fri,  7 Nov 2025 15:25:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D386C4CEF7;
	Fri,  7 Nov 2025 15:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762529148;
	bh=02om1vHeyZwGMIMBSLhYVHI4vekhj/hDXVqaAGTaRb4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=TRF8DAfeP1FRnLZkPGRCooI/SbGKUFf2sXqBTy73FxI/w3uLNiqGlPB+YtdbErEsa
	 FHRT1EOCI6FKIbyMgcZ2/SXRLgCJYzp+WMYUOzVgogq2g3nwOpQbATUK0HyFPKZAOa
	 ack/Hw+l6Q1CA7z0AEmf9VKR9RmqeLvueeeGZxbkXvsWLez6kF1k3C1vwzMEa3j1fh
	 NIGCLKlGbK7ouBbayfER4k4Ut0siSqxMUBjE2JGMZ3LD7M+xGRjA003CGeCxO40iyQ
	 IyBKh0XDj4WwUyHH6AfmSWs0kvtDXjtesPcIelaInaCOWNpMhAm1+FTFJgG8E2lb1S
	 U7y5SY5hM/XcQ==
Date: Fri, 7 Nov 2025 09:25:47 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
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
Message-ID: <20251107152547.GA1998555@bhelgaas>
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
In-Reply-To: <aQ2EXqDvnxjyXq_7@wunner.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 07, 2025 at 06:32:14AM +0100, Lukas Wunner wrote:
> On Thu, Nov 06, 2025 at 12:36:38PM -0600, Bjorn Helgaas wrote:
> > Cache the PCIe Link Capabilities register in struct pci_dev so quirks can
> > remove features to avoid hardware defects.  The idea is:
> > 
> >   - set_pcie_port_type() reads PCIe Link Capabilities and caches it in
> >     dev->lnkcap
> > 
> >   - HEADER quirks can update the cached dev->lnkcap to remove advertised
> >     features that don't work correctly
> > 
> >   - pcie_aspm_cap_init() relies on dev->lnkcap and ignores any features not
> >     advertised there
> 
> I realize that memory is cheap, but it still feels a bit wasteful
> to cache the entire 32-bit register wholesale.  It contains
> reserved bits as of PCIe r7.0, various uninteresting bits and
> portions of it are already cached elsewhere and thus now duplicated.
> I'm wondering if it would make sense to instead only cache the ASPM bits
> that are relevant here?  That's the approach we've followed so far.

My first try (which I didn't post) cached only the two bits we need
for this.  It's not awful, and the aspm.c patch was smaller, so maybe
it's the right approach, at least for v6.18.

One thing I didn't like about pci_disable_aspm_cap() (which I know you
said you *did* like :)) is that it adds a layer of indirection.  I
like having PCI_EXP_LNKCAP_ASPM_L0S in the quirk because it's more
directly connected to the spec and the hardware register, and grep
works better for code readers.

But if we only cache the ASPM cap bits, we would need
pci_disable_aspm_cap() to manage converting PCI_EXP_LNKCAP_ASPM_L0S or
PCIE_LINK_STATE_L0S to the right place.

(A bit of a tangent, but I've never liked the PCIE_LINK_STATE_* bits
because they look like they ought to be register bits, but they're
not.  I think the code would be improved overall if we could remove
them.)

> You're initializing the link_active_reporting bit from the newly
> cached lnkcap register, I'd prefer having a static inline instead
> which extracts the bit from the cached register on demand,
> thus obviating the need to have a duplicate cached copy of the bit.
> 
> pci_set_bus_speed() caches bus->max_bus_speed from the Link
> Capabilities register and isn't converted by this patch to use
> the cached register.  There are various others, e.g.
> get_port_device_capability() in drivers/pci/pcie/portdrv.c
> could also get PCI_EXP_LNKCAP_LBNC from the cached lnkcap
> register.  Same for pcie_get_supported_speeds().  If the
> intention is to convert these in a separate step in v6.19,
> it would be good to mention that in the changelog.

I agree with all of that, and there are several other PCI_EXP_LNKCAP
reads that could be replaced, but that would have to be for v6.19.

Bjorn

