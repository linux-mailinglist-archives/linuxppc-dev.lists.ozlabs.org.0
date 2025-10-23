Return-Path: <linuxppc-dev+bounces-13194-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6680FC00015
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 10:50:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csfqZ53jwz3bd0;
	Thu, 23 Oct 2025 19:50:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761209402;
	cv=none; b=mjy9lGrusNoI4j3b2P63baPAGtcKddiU/nZ7FGC+NofMsuyQLph5N4Ye5tAl6QFxEQbt7/igVoNCCJVnmiifIhBVIChhjFtpb81/5ixbuOZwq/iSK8kzLbguJqbbZuyMWXKFJ65ucd88J0x8eauEpsJ90DVxMwyLEDOug3VOQL2QhH9QVa0c2sWxiJg1jaA0ay8spw03/P7JxkUSGh8Rzd6/0+2VZiEWx8jNetUoYkBnhUAi5+hvQp0NmRM/d5Jw31LgAYADM0IWNgR8kE5spheCobU3Q4rbjPWjOTuaE0CwRe9ssBMsKxusAH/mLFYnAydOjra4WvSlbhaw+b2qVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761209402; c=relaxed/relaxed;
	bh=Z9c0aflU8YaeoVfSKcwgsDCHATqQbR814uB/JJsH36E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XLeCu/OkjAVYyBMhYDHNUQCck/ko26WQvCzeklVcRfL30Tb2rwCchtyWQghW/tmsrdl0ujxo2FjCiFtBHpnP2EA/WDDo1ker24jy63Gjb9Jn548HVoulQBMvoA5hTRPbz8r77+2rV5Re8Dzq2wdCrmEDyWWP9nJ6oraPLXHKg9EGbiDTluU2dedXwWWuo3JBhcWC+PouLfIgit0ACa9B4/YdjxSwqoH72CAqrWHb82HTSUdx6vdJUi8D79m9bq8CLzdS3zRiL4Rtsau2N4l7yWcIv+UnuQ+Il06G5euK3g6CrYU9x43tWQh4LF1UKg+aW7fzt5rr5vUiDhbIy6Rojg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t8Cp2tIv; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=t8Cp2tIv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csfqY4lq6z30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 19:50:01 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 534C640893;
	Thu, 23 Oct 2025 08:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B67C4CEFD;
	Thu, 23 Oct 2025 08:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761209399;
	bh=Rymmgz0MI2cU8e23Kuu7od6akkRLKSxB0BZixqR/sNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t8Cp2tIvt6DoX+HRWQCu7PTbGMw16ZnpnXX/qDPQDmdMqppnvE6P9ZoHnXf8ZOR0o
	 xWYKbVWRfeCjdl4GhGoYtTcsuSCiVGZFiMx+TpayVSZ6EyNuEM78rEdX810OO5Rrrr
	 YWkAEJ+vVxTnlhaurKvq64n668O8xlmlTjDFYoJW7+uVf7xdXRUEAOIdNGwWan0psI
	 JWS7CHzpSwldKknEu7KKvcnUJ4RYHGzGBQHC7n3+VisF5WbMOGwyhRN/XsXdOumtg1
	 Mz57gOlTCxzZ3PrSP1URSuVlc9rMZMBvcLtAoEdLmS9JytaPW19lksE2ZnKAjN4r+i
	 pJ4vyRDxpnREw==
Date: Thu, 23 Oct 2025 14:19:46 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>, 
	Bjorn Helgaas <helgaas@kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	linux-pci@vger.kernel.org, mad skateman <madskateman@gmail.com>, 
	"R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au, Darren Stevens <darren@stevens-zone.net>, 
	debian-powerpc@lists.debian.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Message-ID: <vc7ehnmr6tjkkag3j543zwprwqdjyttovav2moo5ravpzzkmbi@qe4tds4e7nc6>
References: <20251015101304.3ec03e6b@bootlin.com>
 <A11312DD-8A5A-4456-B0E3-BC8EF37B21A7@xenosoft.de>
 <20251015135811.58b22331@bootlin.com>
 <4rtktpyqgvmpyvars3w3gvbny56y4bayw52vwjc3my3q2hw3ew@onz4v2p2uh5i>
 <20251023093813.3fbcd0ce@bootlin.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251023093813.3fbcd0ce@bootlin.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 23, 2025 at 09:38:13AM +0200, Herve Codina wrote:
