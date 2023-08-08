Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C44773934
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 11:01:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XgVkUGBp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKnHn5J0tz3c3X
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Aug 2023 19:01:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=XgVkUGBp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::112d; helo=mail-yw1-x112d.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKnGs3nXgz2ysC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Aug 2023 19:01:07 +1000 (AEST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-586bacac98aso26695677b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Aug 2023 02:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691485265; x=1692090065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h1jWjdgcMtkS8z/zWGRD8ihE010a+ozHwBFvKhqo23k=;
        b=XgVkUGBp1nctkpgdjCXvFvdDGF0+Z1WDm33gz7rg6/H+T2ZRZTX9DxPn0KoMIiD3dY
         xNbMa6eJ2AyOWnJjLuasts7tvJVQ3Dg6YvPrh3Nri4G1wxDHL4uL10ym9Gs0oUs9Fo6u
         hhFEkClARPAwGARHkfSsOs6ygfDKz4pHU6ENmDzgyXPloNMWEPIglMU8Jnr//pNSj0PQ
         giUvr8Nz3r3fWDS6mCSd41BxLhziUV2Mfm4s1hZHymOnuGE1hF2wcLbUM+bf+6eeDCa8
         st8J9cEYVQSjFpMM93yMRDXB0l2P7dkPxXuT2dICoJHsW1dfve9XDBjZ06qXqBXQEQu6
         Ih+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691485265; x=1692090065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1jWjdgcMtkS8z/zWGRD8ihE010a+ozHwBFvKhqo23k=;
        b=YscBteoZm4HlY8gOV+ExsXM7oj35MEnsaCvAgFyy89NmkUhPH+wRA1JRM3Q+7GSXOS
         ABu5sV1aesRWQJqkG6ZbkswBI1mqydhlf7oMCnvoAXqzHMPQrwKnY7AtGnnjgLpyvs2T
         HDGUAsPV9/MIDmPWmUVJZgRNfWiR9U5ZC0uRXU3hBYS8bBzbY7YRBsuIO8lHGJOm/Cjz
         rcllwvhy1Fa7vGdhTLmhxH+TRGm5QZzJE7WqDXhkx2rhD89+5QCVAEhYLZZOtszFesaJ
         o2MUv2ihMGBDIA+987eN0rP7WIAnLB0djzFcn70jjU1P/UGpFxZw8W73SpJ41M9TPUt7
         Q/ew==
X-Gm-Message-State: AOJu0YwM717GPClI9p1yHdCa5sPG1wk/Pk4vdVBFh1XyVMI4w7fJ0O+C
	QhzkIel+tH8+2xUiDwEp/TBJZj9WgIroOW5NnaCtmw==
X-Google-Smtp-Source: AGHT+IE/m/O86+1kRO0A1smGtafOuu/t8la0fmfi5L2yurMCmbtwgtH9QAEdX4VoPwi2Z4+7B32cwpghwJP0TuXuQTc=
X-Received: by 2002:a25:5083:0:b0:d47:5994:c0fd with SMTP id
 e125-20020a255083000000b00d475994c0fdmr6301271ybb.49.1691485264866; Tue, 08
 Aug 2023 02:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-25-herve.codina@bootlin.com> <CACRpkdYXCQRd3ZXNGHwMaQYiJc7tGtAJnBaSh5O-8ruDAJVdiA@mail.gmail.com>
 <8f80edf2-c93d-416f-bcab-f7be3badf64a@sirena.org.uk>
In-Reply-To: <8f80edf2-c93d-416f-bcab-f7be3badf64a@sirena.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Aug 2023 11:00:53 +0200
Message-ID: <CACRpkdYuJ+4hccip+m9SDv63DZQ1+knFnUm431Ki-K5qi49ExQ@mail.gmail.com>
Subject: Re: [PATCH v2 24/28] pinctrl: Add support for the Lantic PEF2256 pinmux
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Herve Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 7, 2023 at 3:10=E2=80=AFPM Mark Brown <broonie@kernel.org> wrot=
e:
> On Mon, Aug 07, 2023 at 03:05:15PM +0200, Linus Walleij wrote:
> > On Wed, Jul 26, 2023 at 5:04=E2=80=AFPM Herve Codina <herve.codina@boot=
lin.com> wrote:
>
> > > +#include "linux/bitfield.h"
>
> > Really? I don't think there is such a file there.
>
> > Do you mean <linux/bitfield.h> and does this even compile?
>
> #include "" means "try the local directory first then fall back to
> system includes" so it'll work, it picks up extra stuff on top of what
> <> does.  There's a stylistic issue though.

Wow that's a neat trick, I learn something new every day!

But we probably wanna be sure to get the system include.

Yours,
Linus Walleij
