Return-Path: <linuxppc-dev+bounces-13216-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD1BC029DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 19:00:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csshy5fmJz3bfZ;
	Fri, 24 Oct 2025 04:00:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761238802;
	cv=none; b=kn0QLk3uAUPuRN39ppJWl6OIIjODkFMYT59oWr7TZFDdcQ64Y1LxaDjPiJJ81thMDN+HLUEoKobsDSQRjwT8yoADbgvslzmXb0syn1g+wA8sD6mH/0bJdR6pTvvyvOIt1BSx5hYH9qSYLFkqij/QNxy8/SXaB/868/UF3ULKl8brM09p2S7yMskcswPybe/6px2WOxgf/xecdawueOa4nbR/LJvXlatias60OLx8VwRoVOkF+jko/KkvyOi1mJO8TeUaL4Zx8zKerT4hg/m9uN5Q4ME46rd44LjLPTEENoN+V4gJ0j9myEms3d9lcz1QHmieRP/doEgIchxHdQflZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761238802; c=relaxed/relaxed;
	bh=ehYNnwiBTKR/Q6UHrJCQIsSLe6XKwf3Q4SgsmQXH0n4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=AJtgKems7E3iCMjzO1VTf+l3FdpkKQJHqRbfp/VEgtcM77mweAnnYleZmYsjv7nGAXxQni846cDA9lJBiHkEdEXtCDjPkULRJXi7GEv+JxbmWisD5UDbPb0ArNMJGAwjbH0ahghb+qDR8DGWvJ/Rn6cL4Au3MXQWit3+FlBcpcze/kCwCabzO2UDJpmj7aZ1bTKWdrV4T8dk6ZPXu9VcKnW8RDrdm3ZILdtpCcJNQr/UiCkYyR0uL60v7pO0alZkEcdgEboiGI3jMnEttN92NM2j9C4Mrw79mKW9N8Z9O+lp6dpKTY0bsg+jf5LYRLkgspt6/oTATX8POMoIeTwH+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C8Z5KU8k; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C8Z5KU8k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csshx4SBnz3bf4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 04:00:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B8E1761142;
	Thu, 23 Oct 2025 16:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE3EC4CEE7;
	Thu, 23 Oct 2025 16:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761238798;
	bh=h+icO936JD9teEQbZE1rnc5+Nmq3sJLtLM81uIp43hM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=C8Z5KU8kW8hHnaNrJcD9NZD9rWQ57hwrWE5Nve4fckneiMxuMuRDT3eVA7hS00i9c
	 IyaM4bt8tJZdImwRykswdO3VpPybfnqMrFlwjDU5zVAnwfuVgup10Oa7irEOrNSJIN
	 8pZXE4dqX9R722uFPdss03F7mPIQOsUt7T0JoDacpRFC1pvMAAxeFVYVIDoBMjkB+A
	 U8cqUh1K3UuWUKhI6rXt0cZ80HJ5LXdp6Wq151H9GNqEQo2YceLRfYAkTkZ7XJg2x8
	 p8pz4kEcnrNSSWCA8VdIdZxvyuil2XKmq/apcgmpONlFxjj6JSmlwoYXHhsVEuoZkc
	 HoFWECHsp6zcw==
Date: Thu, 23 Oct 2025 11:59:57 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
	Christian Zigotzky <chzigotzky@xenosoft.de>,
	Lukas Wunner <lukas@wunner.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	linux-pci@vger.kernel.org, mad skateman <madskateman@gmail.com>,
	"R.T.Dickinson" <rtd2@xtra.co.nz>,
	Christian Zigotzky <info@xenosoft.de>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
	Darren Stevens <darren@stevens-zone.net>,
	debian-powerpc@lists.debian.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Message-ID: <20251023165957.GA1300574@bhelgaas>
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
In-Reply-To: <20251023111947.6e960216@bootlin.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 23, 2025 at 11:19:47AM +0200, Herve Codina wrote:
> On Thu, 23 Oct 2025 14:19:46 +0530
> Manivannan Sadhasivam <mani@kernel.org> wrote:
> > On Thu, Oct 23, 2025 at 09:38:13AM +0200, Herve Codina wrote:
> > > On Wed, 15 Oct 2025 18:20:22 +0530
> > > Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > > On Wed, Oct 15, 2025 at 01:58:11PM +0200, Herve Codina wrote:  
> > > > > On Wed, 15 Oct 2025 13:30:44 +0200
> > > > > Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
> > > > > > > On 15 October 2025 at 10:39 am, Herve Codina <herve.codina@bootlin.com> wrote:
> > > > > > > I also observed issues with the commit f3ac2ff14834
> > > > > > > ("PCI/ASPM: Enable all ClockPM and ASPM states for
> > > > > > > devicetree platforms")      

> > > I did tests and here are the results:
> > > 
> > >   - quirk pci_disable_link_state(dev, PCIE_LINK_STATE_ALL)
> > >     Issue not present
> > > 
> > >   - quirk pci_disable_link_state(dev, PCIE_LINK_STATE_L1_1 | PCIE_LINK_STATE_L1_2)
> > >     Issue present, timings similar to timings already reported
> > >     (hundreds of ms).
> > > 
> > >   - quirk pci_disable_link_state(dev, PCIE_LINK_STATE_L0S);
> > >     Issue present, timings still incorrect but lower
> > >       64 bytes from 192.168.32.100: seq=10 ttl=64 time=16.738 ms
> > >       64 bytes from 192.168.32.100: seq=11 ttl=64 time=39.500 ms
> > >       64 bytes from 192.168.32.100: seq=12 ttl=64 time=62.178 ms
> > >       64 bytes from 192.168.32.100: seq=13 ttl=64 time=84.709 ms
> > >       64 bytes from 192.168.32.100: seq=14 ttl=64 time=107.484 ms
> > 
> > This is weird. Looks like all ASPM states (L0s, L1ss) are
> > contributing to the increased latency, which is more than what
> > should occur. This makes me ignore inspecting the L0s/L1 exit
> > latency fields :/
> > 
> > Bjorn sent out a patch [1] that enables only L0s and L1 by
> > default. But it might not help you. I don't honestly know how you
> > are seeing this much of the latency. This could the due to an
> > issue in the PCI component (host or endpoint), or even the board
> > routing. Identifying which one is causing the issue is going to be
> > tricky as it would require some experimentation.
> 
> I've just tested the patch from Bjorn and I confirm that it doesn't
> fix my issue.

You should be able to control ASPM at runtime via sysfs:

  What:           /sys/bus/pci/devices/.../link/clkpm
		  /sys/bus/pci/devices/.../link/l0s_aspm
		  /sys/bus/pci/devices/.../link/l1_aspm
		  /sys/bus/pci/devices/.../link/l1_1_aspm
		  /sys/bus/pci/devices/.../link/l1_2_aspm
		  /sys/bus/pci/devices/.../link/l1_1_pcipm
		  /sys/bus/pci/devices/.../link/l1_2_pcipm
  Date:           October 2019
  Contact:        Heiner Kallweit <hkallweit1@gmail.com>
  Description:    If ASPM is supported for an endpoint, these files can be
		  used to disable or enable the individual power management
		  states. Write y/1/on to enable, n/0/off to disable.

I assume you're using CONFIG_PCIEASPM_DEFAULT=y, and if you're using
v6.18-rc1 plus the patch at [1], we should be enabling l0s_aspm and
l1_aspm at most.

If the sysfs knobs work correctly, maybe we can isolate the slowdown
to either L0s or L1?

[1] https://lore.kernel.org/linux-pci/20251020221217.1164153-1-helgaas@kernel.org/

