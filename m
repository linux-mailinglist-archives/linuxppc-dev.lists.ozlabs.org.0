Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3662594291F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 10:26:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=oWe/5CCi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYlZ10kd8z3dF9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 18:26:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=oWe/5CCi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2607:f8b0:4864:20::e2f; helo=mail-vs1-xe2f.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYlYF1ctnz3c7K
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 18:26:05 +1000 (AEST)
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-492aae5fd78so1431531137.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 01:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1722414362; x=1723019162; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DFjJ7n63paZS6uSG42PXEZWs1JHtvlpu1J7pCHV1MaA=;
        b=oWe/5CCiKIoG5PS8YF+9NzYnaq/dwfRrGMfuXwVF0mMcf1cGAkxE+fzB0mJa9at4np
         ww6F16mrZNF5ZVTOK6K55CUSrSBXHeQZqITCD4q0aGeyQjnju2W2lffQBlJQQztSR4pr
         /fValay95puQXQb8ic/JCAGA1MexcYuNvWWqiVv/Pb5ifY3s3RHzNTCuUc6iaU3ubuVm
         5l0AaGkQBIsyuV5g6Q0Idlrz21aQQy5Sg6i6YIL4JCCSxzipUIzKfgoJM+c390oJ+clC
         GS6AwbnodE3QsjQZgxgKuMs0RoZ61AbOhQLT8JnYnxZcnmLenI9/+Q0Jr7zXV9rYkMgu
         4IbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722414362; x=1723019162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DFjJ7n63paZS6uSG42PXEZWs1JHtvlpu1J7pCHV1MaA=;
        b=s2mAhHIo/2m8Xjif4bvwMLhIFgBcRXDPb0WsXSc75chMX748bFGOXOQoe0GT/Ez3w7
         K20qRhSCDyyvcVbYxnsZqBHqEAHBY2Xg0c6l6mxxF7KCFGExtuQH2H42O0Kya02Dbo+H
         Cv+XL4d/kS+DVTvqJW2D331RbZvBNvUKv5EEdbjVzPb7Xz8lQYGM3xwiCNGWjNrdYY0C
         bBIDCC73waDCYGkUUIFwsbSEPL+Pekj83MYk8VnXPoTVljiRWPYjEb7jdn1wuFiam0oT
         BOzfUZUenPUJ7FCEv7eDSa+8THRsuAGrTBYGeixJpKp6AEKGLOtbxHXUbBtmsWgpYNxW
         hprg==
X-Forwarded-Encrypted: i=1; AJvYcCVKA3vRMrOk549v0P8Axs/117CfXuuwcyOtSnpVZaQu2kGO3/MzcmIPvMCdCEycheBvwKFs7f3BmcCELqAHYA66P7K2tVrD7OeQwDAsew==
X-Gm-Message-State: AOJu0YwsX1/lqVgZJVyEpS81/qqFmnGs5+Q55olbgt3K9u1FfWlDFFum
	kZsJks2fvaKuDXgK/MmprzLXOE2XCFtCROzZMLgyQYdqxB8ArYLE5s5ukMgCmDXdX643cQ/gmMw
	wEWrXATkUxzL2pHMlRK4O/61Vww4IyG3GawhwFw==
X-Google-Smtp-Source: AGHT+IEZQxKOD7qrEVQxXh0yoroOagYvbnV14lRkkP0QqCJaL1USQW1bT0weUmb2OMtTj4zK11JciNIw6TA8x5ATMzI=
X-Received: by 2002:a05:6102:390b:b0:492:a7e5:df9 with SMTP id
 ada2fe7eead31-493faa417bfmr15098391137.17.1722414362030; Wed, 31 Jul 2024
 01:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240731022949.135016-1-yuehaibing@huawei.com>
In-Reply-To: <20240731022949.135016-1-yuehaibing@huawei.com>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Wed, 31 Jul 2024 10:25:51 +0200
Message-ID: <CAG+cZ05LGBsNODyAaApS1uoPXPh7Cchp8utm_AAWoM09HZzOzw@mail.gmail.com>
Subject: Re: [PATCH -next] ASoC: fsl: lpc3xxx-i2s: Remove set but not used
 variable 'savedbitclkrate'
To: Yue Haibing <yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com, linux-kernel@vger.kernel.org, tiwai@suse.com, jonathan.downing@nautel.com, perex@perex.cz, broonie@kernel.org, linux-sound@vger.kernel.org, vz@mleia.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 31, 2024 at 4:39=E2=80=AFAM Yue Haibing <yuehaibing@huawei.com>=
 wrote:
>
> The variable savedbitclkrate is assigned and never used, so can be remove=
d.
>
> sound/soc/fsl/lpc3xxx-i2s.c:42:13: warning: variable =E2=80=98savedbitclk=
rate=E2=80=99 set but not used [-Wunused-but-set-variable]
>
> Fixes: 0959de657a10 ("ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs=
")
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  sound/soc/fsl/lpc3xxx-i2s.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/sound/soc/fsl/lpc3xxx-i2s.c b/sound/soc/fsl/lpc3xxx-i2s.c
> index af995ca081a3..62ef624d6dd4 100644
> --- a/sound/soc/fsl/lpc3xxx-i2s.c
> +++ b/sound/soc/fsl/lpc3xxx-i2s.c
> @@ -39,7 +39,7 @@ static void __lpc3xxx_find_clkdiv(u32 *clkx, u32 *clky,=
 int freq, int xbytes, u3
>  {
>         u32 i2srate;
>         u32 idxx, idyy;
> -       u32 savedbitclkrate, diff, trate, baseclk;
> +       u32 diff, trate, baseclk;
>
>         /* Adjust rate for sample size (bits) and 2 channels and offset f=
or
>          * divider in clock output
> @@ -53,14 +53,12 @@ static void __lpc3xxx_find_clkdiv(u32 *clkx, u32 *clk=
y, int freq, int xbytes, u3
>
>         /* Find the best divider */
>         *clkx =3D *clky =3D 0;
> -       savedbitclkrate =3D 0;
>         diff =3D ~0;
>         for (idxx =3D 1; idxx < 0xFF; idxx++) {
>                 for (idyy =3D 1; idyy < 0xFF; idyy++) {
>                         trate =3D (baseclk * idxx) / idyy;
>                         if (abs(trate - i2srate) < diff) {
>                                 diff =3D abs(trate - i2srate);
> -                               savedbitclkrate =3D trate;
>                                 *clkx =3D idxx;
>                                 *clky =3D idyy;
>                         }
> --
> 2.34.1
>

Looks good, thanks.

--=20
Piotr Wojtaszczyk
Timesys
