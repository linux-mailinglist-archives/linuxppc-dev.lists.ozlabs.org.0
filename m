Return-Path: <linuxppc-dev+bounces-13287-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB0CC06EE3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 17:20:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctRRg2nG6z3cZL;
	Sat, 25 Oct 2025 02:20:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761319231;
	cv=none; b=AkGWA5RHurmEd7DqmhnmNXvqOJPFx5DQ20YLVJOxZ8jwuW8b59YVn9lcGM+ChPjqjXUmqkf/cqDebWzdfDwDKv/a5LnRlZDzjEp3kOKK2IusUsM38NNmQLj1lld4uKSWeLAVnnI5n5x3rx6L23Sekzr6R0b/RdTspKnrrGZS0J8YLMmkclIw7rTcI/Vv5LPx2nAOlDOj/BkqqWmhq98FE+7M/VjjV1GhtlGp0U9PAG+Pb9FR7B72khqbA0EG0WNCRxVih80Iravn0XBgAUA8Nd/dfZ0vZn3RVzTCZkOsGBC0f/r6smIYSWkGXjPZWE64FdpFGkT392pF4RnfC8qPQg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761319231; c=relaxed/relaxed;
	bh=0B1p6svtLOmgQ+9ck2lRafwl/wz0jGeJoMjCsZpcUfc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIT1S1bggYehppYFuS9RvZLkbHzElrYFGitdneP63dbU8Ipq39tqnSajE06R8J8y32/NHIyI83inwbbe/qZS/j3lBuL+NuB3W8oyKKs5CsVUQ74MlC/TvlThRU4dHVAOPxg/b8s2LDXJxlcbjnoitTjDKCMYu87CcF1+H4uGAnrchO7q9tW8pu3mm+xj3msb0Hy7Cd8hc5exYQXVeQaSw3bYFznBsUOTqpMBg3SrviV5fGN7XOqMpiuSdzCpjCsI7VGDHgXGpk0g3OX/rCgwnYxSAT3ZQhxi962pkfZi1MexIj9x+78s+C7qSyS3AOvqXTXPGkn0IuoNBKHW6RzW8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NGUsf/Vb; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=johan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NGUsf/Vb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=johan@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctRRf4S8jz3btw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Oct 2025 02:20:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EDA59456F2;
	Fri, 24 Oct 2025 15:20:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE237C4CEF1;
	Fri, 24 Oct 2025 15:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761319226;
	bh=n5BEv7tANXuEeHLRiXCQjQbiBaE91Lb87LGC2gdxV0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NGUsf/VbMr2BwAimYh6NTwmgavBP72r0G6D+vLaMYigU+2+nH7MUlivK4RJuChuZp
	 xZ12OeBKaEElwRy34Dw9eaPIER0IgnB3Ai9vo3FnbQBwIZIFGG7WCcpxQakNobzlhz
	 NNcngL+ZI2dqWBAh5mHGIrWPsVvX51zKYDn2lWq3nlbMQAfXOIf2fXSbD4niC42B7a
	 CSNwxQqgVIuGpGB0WfwT3RBQGiFs3w46Pd2KmSG2lBuH3CzkpY0eWICQYg4Sh6qoSv
	 jaFQaAM1sR76uspjFTfjnmC6LtQJdc24DiF1O7zcgnxDcKw3lND5+3j5P5wiT4OeUx
	 Ga8L3Iu/gwg4Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vCJaj-000000004RQ-3bNr;
	Fri, 24 Oct 2025 17:20:33 +0200
Date: Fri, 24 Oct 2025 17:20:33 +0200
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
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH] PCI/ASPM: Enable only L0s and L1 for devicetree platforms
Message-ID: <aPuZQRaTN2tAwkb5@hovoldconsulting.com>
References: <20251023180645.1304701-1-helgaas@kernel.org>
 <aPuXZlaawFmmsLmX@hovoldconsulting.com>
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
In-Reply-To: <aPuXZlaawFmmsLmX@hovoldconsulting.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 24, 2025 at 05:12:38PM +0200, Johan Hovold wrote:
> On Thu, Oct 23, 2025 at 01:06:26PM -0500, Bjorn Helgaas wrote:
> > From: Bjorn Helgaas <bhelgaas@google.com>
> > 
> > f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree
> > platforms") enabled Clock Power Management and L1 PM Substates, but those
> > features depend on CLKREQ# and possibly other device-specific
> > configuration.  We don't know whether CLKREQ# is supported, so we shouldn't
> > blindly enable Clock PM and L1 PM Substates.
> > 
> > Enable only ASPM L0s and L1, and only when both ends of the link advertise
> > support for them.
> > 
> > Fixes: f3ac2ff14834 ("PCI/ASPM: Enable all ClockPM and ASPM states for devicetree platforms")
> > Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> > Link: https://lore.kernel.org/r/db5c95a1-cf3e-46f9-8045-a1b04908051a@xenosoft.de/
> > Reported-by: FUKAUMI Naoki <naoki@radxa.com>
> > Closes: https://lore.kernel.org/r/22594781424C5C98+22cb5d61-19b1-4353-9818-3bb2b311da0b@radxa.com/
> > Reported-by: Herve Codina <herve.codina@bootlin.com>
> > Link: https://lore.kernel.org/r/20251015101304.3ec03e6b@bootlin.com/
> > Reported-by: Diederik de Haas <diederik@cknow-tech.com>
> > Link: https://lore.kernel.org/r/DDJXHRIRGTW9.GYC2ULZ5WQAL@cknow-tech.com/
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > Tested-by: FUKAUMI Naoki <naoki@radxa.com>
> > ---
> > I intend this for v6.18-rc3.
> 
> Note that this will regress ASPM on Qualcomm platforms further by
> disabling L1SS for devices that do not use pwrctrl (e.g. NVMe). ASPM
> with pwrctrl is already broken since 6.15. [1]

Actually, the 6.15 regression was fixed in 6.18-rc1 by the offending
commit, but pwrctrl devices will now also regress again.

> Reverting also a729c1664619 ("PCI: qcom: Remove custom ASPM enablement
> code") should avoid the new regression until a proper fix for the 6.15
> regression is in place.
 
Johan

> [1] https://lore.kernel.org/lkml/aH4JPBIk_GEoAezy@hovoldconsulting.com/

