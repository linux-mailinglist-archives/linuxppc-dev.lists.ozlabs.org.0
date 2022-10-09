Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C5A5F89B1
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 08:28:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlXDN6X5Kz3f2n
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 17:28:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Rjkq4kta;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Rjkq4kta;
	dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MlX2V2wMPz3bjl
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Oct 2022 17:19:46 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id bu25so12530805lfb.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Oct 2022 23:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+85/F+ow+GpPLkelISy1+QscAgeyogx8L8x1L8zwOPQ=;
        b=Rjkq4ktag46yNxR5BMWavl1XjnlHfXO/ctLe46E2T0j941HNzgvGJI4tV2Z3qrYSaN
         q1cCdt+gc/mPThO5HgYpMlEF2lh7QGTxEVFsIJsUWvTNImphLUheXq9C3I6ype1SMckV
         JDVlwxGwKLECBqy4tsdVr/J3yRXCLE9eIKELOsD4+tM4SX158NSz7F7xHA2kW/qM0+ss
         YkRkFLr+zXS7LNM31LO2hJ6I2jknhFzkUSQgerVrRdHxm7Ba7NRi/WWCiTMXXRqcsy+v
         A/tWEGM8uQERokY1zPwY6fFB5e+bqatcsrMjKRDa/P7Y6qJOC+9xxx8Eu1XEqk9cmNvn
         VKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+85/F+ow+GpPLkelISy1+QscAgeyogx8L8x1L8zwOPQ=;
        b=hBLFztlx78dnV/nb6Gpr4vnddv1RaDcPW1z1IWRIgXJbN7QhjRBgk2pkgNVtn1+SzE
         NW9ks541i8t2I6heh7S899eDaTGSYHGmP8zRUzKPm2GExpTqtYBZFzoL2q7R9EtINyUj
         7Qvvg7Eh4hf+t1ToY437lyRFFH7acwVwJJ6Ko58C8xFL9AkeE9RhbwIvPT3XVGm0oPx/
         G6QAI150nC7s6uHoeuZ8EOBWphq+3lzmnE3C0Ph6tdu6aIegwMHJ7wU2ANM+kWvWNqFP
         yIUfz+TXf05Rz+3nQHgxyubMEU3KJighgLTJwgLkHM6HwqO+RtQI0tSufnD1kA1dMhNt
         wFbQ==
X-Gm-Message-State: ACrzQf3W70mA3KX/sKLU0jQtfSBBZS8s4lGIrEi09YkXYhw/DpAWce2B
	YRBbnbYpKjFf+q4DDSQ/1AA8I5LxCPvOWB166jE=
X-Google-Smtp-Source: AMsMyM6TaEIdqx/CL6Om6bzuW2SkJvwoxRCx/R8HfsuGCywVMGka23JHiJILb1pJi+8wbEIwHxw3OCzYOBY5wwj/bO8=
X-Received: by 2002:a05:6512:1093:b0:4a2:69f9:310f with SMTP id
 j19-20020a056512109300b004a269f9310fmr4677852lfg.433.1665296382913; Sat, 08
 Oct 2022 23:19:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220930064441.2548505-1-chancel.liu@nxp.com> <20220930064441.2548505-7-chancel.liu@nxp.com>
In-Reply-To: <20220930064441.2548505-7-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 9 Oct 2022 14:19:31 +0800
Message-ID: <CAA+D8AO=MUhrnyb3tU0p+dsPXmpbEwfKyoVohX-W5qUSCuTmCA@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] ASoC: fsl_rpmsg: Multi-channel support in CPU DAI driver
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: multipart/alternative; boundary="00000000000059723505ea940767"
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

--00000000000059723505ea940767
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 30, 2022 at 2:46 PM Chancel Liu <chancel.liu@nxp.com> wrote:

> Some sound card based on rpmsg may support multi-channel. This patch
> expands the maximum channels to 32.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl_rpmsg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
> index fde3d5006ce0..46c7868a2653 100644
> --- a/sound/soc/fsl/fsl_rpmsg.c
> +++ b/sound/soc/fsl/fsl_rpmsg.c
> @@ -117,14 +117,14 @@ static struct snd_soc_dai_driver fsl_rpmsg_dai = {
>         .playback = {
>                 .stream_name = "CPU-Playback",
>                 .channels_min = 2,
> -               .channels_max = 2,
> +               .channels_max = 32,
>                 .rates = SNDRV_PCM_RATE_KNOT,
>                 .formats = FSL_RPMSG_FORMATS,
>         },
>         .capture = {
>                 .stream_name = "CPU-Capture",
>                 .channels_min = 2,
> -               .channels_max = 2,
> +               .channels_max = 32,
>                 .rates = SNDRV_PCM_RATE_KNOT,
>                 .formats = FSL_RPMSG_FORMATS,
>         },
> --
> 2.25.1
>
>

--00000000000059723505ea940767
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 30, 2022 at 2:46 PM Chanc=
el Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com">chancel.liu@nxp.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Some s=
ound card based on rpmsg may support multi-channel. This patch<br>
expands the maximum channels to 32.<br>
<br>
Signed-off-by: Chancel Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com" targe=
t=3D"_blank">chancel.liu@nxp.com</a>&gt;<br></blockquote><div><br></div><di=
v>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com">sh=
engjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>Best regards</div><d=
iv>Wang Shengjiu=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
---<br>
=C2=A0sound/soc/fsl/fsl_rpmsg.c | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c<br>
index fde3d5006ce0..46c7868a2653 100644<br>
--- a/sound/soc/fsl/fsl_rpmsg.c<br>
+++ b/sound/soc/fsl/fsl_rpmsg.c<br>
@@ -117,14 +117,14 @@ static struct snd_soc_dai_driver fsl_rpmsg_dai =3D {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .playback =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .stream_name =3D &q=
uot;CPU-Playback&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .channels_min =3D 2=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.channels_max =3D 2=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.channels_max =3D 3=
2,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .rates =3D SNDRV_PC=
M_RATE_KNOT,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .formats =3D FSL_RP=
MSG_FORMATS,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .capture =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .stream_name =3D &q=
uot;CPU-Capture&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .channels_min =3D 2=
,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.channels_max =3D 2=
,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.channels_max =3D 3=
2,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .rates =3D SNDRV_PC=
M_RATE_KNOT,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .formats =3D FSL_RP=
MSG_FORMATS,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000059723505ea940767--
