Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAE0535DA3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 11:52:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8g8W71w5z3byW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 19:52:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FWKNkvb6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FWKNkvb6;
	dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8d7056WVz2yhp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 18:21:15 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id m11so4198438ljc.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 01:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1bhxU9R3etbe0aMg7Elh3OdIVGpBwQKqRBhXNWuSOSc=;
        b=FWKNkvb63EkAcAUlzXUvM8I2I69XfNve9rJraEbZH5uCSgEGev1qFT2VW9fTOop6WR
         hZE2bZ7wwWB5FHkfLa67JVv0Rej1wO9lL8YuB04PA+ZFXU244nVt2GBGKWnbOUY/UdQz
         zEfyuqMiSYM9Gm4cV5OUw1a1uz1yOv90r9y6Td+00vWXYGMch6E2S4EQoMy6tgg8RGUN
         r7Q7OdcCtMmDyK2sVn5xOHJoixoMOpdxmorbcF87ECDDedQV4PKKoHu0Qio/5Vk8eDcQ
         KJCq6ZOm11FBwKyMNmOd36Bf+q2lOfjhV2ed9FohDvsbTP2bOiNjOMBwwUL3IMJ01w4v
         FKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1bhxU9R3etbe0aMg7Elh3OdIVGpBwQKqRBhXNWuSOSc=;
        b=NEqQavTD7a4SzYMR+fVc/w62qq6vXOdXO1//pfBkq+vX9impBaimHNkX08dj4eeyq/
         V9d/pKdDwQckfxDmmA6u6WL2j32VRXCZ4oRm58MxpGhJbdckZ6Jp7Aszg0s6WOCRnQ+D
         xMlwlFBQ597fR/64Hbfp1oUa5Jww9oBizgZuNbSNjkSOrGGweUYxeqzhVw4wFPGIqnA0
         Qp99B4F4ISG+iY7DkYeefzXYo9yhmhGplztiAid8UiHPis3IWm/paCfCxZYEDYwfP/gz
         2PS142/+2QLvFPo3iVmhnb8qkVvdkhdSRYE8iTD15VmU6S68ueNLm9bNeG6wvzhtbUVB
         jIRg==
X-Gm-Message-State: AOAM532Msyb+lWbTIqWO2BUZDy0igDVUxANZ5nFAVskh102NfDRfJyQM
	qaFPQY1l8AIpodVIM4f2UfFHVvsCm51rneMSrPo=
X-Google-Smtp-Source: ABdhPJyTHUXDwANLG6wBs8U8ygZ7Gn50fbaiJBAj1wFOlt4Q39yhMaTfZfyh6lxacwcUGmL1cS/NWxWO+5UgrcZKuEA=
X-Received: by 2002:a2e:a78f:0:b0:253:e71f:69a8 with SMTP id
 c15-20020a2ea78f000000b00253e71f69a8mr15839350ljf.432.1653639668071; Fri, 27
 May 2022 01:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220526011958.139391-1-zhangqilong3@huawei.com>
In-Reply-To: <20220526011958.139391-1-zhangqilong3@huawei.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 27 May 2022 16:20:56 +0800
Message-ID: <CAA+D8AOD=u0Q7Npy0z=r02CyM9qVu+-vbqTD2nGfO95K_t-xFA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr:Fix unbalanced pm_runtime_enable in fsl_xcvr_probe
To: zhangqilong <zhangqilong3@huawei.com>
Content-Type: multipart/alternative; boundary="0000000000000081c905dff9fd86"
X-Mailman-Approved-At: Fri, 27 May 2022 19:52:13 +1000
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000000081c905dff9fd86
Content-Type: text/plain; charset="UTF-8"

On Thu, May 26, 2022 at 9:18 AM zhangqilong <zhangqilong3@huawei.com> wrote:

> Add missing pm_runtime_disable() when probe error out. It could
> avoid pm_runtime implementation complains when removing and probing
> again the driver.
>
> Fix:c590fa80b3928 ("ASoC: fsl_xcvr: register platform component before
> registering cpu dai")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  sound/soc/fsl/fsl_xcvr.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index d0556c79fdb1..907435efe121 100644
> --- a/sound/soc/fsl/fsl_xcvr.c
> +++ b/sound/soc/fsl/fsl_xcvr.c
> @@ -1228,6 +1228,7 @@ static int fsl_xcvr_probe(struct platform_device
> *pdev)
>          */
>         ret = devm_snd_dmaengine_pcm_register(dev, NULL, 0);
>         if (ret) {
> +               pm_runtime_disable(dev);
>                 dev_err(dev, "failed to pcm register\n");
>                 return ret;
>         }
> @@ -1235,6 +1236,7 @@ static int fsl_xcvr_probe(struct platform_device
> *pdev)
>         ret = devm_snd_soc_register_component(dev, &fsl_xcvr_comp,
>                                               &fsl_xcvr_dai, 1);
>         if (ret) {
> +               pm_runtime_disable(dev);
>                 dev_err(dev, "failed to register component %s\n",
>                         fsl_xcvr_comp.name);
>         }
>
> Could you please also help add remove() function and add
pm_runtime_disable()
in the remove()?
Thanks.

best regards
wang shengjiu

--0000000000000081c905dff9fd86
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 26, 2022 at 9:18 AM zhang=
qilong &lt;<a href=3D"mailto:zhangqilong3@huawei.com">zhangqilong3@huawei.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">Add missing pm_runtime_disable() when probe error out. It could<br>
avoid pm_runtime implementation complains when removing and probing<br>
again the driver.<br>
<br>
Fix:c590fa80b3928 (&quot;ASoC: fsl_xcvr: register platform component before=
 registering cpu dai&quot;)<br>
Signed-off-by: Zhang Qilong &lt;<a href=3D"mailto:zhangqilong3@huawei.com" =
target=3D"_blank">zhangqilong3@huawei.com</a>&gt;<br>
---<br>
=C2=A0sound/soc/fsl/fsl_xcvr.c | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c<br>
index d0556c79fdb1..907435efe121 100644<br>
--- a/sound/soc/fsl/fsl_xcvr.c<br>
+++ b/sound/soc/fsl/fsl_xcvr.c<br>
@@ -1228,6 +1228,7 @@ static int fsl_xcvr_probe(struct platform_device *pde=
v)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D devm_snd_dmaengine_pcm_register(dev, NU=
LL, 0);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_disable(=
dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev, &quot;=
failed to pcm register\n&quot;);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
@@ -1235,6 +1236,7 @@ static int fsl_xcvr_probe(struct platform_device *pde=
v)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D devm_snd_soc_register_component(dev, &a=
mp;fsl_xcvr_comp,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &amp;fsl_xcvr_dai, 1);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_disable(=
dev);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev, &quot;=
failed to register component %s\n&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 <a href=3D"http://fsl_xcvr_comp.name" rel=3D"noreferrer" target=
=3D"_blank">fsl_xcvr_comp.name</a>);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br><br></blockquote><div>Could you please als=
o help add remove() function and add pm_runtime_disable()</div><div>in the =
remove()?</div><div>Thanks.</div><div><br></div><div>best regards</div><div=
>wang shengjiu</div></div></div>

--0000000000000081c905dff9fd86--
