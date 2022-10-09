Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BB1D5F89B0
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 08:27:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlXCN1gwWz3dwL
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 17:27:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PPyhE01b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PPyhE01b;
	dkim-atps=neutral
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MlX1p29Rpz3bc5
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Oct 2022 17:19:10 +1100 (AEDT)
Received: by mail-lf1-x135.google.com with SMTP id s20so12476445lfi.11
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Oct 2022 23:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FwFtbnuHXctfwVd3JKQNg+pvdLuGE81h0Vad0SlZEM8=;
        b=PPyhE01bnzN0uGGFHXvZs8G49heZgoCMbrpmPh6O9CBwul7F+CG8MU28S0rMtx4viR
         +VW4N4zfwg4wUkLdxghB41OUAaSc+zy28EIkzuft3Z/rSYqnasvExxrWgcWGS4VVTMfk
         3gkl62gGMq740AjC48/I3ggs9tWUv7nbbEVH0nLWnJhWWkczYWCHcTAcY0p0KUW0hD3U
         ILE5K1UyvxakJahOdLObdXWBRvQaN63JDkuqLOuZ8fM4Dlab0N28ayLREFFvLZLK/2HZ
         IiEZF0iBiD3g5U8slIJXXa7wKQ5F0XUpUiwia5ErCzv2TNg5P5opGEMdeCGPc/t34cqp
         GyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FwFtbnuHXctfwVd3JKQNg+pvdLuGE81h0Vad0SlZEM8=;
        b=6gjVBTzmJ+iKaoTuXaEeavBuSjTrfu7H6TdVLCSeypENk/AUKTqRUB3KR7HuhrSc2m
         2tc88O5MD+X6IhPLH0Zwl0aZDvkiN9K+CZguBgpnOg26n7ee55WIqxwFB3ZHxS5gnWjW
         WD612ujI75An6Ib5XqwUIM9yYSpuoFJRIeMbFJhdJT8l77BILvzxW/65KM6m4Xo04nyc
         n7MJukLprc0Zb1yBeV0yWBxJCCbIXjb4PxECR29cVyFAZPiHOx8f8+hwwflL7ZN9DBFd
         YPXYzm67qvjAE6lXc+Ne5bXYIO3PwQyv7nUnOctXSfATAiTgHPOr+untXCfuHVg5daaq
         seCA==
X-Gm-Message-State: ACrzQf1XStCEkp3AToUiaoQG9QsebVPKInnTt5LW4R5N1LNUkAfLXQyC
	9peMXYmfmt7vwsKAs8cfYLxUuNP0G0SeGlEHhxg=
X-Google-Smtp-Source: AMsMyM4mwpBj9E5VmiZkhu50z2NUYKyEvBld8q+mnFLoSzMC2flw0ou8454LOgpGciwCmURlMc8O5kJM1wuW3bv4ZcI=
X-Received: by 2002:ac2:4d46:0:b0:4a2:473f:1fb3 with SMTP id
 6-20020ac24d46000000b004a2473f1fb3mr4163640lfp.408.1665296345775; Sat, 08 Oct
 2022 23:19:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220930064441.2548505-1-chancel.liu@nxp.com> <20220930064441.2548505-6-chancel.liu@nxp.com>
In-Reply-To: <20220930064441.2548505-6-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 9 Oct 2022 14:18:54 +0800
Message-ID: <CAA+D8AOUxRK7_DrCVsCXpRmri3=ejdoYakSfusmzFVaZf9B2wQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] ASoC: fsl_rpmsg: Register different ASoC machine devices
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: multipart/alternative; boundary="00000000000022c23c05ea940592"
X-Mailman-Approved-At: Sun, 09 Oct 2022 17:24:03 +1100
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com, broonie@kernel.org, krzysztof.kozlowski+dt@linaro.org, perex@perex.cz, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000022c23c05ea940592
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 30, 2022 at 2:46 PM Chancel Liu <chancel.liu@nxp.com> wrote:

> This driver helps register ASoC machine device thus use of
> PLATFORM_DEVID_AUTO macro in API can automatically create device for
> each sound card based on rpmsg.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl_rpmsg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
> index bf94838bdbef..fde3d5006ce0 100644
> --- a/sound/soc/fsl/fsl_rpmsg.c
> +++ b/sound/soc/fsl/fsl_rpmsg.c
> @@ -235,7 +235,7 @@ static int fsl_rpmsg_probe(struct platform_device
> *pdev)
>
>         rpmsg->card_pdev = platform_device_register_data(&pdev->dev,
>                                                          "imx-audio-rpmsg",
> -
> PLATFORM_DEVID_NONE,
> +
> PLATFORM_DEVID_AUTO,
>                                                          NULL,
>                                                          0);
>         if (IS_ERR(rpmsg->card_pdev)) {
> --
> 2.25.1
>
>

--00000000000022c23c05ea940592
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 30, 2022 at 2:46 PM Chanc=
el Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com">chancel.liu@nxp.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This d=
river helps register ASoC machine device thus use of<br>
PLATFORM_DEVID_AUTO macro in API can automatically create device for<br>
each sound card based on rpmsg.<br>
<br>
Signed-off-by: Chancel Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com" targe=
t=3D"_blank">chancel.liu@nxp.com</a>&gt;<br></blockquote><div><br></div><di=
v>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com">sh=
engjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>Best regards</div><d=
iv>Wang Shengjiu=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
---<br>
=C2=A0sound/soc/fsl/fsl_rpmsg.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c<br>
index bf94838bdbef..fde3d5006ce0 100644<br>
--- a/sound/soc/fsl/fsl_rpmsg.c<br>
+++ b/sound/soc/fsl/fsl_rpmsg.c<br>
@@ -235,7 +235,7 @@ static int fsl_rpmsg_probe(struct platform_device *pdev=
)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 rpmsg-&gt;card_pdev =3D platform_device_registe=
r_data(&amp;pdev-&gt;dev,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;imx-audio-rpms=
g&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PLATFORM_DEVID_NONE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 PLATFORM_DEVID_AUTO,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(rpmsg-&gt;card_pdev)) {<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000022c23c05ea940592--