> Hi Manivannan,
> 
> On Wed, 15 Oct 2025 18:20:22 +0530
> Manivannan Sadhasivam <mani@kernel.org> wrote:
> 
> > Hi Herve,
> > 
> > On Wed, Oct 15, 2025 at 01:58:11PM +0200, Herve Codina wrote:
> > > Hi Christian,
> > > 
> > > On Wed, 15 Oct 2025 13:30:44 +0200
> > > Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
> > >   
> > > > Hello Herve,
> > > >   
> > > > > On 15 October 2025 at 10:39 am, Herve Codina <herve.codina@bootlin.com> wrote:
> > > > > 
> > > > > ﻿Hi All,
> > > > > 
> > > > > I also observed issues with the commit f3ac2ff14834 ("PCI/ASPM: Enable all
> > > > > ClockPM and ASPM states for devicetree platforms")    
> > > > 
> > > > Thanks for reporting.
> > > >   
> > > > > 
> > > > > Also tried the quirk proposed in this discussion (quirk_disable_aspm_all)
> > > > > an the quirk also fixes the timing issue.    
> > > > 
> > > > Where have you added quirk_disable_aspm_all?  
> > > 
> > > --- 8< ---
> > > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > > index 214ed060ca1b..a3808ab6e92e 100644
> > > --- a/drivers/pci/quirks.c
> > > +++ b/drivers/pci/quirks.c
> > > @@ -2525,6 +2525,17 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
> > >   */
> > >  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
> > >  
> > > +static void quirk_disable_aspm_all(struct pci_dev *dev)
> > > +{
> > > +       pci_info(dev, "Disabling ASPM\n");
> > > +       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);  
> > 
> > Could you please try disabling L1SS and L0s separately to see which one is
> > causing the issue? Like,
> > 
> > 	pci_disable_link_state(dev, PCIE_LINK_STATE_L1_1 | PCIE_LINK_STATE_L1_2);
> > 
> > 	pci_disable_link_state(dev, PCIE_LINK_STATE_L0S);
> > 
> 
> I did tests and here are the results:
> 
>   - quirk pci_disable_link_state(dev, PCIE_LINK_STATE_ALL)
>     Issue not present
> 
>   - quirk pci_disable_link_state(dev, PCIE_LINK_STATE_L1_1 | PCIE_LINK_STATE_L1_2)
>     Issue present, timings similar to timings already reported
>     (hundreds of ms).
> 
>   - quirk pci_disable_link_state(dev, PCIE_LINK_STATE_L0S);
>     Issue present, timings still incorrect but lower
>       64 bytes from 192.168.32.100: seq=10 ttl=64 time=16.738 ms
>       64 bytes from 192.168.32.100: seq=11 ttl=64 time=39.500 ms
>       64 bytes from 192.168.32.100: seq=12 ttl=64 time=62.178 ms
>       64 bytes from 192.168.32.100: seq=13 ttl=64 time=84.709 ms
>       64 bytes from 192.168.32.100: seq=14 ttl=64 time=107.484 ms
> 

This is weird. Looks like all ASPM states (L0s, L1ss) are contributing to the
increased latency, which is more than what should occur. This makes me ignore
inspecting the L0s/L1 exit latency fields :/

Bjorn sent out a patch [1] that enables only L0s and L1 by default. But it
might not help you. I don't honestly know how you are seeing this much of the
latency. This could the due to an issue in the PCI component (host or endpoint),
or even the board routing. Identifying which one is causing the issue is going
to be tricky as it would require some experimentation.

If you are motivated, we can start to isolate this issue to the endpoint first.
Is it possible for you to connect a different PCI card to your host and check
whether you are seeing the increased latency? If the different PCI card is not
exhibiting the same behavior, then the current device is the culprit and we
should be able to quirk it.

- Mani

[1] https://lore.kernel.org/linux-pci/20251020221217.1164153-1-helgaas@kernel.org/

-- 
மணிவண்ணன் சதாசிவம்

