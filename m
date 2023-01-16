Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5558666BBF7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 11:39:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwT6k0wrgz3cL8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 21:39:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MkrUq/l0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MkrUq/l0;
	dkim-atps=neutral
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwRWW7246z3bPW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 20:27:33 +1100 (AEDT)
Received: by mail-wr1-x436.google.com with SMTP id r2so26825853wrv.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 01:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0fL8mB8BX2m52K+g0Xkw42Va6IJ7ZctxrJQvVmh1JjM=;
        b=MkrUq/l0saEo60AwJwUf8AHcJO2+n7qw1aAtp0ay/z2nKCLd5VhDAeYTSFUgRv9o5B
         uzCORI8EFl7SWYjqOigPPztXVdVlErhh5xzm9fUef5x2hIGGYoAfw8VPsoDCS3p9LYGi
         2VshFzZX5G1QAnRO+oXmfzt7urXykg9EA2L1zHguXkIh7sVAIdAIA3vtpvssyct97Drx
         48aX9eGRE46Za0eVHRexeHbcfyidQjhzCXwoPP8HTTYziVZE1YL+c1EGrgS7lqKIsveg
         9W+XNwCLPTIxS3CTIH3AIWAblcSh1jSWsigsdQ2snyMV1POH6W2d1G9NvaK8Fg8Gya4/
         S7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0fL8mB8BX2m52K+g0Xkw42Va6IJ7ZctxrJQvVmh1JjM=;
        b=y/0sy5MKQX3NdrHy+ToYTqVUZvPVB9chuO98eps7c3LoDSSKe8kVOD3sQLwA2Tmmo1
         eTQpyWL+NV2+eMUZAIJJpO2sTV67piCmH6se0tpK8Vm2ZQ5MHfxTsqrk2pJsK1BdPuiN
         u0EMs0Se3rFbQVTqfMh2vxP2g94wnVeVvDXusiD+P64AiI5g/EQDTyyeBQTjghIDXK1O
         6yYIrdiwze4VKTpyH7DGV0QUZTq9ALSleRX3DKGLjL+cj4vsEgCdrlreeKTZv2CpFXoW
         WtDgI2+peq5Y9iBnhDkC87tr8M73wqvMZwUIQO22+o92+u+3omRHo1tXpRyz6ryBBOWX
         uuiA==
X-Gm-Message-State: AFqh2koUZF5hzTLoOJ7ZjNCgQ+MAZxwHT4rXCRNwjVdYGbn5iFAJDj7k
	k84gG1HIvaRPT5unwDQAug3qhIn+YC4of9L+Gx0=
X-Google-Smtp-Source: AMrXdXv1QR3rYL6snx9Uz4+SyO4G6+WLnL97LJ5sRt4kAn1kG/TmNeOUM2MQyhhSRXdr5ezBsE9bux8r91Zp37q7klA=
X-Received: by 2002:adf:e702:0:b0:2bb:e8d1:f660 with SMTP id
 c2-20020adfe702000000b002bbe8d1f660mr1004342wrm.167.1673861250625; Mon, 16
 Jan 2023 01:27:30 -0800 (PST)
MIME-Version: 1.0
References: <20230111161144.3275546-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20230111161144.3275546-1-alexander.stein@ew.tq-group.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 16 Jan 2023 17:27:19 +0800
Message-ID: <CAA+D8AMfNe9wJm9oYhKkOHEqKcCWU2gTKaSAtPNUnHgg00r0UQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] ASoC: fsl_sai: Use dev_err_probe
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Content-Type: multipart/alternative; boundary="0000000000003f3a1a05f25e31fb"
X-Mailman-Approved-At: Mon, 16 Jan 2023 21:37:59 +1100
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000003f3a1a05f25e31fb
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 12, 2023 at 12:11 AM Alexander Stein <
alexander.stein@ew.tq-group.com> wrote:

