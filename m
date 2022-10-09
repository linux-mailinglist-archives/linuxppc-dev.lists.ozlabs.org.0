Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0BA5F89AF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 08:26:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlXBL732Vz3dwR
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 17:26:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Vnn3OC5a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Vnn3OC5a;
	dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MlX0w0zJCz3bjT
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Oct 2022 17:18:24 +1100 (AEDT)
Received: by mail-lj1-x232.google.com with SMTP id p5so9995644ljc.13
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Oct 2022 23:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i4xfQIyuSmS7q/zccFt7uuXnpmr0dTN+JLFy1qBP9+Q=;
        b=Vnn3OC5a+mBIFdJXtXSfziRoydRuVChhA33DdoMnFHX0DViEwCcwPSdpt/1gVJSal+
         mBsdNBle9TetrxuuLfCxKd0pDzV1xBDiYmblUiUyRmLEYhyb9gODDpnRNSQpmp7ae7A5
         ReMDI/3VB4odYyBAbX/78NFsBy/wqhPSZBnXlO+3dtVBSDE+oeuoB266nLgnQ1lO9YLR
         q8sjQHmlc4TaoBuRFneYVZDLIMgtS6atuTXiKSLSPH6YlGtcUia6tWTlvd5TKs96y6fL
         thGeokKYXBuL0U6QCyLkXxNijT2/cdGsZjOUzEw6ZQmqwFsJGjYAQwU4aq/48KndbgKc
         fMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i4xfQIyuSmS7q/zccFt7uuXnpmr0dTN+JLFy1qBP9+Q=;
        b=VT9Cx+OMRo3QURYsFRhGW5CuUaJys1hy5z7Dgwov2DGN3xZwj0CEwWCIJ8gvyX/n2F
         6NJiA4URK+KCwijyHKr8m4cYcww4zNGb0QV0xfiVJNxqAdv2xnxyv2MZ1R1gfXqruLnG
         KtTZBoqDCP5mi1dewiLxC5kGnae1zcZ4TKp+4PduVDvKjRX5SwqsGiLOn/krc0HZFwEC
         Lec6q69dXFnV5sQg+8aw9zWKdX/ze3lHQuYKYtIbl3Ss6zirQ1jgLhGdgbpDjPjF9gl2
         ED9cbT2/UkfD0qe29YREDUCygU7/nK2ncHy9kWG80slPXV0aPjNF6K5+F0sTHcBVRSsM
         3Ijg==
X-Gm-Message-State: ACrzQf0oeVMmFgJznumatv2HNifCVp8hN4J9IeOYEHau4tQ9QwqZiDrA
	V1gb8lQy74ZE4r6NR6KW5b44LpgFybgvBAZp9ZE=
X-Google-Smtp-Source: AMsMyM6vOS0rpU4QAxo6gdqNHlV/KsQBH4SrBvGhQVncrsdlz6ri/aA09LrNxwK1tQwAGXy1BJkpVNIygl7ySBczrgQ=
X-Received: by 2002:a2e:a1c8:0:b0:261:e4e5:1cc3 with SMTP id
 c8-20020a2ea1c8000000b00261e4e51cc3mr4852152ljm.248.1665296300917; Sat, 08
 Oct 2022 23:18:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220930064441.2548505-1-chancel.liu@nxp.com> <20220930064441.2548505-5-chancel.liu@nxp.com>
In-Reply-To: <20220930064441.2548505-5-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 9 Oct 2022 14:18:09 +0800
Message-ID: <CAA+D8AMtPhW_sXhF3BBHwkKW-hvZevH7xn9RxZb3N1Zrd2jmog@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] ASoC: imx-pcm-rpmsg: Multi-channel support for
 sound card based on rpmsg
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: multipart/alternative; boundary="0000000000007647f205ea94027f"
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

--0000000000007647f205ea94027f
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 30, 2022 at 2:46 PM Chancel Liu <chancel.liu@nxp.com> wrote:

> Some sound card based on rpmsg may support multi-channel. The number of
> channels can be sent to Cortex-M in rpmsg for process.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/imx-pcm-rpmsg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
> index 3157cd5a837e..2f310994f7ee 100644
> --- a/sound/soc/fsl/imx-pcm-rpmsg.c
> +++ b/sound/soc/fsl/imx-pcm-rpmsg.c
> @@ -178,7 +178,7 @@ static int imx_rpmsg_pcm_hw_params(struct
> snd_soc_component *component,
>                 msg->s_msg.param.channels = RPMSG_CH_STEREO;
>                 break;
>         default:
> -               ret = -EINVAL;
> +               msg->s_msg.param.channels = params_channels(params);
>                 break;
>         }
>
> --
> 2.25.1
>
>

--0000000000007647f205ea94027f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 30, 2022 at 2:46 PM Chanc=
el Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com">chancel.liu@nxp.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Some s=
ound card based on rpmsg may support multi-channel. The number of<br>
channels can be sent to Cortex-M in rpmsg for process.<br>
<br>
Signed-off-by: Chancel Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com" targe=
t=3D"_blank">chancel.liu@nxp.com</a>&gt;<br></blockquote><div><br></div><di=
v>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com">sh=
engjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>Best regards</div><d=
iv>Wang Shengjiu=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
---<br>
=C2=A0sound/soc/fsl/imx-pcm-rpmsg.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c<=
br>
index 3157cd5a837e..2f310994f7ee 100644<br>
--- a/sound/soc/fsl/imx-pcm-rpmsg.c<br>
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c<br>
@@ -178,7 +178,7 @@ static int imx_rpmsg_pcm_hw_params(struct snd_soc_compo=
nent *component,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 msg-&gt;s_msg.param=
.channels =3D RPMSG_CH_STEREO;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 default:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D -EINVAL;<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0msg-&gt;s_msg.param=
.channels =3D params_channels(params);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000007647f205ea94027f--
