Return-Path: <linuxppc-dev+bounces-12925-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E59BDFA2B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 18:23:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmxGn1JH0z3dSC;
	Thu, 16 Oct 2025 03:23:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760545425;
	cv=none; b=XEMli7LXjq9JPFgX9G1BSWLHWR8UYBmiAOjVKGioUb/MZPe4Z6fYXQt2o5TXQiYppKKg4RRZirZIOuqtYF3PXAq+5A6qqG7Uh1MPg8TIpfzZxTK2cNYyLqXx+kxUnwgzUxPMCjEpjm41+57J8/SuKOfzotfFZtwGjvO9ueA1Tjvq80ZmdiVuQ9bomtJX1ZeX8u70iaQQqFaha0Lr7vAnl4vyEzaolVx7dPQRpugGTMTMb5AcgeNo1+QwNegEV2lx8Eoj5KY/bXTsCsUMq4/6RAnVhf2BCXjURh19k68Sqzb7G7PbVawI8hRsFvFGFoCuPM93PIX1c4ngMiSrMaV4+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760545425; c=relaxed/relaxed;
	bh=jxcpTn4W5WPcNE5fDpL3fwAkSZ0DnN3kH0q6F/gBZvQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZDH7N7qIICor0QFJd0rt8fFvNpgJKV7+L8Mvg0lPqCi2OmVU6yjIAFl2siLglUjSZUsVJqQWOf55m4dutfesJeAhWyJ3uvwSG8MPj1/s2KcBNGCoRNHRdGxC5gq3lhO1jPMizdKU1TYG5BksZOUvplKLLMCxBiH4cKJaQDTkprAJNygE+cHSOM75ZnSYYfZ1FmvE0DqdkYeKLc3ZiDsx8kZ/gHPZO0mlON/HiNYbafNhUDvyDVeGDwLt24UP1gZlw/QQ6fq1J1K3jqXnVgHz65qdwcYIFUfTyRiyavMcdSZ72as78S8M+bpB9bM6s3nd+YGKy/+AaubQiiGVTKW7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bdzAG5u9; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=bdzAG5u9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmxGm0TSLz3dLN
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 03:23:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E9D44626C1;
	Wed, 15 Oct 2025 16:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01675C4CEFB;
	Wed, 15 Oct 2025 16:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760545420;
	bh=vu6ue76QD8o9WFynC7bUcUGayTYCLLK40E6CHK4jY2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bdzAG5u9dO9QPkYgHiX7SK3N/AugvofjOAAidYDmd6E40Huua/4C37iiqmS9qv0wi
	 M+WzekZzM+RT11P3e1eYjolgcaxDCV4aZXNhlkB/bcvV+TP4ApHKVJEQK/HO0dPPpv
	 j0kA22ElaAFOG/BXPO6or9sHcXlHrYNjZyv+MuBYV3VDoADTSGLkYoKzoBrtpCVWud
	 GN5MSstr6e1fSzxwecWXiq9xGjwa248l+buDzj9rEv/N5XP3ceJsNWyMP7yOjdW1ss
	 j1wA2vL5iYmn8InvTiwVii4oar72ugqxrw7bkhyBxT1N6WsT9fvkf0UesrwyhpWyp4
	 fHqp2a5Hb06ow==
Date: Wed, 15 Oct 2025 21:53:26 +0530
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
Message-ID: <jznknzm2ke7b7d7itdbv5nqianxl3n6p35dg45gpwm3e57ulxp@iy2juxdq5m4i>
References: <20251015135811.58b22331@bootlin.com>
 <EF4D5B4B-9A61-4CF8-A5CC-5F6A49E824C1@xenosoft.de>
 <20251015145901.3ca9d8a0@bootlin.com>
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
In-Reply-To: <20251015145901.3ca9d8a0@bootlin.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 15, 2025 at 02:59:01PM +0200, Herve Codina wrote:
> On Wed, 15 Oct 2025 14:27:00 +0200
> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
> 
> > > On 15 October 2025 at 01:58 pm, Herve Codina <herve.codina@bootlin.com> wrote:
> > > 
> > > ﻿Hi Christian,
> > >   
> > >> On Wed, 15 Oct 2025 13:30:44 +0200
> > >> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
> > >> 
> > >> Hello Herve,
> > >>   
> > >>>> On 15 October 2025 at 10:39 am, Herve Codina <herve.codina@bootlin.com> wrote:  
> > >>> 
> > >>> ﻿Hi All,
> > >>> 
> > >>> I also observed issues with the commit f3ac2ff14834 ("PCI/ASPM: Enable all
> > >>> ClockPM and ASPM states for devicetree platforms")    
> > >> 
> > >> Thanks for reporting.
> > >>   
> > >>> 
> > >>> Also tried the quirk proposed in this discussion (quirk_disable_aspm_all)
> > >>> an the quirk also fixes the timing issue.    
> > >> 
> > >> Where have you added quirk_disable_aspm_all?  
> > > 
> > > --- 8< ---
> > > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > > index 214ed060ca1b..a3808ab6e92e 100644
> > > --- a/drivers/pci/quirks.c
> > > +++ b/drivers/pci/quirks.c
> > > @@ -2525,6 +2525,17 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
> > >  */
> > > DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
> > > 
> > > +static void quirk_disable_aspm_all(struct pci_dev *dev)
> > > +{
> > > +       pci_info(dev, "Disabling ASPM\n");
> > > +       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);
> > > +}
> > > +
> > > +/* LAN966x PCI board */
> > > +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_EFAR, 0x9660, quirk_disable_aspm_all);
> > > +
> > > /*
> > >  * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
> > >  * Link bit cleared after starting the link retrain process to allow this
> > > --- 8< ---
> > > 
> > > Best regards,
> > > Hervé  
> > 
> > It is the same patch, I use for my AMD Radeon cards.
> > 
> > In my point of view we have to add a lot of other devices.
> 
> Yes, probably!
> 
> > 
> > But if the computer does not boot, will the average user know that there is a problem with the power management and their graphics card?
> > I am unsure whether I can deliver the kernel to average users later on.
> 
> Also when it boots, it is not easy to know about the problem root cause.
> 
> In my case, it was not obvious to make the relationship on my side between
> my ping timings behavior and ASPM.
> 

Interesting. So in your case, the issue is that ASPM adds up latency of the
network card? If so, it is intended. The added latency should correspond to the
L0s/L1 exit latencies.

If you want performance, then you should select CONFIG_PCIEASPM_PERFORMANCE
using Kconfig or pass 'pcie_aspm=off' in cmdline or do,

'echo performance > /sys/module/pcie_aspm/parameters/policy'

By default, enabling ASPM saves power, but it comes with a cost of reducing
performance.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

