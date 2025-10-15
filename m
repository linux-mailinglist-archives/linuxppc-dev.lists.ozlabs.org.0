Return-Path: <linuxppc-dev+bounces-12933-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0769BBE10BB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Oct 2025 01:41:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cn6zN2QKhz305n;
	Thu, 16 Oct 2025 10:41:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760571664;
	cv=none; b=PJLUDnssJ+IchqH+X46FoOp8ZbKhzL3a35sbGLkijd6b1KEW0ZZ8Tw7+CzHLQ4pBXgUhlW6lUXDN12PXvZTaJIJl41tIcXuQEjgXebdx6mRAJhiHjZ7IvXum5NfW6dP998pQic87RYd95xeQJ1994J4Z/KUunhx31dbiN67yjzsz7b1jD0VlYjT2mqFY57H9/Q8aVnR6vHZRah/ks2E9dufIbg1pVqGY95IjC0+fhL6EWJu3ya52H4ot8EbXL7oSHJ56uX6sov2ZkioIomuGgB9/NAczcnRtdrQdD5Drt9xoxo82zAAGRRXT13a77YNl5XdWekkONOMz/uyp1i1kHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760571664; c=relaxed/relaxed;
	bh=QBMQUzwEv0XvQKRStRx+rFs+6EMUvsiRTeTXhEoZzRI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=RZiaCSvZ8wKD98AmxBfFTOUx2j4ylLvUt03E9XtflHI3H8LBZM2xI2oGAS0QqWqcqXNGsBThxXiFa0mtoZO1HT5XvM+iXVjD2YnVpLdb7zAYfEy9xgflOPnsR5JRjHo5cU12QoSd7VAG4Mhm5l7J64Zs8etAOJIvqe63XLZy1c645tD3JtoVUFde5DfBMIeUkXGCaBxgIkrEZqQ4jS3eyzPcT819mC/rvjWueRoOrPxgoxSK5BqzNg4+F1lxmUxxWo5eNo90Zo4t9cSroBtOz0w3xGlb3DEj2XPzHzuG+yqLRRvB9716qfwWswToTP8YrH9nYUFbkghmHU0Fkr3sCQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h3+qsstL; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h3+qsstL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cn6zM1qb7z2yr1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 10:41:03 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3328543FB5;
	Wed, 15 Oct 2025 23:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E89F1C4CEF8;
	Wed, 15 Oct 2025 23:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760571661;
	bh=7ZVXV77W0d05bk/8gSWIHFEpHIZsQ9H36dwcXGXNqro=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=h3+qsstLdZgrMKrIYjUUZJ3SpvHx3e+0csZghHbFI8vZbxfVK/12Zf+LUjJPRCy6Y
	 pohFdY1HaBTMKdKHwutLvPO+PtHZB0hLTuyDrsWj/t7xUmSLjNJjHNT0I2ZIhtDR+u
	 SNCw6SfnHhStgY9NVmZSJANBBGWFHP/KPTU71RmsroxJA8pWIrmyakAMOGhd0gRKGH
	 5GqgIy5P0cM1GHzA/SrSJOh3mhTWiqAJSqeKl1fAE45R/L4uXugJaIhti/x6XFG7Eu
	 hCtg7UOPklPh/aO/TMXEk16iIYXrlwCfDfrjc+TAsQ/fv5Lsk8bp2yBVAQBsIKmwzi
	 MA/Cqt6Jnyc+g==
Date: Wed, 15 Oct 2025 18:40:59 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Lukas Wunner <lukas@wunner.de>,
	Christian Zigotzky <chzigotzky@xenosoft.de>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	mad skateman <madskateman@gmail.com>,
	"R.T.Dickinson" <rtd2@xtra.co.nz>,
	Christian Zigotzky <info@xenosoft.de>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
	Darren Stevens <darren@stevens-zone.net>,
	"debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Message-ID: <20251015234059.GA961901@bhelgaas>
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
In-Reply-To: <20251015101304.3ec03e6b@bootlin.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 15, 2025 at 10:13:04AM +0200, Herve Codina wrote:
> ...

> I also observed issues with the commit f3ac2ff14834 ("PCI/ASPM: Enable all
> ClockPM and ASPM states for devicetree platforms")
> 
> My system is an ARM board (Marvel Armada 3720 DDB)
>   https://elixir.bootlin.com/linux/v6.17.1/source/arch/arm64/boot/dts/marvell/armada-3720-db.dts
> 
> I use an LAN966x PCI board
>   https://elixir.bootlin.com/linux/v6.17.1/source/drivers/misc/lan966x_pci.c
> 
> Usually, when I did a ping using the PCI board, I have more or less the
> following timings:
>    # ping 192.168.32.100
>    PING 192.168.32.100 (192.168.32.100): 56 data bytes
>    64 bytes from 192.168.32.100: seq=0 ttl=64 time=3.328 ms
>    64 bytes from 192.168.32.100: seq=1 ttl=64 time=2.636 ms
>    64 bytes from 192.168.32.100: seq=2 ttl=64 time=2.928 ms
>    64 bytes from 192.168.32.100: seq=3 ttl=64 time=2.649 ms
> 
> But with a vanilla v6.18-rc1 kernel, those timings become awful:
>    # ping 192.168.32.100
>    PING 192.168.32.100 (192.168.32.100): 56 data bytes
>    64 bytes from 192.168.32.100: seq=0 ttl=64 time=656.634 ms
>    64 bytes from 192.168.32.100: seq=1 ttl=64 time=551.812 ms
>    64 bytes from 192.168.32.100: seq=2 ttl=64 time=702.966 ms
>    64 bytes from 192.168.32.100: seq=3 ttl=64 time=725.904 ms
> 
> Reverting commit f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and
> ASPM states for devicetree platforms") fixes my timing issues.

We expect *some* performance impact from enabling ASPM, but this seems
excessive.  You should be able to control the ASPM settings for an
individual device via sysfs:

  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/ABI/testing/sysfs-bus-pci?id=v6.17-rc1#n431

My guess is that L1.2 is enabled and the threshold values in the L1 PM
Substates control registers are bogus.  I don't know how to fix those,
especially on a devicetree system.  But it might be possible to fiddle
with them using setpci (while ASPM is disabled).  Not for the faint of
heart.

Bjorn

