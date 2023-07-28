Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A31AE766DCF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 15:02:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Qw3efA8U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RC78F2J8cz3cVf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jul 2023 23:02:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Qw3efA8U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::531; helo=mail-pg1-x531.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBvmc72YDz2yTt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jul 2023 14:29:34 +1000 (AEST)
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-55b0e7efb1cso1009060a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jul 2023 21:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690518573; x=1691123373;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aXTLyMaqru71WShxogJjoqJv9Kj4TUwbHx2BfpbIe18=;
        b=Qw3efA8U0++dG87w9gB6FHB3Yz2pJgTODylcGMIsiboZntGt19DPNwN0Dzc8wxUX+d
         X8oT7WyDA7xUliuLYzHHyepNpSSF5RD4cAO+/RYrfW/lGMzCHnMoZlPSYOUVinTvSKLJ
         hZ9APKHcgYvWfWokmC8iBn2aVXgeCYXivRRCOneqeGM0cwjvQ1z4P74sAfFvxeV6/mwh
         xoMNz+7lkYw9tMJhuVEgg+4nyRhOpqn7uzMp8+GT6tPZLx64TDXXZwuZRy4R+koFoAXV
         mqvEi0wNg6LwtqF2FdM2f1lpIUjRstg6YItsWnTvpUjTCR5Vz28tpJ3httCYwaQmN/z7
         NVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690518573; x=1691123373;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aXTLyMaqru71WShxogJjoqJv9Kj4TUwbHx2BfpbIe18=;
        b=mENZegIZgmRSOsC1wxjs8nzr9iLHZiiaBVTnX1NsCTeUDcn2w22cPaEa6Qbw2b7ZC4
         wV8Ln6xBiK5O/4VlmG5BRdVhxMkiMlNkruvf4y1wSsNJRdecPgOa+iLEbQtoiK8ZJci8
         TMl2Yprm+CqNDf+GWaiwuUn6cyujdLtyO2Ioog7iudSOW3Osn6qycrb1qyizXmPiZvih
         12ggoigk1lC03g2S/M+CT1kusjEHCQH9GPoJrGrTxeP2Xh5VfwOPsNEQbTNPXRikhAzd
         4/CL+XfpqTiZqLSjtvLvANVsOg8rocGuTj8lmZYSoSAkm1H75+O7vY0qb4Oz4CeHyHvD
         Ad1g==
X-Gm-Message-State: ABy/qLaj0FqA/UZN3bGvbQJuBioTPk7wRm8IvvczpErF5wlHkU0XiIN4
	W4Xf0H8BqtEj8I4APPrlFSlPGsH196JKh5O11iU=
X-Google-Smtp-Source: APBJJlGh3BHQ/F8S8CMwIiwJMvlKlQA6m4+/NlHkcOqjiYlFu0dExjIsdJ/HOwVY4csy3TuNrfoUugSrPLWK54FyWMg=
X-Received: by 2002:a17:90b:3b8e:b0:268:78ab:e8c1 with SMTP id
 pc14-20020a17090b3b8e00b0026878abe8c1mr571988pjb.19.1690518572854; Thu, 27
 Jul 2023 21:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAA+D8AP-3SWJe21qfMVz0j3umvS9bzDkeuQtab4OFrc2Ur+eVw@mail.gmail.com>
 <20230722123635.26623-1-ruc_gongyuanjun@163.com>
In-Reply-To: <20230722123635.26623-1-ruc_gongyuanjun@163.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 28 Jul 2023 12:29:21 +0800
Message-ID: <CAA+D8AM=Y-ARVRyCqja-Ehz44SCLh6rMKQKYhv68VSd4qNq0GA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] ASoC: imx-audmux: fix return value checks of clk_prepare_enable()
To: Yuanjun Gong <ruc_gongyuanjun@163.com>
Content-Type: multipart/alternative; boundary="0000000000000573e0060184877b"
X-Mailman-Approved-At: Fri, 28 Jul 2023 23:01:37 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, festevam@gmail.com, Xiubo.Lee@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000000573e0060184877b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 22, 2023 at 8:38=E2=80=AFPM Yuanjun Gong <ruc_gongyuanjun@163.c=
om>
wrote:

> check the return value of clk_prepare_enable(), and if
> clk_prepare_enable() gets an unexpected return value,
> imx_audmux_suspend() and imx_audmux_resume() should return
> the error value.
>
>
please use the ./scripts/get_maintainer.pl to get the maillist
and resend the patch.

best regards
wang shengjiu


> Signed-off-by: Yuanjun Gong <ruc_gongyuanjun@163.com>
> ---
>  sound/soc/fsl/imx-audmux.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
> index be003a117b39..9791e56158ef 100644
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
>         for (i =3D 0; i < reg_max; i++)
>                 regcache[i] =3D readl(audmux_base + i * 4);
> @@ -339,8 +342,11 @@ static int imx_audmux_suspend(struct device *dev)
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
>         for (i =3D 0; i < reg_max; i++)
>                 writel(regcache[i], audmux_base + i * 4);
> --
> 2.17.1
>
>

--0000000000000573e0060184877b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 22, 2023 at 8:38=E2=80=AF=
PM Yuanjun Gong &lt;<a href=3D"mailto:ruc_gongyuanjun@163.com">ruc_gongyuan=
jun@163.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">check the return value of clk_prepare_enable(), and if<br>
clk_prepare_enable() gets an unexpected return value,<br>
imx_audmux_suspend() and imx_audmux_resume() should return<br>
the error value.<br>
<br></blockquote><div><br></div><div>please use the=C2=A0./scripts/<a href=
=3D"http://get_maintainer.pl">get_maintainer.pl</a> to get the maillist</di=
v><div>and resend the patch.</div><div><br></div><div>best regards</div><di=
v>wang shengjiu</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
Signed-off-by: Yuanjun Gong &lt;<a href=3D"mailto:ruc_gongyuanjun@163.com" =
target=3D"_blank">ruc_gongyuanjun@163.com</a>&gt;<br>
---<br>
=C2=A0sound/soc/fsl/imx-audmux.c | 10 ++++++++--<br>
=C2=A01 file changed, 8 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c<br>
index be003a117b39..9791e56158ef 100644<br>
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
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; reg_max; i++)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 regcache[i] =3D rea=
dl(audmux_base + i * 4);<br>
@@ -339,8 +342,11 @@ static int imx_audmux_suspend(struct device *dev)<br>
=C2=A0static int imx_audmux_resume(struct device *dev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ssize_t ret;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_prepare_enable(audmux_clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(audmux_clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i &lt; reg_max; i++)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(regcache[i],=
 audmux_base + i * 4);<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--0000000000000573e0060184877b--
