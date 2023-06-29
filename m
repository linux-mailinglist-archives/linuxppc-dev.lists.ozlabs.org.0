Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39970741DFA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 04:10:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=oPQaRMG8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qs23t18tbz3bX2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jun 2023 12:10:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=oPQaRMG8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qs21f3hCbz307V
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jun 2023 12:08:53 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-262e89a3ee2so124671a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jun 2023 19:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688004531; x=1690596531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4tvKp5IVvBN2wL4gpSqmm/VGo0jXEVtysv0gwc3bnhI=;
        b=oPQaRMG88VBbTo73W4JawaB2TJeOUUTbMQe8oqpXRzMLkS6V/nm5ofYHeaSZJjE8dR
         aad7p/Y89kv9efA7+PWAdfzNrYvMiqV56Mj2Fm6yqCsokYfFkvQ9MO6a/iE8dt6DIqfH
         DdlO/xCicjISIlFV5MY5W0k0yKdO8kskOA1AHE2igsHO5W/3AbMOWyW/euyKiUfjXAfR
         DbeLKE3SAtA23bBmS2t8AD8CMIOSqx7PRbmyuUQn4bR1N6y5To7Sig4aIUMtFSnMS1af
         PGN1qMvfaNlDGhU9GK5ifpdc9qkAJ59nZnMb2TnXPDWEh/xDOtnlbbvbZPe3qZSW98JO
         dVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688004531; x=1690596531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tvKp5IVvBN2wL4gpSqmm/VGo0jXEVtysv0gwc3bnhI=;
        b=I8H+Ma2jT3j/mdbxvJXECEY5+6SYiyRNnrfDrhwsvcKV9KD+9rI9+Pcv0JdU2RVr70
         UJ2u+ZLqNpOBa21ng2E09TtslRTYWfrLX5PNifeUWXE16uDEL2ECD5wGjo7/dJ7V/OFP
         YIbqZYVJJ8Pn09yJlUE5ntltup4sEPZVQ63y5qQ1eZ3BabFB6w5SFRdQFv1octz7s5AH
         yeReu4q/92BgZ1hvV02T5GyTXKUcWfRqVLHTsbvejsmujmlrlFrgtG+qt2bVDOXwUizg
         6RyxqX2ynzq7o7wx8cnXwvIGpoTh1zOu/m+2J7tc6ThHSV2o5e14VyeYvTuqT/G98Pqd
         PAyw==
X-Gm-Message-State: AC+VfDwjwdk9cg6csJaEoEQYra9PEglmzAMtRdvKH3n4Ts0JL98qHVn3
	qBN1j2JiTqkQ8MsHdU5bj+TnDTjMObx4uJiOmzY=
X-Google-Smtp-Source: ACHHUZ6s7P36xoI1fcsUzA5Rug04ALg8yvKgfvzOhV6qXVSlq3DtbmC1P8uBK/0BDpcb0g2+Cue+jFs4VdJelX9aJVI=
X-Received: by 2002:a17:90a:1d7:b0:262:ca69:bf9a with SMTP id
 23-20020a17090a01d700b00262ca69bf9amr10835593pjd.21.1688004531443; Wed, 28
 Jun 2023 19:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230625065412.651870-1-chancel.liu@nxp.com>
In-Reply-To: <20230625065412.651870-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 29 Jun 2023 10:08:40 +0800
Message-ID: <CAA+D8AN3yX+DW4zbMYuqvCzJ8XBHeawCkObaO=ZJJ=pffG8_rg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-pcm-rpmsg: Set PCM hardware parameters separately
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: multipart/alternative; boundary="00000000000079dc4a05ff3b2e60"
X-Mailman-Approved-At: Thu, 29 Jun 2023 12:10:06 +1000
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

--00000000000079dc4a05ff3b2e60
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 25, 2023 at 2:54=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:

