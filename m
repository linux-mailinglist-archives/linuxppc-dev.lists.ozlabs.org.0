Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC09879F97D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 06:17:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OHacR4px;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmPD44Zzcz3cGk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 14:17:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=OHacR4px;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmPCD1lpPz3bT8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 14:16:23 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-577fb90bbebso129171a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 21:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694664980; x=1695269780; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8puwwYQ2UBHFNT37XGmqgv1DiqsgZEnUlgOGxcY1CkI=;
        b=OHacR4pxDoJ2J0i527aYcxBcRx6cGUca4rl2m/caKCwecYRi5JPt+yERNluSYXVTrK
         IkQdaUNhYsvb+yhQb+cPTufGiKsczbYfT3YbUe7alaFxniCYzfkXoikPgwxS+7Folqar
         da/1J3UzjKglORKveDTPXWSZwhAdyLhjr4/t2JQCtcCLjgm0vgD+trHbrjiZOKQnqQnP
         zd/YCEwDLf6cEGgLWiS2Qyv18Cn3pRqi0GoQGpih5cwAaBbi0pQ0wAEkfLshoFp91Z3M
         PuHc7NENrVRv3e7+ArhJGaAJ04SwD03wtoMhD0YpjhN7XVFR37NTJJikh8ITTrL4ASJl
         1pbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694664980; x=1695269780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8puwwYQ2UBHFNT37XGmqgv1DiqsgZEnUlgOGxcY1CkI=;
        b=aHuz0wUlsYlWCpCxW1uMvuHPfhiJkZRsEuZ8DjnUfqmrbhdq+HlS9ZTp0nbF0HZ5RX
         l3lqJmLcCRTevq9vN2H9x20bxvlJEiAyNCCPi/JLZ514t7ZKtgv+GTYlC7pm29HC059y
         hf83z8cBKfaHSvLZl4qgg46cchUD0zhB7oItG0Cf8d04sEuho26apmvin6B2jdpzO/TW
         fW+5V6mwq4ZaAYopzr/YdgpNRVM84fLiQaxvLLPZ+BXhAvxs/otpRddJljZ9oonTPTs1
         uk66arnF7WXyOJ5BQBHDqEv9wlVumjaMJVCygtKb29DGWD0UME3bzEDRCqigC4Haz3BB
         xtIw==
X-Gm-Message-State: AOJu0Yywb461g9w8tNOq9dlgKb9KTsl5251vHT2EEPXT77xso7DYqxJw
	hyShVz1WRRHNn9HJT8iK3yCBvceYWt0ZAq4jGm8=
X-Google-Smtp-Source: AGHT+IG1H/excJAZALaS7Szk8UIlXc6WBaAkKS8RGfBe1uXqguojuCxZhqPLQuUcfrs4/2j7RKsHN6OjN5qPo+LU23U=
X-Received: by 2002:a05:6a21:4886:b0:13a:e955:d958 with SMTP id
 av6-20020a056a21488600b0013ae955d958mr4295356pzc.7.1694664979937; Wed, 13 Sep
 2023 21:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230913102656.2966757-1-chancel.liu@nxp.com>
In-Reply-To: <20230913102656.2966757-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 14 Sep 2023 12:16:08 +0800
Message-ID: <CAA+D8ANDcxY_SZ0qNax7LvkJj_yaY5syzEc6RoOmxjYEut0NOw@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: imx-rpmsg: Set ignore_pmdown_time for dai_link
To: Chancel Liu <chancel.liu@nxp.com>
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, shawnguo@kernel.org, s.hauer@pengutronix.de, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, kernel@pengutronix.de, festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 13, 2023 at 6:27=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> i.MX rpmsg sound cards work on codec slave mode. MCLK will be disabled
> by CPU DAI driver in hw_free(). Some codec requires MCLK present at
> power up/down sequence. So need to set ignore_pmdown_time to power down
> codec immediately before MCLK is turned off.
>
> Take WM8962 as an example, if MCLK is disabled before DAPM power down
> playback stream, FIFO error will arise in WM8962 which will have bad
> impact on playback next.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu
> ---
>  sound/soc/fsl/imx-rpmsg.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
> index 3c7b95db2eac..b578f9a32d7f 100644
> --- a/sound/soc/fsl/imx-rpmsg.c
> +++ b/sound/soc/fsl/imx-rpmsg.c
> @@ -89,6 +89,14 @@ static int imx_rpmsg_probe(struct platform_device *pde=
v)
>                             SND_SOC_DAIFMT_NB_NF |
>                             SND_SOC_DAIFMT_CBC_CFC;
>
> +       /*
> +        * i.MX rpmsg sound cards work on codec slave mode. MCLK will be
> +        * disabled by CPU DAI driver in hw_free(). Some codec requires M=
CLK
> +        * present at power up/down sequence. So need to set ignore_pmdow=
n_time
> +        * to power down codec immediately before MCLK is turned off.
> +        */
> +       data->dai.ignore_pmdown_time =3D 1;
> +
>         /* Optional codec node */
>         ret =3D of_parse_phandle_with_fixed_args(np, "audio-codec", 0, 0,=
 &args);
>         if (ret) {
> --
> 2.25.1
>
