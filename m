Return-Path: <linuxppc-dev+bounces-13522-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41FE4C1BE02
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 16:59:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxX475tLkz302l;
	Thu, 30 Oct 2025 02:59:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761753559;
	cv=none; b=ksOoxFEdOZH28jg/D1dEb4rcoSzBSGAosrO5ZSRLC4qO9MQJ2l7pRSf9AekKtzPXE8jz+P/6VXKqNEgMuNsiwn4E1w38HF34a47ANlcqiRwuK80N4Eoz0H4Auhfc80/I3OXgl5k2AuWi5mmGBsZmjuDo0lygPbUCENAW9hi9Pz1mu+T+tDkPPFSKdDcUcYay/KOzoe3tE1096mAO9K1z4p/fzXEb3Rc2LTnwQVndba9Atxvo/6TtREmPnf5QA3gQ0N8p4yX9+B8ih3Wv0+cziDKtOH5YdFtpmRILiBIK07qQfb//TnfxmOO5LND8YK70V2ACWxkPoPUQLF+lGLQnpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761753559; c=relaxed/relaxed;
	bh=/QeIHNVWmN0pcZJMKm+iE4aLL5VpDsjx0t3eR0zvEzU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=oe0HwCp7Msdh/eFdyTY40N0DsPW2MPTg0OngqMxGzEHi3xGL05wb13egzvpOem0ZniemRkngK0U8bLqZhyTO0TPPpTOqhRjrELRgLmBwgcyiEBCtTdFIDf71hxoHGn5dwPOqYQjKuy9HknN4PYRbXtPOl9YKfyRfFmspbpDofv5d+7U3qPKTVwMrop4BvoZwYq8ASLOV8W0acNlwMLUwFaojU2guKNPuN7jC9pnqlDqQO/9krkoh85u6/bpdlpXYqnHfvniH0GpA969+DQBApsyMoRovCeaP/xdOb8ye2eubFsYR0H7bAd6WRLfIlV8k5BYjx78pppESkFpYjUS9tg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=goUpW2lp; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=goUpW2lp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxX463Mxbz2yjm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 02:59:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C7873621B7;
	Wed, 29 Oct 2025 15:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4DBC4CEF8;
	Wed, 29 Oct 2025 15:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761753555;
	bh=BgmmyeX0qvCVjapAnPnDG8LNCQFeWgDwHiQBafyqKGg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=goUpW2lplrswAiJGRTPiqFN91fyucf0gHLsVwamQ0ELnE4mqXBXzIlJgT29sWRzlq
	 efPIs8A8+Il3KnlWxUGe/vbTM0ftb1HLNXXXPKhqAethTLOVjsXcdSz7RfSDajG7Pg
	 rK9aBW9LY6DfI6ikoEZAcJL3vZjoB+tFfzX6rMAyc1v7MbsgHoQ6FyFujhfcL3mZ0q
	 upG+SaliKlySMKLjUsCIzlaJP5JtBSvXyzAp7WVUfI6a0Ubl+uOQE0itPBlbrOBsux
	 rfuIcHHpttl3oMcYKplNe9VLuY9ImAaS4V31kSwURTUYwPMqcjv8BOhvD5xjHbe6c1
	 Rrvya6CLl+uNg==
Date: Wed, 29 Oct 2025 10:59:13 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Johan Hovold <johan@kernel.org>, linux-pci@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Naoki FUKAUMI <naoki@radxa.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dragan Simic <dsimic@manjaro.org>, linuxppc-dev@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Lin <shawn.lin@rock-chips.com>, Frank Li <Frank.li@nxp.com>,
	"R.T.Dickinson" <rtd2@xtra.co.nz>,
	mad skateman <madskateman@gmail.com>, hypexed@yahoo.com.au,
	Christian Zigotzky <info@xenosoft.de>
Subject: Re: [PATCH] PCI/ASPM: Enable only L0s and L1 for devicetree platforms
Message-ID: <20251029155913.GA1563823@bhelgaas>
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
In-Reply-To: <D6280EFB-08D7-41EC-BAC6-FD7793A98A16@xenosoft.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 29, 2025 at 06:47:19AM +0100, Christian Zigotzky wrote:
> > On 29 October 2025 at 00:33 am, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > ﻿On Mon, Oct 27, 2025 at 06:12:24PM +0100, Christian Zigotzky wrote:
> >> Hi All,
> >> 
> >> I activated CONFIG_PCIEASPM and CONFIG_PCIEASPM_DEFAULT again for the RC3 of
> >> kernel 6.18. Unfortunately my AMD Radeon HD6870 doesn't work with the latest
> >> patches.
> >> 
> >> But that doesn't matter because we disable the above kernel options by
> >> default. We don't need power management for PCI Express because of boot
> >> issues and performance issues.
>  
> > If you have a chance, could you try the patch below on top of
> > v6.18-rc3 with CONFIG_PCIEASPM=y?
> > 
> > diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
> > index 214ed060ca1b..2b6d4e0958aa 100644
> > --- a/drivers/pci/quirks.c
> > +++ b/drivers/pci/quirks.c
> > @@ -2524,6 +2524,7 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
> >  * disable both L0s and L1 for now to be safe.
> >  */
> > DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
> > +DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_FREESCALE, 0x0451, quirk_disable_aspm_l0s_l1);
> > 
> > /*
> >  * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
> 
> Thanks for the patch. 
> 
> I will test it on my FSL Cyrus+ board over the weekend.
> BTW, I also tested my PASemi Nemo board with the RC3 of kernel 6.18
> and with power management for PCI Express enabled. Unfortunately,
> the installed AMD Radeon HD5870 does not work with power management
> for PCI Express enabled either.

Can you share the output of "sudo lspci -vv" and the dmesg log for
this Nemo board that doesn't work with v6.18-rc3?  I would still guess
that Nemo root port has an issue rather than the HD5870.

Hypexed reported that "pasemi,nemo PA6T 0x900102 A-EON Amigaone X1000"
worked fine on 0739473694c4, which was just before v6.18-rc1.  That
system has:

  pci 0000:00:10.0: [1959:a002] type 01 class 0x060400 PCIe Root Port
  pci 0000:00:10.0: PCI bridge to [bus 01]
  pci 0000:01:00.0: [1002:6610] type 00 class 0x030000 PCIe Legacy Endpoint
  pci 0000:01:00.0: ASPM: DT platform, enabling L0s-up L0s-dw L1 ASPM-L1.1 ASPM-L1.2 PCI-PM-L1.1 PCI-PM-L1.2

which is a [1959:a002] PA Semi PWRficient PCI-Express Root Port
leading to [1002:6610] AMD Oland XT [Radeon HD 8670 / R5 340X OEM / R7
250/350/350X OEM], and we tried to enable all ASPM states.

Bjorn