> Different PCM devices may have different PCM hardware parameters. It
> requires PCM hardware parameters set separately if there is more than
> one rpmsg sound card.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/imx-pcm-rpmsg.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.=
c
> index 765dad607bf6..d63782b8bdef 100644
> --- a/sound/soc/fsl/imx-pcm-rpmsg.c
> +++ b/sound/soc/fsl/imx-pcm-rpmsg.c
> @@ -228,6 +228,10 @@ static int imx_rpmsg_pcm_open(struct
> snd_soc_component *component,
>                               struct snd_pcm_substream *substream)
>  {
>         struct rpmsg_info *info =3D dev_get_drvdata(component->dev);
> +       struct snd_soc_pcm_runtime *rtd =3D asoc_substream_to_rtd(substre=
am);
> +       struct snd_soc_dai *cpu_dai =3D asoc_rtd_to_cpu(rtd, 0);
> +       struct fsl_rpmsg *rpmsg =3D dev_get_drvdata(cpu_dai->dev);
> +       struct snd_pcm_hardware pcm_hardware;
>         struct rpmsg_msg *msg;
>         int ret =3D 0;
>         int cmd;
> @@ -255,10 +259,11 @@ static int imx_rpmsg_pcm_open(struct
> snd_soc_component *component,
>
>         info->send_message(msg, info);
>
> -       imx_rpmsg_pcm_hardware.period_bytes_max =3D
> -                       imx_rpmsg_pcm_hardware.buffer_bytes_max / 2;
> +       pcm_hardware =3D imx_rpmsg_pcm_hardware;
> +       pcm_hardware.buffer_bytes_max =3D rpmsg->buffer_size;
> +       pcm_hardware.period_bytes_max =3D pcm_hardware.buffer_bytes_max /=
 2;
>
> -       snd_soc_set_runtime_hwparams(substream, &imx_rpmsg_pcm_hardware);
> +       snd_soc_set_runtime_hwparams(substream, &pcm_hardware);
>
>         ret =3D snd_pcm_hw_constraint_integer(substream->runtime,
>                                             SNDRV_PCM_HW_PARAM_PERIODS);
> @@ -597,7 +602,6 @@ static int imx_rpmsg_pcm_new(struct snd_soc_component
> *component,
>         if (ret)
>                 return ret;
>
> -       imx_rpmsg_pcm_hardware.buffer_bytes_max =3D rpmsg->buffer_size;
>         return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_WC,
>                                             pcm->card->dev,
> rpmsg->buffer_size);
>  }
> --
> 2.25.1
>
>

--00000000000079dc4a05ff3b2e60
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jun 25, 2023 at 2:54=E2=80=AF=
PM Chancel Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com">chancel.liu@nxp.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Different PCM devices may have different PCM hardware parameters. It<br>
requires PCM hardware parameters set separately if there is more than<br>
one rpmsg sound card.<br>
<br>
Signed-off-by: Chancel Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com" targe=
t=3D"_blank">chancel.liu@nxp.com</a>&gt;<br></blockquote><div><br></div><di=
v>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com">sh=
engjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>Best regards</div><d=
iv>Wang Shengjiu=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
---<br>
=C2=A0sound/soc/fsl/imx-pcm-rpmsg.c | 12 ++++++++----<br>
=C2=A01 file changed, 8 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c<=
br>
index 765dad607bf6..d63782b8bdef 100644<br>
--- a/sound/soc/fsl/imx-pcm-rpmsg.c<br>
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c<br>
@@ -228,6 +228,10 @@ static int imx_rpmsg_pcm_open(struct snd_soc_component=
 *component,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct snd_pcm_substream *substream)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct rpmsg_info *info =3D dev_get_drvdata(com=
ponent-&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct snd_soc_pcm_runtime *rtd =3D asoc_substr=
eam_to_rtd(substream);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct snd_soc_dai *cpu_dai =3D asoc_rtd_to_cpu=
(rtd, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct fsl_rpmsg *rpmsg =3D dev_get_drvdata(cpu=
_dai-&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct snd_pcm_hardware pcm_hardware;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct rpmsg_msg *msg;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int ret =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int cmd;<br>
@@ -255,10 +259,11 @@ static int imx_rpmsg_pcm_open(struct snd_soc_componen=
t *component,<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;send_message(msg, info);<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0imx_rpmsg_pcm_hardware.period_bytes_max =3D<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0imx_rpmsg_pcm_hardware.buffer_bytes_max / 2;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pcm_hardware =3D imx_rpmsg_pcm_hardware;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pcm_hardware.buffer_bytes_max =3D rpmsg-&gt;buf=
fer_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pcm_hardware.period_bytes_max =3D pcm_hardware.=
buffer_bytes_max / 2;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_soc_set_runtime_hwparams(substream, &amp;im=
x_rpmsg_pcm_hardware);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0snd_soc_set_runtime_hwparams(substream, &amp;pc=
m_hardware);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D snd_pcm_hw_constraint_integer(substream=
-&gt;runtime,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 SNDRV_PCM_HW_PARAM_PERIODS);<br>
@@ -597,7 +602,6 @@ static int imx_rpmsg_pcm_new(struct snd_soc_component *=
component,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0imx_rpmsg_pcm_hardware.buffer_bytes_max =3D rpm=
sg-&gt;buffer_size;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return snd_pcm_set_fixed_buffer_all(pcm, SNDRV_=
DMA_TYPE_DEV_WC,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 pcm-&gt;card-&gt;dev, rpmsg-&gt;buffer_size);<br>
=C2=A0}<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000079dc4a05ff3b2e60--
