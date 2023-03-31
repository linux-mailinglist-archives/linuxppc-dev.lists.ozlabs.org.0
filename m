Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C246D6D16B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 07:22:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnpYz58z7z3fV6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 16:21:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j6snYCTS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j6snYCTS;
	dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnlKD6RHmz3cR7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Mar 2023 13:55:43 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id r29so20963914wra.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 19:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680231337; x=1682823337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R0f0oYaBiIjZngwKKrarE3ZU4R7VLA65VkJQmbsO7p4=;
        b=j6snYCTSc3mn9magen+ARP9tyBjdlqAg7Msxhi4LmTS+IMoHqzu/tVUg95/7GQ6fK1
         Ab33kcxf2rMwtLKQFmY0q2/ynhw8dxHAA/ErsVFtm/f8HYQqlkegFOko3J2MRW/gozSA
         zbFnAUPiwIsIfxZeD3NpRyiDH1t8mHcxYUHFlEa3a5uH/Q4E0EOa5K2KdXoGm2ikXbEJ
         cFacjZNut43G140mcjfDOYCH49vCCq1WXMeWr4OoqMcEDx1mVacsHdDwvKbriOa6D9An
         8vEDs5Gks6sYn2jJamaaMSvpCJ2dMNSlgydmr867/IW5q8kungIpa1YhWEGPeH+UTAyt
         yw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680231337; x=1682823337;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R0f0oYaBiIjZngwKKrarE3ZU4R7VLA65VkJQmbsO7p4=;
        b=nQAn+c6IMBrZKfTNQhBiY0/w83PyqsZJSH2M9SI9D2n7DmKP1SVzBuwgZbPiud56wT
         m51A19gdV/2xfcxrAhwUvr45zWbi15izq8QmS+UAC3+2FWFa3/thLAucSre1apYFbmcb
         I08G8F+DLqPVtXsIvFTEL8FL5tDIoCjBTRxldCe+0ulO2WcbMwHFZF17BwwFfV7oJKz+
         dM1s836SefmxCKShLHXq56ZaJPjzXje6bxehn6vgem4drrO42TX4ghS+uz5o0tlBsiam
         //GQ9/C/oUfsY0nyb3BH/GluXxk/u+ugRogQcuUDa1aZsGwqgOxR+I206432yAYZaePo
         QYug==
X-Gm-Message-State: AAQBX9cm7sBV9az1w2K0opaZZxCPjJI1HzQgPK8kgb19uhhMnCoUNH8d
	9KMkTa7pRLivSPCCnB9EJbr4Ok1K6e4LG07tEU8=
X-Google-Smtp-Source: AKy350aoW6eyWZ7Vy7uL9TzBTgI+9gM4kG0Y6ga+Ywwo/3Ce7novHeVGH33oyhBjPnINiHx5c4pgOiCGaiSL/Y/+Rnw=
X-Received: by 2002:a5d:5152:0:b0:2c7:17b8:5759 with SMTP id
 u18-20020a5d5152000000b002c717b85759mr4385251wrt.3.1680231336775; Thu, 30 Mar
 2023 19:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230330083040.77085-1-emas@bang-olufsen.dk>
In-Reply-To: <20230330083040.77085-1-emas@bang-olufsen.dk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 31 Mar 2023 10:55:25 +0800
Message-ID: <CAA+D8AOMTQ00Ah21w54DVXin3KcYkVxaGVd64Z_pSzv+Ooj9vw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Use physical format width
To: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
Content-Type: multipart/alternative; boundary="000000000000f8129e05f829571b"
X-Mailman-Approved-At: Fri, 31 Mar 2023 16:21:17 +1100
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000f8129e05f829571b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 30, 2023 at 4:30=E2=80=AFPM Emil Abildgaard Svendsen <
EMAS@bang-olufsen.dk> wrote:

> Slot width should follow the physical width of the format instead of the
> data width.
>
> This is needed for formats like SNDRV_PCM_FMTBIT_S24_LE where physical
> width is 32 and data width is 24. By using the physical width, data
> won't get misaligned.


