Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB3367DEB6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 08:53:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P38wL1Mqbz3fJF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 18:53:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CsR2RWjX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=shawnguo@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CsR2RWjX;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P38vL5B39z3ch3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 18:53:02 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E770961A15;
	Fri, 27 Jan 2023 07:52:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55717C433EF;
	Fri, 27 Jan 2023 07:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674805978;
	bh=VBAppkMJFtAu58j7X9LUIoG4yxGDA5AuNKS3v4F8NoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CsR2RWjXnB1vEIsEa7Mq8ccjrHR5N1s09H1lCu/LSTfybB+I+7hvlMBV7gxmoN8/c
	 xgU58GTVDT8jRKQFWo2WrReBeKtvnfpRC5yZpspFuF6ptJLEE4DdGU8bKhQi/QbRfQ
	 8BH+SxD3XS8fDdXNj5LOzRYJ2DSMPE/khDNag1UI8ZjX3oG+ozYSvbqgp/LgMeV5DI
	 VrULfdY6lRRzfvyb6ecP0LEoRav09SGsaruzP7enZYMI/MfZVAcz+K8R/aeKb4IqM8
	 kFu661L8uS/u4/V9B0sEFIT8TXfYHmevFy+Qk/XS75nVrTs63qdTIWj2RkTLt5xuUq
	 X0Jr5tOaX7BjA==
Date: Fri, 27 Jan 2023 15:52:49 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v9 07/10] arm64: dts: ls1046ardb: Add serdes bindings
Message-ID: <20230127075248.GL20713@T480>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
 <20221230000139.2846763-8-sean.anderson@seco.com>
 <20230125234335.GC20713@T480>
 <8074f0be-8a70-a937-49f2-123e0bfc6218@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8074f0be-8a70-a937-49f2-123e0bfc6218@seco.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Li Yang <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 26, 2023 at 11:48:53AM -0500, Sean Anderson wrote:
> On 1/25/23 18:43, Shawn Guo wrote:
> > On Thu, Dec 29, 2022 at 07:01:36PM -0500, Sean Anderson wrote:
> >> This adds appropriate bindings for the macs which use the SerDes. The
> >> 156.25MHz fixed clock is a crystal. The 100MHz clocks (there are
> >> actually 3) come from a Renesas 6V49205B at address 69 on i2c0. There is
> >> no driver for this device (and as far as I know all you can do with the
> >> 100MHz clocks is gate them), so I have chosen to model it as a single
> >> fixed clock.
> >> 
> >> Note: the SerDes1 lane numbering for the LS1046A is *reversed*.
> >> This means that Lane A (what the driver thinks is lane 0) uses pins
> >> SD1_TX3_P/N.
> >> 
> >> Because this will break ethernet if the serdes is not enabled, enable
> >> the serdes driver by default on Layerscape.
> >> 
> >> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> >> ---
> >> This depends on [1].
> >> 
> >> [1] https://lore.kernel.org/netdev/20220804194705.459670-4-sean.anderson@seco.com/
> >> 
> >> Changes in v9:
> >> - Fix name of phy mode node
> >> - phy-type -> fsl,phy
> >> 
> >> Changes in v8:
> >> - Rename serdes phy handles to use _A, _B, etc. instead of _0, _1, etc.
> >>   This should help remind readers that the numbering corresponds to the
> >>   physical layout of the registers, and not the lane (pin) number.
> >> 
> >> Changes in v6:
> >> - XGI.9 -> XFI.9
> >> 
> >> Changes in v4:
> >> - Convert to new bindings
> >> 
> >>  .../boot/dts/freescale/fsl-ls1046a-rdb.dts    | 112 ++++++++++++++++++
> >>  drivers/phy/freescale/Kconfig                 |   1 +
> > 
> > The phy driver Kconfig change shouldn't be part of this patch.
> 
> I put it here for bisectability, since this is the point where we need
> to enable it. But I can do this in a separate patch if you want.

From DT ABI perspective, it's already broken anyway if you need to change
kernel and DT atomically.

Shawn
