Return-Path: <linuxppc-dev+bounces-12920-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21900BDEA5D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 15:08:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmrxL5vKvz3dH2;
	Thu, 16 Oct 2025 00:08:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760533702;
	cv=none; b=gbNvwCebIbJuHUmQhyExvTKVnWHqby7J1PUbWAiJ7NrvmTQYXwBtEdGeP7Li/jL5c9Y6w9ITdAY0fgi2n6lcMd7v/y3rPBvCHIJkCQro8OxA4DRkAjVF0s7STET7gwzwMTnYX8zkc6Oor9RsSsAAce7QK6iV4InlV7ux6Fde05nhNUNhvjmDoHqlJACM4xZqVu54v+gcK2ZuONgu9RqKEoiTVcaBoolNz9Bxi6FUzLSx+camf4kYmbI/ZhTOKn9R63uzxgKbfYjgqnm4mGXGA4AEJqTy6nC1qNJLnhXjXX04VbleihbVqq7a14TOR38e/TYudbxd6PcthbKeO3KtRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760533702; c=relaxed/relaxed;
	bh=m0D5lTBcRRjQJDnMrKYFTSajSsfESny/hir+6+IztSM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZhBB4aepEQnc+wY1X+Vzslac8yLzQOvjRVS8qrK3P3ye7HV1rlfxJ6a8a2rXa4gd045uodTeZsvKTW7qLpztAphBPpIXvIeeDgQq+4Dd/P24FY6kXrrKSCKWAGB5dS+hQ3ltDYds/Xm3Qba8+sZpXWXZmsrIJ+Zi/LMZ6kQNuS8LlvVALloH1G8k34Ee6C1VO7j0QX4MyzzbbJi2wGunKw9bWBW1+QjjVGXw4LgYrQGSGUnUyRMVYvconoI3hl5hFFXgcVpQlzrTUBnt8aKKBq47yiPi50h6ZmuvFbHtrH5DI2mev1aaNXTSisxCqjUsAfqT31HeumpDyPnlvp2hXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vXKGWoKL; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vXKGWoKL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 528 seconds by postgrey-1.37 at boromir; Thu, 16 Oct 2025 00:08:21 AEDT
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmrxK335Jz3dBy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 00:08:20 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 644D24E410D7;
	Wed, 15 Oct 2025 12:59:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 31720606F9;
	Wed, 15 Oct 2025 12:59:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 11EBB102F22C9;
	Wed, 15 Oct 2025 14:59:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760533166; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m0D5lTBcRRjQJDnMrKYFTSajSsfESny/hir+6+IztSM=;
	b=vXKGWoKLCXCUAGdXC3OwlCdAQymxkkrvdpzzd4URDlQaQTu1vQLPHJC017heFxnT1EW04e
	IXG4AOCWtOqNWXGc8yQT8PddYEjb+3S444gkqLlF0OHI7T+FsP0R6bHh/+OLGchTkfw2Pg
	+FpXk/t1MDhV6qtD/lMl/Kmi3sJWSQ5XGKAOpbCnxde/OsTK/JJAj5d6Fi2h1AebNU5xFw
	2yHMqpM7O/y+L4TsCbezCoqI0TTnF2wcz5MScuEKSmHZ8blFB/BjH3mRler0fMd/vJ8UWJ
	HGbxXETRHihUIul00MlMDpp17FxdMozgH6Q0h4CEhOf7fCPipPYNnT5JkL+dzA==
Date: Wed, 15 Oct 2025 14:59:01 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <helgaas@kernel.org>, Lukas Wunner <lukas@wunner.de>, Manivannan Sadhasivam
 <manivannan.sadhasivam@oss.qualcomm.com>, Ilpo =?UTF-8?B?SsOkcnZpbmVu?=
 <ilpo.jarvinen@linux.intel.com>, linux-pci@vger.kernel.org, mad skateman
 <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian
 Zigotzky <info@xenosoft.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 hypexed@yahoo.com.au, Darren Stevens <darren@stevens-zone.net>,
 debian-powerpc@lists.debian.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Message-ID: <20251015145901.3ca9d8a0@bootlin.com>
In-Reply-To: <EF4D5B4B-9A61-4CF8-A5CC-5F6A49E824C1@xenosoft.de>
References: <20251015135811.58b22331@bootlin.com>
	<EF4D5B4B-9A61-4CF8-A5CC-5F6A49E824C1@xenosoft.de>
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

On Wed, 15 Oct 2025 14:27:00 +0200
Christian Zigotzky <chzigotzky@xenosoft.de> wrote:

> > On 15 October 2025 at 01:58 pm, Herve Codina <herve.codina@bootlin.com> wrote:
> > 
> > ﻿Hi Christian,
> >   
> >> On Wed, 15 Oct 2025 13:30:44 +0200
> >> Christian Zigotzky <chzigotzky@xenosoft.de> wrote:
> >> 
> >> Hello Herve,
> >>   
> >>>> On 15 October 2025 at 10:39 am, Herve Codina <herve.codina@bootlin.com> wrote:  
> >>> 
> >>> ﻿Hi All,
> >>> 
> >>> I also observed issues with the commit f3ac2ff14834 ("PCI/ASPM: Enable all
> >>> ClockPM and ASPM states for devicetree platforms")    
> >> 
> >> Thanks for reporting.
> >>   
> >>> 
> >>> Also tried the quirk proposed in this discussion (quirk_disable_aspm_all)
> >>> an the quirk also fixes the timing issue.    
> >> 
> >> Where have you added quirk_disable_aspm_all?  
> > 
> > --- 8< ---
> > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > index 214ed060ca1b..a3808ab6e92e 100644
> > --- a/drivers/pci/quirks.c
> > +++ b/drivers/pci/quirks.c
> > @@ -2525,6 +2525,17 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
> >  */
> > DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
> > 
> > +static void quirk_disable_aspm_all(struct pci_dev *dev)
> > +{
> > +       pci_info(dev, "Disabling ASPM\n");
> > +       pci_disable_link_state(dev, PCIE_LINK_STATE_ALL);
> > +}
> > +
> > +/* LAN966x PCI board */
> > +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_EFAR, 0x9660, quirk_disable_aspm_all);
> > +
> > /*
> >  * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
> >  * Link bit cleared after starting the link retrain process to allow this
> > --- 8< ---
> > 
> > Best regards,
> > Hervé  
> 
> It is the same patch, I use for my AMD Radeon cards.
> 
> In my point of view we have to add a lot of other devices.

Yes, probably!

> 
> But if the computer does not boot, will the average user know that there is a problem with the power management and their graphics card?
> I am unsure whether I can deliver the kernel to average users later on.

Also when it boots, it is not easy to know about the problem root cause.

In my case, it was not obvious to make the relationship on my side between
my ping timings behavior and ASPM.

Of course 'git bisect' helped a lot but can we rely on that for the average
user?

Best regards,
Hervé

