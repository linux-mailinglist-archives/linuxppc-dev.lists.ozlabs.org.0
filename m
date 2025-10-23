Return-Path: <linuxppc-dev+bounces-13197-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B884EC003D3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 11:26:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csgdb3d99z3bd0;
	Thu, 23 Oct 2025 20:26:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761211587;
	cv=none; b=lN37OK0g3iAdvPdQB93n+nBrbp0DYSQHDKI6hEhfcGsjGersFQkppqqwDr3Qr1zaJz4dMdVt64EEMaUsh+9E9VXbE1mBTdDtKNqhPDLWUlrdsrKeSlHPXt0/uSB3zCAhhnr7VDU7BAyuJhyf9b5jgeajziJ7PJPgsIh64xXLn82EK7+xb61xzcUtujXKq2a54FhOUNkB/UXoHQDwquhLWm2O6ifc8uyd6zXxYLGBdbSG7idxwF756FyqHE+RSyTeql24/dnmbi27BISjWvBu8W6scoQimF+M6E1GBJzFKtSjpeT6FABa6fcnllllAVmC8en6KXXdXuqxjJ5Q4p/QIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761211587; c=relaxed/relaxed;
	bh=7iEQ8Hi8YDiUH5n8pt36cUx2rV4zMT41Lo5e4XDnYiY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JSti8MMUNWMPxa1ewV3pn5f6/DJlJ+U+gGaxtTE5auO0ybeoFAuVE0nNQdUypTHkOxfkghIagEKcwEXF3ssTWsVUt2Y59TkpCzH9Tt0fxV74fWhAkmHRNoR6/Yu1B5N9OiZ/ZcN9fc5YJzx2pycon+5rO3pN7TSa4Rgsjyk+8zQpAFI8zb2YwJ/wnGPb5N/TgMGhQ/2jNE1TeT33llFx/aLnLnPDB5MYDE+mAcBpDU2Ls8esW/EhJj4DFJOiXLXVsQI6w7IFrSzhcly1DWwIdbAmUmIL2T/pcH/NK2kMjBSE8ljcAYk209YIWdouv/u2Izi/kXeofWkztOJFzx9lbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Wo2xU9lB; dkim-atps=neutral; spf=pass (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Wo2xU9lB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.171.202.116; helo=smtpout-04.galae.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 368 seconds by postgrey-1.37 at boromir; Thu, 23 Oct 2025 20:26:26 AEDT
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csgdZ4zD7z3bW7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 20:26:24 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 72319C0C40D;
	Thu, 23 Oct 2025 09:19:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 435186062C;
	Thu, 23 Oct 2025 09:20:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 380AE102F2461;
	Thu, 23 Oct 2025 11:19:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761211211; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=7iEQ8Hi8YDiUH5n8pt36cUx2rV4zMT41Lo5e4XDnYiY=;
	b=Wo2xU9lBz8Jw4UJwCyntVY7xyccvqn7f1+wuWv5YaV2fAdkDhA47yH76qdNdTSuVHgCu03
	XX3o75P1rdEfETnXTdyp8/U7e8uEiCDbseFwXrp5CvxLFxfxcoRIP2tj+F/W2uunnDM8bZ
	R3yDEYbUNzTyNSBVO2fgk5IsBcu05e9g3q8CX4blVX81HCW6h6MrFaCD3ZRmckv4S4h+s6
	jka7guD/tLqD/DQNNLdjQXmXOO1l13BgR/gUIOh5eRA6Vt5d/C/qcugJ/MfpK7SRqEtU9H
	Rrpd+KGt2a+hK1rDiDuGm4mDfZUnSG/6ou7GbepX20xKHGr5jA3zrhyIfdUoYQ==
Date: Thu, 23 Oct 2025 11:19:47 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Christian Zigotzky <chzigotzky@xenosoft.de>, Bjorn Helgaas
 <helgaas@kernel.org>, Lukas Wunner <lukas@wunner.de>, Manivannan Sadhasivam
 <manivannan.sadhasivam@oss.qualcomm.com>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, linux-pci@vger.kernel.org, mad skateman
 <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian
 Zigotzky <info@xenosoft.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 hypexed@yahoo.com.au, Darren Stevens <darren@stevens-zone.net>,
 debian-powerpc@lists.debian.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Message-ID: <20251023111947.6e960216@bootlin.com>
In-Reply-To: <vc7ehnmr6tjkkag3j543zwprwqdjyttovav2moo5ravpzzkmbi@qe4tds4e7nc6>
References: <20251015101304.3ec03e6b@bootlin.com>
	<A11312DD-8A5A-4456-B0E3-BC8EF37B21A7@xenosoft.de>
	<20251015135811.58b22331@bootlin.com>
	<4rtktpyqgvmpyvars3w3gvbny56y4bayw52vwjc3my3q2hw3ew@onz4v2p2uh5i>
	<20251023093813.3fbcd0ce@bootlin.com>
	<vc7ehnmr6tjkkag3j543zwprwqdjyttovav2moo5ravpzzkmbi@qe4tds4e7nc6>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Manivannan,

On Thu, 23 Oct 2025 14:19:46 +0530
Manivannan Sadhasivam <mani@kernel.org> wrote:

> On Thu, Oct 23, 2025 at 09:38:13AM +0200, Herve Codina wrote:
> > Hi Manivannan,
> > 
> > On Wed, 15 Oct 2025 18:20:22 +0530
> > Manivannan Sadhasivam <mani@kernel.org> wrote:
> >   
> > > Hi Herve,
> > > 
> > > On Wed, Oct 15, 2025 at 01:58:11PM +0200, Herve Codina wrote:  
> > > > Hi Christian,
> > > > 
> > > > On Wed, 15 Oct 2025 13:30:44 +0200
> > > > Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
> > > >     
> > > > > Hello Herve,
> > > > >     
> > > > > > On 15 October 2025 at 10:39 am, Herve Codina <herve.codina@bootlin.com> wrote:
> > > > > > 
> > > > > > ﻿Hi All,
> > > > > > 
> > > > > > I also observed issues with the commit f3ac2ff14834 ("PCI/ASPM: Enable all
> > > > > > ClockPM and ASPM states for devicetree platforms")      
> > > > > 
> > > > > Thanks for reporting.
> > > > >     
> > > > > > 
> > > > > > Also tried the quirk proposed in this discussion (quirk_disable_aspm_all)
> > > > > > an the quirk also fixes the timing issue.      
> > > > > 
> > > > > Where have you added quirk_disable_aspm_all?    
> > > > 
> > > > --- 8< ---
> > > > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > > > index 214ed060ca1b..a3808ab6e92e 100644
> > > > --- a/drivers/pci/quirks.c
> > > > +++ b/drivers/pci/quirks.c
> > > > @@ -2525,6 +2525,17 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
> > > >   */
> > > >  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
> > > >  
> > > > +static void quirk_disable_aspm_all(struct pci_dev *dev)
> > > > +{
> > > > +       pci_info(dev, "Disabling ASPM\n");
> > > > +       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);    
> > > 
> > > Could you please try disabling L1SS and L0s separately to see which one is
> > > causing the issue? Like,
> > > 
> > > 	pci_disable_link_state(dev, PCIE_LINK_STATE_L1_1 | PCIE_LINK_STATE_L1_2);
> > > 
> > > 	pci_disable_link_state(dev, PCIE_LINK_STATE_L0S);
> > >   
> > 
> > I did tests and here are the results:
> > 
> >   - quirk pci_disable_link_state(dev, PCIE_LINK_STATE_ALL)
> >     Issue not present
> > 
> >   - quirk pci_disable_link_state(dev, PCIE_LINK_STATE_L1_1 | PCIE_LINK_STATE_L1_2)
> >     Issue present, timings similar to timings already reported
> >     (hundreds of ms).
> > 
> >   - quirk pci_disable_link_state(dev, PCIE_LINK_STATE_L0S);
> >     Issue present, timings still incorrect but lower
> >       64 bytes from 192.168.32.100: seq=10 ttl=64 time=16.738 ms
> >       64 bytes from 192.168.32.100: seq=11 ttl=64 time=39.500 ms
> >       64 bytes from 192.168.32.100: seq=12 ttl=64 time=62.178 ms
> >       64 bytes from 192.168.32.100: seq=13 ttl=64 time=84.709 ms
> >       64 bytes from 192.168.32.100: seq=14 ttl=64 time=107.484 ms
> >   
> 
> This is weird. Looks like all ASPM states (L0s, L1ss) are contributing to the
> increased latency, which is more than what should occur. This makes me ignore
> inspecting the L0s/L1 exit latency fields :/
> 
> Bjorn sent out a patch [1] that enables only L0s and L1 by default. But it
> might not help you. I don't honestly know how you are seeing this much of the
> latency. This could the due to an issue in the PCI component (host or endpoint),
> or even the board routing. Identifying which one is causing the issue is going
> to be tricky as it would require some experimentation.

I've just tested the patch from Bjorn and I confirm that it doesn't fix my issue.

> 
> If you are motivated, we can start to isolate this issue to the endpoint first.
> Is it possible for you to connect a different PCI card to your host and check
> whether you are seeing the increased latency? If the different PCI card is not
> exhibiting the same behavior, then the current device is the culprit and we
> should be able to quirk it.

Will see what I can do.

Best regards,
Hervé

