Return-Path: <linuxppc-dev+bounces-13296-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D31C08149
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 22:39:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctZWj5bVRz3bsC;
	Sat, 25 Oct 2025 07:39:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761338369;
	cv=none; b=Rm+kG2ZuczbKgzYGZ5bpHUOckuyqPvJxfsV0alN0i4yAY4tyuzdamY/sIEnVV4HnLIlXRHXPVueZDI7mmg8QQQ1rwXVgWiZwVm0nmua+5/VuB/r/s6MCGSEsrFyVVNNzbzeg6PbDRNTMtmWJARrLOvAnvLNg9U5YyJZYmU2tR6Tg+Koi7T2+LONVEhrGATyvjErVXabTk8yaNybV8AlH8vFL0OSMUPcAo0bPT/rSqi1xV9PTk7hyU6qq6lOUF2WtaZgZVs5BK5F4I6mxuwmDxf+Hx3QO56B+IgfVV9OkzeU3pu1ZoCXj7FGyO82j18WT8LpURUe5GZEssmdEv4uH7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761338369; c=relaxed/relaxed;
	bh=AdD4sa/WCbdrhVqN4ktoTElf74cZr3uNRBxn4HzE5y4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=LF5MFbyGM2djs0+49L0Emy3nA3NIdLo1SAuEtCcWwaOZ2FC+ddhzKSdl2L5Zq2Ve3VJ01x+YH0DrDMxQPaI8TKGqIl1YHdh1j1KWU4Z05CPBNT/DImrpWqNjY0/QiCOaxD/q77C1tU/g7BWuU3WpCk3ATFpU7Oz8biJ42wQmxHfcOys774bNjxT7poNSJAYyIsitspZBwNsIy4pXWiQ8TPgqKR3gisPlS1JhREX3kshatYwpHyus1hsFhseOZZEBTwoXKnlQ4/gv5hcrHfAFjGeJB42eie2heo5I+a9SXI/IF4hCbwf82GAxl6QzAWl57iLZBbxPv98PHZj2EcmnGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z2zGaHcx; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z2zGaHcx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctZWh5Jglz2yN1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 07:39:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4FD2A601D4;
	Fri, 24 Oct 2025 20:39:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCEE4C4CEF1;
	Fri, 24 Oct 2025 20:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761338366;
	bh=nnTnBDGKXvWU3WYDEB3L7PEM0B9KPYgfbjggQZcxrE0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Z2zGaHcxF2LNrnLMJqLPWZhzVV1wDDWav76HGV8HAS8LukB473viCusYP/EP83vly
	 1DroxzbJfkKukObqkqh/VIchMmfMCsGcGOs8S0WFGZeWJquceY27S98gwfz3oLOz9q
	 I/a9HhY4p6syTcqdnMUD6iLTTVC5nt3NBKm0GK06BpSIKBw7wy0lHl1agr5xY3V3fw
	 vxmhhR93W0NkYvZx/YxK9CgB0CCV1eHmVA3MvQf3wpxtcAkzn0Km6HM4o8sNav8mL9
	 28wyXwQe7xUwFSpcvE8iU0PwPhdUZ7mY7IbUJgH0KEeawoOMtl/O/YorTMehiBheqt
	 Z9DnFkl/JlhAA==
Date: Fri, 24 Oct 2025 15:39:24 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-pci@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Christian Zigotzky <chzigotzky@xenosoft.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dragan Simic <dsimic@manjaro.org>, linuxppc-dev@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Lin <shawn.lin@rock-chips.com>, Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH] PCI/ASPM: Enable only L0s and L1 for devicetree platforms
Message-ID: <20251024203924.GA1361677@bhelgaas>
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
In-Reply-To: <aPuZQRaTN2tAwkb5@hovoldconsulting.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

[+cc Shawn, Frank]

On Fri, Oct 24, 2025 at 05:20:33PM +0200, Johan Hovold wrote:
> On Fri, Oct 24, 2025 at 05:12:38PM +0200, Johan Hovold wrote:
> > On Thu, Oct 23, 2025 at 01:06:26PM -0500, Bjorn Helgaas wrote:
> > > From: Bjorn Helgaas <bhelgaas@google.com>
> > > 
> > > f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for
> > > devicetree platforms") enabled Clock Power Management and L1 PM
> > > Substates, but those features depend on CLKREQ# and possibly
> > > other device-specific configuration.  We don't know whether
> > > CLKREQ# is supported, so we shouldn't blindly enable Clock PM
> > > and L1 PM Substates.
> > > 
> > > Enable only ASPM L0s and L1, and only when both ends of the link
> > > advertise support for them.
> > > 
> > > Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
> ...

> > > ---
> > > I intend this for v6.18-rc3.
> > 
> > Note that this will regress ASPM on Qualcomm platforms further by
> > disabling L1SS for devices that do not use pwrctrl (e.g. NVMe). ASPM
> > with pwrctrl is already broken since 6.15. [1]
> 
> Actually, the 6.15 regression was fixed in 6.18-rc1 by the offending
> commit, but pwrctrl devices will now also regress again.
> 
> > Reverting also a729c1664619 ("PCI: qcom: Remove custom ASPM enablement
> > code") should avoid the new regression until a proper fix for the 6.15
> > regression is in place.

Help me think through this.  I just sent a pull request [2] that
includes df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for
devicetree platforms").  If all goes well, v6.18-rc3 will enable L0s
and L1 (but not L1SS) on Qualcomm platforms.

IIUC, if we then revert a729c1664619 ("PCI: qcom: Remove custom ASPM
enablement code"), it will enable L1SS again, but since this is done
in a dw_pcie_host_ops .post_init() hook, L1SS will only be enabled for
devices powered on at qcom-pcie probe time.  It will *not* be enabled
for pwrctrl devices because .post_init() was run when those devices
were powered off.

I think this is the same as in v6.17.  v6.18-rc1 enabled L1SS for
everything, including pwrctrl devices, because it was done in the PCI
enumeration path, not the host controller probe path.  I think that
enumeration is the right place to do this, but we need to figure out
how to do it in a generic way.  At a minimum, we need to know that
CLKREQ# is supported, and some platforms like dw-rockchip also need
device-specific configuration [3].

Bottom line, I think we need to revert a729c1664619 for v6.18 to get
all ASPM states including L1SS enabled on Qualcomm platforms for
non-pwrctrl devices.  I'll post a patch for this.

Then try to figure out how to make this work for pwrctrl devices for
v6.19.  Does this sound right?

Bjorn

> > [1] https://lore.kernel.org/lkml/aH4JPBIk_GEoAezy@hovoldconsulting.com/

[2] https://lore.kernel.org/r/20251024192903.GA1360890@bhelgaas
[3] https://lore.kernel.org/r/1761187883-150120-1-git-send-email-shawn.lin@rock-chips.com

