Return-Path: <linuxppc-dev+bounces-13190-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3538CBFFA74
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 09:38:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csdFR14wyz3bd0;
	Thu, 23 Oct 2025 18:38:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761205131;
	cv=none; b=lYm/Hi3+DsqPvOFbI2FTDHQ+n/ZMPbWVlvdhVlycAHpKaNIB/5rPSEg9pf/uBOAcBPHO4oaIFMWCgMW/k1rib+iyUHJhr0CNKoCaPGZbcua6/h3AmbPNPUpS8/7fcRheJEAEG6Os01XTxyCXUW+/CiLFXSpAD40XPs56PcK0mUYI2WLNNpZ3MU4X5FjYQsV84kIkEDHoHd/HYCXiJl6FumOuzPzyGl1Exr9VcpOagka9NEkN0sSzOQJiTEotCOiP6o5aNkGCCoYKBPT3mlFR4++4f+yrieGlAqeLLeBVgx5T4JJDr0BcOz+y/fcUXM9byE3ACBru6I1YXYKrnb2CGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761205131; c=relaxed/relaxed;
	bh=q5QOWxjIdlO0fc/UnPkoihwCDoCk4/HEVUl6x5L2E6o=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JfHZGLyP2Xvian3hsJGWJpUjA1pB8b2d1ReHijijKcrhgNhyxXCbgtQPvCM8ex2ur57yoihuF+58aF4qqYf+NwDLVtDFJhrOibwlm5ltuhue5Uwp5zB2E7lMogNp9YfhpoHWotjTXyg9BUHBlKhnZ8eEFLg5DC6rqKN6mMvgdGiWFTSAvuxsXx5nqYrI0ndsSqSe+VHvXeOu+aCOydLcI1EA7SU3bBknoum8Nx2zk5+wVPF61W0SGI5mV7MTbU6tg26MczKIveb3TIujvnoi0c4iox2YyjFrps6j9j5gda7egT1JuzPVwWEkLatBpT41nM3am5KZBYm2V+ayaz/DmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=B0TI/thY; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=B0TI/thY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csdFP5BLSz304l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 18:38:48 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 731944E41295;
	Thu, 23 Oct 2025 07:38:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 48E6E6062C;
	Thu, 23 Oct 2025 07:38:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 049A2102F245C;
	Thu, 23 Oct 2025 09:38:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761205122; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=q5QOWxjIdlO0fc/UnPkoihwCDoCk4/HEVUl6x5L2E6o=;
	b=B0TI/thYf1svatfjx455F/6ddcIQ9+ytTACWEHo+NDvVXAT5mGOX1W0kOWOidG9qbMdJyA
	2QCY/luYvxsQUks8ZedL4LmScCFshZ17lG3rYYFBW7dIfN2L8AckafVYaZVGNWTvrnQd1N
	nSLtPv5bV/oS/6WSJHt/ANnnJnKt9oDaRUvoblfsg20gvmCsQ/sl2MR0QNivNIKRhvZa1T
	O3U60Syjul5/jbim5WtGpCcO2tV86+YnMOQO5FddGySaMmInWMLI9KpJ+a+6AbNreBxMU1
	oNBqC4Bae66xB7508vq9Xnf5VjGWIf7bluKZrzWsN8NSXmep7EsxgRNcRz20hw==
Date: Thu, 23 Oct 2025 09:38:13 +0200
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
Message-ID: <20251023093813.3fbcd0ce@bootlin.com>
In-Reply-To: <4rtktpyqgvmpyvars3w3gvbny56y4bayw52vwjc3my3q2hw3ew@onz4v2p2uh5i>
References: <20251015101304.3ec03e6b@bootlin.com>
	<A11312DD-8A5A-4456-B0E3-BC8EF37B21A7@xenosoft.de>
	<20251015135811.58b22331@bootlin.com>
	<4rtktpyqgvmpyvars3w3gvbny56y4bayw52vwjc3my3q2hw3ew@onz4v2p2uh5i>
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

On Wed, 15 Oct 2025 18:20:22 +0530
Manivannan Sadhasivam <mani@kernel.org> wrote:

> Hi Herve,
> 
> On Wed, Oct 15, 2025 at 01:58:11PM +0200, Herve Codina wrote:
> > Hi Christian,
> > 
> > On Wed, 15 Oct 2025 13:30:44 +0200
> > Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
> >   
> > > Hello Herve,
> > >   
> > > > On 15 October 2025 at 10:39 am, Herve Codina <herve.codina@bootlin.com> wrote:
> > > > 
> > > > ﻿Hi All,
> > > > 
> > > > I also observed issues with the commit f3ac2ff14834 ("PCI/ASPM: Enable all
> > > > ClockPM and ASPM states for devicetree platforms")    
> > > 
> > > Thanks for reporting.
> > >   
> > > > 
> > > > Also tried the quirk proposed in this discussion (quirk_disable_aspm_all)
> > > > an the quirk also fixes the timing issue.    
> > > 
> > > Where have you added quirk_disable_aspm_all?  
> > 
> > --- 8< ---
> > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > index 214ed060ca1b..a3808ab6e92e 100644
> > --- a/drivers/pci/quirks.c
> > +++ b/drivers/pci/quirks.c
> > @@ -2525,6 +2525,17 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
> >   */
> >  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
> >  
> > +static void quirk_disable_aspm_all(struct pci_dev *dev)
> > +{
> > +       pci_info(dev, "Disabling ASPM\n");
> > +       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);  
> 
> Could you please try disabling L1SS and L0s separately to see which one is
> causing the issue? Like,
> 
> 	pci_disable_link_state(dev, PCIE_LINK_STATE_L1_1 | PCIE_LINK_STATE_L1_2);
> 
> 	pci_disable_link_state(dev, PCIE_LINK_STATE_L0S);
> 

I did tests and here are the results:

  - quirk pci_disable_link_state(dev, PCIE_LINK_STATE_ALL)
    Issue not present

  - quirk pci_disable_link_state(dev, PCIE_LINK_STATE_L1_1 | PCIE_LINK_STATE_L1_2)
    Issue present, timings similar to timings already reported
    (hundreds of ms).

  - quirk pci_disable_link_state(dev, PCIE_LINK_STATE_L0S);
    Issue present, timings still incorrect but lower
      64 bytes from 192.168.32.100: seq=10 ttl=64 time=16.738 ms
      64 bytes from 192.168.32.100: seq=11 ttl=64 time=39.500 ms
      64 bytes from 192.168.32.100: seq=12 ttl=64 time=62.178 ms
      64 bytes from 192.168.32.100: seq=13 ttl=64 time=84.709 ms
      64 bytes from 192.168.32.100: seq=14 ttl=64 time=107.484 ms

  - quirk pci_disable_link_state(dev, PCIE_LINK_STATE_CLKPM)
    Issue present, timings similar to timings already reported
    (hundreds of ms).

  - No quirk, echo performance > /sys/module/pcie_aspm/parameters/policy
    Issue fixed

  - No quirk, CONFIG_PCIEASPM = n
    Issue fixed (obviously)

Hope those results will help on the topic.

Best regards,
Hervé

