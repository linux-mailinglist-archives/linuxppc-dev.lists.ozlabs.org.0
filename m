Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18751904D1F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 09:49:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=SVlN5O4P;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vzd4306Clz3fVm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 17:49:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=SVlN5O4P;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2607:f8b0:4864:20::f2a; helo=mail-qv1-xf2a.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vzd3L3S0tz3dBH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 17:49:15 +1000 (AEST)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6b0652ece5dso9409646d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 00:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718178547; x=1718783347; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLcH5YJaXuB/7MGBHEHfOlicw3pcEYZxxPQWbcZpzrg=;
        b=SVlN5O4P02cO6ZqJNhWVtftwX4zX8jzo5tkDU80gjXS24GNH1fKn4rq+uZB4k7kBwF
         XZXFu9417Vb0Vsbu1U4/preDpqibq8J+WZHhbm14WTbW94UrAxF6xudThk2sOz66qNwH
         cBGWpDtN1vfm2UgPzPWeDCd6d/NqOnniP9XFNTTgztLYsKniXsFFvWD63lU7W7+ukGK6
         F/ZGQYxaZyV5PwSszAqW1ejRedyQv4+0ujr4N3Hw+HOVvRJi7mIM0h9Hu9HbbiPv1AHg
         xvHNQQ9Bgn4g/FKM7DIwsOm26hrJLib02IrOqN11UnYFCh45cWMuRvWXVz8yLw/MpuHV
         jCxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718178547; x=1718783347;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QLcH5YJaXuB/7MGBHEHfOlicw3pcEYZxxPQWbcZpzrg=;
        b=Dd54MGFBd8X8K+5ABo4IWEZWuEJygrCkU+HglXix5tSd0Oecg+tM2prEbd2M0IIaqd
         DCVzwq8Bc7OArWGFQMkdZiU0xvh9+kEWDGJO+NBcU8z90Sm7PdY6cSlHlhThqHkD2sf4
         SkHe/xsBkRYT6oUf95W/0Vldfu1D+s+djZtpvnKJgn6x3ojOHLjQRlcOHFK2UqAVy8fu
         ip+Vi+6x6fFaUFOnPeKhazYb0P4wgjZVqyd52wUCYtC4F8eIC672kyrgTC4TyYRt57YB
         Yj3tNLCXeaicR0fVFJK/E8pAf4DfdNY/H+f+9133/TVYT1HV5DBZ3qixdZSpBqbMLn6U
         PksQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsG76UcHaiYFww3YCamSEfOpW4NEsC0e1A+J9heJunsTtY3Oo4LZJ47FoCDTGbEnPf4pZYQLyb7tQW/drLjFA6AEiAui62M1eFzBTMYA==
X-Gm-Message-State: AOJu0Ywm5NdUP3u7z48Hf69rAQXeuvQuO1IZd//gKiuW2QSq9OIiuMRq
	nyfzSeM+IfihW+waDfnmC+kaYqAv5CjgEH5b3AQVUDZoVN0uH+QggSjVzF0KrBcF9Zs+auYjMiT
	3AhSsPcw22XvYGY8EhkyXD6GDLU8PGlL7ZQAAGA==
X-Google-Smtp-Source: AGHT+IFeCV50FnVEaMqclrtqDNFKqc6xUL0MAu5JUv82YAmzpGH5pe7N5VXTefcxSlBdNwkvmPPJIXMcRjw3+tCTj+0=
X-Received: by 2002:a05:6214:460e:b0:6b0:6b78:e608 with SMTP id
 6a1803df08f44-6b19230ddb2mr12311056d6.31.1718178546635; Wed, 12 Jun 2024
 00:49:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com> <6cd2897f-a61d-4351-abac-714bae2ab154@kernel.org>
In-Reply-To: <6cd2897f-a61d-4351-abac-714bae2ab154@kernel.org>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Wed, 12 Jun 2024 09:48:55 +0200
Message-ID: <CAG+cZ06kf-n339XHnOiOzSECNkxVLYVw5UvtiWZwkDx5VFHa8A@mail.gmail.com>
Subject: Re: [Patch v2 1/2] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Cc: alsa-devel@alsa-project.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, Mark Brown <broonie@kernel.org>, Chancel Liu <chancel.liu@nxp.com>, linux-arm-kernel@lists.infradead.org, Russell King <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 11, 2024 at 12:15=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index aacccb376c28..7616f61d6327 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -8909,6 +8909,13 @@ S:     Maintained
> >  F:   sound/soc/fsl/fsl*
> >  F:   sound/soc/fsl/imx*
> >
> > +FREESCALE SOC LPC32XX SOUND DRIVERS
> > +M:   Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> > +L:   alsa-devel@alsa-project.org (moderated for non-subscribers)
> > +L:   linuxppc-dev@lists.ozlabs.org
> > +S:   Orphan
>
> Not sure if we want it in the first place. Why would we like to support
> orphaned drivers? Sorry, if there is no one to care about it, then it
> should not be merged.
>
I contacted Nautel Ltd they agreed to maintain this driver so I will add
J.M.B. Downing <jonathan.downing@nautel.com>
as a maintainer.

> > +static int lpc32xx_i2s_remove(struct platform_device *pdev)
> > +{
> > +     return 0;
> > +}
>
> You did not respond to comment about this. Drop.
I will remove empty functions

--
Piotr Wojtaszczyk
Timesys
