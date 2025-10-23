Return-Path: <linuxppc-dev+bounces-13235-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 584ADC03671
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 22:39:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csyYs0M2Wz3c5T;
	Fri, 24 Oct 2025 07:39:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761251952;
	cv=none; b=kxZaWaJBR4TIA6SY6K/Rbev0SUL5yXFJDfyx1uA7HZ+2gLT52xKFOpVa+QvPygiuP7UcVetrptHDp7tTWsT2xvsFb5Ppo7SDY+aR26XWtRYrV7Q3AdKid5/OnitNoMb+t3j+KPo8XBCu2mjOonliLpIt5QELHhBVxwBtSCYjA1HLZwF22rQW2Z2enAqwxlfvUEsFG6uSLZSTd0Z5JBA7+JFbp3ceSfOKFubq5o2wZn+J+J04IZg3LYXr+B/BRU4CTp2z7wPpoPKZBU8tuRV1sSnl2EgGjZaLXnbX5zExCFFBbtj31Pi3YBiqcZim9PKLS28Yvuo2LOFKaKUBMcmLpw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761251952; c=relaxed/relaxed;
	bh=8fTLugdLUjCIbav2HWnCdPsI/sa4UY2Zb2TLwrrdjls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=FYz6dhmRw1+FM4+hTa3Y1kG+pWH7X60phy5FDdOkhl3jVneU+A7xEAKDBs57sb5V6UXlVyVuY7bI1ds5eFlo0pSvIgqRZGiUJow495LwqrFHC/+Z58EK8a9Op51KeR7a1Wr+XyyQX/2mGm9jX0H1g/BEPBfZ2p6lJ+BfnsqTBPq7wYKrA51AuIUcUR/I65xAIF6tqNb0gcb8PCQmSmFZR70BhJ8K8T/fTbBv2iKSeDHrNjwmur+RqzZSRHWdyikTa5z3vC0mYDTqh281rCCNuqyZikrHDB9ZdbLCSsdK+TWuo5cZWhiYWKaungp8kRLNKhHZo+bA2Xq3F0aSdXINiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FPGgIEa2; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FPGgIEa2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csyYr2z7qz3c4d
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 07:39:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 22BF360052;
	Thu, 23 Oct 2025 20:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A54ECC4CEE7;
	Thu, 23 Oct 2025 20:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761251949;
	bh=Iifi+VbV963RwdpYbf2ljnl0AJ421iOJ11fymH6RoHM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=FPGgIEa2tcCqmJ6crL47tJjlXDlazTRrJVHvyevCAimVX0h63+mCMT2vecNCsIhnp
	 8CWWHyJhr0778CXW9/vnLFOIuRmoZYHri9IZ4esCTVuVAZ/8diIGKk86aaJCPuLX37
	 FSIuNxRgonsLUllGN7CGgXzzQUmHsw24RfydNgWz8Mpvon5HpYuGTajd+P4Suot8kU
	 TqU1EW518gKJmt2+rH7jjuIS2FO9UHwGE/ajoB3B0R66pYunD9PW8en+k5BrazM8Vx
	 WiMfKerWzbFgGJAuDBzVhRXqCP8UDLdjlLznC7/kkfBvWZrvmhzy8GqrnNl1CQZQHs
	 i7NryYntI+n+g==
Date: Thu, 23 Oct 2025 15:39:08 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Diederik de Haas <diederik@cknow-tech.com>
Cc: linux-pci@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Christian Zigotzky <chzigotzky@xenosoft.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Dragan Simic <dsimic@manjaro.org>, linuxppc-dev@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] PCI/ASPM: Enable only L0s and L1 for devicetree platforms
Message-ID: <20251023203908.GA1314564@bhelgaas>
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
In-Reply-To: <DDPYVBSYR01V.1OSGKL2X8LT82@cknow-tech.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Oct 23, 2025 at 09:59:41PM +0200, Diederik de Haas wrote:
> Hi Bjorn,
> 
> Thanks for the patch :-)
> 
> On Thu Oct 23, 2025 at 8:25 PM CEST, Bjorn Helgaas wrote:
> > On Thu, Oct 23, 2025 at 01:06:26PM -0500, Bjorn Helgaas wrote:
> >> From: Bjorn Helgaas <bhelgaas@google.com>
> >> 
> >> f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree
> >> platforms") enabled Clock Power Management and L1 PM Substates, but those
> >> features depend on CLKREQ# and possibly other device-specific
> >> configuration.  We don't know whether CLKREQ# is supported, so we shouldn't
> >> blindly enable Clock PM and L1 PM Substates.
> >> 
> >> Enable only ASPM L0s and L1, and only when both ends of the link advertise
> >> support for them.
> >> 
> >> Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
> >> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> >> Link: https://lore.kernel.org/r/db5c95a1-cf3e-46f9-8045-a1b04908051a@xenosoft.de/
> >> Reported-by: FUKAUMI Naoki <naoki@radxa.com>
> >> Closes: https://lore.kernel.org/r/22594781424C5C98+22cb5d61-19b1-4353-9818-3bb2b311da0b@radxa.com/
> >> Reported-by: Herve Codina <herve.codina@bootlin.com>
> >> Link: https://lore.kernel.org/r/20251015101304.3ec03e6b@bootlin.com/
> >> Reported-by: Diederik de Haas <diederik@cknow-tech.com>
> >> Link: https://lore.kernel.org/r/DDJXHRIRGTW9.GYC2ULZ5WQAL@cknow-tech.com/
> >> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> >> Tested-by: FUKAUMI Naoki <naoki@radxa.com>
> >
> > Provisionally applied to pci/for-linus, hoping to make v6.18-rc3.
> >
> > Happy to add any testing reports or amend as needed.
> 
> My build with your patch (on top of 6.18-rc2) just finished, so I
> installed it and rebooted into it.
> Happy to report that everything seems to be working fine and I can't
> find any errors, warnings or other messages with 'nvme' in dmesg that
> indicate sth could be wrong. IOW: it does indeed fix the issue I
> reported earlier. So feel free to add my:
> 
> Tested-by: Diederik de Haas <diederik@cknow-tech.com>

That's tremendous, thank you for all your help and testing!  I know 
it's frustrating and time consuming when things break, and I really
appreciate your reports and help.

Bjorn

