Return-Path: <linuxppc-dev+bounces-12923-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B7DBDEC71
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 15:35:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmsXF1gTSz3dDt;
	Thu, 16 Oct 2025 00:35:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760535309;
	cv=none; b=kH5Lp4ZyPZQZvbOgxOH+eKyH4z+oBp8k7z14dCiFT8B3sdZxrsfCuXX9pXea8gMArLIDlIxQQq+Jr3TBUSD0GJ0vCqaukqIrDQZyGxGCtEVFdbAE6rVtdnboN5L00+fkSqyO299msSBuAjo818ZMApEVJ4cs9Vp1+E8e3NcV2W5myIq5m5mvqvjlZ1Yo5D+PF07ylDSmKMb+XBXbYFQXb5xlOt4oXcWV/HFZRIVNonzqcaIT3+MDODeqpQZpk2OYdYGTqx5bQp7AQsi5ObBO4yPkN7MYliNrTYP1/SX+v6zo1LbvMXtPRtIWGDPMPlsqfg2utxAb5p8K7wmDbOXiBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760535309; c=relaxed/relaxed;
	bh=oMU9G4Af1cq7AyrrzQ2eG1h+ieGKieI2qQ6GlGAzq4U=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U2+E0I0/6/SHHDQHymhTwGnSo1h/Bl2WtjTtg5yB+EMOHNjNG7EJ7m44wsBveIZptfqbNrD2LnVyhnNbdJJeSgDvPRKPIXgFLOeSg/Vh3sqMVRihxc8dPtrWUcZ0egqTaICfakhmq9T2exUMHweoDdLKbzcyJA0rq4dbBI/ThXCocrG7xokTa7aKPd7LsDemGbyLPyIS0RXRsSO1/Vav2jhrz7mnRjx0ybCvb+0JT8zfuvgNFoCrdBiSI6nDi/FwyW84elf4r0ylZGdUPBM1Jj62d/ga9lkmTCLGnc0Qt+RKTacYUcrahnfAcapIF3oeZNVa7/xlmtBCeLmWod2nDQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pjB9mSa4; dkim-atps=neutral; spf=pass (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pjB9mSa4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=185.246.85.4; helo=smtpout-03.galae.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmsXD2fR9z3d44
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 00:35:06 +1100 (AEDT)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 54AE84E410D6;
	Wed, 15 Oct 2025 13:35:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 19FEF606F9;
	Wed, 15 Oct 2025 13:35:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5EE7E102F22CF;
	Wed, 15 Oct 2025 15:34:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760535303; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oMU9G4Af1cq7AyrrzQ2eG1h+ieGKieI2qQ6GlGAzq4U=;
	b=pjB9mSa45RgZGf+JyVeqvP7qIc/TzHk5GVvUMqgPHqsIv5/DzktXddn8iq8xeExInGbFO5
	wixpOYF6+jQHYhxwcjPd/Igt3ht5HkH8OdmdkXXb45VuNafZbpBkM+FxliSS52eqgNx0NW
	QryRhmGe3Ad5IhLd6KOgwVxa67bPbIHDTs1yPx1ofVCmiqrr6P2qd0m7PD/CIE2OJ3csVn
	fdDTCJxl+E0DiyNu1UXZ8rvLdpopGBBsnUko9D5DOTdh1z3yKofLV0l+qg2Ks/eCQJyooO
	a85e+wE4UeENHtsyoJHJbXIXaYY/Vs1ddszHzzrJqAY1idCLfedZDZawJ2V1BA==
Date: Wed, 15 Oct 2025 15:34:42 +0200
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
Message-ID: <20251015153442.423e2278@bootlin.com>
In-Reply-To: <76026544-3472-4953-910A-376DD42BC6D0@xenosoft.de>
References: <20251015145901.3ca9d8a0@bootlin.com>
	<76026544-3472-4953-910A-376DD42BC6D0@xenosoft.de>
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

Hi Christian,

On Wed, 15 Oct 2025 15:14:28 +0200
Christian Zigotzky <chzigotzky@xenosoft.de> wrote:

> > Am 15 October 2025 at 02:59 pm, Herve Codina <herve.codina@bootlin.com> wrote:
> > 
> > Also when it boots, it is not easy to know about the problem root cause.
> > 
> > In my case, it was not obvious to make the relationship on my side between
> > my ping timings behavior and ASPM.
> > 
> > Of course 'git bisect' helped a lot but can we rely on that for the average
> > user?
> > 
> > Best regards,
> > Hervé  
> 
> I think I will revert these modifications for the RC2.

I don't know what is the future of those modifications but maybe instead
of fully reverting them, maybe you could perform calls to
 - pcie_clkpm_override_default_link_state() and
 - pcie_aspm_override_default_link_state()
only if a new Kconfig symbol is enabled.

Of course this symbols will be disabled by default but if you want some
people to test behavior, it could be interesting to have the code
available in the kernel.

I don't know, this was just an idea.

Of course, reverting the patch is simpler than adding this new Kconfig
symbol.

Best regards,
Hervé

