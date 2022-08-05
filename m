Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0D658A5D0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 08:11:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzZwb0t75z3c6K
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 16:11:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BfyWZLNA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=BfyWZLNA;
	dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LzVs01S9xz2xGx
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Aug 2022 13:07:46 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id d14so1612640lfl.13
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Aug 2022 20:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=zRLrhdcOQ99bka6D1fOqnb8SZpDSCBPIHHf+1lVBXSM=;
        b=BfyWZLNA0WA0wwe8aQmwrq46RWQdKrrLB7XyPlQeQqyFVErsZG1WvpkTCT31caCh8p
         eS4iXl4wK2kGOigufJo9S6qacJG7Eeaa2Plgda6L4JEOntGA7+Ntl3onJjaYf3A0B9SW
         1BkPF8lXNS0d2d+JZNp6gcv8k9AdMoBbj3pS2STf6GJMN4s43va/D1TBDg0KF1iK66d1
         9TXiq1kkHRqa3CXqhTaWqGclcKM/BN3YWYEmrJvyYrqGjKy7yaUTA+Y0fJJE1QKzWi6s
         tG5YslrcsH+AjecGEMiuFGWZW2nnqVBBdvqGW97jmSsm9rS5RsFQ8M+GSSlV1hgj4iNr
         wNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=zRLrhdcOQ99bka6D1fOqnb8SZpDSCBPIHHf+1lVBXSM=;
        b=2Wfqt4wVrLnk63wHuhZQAcWQlStAN7WAmflVNY+BgkJwahSH8QAUQZxkXU/ziI3OSt
         7VgPSaZAfY0U88HWg/vIuT/LVC2gzOvjK75TWpI1qTZ1MhULBy/np4GK3NfAt6SAyBbD
         6dN/9d7hQUxqi8joX7z1zykgilysdHZqxyrCH56hmtkuPIjU250tn7SS/1T6jSm+r9EE
         huL2+N+qpJjsZf5CiLAtx0oU2g4nEq2uCWR9O5yefA34gaI0YTgXKhb2mALJ87Nef+np
         Q1FALcRKdJ6UvS53ZwFk5rD1Y77pPsoYHmQrR36bzhCbWJvJ4dceuhKzPcz55pkX4XTd
         Fahw==
X-Gm-Message-State: ACgBeo3R5TkposndnxPNORzKuK1NxrhXPYZHImq4HJbzSqZQv1AknvyZ
	EF2yz2Q+KfquTrcMtLI68UEF8hfP/79Rmcdbp7c=
X-Google-Smtp-Source: AA6agR7Qfp8bF/c/dF8zcpgjC+nUpj98cRP4PLX8RQikDQJwywgbYhLTmF+vMFugwMjtJr0FnROMW2IDC92kB8tr+ec=
X-Received: by 2002:a05:6512:31ca:b0:48a:2e3:db41 with SMTP id
 j10-20020a05651231ca00b0048a02e3db41mr1573570lfe.285.1659668862329; Thu, 04
 Aug 2022 20:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220507123101.10938-1-pieterjan.camerlynck@gmail.com>
In-Reply-To: <20220507123101.10938-1-pieterjan.camerlynck@gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 5 Aug 2022 11:07:31 +0800
Message-ID: <CAA+D8ANzaCGEAZUdZsCmKhuw+gXSXdHP7S0RW__xu7FYp+Rdcw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: fix incorrect mclk number in error message
To: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>, Mark Brown <broonie@kernel.org>
Content-Type: multipart/alternative; boundary="000000000000fbe73c05e575c460"
X-Mailman-Approved-At: Fri, 05 Aug 2022 16:10:40 +1000
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-kernel <linux-kernel@vger.kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000fbe73c05e575c460
Content-Type: text/plain; charset="UTF-8"

On Sat, May 7, 2022 at 8:31 PM Pieterjan Camerlynck <
pieterjan.camerlynck@gmail.com> wrote:

> In commit <c3ecef21c3f26> ("ASoC: fsl_sai: add sai master mode support")
> the loop was changed to start iterating from 1 instead of 0. The error
> message however was not updated, reporting the wrong clock to the user.
>
> Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
>

Please resend it and cc Mark

Best regards
Wang shengjiu

> ---
>  sound/soc/fsl/fsl_sai.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index ffc24afb5a7a..f0602077b385 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1054,7 +1054,7 @@ static int fsl_sai_probe(struct platform_device
> *pdev)
>                 sai->mclk_clk[i] = devm_clk_get(&pdev->dev, tmp);
>                 if (IS_ERR(sai->mclk_clk[i])) {
>                         dev_err(&pdev->dev, "failed to get mclk%d clock:
> %ld\n",
> -                                       i + 1, PTR_ERR(sai->mclk_clk[i]));
> +                                       i, PTR_ERR(sai->mclk_clk[i]));
>                         sai->mclk_clk[i] = NULL;
>                 }
>         }
> --
> 2.25.1
>
>

--000000000000fbe73c05e575c460
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, May 7, 2022 at 8:31 PM Pieter=
jan Camerlynck &lt;<a href=3D"mailto:pieterjan.camerlynck@gmail.com">pieter=
jan.camerlynck@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">In commit &lt;c3ecef21c3f26&gt; (&quot;ASoC: fsl_sa=
i: add sai master mode support&quot;)<br>
the loop was changed to start iterating from 1 instead of 0. The error<br>
message however was not updated, reporting the wrong clock to the user.<br>
<br>
Signed-off-by: Pieterjan Camerlynck &lt;<a href=3D"mailto:pieterjan.camerly=
nck@gmail.com" target=3D"_blank">pieterjan.camerlynck@gmail.com</a>&gt;<br>=
</blockquote><div><br></div><div>Please resend it and cc Mark</div><div><br=
></div><div>Best regards</div><div>Wang shengjiu=C2=A0<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0sound/soc/fsl/fsl_sai.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c<br>
index ffc24afb5a7a..f0602077b385 100644<br>
--- a/sound/soc/fsl/fsl_sai.c<br>
+++ b/sound/soc/fsl/fsl_sai.c<br>
@@ -1054,7 +1054,7 @@ static int fsl_sai_probe(struct platform_device *pdev=
)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sai-&gt;mclk_clk[i]=
 =3D devm_clk_get(&amp;pdev-&gt;dev, tmp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(sai-&gt;=
mclk_clk[i])) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 dev_err(&amp;pdev-&gt;dev, &quot;failed to get mclk%d clock: %ld=
\n&quot;,<br>
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

--000000000000fbe73c05e575c460--
