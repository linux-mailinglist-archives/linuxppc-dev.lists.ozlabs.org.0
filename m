Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 627E55441DF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 05:25:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJTy22L5Yz3brm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 13:25:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AtZNFSa6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AtZNFSa6;
	dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJSS25sxYz3bkY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 12:18:09 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id a29so7351429lfk.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jun 2022 19:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=p/dwcXRT1EfsTmfF1oWE4kIXF7yR6zeplTFcpUpwq2Q=;
        b=AtZNFSa6HR/4hlpdAhhqKAA6h0TDkzFW4NjUtTcB+MKfSV1nQssHunB2xRccQ3f3iX
         4pblQ2zy9QMsxOT+NOsObcMCJaG0zlTRCrnWVNvrki0OXCpHMALFTxHlTrWZv5h6vzSP
         2N7wZCvxSh5O+fB3BXyKBqrqELPOeBpWrQucV0Iion6G5jFUubL3f/w4R6Wfq4OOVMvD
         qIMX22rFKW0sI+c89NxyISaod0dJpWPyD99aQYGX/4Fg9ajsIB5G4fhW16tQbo9A8DcU
         65raenoWNUqpLV6b+YeomW2N7mhoxtODCnRP5+Ukyk2092LVNQYzhHtG/FhXjKCWKoq9
         hL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=p/dwcXRT1EfsTmfF1oWE4kIXF7yR6zeplTFcpUpwq2Q=;
        b=i2+zu3QRy8Fgf3YsmWpM8oJaTW7d0KjjO57heFjJiFpG43nhuhMpyYzlgTiKJ59hP8
         d7aYpYGQFgp3gjbNdVuhQk6zZNiMs6ywbwY3Oyrmq5XLDIdKV06G75xRVKsV+AXkFW71
         NGruEu9CpcVflKYKzvsR8jmaQr7gaeUJ0B82FFIX4BK/hkmdSoFBEXM+L4ParrpwJMFS
         8j9uRfDWzCIm0hvQjeHrFCkhU4+Rmkmhe8E33Vasp4QYvjRx4SKFu/onyeb9UDSEvsmJ
         HhWesmBYHEqq9fN8AIWCf5HkE5N5cWbpENTBk7J+olE8C7BiZbRwFp5RVKhE5RC8loZ1
         GsZg==
X-Gm-Message-State: AOAM530/gxaAJTHYlHJb8l3SaRYAgTiyR7JD7qgVqxKtakEomjaoncNL
	BD5TdhdFgIpM9S8NhaeFEsXCW1xFKMVeX6ckME4=
X-Google-Smtp-Source: ABdhPJx4rr+NvpHmeMc8BUL/Oe5NT3ext/hfg2FKUmWJkKvGHTzsRq6pGXm4BQ328krZfXAOaz7DnQ3UtT0vAM5Dyws=
X-Received: by 2002:a19:6445:0:b0:479:141c:cb5b with SMTP id
 b5-20020a196445000000b00479141ccb5bmr21185754lfj.280.1654741083394; Wed, 08
 Jun 2022 19:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220606033705.291048-1-chi.minghao@zte.com.cn>
In-Reply-To: <20220606033705.291048-1-chi.minghao@zte.com.cn>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 9 Jun 2022 10:17:52 +0800
Message-ID: <CAA+D8ANPMvRg4SxS9ubWQWYJ_jpU189mA+8Sdefe5SejEhfAow@mail.gmail.com>
Subject: Re: [PATCH V2] ASoC: imx-audmux: remove unnecessary check of clk_disable_unprepare/clk_prepare_enable
To: cgel.zte@gmail.com
Content-Type: multipart/alternative; boundary="00000000000078b64405e0fa6ec6"
X-Mailman-Approved-At: Thu, 09 Jun 2022 13:25:14 +1000
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

--00000000000078b64405e0fa6ec6
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 6, 2022 at 11:37 AM <cgel.zte@gmail.com> wrote:

> From: Minghao Chi <chi.minghao@zte.com.cn>
>
> Because clk_disable_unprepare/clk_prepare_enable already checked NULL clock
> parameter, so the additional checks are unnecessary, just remove them.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
Wang Shengjiu

