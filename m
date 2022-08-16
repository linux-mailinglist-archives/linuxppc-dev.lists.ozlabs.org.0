Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C39BB595452
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 10:00:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6Nq24gBGz3bkx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 17:59:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SxF1uTOE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SxF1uTOE;
	dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6Fc36M11z2xGQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 12:34:57 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id bx38so9324146ljb.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 19:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=vmY+LUCJruKF8uLc3XlHm/fJT0a+m0ghSI6+yD5XTag=;
        b=SxF1uTOEDfk3qpRS8vrws1X9rPL0pWXqD5SeWgJSoSEIxAe2LjVcSc2Ms2uC/MzoSr
         b1KL0gMu7nxtqlDHUvsHX90BIlV4ErkwKvUp9vO8f8Ug3u1o8UQ5hEnApbhdpIxgJDsT
         Uq3MeuEfM/Jn7wsR+xlbtjiMtwGGpvuaQYsBSEgM4FxWmr7MSFPT+C/W6IZnlLoT3UyM
         +fuRhM63M30hg6vQhOyKe9yUugiJGNCnjkZHsKQ64wqd8RFxcZeq+H+sZo+NpTcAJWSr
         LqOzUpPy4Jov7HqZFDhweENUQl5ojcHj7CQBjW9cEKibR/enBOhWomaKKekIB63g65Fv
         rkEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=vmY+LUCJruKF8uLc3XlHm/fJT0a+m0ghSI6+yD5XTag=;
        b=OA06MTzCG4Dn++SBHw5QyhMJCIdjkd97NQ8yvcYvjfY4P6uidF5+Z8DEcSBx1nc0eO
         fQdP4JzET1WjicKei44qqiIJbFJ7QV8eEJ/gsCG5eAXxJnt8QNHeBIKb/imLP0T7et4L
         Xmst2RJOHUjxN29UXhdx8o8B7a2We7r8uH5AV27HuwQT22jFd81EnYenB3z377AKh3+Q
         Spqf68k4fjOftaP6nSubNKDYVjQuxqvj1OinrTw4mOPs3OkewhCXuhKiPmWOb4EmgL7H
         hxf3s3ADKhrTiydksWqFau0ucycVSBH5WcDt5RxUMwMNbV0BIv/PKDlp3Q/u2Vp76T+J
         /GWA==
X-Gm-Message-State: ACgBeo1I7sZUxpXjO+RlfXSH2t+bfxIw+TVjt+OEQPxREbCXw0qWdqye
	S7vITUd21ySHXq8eLUM0uEjD9tzrbf/780pOTFA=
X-Google-Smtp-Source: AA6agR4pZpz+E+mZWSp2TEXSFno6q0tnw2P+5v+jTyqjZvCeszMWPDWVBLCrJh6OVtSiGey7VZVViK56eitP0OvMchg=
X-Received: by 2002:a05:651c:ba5:b0:25e:c5d4:4341 with SMTP id
 bg37-20020a05651c0ba500b0025ec5d44341mr6095297ljb.272.1660617291087; Mon, 15
 Aug 2022 19:34:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220813083353.8959-1-pieterjan.camerlynck@gmail.com>
In-Reply-To: <20220813083353.8959-1-pieterjan.camerlynck@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 16 Aug 2022 10:34:39 +0800
Message-ID: <CAA+D8AN45E-2ATVQMY7z3OOQJwGuZQ9NJiSFfmQNN-rgYwKbsQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl_sai: fix incorrect mclk number in error message
To: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000be455305e65297c1"
X-Mailman-Approved-At: Tue, 16 Aug 2022 17:59:28 +1000
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000be455305e65297c1
Content-Type: text/plain; charset="UTF-8"

On Sat, Aug 13, 2022 at 4:34 PM Pieterjan Camerlynck <
pieterjan.camerlynck@gmail.com> wrote:

> In commit c3ecef21c3f26 ("ASoC: fsl_sai: add sai master mode support")
> the loop was changed to start iterating from 1 instead of 0. The error
> message however was not updated, reporting the wrong clock to the user.
>
> Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang shengjiu


> ---
> V2: rebase against latest version
> ---
>  sound/soc/fsl/fsl_sai.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 7523bb944b21..d430eece1d6b 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1306,7 +1306,7 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>                 sai->mclk_clk[i] = devm_clk_get(dev, tmp);
>                 if (IS_ERR(sai->mclk_clk[i])) {
>                         dev_err(dev, "failed to get mclk%d clock: %ld\n",
> -                                       i + 1, PTR_ERR(sai->mclk_clk[i]));
> +                                       i, PTR_ERR(sai->mclk_clk[i]));
>                         sai->mclk_clk[i] = NULL;
>                 }
>         }
> --
> 2.25.1
>
>

--000000000000be455305e65297c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 13, 2022 at 4:34 PM Piete=
rjan Camerlynck &lt;<a href=3D"mailto:pieterjan.camerlynck@gmail.com">piete=
rjan.camerlynck@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">In commit c3ecef21c3f26 (&quot;ASoC: fsl_sai: add =
sai master mode support&quot;)<br>
the loop was changed to start iterating from 1 instead of 0. The error<br>
message however was not updated, reporting the wrong clock to the user.<br>
<br>
Signed-off-by: Pieterjan Camerlynck &lt;<a href=3D"mailto:pieterjan.camerly=
nck@gmail.com" target=3D"_blank">pieterjan.camerlynck@gmail.com</a>&gt;<br>=
</blockquote><div><br></div><div>Acked-by: Shengjiu Wang &lt;<a href=3D"mai=
lto:shengjiu.wang@gmail.com">shengjiu.wang@gmail.com</a>&gt;</div><div><br>=
</div><div>Best regards</div><div>Wang shengjiu</div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
---<br>
V2: rebase against latest version<br>
---<br>
=C2=A0sound/soc/fsl/fsl_sai.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c<br>
index 7523bb944b21..d430eece1d6b 100644<br>
--- a/sound/soc/fsl/fsl_sai.c<br>
+++ b/sound/soc/fsl/fsl_sai.c<br>
@@ -1306,7 +1306,7 @@ static int fsl_sai_probe(struct platform_device *pdev=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sai-&gt;mclk_clk[i]=
 =3D devm_clk_get(dev, tmp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(sai-&gt;=
mclk_clk[i])) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dev_err(dev, &quot;failed to get mclk%d clock: %ld\n&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i + 1, PT=
R_ERR(sai-&gt;mclk_clk[i]));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0i, PTR_ER=
R(sai-&gt;mclk_clk[i]));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sai-&gt;mclk_clk[i] =3D NULL;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000be455305e65297c1--
