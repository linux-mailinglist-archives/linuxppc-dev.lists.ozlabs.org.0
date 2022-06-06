Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8135953E1C5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 10:49:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LGnGy2f1Jz3btr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jun 2022 18:49:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a+vuSOi6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a+vuSOi6;
	dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LGcJl50N7z304G
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jun 2022 12:05:25 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id j10so21116580lfe.12
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Jun 2022 19:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=usJf20AAKPNtkFpO9IZiGVXBDrUnP/ALbP63KHhfdLQ=;
        b=a+vuSOi68MhI1PKcYt3CMKt9Uf57841GUcl9gCLFK4tfHAJN48nnCmiwniiVs9BuRd
         yVZLjQ2Kr/LDR1XsRn/V22KGLrjUEHH+ZzYFAg/O8jSBgnHWPPFak/0ZzhGp6h8a14x3
         2HV9wB1P5QXJi9QpbM6nc4o9wKsQc+NUvZSdGTSsYleyR2MdLV/vcPErSZC9yXqqZ01v
         xVBKscWN7yNui6uyk4VDE1KLEOt3PZUkjDphq1o4N5ZDjk3eetObHHVfXgJF3IAEapY7
         QElmOyA0NIFyWqHrxSklUCgxVvhL2tGqDDU6+oGP7ACSFDt6zgNt3fq1XBNo0ZHKkWo4
         Zhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=usJf20AAKPNtkFpO9IZiGVXBDrUnP/ALbP63KHhfdLQ=;
        b=hhDp3hpDHLcbvydL9rx1yS/95JWi2iiXVln5io8Enw6Bc41ZEzOZ8Pg+MFl2sdkWgR
         aQnWgAi8IEbtTHJFtUqyI4y9K8NKCHpPptOu9MYKACmdcTUiK/4P/p6AitFwun5JvN88
         csxSZIsOxF0eQgQfpYf56WrJWDDulnY1J8kHC+26n44I64iuXThlwzveTupzcPfd8L+a
         esPJrWp9dXclOoOcjbYv30IxDbbSgAhx479G9wEHQ2oIbKr7o8nibV2wSOS5Qjeapy3A
         AAvcsqkO1ybJEOMCtw6Tlz5DaDfzBzyCZ7FexkwHAuke4IoFSkkm1X0vtEQsKttktP5k
         uglw==
X-Gm-Message-State: AOAM530IZMTQAs/j+6bjpCXdcDYnC7BSkkJ2n2LtreQhslE1qs2Xr0mE
	SII5940Zin7ZqStTgnRnWegKArMiJ4gTczjVb0Q=
X-Google-Smtp-Source: ABdhPJwBmXnUl2NGPk5lZ8R0xen/iXYV2x5d7WrIVpi6p25LtCkBtFqrb5Op3lqB6XE56tNT16CkC2WEnU654rAl2JY=
X-Received: by 2002:a19:6445:0:b0:479:141c:cb5b with SMTP id
 b5-20020a196445000000b00479141ccb5bmr11724447lfj.280.1654481121323; Sun, 05
 Jun 2022 19:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220602071448.277968-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220602071448.277968-1-chi.minghao@zte.com.cn>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 6 Jun 2022 10:05:10 +0800
Message-ID: <CAA+D8ANagLtpLHP7PpqoSEHkNkCg+Xq-j1QNzoL2SWw1ko_r5g@mail.gmail.com>
Subject: Re: [PATCH] ASoC: imx-audmux: remove unnecessary check of clk_disable_unprepare
To: cgel.zte@gmail.com
Content-Type: multipart/alternative; boundary="000000000000863c1105e0bde762"
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
Cc: alsa-devel@alsa-project.org, linux-kernel <linux-kernel@vger.kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Zeal Robot <zealci@zte.com.cn>, Liam Girdwood <lgirdwood@gmail.com>, Minghao Chi <chi.minghao@zte.com.cn>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000863c1105e0bde762
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 2, 2022 at 3:14 PM <cgel.zte@gmail.com> wrote:

