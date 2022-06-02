Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E3853B35E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 08:11:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LDFyw1hqwz3byY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jun 2022 16:11:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DLVEVzwa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DLVEVzwa;
	dkim-atps=neutral
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LD9XJ4f8Mz30DC
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jun 2022 12:52:00 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id o15so3862229ljp.10
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Jun 2022 19:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TpNrFeAUHEiuJn5JqT+slz/uAK22wiMfabJQ1vnT0bM=;
        b=DLVEVzwa87pZn7j1l6lEeNeQ4lgELbwBF/l6k+A5J2pWd2zKMHwqusGX84wUNeL21l
         kBF3aI64Z8tl6v4MVsVhUMs4QOuUSEylg7huxH6jiIuwRAOG6gNnceakYL6L9VvjaYRC
         GHkY3dZ9OJfktSVKLTCQTjx3IuanijUi5YXkSfVeeLwWasVA4IWYThwiZhXjantCCe4W
         +/pfzMlSHeTV3LnemtdbIf3E5mP+HHgPhPw35a62/P/6chXu7sVPh+CJUpIWn95LeNj5
         kaH8N1dghdAEBj1l6GBLzNbcYtswK/ZvgZYQ7I9AAug1nvNcj2GbJsqcjnOYqFE0cIcj
         S/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TpNrFeAUHEiuJn5JqT+slz/uAK22wiMfabJQ1vnT0bM=;
        b=OBBh5MXAj/cQPfJdSbxgqFO31BQFvCbLTjY2U/UMlFXgF0BvwKA/T+/5zAvOryF/QF
         evw5/8CGnUyOS+pqHp8wNIXNV8l9s2K3hABkrX1IEEzLxlVoVGUPXKLcasZs3aVfQjLr
         jcK1F3UgpX7buUuXrRFmnZw4UdAmAjU++8sTHNVnlhQHCvanPcZy7XRt2yml9TPw6TNO
         7i1r8p4bUCsbZArJNpS5iZGK1bOahKNz6W5TahyYWl2nYxiETl9mgcu9u90AdpJ/ilqv
         0Kqhdz3q+zn9Z2zicYSDFtaxaaWTCbFDYunjcES3jKu33G4puGZFN31QjMeC95frXtVi
         ZA1A==
X-Gm-Message-State: AOAM531DN+QgMr6NxZAQGzmVB83ZnnhLOgFKRnfvzuJQKE870LEefqEl
	2lbtdIpYryiz8zZffOrxxPL5+AlCohwQeqXJeyY=
X-Google-Smtp-Source: ABdhPJzemaRDxlsjG76/OUGceBVlHUFJwXleU0oYwHmcIUAwSqYDpFWZm5Xu0bQKxO44fiBRTnOLgCzLlVs2JIF0qQw=
X-Received: by 2002:a05:651c:1792:b0:235:1df3:7b8e with SMTP id
 bn18-20020a05651c179200b002351df37b8emr40560873ljb.464.1654138315702; Wed, 01
 Jun 2022 19:51:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220530083533.52254-1-zhangqilong3@huawei.com>
In-Reply-To: <20220530083533.52254-1-zhangqilong3@huawei.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 2 Jun 2022 10:51:44 +0800
Message-ID: <CAA+D8AMuZx0CT6GVVh5AhrAKJEFSumFPpAXkNnCdLX5FiwuFFw@mail.gmail.com>
Subject: Re: [PATCH V2] ASoC: fsl_xcvr:Fix unbalanced pm_runtime_enable in fsl_xcvr_probe
To: zhangqilong <zhangqilong3@huawei.com>
Content-Type: multipart/alternative; boundary="000000000000b7894305e06e16b7"
X-Mailman-Approved-At: Thu, 02 Jun 2022 16:11:20 +1000
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

--000000000000b7894305e06e16b7
Content-Type: text/plain; charset="UTF-8"

On Mon, May 30, 2022 at 4:33 PM zhangqilong <zhangqilong3@huawei.com> wrote:

> a) Add missing pm_runtime_disable() when probe error out. It could
> avoid pm_runtime implementation complains when removing and probing
> again the driver.
> b) Add remove for missing pm_runtime_disable().
>
> v2: add remove to put PM usage counter.


> Fix:c590fa80b3928 ("ASoC: fsl_xcvr: register platform component before
> registering cpu dai")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>

 The changelog should be in the place after "---"

Best regards
Wang shengjiu

 sound/soc/fsl/fsl_xcvr.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index d0556c79fdb1..55e640cba87d 100644
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
> @@ -1242,6 +1244,12 @@ static int fsl_xcvr_probe(struct platform_device
> *pdev)
>         return ret;
>  }
>
> +static int fsl_xcvr_remove(struct platform_device *pdev)
> +{
> +       pm_runtime_disable(&pdev->dev);
> +       return 0;
> +}
> +
>  static __maybe_unused int fsl_xcvr_runtime_suspend(struct device *dev)
>  {
>         struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
> @@ -1370,6 +1378,7 @@ static struct platform_driver fsl_xcvr_driver = {
>                 .pm = &fsl_xcvr_pm_ops,
>                 .of_match_table = fsl_xcvr_dt_ids,
>         },
> +       .remove = fsl_xcvr_remove,
>  };
>  module_platform_driver(fsl_xcvr_driver);
>
> --
> 2.31.1
>
>

--000000000000b7894305e06e16b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 30, 2022 at 4:33 PM zhang=
qilong &lt;<a href=3D"mailto:zhangqilong3@huawei.com">zhangqilong3@huawei.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">a) Add missing pm_runtime_disable() when probe error out. It could<br>
avoid pm_runtime implementation complains when removing and probing<br>
again the driver.<br>
b) Add remove for missing pm_runtime_disable().<br>
<br>
v2: add remove to put PM usage counter.</blockquote><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
Fix:c590fa80b3928 (&quot;ASoC: fsl_xcvr: register platform component before=
 registering cpu dai&quot;)<br>
Signed-off-by: Zhang Qilong &lt;<a href=3D"mailto:zhangqilong3@huawei.com" =
target=3D"_blank">zhangqilong3@huawei.com</a>&gt;<br>
---<br></blockquote><div><br></div><div>=C2=A0The changelog should be in th=
e place after &quot;---&quot;=C2=A0</div><div><br></div><div>Best regards</=
div><div>Wang shengjiu</div><div><br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
=C2=A0sound/soc/fsl/fsl_xcvr.c | 9 +++++++++<br>
=C2=A01 file changed, 9 insertions(+)<br>
<br>
diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c<br>
index d0556c79fdb1..55e640cba87d 100644<br>
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
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
@@ -1242,6 +1244,12 @@ static int fsl_xcvr_probe(struct platform_device *pd=
ev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return ret;<br>
=C2=A0}<br>
<br>
+static int fsl_xcvr_remove(struct platform_device *pdev)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_disable(&amp;pdev-&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
+}<br>
+<br>
=C2=A0static __maybe_unused int fsl_xcvr_runtime_suspend(struct device *dev=
)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct fsl_xcvr *xcvr =3D dev_get_drvdata(dev);=
<br>
@@ -1370,6 +1378,7 @@ static struct platform_driver fsl_xcvr_driver =3D {<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pm =3D &amp;fsl_xc=
vr_pm_ops,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .of_match_table =3D=
 fsl_xcvr_dt_ids,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.remove =3D fsl_xcvr_remove,<br>
=C2=A0};<br>
=C2=A0module_platform_driver(fsl_xcvr_driver);<br>
<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--000000000000b7894305e06e16b7--