There are different requirements for this slot width. Some need physical
width,
Some need format width. We need to be careful about change here.

Actually there is .set_tdm_slot API for slot specific setting, please use
this API.

best regards
wang shengjiu

>
> Signed-off-by: Emil Svendsen <emas@bang-olufsen.dk>
> ---
>  sound/soc/fsl/fsl_sai.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 939c6bdd22c4..213e2d462076 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -519,13 +519,13 @@ static int fsl_sai_hw_params(struct
> snd_pcm_substream *substream,
>         unsigned int channels =3D params_channels(params);
>         struct snd_dmaengine_dai_dma_data *dma_params;
>         struct fsl_sai_dl_cfg *dl_cfg =3D sai->dl_cfg;
> +       u32 slot_width =3D params_physical_width(params);
>         u32 word_width =3D params_width(params);
>         int trce_mask =3D 0, dl_cfg_idx =3D 0;
>         int dl_cfg_cnt =3D sai->dl_cfg_cnt;
>         u32 dl_type =3D FSL_SAI_DL_I2S;
>         u32 val_cr4 =3D 0, val_cr5 =3D 0;
>         u32 slots =3D (channels =3D=3D 1) ? 2 : channels;
> -       u32 slot_width =3D word_width;
>         int adir =3D tx ? RX : TX;
>         u32 pins, bclk;
>         u32 watermark;
> --
> 2.34.1
>

--000000000000f8129e05f829571b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 30, 2023 at 4:30=E2=80=AF=
PM Emil Abildgaard Svendsen &lt;<a href=3D"mailto:EMAS@bang-olufsen.dk">EMA=
S@bang-olufsen.dk</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Slot width should follow the physical width of the format =
instead of the<br>
data width.<br>
<br>
This is needed for formats like SNDRV_PCM_FMTBIT_S24_LE where physical<br>
width is 32 and data width is 24. By using the physical width, data<br>
won&#39;t get misaligned.</blockquote><div>=C2=A0</div><div>There are diffe=
rent requirements for this slot width. Some=C2=A0need physical width,=C2=A0=
</div><div>Some need format width. We need to be careful about change here.=
=C2=A0</div><div><br></div><div>Actually there is=C2=A0.set_tdm_slot API fo=
r slot specific setting, please use this API.</div><div><br></div><div>best=
 regards</div><div>wang shengjiu</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
Signed-off-by: Emil Svendsen &lt;<a href=3D"mailto:emas@bang-olufsen.dk" ta=
rget=3D"_blank">emas@bang-olufsen.dk</a>&gt;<br>
---<br>
=C2=A0sound/soc/fsl/fsl_sai.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c<br>
index 939c6bdd22c4..213e2d462076 100644<br>
--- a/sound/soc/fsl/fsl_sai.c<br>
+++ b/sound/soc/fsl/fsl_sai.c<br>
@@ -519,13 +519,13 @@ static int fsl_sai_hw_params(struct snd_pcm_substream=
 *substream,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned int channels =3D params_channels(param=
s);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct snd_dmaengine_dai_dma_data *dma_params;<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct fsl_sai_dl_cfg *dl_cfg =3D sai-&gt;dl_cf=
g;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 slot_width =3D params_physical_width(params=
);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 word_width =3D params_width(params);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int trce_mask =3D 0, dl_cfg_idx =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int dl_cfg_cnt =3D sai-&gt;dl_cfg_cnt;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 dl_type =3D FSL_SAI_DL_I2S;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 val_cr4 =3D 0, val_cr5 =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 slots =3D (channels =3D=3D 1) ? 2 : channel=
s;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0u32 slot_width =3D word_width;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int adir =3D tx ? RX : TX;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 pins, bclk;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 watermark;<br>
-- <br>
2.34.1<br>
</blockquote></div></div>

--000000000000f8129e05f829571b--
