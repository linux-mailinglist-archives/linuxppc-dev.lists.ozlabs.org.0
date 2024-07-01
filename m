Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA64991D63D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 04:39:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P/N1wkQJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WC9HR5YXgz3fR4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 12:39:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P/N1wkQJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12d; helo=mail-il1-x12d.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WC9Gl2FRhz3bTP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2024 12:39:10 +1000 (AEST)
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3748ebe7e53so12270745ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2024 19:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719801548; x=1720406348; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y40QwGli4KT7ff1uF7HzZYK9rm2EfcOvxXXgg3mEqoo=;
        b=P/N1wkQJBejgstTCxZ/gR0Q3yki8d7YELgmOB02Xt+DJCl7c0lO1panfV0IwLRmiSL
         znjXDt2ciVjSNrM9YTyjDiBPVqNGCpaPCadggBA1WYQn6D4UPockxKkyjgcvzAMeT/Tm
         NmxyVZBPu3xJCFQWAay/HHwOx2INRGulBOPtZcBb85nvyaqfK2Gdo372sb0p5DRlGn5I
         IZKkY/c5rXjN92mxTK6CT+gdeb8yXqKcCg77MTTgplwvU7t4xxkKF3I/zppuhYYR2IiF
         JtCod0gepFVJ6Szhpml/pe4XOYehkngodChazV1ILTx6PN6VGa3Co5PiBMs7AzhyLwN0
         hGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719801548; x=1720406348;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y40QwGli4KT7ff1uF7HzZYK9rm2EfcOvxXXgg3mEqoo=;
        b=Q1v/Sx7yltDp8q9FSLSfxHQ9NIdQoo3fk8ATqYvGgkRtmgr83ryFoxFTXPSStuFFGS
         0lFIxOqs5murPpZuJMXloJUekQTUxXzOpz8Fkb7RQTAhRvi8tEP3kck064Mt+mH48d2b
         t6HH7eEqHIcKCoIGHKd1zEETL26RY2JmibOdNsXWWvkDC9oio8qvHwStetOVn9d0/wJE
         2feaFXUucyp3dtB9glafwMATL5Ct0GiROiNnBrI+bHyTxpsfqj/sj3ti9lI4waFpVzLD
         8vGmehnzd0N59HZlLiC4lrz6OCwBOd3+4wVqU4JHcNSlJQYa5ok3Z4lANA2XlvZC2tGc
         uEuw==
X-Forwarded-Encrypted: i=1; AJvYcCVKBydXIeqA8R8gcIaBPDkvoAypGrrOVUoSAl+VMSr5kIJgz4wsTCFFQfVH4F4rBVj/VkmuuUPyIpwVhQsT+gJFiwDzIcK1n0lHD0/yrQ==
X-Gm-Message-State: AOJu0YzCG3JJPTSgpll2g9Y5jOxcXB0id/03Qu1hEgOoAS6Lh8wJ5wgX
	Pf522Z0hlpeQpdgKLECfZWng423Dq5sm6g8z6/OZoQ2/jUD6HPDl6EHTxRz/o1lFLxLhYzWp3nD
	Q8FzsVNIolG0jijEoz7YXWDkmzPc=
X-Google-Smtp-Source: AGHT+IFl6hhIVwcNWvb7KuIdXA/G8P41RTV32LeQ6fy/SVP0IkTxdaNJCEE4hHhayovF9Ke2gw9gVLaBx7hagg/hTfU=
X-Received: by 2002:a05:6e02:b46:b0:375:a4e5:1dc9 with SMTP id
 e9e14a558f8ab-37cd0913b1fmr60376685ab.4.1719801547584; Sun, 30 Jun 2024
 19:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240626071202.7149-1-chancel.liu@nxp.com> <20240626071202.7149-2-chancel.liu@nxp.com>
In-Reply-To: <20240626071202.7149-2-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 1 Jul 2024 10:38:56 +0800
Message-ID: <CAA+D8ANH8+FBsatondzSfiVD0H0BweRdPLOmoPaBNW6gMFck_Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_rpmsg: Add support for i.MX95 platform
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, linux-sound@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 26, 2024 at 3:12=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:
>
> Add compatible string and specific soc data to support rpmsg sound card
> on i.MX95 platform.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Shengjiu Wang
> ---
>  sound/soc/fsl/fsl_rpmsg.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
> index bc41a0666856..467d6bc9f956 100644
> --- a/sound/soc/fsl/fsl_rpmsg.c
> +++ b/sound/soc/fsl/fsl_rpmsg.c
> @@ -175,6 +175,14 @@ static const struct fsl_rpmsg_soc_data imx93_data =
=3D {
>                    SNDRV_PCM_FMTBIT_S32_LE,
>  };
>
> +static const struct fsl_rpmsg_soc_data imx95_data =3D {
> +       .rates =3D SNDRV_PCM_RATE_16000 | SNDRV_PCM_RATE_32000 |
> +                SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000 |
> +                SNDRV_PCM_RATE_88200 | SNDRV_PCM_RATE_96000,
> +       .formats =3D SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
> +                  SNDRV_PCM_FMTBIT_S32_LE,
> +};
> +
>  static const struct of_device_id fsl_rpmsg_ids[] =3D {
>         { .compatible =3D "fsl,imx7ulp-rpmsg-audio", .data =3D &imx7ulp_d=
ata},
>         { .compatible =3D "fsl,imx8mm-rpmsg-audio", .data =3D &imx8mm_dat=
a},
> @@ -182,6 +190,7 @@ static const struct of_device_id fsl_rpmsg_ids[] =3D =
{
>         { .compatible =3D "fsl,imx8mp-rpmsg-audio", .data =3D &imx8mp_dat=
a},
>         { .compatible =3D "fsl,imx8ulp-rpmsg-audio", .data =3D &imx7ulp_d=
ata},
>         { .compatible =3D "fsl,imx93-rpmsg-audio", .data =3D &imx93_data}=
,
> +       { .compatible =3D "fsl,imx95-rpmsg-audio", .data =3D &imx95_data}=
,
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, fsl_rpmsg_ids);
> --
> 2.43.0
>
