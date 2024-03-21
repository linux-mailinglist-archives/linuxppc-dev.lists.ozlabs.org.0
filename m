Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70069881B8D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 04:31:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FGG9Raq4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V0WGR21Jbz3dX4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Mar 2024 14:31:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FGG9Raq4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com [IPv6:2607:f8b0:4864:20::12b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V0WFh1s9Yz3bmY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Mar 2024 14:31:04 +1100 (AEDT)
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-368602c9ed0so2811375ab.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Mar 2024 20:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710991861; x=1711596661; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YkcCPZV2rPe2mAIICfSKEdznaBH5x94qD30ycxtS6yw=;
        b=FGG9Raq4rwwEx8dFT05SnqOl4hID+99fI6xJxM4oLdCzCp9TakdgZEB+WHUOlqyDGN
         WC/biBehtlmaU/CGPpUxJ3nYTVFfDks+v6+dUc+Um1WDVqTEneReWMcrPxufy3eAJYvz
         3iTgDx1Vwp20taNVUFrgDYAQixtHel/cRY8PeCxVmMogsFBYJIVFbekaXJWQoYWzeilq
         Ikhxh/692zOfiG213Z+8D3ccYvrlQ0bCDBnQQZO222v7lCOMXs3n5G6yvPq18U0k0zMT
         /nOqO/znzYUQcS77Z96qWVf4+e79StfJdoArryFw7Qsi9dCvq90P9r5JDNQHSmzLmcVT
         rZCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710991861; x=1711596661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YkcCPZV2rPe2mAIICfSKEdznaBH5x94qD30ycxtS6yw=;
        b=P4fnhjwbXrp0MoncV2JMBFDr0e2lueEhmMjHerOvSboUVDtIXPEv4K0TOJMaPnmSYv
         RFMoOfALArjzpDf6kUr9DwakkugI+kimuSCCHvToa9bkr70uFHNlRBhkwNNX7w/fDPMg
         YRjmpB/H6GxFE99MTtn7w3X8D1KT46tixJD4ydrQyJPucrTF1aY7N0fqEJgvYvIM36It
         EI8tLs1sBoCewb2hk/pQcjJAoy1XgrQWJYBl9iaXalg6xaeEZjFkQcwa1rRGfIuavpuf
         hx8be32NxPt6ccwE3GGkAJJnQ25udPrkZRg8ZTOMX9Suc7vvJ+475NQNdh0KoExk06XU
         +mfw==
X-Forwarded-Encrypted: i=1; AJvYcCUTp0cHJj/Wws0lxWdDOgxevJVbvMuDZ25JeAUfGvAhpZBfiniXoYXxxrvJXcH+o0LLuNmPj1/T7femsjNAag44EyHzrZcs299jyrHgCA==
X-Gm-Message-State: AOJu0YySNq8IrLGRD98jQ5o9H9OGScyuCVHcHG+t9ptognQcnv/gKZO5
	lhhAnoi9hV1gPAqaz5CpBeZsuWxMAQJB3A60u7WpS4UzyxIw+XeXdSR20GiYyiAyYMY64thrPDg
	ZzfAmhmsUiNF2bdwBCgPaIE76p2o=
X-Google-Smtp-Source: AGHT+IFIZlapfD6kquVxMjP6vNIkczhJV1lbowblT0uRu6rB6UIdztD13JlWALUuzaKkGcAhpgwoNBsxh+aHMUBnGiE=
X-Received: by 2002:a92:c90f:0:b0:366:9220:821f with SMTP id
 t15-20020a92c90f000000b003669220821fmr7596072ilp.7.1710991861315; Wed, 20 Mar
 2024 20:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240314141642.2943605-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20240314141642.2943605-1-alexander.stein@ew.tq-group.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 21 Mar 2024 11:30:50 +0800
Message-ID: <CAA+D8APwNH2wf4p9DzZCy3b6xC8K-FPpMGw2V4kRMsX7U3=3Jg@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC: fsl: fsl_ssi: Add dev_err_probe if PCM DMA init fails
To: Alexander Stein <alexander.stein@ew.tq-group.com>
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 14, 2024 at 10:16=E2=80=AFPM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> This happens especially if this driver is built-in, but SDMA driver
> is configured as module.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best Regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl_ssi.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
> index ab6ec1974807..4ca3a16f7ac0 100644
> --- a/sound/soc/fsl/fsl_ssi.c
> +++ b/sound/soc/fsl/fsl_ssi.c
> @@ -1401,8 +1401,10 @@ static int fsl_ssi_imx_probe(struct platform_devic=
e *pdev,
>                         goto error_pcm;
>         } else {
>                 ret =3D imx_pcm_dma_init(pdev);
> -               if (ret)
> +               if (ret) {
> +                       dev_err_probe(dev, ret, "Failed to init PCM DMA\n=
");
>                         goto error_pcm;
> +               }
>         }
>
>         return 0;
> --
> 2.34.1
>
