Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 639C879DE07
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 03:59:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=g/DcLjiq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlkCw1VzVz3cPm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 11:59:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=g/DcLjiq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlkC16b49z3bd6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 11:58:52 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-26f4bc74131so344671a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 18:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694570329; x=1695175129; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWYBlc9fX+NrYYXcR1aoALLzzFrwI8piW2a3vusS9vc=;
        b=g/DcLjiqyntgTGtOU6stNGfazVzZasXq/InerguI3AIPoxqAAdEfx4p+B7CQl9PNsc
         xH1WrSFqhxKy3k2MYRExPDfvH0+n9BqXpI3cViSGaImCodEAW8Wi9UO0v/WouXQ8sjC/
         QvEF06mhOxjTRD14HHxZ7kavPpZ1TW22JbR2hfV9kub/VvY4KWJIS2wZgSz3A7tCDp4T
         0wXm2Y6wHg8SLqoMTH+vh5JBEYTYvhQ3uW/MtmatslATpcEQCL2CNju0T/D22nVgUtLy
         Nl4UQV5/15nlDnJziGaiMJlwKdbDLBhwPsdY2OsBQLgdF8o+f7rx5+K76bGH9CGCxTMz
         q+VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694570329; x=1695175129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWYBlc9fX+NrYYXcR1aoALLzzFrwI8piW2a3vusS9vc=;
        b=LWejpL5vztQg0Afh0sOCIuNRIcv2/jiybZGNLLT25KqSZ4Pj/cE7a9prduoPrPLZ7I
         aFD8ugbXDEaGYh8ualgLSpgCu/PfkeeCgjabPaI2T5EM7trX8YB/lZ+xKp7cYMGYa088
         WWCfIr/+nTAlXH4OjrN1+Q+oq5hq4Hkd1ESbQm8eMjZOR+742rd7szoPQX7Ghx4JBvor
         vj7n0vGYul56FA5XQECfAxziBeY+bykEbYyBtJEu2HGr1Iz2pBNAJEB49990o7G/lpaY
         UX/vJis+/Zws4Rr0yvrA5/LGMR9KCc4YJs8yeP1srYPZeY0Hjxs9R175qYP9qcw8fVXH
         1QuA==
X-Gm-Message-State: AOJu0YxdR4pjFpPswfeWhfMCOjehLhQRiySqwae0FwPRQ+R9y0IfbN/J
	2h/6WAyvN/jp3EzdbnZd8dgrVuMw58nmXJ1ZRnw=
X-Google-Smtp-Source: AGHT+IHsPeAEi+Pt7uDHC/LSLO186AhqFY1MS7mJupHG/wYqca31PB6IIXjOpC7ed6FIDlsT7m27Br4CeepGA1g4R9g=
X-Received: by 2002:a17:90a:b790:b0:26b:36a4:feeb with SMTP id
 m16-20020a17090ab79000b0026b36a4feebmr5652532pjr.8.1694570329218; Tue, 12 Sep
 2023 18:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230912063329.2260360-1-chancel.liu@nxp.com>
In-Reply-To: <20230912063329.2260360-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 13 Sep 2023 09:58:37 +0800
Message-ID: <CAA+D8APddGVWXEH7kmAeuwOyd9S-CcbOQcpo8NjeB4YRtU0+gg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-rpmsg: Set ignore_pmdown_time for dai_link
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

On Tue, Sep 12, 2023 at 2:34=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
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
> ---
>  sound/soc/fsl/imx-rpmsg.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
> index 3c7b95db2eac..d2ecd5e821b1 100644
> --- a/sound/soc/fsl/imx-rpmsg.c
> +++ b/sound/soc/fsl/imx-rpmsg.c
> @@ -89,6 +89,13 @@ static int imx_rpmsg_probe(struct platform_device *pde=
v)
>                             SND_SOC_DAIFMT_NB_NF |
>                             SND_SOC_DAIFMT_CBC_CFC;
>
> +       /* i.MX rpmsg sound cards work on codec slave mode. MCLK will be

Comments for multi line start from empty line with "/* "

Best regards
wang Shengjiu
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
