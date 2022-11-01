Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0EC1614877
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 12:26:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1nlD5ZLHz3dts
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 22:26:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VjShMQy9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22b; helo=mail-lj1-x22b.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VjShMQy9;
	dkim-atps=neutral
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1fB70Dfqz3bdk
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Nov 2022 16:45:18 +1100 (AEDT)
Received: by mail-lj1-x22b.google.com with SMTP id s24so19429256ljs.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 22:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vDaw5eC6bXjv+s/idpalyykG065gVlj405gOBjwpIu4=;
        b=VjShMQy9lLbK7YjAdRlBqWLKO4yzFON/f/7s5WTT79x9T4+YF8PNElIHZJz4M7VOZ7
         YwtiB7PCbtZeWuD1LPa78e6HmsBiVwdX322qZCpoFbVAq606bmnwSwnD8wkyAZxDgLRA
         yRqdllCCSadVlbMpDmen1UJfkr+7AO5QQLHbL06XY0kA100Mnk2GVc8DmVVsAybqUbWs
         jcRhcEfL61Xs8TjElpJCp16ZmmDc+06GTH+0fME+SEG2Gpv2tG4Wi1M6rZ/TmcoN/MSy
         cp+Gm/Prbwv16nYsG0s98MaTdR2x34n3hCwNENZDGzX1jc997QZvDnAixtfdk0PtLl49
         GmBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDaw5eC6bXjv+s/idpalyykG065gVlj405gOBjwpIu4=;
        b=4Gm4KVao7oQnQaPd3BPYV3WfDS9ZWhsNiIgdA0STVngiykrRy0DHMvCLosFxEpFnw8
         Y3Kem0tsQ4Th1R+QsKPMDCHPaAo1FatJBZlQ4ZdPR246TiB4UC87eED+QSyItKfQPlBX
         B8Utx3HV78Hh+qWeNU+fs31erANMarNE6duOtaX5QD2FRXuu1RHWtM+w/laG+gvaeoC4
         E855POLM3oACQKrd8dBFqhRkpC86AtDcU6RgpNITG2991Wl4QINXpsxj25HDOa/u7RfM
         FQXU/mfBOT+lYg/2JCSSd/4P6GpvyWkfjEhbVHPtBqPCMCvp8B3beAAt9PZ4QjSNA3J5
         t7aQ==
X-Gm-Message-State: ACrzQf0655rpH92lgwIMbStQ+UZOGItHtaro3U2egc5K9EtrnsnZdxQ1
	4dC/WVSXClWCtLHLa0I5uWnxGu7akMdDPRrFiAE=
X-Google-Smtp-Source: AMsMyM5nU6UMXntrVs7Da/6zFSVFD9MdqLgtBjE0PNrBvN3GMBJ4Bv8R0iH/1rd+GXKPjMZAd0J2toxSyaYKuml3t0E=
X-Received: by 2002:a2e:a385:0:b0:277:34ff:e56b with SMTP id
 r5-20020a2ea385000000b0027734ffe56bmr7154649lje.297.1667281515220; Mon, 31
 Oct 2022 22:45:15 -0700 (PDT)
MIME-Version: 1.0
References: <20221028082750.991822-1-chancel.liu@nxp.com> <20221028082750.991822-4-chancel.liu@nxp.com>
In-Reply-To: <20221028082750.991822-4-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 1 Nov 2022 13:45:03 +0800
Message-ID: <CAA+D8ANKPOEgr6F4_7hq=b5dKOkSHrGjDAE14=Je3K1gbdDY6Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: fsl_micfil: Add support when using eDMA
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: multipart/alternative; boundary="00000000000074955e05ec623a57"
X-Mailman-Approved-At: Tue, 01 Nov 2022 22:24:21 +1100
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

--00000000000074955e05ec623a57
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 28, 2022 at 4:28 PM Chancel Liu <chancel.liu@nxp.com> wrote:

> On i.MX93 platform MICFIL uses eDMA. The maxburst should be set to the
> number of channels in eDMA multiple FIFO mode.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
wang shengjiu

> ---
>  sound/soc/fsl/fsl_micfil.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index b8a9504441df..22e75c14cac4 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -63,6 +63,7 @@ struct fsl_micfil_soc_data {
>         unsigned int fifo_depth;
>         unsigned int dataline;
>         bool imx;
> +       bool use_edma;
>         u64  formats;
>  };
>
> @@ -88,6 +89,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx93 = {
>         .fifo_depth = 32,
>         .dataline =  0xf,
>         .formats = SNDRV_PCM_FMTBIT_S32_LE,
> +       .use_edma = true,
>  };
>
>  static const struct of_device_id fsl_micfil_dt_ids[] = {
> @@ -690,6 +692,8 @@ static int fsl_micfil_hw_params(struct
> snd_pcm_substream *substream,
>         micfil->sdmacfg.n_fifos_src = channels;
>         micfil->sdmacfg.sw_done = true;
>         micfil->dma_params_rx.maxburst = channels * MICFIL_DMA_MAXBURST_RX;
> +       if (micfil->soc->use_edma)
> +               micfil->dma_params_rx.maxburst = channels;
>
>         return 0;
>  }
> --
> 2.25.1
>
>

--00000000000074955e05ec623a57
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct 28, 2022 at 4:28 PM Chanc=
el Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com">chancel.liu@nxp.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On i.M=
X93 platform MICFIL uses eDMA. The maxburst should be set to the<br>
number of channels in eDMA multiple FIFO mode.<br>
<br>
Signed-off-by: Chancel Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com" targe=
t=3D"_blank">chancel.liu@nxp.com</a>&gt;<br></blockquote><div><br></div><di=
v>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com">sh=
engjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>best regards</div><d=
iv>wang shengjiu=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
---<br>
=C2=A0sound/soc/fsl/fsl_micfil.c | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c<br>
index b8a9504441df..22e75c14cac4 100644<br>
--- a/sound/soc/fsl/fsl_micfil.c<br>
+++ b/sound/soc/fsl/fsl_micfil.c<br>
@@ -63,6 +63,7 @@ struct fsl_micfil_soc_data {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int fifo_depth;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int dataline;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool imx;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool use_edma;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u64=C2=A0 formats;<br>
=C2=A0};<br>
<br>
@@ -88,6 +89,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx93 =3D {<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .fifo_depth =3D 32,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .dataline =3D=C2=A0 0xf,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .formats =3D SNDRV_PCM_FMTBIT_S32_LE,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.use_edma =3D true,<br>
=C2=A0};<br>
<br>
=C2=A0static const struct of_device_id fsl_micfil_dt_ids[] =3D {<br>
@@ -690,6 +692,8 @@ static int fsl_micfil_hw_params(struct snd_pcm_substrea=
m *substream,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 micfil-&gt;sdmacfg.n_fifos_src =3D channels;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 micfil-&gt;sdmacfg.sw_done =3D true;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 micfil-&gt;dma_params_rx.maxburst =3D channels =
* MICFIL_DMA_MAXBURST_RX;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (micfil-&gt;soc-&gt;use_edma)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0micfil-&gt;dma_para=
ms_rx.maxburst =3D channels;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000074955e05ec623a57--