> From: Minghao Chi <chi.minghao@zte.com.cn>
>
> Because clk_disable_unprepare already checked NULL clock
> parameter, so the additional checks are unnecessary, just remove them.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
> ---
>  sound/soc/fsl/imx-audmux.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
> index dfa05d40b276..f434fa7decc1 100644
> --- a/sound/soc/fsl/imx-audmux.c
> +++ b/sound/soc/fsl/imx-audmux.c
> @@ -71,8 +71,7 @@ static ssize_t audmux_read_file(struct file *file, char
> __user *user_buf,
>         ptcr = readl(audmux_base + IMX_AUDMUX_V2_PTCR(port));
>         pdcr = readl(audmux_base + IMX_AUDMUX_V2_PDCR(port));
>
> -       if (audmux_clk)
> -               clk_disable_unprepare(audmux_clk);
> +       clk_disable_unprepare(audmux_clk);
>

I think the check of audmux_clk before "clk_prepare_enable"  also
can be removed?



>         buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
>         if (!buf)
> @@ -218,8 +217,7 @@ int imx_audmux_v2_configure_port(unsigned int port,
> unsigned int ptcr,
>         writel(ptcr, audmux_base + IMX_AUDMUX_V2_PTCR(port));
>         writel(pdcr, audmux_base + IMX_AUDMUX_V2_PDCR(port));
>
> -       if (audmux_clk)
> -               clk_disable_unprepare(audmux_clk);
> +       clk_disable_unprepare(audmux_clk);
>

ditto

best regards
wang shengjiu

>
>         return 0;
>  }
> --
> 2.25.1
>
>
>

--000000000000863c1105e0bde762
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 2, 2022 at 3:14 PM &lt;<a=
 href=3D"mailto:cgel.zte@gmail.com">cgel.zte@gmail.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">From: Minghao Chi &lt=
;<a href=3D"mailto:chi.minghao@zte.com.cn" target=3D"_blank">chi.minghao@zt=
e.com.cn</a>&gt;<br>
<br>
Because clk_disable_unprepare already checked NULL clock<br>
parameter, so the additional checks are unnecessary, just remove them.<br>
<br>
Reported-by: Zeal Robot &lt;<a href=3D"mailto:zealci@zte.com.cn" target=3D"=
_blank">zealci@zte.com.cn</a>&gt;<br>
Signed-off-by: Minghao Chi &lt;<a href=3D"mailto:chi.minghao@zte.com.cn" ta=
rget=3D"_blank">chi.minghao@zte.com.cn</a>&gt;<br>
---<br>
=C2=A0sound/soc/fsl/imx-audmux.c | 6 ++----<br>
=C2=A01 file changed, 2 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c<br>
index dfa05d40b276..f434fa7decc1 100644<br>
--- a/sound/soc/fsl/imx-audmux.c<br>
+++ b/sound/soc/fsl/imx-audmux.c<br>
@@ -71,8 +71,7 @@ static ssize_t audmux_read_file(struct file *file, char _=
_user *user_buf,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptcr =3D readl(audmux_base + IMX_AUDMUX_V2_PTCR=
(port));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pdcr =3D readl(audmux_base + IMX_AUDMUX_V2_PDCR=
(port));<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (audmux_clk)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepa=
re(audmux_clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(audmux_clk);<br></blockqu=
ote><div><br></div><div>I think the check of audmux_clk before &quot;clk_pr=
epare_enable&quot;=C2=A0 also<br></div><div>can be removed?</div><div><br><=
/div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D kmalloc(PAGE_SIZE, GFP_KERNEL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!buf)<br>
@@ -218,8 +217,7 @@ int imx_audmux_v2_configure_port(unsigned int port, uns=
igned int ptcr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(ptcr, audmux_base + IMX_AUDMUX_V2_PTCR(p=
ort));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(pdcr, audmux_base + IMX_AUDMUX_V2_PDCR(p=
ort));<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (audmux_clk)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepa=
re(audmux_clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(audmux_clk);<br></blockqu=
ote><div><br></div><div>ditto</div><div><br></div><div><div>best regards</d=
iv><div>wang shengjiu</div></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--000000000000863c1105e0bde762--
