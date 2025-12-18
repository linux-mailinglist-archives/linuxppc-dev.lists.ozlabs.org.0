Return-Path: <linuxppc-dev+bounces-14858-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EADCCA8DE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 07:57:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dX1gq5b0Cz2xrM;
	Thu, 18 Dec 2025 17:57:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766041047;
	cv=none; b=Lche0ooXoeYrIiCdEcePkq3xFGMweDBtjrPvZjzhErEdPjc9o0vkZ5Ed02KNR2FNvDEbGnXm9NB//9ds9vJ3y0zI3ue9l1vJTngOTksS4MHVIEG7LwH/fJGn6iPqCz2f8nEIaZm7eFzK9QK4RF0XSSa6HnRdUGJgZY30exmdMDXVNnCmkQZztUa+UM8O83ystwZiKUYmtkkVLocSiplyOMuU2XLrhFit94qcxTtPDIPayR6hAXiV5s7BX2FNcWb9d5/DdVeBWZfuTtcoldBDIfntmqXc5olLOSrH+GRm309LUwRH8Sm9fuUc+TcLD3hPYZ+UMxfHylOAY57BVuZrBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766041047; c=relaxed/relaxed;
	bh=YAVukUh1CdOiy+xfPVNwz8tlXcnxdzzzzsj0xUfa888=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KzVxEHKrMJJzov/Ip5QARIa+Cnp/yXYEO3uaEfBkOEei2XNomoJOzNRviUfVBvoRjtZmRVprnGE9n7zyeXfSWecE7ghp+oeWRYj/ddwA2ThFlK4wZPiyZURtI+0bU38yBOzVC+9UzskZQ667c8Ros1pqVBAo+u67CqvhFOIhVFBQJtIljAqznm+zKlSCouZwaAJTrMRwNLbcOEg1Jl2KhTJ2YitmKKo7LtuLWquBLKUm2C5XcWjxjMOdQzxzBnE4g/Z8XchOTZa+vKD5m6hJxD3G6oVpXrk/FJz+sryOphvyLGAww8OhStFHt4w/qb1aeVmktyl9jMKintYO0lPqAA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kifJ2WFm; dkim-atps=neutral; spf=pass (client-ip=209.85.218.46; helo=mail-ej1-f46.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=kifJ2WFm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.46; helo=mail-ej1-f46.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dX1gp6PgSz2xS7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 17:57:26 +1100 (AEDT)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b7cee045187so49446366b.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 22:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766040984; x=1766645784; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YAVukUh1CdOiy+xfPVNwz8tlXcnxdzzzzsj0xUfa888=;
        b=kifJ2WFmUT22dFH5MQ8RBw11l9HTQsOzg3mZzUjfRxPJFc0GKEF2p2WxvsGZNH+AqB
         AoJ59RNd1vp2s0A/+E+O95sKdAmrOXWf+gt38Fqs7FOin0TqUKA3OwtpkhClvu9Qq+gE
         TNsWHg0SBy+IpWnUJ08N0dSQWKRP48U3tggv3kUqpQl2wnQpw2fo7IrQ/aY0c6tXgnm8
         2gwEq3Pjj55MF/tK5M4APAI0LzktcDe5Qe0QX7Wj4HSqUBqV1pQo/asS30IX+owcOmkd
         nR/Luo0bcbh5UaftH0yIhw/gBoFj3cKTvLgmOJa/tGesDBNG0tpn8O/8OPYYuUpnfnWr
         C7Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766040984; x=1766645784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YAVukUh1CdOiy+xfPVNwz8tlXcnxdzzzzsj0xUfa888=;
        b=O53LnfeM1bqRYmHJiKWUxWeyNez4XKfeI8Msb65E7JSTJUSBCaGidOyH4dAS1FE7jB
         Bb55sr0YI6bL8WbQEWY/c6gQn57jK5Wr3vW8+OVe+L4XfiUhh8A7eKR5pbZZn2CyvF6T
         i4cFjdot67S4DG2EFmUPg+V7ZNN7zlYtbT6b6hEXb+lf5GepBryn7fRaPoYSnwiWrzgS
         fbK0v3fPLfxg9tnpEQnJr0kw2/3sUzbMWVTXAu2yyuRceew0CEY8dKcSE/xIE87PmRyu
         K6d0lYVQnTKhtuyX62OHLHHxEaWYwySPdpHkya52DYsbnKoAv9OXwuAUMtNHcaRR1rWJ
         abdA==
X-Forwarded-Encrypted: i=1; AJvYcCUbCfjiv4vDuVc013dIN66sPLhtM2G9nonGNcMyrkw6J58LEeBRdrN8hXlOPKlGNkjdI8jWYu+DkWDOj5E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwOFIfIjm/l3TBSpKjKOZuA/mg0VHNwgopmmWQQSVs9KXs1Ew+d
	Ikbi0e3sr8GpFan7T1v9qbIaokgcnsDsEci5ms97dy6SzGa58MxnlS3lcS0Vl3zDnJRUJ9C3Hk8
	dWStnsy5zPIPTTdBkKvTGu1h5rZ3Uq80=
X-Gm-Gg: AY/fxX4ENjFs/8JSqkrsdruj/VvnoMF4anYs2b6jQ21La6d3iLoGM89UihpTe8OAXJy
	bEyVewbXUgGK14apXrl37l56XkDdkuGXwoXAb1zAdAWWofVlLRrTA7G3DrC7D42vTLdfVzrGnzz
	Du4e1/0RzF0zKJejXgCj4pvCp+Eharck67H+9ULequDhlZZ0qR0wQVkc4V2dMfr5rXHrZkzx8Ss
	W1JN+/MVf8sh3hSXEq9FhTgPyL9bx/HSDroIQqvXyAsWFuTvKTkXmAMuCSN1WFURc6eNGzYn01n
	WORSfw==
X-Google-Smtp-Source: AGHT+IHFwImRsm9W5Y58Yz5apb/espxQpExd3T9QEzf75EiWN/wCtlShDmcuZN7IAzuiQTmvNW7xlDPfmw1gINRTuvU=
X-Received: by 2002:a17:907:3f9f:b0:b76:3d56:f666 with SMTP id
 a640c23a62f3a-b80205ed2bdmr185161166b.26.1766040983515; Wed, 17 Dec 2025
 22:56:23 -0800 (PST)
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
References: <20251216071656.648412-1-chancel.liu@nxp.com>
In-Reply-To: <20251216071656.648412-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 18 Dec 2025 14:56:07 +0800
X-Gm-Features: AQt7F2p6BPzhm3Mw9s2b1rAKAfmA3zbdy7Nz3msDjejXjz_TkGWdEggdG6FTAGM
Message-ID: <CAA+D8APq+6E49pSuKs0yZ9F5+SaxQaSq5shsxSFztLROhyLCpw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: Use of_property_present() for
 non-boolean properties
To: Chancel Liu <chancel.liu@nxp.com>
Cc: Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sound@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 16, 2025 at 3:18=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> The use of of_property_read_bool() for non-boolean properties is
> deprecated in favor of of_property_present() when testing for property
> presence.
> Otherwise there'll be kernel warning:
> [   29.018081] OF: /sound-wm8962: Read of boolean property 'hp-det-gpios'=
 with a value.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl-asoc-card.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.=
c
> index 2c7eb0baa0f3..70a6159430ed 100644
> --- a/sound/soc/fsl/fsl-asoc-card.c
> +++ b/sound/soc/fsl/fsl-asoc-card.c
> @@ -1045,8 +1045,8 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
>          * The notifier is initialized in snd_soc_card_jack_new(), then
>          * snd_soc_jack_notifier_register can be called.
>          */
> -       if (of_property_read_bool(np, "hp-det-gpios") ||
> -           of_property_read_bool(np, "hp-det-gpio") /* deprecated */) {
> +       if (of_property_present(np, "hp-det-gpios") ||
> +           of_property_present(np, "hp-det-gpio") /* deprecated */) {
>                 ret =3D simple_util_init_jack(&priv->card, &priv->hp_jack=
,
>                                             1, NULL, "Headphone Jack");
>                 if (ret)
> @@ -1055,8 +1055,8 @@ static int fsl_asoc_card_probe(struct platform_devi=
ce *pdev)
>                 snd_soc_jack_notifier_register(&priv->hp_jack.jack, &hp_j=
ack_nb);
>         }
>
> -       if (of_property_read_bool(np, "mic-det-gpios") ||
> -           of_property_read_bool(np, "mic-det-gpio") /* deprecated */) {
> +       if (of_property_present(np, "mic-det-gpios") ||
> +           of_property_present(np, "mic-det-gpio") /* deprecated */) {
>                 ret =3D simple_util_init_jack(&priv->card, &priv->mic_jac=
k,
>                                             0, NULL, "Mic Jack");
>                 if (ret)
> --
> 2.50.1
>

