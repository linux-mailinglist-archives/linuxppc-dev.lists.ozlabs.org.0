Return-Path: <linuxppc-dev+bounces-13189-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CA17BFF76C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 09:10:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csccf59S4z3bd0;
	Thu, 23 Oct 2025 18:10:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761203426;
	cv=none; b=SZ9Q6Zkna++Nq7vbTEPKlYgzNDziUXb7a6W9YZJ2599g8UvGNRHrMt8N9o2iPTt6hluHpRYf1Up3ugWBrI9b+PiNCMR0iZAVw9eYmusmC/ypbSiPXDeOHWBUet7iBgD+pWnl5kvpw+wtpmfyKLx2mx9thHyk1YKIUibUjC6jiNfifiuYX9Rk+DfLRKXgcrIoG5Azaw4UMXtJOfgqh/Fgaj4vxUekeNQUoBkbnnvzgT8Ak3RgVL0VONzcPqiiefOZodOFdI2WjJ41Vju+oXznFVfAaYjm7gZeWyBP64U5CPZWqipZGLU96LP3aQOJ8yXCx8VTQy+r95s7JjvCFk0w+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761203426; c=relaxed/relaxed;
	bh=Ojo0D0SUrVi8rANl2uoQB3ZeIV6seeVTI9tIuETGh2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lIGHKz+8vH7EUdfgIZxjQZdHaziRiZYs9bPBlwuHSYh0HDdT88QVesSzxGkUdjs1NoswIp/kUTZgHqSFUllTX1Lf7P60eSlx/5DVo8wGo4sLX1sLZbUq4fnzJPCNr6P9ltq5MKEhL6yX6t9l1m5iMpDGJ9a5HaoXxC/v1jJwt1u8JJ8hVjct6JWfvThbLkLaqpP07L0Hy4OU7fnIfzD/31AZT1N7oNWsD7BCXHG/XVC4qJDJqiE2eIQd1p/VXTlB6n4TTOnBKhJwvuVUtIjuKHbXC3NrE4xdC/QmUftVMCWphwRYwj/0aJzyVf/2Vc/q8QI/t0u/zAOYzfyRBO3fhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y4Hk86Ax; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Y4Hk86Ax;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csccd2Zn2z30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 18:10:24 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b6ceba7c97eso423129a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 00:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761203421; x=1761808221; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ojo0D0SUrVi8rANl2uoQB3ZeIV6seeVTI9tIuETGh2U=;
        b=Y4Hk86AxFp5GjGoIuK27eQ7XGzZq/TfmxWvwleLrzEJqX3qgp+ueEN1TNLE6xGLK2s
         c1Ldx3V1OlGXw9qfGtzB8TvDc0dJlLcFEi7oEEvcOBdvzDRqFkrIk3Na5FKJ79mxZSne
         ctb4c+5D5YHXSHLoaOt9q9lt/0mwMffvGsknNzoQrKrbOqskSQ3rwS0rCFcxVHUI6eQy
         jrZ/Jx2Vk/7zLXpf893KSc+LN6+gZa2qJutThjzQUv20G7tQ+vSWe/dZXpvUabF12hJY
         kdVFXQuC8Xd/60YJLjRMBiJ1pMjYs5GlX4DGZ+yM2LRWrdctMM4ja5YrEtN2GK6LkzL+
         fv2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761203421; x=1761808221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ojo0D0SUrVi8rANl2uoQB3ZeIV6seeVTI9tIuETGh2U=;
        b=li8z380JYOzO7sVdtexlaKk8UKNlKBwLXK/sjh/OqWOT9fERlKep92E5D43riOqcTf
         VhJCk9P8dvYTYK/TBNXMSDzS2cpmffML8bcPf+F1VKTXinCCkv7bKUuI8HNDRY6C45+0
         gc1MaOZmmLDEXp1MPEBnsS7f+OGt+dkFdXjZGUchnIJ3IFbdJGdAaC2o0RAhAqCF0+As
         FugnQ3Nv6mH+J31wCx5EFygV9914wo+P5QbZtKrfd4UGJQPO8S3rM9Vs4w2so1GYpQrf
         sSh9irdJ7YFYeVhcDGXRIJkrmpKKgig5N6nAlk0GFEPHXFzaW7OQ7g2NcDhQo3+Ts/7q
         9k+A==
