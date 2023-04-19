Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA366E78A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 13:29:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1dqL27dJz3gPb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 21:29:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=XMIwSffg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=XMIwSffg;
	dkim-atps=neutral
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1S7w41Rjz3cGH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 14:13:16 +1000 (AEST)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f173af665fso14001805e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 21:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681877592; x=1684469592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0akbJljmojF3UJNSUOLXeu8f3O++7bqonY0yv+A1TrU=;
        b=XMIwSffgsGWjELoKkkm698JTXva7wRaUxD245dGJdtvmwZe4HSog5T6nxs8g6QraRl
         8elWDC/a5LMy2iF2eSnljf8f09kg8AaBqLNQMAQ5+Fl7MJe5PtuCG5nF6ZsaCmaw4VBF
         a5g6A2GH1AUgyCYga8ATIXJRSND/TT4jtMTQ8gvgrwNHX4gAHTFajG5vdMa+xlbU2zjg
         rn1hfOE/e0+zM2iJ+EVZ/ZpBeXk+CyIiWjdZAdLUsk8AJZBqNdpRl9LYcRCNIMj8icfq
         OAJUqzF/vZLLiqbrGwB/Bd8LyfjwBbs/IqGzXyq/LkwJAOnoGnZ7epkqURMTkZvWxV6u
         CMIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681877592; x=1684469592;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0akbJljmojF3UJNSUOLXeu8f3O++7bqonY0yv+A1TrU=;
        b=JvRp+iZDtbgKt6JYhsf/nCpnwDmO9TGrTbiKcwcHTfvfRdJrOVUkS7atRe9xQlkOMJ
         gGq3kTcvXCEN2MDO7ob5Ojo4qTH40QD5/yeLPVdH9MvtsSDBZ1ZasQTMfVXE5C/A68r7
         PV7ASmrFQNKyxGr2IwoASu0tUQOJtl8eG28rCmufIG3p2FGbHkJTy0UsCJc7HpI41zV6
         JHm5I7mAViqtbTTVvy3P8gCa+wgMldZs7fEe7MKl+rCmRsLEsjFmUbYm4ogHQa+pT/eh
         +wCb2WhF/me5nAdL7AjcI7/ounx7fTDC7Uz5vmE04PFvH39/N1js9KvliYT9oFefLPzm
         GiGA==
X-Gm-Message-State: AAQBX9eIdn/AgfrgC40j6Qlrnt+iGlouiMPWAE3Geeca3aQV2wItmvGB
	Z/9do2R0HzqFE/KfCTzM2GBGVmha1Cp4eIqD45k=
X-Google-Smtp-Source: AKy350ZiAxYLGbvX9YTP+GPSMewg+Ha4vzTJrde1v7HprSxa3S1Bn0zu7KGPozGuiItBEeId16ueHNoV2fe+7Bdw3oM=
X-Received: by 2002:a5d:4492:0:b0:2c7:17b8:5759 with SMTP id
 j18-20020a5d4492000000b002c717b85759mr672199wrq.3.1681877591909; Tue, 18 Apr
 2023 21:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230417133242.53339-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20230417133242.53339-1-n.zhandarovich@fintech.ru>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 19 Apr 2023 12:13:00 +0800
Message-ID: <CAA+D8AOX0Ad0U_6ZQhjGx+zMgr6TVkG53iesiX77pQcgnNFSFw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc_dma: fix potential null-ptr-deref
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
Content-Type: multipart/alternative; boundary="0000000000006be9bf05f9a8a477"
X-Mailman-Approved-At: Wed, 19 Apr 2023 20:57:19 +1000
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
Cc: alsa-devel@alsa-project.org, Natalia Petrova <n.petrova@fintech.ru>, lvc-project@linuxtesting.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000006be9bf05f9a8a477
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2023 at 9:33=E2=80=AFPM Nikita Zhandarovich <
n.zhandarovich@fintech.ru> wrote:

> dma_request_slave_channel() may return NULL which will lead to
> NULL pointer dereference error in 'tmp_chan->private'.
>
> Correct this behaviour by, first, switching from deprecated function
> dma_request_slave_channel() to dma_request_chan(). Secondly, enable
> sanity check for the resuling value of dma_request_chan().
> Also, fix description that follows the enacted changes and that
> concerns the use of dma_request_slave_channel().
>
> Fixes: 706e2c881158 ("ASoC: fsl_asrc_dma: Reuse the dma channel if
> available in Back-End")
> Co-developed-by: Natalia Petrova <n.petrova@fintech.ru>
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
wang shengjiu

> ---
>  sound/soc/fsl/fsl_asrc_dma.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> index 3b81a465814a..05a7d1588d20 100644
> --- a/sound/soc/fsl/fsl_asrc_dma.c
> +++ b/sound/soc/fsl/fsl_asrc_dma.c
> @@ -209,14 +209,19 @@ static int fsl_asrc_dma_hw_params(struct
> snd_soc_component *component,
>                 be_chan =3D
> soc_component_to_pcm(component_be)->chan[substream->stream];
>                 tmp_chan =3D be_chan;
>         }
> -       if (!tmp_chan)
> -               tmp_chan =3D dma_request_slave_channel(dev_be, tx ? "tx" =
:
> "rx");
> +       if (!tmp_chan) {
> +               tmp_chan =3D dma_request_chan(dev_be, tx ? "tx" : "rx");
> +               if (IS_ERR(tmp_chan)) {
> +                       dev_err(dev, "failed to request DMA channel for
> Back-End\n");
> +                       return -EINVAL;
> +               }
> +       }
>
>         /*
>          * An EDMA DEV_TO_DEV channel is fixed and bound with DMA event o=
f
> each
>          * peripheral, unlike SDMA channel that is allocated dynamically.
> So no
>          * need to configure dma_request and dma_request2, but get
> dma_chan of
> -        * Back-End device directly via dma_request_slave_channel.
> +        * Back-End device directly via dma_request_chan.
>          */
>         if (!asrc->use_edma) {
>                 /* Get DMA request of Back-End */
>

--0000000000006be9bf05f9a8a477
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 17, 2023 at 9:33=E2=80=AF=
PM Nikita Zhandarovich &lt;<a href=3D"mailto:n.zhandarovich@fintech.ru">n.z=
handarovich@fintech.ru</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">dma_request_slave_channel() may return NULL which wil=
l lead to<br>
NULL pointer dereference error in &#39;tmp_chan-&gt;private&#39;.<br>
<br>
Correct this behaviour by, first, switching from deprecated function<br>
dma_request_slave_channel() to dma_request_chan(). Secondly, enable<br>
sanity check for the resuling value of dma_request_chan().<br>
Also, fix description that follows the enacted changes and that<br>
concerns the use of dma_request_slave_channel().<br>
<br>
Fixes: 706e2c881158 (&quot;ASoC: fsl_asrc_dma: Reuse the dma channel if ava=
ilable in Back-End&quot;)<br>
Co-developed-by: Natalia Petrova &lt;<a href=3D"mailto:n.petrova@fintech.ru=
" target=3D"_blank">n.petrova@fintech.ru</a>&gt;<br>
Signed-off-by: Nikita Zhandarovich &lt;<a href=3D"mailto:n.zhandarovich@fin=
tech.ru" target=3D"_blank">n.zhandarovich@fintech.ru</a>&gt;<br></blockquot=
e><div><br></div><div>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengji=
u.wang@gmail.com">shengjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>=
Best regards</div><div>wang shengjiu=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
---<br>
=C2=A0sound/soc/fsl/fsl_asrc_dma.c | 11 ++++++++---<br>
=C2=A01 file changed, 8 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c<br=
>
index 3b81a465814a..05a7d1588d20 100644<br>
--- a/sound/soc/fsl/fsl_asrc_dma.c<br>
+++ b/sound/soc/fsl/fsl_asrc_dma.c<br>
@@ -209,14 +209,19 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_comp=
onent *component,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 be_chan =3D soc_com=
ponent_to_pcm(component_be)-&gt;chan[substream-&gt;stream];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp_chan =3D be_cha=
n;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tmp_chan)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp_chan =3D dma_re=
quest_slave_channel(dev_be, tx ? &quot;tx&quot; : &quot;rx&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!tmp_chan) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0tmp_chan =3D dma_re=
quest_chan(dev_be, tx ? &quot;tx&quot; : &quot;rx&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (IS_ERR(tmp_chan=
)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err(dev, &quot;failed to request DMA channel for Back-End\n&q=
uot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return -EINVAL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* An EDMA DEV_TO_DEV channel is fixed and=
 bound with DMA event of each<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* peripheral, unlike SDMA channel that is=
 allocated dynamically. So no<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* need to configure dma_request and dma_r=
equest2, but get dma_chan of<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Back-End device directly via dma_request_sla=
ve_channel.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * Back-End device directly via dma_request_cha=
n.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!asrc-&gt;use_edma) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Get DMA request =
of Back-End */<br>
</blockquote></div></div>

--0000000000006be9bf05f9a8a477--
