Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 946E85F89AE
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 08:25:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MlX9L2y2Vz3dqr
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Oct 2022 17:25:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D7NYE0Hx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=D7NYE0Hx;
	dkim-atps=neutral
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MlX0M2mSSz3bSX
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Oct 2022 17:17:55 +1100 (AEDT)
Received: by mail-lj1-x232.google.com with SMTP id m14so10041339ljg.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 08 Oct 2022 23:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=12EYphgmnc/c7perX/VmCZNpBq64skd06e0y/NyYIGQ=;
        b=D7NYE0HxNeaTJ3C4FEym0Oi06jTlJG16omPqXDDBjdsVdj6Dw/mPKt+IrY/SmYKqx5
         e9dutjn+2h2Tj95yF3R5BBWULdHH57mCDCTruPjXS23Qx3YLDt40YFUKR9IiC60mJvhb
         Lnx7xkXdIzpwwKBDysF7a3eAQDRm1ZWI9Czq9CFWeSLKtjIxyUn+6/F+gj+azlXmN+JU
         Iv2dAuXkok0HwGvxO2qBD+wOBk4FZdXjZiXccZFZ4GPFNGX0pLVNSrSMNVz1it4HbGGB
         VTEQ8KynIg0qUEiq69pvNYkd2aLhn5QuhI4+i+abhOtEKTKqlF15hO5g6JA0WWcYDi+N
         dgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=12EYphgmnc/c7perX/VmCZNpBq64skd06e0y/NyYIGQ=;
        b=6pmogqCv3ZPHJW0xs0pbfoyr38P4Y0pxgi2pKRJ/fBypUGYPKAEbV+EiLivyvrMnSG
         cP/t3OnRsjm7aVC9S+G3jW2krEENEtK/tfhW0yntIvMsGXs8HFoFSiDJ9TwXYlg5J7nD
         fvFSEUWUPK2QBkHsrGlvH5AFUqBU6nMhl5sDYup/DrcE8bNTRKxnSfo/E7WfbgWgC3GR
         B6fK1NX5PB3Oc4LelbK6oJqSCqOraXwYT7Q9pno5zGd5YCBaM0hgrjhccDVHDeigCgkH
         1mRqAwGeVN5RiCiybsd9yhXXqgMh3JWsNFfcfA3Qf9Kx9mfbOT5W0gldOAf8iK2Jo4wP
         dlTg==
X-Gm-Message-State: ACrzQf2W5PjZC9vmKjT6M4W3iB34O3kZCdYGMK3B2Qt2iO9ewt2AaxcW
	lePgaSCuaDgaZxvLGnWJWyjc0bYSwTRTw2unhI8=
X-Google-Smtp-Source: AMsMyM6z+kNTipjJsXuIHvVzJX3b+5dvY9KhlpsXlaOwLiyi202BpzJkcxa6eDCYr5XZfUGya4f2/oskmkRhS80CQq0=
X-Received: by 2002:a2e:a7c3:0:b0:26e:8dd3:5e41 with SMTP id
 x3-20020a2ea7c3000000b0026e8dd35e41mr2153667ljp.392.1665296271640; Sat, 08
 Oct 2022 23:17:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220930064441.2548505-1-chancel.liu@nxp.com> <20220930064441.2548505-4-chancel.liu@nxp.com>
In-Reply-To: <20220930064441.2548505-4-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 9 Oct 2022 14:17:40 +0800
Message-ID: <CAA+D8AP4X-K2jhkcP-FnO5pHKpB7cY8bESo_zT82eAXLFU+mKA@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] ASoC: imx-pcm-rpmsg: Register different platform drivers
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: multipart/alternative; boundary="000000000000b791f405ea9400cb"
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

--000000000000b791f405ea9400cb
Content-Type: text/plain; charset="UTF-8"

On Fri, Sep 30, 2022 at 2:46 PM Chancel Liu <chancel.liu@nxp.com> wrote:

> This patch can register different ASoC platform drivers if there are
> several rpmsg channels. Thus sound cards based on different rpmsg
> channels can link to their respective platform drivers. Besides, the
> name of driver is equal to the name of rpmsg channel.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/imx-pcm-rpmsg.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
> index 35049043e532..3157cd5a837e 100644
> --- a/sound/soc/fsl/imx-pcm-rpmsg.c
> +++ b/sound/soc/fsl/imx-pcm-rpmsg.c
> @@ -684,7 +684,7 @@ static int imx_rpmsg_pcm_probe(struct platform_device
> *pdev)
>         info->rpdev = container_of(pdev->dev.parent, struct rpmsg_device,
> dev);
>         info->dev = &pdev->dev;
>         /* Setup work queue */
> -       info->rpmsg_wq = alloc_ordered_workqueue("rpmsg_audio",
> +       info->rpmsg_wq = alloc_ordered_workqueue(info->rpdev->id.name,
>                                                  WQ_HIGHPRI |
>                                                  WQ_UNBOUND |
>                                                  WQ_FREEZABLE);
> @@ -723,11 +723,15 @@ static int imx_rpmsg_pcm_probe(struct
> platform_device *pdev)
>         if (ret)
>                 goto fail;
>
> -       component = snd_soc_lookup_component(&pdev->dev, IMX_PCM_DRV_NAME);
> +       component = snd_soc_lookup_component(&pdev->dev, NULL);
>         if (!component) {
>                 ret = -EINVAL;
>                 goto fail;
>         }
> +
> +       /* platform component name is used by machine driver to link with
> */
> +       component->name = info->rpdev->id.name;
> +
>  #ifdef CONFIG_DEBUG_FS
>         component->debugfs_prefix = "rpmsg";
>  #endif
> --
> 2.25.1
>
>

--000000000000b791f405ea9400cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 30, 2022 at 2:46 PM Chanc=
el Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com">chancel.liu@nxp.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This p=
atch can register different ASoC platform drivers if there are<br>
several rpmsg channels. Thus sound cards based on different rpmsg<br>
channels can link to their respective platform drivers. Besides, the<br>
name of driver is equal to the name of rpmsg channel.<br>
<br>
Signed-off-by: Chancel Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com" targe=
t=3D"_blank">chancel.liu@nxp.com</a>&gt;<br></blockquote><div><br></div><di=
v>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com">sh=
engjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>Best regards</div><d=
iv>Wang Shengjiu=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
---<br>
=C2=A0sound/soc/fsl/imx-pcm-rpmsg.c | 8 ++++++--<br>
=C2=A01 file changed, 6 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c<=
br>
index 35049043e532..3157cd5a837e 100644<br>
--- a/sound/soc/fsl/imx-pcm-rpmsg.c<br>
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c<br>
@@ -684,7 +684,7 @@ static int imx_rpmsg_pcm_probe(struct platform_device *=
pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;rpdev =3D container_of(pdev-&gt;dev.pa=
rent, struct rpmsg_device, dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;dev =3D &amp;pdev-&gt;dev;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Setup work queue */<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;rpmsg_wq =3D alloc_ordered_workqueue(&=
quot;rpmsg_audio&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;rpmsg_wq =3D alloc_ordered_workqueue(i=
nfo-&gt;rpdev-&gt;<a href=3D"http://id.name" rel=3D"noreferrer" target=3D"_=
blank">id.name</a>,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0WQ_HIGHPRI |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0WQ_UNBOUND |<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0WQ_FREEZABLE);<br>
@@ -723,11 +723,15 @@ static int imx_rpmsg_pcm_probe(struct platform_device=
 *pdev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0component =3D snd_soc_lookup_component(&amp;pde=
v-&gt;dev, IMX_PCM_DRV_NAME);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0component =3D snd_soc_lookup_component(&amp;pde=
v-&gt;dev, NULL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!component) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* platform component name is used by machine d=
river to link with */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0component-&gt;name =3D info-&gt;rpdev-&gt;<a hr=
ef=3D"http://id.name" rel=3D"noreferrer" target=3D"_blank">id.name</a>;<br>
+<br>
=C2=A0#ifdef CONFIG_DEBUG_FS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 component-&gt;debugfs_prefix =3D &quot;rpmsg&qu=
ot;;<br>
=C2=A0#endif<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000b791f405ea9400cb--
