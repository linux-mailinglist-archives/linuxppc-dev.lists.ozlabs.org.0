Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54DC581EE1A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 11:14:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DEvDMxP/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T0SDv0wrZz30gr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Dec 2023 21:14:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DEvDMxP/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T0SD23sSpz2ykZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 21:14:08 +1100 (AEDT)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-35fea35c432so33742315ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Dec 2023 02:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703672042; x=1704276842; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRme2CYkuej+oUl410fWyMnS0uLqwabA9u7BWCoKP+o=;
        b=DEvDMxP/0BZTosfeDrghltISWZeSjBr9Qs2C+XINmBcYdX11/xOPmWJiummqD/h71+
         VzD5HNOb+p7ZBH7NM06ZZpMzuvLMifRJjHcrb4ERe4qvnX/JJxX5z/iR1/HIP8DH8NKw
         SixodvDeE34+wUu6RWbbScfKd8Q99fvxPNU7g9w6x6PH7MBDOjGHYhQ/sXaVlV1FHAeR
         sUnBAzUknc+MzoVE/H0Uqd30IG20cU2SIoDGe3bydH8a1suQWnlDIRFnS41nWLxriBMS
         +JasND24A/+lVVnj3knIJuQwkQpvPB2d/L46hq2iudC2ogSWvXvF2k/xu5aJzJDrmXfv
         Sfgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703672042; x=1704276842;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRme2CYkuej+oUl410fWyMnS0uLqwabA9u7BWCoKP+o=;
        b=Q6ny6PdFKos+zHd47ROc/jmJ55mEg8OQ0rbiM1qD7LfHvSevj8NztKp996nNFp+tTg
         /FyK6GEWPQdgA9/MRefo+d3+ORvl/reqYz9dtq+xkbl9s7lEP7ti84BTU2B1fPkmgSQ6
         roU3WAADsr4R7jowiXTCtIqY88vs3hLkMT/dnaPgC4q60AEkPzCgrvcp/+y3d9JvzPKc
         rLesjSh/+RzAmgUr40lUrVcoNwp4kg4oJXCq9M/CK836edSi9UEqjRJKZC882oiCn8tp
         EkqvOUMC7HN4X1BxHsXo3HjcW32ATEmlcAr1eFp6YgXKGkkUlFaPgAvM04Rsm1UVxORy
         H9NA==
X-Gm-Message-State: AOJu0Yz7thjDnDkCwxWnBAkHYHessKUVpXII0fIJSAvKXQlur2a/cIb9
	ADuQsREf6QmPJowziS9zSoCiKz6rFDmCBo+fFJk=
X-Google-Smtp-Source: AGHT+IGX3kgTnoLFpwcULIR2XP64wsIvyR1qrnOqNlsZ5KnM2HAG0vPRlOFg+PwmfJmRT1lMaiTHvxcGaf3r8K23v0c=
X-Received: by 2002:a92:c267:0:b0:35d:a84e:f729 with SMTP id
 h7-20020a92c267000000b0035da84ef729mr15136859ild.63.1703672042700; Wed, 27
 Dec 2023 02:14:02 -0800 (PST)
MIME-Version: 1.0
References: <20231225080608.967953-1-chancel.liu@nxp.com>
In-Reply-To: <20231225080608.967953-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 27 Dec 2023 18:13:51 +0800
Message-ID: <CAA+D8APY3KL6+7kpeqGLm-n_gLTLHOWvMoEZxhrRH2X+9O1d-w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_rpmsg: Fix error handler with pm_runtime_enable
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com, linux-sound@vger.kernel.org, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 25, 2023 at 4:06=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> There is error message when defer probe happens:
>
> fsl_rpmsg rpmsg_audio: Unbalanced pm_runtime_enable!
>
> Fix the error handler with pm_runtime_enable.
>
> Fixes: b73d9e6225e8 ("ASoC: fsl_rpmsg: Add CPU DAI driver for audio base =
on rpmsg")
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
wang shengjiu
> ---
>  sound/soc/fsl/fsl_rpmsg.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
> index 5c5c04ce9db7..00852f174a69 100644
> --- a/sound/soc/fsl/fsl_rpmsg.c
> +++ b/sound/soc/fsl/fsl_rpmsg.c
> @@ -238,7 +238,7 @@ static int fsl_rpmsg_probe(struct platform_device *pd=
ev)
>         ret =3D devm_snd_soc_register_component(&pdev->dev, &fsl_componen=
t,
>                                               &fsl_rpmsg_dai, 1);
>         if (ret)
> -               return ret;
> +               goto err_pm_disable;
>
>         rpmsg->card_pdev =3D platform_device_register_data(&pdev->dev,
>                                                          "imx-audio-rpmsg=
",
> @@ -248,16 +248,22 @@ static int fsl_rpmsg_probe(struct platform_device *=
pdev)
>         if (IS_ERR(rpmsg->card_pdev)) {
>                 dev_err(&pdev->dev, "failed to register rpmsg card\n");
>                 ret =3D PTR_ERR(rpmsg->card_pdev);
> -               return ret;
> +               goto err_pm_disable;
>         }
>
>         return 0;
> +
> +err_pm_disable:
> +       pm_runtime_disable(&pdev->dev);
> +       return ret;
>  }
>
>  static void fsl_rpmsg_remove(struct platform_device *pdev)
>  {
>         struct fsl_rpmsg *rpmsg =3D platform_get_drvdata(pdev);
>
> +       pm_runtime_disable(&pdev->dev);
> +
>         if (rpmsg->card_pdev)
>                 platform_device_unregister(rpmsg->card_pdev);
>  }
> --
> 2.42.0
>