X-Forwarded-Encrypted: i=1; AJvYcCXR6T8a6NPbS/4QbP1BUDLm9mmEtrjhrkkanPe2WlqRiD53nlIyDufTKCHBUjMmf/ZW6/Q4ArOgDvvemIQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwHofbyP1zGegB+h4SsEEMUYPa+J8R8HaqScKMfOqzIvb4IA11Z
	9u51o0SwWW+UUFqXfrz7mBIBO6ZOMhcP/YLvw1XQYYHKuUxbhD4/i1dw3a5sRtERQlY9Y/FNI6q
	JRLq08vOg1mwlZJvlFfeUkFJhGiEUkIw=
X-Gm-Gg: ASbGnctG3XhVOIoeW+1XBuVIXPMor8wjI6HbfHibI+QqkS1X//oaur9dmnR067XYoLj
	9P33UvuaS5/HvZdlL/NELJ2LHYbY8msKkWfLiVhk6pnXSHDPt+//vpRvB6Fre9963nDzDKci6wo
	FdUI+f/Zr1a5leOCz1Y/mlbt7ebCxiYkMzGs0yuBYtPcie2AdPCQ+1rnn1jy+422Ql/K38X7aSl
	b5gpOvKEb4lQQyr5Mldfio2Mgnjc4N/91hqHp8SF4ITJFxoCJc72opyw2lRtnpiQxiut0nf9hdn
	HMrBveDsrL/xzQ==
X-Google-Smtp-Source: AGHT+IEtJBcARSautKMltyAqLGBQ/Gd8B1xihDkjxP19PBXKTkpvD+Eo/uq58hE6h11K8gLvUb2NUw09soHy4QEpmTY=
X-Received: by 2002:a17:903:46c7:b0:274:aab9:4ed4 with SMTP id
 d9443c01a7336-290cb65f861mr305187765ad.57.1761203421516; Thu, 23 Oct 2025
 00:10:21 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20251023064538.368850-1-shengjiu.wang@nxp.com> <20251023064538.368850-3-shengjiu.wang@nxp.com>
In-Reply-To: <20251023064538.368850-3-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 23 Oct 2025 10:12:39 +0300
X-Gm-Features: AS18NWCgBWlr59lTgB1C8kcLIypbCmmlbtXSZ7g6CCjdzuXK7TY5j-4JWGWmtC0
Message-ID: <CAEnQRZB+rFudpHB7TKFOCumh4Ni9q-421X3jRL2y8UbV74e-xQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_micfil: correct the endian format for DSD
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

oldest - > most significant bit.

With that,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


On Thu, Oct 23, 2025 at 9:48=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> The DSD format supported by micfil is that oldest bit is in bit 31, so
> the format should be DSD little endian format.
>
> Fixes: 21aa330fec31 ("ASoC: fsl_micfil: Add decimation filter bypass mode=
 support")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_micfil.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
> index aabd90a8b3ec..cac26ba0aa4b 100644
> --- a/sound/soc/fsl/fsl_micfil.c
> +++ b/sound/soc/fsl/fsl_micfil.c
> @@ -131,7 +131,7 @@ static struct fsl_micfil_soc_data fsl_micfil_imx943 =
=3D {
>         .fifos =3D 8,
>         .fifo_depth =3D 32,
>         .dataline =3D  0xf,
> -       .formats =3D SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_DSD_U32_B=
E,
> +       .formats =3D SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_DSD_U32_L=
E,
>         .use_edma =3D true,
>         .use_verid =3D true,
>         .volume_sx =3D false,
> @@ -823,7 +823,7 @@ static int fsl_micfil_hw_params(struct snd_pcm_substr=
eam *substream,
>                 break;
>         }
>
> -       if (format =3D=3D SNDRV_PCM_FORMAT_DSD_U32_BE) {
> +       if (format =3D=3D SNDRV_PCM_FORMAT_DSD_U32_LE) {
>                 micfil->dec_bypass =3D true;
>                 /*
>                  * According to equation 29 in RM:
> --
> 2.34.1
>
>

