Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB3675C7FC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 15:39:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cwd+YR3l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6rJD3BbCz3c3j
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 23:39:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cwd+YR3l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6jgp26F3z30YT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 18:40:53 +1000 (AEST)
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-2640a8ceefdso966562a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 01:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689928848; x=1690533648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2pGzRRVQVi2kQNmNTUJmwk9RB1uD77Gzuy8FpEwpW64=;
        b=cwd+YR3lFiPdsAbK6MUOven0NVx+wBfRcHCUOMXQtTJQyzh8X7PONdEfH753G2/Ozr
         QWIpsBEFg9a7utpdvcs4nZ7yNBNmBQEzhEg+pGAMlaNtqc1W9D9PI6cpC8UDEECYxROa
         OpUn7vfilNbRSSSwr1w1xMpOJdYmunxttAhJFn2vJqk5VZiKx+GtoDExnUWOUjiVDZIZ
         YdNscAxulsS8lnKosH0wNQ64PbDeRz1EVy9NS2vjYPIv+pZoOjXYYAtbmw3uKQjC7OIZ
         p6SDADADSqK84++IdopYDr8iKe861fIgHtja2UCOzHT9Pw5i58Jp47wdkMev1/i+uB8e
         JHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689928848; x=1690533648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2pGzRRVQVi2kQNmNTUJmwk9RB1uD77Gzuy8FpEwpW64=;
        b=CnNIx9rN831P08Ca1MX34CqQDS03KgFl76myD4TyTiyQhF6v5gHFu9RjRrDpNwbOLu
         0Hpm0oq4cfmJOelzW/Py8qPAxb53MlEOoSvaqgAfHkCkxL70HZvL1z+QfT9bZAQ1TQvX
         KZ6ubgHzKYayrXP0+9QgMpFRn3NIjqt05KjDdIA4OzbEU29nLhoiPdG0v13IJtt5MXFf
         s64YE32dQ37PuIQm8b0pTkbqLciGyMW3Vmni+hpkQEJTH2GBfI1xgN9DzrKF3FGLj3ge
         U3sET9R4/XWLtgNE4jlmxiBruytzd0k+Wr69tZbuhQTkLXiKWnYbk/yE86/aS0Y5UgxH
         +DTA==
X-Gm-Message-State: ABy/qLZ+Vv7M1V83dE1jy4E+32BrvolpROqL6u8m7+iHg5lI27cQMmiP
	Os5FRzv45kOd2ABjESNrdP1HlR8g53T/YkY9jVw=
X-Google-Smtp-Source: APBJJlHU0NzcLMC2i97oAN+aTzVnIgpOEpYKnU6x+Q3I52jbhYWEdhAOzMHFt2m0pETfr1IDrwRbwt+DfufVJ43xi/E=
X-Received: by 2002:a17:90b:3782:b0:260:e7ad:3659 with SMTP id
 mz2-20020a17090b378200b00260e7ad3659mr1065682pjb.12.1689928848571; Fri, 21
 Jul 2023 01:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230717145106.28013-1-ruc_gongyuanjun@163.com>
In-Reply-To: <20230717145106.28013-1-ruc_gongyuanjun@163.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 21 Jul 2023 16:40:37 +0800
Message-ID: <CAA+D8AP-3SWJe21qfMVz0j3umvS9bzDkeuQtab4OFrc2Ur+eVw@mail.gmail.com>
Subject: Re: [PATCH 1/1] sound:soc: fix return value check in imx_audmux_suspend
To: Yuanjun Gong <ruc_gongyuanjun@163.com>
Content-Type: multipart/alternative; boundary="000000000000b703180600fb382f"
X-Mailman-Approved-At: Fri, 21 Jul 2023 23:38:36 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, Fabio Estevam <festevam@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000b703180600fb382f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 10:51=E2=80=AFPM Yuanjun Gong <ruc_gongyuanjun@163.=
com>
wrote:

> check the return value of clk_prepare_enable, and if
> clk_prepare_enable got an unexpected return value,
> imx_audmux_suspend should return the error value.
>
> Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
> ---
>  sound/soc/fsl/imx-audmux.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
> index be003a117b39..962b6baf0a34 100644
> --- a/sound/soc/fsl/imx-audmux.c
> +++ b/sound/soc/fsl/imx-audmux.c
> @@ -325,8 +325,11 @@ static void imx_audmux_remove(struct platform_device
> *pdev)
>  static int imx_audmux_suspend(struct device *dev)
>  {
>         int i;
> +       ssize_t ret;
>
> -       clk_prepare_enable(audmux_clk);
> +       ret =3D clk_prepare_enable(audmux_clk);
> +       if (ret)
> +               return ret;
>
> Please combine the two related patches together as one patch.

commit subject can use ASoC: imx-audmux: xxxxx

best regards
wang shengjiu

>         for (i =3D 0; i < reg_max; i++)
>                 regcache[i] =3D readl(audmux_base + i * 4);
> --
> 2.17.1
>
>

--000000000000b703180600fb382f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 17, 2023 at 10:51=E2=80=
=AFPM Yuanjun Gong &lt;<a href=3D"mailto:ruc_gongyuanjun@163.com">ruc_gongy=
uanjun@163.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">check the return value of clk_prepare_enable, and if<br>
clk_prepare_enable got an unexpected return value,<br>
imx_audmux_suspend should return the error value.<br>
<br>
Signed-off-by: Yuanjun Gong &lt;<a href=3D"mailto:ruc_gongyuanjun@163.com" =
target=3D"_blank">ruc_gongyuanjun@163.com</a>&gt;<br>
---<br>
=C2=A0sound/soc/fsl/imx-audmux.c | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c<br>
index be003a117b39..962b6baf0a34 100644<br>
--- a/sound/soc/fsl/imx-audmux.c<br>
+++ b/sound/soc/fsl/imx-audmux.c<br>
@@ -325,8 +325,11 @@ static void imx_audmux_remove(struct platform_device *=
pdev)<br>
=C2=A0static int imx_audmux_suspend(struct device *dev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ssize_t ret;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_prepare_enable(audmux_clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(audmux_clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
<br></blockquote><div>Please combine the two related patches together as on=
e patch.</div><div><br></div><div>commit subject can use=C2=A0ASoC: imx-aud=
mux: xxxxx</div><div><br></div><div>best regards</div><div>wang shengjiu=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; reg_max; i++)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regcache[i] =3D rea=
dl(audmux_base + i * 4);<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--000000000000b703180600fb382f--
