Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9952953E1C7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 10:50:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGnJJ3Nwsz3f6p
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 18:50:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CCK6R9fY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::131; helo=mail-lf1-x131.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CCK6R9fY;
	dkim-atps=neutral
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGdk1362Cz30BK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jun 2022 13:08:55 +1000 (AEST)
Received: by mail-lf1-x131.google.com with SMTP id a15so21280351lfb.9
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jun 2022 20:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G2x6Km6jqmzUcms9TJteVuhDuyeG5cr45Q2FwBy0BUc=;
        b=CCK6R9fYFA6FcUuhSHpVJrg7bqI1Q6u2hrGOxBQr5cCj3b+oYek9Rkz9VhsSa5hVqL
         W3IdO6AMLNyE/IsPHZEBo5+xJYifb7XniGljFIEU8ZyTe4y1zObFV2983/ilcRDfzYnM
         TFMw9bHgvY2Sv3yFGXSeIvKdMC8G0wl8MAnfpYJrzx6jSsyPR7iZkp+C7uP8mYmUTMMN
         5klo/sEoo0vDpy+0krLD7QXWJljBaBUhpr/9DSMR6A5lkeMej1BNTPhE8YZMrcjud2bP
         +YI9cvVMWjA4ZWijXH8KArha7QoQjTSOWll/1I19qlusHOREB/QxWlwa1Jro9jII3DTE
         vd+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G2x6Km6jqmzUcms9TJteVuhDuyeG5cr45Q2FwBy0BUc=;
        b=7ho16sUOXsQy+2pB5ac/Ep87M2/r79pB8vmPlBETT5DDTvI+jU9AI2OpEVZa2fpOFh
         MKKPAH/iGqHnshQe0Wk1QbvzVbSQ/VPXWAPvyB8/woGtV0Gf5CxpBK4421r2qhjQGDgY
         uRg6uW7Y3n3aIjECgJX4vIQXlbECo48MuDz9OtdOXBkd6BMY2WydSPZUvBYWw4NsxzSC
         S2TBLOP6AtOsgs5RCRxvB7gAg09rJhV8dRVTlyR8zqOdk5mmmtBOsVULylbVWQLLzlg/
         3txIVQCNfHIY8sGZsH6vVNj7/g02+5PlkBjOW1n8LZHQK3DJp7FxCX2NlcSzy0+Uv7EO
         kIaA==
X-Gm-Message-State: AOAM532ZkJLk7tyWR80rFDwnU+2ogjynQm6pm/GiXsHNxhD6OClMaEdS
	liokbc/p1TehDJqD/vG9ATwmblakTkwKr8tZemQ=
X-Google-Smtp-Source: ABdhPJyxIQkRNb/4Awsg9fDOiczn7ze05jH4883awHV7OMNsYV0FAJjOMfHcUI2NJvEU9biFnXSg0O8yCFq0KKTarDw=
X-Received: by 2002:a05:6512:1399:b0:448:9f0b:bf4f with SMTP id
 p25-20020a056512139900b004489f0bbf4fmr13663742lfa.67.1654484931130; Sun, 05
 Jun 2022 20:08:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220602072024.33236-1-zhangqilong3@huawei.com>
In-Reply-To: <20220602072024.33236-1-zhangqilong3@huawei.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 6 Jun 2022 11:08:39 +0800
Message-ID: <CAA+D8APj13+dJwTaaNLtJqjiNSmJDCpE7yfReingZYAuXHVOtw@mail.gmail.com>
Subject: Re: [PATCH V4] ASoC: fsl_xcvr:Fix unbalanced pm_runtime_enable in fsl_xcvr_probe
To: zhangqilong <zhangqilong3@huawei.com>
Content-Type: multipart/alternative; boundary="0000000000009b396105e0beca21"
X-Mailman-Approved-At: Mon, 06 Jun 2022 18:49:00 +1000
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

--0000000000009b396105e0beca21
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 2, 2022 at 3:18 PM zhangqilong <zhangqilong3@huawei.com> wrote:

> a) Add missing pm_runtime_disable() when probe error out. It could
> avoid pm_runtime implementation complains when removing and probing
> again the driver.
> b) Add remove for missing pm_runtime_disable().
>
> Fix:c590fa80b3928 ("ASoC: fsl_xcvr: register platform component before
> registering cpu dai")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang shengjiu

> ---
> v2:
> - Add remove to put PM usage counter.
>
> v3:
> - Modify the commit message.
> ---
>  sound/soc/fsl/fsl_xcvr.c | 9 +++++++++
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

--0000000000009b396105e0beca21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 2, 2022 at 3:18 PM zhangq=
ilong &lt;<a href=3D"mailto:zhangqilong3@huawei.com">zhangqilong3@huawei.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>a) Add missing pm_runtime_disable() when probe error out. It could<br>
avoid pm_runtime implementation complains when removing and probing<br>
again the driver.<br>
b) Add remove for missing pm_runtime_disable().<br>
<br>
Fix:c590fa80b3928 (&quot;ASoC: fsl_xcvr: register platform component before=
 registering cpu dai&quot;)<br>
Signed-off-by: Zhang Qilong &lt;<a href=3D"mailto:zhangqilong3@huawei.com" =
target=3D"_blank">zhangqilong3@huawei.com</a>&gt;<br></blockquote><div><br>=
</div><div>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmai=
l.com">shengjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>Best regard=
s</div><div>Wang shengjiu=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
---<br>
v2:<br>
- Add remove to put PM usage counter.<br>
<br>
v3:<br>
- Modify the commit message.<br>
---<br>
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

--0000000000009b396105e0beca21--
