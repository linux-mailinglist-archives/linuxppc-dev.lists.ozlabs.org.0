Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B376E78A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 13:28:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1dpQ1JBpz3fc0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 21:28:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cISFcM3F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=cISFcM3F;
	dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1S2K08rMz3c6Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 14:08:24 +1000 (AEST)
Received: by mail-wm1-x32f.google.com with SMTP id m39-20020a05600c3b2700b003f170e75bd3so1517921wms.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 21:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681877294; x=1684469294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4XiNSYWgcLQuFxvkCNT3Vf0nczCpBov3KqNEUIXrcn0=;
        b=cISFcM3FK8NlEQ/j69bU9vzPaK1RQd/OLdKanNtMb9Ks1ScubJ1xa+cr9nDAM59aXN
         oflZAG489ztY98TpYlKduZB114YxDnfeuoh8dXLNIy4S7EhZoqNEYICqepDs3Jq2CxbI
         AUzeK/gwPGWIL45O2gmzuqe4jr7Pmi+M5CUL8pLguoy04dQCJA6vRvhWoR6muGIjhtPx
         yEiQGeSRVgd4LwkbTRKuxScztYb6QxsSp5lHiB1D45sZIwAxWkdzBqZCYOTwkSRPDL5F
         Q27eJg7nO6lqKOnI4M08VJ3TOxTaa7z6JUzYPA/QmlVOuPOeP+5DTUYFsfF9nev1FIJu
         y8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681877294; x=1684469294;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4XiNSYWgcLQuFxvkCNT3Vf0nczCpBov3KqNEUIXrcn0=;
        b=BfWfv9/nF/msrv5Ijd3wtusoKY0+iDVeUKupLVNq1v2Pgf/BHwd8YCQSfeIC8yR4W5
         NKw18yfP3nch3TXUQAGSftERTwT0iEhf1ohJbXMASklZ1z9gRyNykrrJrj901TYgIZbG
         DIknBi65Jtfn4roUliBLvFxI81KWmcWAgwKsv9Z92cKIS08I7Y47NmqF+6AdpV3d6rPy
         KllCDbXtVUrdrXrNV2Ve5TIPsdISRelCDFvvehXOEdb/sdtyAiLl9Z+PZmL/VaZnHfmQ
         tBPitPIcnhTZrbBSKifHtTfuA44QHy48uthWHC0JHAWIyHBK/vvEAucz3x8kFCBRDu8g
         EI+Q==
X-Gm-Message-State: AAQBX9dVTNxHhAzVZ7WJdhwpcL4wbZvJ3Qb1Q01hM6qKSZwwf7jFP3VM
	bU6KqX1lgwPQoOgr6yRt/jmz8HNcwQU94GotAPA=
X-Google-Smtp-Source: AKy350b/gytWfcCTSq6cXvf5OHycptkSDSBQ37Bh+xbM1B7LJ48m9ZeT/1hDwyo0u8RxtqSRH9/FGup/ogPibY4n5j4=
X-Received: by 2002:a05:600c:244:b0:3e2:1a3f:4ea2 with SMTP id
 4-20020a05600c024400b003e21a3f4ea2mr4003260wmj.7.1681877294476; Tue, 18 Apr
 2023 21:08:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230418094259.4150771-1-chancel.liu@nxp.com>
In-Reply-To: <20230418094259.4150771-1-chancel.liu@nxp.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 19 Apr 2023 12:08:03 +0800
Message-ID: <CAA+D8AO4R-gEiSo1aL7tC_162XzJbOSkGZP_Ki8xDgmTx4RchA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Fix pins setting for i.MX8QM platform
To: Chancel Liu <chancel.liu@nxp.com>
Content-Type: multipart/alternative; boundary="000000000000b1723a05f9a89290"
X-Mailman-Approved-At: Wed, 19 Apr 2023 20:57:19 +1000
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, festevam@gmail.com, Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com, broonie@kernel.org, perex@perex.cz, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000b1723a05f9a89290
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2023 at 5:44=E2=80=AFPM Chancel Liu <chancel.liu@nxp.com> w=
rote:

> SAI on i.MX8QM platform supports the data lines up to 4. So the pins
> setting should be corrected to 4.
>
> Fixes: eba0f0077519 ("ASoC: fsl_sai: Enable combine mode soft")
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

Best regards
wang shengjiu

> ---
>  sound/soc/fsl/fsl_sai.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> index 07d13dca852e..abdaffb00fbd 100644
> --- a/sound/soc/fsl/fsl_sai.c
> +++ b/sound/soc/fsl/fsl_sai.c
> @@ -1544,7 +1544,7 @@ static const struct fsl_sai_soc_data
> fsl_sai_imx8qm_data =3D {
>         .use_imx_pcm =3D true,
>         .use_edma =3D true,
>         .fifo_depth =3D 64,
> -       .pins =3D 1,
> +       .pins =3D 4,
>         .reg_offset =3D 0,
>         .mclk0_is_mclk1 =3D false,
>         .flags =3D 0,
> --
> 2.25.1
>
>

--000000000000b1723a05f9a89290
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 18, 2023 at 5:44=E2=80=AF=
PM Chancel Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com">chancel.liu@nxp.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">SAI on i.MX8QM platform supports the data lines up to 4. So the pins<br>
setting should be corrected to 4.<br>
<br>
Fixes: eba0f0077519 (&quot;ASoC: fsl_sai: Enable combine mode soft&quot;)<b=
r>
Signed-off-by: Chancel Liu &lt;<a href=3D"mailto:chancel.liu@nxp.com" targe=
t=3D"_blank">chancel.liu@nxp.com</a>&gt;<br></blockquote><div><br></div><di=
v>Acked-by: Shengjiu Wang &lt;<a href=3D"mailto:shengjiu.wang@gmail.com">sh=
engjiu.wang@gmail.com</a>&gt;</div><div><br></div><div>Best regards</div><d=
iv>wang shengjiu=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
---<br>
=C2=A0sound/soc/fsl/fsl_sai.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c<br>
index 07d13dca852e..abdaffb00fbd 100644<br>
--- a/sound/soc/fsl/fsl_sai.c<br>
+++ b/sound/soc/fsl/fsl_sai.c<br>
@@ -1544,7 +1544,7 @@ static const struct fsl_sai_soc_data fsl_sai_imx8qm_d=
ata =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .use_imx_pcm =3D true,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .use_edma =3D true,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .fifo_depth =3D 64,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0.pins =3D 1,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.pins =3D 4,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .reg_offset =3D 0,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .mclk0_is_mclk1 =3D false,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D 0,<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000b1723a05f9a89290--
