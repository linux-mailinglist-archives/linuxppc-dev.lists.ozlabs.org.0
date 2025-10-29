Return-Path: <linuxppc-dev+bounces-13533-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF85C1C6C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 18:26:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxZ07615Kz302l;
	Thu, 30 Oct 2025 04:25:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761758759;
	cv=none; b=B3QUNjjHIirAGfxj0PCaczc8WbZR9MOaVNzRb6/uYqDe2F82uRTpYlr9Cicxnj14o4D0rWcN77OL3y1QtmgyNMlZikQv21k5gKUvEJtMbnHPXpNdZJZHI43qaR6mcOjWpO0gwWtMUIoLaWBrZtpb9CJpzckXvZpNeu8xypPQAccSXAEU3tkvi5Rtlx3evSEI8YVwcB0hSag3YMf5uVTHMt1Wnzkj1aiYBfX30BPKktx0PfBmx6mOsLm+PAmAudyIwB1mLJoy29cetQChxkLPQ6lwZYzoxPKGeLOOftJz+dacOXP2DH4YKjl0VyPQlHxY9odaT6X70O2vO/W8boSOCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761758759; c=relaxed/relaxed;
	bh=TuSG1L3Ft9P/fQ+6qks4aQsfyvbs4YDQTJ4GZXZMT9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=T1E8QvfL6QQvA99SD7BU0aYtdbQUlIqAWzvJc7F3B6EWQ7Rfm3kBgVXuvax5uRIH0HPoGq8AsO/cjZ5lY0TDrAU1pKCUKX0BIwX9HnzXTMF6AemaskaNSEIlhPcLLfYbkDjoUQAg8fRs6ByY3hGvPw0+SMEWl6ZkCyxKEr5vsR/4JtC7S/kZf9gdYZUBgRXya1X7iOwt353IiyvWLXQLx+K8fpuIzbCWpN43okYZ4714p7U3O2s7mcEvE3zwyCgs/jDrB+cqgpdUCRDCrMJ9ID/b340PEwjUnRNT91/b/hCgYhHoE9NSXVeU9VoWij0HyU0Rx7xLZfl35fviT7MwZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PWuHWZJ+; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PWuHWZJ+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxZ0673zVz2xPx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 04:25:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FD7C437D1;
	Wed, 29 Oct 2025 17:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D4A8C4CEF7;
	Wed, 29 Oct 2025 17:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761758756;
	bh=UNCv/SLEKVdIM0/F5Qh+o3LkOisYzz/k4Ngw7LOuDtI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=PWuHWZJ+oT416PmcdJeCl9fvjHCkJFvtKNX1frItmY4dqgCUDhAjz0oSZ9qODt2ef
	 Io0O15PkPD/uyhqnbe/y9MiXW+KucYH9xYGU25wyKLDab0A3ELRwYUAHplXUIumVdO
	 rg60yYQWUd/mefNR48m2K6ssxnsTARoDO0CREaMYhAARUKqxOwe1UMO0QEws9iAxai
	 4VXTheLLFK1WBzjkyTWZiYk4EVK/ZqrBXYe63qdVM/xS0geger8Twg0mQvBB1ZwZKS
	 dFAY9v4BQ9fbHFwx9W76Wrc0ho0S+1pglHvzoKxq8/sE+EVHKfhHGHBcgXvgxLqnGX
	 STD/Opd53ruzQ==
Date: Wed, 29 Oct 2025 12:25:54 -0500
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
Message-ID: <20251029172554.GA1571455@bhelgaas>
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
> > 
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

Oops, I made that fixup run too late.  Instead of the patch above, can
you test the one below?

You'll likely see something like this, which is a little misleading
because even though we claim "default L1" for 01:00.0 (or whatever
your Radeon is), the fact that L0s and L1 are disabled at the other
end of the link (00:00.0) should prevent us from actually enabling it:

  pci 0000:00:00.0: Disabling ASPM L0s/L1
  pci 0000:01:00.0: ASPM: default states L1

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 214ed060ca1b..27777ded9a2c 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -2524,6 +2524,7 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
  * disable both L0s and L1 for now to be safe.
  */
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
+DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_FREESCALE, 0x0451, quirk_disable_aspm_l0s_l1);
 
 /*
  * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain

