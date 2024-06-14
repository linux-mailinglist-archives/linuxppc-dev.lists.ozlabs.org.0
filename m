Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5021D9090BE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 18:47:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=gkexV6rB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W14vY0tBYz3ccQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 02:47:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=gkexV6rB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2607:f8b0:4864:20::f2e; helo=mail-qv1-xf2e.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com [IPv6:2607:f8b0:4864:20::f2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W14ts5DzKz3cXg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2024 02:47:00 +1000 (AEST)
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6b09072c9d9so18851766d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 09:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718383617; x=1718988417; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yqs2Bs766IBEpVDwqnHittM7JULZRUAPIPpoZOOswLI=;
        b=gkexV6rBV23Ju59i6jO2tPy5cp7isK4RGMl6fjiJQ3w4S2J3S+G7YEb6KaekqUjoSS
         txX8lDNv8H2J47b30X2S+OIEfW8T7qP15h/AjIdyWrxeFndzOLRB8WNm9vzJXHVmmdoL
         JMb7elH53IYsPe1hGJK0jveS0v13ZfW5lf3VhsaMEktZsROJ1U6JvFwcCoBOwotUVD2z
         RScxmnbdo9GJeQk0N7URdOEfzNW6hxQrkA4QOPhPEZrrI1V0/F1Ao3eg0TjjOhZfgOqE
         Xk5Z6+0HsyTjIwZdpS4LD+N+F5OeKAeBnHVKz+JBcbxnhDRvTyhEsSDXB/cY4FfXUpBG
         WDHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718383617; x=1718988417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yqs2Bs766IBEpVDwqnHittM7JULZRUAPIPpoZOOswLI=;
        b=AJPm3bHZVWi0RV95pU7EPQ1Ob/Zyqk+ukXwe87KHNPiVoZ6PfYcYjsTNz91bzbSsdW
         cuMLVQLDgWiKCx2eWCqTN7nh5enTSAPQh6++a3vZYH8NRdfrlyU2SSLvGm4Ujy5u5Sna
         pAgbNND1oY8RUeuN4/ltgdabO0SZPglu+STixsesKLtIm/1zl92SMjUoBl362jXziAG8
         ulyKbTlT4NEmL1WQFp3JjYaSRQZXQ/TpaZjT6ZTZpQ550ZiHyXZWycQhmGWS5h+zCCQu
         x08fRMInT3ZaTDTuMF3TTNHMiMhn+DpZTQTGoZh8jtmHZQ/QzfkWi5L0ryjsoUBkk+jq
         i5Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWfiAs0dED+tQQKMke7qWsMcuF75fLtzT8cD7wszIYYn2jrBQ2Lb77hWJQ29gzxtWRylz4t8WWiQrGWe3yuqQz69Ori+szqkRe45sEnuA==
X-Gm-Message-State: AOJu0YzVo8jUgVf4UQ6wlWnH0SG9QEPxZbBB/agQ7bXBYrawCB9i+39W
	BME4soZvcLTRgqTvCJm7CHzZtQkIVXnhcXjxOV3yJoq88s38c4MscxKx3lF75vAy+ywdHu5RurI
	Wlvmf8URp4ZJpGVqrwegYkG+fXgMzPDD5dRN0OA==
X-Google-Smtp-Source: AGHT+IG0IJ7dklCKXgFvzQnpQNQ7ndgkvwrYf/nZPEe1c+OWwBjZSeclPr61zSJ2azVgXqhXLF4vvSLpkv+cY1EpiAk=
X-Received: by 2002:a0c:c486:0:b0:6af:33ed:87de with SMTP id
 6a1803df08f44-6b2af2eef89mr48619646d6.20.1718383617492; Fri, 14 Jun 2024
 09:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com>
 <Zmgor8accyAiUkUO@finisterre.sirena.org.uk> <CAG+cZ06B+AexqvwZtNP5FX50AmghAFLa=1ebxmKLvMoyVJ529w@mail.gmail.com>
 <Zmxy-xA3YDU06Eht@finisterre.sirena.org.uk>
In-Reply-To: <Zmxy-xA3YDU06Eht@finisterre.sirena.org.uk>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Fri, 14 Jun 2024 18:46:46 +0200
Message-ID: <CAG+cZ05KomezPn0bAuZWrfO=rbyLdCU8_Xx11oEihUaD97gF8w@mail.gmail.com>
Subject: Re: [Patch v2 1/2] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
To: Mark Brown <broonie@kernel.org>
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
Cc: alsa-devel@alsa-project.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, devicetree@vger.kernel.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Chancel Liu <chancel.liu@nxp.com>, linux-arm-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 14, 2024 at 6:42=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Jun 14, 2024 at 06:24:50PM +0200, Piotr Wojtaszczyk wrote:
> > On Tue, Jun 11, 2024 at 12:36=E2=80=AFPM Mark Brown <broonie@kernel.org=
> wrote:
>
> > > On a quick scan I can't see any architecture dependency for build,
> > > please add an || COMPILE_TEST for improved coverage.  As for all the
> > > other things enabled in this Kconfig file there is no need to explici=
tly
> > > depend on SND_SOC.
>
> > Ok. Later I will add a sound card driver to phytec3250 board which uses
> > arch/arm/configs/lpc32xx_defconfig config file so that the COMPILE_TEST
> > won't be needed.
>
> Why would a defconfig affect the Kconfig?
I guess when lpc32xx_defconfig enables the SND_SOC_FSL_LPC3XXX then the
COMPILE_TEST won't be needed or does it?


--=20
Piotr Wojtaszczyk
Timesys
