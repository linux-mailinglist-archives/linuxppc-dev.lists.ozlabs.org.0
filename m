Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF03E6B9F72
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 20:16:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PbjtD4SvRz3chy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Mar 2023 06:16:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AaUuJdXq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AaUuJdXq;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PbjsG4L2jz3c9L
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Mar 2023 06:15:14 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CB15E6196B
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 19:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D8C7C433D2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 19:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678821310;
	bh=/o++2orgkh0eYVR24mG2HNDYYvTQagQPn7YxqtJRIGM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AaUuJdXqBz2wD2+pigNv1M+JVWe5xODO9VxTxUd4aLjy5mCQvrOfhQqrOiPr41Mcc
	 Fug1HBHcIIMDAMMKE9cSbdxBI7kYpcEEcL37losC8aDxPRPBC9TBOKZOVKB8Sydlnw
	 YbuO+EI9GEXlu7AR6fdYdZw466ueBTgclLmcdYWCvHI/dCS3VSc664HKfOHAbnYUNO
	 Knpr0IPM4z3UErIDXV/VKXyBRi2aeLFG/9oK2FIVaiQ4yUkesVkva9iq4cnkgg445T
	 BuJbmG8nB1vKaB8k5pbR0zlO0hokXIR6Not1fW9/54Elhd5mKg3+Cb3ZiCWdelVDJK
	 adSrMhuIgO4EQ==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5418c2b8ef2so156753127b3.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 12:15:10 -0700 (PDT)
X-Gm-Message-State: AO0yUKVJqax5ml6F9ir3Esm4W469Qn2jw/Ils5yBsMQ1+czojTKT3YVM
	mMkvngcbJsbcAVvj29vh9yaUqShs0bYxFjDP5w==
X-Google-Smtp-Source: AK7set+w7Dteu6Gz2fQIttAdFvbMZqpID4AHKHx68t3xQwsHx6BtKsv/C7yfYxJySG1yjFVS7BCS5PCUX/PHC6Xr3l0=
X-Received: by 2002:a67:b142:0:b0:41b:dc0c:a668 with SMTP id
 z2-20020a67b142000000b0041bdc0ca668mr25692104vsl.7.1678821289005; Tue, 14 Mar
 2023 12:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230310144718.1544169-1-robh@kernel.org> <ZAxrBtNdou28yPPB@corigine.com>
In-Reply-To: <ZAxrBtNdou28yPPB@corigine.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 14 Mar 2023 14:14:37 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJTsgmdwZZTfcMRnqaUfCNbgjO2mshxtAQK-qwoFqwCyw@mail.gmail.com>
Message-ID: <CAL_JsqJTsgmdwZZTfcMRnqaUfCNbgjO2mshxtAQK-qwoFqwCyw@mail.gmail.com>
Subject: Re: [PATCH] net: Use of_property_read_bool() for boolean properties
To: Simon Horman <simon.horman@corigine.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Shenwei Wang <shenwei.wang@nxp.com>, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Zhao Qiang <qiang.zhao@nxp.com>, Michal Simek <michal.simek@xilinx.com>, Jose Abreu <joabreu@synopsys.com>, Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Francois Romieu <romieu@fr.zoreil.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Kalle Valo <kvalo@kernel.org>, Wolfgang Grandegger <wg@grandegger.com>, devicetree@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, linux-can@vger.kernel.org, Claudiu Manoil <claudiu.manoil@nxp.com>, Marc Kleine-Budde <mkl@pengutronix.de>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradea
 d.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, "David S. Miller" <davem@davemloft.net>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Wei Fang <wei.fang@nxp.com>, Samuel Mendoza-Jonas <sam@mendozajonas.com>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 11, 2023 at 5:50=E2=80=AFAM Simon Horman <simon.horman@corigine=
.com> wrote:
>
> On Fri, Mar 10, 2023 at 08:47:16AM -0600, Rob Herring wrote:
> > It is preferred to use typed property access functions (i.e.
> > of_property_read_<type> functions) rather than low-level
> > of_get_property/of_find_property functions for reading properties.
> > Convert reading boolean properties to to of_property_read_bool().
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Reviewed-by: Simon Horman <simon.horman@corigine.com>
>
> ...
>
> > diff --git a/drivers/net/ethernet/via/via-velocity.c b/drivers/net/ethe=
rnet/via/via-velocity.c
> > index a502812ac418..86f7843b4591 100644
> > --- a/drivers/net/ethernet/via/via-velocity.c
> > +++ b/drivers/net/ethernet/via/via-velocity.c
> > @@ -2709,8 +2709,7 @@ static int velocity_get_platform_info(struct velo=
city_info *vptr)
> >       struct resource res;
> >       int ret;
> >
> > -     if (of_get_property(vptr->dev->of_node, "no-eeprom", NULL))
> > -             vptr->no_eeprom =3D 1;
> > +     vptr->no_eeprom =3D of_property_read_bool(vptr->dev->of_node, "no=
-eeprom");
>
> As per my comment on "[PATCH] nfc: mrvl: Use of_property_read_bool() for
> boolean properties".
>
> I'm not that enthusiastic about assigning a bool value to a field
> with an integer type. But that is likely a topic for another patch.
>
> >       ret =3D of_address_to_resource(vptr->dev->of_node, 0, &res);
> >       if (ret) {
>
> ...
>
> > diff --git a/drivers/net/wan/fsl_ucc_hdlc.c b/drivers/net/wan/fsl_ucc_h=
dlc.c
> > index 1c53b5546927..47c2ad7a3e42 100644
> > --- a/drivers/net/wan/fsl_ucc_hdlc.c
> > +++ b/drivers/net/wan/fsl_ucc_hdlc.c
> > @@ -1177,14 +1177,9 @@ static int ucc_hdlc_probe(struct platform_device=
 *pdev)
> >       uhdlc_priv->dev =3D &pdev->dev;
> >       uhdlc_priv->ut_info =3D ut_info;
> >
> > -     if (of_get_property(np, "fsl,tdm-interface", NULL))
> > -             uhdlc_priv->tsa =3D 1;
> > -
> > -     if (of_get_property(np, "fsl,ucc-internal-loopback", NULL))
> > -             uhdlc_priv->loopback =3D 1;
> > -
> > -     if (of_get_property(np, "fsl,hdlc-bus", NULL))
> > -             uhdlc_priv->hdlc_bus =3D 1;
> > +     uhdlc_priv->tsa =3D of_property_read_bool(np, "fsl,tdm-interface"=
);
>
> Here too.

These are already bool. Turns out the only one that needs changing is
no_eeprom. netdev folks marked this as changes requested, so I'll add
that in v2.

Rob
