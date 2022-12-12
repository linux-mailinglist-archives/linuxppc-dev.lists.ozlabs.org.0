Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B4264AB9F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 00:38:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NWJ2x50mFz3bjl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Dec 2022 10:38:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JqE69Luc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=JqE69Luc;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NWJ1z4Mlhz300l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Dec 2022 10:37:11 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1204C61281;
	Mon, 12 Dec 2022 23:37:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C419C433D2;
	Mon, 12 Dec 2022 23:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670888226;
	bh=Djj37c4gGhHcy/TCgXVD2eUrZ4pas0KvVlsKKNOhTNQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=JqE69LucO9qZIWAElN4CUCwwAlIBQJxrkL1lTmaYO/UObCARO+ktTV5RySUi3LCB5
	 7YsLSUmFNNzZl4JewOsbhOvKiKjM0RHsfIuUPfKAbs+Y0mVLq7NFuK9DKtRvBBqbVg
	 g917KtwjIY2YE0OBF5Udwyf90w+WByk9dUB+vR47v8BuJsrh7ZaUEWK/SHJVeHudyc
	 0weqMuFrEYAtB9hs/Y0NVpzzfGkDLm6R7QMW09zo1IbcO9ljJkGj2XrSdc5USpUoMs
	 x+dle18vHpIq8mAvzbihUE4xM/Q2P16omsQBYQeQVpTTMKO9McXduXtcCQhbUhU5Gm
	 A8S6LgCd3pEqQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <8b42763d-5fc3-3853-c421-227494c0144a@seco.com>
References: <20221027191113.403712-1-sean.anderson@seco.com> <20221027191113.403712-5-sean.anderson@seco.com> <20221027230331.19C2FC433D6@smtp.kernel.org> <5f00ede6-10f5-c11c-ee21-54460c1f98b0@seco.com> <d13ff3b2-79f0-2a72-c9da-2c310c4e3bb8@seco.com> <20221101201020.B6180C433C1@smtp.kernel.org> <45463950-7a4f-758d-d6a1-b8fdf9bfd319@seco.com> <20221207021742.A3596C433C1@smtp.kernel.org> <8b42763d-5fc3-3853-c421-227494c0144a@seco.com>
Subject: Re: [PATCH v8 4/9] phy: fsl: Add Lynx 10G SerDes driver
From: Stephen Boyd <sboyd@kernel.org>
To: Kishon Vijay Abraham I <kishon@ti.com>, Sean Anderson <sean.anderson@seco.com>, Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org
Date: Mon, 12 Dec 2022 15:37:04 -0800
User-Agent: alot/0.10
Message-Id: <20221212233706.6C419C433D2@smtp.kernel.org>
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
Cc: devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Michael Turquette <mturquette@baylibre.com>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Quoting Sean Anderson (2022-12-08 07:36:45)
> On 12/6/22 21:17, Stephen Boyd wrote:
> > Quoting Sean Anderson (2022-11-01 16:27:21)
> >> On 11/1/22 16:10, Stephen Boyd wrote:
> >> >>=20
> >> >> Oh, I remember why I did this. I need the reference clock for clk_h=
w_round_rate,
> >> >> which is AFAICT the only correct way to implement round_rate.
> >> >>=20
> >> >=20
> >> > Is the reference clk the parent of the clk implementing
> >> > clk_ops::round_rate()?
> >>=20
> >> Yes. We may be able to produce a given output with multiple reference
> >> rates. However, the clock API provides no mechanism to say "Don't ask
> >> for the parent clock to be rate X, you just tried it and the parent
> >> clock can't support it." So instead, we loop over the possible referen=
ce
> >> rates and pick the first one which the parent says it can round to.
> >>=20
> >=20
> > Sorry, I'm lost. Why can't you loop over possible reference rates in
> > determine_rate/round_rate clk op here?
>=20
> This is what I do currently, but you need to have the parent clock to do
> so. With your suggested method, we never actually get a struct clk(_hw)
> which we can query for rate support.

The clk_hw for the parent is given to the determine_rate clk_op in the
clk_rate_request structure. It's stored in the best_parent_hw pointer
when the determine_rate function is called. Does that work for you?