> ---
> v1->v2:
>         remove the check of audmux_clk before "clk_prepare_enable"
>  sound/soc/fsl/imx-audmux.c | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
>
> diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
> index dfa05d40b276..3ba82adace42 100644
> --- a/sound/soc/fsl/imx-audmux.c
> +++ b/sound/soc/fsl/imx-audmux.c
> @@ -62,17 +62,14 @@ static ssize_t audmux_read_file(struct file *file,
> char __user *user_buf,
>         uintptr_t port = (uintptr_t)file->private_data;
>         u32 pdcr, ptcr;
>
> -       if (audmux_clk) {
> -               ret = clk_prepare_enable(audmux_clk);
> -               if (ret)
> -                       return ret;
> -       }
> +       ret = clk_prepare_enable(audmux_clk);
> +       if (ret)
> +               return ret;
>
>         ptcr = readl(audmux_base + IMX_AUDMUX_V2_PTCR(port));
>         pdcr = readl(audmux_base + IMX_AUDMUX_V2_PDCR(port));
>
> -       if (audmux_clk)
> -               clk_disable_unprepare(audmux_clk);
> +       clk_disable_unprepare(audmux_clk);
>
>         buf = kmalloc(PAGE_SIZE, GFP_KERNEL);
>         if (!buf)
> @@ -209,17 +206,14 @@ int imx_audmux_v2_configure_port(unsigned int port,
> unsigned int ptcr,
>         if (!audmux_base)
>                 return -ENOSYS;
>
> -       if (audmux_clk) {
> -               ret = clk_prepare_enable(audmux_clk);
> -               if (ret)
> -                       return ret;
> -       }
> +       ret = clk_prepare_enable(audmux_clk);
> +       if (ret)
> +               return ret;
>
>         writel(ptcr, audmux_base + IMX_AUDMUX_V2_PTCR(port));
>         writel(pdcr, audmux_base + IMX_AUDMUX_V2_PDCR(port));
>
> -       if (audmux_clk)
> -               clk_disable_unprepare(audmux_clk);
> +       clk_disable_unprepare(audmux_clk);
>
>         return 0;
>  }
> --
> 2.25.1
>
>
>

--00000000000078b64405e0fa6ec6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 6, 2022 at 11:37 AM &lt;<=
a href=3D"mailto:cgel.zte@gmail.com">cgel.zte@gmail.com</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">From: Minghao Chi &l=
t;<a href=3D"mailto:chi.minghao@zte.com.cn" target=3D"_blank">chi.minghao@z=
te.com.cn</a>&gt;<br>
<br>
Because clk_disable_unprepare/clk_prepare_enable already checked NULL clock=
<br>
parameter, so the additional checks are unnecessary, just remove them.<br>
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
v1-&gt;v2:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 remove the check of audmux_clk before &quot;clk=
_prepare_enable&quot;<br>
=C2=A0sound/soc/fsl/imx-audmux.c | 22 ++++++++--------------<br>
=C2=A01 file changed, 8 insertions(+), 14 deletions(-)<br>
<br>
diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c<br>
index dfa05d40b276..3ba82adace42 100644<br>
--- a/sound/soc/fsl/imx-audmux.c<br>
+++ b/sound/soc/fsl/imx-audmux.c<br>
@@ -62,17 +62,14 @@ static ssize_t audmux_read_file(struct file *file, char=
 __user *user_buf,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 uintptr_t port =3D (uintptr_t)file-&gt;private_=
data;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 u32 pdcr, ptcr;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (audmux_clk) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare=
_enable(audmux_clk);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(audmux_clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ptcr =3D readl(audmux_base + IMX_AUDMUX_V2_PTCR=
(port));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 pdcr =3D readl(audmux_base + IMX_AUDMUX_V2_PDCR=
(port));<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (audmux_clk)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepa=
re(audmux_clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(audmux_clk);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 buf =3D kmalloc(PAGE_SIZE, GFP_KERNEL);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!buf)<br>
@@ -209,17 +206,14 @@ int imx_audmux_v2_configure_port(unsigned int port, u=
nsigned int ptcr,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!audmux_base)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOSYS;<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (audmux_clk) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare=
_enable(audmux_clk);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0return ret;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D clk_prepare_enable(audmux_clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(ptcr, audmux_base + IMX_AUDMUX_V2_PTCR(p=
ort));<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 writel(pdcr, audmux_base + IMX_AUDMUX_V2_PDCR(p=
ort));<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if (audmux_clk)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepa=
re(audmux_clk);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0clk_disable_unprepare(audmux_clk);<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
=C2=A0}<br>
-- <br>
2.25.1<br>
<br>
<br>
</blockquote></div></div>

--00000000000078b64405e0fa6ec6--
