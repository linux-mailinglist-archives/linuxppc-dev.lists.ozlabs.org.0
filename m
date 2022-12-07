Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1FD6451E2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 03:18:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NRgtz1GV3z3bfM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Dec 2022 13:18:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rshxMWMb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rshxMWMb;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NRgt14MV8z2yyZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Dec 2022 13:17:45 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 49659611DD;
	Wed,  7 Dec 2022 02:17:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3596C433C1;
	Wed,  7 Dec 2022 02:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670379462;
	bh=lxh+qkWtrAkQD6FWNVfNsV2V1Ki+c1iwrz1a+xcetr0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=rshxMWMbp4jY5A3Nq2O5c7KmmaX6MZr80aizs8RFHHgf5gnyu5edJNDFxhhk7z7/Y
	 ckBIRqkHc0yxl7ApXxB+NTs8/dTIiruW8ELggtlnE7epcE0x7bWR2SWPuX8q5hf4fG
	 dVeJLhQrgpM5XWrCuJbWrbCcY5C5HrE7HmFyHyBM4pakwkMAj9Urz9TrRAWFu2d0QO
	 vvDb4UkZZXe0rhD+MGA6otPd8oBVuFRPrVns2+L6zwtkorJou3Z7aXhSdwdphbsaFU
	 wgJQBRZPAyOXQVs6C1I0uwvoGkcQl0R06amskDTpcv7UMC1TLnWflgELbrNjep7c4U
	 tyLzbSifoOr9A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <45463950-7a4f-758d-d6a1-b8fdf9bfd319@seco.com>
References: <20221027191113.403712-1-sean.anderson@seco.com> <20221027191113.403712-5-sean.anderson@seco.com> <20221027230331.19C2FC433D6@smtp.kernel.org> <5f00ede6-10f5-c11c-ee21-54460c1f98b0@seco.com> <d13ff3b2-79f0-2a72-c9da-2c310c4e3bb8@seco.com> <20221101201020.B6180C433C1@smtp.kernel.org> <45463950-7a4f-758d-d6a1-b8fdf9bfd319@seco.com>
Subject: Re: [PATCH v8 4/9] phy: fsl: Add Lynx 10G SerDes driver
From: Stephen Boyd <sboyd@kernel.org>
To: Kishon Vijay Abraham I <kishon@ti.com>, Sean Anderson <sean.anderson@seco.com>, Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org
Date: Tue, 06 Dec 2022 18:17:40 -0800
User-Agent: alot/0.10
Message-Id: <20221207021742.A3596C433C1@smtp.kernel.org>
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

Quoting Sean Anderson (2022-11-01 16:27:21)
> On 11/1/22 16:10, Stephen Boyd wrote:
> >>=20
> >> Oh, I remember why I did this. I need the reference clock for clk_hw_r=
ound_rate,
> >> which is AFAICT the only correct way to implement round_rate.
> >>=20
> >=20
> > Is the reference clk the parent of the clk implementing
> > clk_ops::round_rate()?
>=20
> Yes. We may be able to produce a given output with multiple reference
> rates. However, the clock API provides no mechanism to say "Don't ask
> for the parent clock to be rate X, you just tried it and the parent
> clock can't support it." So instead, we loop over the possible reference
> rates and pick the first one which the parent says it can round to.
>=20

Sorry, I'm lost. Why can't you loop over possible reference rates in
determine_rate/round_rate clk op here?
