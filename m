Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F61A7053EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 May 2023 18:33:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLMHQ0TBrz3fGF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 02:33:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fKNjkRfh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fKNjkRfh;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLMGW1qvhz3f5V
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 02:32:35 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3510860C92;
	Tue, 16 May 2023 16:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40F7C433EF;
	Tue, 16 May 2023 16:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684254751;
	bh=Aks6nwZaqr/erbBLhafFwZ3Ao9Igx6TSOjyOocCTwx4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fKNjkRfh2IVi0irTeZRo60pDLVfhgKSKiKNVfF+RjDoxU93FsClkrJbOFfjLbBSSD
	 ygo100c/a33dEf2nLNK71x35ZLvsQtvbKBm60lk9ioQ1TXBhlW+r3Cjcc8KEBRqHdG
	 MJXMeCRksIp3AnANmyHayxIKVOCShrP8Gq/0ov1SMm+9UVsG3SttBSWX0M/ygL+bLS
	 frjkaXmI4j6R+gYrFju+Gej/Osl79LU8qyKIgVkW/Ij7H1yqw0459Iw51oo+MTKluV
	 4WHzDsNZ1B8X45Z8bqmkaAqIjS2IBovcqn7q8dnQkvmvNm/+pRlbJewCaZVIbtMovn
	 CjImkg1ExKgXA==
Date: Tue, 16 May 2023 22:02:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v14 06/15] clk: Add Lynx 10G SerDes PLL driver
Message-ID: <ZGOwGypfqeHsP6V0@matsya>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
 <20230413160607.4128315-7-sean.anderson@seco.com>
 <ZFi9t84UoIfUyHhi@matsya>
 <1012f955-180e-0013-cc13-1da10991b5f5@seco.com>
 <ZFpD4I2LK9YIQQat@matsya>
 <d230c641-7270-c768-fd48-9012c01621b2@seco.com>
 <ZGODpt7MARD47us7@matsya>
 <7ad1089f-106d-e355-5558-f06f8b428f34@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ad1089f-106d-e355-5558-f06f8b428f34@seco.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 16-05-23, 11:11, Sean Anderson wrote:
> On 5/16/23 09:22, Vinod Koul wrote:
> > On 09-05-23, 11:26, Sean Anderson wrote:
> >> On 5/9/23 09:00, Vinod Koul wrote:
> >> > On 08-05-23, 11:31, Sean Anderson wrote:
> >> >> On 5/8/23 05:15, Vinod Koul wrote:
> >> > 
> >> >> >> +int lynx_clks_init(struct device *dev, struct regmap *regmap,
> >> >> >> +		   struct clk *plls[2], struct clk *ex_dlys[2], bool compat);
> >> >> > 
> >> >> > so you have an exported symbol for clk driver init in phy driver header?
> >> >> > can you please explain why..?
> >> >> 
> >> >> So that it can be called at the appropriate time during the phy's probe function.
> >> >> 
> >> >> This is really an integral part of the phy driver, but I was directed to split it
> >> >> off and put it in another subsystem's directory.
> >> > 
> >> > That is right clock should be belong to clk driver. IIUC the hardware is
> >> > phy along with clocks and you are doing the clk init. I think that may
> >> > not be correct model, you should really have a device tree node to
> >> > represent the clock and the phy node
> >> > 
> >> > 
> >> > What stops this from being modelled as it is in the hardware?
> >> 
> >> It *is* modeled as it is in hardware. With just the serdes compatible,
> >> we have all the information we need to create the clocks. So we do so.
> >> There's no need for a separate device just to create four clocks.
> >> 
> >> These clocks cannot be used by any other device (except possibly by
> >> putting a lane into test mode). So there is no benefit from making them
> >> a separate device, except an increase in complexity due to ordering and
> >> dynamic lookup. By doing things this way we know that either there was
> >> an error or the clocks all exist, and the lifetime of the clocks matches
> >> the serdes.
> > 
> > Okay that does makes sense.
> > 
> > In that case why should this not be in the phy driver itself. There are
> > already few examples og phy drivers having inbuild clk where is makes
> > sense. You register the clk_ops as part of phy driver
> 
> You told me to do it this way

I agree that was not the right recommendation back then and your view
was right

-- 
~Vinod
