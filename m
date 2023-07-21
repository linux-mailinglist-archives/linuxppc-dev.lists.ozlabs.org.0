Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A5F75C805
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 15:40:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rE3DzRp7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6rKF4BLcz3cNC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jul 2023 23:40:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=rE3DzRp7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6k2R4Bmyz30hW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 18:57:02 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5638180156aso484977a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jul 2023 01:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689929819; x=1690534619;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j8WQBkFu4tvTXD4bPW+LHU2k2KLsKgRpTrrvokeBKL0=;
        b=rE3DzRp7BBFN9+X6t2vQSf8I5YjmSjf0KNRlimILxrEIgplLXbteHHMMYLBsvSi7vf
         nhthK2nfGqXJbcm3FVXDCyiy0WsmRyFypzE7hP3oHo8IAQcLFoBw2H013XNUj/TithMX
         bapZOvfYljRFQXEV4W3aKZ7ylxrth9VfL0zbPxVLXXlCeTSW2Twa3c1pY7DVSnZQiqoo
         bvzmEepXEFopUXUWYW0hjRGtNQVIhaZtkqmn00S6cXR2yrtqBYDVZxQg5JSEhwiGMEbF
         AZAWedNJJI+Hh+QED9KYzseytK7MeBMCMxMAr4bzuQfffSLMefEQLEpGSxlIl56SlL0x
         3MJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689929819; x=1690534619;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j8WQBkFu4tvTXD4bPW+LHU2k2KLsKgRpTrrvokeBKL0=;
        b=eHHal3G5gOLUyzW9JpQITxI3NvUVaTt0Sj2ycudkj8opI9DByUls35yJyGjx+A2hso
         pef8zlMl/lQlwu1dRmVehGVzpOoYIS59nFIsLrigrdP+AN2busgP5eBEnXlcc0t8EEOL
         EhuxMCksT4W97nerX/lSO1++rLud3v8C9KDR9Ho2rWSe18nPoh5fuVd9lcN7ZvqBeVfC
         l2Ca3bBb0vW4i/wHwWzFaBSCTwnC1kWksduTKj1c8PLlOmJKx6vImQcVeRG0Du9da34K
         Widi+U16St3S/hlKt45zv0f7i8DMP8EXhH7HM3pk4l3hu3vPOiL1tVNyl5HZhleT5waV
         gY0A==
X-Gm-Message-State: ABy/qLau2XU4s1KzuqREtmY+60maYrBpH/N+yU80rJclkEKJ9jOVWU2t
	Ara0GLIDe5BINoPnMfzsfbCdm/szujgX3FrwHUh/PR0T
X-Google-Smtp-Source: APBJJlHTifAwLppS7bDTlmvVIi9dZMaNGMAPe58R+h3YwyWR1/lE+O3ukij7vgdmWXh8OdY1JzAtabbj2DJxXNgjdjA=
X-Received: by 2002:a17:90b:4b03:b0:259:b065:da4f with SMTP id
 lx3-20020a17090b4b0300b00259b065da4fmr1091854pjb.36.1689929819610; Fri, 21
 Jul 2023 01:56:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230717145058.27860-1-ruc_gongyuanjun@163.com>
In-Reply-To: <20230717145058.27860-1-ruc_gongyuanjun@163.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 21 Jul 2023 16:56:48 +0800
Message-ID: <CAA+D8AMgcS_gx15evivo665Ta=FRLJwpfx7U0YD1zyg6gC=3_Q@mail.gmail.com>
Subject: Re: [PATCH 1/1] sound:soc: fix return value check in imx_audmux_resume
To: Yuanjun Gong <ruc_gongyuanjun@163.com>
Content-Type: multipart/alternative; boundary="00000000000097e05b0600fb7255"
X-Mailman-Approved-At: Fri, 21 Jul 2023 23:38:37 +1000
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

--00000000000097e05b0600fb7255
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 10:51=E2=80=AFPM Yuanjun Gong <ruc_gongyuanjun@163.=
com>
wrote:

> check the return value of clk_prepare_enable, and if
> clk_prepare_enable got an unexpected return value,
> imx_audmux_resume should return the error value.
>
> Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
> ---
>  sound/soc/fsl/imx-audmux.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
> index be003a117b39..e8a3a1baf18d 100644
> --- a/sound/soc/fsl/imx-audmux.c
> +++ b/sound/soc/fsl/imx-audmux.c
> @@ -339,8 +339,11 @@ static int imx_audmux_suspend(struct device *dev)
>  static int imx_audmux_resume(struct device *dev)
>  {
>         int i;
> +       ssize_t ret;
>
> -       clk_prepare_enable(audmux_clk);
> +       ret =3D clk_prepare_enable(audmux_clk);
> +       if (ret)
> +               return ret;
>

Please combine this with another one patch.

best regards
wang shengjiu

>
>         for (i =3D 0; i < reg_max; i++)
>                 writel(regcache[i], audmux_base + i * 4);
> --
> 2.17.1
>
>

--00000000000097e05b0600fb7255
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 17, 2023 at 10:51=E2=80=
=AFPM Yuanjun Gong &lt;<a href=3D"mailto:ruc_gongyuanjun@163.com">ruc_gongy=
uanjun@163.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">check the return value of clk_prepare_enable, and if<br>
clk_prepare_enable got an unexpected return value,<br>
imx_audmux_resume should return the error value.<br>
<br>
Signed-off-by: Yuanjun Gong &lt;<a href=3D"mailto:ruc_gongyuanjun@163.com" =
target=3D"_blank">ruc_gongyuanjun@163.com</a>&gt;<br>
---<br>
=C2=A0sound/soc/fsl/imx-audmux.c | 5 ++++-<br>
=C2=A01 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c<br>
index be003a117b39..e8a3a1baf18d 100644<br>
--- a/sound/soc/fsl/imx-audmux.c<br>
+++ b/sound/soc/fsl/imx-audmux.c<br>
@@ -339,8 +339,11 @@ static int imx_audmux_suspend(struct device *dev)<br>
=C2=A0static int imx_audmux_resume(struct device *dev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ssize_t ret;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_prepare_enable(audmux_clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(audmux_clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br></bl=
ockquote><div><br></div><div>Please combine this with another one patch.</d=
iv><div><br></div><div>best regards</div><div>wang shengjiu=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; reg_max; i++)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(regcache[i],=
 audmux_base + i * 4);<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--00000000000097e05b0600fb7255--
