Return-Path: <linuxppc-dev+bounces-12719-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83875BC680D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 08 Oct 2025 21:51:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chkCz2Wz4z30NF;
	Thu,  9 Oct 2025 06:51:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759953103;
	cv=none; b=WFhWzOVr1Kz2/d9is6S6RFk7YdRd7LgHykSkGJ7GqtFc+ZTl8tJcFgwbkO8q9g+5kmRfrYWvQ0pGypa+ZCRyfMnzFahtOnGJi1kUpytBPcYIQx84HNpO7T2+WaiOORwkWb6S8rsiJVEw9cY+Ot0ewSrl5QobsyxYKYXreY3f3O3Xmox9omL7DL37dfdMBFYJKy+jZshvWR0HdyM6dEYhfR4x0d233K4V4PQ0UL8EI687+1Ajy/Td13VQ9pJjMbe6WWKexPhvQbn3AEFUXBJVnHAIxu77QcWiRvj8tzRXSu39w8Y0b6nooicKnsid2gUMzJ/CrxhqPUJNAB0Fhdr+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759953103; c=relaxed/relaxed;
	bh=aXsnurDaxkaF+w+47bbWXFTm5e4kpH8JO0usATPyxZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=J39bbqF04AHVrB/YkeMYHLwYHwv9/4jRzTkA3O/2ey5N06NaqHRs4PxRCImVwI2BjrP4+0ytpLmr24VR3uAMxDI7EUMeUrP3hM479GDX2WhZQIwxAeaLVBgp66Q4La0iKaqWBxMTRkzqp+jZAIrq05V8S5aAy1/AhW/BwF2pLNHPnNueHpRNgfp0WY+Bo6MWxjMPYNR1AkZRszSo/6DFRgSfsdGKUOEyuKtTnviuMtd7jdqM51Vd7dmzidVtgjlHgKKqmlie7dC/TL9x9Iy4Xl2pLLd62rM8RkCAQ5TvmDSjDNL2QHOgGhzfACeH7gQ6zBL0J4uLoZ8dJN6eHfVmxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TAcuD6ym; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TAcuD6ym;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chkCx455pz302l
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Oct 2025 06:51:41 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A1C0660235;
	Wed,  8 Oct 2025 19:51:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37BE9C4CEE7;
	Wed,  8 Oct 2025 19:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759953098;
	bh=X8WscWl9Z2DK2YNQwSrDB6wnFX5g9gZRrRmOM3LJtUM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=TAcuD6ym3YBqj5+34XPnATejDFCy+g6d9w3TH7DksLXOO+X3/syG+cVf7xh2e/WwJ
	 aL76+8qjqGBoG1Wru79xkWPdlfeRPLsIaIuzq6K7s7hMi0AnrcjM3JoHPA0bet9xqj
	 +e1wy4/OXcaQfvj9JH+ZnJ7w/eO8A3Lqh57XFIsAi90gklcRw7xnPWF3QV15CjUdGf
	 iW7BrJJMVNJlEksF9wxIDo9aIgITGOoM4qe46T2ENkwIBJ1lGeSjdqqkGPCbilVbUW
	 c+0ZUqvnliyU6jYb/8iGI8Emv2MA0C8i089ARGFBcLblAMecnoP3PLSLOUvmyiwc1A
	 w/H2GpyZt5y+Q==
Date: Wed, 8 Oct 2025 14:51:36 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	mad skateman <madskateman@gmail.com>,
	"R.T.Dickinson" <rtd2@xtra.co.nz>,
	Christian Zigotzky <info@xenosoft.de>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, hypexed@yahoo.com.au,
	Darren Stevens <darren@stevens-zone.net>,
	"debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>
Subject: Re: [PPC] Boot problems after the pci-v6.18-changes
Message-ID: <20251008195136.GA634732@bhelgaas>
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
In-Reply-To: <db5c95a1-cf3e-46f9-8045-a1b04908051a@xenosoft.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 08, 2025 at 06:35:42PM +0200, Christian Zigotzky wrote:
> Hello,
> 
> Our PPC boards [1] have boot problems since the pci-v6.18-changes. [2]
> 
> Without the pci-v6.18-changes, the PPC boards boot without any problems.
> 
> Boot log with error messages: https://github.com/user-attachments/files/22782016/Kernel_6.18_with_PCI_changes.log
> 
> Further information: https://github.com/chzigotzky/kernels/issues/17
> 
> Please check the pci-v6.18-changes. [2]

Thanks for the report, and sorry for the breakage.

Do you happen to have a similar log from a recent working kernel,
e.g., v6.17, that we could compare with?

> [1]
> - https://wiki.amiga.org/index.php/X5000
> - https://en.wikipedia.org/wiki/AmigaOne_X1000
> 
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2f2c7254931f41b5736e3ba12aaa9ac1bbeeeb92

#regzbot introduced: 2f2c7254931f ("Merge tag 'pci-v6.18-changes' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci")
#regzbot link: https://github.com/chzigotzky/kernels/issues/17