> This helps figuring out why the device probe is deferred, e.g. missing
> FSL_EDMA driver.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
> Old:
> root@ls1021:~# cat /sys/kernel/debug/devices_deferred
> sound   fsl-asoc-card: snd_soc_register_card failed: -517
> 2b50000.sai
>
> New:
> root@ls1021:~# cat /sys/kernel/debug/devices_deferred
> sound   fsl-asoc-card: snd_soc_register_card failed: -517
> 2b50000.sai     fsl-sai: Registering PCM dmaengine failed
>
>  sound/soc/fsl/fsl_sai.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 1c9be8a5dcb13..2a38e2bdf9893 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1458,14 +1458,17 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>         if (sai->soc_data->use_imx_pcm) {
>                 ret = imx_pcm_dma_init(pdev);
>                 if (ret) {
> +                       dev_err_probe(dev, ret, "PCM DMA init failed\n");
>                         if (!IS_ENABLED(CONFIG_SND_SOC_IMX_PCM_DMA))
>                                 dev_err(dev, "Error: You must enable the
> imx-pcm-dma support!\n");
>                         goto err_pm_get_sync;
>                 }
>         } else {
>                 ret = devm_snd_dmaengine_pcm_register(dev, NULL, 0);
> -               if (ret)
> +               if (ret) {
> +                       dev_err_probe(dev, ret, "Registering PCM dmaengine
> failed\n");
>                         goto err_pm_get_sync;
> +               }
>         }
>
>         ret = devm_snd_soc_register_component(dev, &fsl_component,
> --
> 2.34.1
>
>

--0000000000003f3a1a05f25e31fb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 12, 2023 at 12:11 AM Alex=
ander Stein &lt;<a href=3D"mailto:alexander.stein@ew.tq-group.com">alexande=
r.stein@ew.tq-group.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">This helps figuring out why the device probe is defe=
rred, e.g. missing<br>
FSL_EDMA driver.<br>
<br>
Signed-off-by: Alexander Stein &lt;<a href=3D"mailto:alexander.stein@ew.tq-=
group.com" target=3D"_blank">alexander.stein@ew.tq-group.com</a>&gt;<br></b=
lockquote><div><br></div><div>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto=
:shengjiu.wang@gmail.com">shengjiu.wang@gmail.com</a>&gt;</div><div><br></d=
iv><div>Best regards</div><div>Wang Shengjiu=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
---<br>
Old:<br>
root@ls1021:~# cat /sys/kernel/debug/devices_deferred <br>
sound=C2=A0 =C2=A0fsl-asoc-card: snd_soc_register_card failed: -517<br>
2b50000.sai<br>
<br>
New:<br>
root@ls1021:~# cat /sys/kernel/debug/devices_deferred <br>
sound=C2=A0 =C2=A0fsl-asoc-card: snd_soc_register_card failed: -517<br>
2b50000.sai=C2=A0 =C2=A0 =C2=A0fsl-sai: Registering PCM dmaengine failed<br=
>
<br>
=C2=A0sound/soc/fsl/fsl_sai.c | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c<br>
index 1c9be8a5dcb13..2a38e2bdf9893 100644<br>
--- a/sound/soc/fsl/fsl_sai.c<br>
+++ b/sound/soc/fsl/fsl_sai.c<br>
@@ -1458,14 +1458,17 @@ static int fsl_sai_probe(struct platform_device *pd=
ev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (sai-&gt;soc_data-&gt;use_imx_pcm) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D imx_pcm_dma=
_init(pdev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err_probe(dev, ret, &quot;PCM DMA init failed\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (!IS_ENABLED(CONFIG_SND_SOC_IMX_PCM_DMA))<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev, &quot;Error: You must e=
nable the imx-pcm-dma support!\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto err_pm_get_sync;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D devm_snd_dm=
aengine_pcm_register(dev, NULL, 0);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0dev_err_probe(dev, ret, &quot;Registering PCM dmaengine failed\n&=
quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto err_pm_get_sync;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D devm_snd_soc_register_component(dev, &a=
mp;fsl_component,<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--0000000000003f3a1a05f25e31fb--
