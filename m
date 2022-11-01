Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8566152C3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 21:11:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N21PD28w0z3cRW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 07:11:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T1brwFuX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=sboyd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T1brwFuX;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N21NK3BGYz3bXR
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 07:10:25 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 18F6AB81F70;
	Tue,  1 Nov 2022 20:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6180C433C1;
	Tue,  1 Nov 2022 20:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667333420;
	bh=3VqrBkVtuQxqDzc/aj1Jgl+flir8+zN6FTD2olM8T/s=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=T1brwFuXzWmAaQFMZLc8FdCvqkid0cynIaZpBitP9ZcKrEouGfJy7XI6i63g6eQLa
	 H0B85Cc5Cq/h7//RqkF61/QkALDBGP9xtdnxJJr+Kqf+zEMszdvulfccjcnxW+YhZK
	 GPKywJYuIsn4TZBukirCzRTTyTqWyV9w9HB3JMANBxjpfyH6yi9qelxUJNYbnFpFGm
	 1QZP11XCBeaw9mE6kEoSc7QeGZZRVd33naDfTRTI8eNU7n+qowINjOPajv1Xr+Vs7P
	 0k0yYOZYiEe+eUl9j4/t6tH11Q+ztLLG1F5YRFPMHHLqTiiq1uvzOo5l70oQHbtzDi
	 gtNc7tYo9CzEQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d13ff3b2-79f0-2a72-c9da-2c310c4e3bb8@seco.com>
References: <20221027191113.403712-1-sean.anderson@seco.com> <20221027191113.403712-5-sean.anderson@seco.com> <20221027230331.19C2FC433D6@smtp.kernel.org> <5f00ede6-10f5-c11c-ee21-54460c1f98b0@seco.com> <d13ff3b2-79f0-2a72-c9da-2c310c4e3bb8@seco.com>
Subject: Re: [PATCH v8 4/9] phy: fsl: Add Lynx 10G SerDes driver
From: Stephen Boyd <sboyd@kernel.org>
To: Kishon Vijay Abraham I <kishon@ti.com>, Sean Anderson <sean.anderson@seco.com>, Vinod Koul <vkoul@kernel.org>, linux-phy@lists.infradead.org
Date: Tue, 01 Nov 2022 13:10:18 -0700
User-Agent: alot/0.10
Message-Id: <20221101201020.B6180C433C1@smtp.kernel.org>
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

Quoting Sean Anderson (2022-10-28 09:33:59)
> On 10/28/22 12:13, Sean Anderson wrote:
> > On 10/27/22 19:03, Stephen Boyd wrote:
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ref =3D devm_clk_get(dev, ref_n=
ame);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (IS_ERR(clk->ref)) {
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 ret =3D PTR_ERR(clk->ref);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 dev_err_probe(dev, ret, "could not get %s\n", ref_name);
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 goto out;
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>> +
> >>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 clk->ref =3D __clk_get_hw(ref);
> >>
> >> Please don't use __clk_get_hw() for this. Instead use struct
> >> clk_parent_data and set a DT index in the index member to map to this
> >> clk.
> >=20
> > OK
>=20
> Oh, I remember why I did this. I need the reference clock for clk_hw_roun=
d_rate,
> which is AFAICT the only correct way to implement round_rate.
>=20

Is the reference clk the parent of the clk implementing
clk_ops::round_rate()?
