Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 22CCF4FEA10
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 00:10:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdKfy1bkgz3bkb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 08:10:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Dq9qCWRi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2a;
 helo=mail-qv1-xf2a.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Dq9qCWRi; dkim-atps=neutral
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com
 [IPv6:2607:f8b0:4864:20::f2a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kd5926H7mz2x9J
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 22:47:32 +1000 (AEST)
Received: by mail-qv1-xf2a.google.com with SMTP id n11so5200261qvl.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 05:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Uf26CSHYkOwDOB1S0eT0on3rfsA2SjwMHNO70E9q4Js=;
 b=Dq9qCWRiRMN4ZEqYz8M2dm2clZzXHRuZqiiISLpIpoDvZRvHyjtag0GBlxFyJQSVHX
 mVnLr2hMYFKjOyIsTz/6wZHRDgaNcKYj5JCHhL7SXy4RxSk47Y7GvJeLDlfMkiRjVgCx
 q4k1gl0YUPkRfBSIv8UsOzJq45wOMu1nO4IRCN+xviMhVgkxiBIKrY05OFQ0acA0EhlO
 lwSj2P6Tucc4KcEvOKcUWfelPojX9saLs7eIkAj+u2f/KDk9gzt20gHYExhPzOUXmmKq
 qFs+nFcIHs6JzGeDAdLmGodUoqqBXauvYlf+BFm6fxNA8fd4Atw0jcoHyNf0O7Mj+Xdn
 NczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uf26CSHYkOwDOB1S0eT0on3rfsA2SjwMHNO70E9q4Js=;
 b=YF3rWw/rLJZt5Pz3rR8YOY4Zu/b/ZutZg+A/pThWa/LrgwtcTTJIJr+5HtIcQstL4k
 6rJnicWRuGTkGjvQKH7CTPUTQbQW+/HycaVrkkcOgsvDbrv0HCcrGn8YYMWxAUl+QMRj
 skcEVOFcfXLYkJBnJXDfGai+7Hm5A2XXzv94m/yQUgkpBtftlr2nDjyFUWN35dgh7MmU
 LcDTbBW0K8ixAnXbnntegAoULNB8sPxgKYr67jtsJDsJnQwgvRs2XKOnJuidOpmHt1qa
 fJZBG4FwP04d5h0KHFxSushuJcAsHmq6j/xiE8qzhTc638LDnTJnCQo5T1RLKGLMxiNP
 E0nA==
X-Gm-Message-State: AOAM530RsWsRVYQH4f4Yy7HzoZC4u+nKfSBF8xeRd/+4SE0/QKqYi6Ni
 UD+hg4zCVZl5MYlH95P6E/iFLbBv62p7jO+AvfY=
X-Google-Smtp-Source: ABdhPJxnM7Wj2F53tbYjAgDmzH+nyL1exL8AJ/2RdnJ8VCCrQfgFGN5WFA/IuZe11jsUiH/VqA4JvKlaGkzczYdlHSM=
X-Received: by 2002:a05:6214:4112:b0:441:720:8434 with SMTP id
 kc18-20020a056214411200b0044107208434mr31667346qvb.23.1649767647528; Tue, 12
 Apr 2022 05:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220412083000.2532711-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220412083000.2532711-1-chi.minghao@zte.com.cn>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 12 Apr 2022 20:47:16 +0800
Message-ID: <CAA+D8APHhp9esL-vVMvYQL+m2mPbUrW=i=bGbgTWMO2Fj8AcZw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: using pm_runtime_resume_and_get instead of
 pm_runtime_get_sync
To: cgel.zte@gmail.com
Content-Type: multipart/alternative; boundary="00000000000097cab305dc74760f"
X-Mailman-Approved-At: Wed, 13 Apr 2022 08:10:19 +1000
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Zeal Robot <zealci@zte.com.cn>,
 Liam Girdwood <lgirdwood@gmail.com>, Minghao Chi <chi.minghao@zte.com.cn>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--00000000000097cab305dc74760f
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 12, 2022 at 4:30 PM <cgel.zte@gmail.com> wrote:

> From: Minghao Chi <chi.minghao@zte.com.cn>
>
> Using pm_runtime_resume_and_get is more appropriate
> for simplifing code
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
>  sound/soc/fsl/fsl_esai.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
> index ed444e8f1d6b..1a2bdf8e76f0 100644
> --- a/sound/soc/fsl/fsl_esai.c
> +++ b/sound/soc/fsl/fsl_esai.c
> @@ -1050,11 +1050,9 @@ static int fsl_esai_probe(struct platform_device
> *pdev)
>                         goto err_pm_disable;
>         }
>
> -       ret = pm_runtime_get_sync(&pdev->dev);
> -       if (ret < 0) {
> -               pm_runtime_put_noidle(&pdev->dev);
> +       ret = pm_runtime_resume_and_get(&pdev->dev);
> +       if (ret < 0)
>                 goto err_pm_get_sync;
> -       }
>
>         ret = fsl_esai_hw_init(esai_priv);
>         if (ret)
> --
> 2.25.1
>
>

--00000000000097cab305dc74760f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 12, 2022 at 4:30 PM &lt;<=
a href=3D"mailto:cgel.zte@gmail.com">cgel.zte@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">From: Minghao Chi &l=
t;<a href=3D"mailto:chi.minghao@zte.com.cn" target=3D"_blank">chi.minghao@z=
te.com.cn</a>&gt;<br>
<br>
Using pm_runtime_resume_and_get is more appropriate<br>
for simplifing code<br>
<br>
Reported-by: Zeal Robot &lt;<a href=3D"mailto:zealci@zte.com.cn" target=3D"=
_blank">zealci@zte.com.cn</a>&gt;<br>
Signed-off-by: Minghao Chi &lt;<a href=3D"mailto:chi.minghao@zte.com.cn" ta=
rget=3D"_blank">chi.minghao@zte.com.cn</a>&gt;<br></blockquote><div><br></d=
iv><div>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.c=
om">shengjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>Best regards</=
div><div>Wang Shengjiu=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
---<br>
=C2=A0sound/soc/fsl/fsl_esai.c | 6 ++----<br>
=C2=A01 file changed, 2 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c<br>
index ed444e8f1d6b..1a2bdf8e76f0 100644<br>
--- a/sound/soc/fsl/fsl_esai.c<br>
+++ b/sound/soc/fsl/fsl_esai.c<br>
@@ -1050,11 +1050,9 @@ static int fsl_esai_probe(struct platform_device *pd=
ev)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 goto err_pm_disable;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D pm_runtime_get_sync(&amp;pdev-&gt;dev);=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pm_runtime_put_noid=
le(&amp;pdev-&gt;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D pm_runtime_resume_and_get(&amp;pdev-&gt=
;dev);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret &lt; 0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_pm_get_syn=
c;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D fsl_esai_hw_init(esai_priv);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ret)<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--00000000000097cab305dc74760f--
