Return-Path: <linuxppc-dev+bounces-13328-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1578C0CD59
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 11:01:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cw8CQ6NrZz3cQx;
	Mon, 27 Oct 2025 21:00:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761559250;
	cv=none; b=RyBGgeAtv6R/2fmJ4lPta+zoaFwiPQTAwhpFcmlVfJ6jDhna1QWJDerKYDZE4+sqVKKMb8fa1B2BrlUEyRtwer6bmA20u7zNwuYPLhV6VPKKMyGAfIGfqcGMc/BO+dcWYbmkwCYWAbbHJifkrs1S+wfuBsO0grlMYLHPFhAxwu9Ira5BI4/1AUd2cCfXlXKl9BcpuNIkV6bVg2aFk4bb+nRHHBO9TwSV6hrwt9D+bHhcTWwbcLR1Qu4F4HyXfNy60oMjrz/IWU+U+dTvxwZuYBTpb3r85nIkfHgjfsqCEib3AyGN6KbZB0UAgjXlOCxxtiRvw1+iZkyQYgyk7RyG2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761559250; c=relaxed/relaxed;
	bh=rvXBCmXW5mkDfE9EkLATYtspFeIHpvmzsPxDiZ+vorQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZR+C5BJ2tdzMIPnXUavYNApic8FYZu4l5lMoURxuFQo9CPnIAGdodMbpoS+zoMVV4SohkGuR3PEe/VulOrGGZsGTTXPaGaUeNnGYonCnoXkdaM+Y6ee44vx4Vxs1ZeItR6Pmglk9uojrOYddpUzfjg9I+JhlKPXdwTtugCOeSURMo8iO+SaAwRq4NmVTjNGk4fn1UHZweRIbyAZ7g5Y4tTJd5vWqzPu/3X+kI7Mp0mLF+Fjr1MpUFpXJVGEq81/VOTFcJGHFykDsrRkfYy+z0GMJREuJCS+X82bOh7I2dJhfOBFYS03HqQ0NXHTQKlWIg7klVj8RNrhycDjxGHmm3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FjOEetGk; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=johan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FjOEetGk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=johan@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cw8CP6Zgjz3c5y
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 21:00:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8488E440F0;
	Mon, 27 Oct 2025 10:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630C5C4CEF1;
	Mon, 27 Oct 2025 10:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761559246;
	bh=g9zJBVbnGEA4HG5ooeAzLqX41v1JBzQYQqje6z0ZFx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FjOEetGk9z+CDj6SBDLC3q333GF293fQKVJYDxwd4mFRcpbAl5zochz9FDKgGXH41
	 C5NRL9OOCswq2yBRA6VHx3wscWweZ5DCaKaPIH+HHx/G4CaumZAeuXnNr02lCnLaNt
	 0u3Q6m6HIXhBzojPGbamjXnF6syyixBeTP2ELdZIXKF57uNaQ4j+zkFqL2yE/ntjp9
	 YuDgQWShi2tiOWYKMe9d7vS/L8nUsx7hVtEztKXt23ww/a9+ruGWrVBgoz+xQ8oMH/
	 0bpfLGMt0Aw25SodjvjPRL/V98oy3OoGYxOsN+ts241fDcOxW4UNcSoWjMtbFF1lEx
	 Ykf+RTgh70YQQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vDK1w-000000006Yg-38Bu;
	Mon, 27 Oct 2025 11:00:49 +0100
Date: Mon, 27 Oct 2025 11:00:48 +0100
From: Johan Hovold <johan@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linux-pci@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	Christian Zigotzky <chzigotzky@xenosoft.de>,
	FUKAUMI Naoki <naoki@radxa.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Dragan Simic <dsimic@manjaro.org>, linuxppc-dev@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Lin <shawn.lin@rock-chips.com>, Frank Li <Frank.li@nxp.com>
Subject: Re: [PATCH] PCI/ASPM: Enable only L0s and L1 for devicetree platforms
Message-ID: <aP9C0H_2XVk6MiLV@hovoldconsulting.com>
References: <aPuZQRaTN2tAwkb5@hovoldconsulting.com>
 <20251024203924.GA1361677@bhelgaas>
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
In-Reply-To: <20251024203924.GA1361677@bhelgaas>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 24, 2025 at 03:39:24PM -0500, Bjorn Helgaas wrote:
> On Fri, Oct 24, 2025 at 05:20:33PM +0200, Johan Hovold wrote:
> > On Fri, Oct 24, 2025 at 05:12:38PM +0200, Johan Hovold wrote:

> > > Note that this will regress ASPM on Qualcomm platforms further by
> > > disabling L1SS for devices that do not use pwrctrl (e.g. NVMe). ASPM
> > > with pwrctrl is already broken since 6.15. [1]
> > 
> > Actually, the 6.15 regression was fixed in 6.18-rc1 by the offending
> > commit, but pwrctrl devices will now also regress again.
> > 
> > > Reverting also a729c1664619 ("PCI: qcom: Remove custom ASPM enablement
> > > code") should avoid the new regression until a proper fix for the 6.15
> > > regression is in place.
> 
> Help me think through this.  I just sent a pull request [2] that
> includes df5192d9bb0e ("PCI/ASPM: Enable only L0s and L1 for
> devicetree platforms").  If all goes well, v6.18-rc3 will enable L0s
> and L1 (but not L1SS) on Qualcomm platforms.
> 
> IIUC, if we then revert a729c1664619 ("PCI: qcom: Remove custom ASPM
> enablement code"), it will enable L1SS again, but since this is done
> in a dw_pcie_host_ops .post_init() hook, L1SS will only be enabled for
> devices powered on at qcom-pcie probe time.  It will *not* be enabled
> for pwrctrl devices because .post_init() was run when those devices
> were powered off.

Correct.

> I think this is the same as in v6.17.  v6.18-rc1 enabled L1SS for
> everything, including pwrctrl devices, because it was done in the PCI
> enumeration path, not the host controller probe path.  I think that
> enumeration is the right place to do this, but we need to figure out
> how to do it in a generic way.  At a minimum, we need to know that
> CLKREQ# is supported, and some platforms like dw-rockchip also need
> device-specific configuration [3].
> 
> Bottom line, I think we need to revert a729c1664619 for v6.18 to get
> all ASPM states including L1SS enabled on Qualcomm platforms for
> non-pwrctrl devices.  I'll post a patch for this.

Right, that would at least restore the 6.17 state of things with respect
to Qualcomm machines.
 
> Then try to figure out how to make this work for pwrctrl devices for
> v6.19.  Does this sound right?

Yes, unless you can come up with a simple way to enable L1SS during
enumeration on Qualcomm platforms, for example, using a driver callback
that returns true for platforms using the 1.9.0 ops to indicate that
L1SS is supported. That should address also the 6.15 pwrctrl regression.

Johan

