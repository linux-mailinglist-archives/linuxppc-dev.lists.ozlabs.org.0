Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B976C904D37
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 09:55:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1i0ALTK6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzdBr53r1z3fmR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 17:55:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=timesys.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=timesys-com.20230601.gappssmtp.com header.i=@timesys-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=1i0ALTK6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=timesys.com (client-ip=2607:f8b0:4864:20::b32; helo=mail-yb1-xb32.google.com; envelope-from=piotr.wojtaszczyk@timesys.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzdB81CmKz3dVK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 17:55:10 +1000 (AEST)
Received: by mail-yb1-xb32.google.com with SMTP id 3f1490d57ef6-dfb0ccbd401so3844746276.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 00:55:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=timesys-com.20230601.gappssmtp.com; s=20230601; t=1718178908; x=1718783708; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8zvLumEmzHSVfDBX+K3KODMcTb3eNmXQ7W6gFdSMig=;
        b=1i0ALTK65PIUzQ90DCf9SuqQyybF+aWQJcElQHrG6ikZvehYVWpUIQhVaUA1lRIyiq
         lae4zCh9RcNJT4MvW/bzds53r/BKHe55pjjkh4J6F0BzFe6zyfJQ31PhjySYjaxLdHxG
         vl76vZrCMC6AHw9+JO4sfZhOvVrpYtAPJHabxLYBOKelYJN/6l3zwVkz9NRFBBCnCsYy
         tl8Szgxw/NvTSbnGvdFZdxb6PhtF5PvL5adaH9MRZpKBX/ImXFG4tZddSCBsTSCAmimw
         0DoNbbvFRVR03Ez34TXBhHtfVWlior7cJEkGp78zGkJ81qeZNdWpaaXgAHWXMXXnSWfc
         jolw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718178908; x=1718783708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8zvLumEmzHSVfDBX+K3KODMcTb3eNmXQ7W6gFdSMig=;
        b=B38uSXsUExkAYj2vA1WL7pfdUlrFAEe79jPvNLIbrIuUt7fZLdr6kaCDd/OXW/jw3f
         kmrIj26OMnBdf5nVl+IUlnLU/2e21690yZty238XqoKZ0P/PqVrJKqFFDOPTStkcCRPR
         rCSuYC8bJ9iDPT5VkyRpOtDl/1EbgRX18K8r+IGR/BtZQYLVsJ6tbtJU3+JKHY1GkjRE
         BMtmCQzDQ1MBqpogx5tQfKxl4WhAit2AQV51L2LcSn4NZGxG1eK/SWrDVycULqHadEI/
         y8YkFb5EnKs/GXmsW8xpuU3IKpVzGHEUH3sZ0fNQVSTeHts3OJK9+9RVjBzdTJQoSt9i
         Mu/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVL7rMwCLIwVyOsbSZjIWcUc3KBVxbzo/VF6zv1vubqiuUrMyt8Xlw0WX55+/MDN+MFJ4z5S2CYAuAZWj8uJO5iJMUN3MKCOmba8OhYtg==
X-Gm-Message-State: AOJu0YzR01abgUGbHZfrVupa0M/1a7VNT1bE/EGBnmBxzJX+1fA+TtHm
	VFF3WK9/fC9oIHMWjL+B4vRBm4FPM/6qup+SeZCcUCDH/x1grxVvFQmPMhUujTE8+qHJVWjh38o
	a033HMq8r5orG3l7NcE7IJkdEiRovLTej80sRdQ==
X-Google-Smtp-Source: AGHT+IFPLy4bDjB26DeJ3OyETqud+YR8g7kmBRh3/NifyRwyRcvSuS2NJ859y2s2TX4hnMNdepvtl112sIycLjmhYjk=
X-Received: by 2002:a25:918a:0:b0:dfe:ed7:84be with SMTP id
 3f1490d57ef6-dfe67064dedmr951615276.25.1718178907988; Wed, 12 Jun 2024
 00:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <20240611094810.27475-1-piotr.wojtaszczyk@timesys.com> <Zmgor8accyAiUkUO@finisterre.sirena.org.uk>
In-Reply-To: <Zmgor8accyAiUkUO@finisterre.sirena.org.uk>
From: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
Date: Wed, 12 Jun 2024 09:54:57 +0200
Message-ID: <CAG+cZ05=w5KbxOOtpo99B=OHBaLNRKKJVrFT67CH1-6z1gP7ZA@mail.gmail.com>
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

On Tue, Jun 11, 2024 at 12:36=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> > +FREESCALE SOC LPC32XX SOUND DRIVERS
> > +M:   Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
> > +L:   alsa-devel@alsa-project.org (moderated for non-subscribers)
> > +L:   linuxppc-dev@lists.ozlabs.org
> > +S:   Orphan
> > +F:   sound/soc/fsl/lpc3xxx-*
> > +
>
> It seems a bit odd to add yourself as a maintainer while also marking
> the driver as orphan?
Nautel Ltd agreed to maintain this driver, I will add them.

> > +     i2s_info_p->clk =3D devm_clk_get(dev, "i2s_clk");
> > +     if (IS_ERR(i2s_info_p->clk))
> > +             return dev_err_probe(dev, PTR_ERR(i2s_info_p->clk), "Can'=
t get clock\n");
> > +
> > +     i2s_info_p->clkrate =3D clk_get_rate(i2s_info_p->clk);
> > +     if (i2s_info_p->clkrate =3D=3D 0)
> > +             return dev_err_probe(dev, -EINVAL, "Invalid returned cloc=
k rate\n");
>
> Nothing ever enables this clock.
It's enabled in lpc3xxx_i2s_startup() and disabled in lpc3xxx_i2s_shutdown(=
).
When the clock is enabled the bit clock on I2S interface always runs.
So this is to avoid active clock when the interface isn't used.

--=20
Piotr Wojtaszczyk
Timesys
