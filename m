Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 032317724E7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 15:06:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ut8sOt7l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKGm86g0Sz30MQ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 23:06:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Ut8sOt7l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKGlH2B5dz2yVf
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 23:05:29 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-cfcebc33d04so4588917276.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Aug 2023 06:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691413526; x=1692018326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LCHsXc+lT27JE6Z6+8ylge5LujDr0uIa0UFtHeUGk2Y=;
        b=Ut8sOt7lpFeoV7uC5nic5YMi0GUeC8HpWsn9X2ZvHUqogbJC59sug1OCXgBIO45szT
         zu/yDK65dLYqv6f+km1qpewpLLAyHgB83sO8QJplPf6Hb+zQxEgpYnezxw31ErxCfwYd
         DG1K/BD7UexEi2CLbm33TPIAEV+JP9uckCAnXOKFdFxQCTLDT9vDW0yo5WN6ssAjMwB6
         jQausBUtY12YsJG/lvlFmGhmKUqnRUZYXZJAg6WdrWcdht+kmstTdnIijp5oZIEpsXDt
         nq9gS+ZIoUWmVgbHZ6Clm4PxrSxeiApl2AxIg5A46SblXoW3BcU9kQkBbE2yZj77FvnD
         FVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691413526; x=1692018326;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCHsXc+lT27JE6Z6+8ylge5LujDr0uIa0UFtHeUGk2Y=;
        b=XrEbPbULTQH92f8WvEWteQ4BEgthSi7nRzjP10Z+PjoXagZiDihU+W5N4kx20GzOel
         INaRtjdJ/JxPTapGGrEmS/dAlRlTfsiH0HLAfceECEisYJuqiK17i+kcnVpfMjsK+OGJ
         rdPnBHWcuEHNeEz4F5GqMLIaTIJ5cFCLSuzAnJxNupVB/uIpKXvl/I7xr7FNtPcVzat9
         Ax7uRIugDP2tcM5BQ1v2NPqcRgmAV+BUtHOW+o4SFH4aMfr8x13149ZaEs7MW/2xjqrb
         ybHaZyCguUNtlhsgk8ylcdj2hNlpVo3gk3qVeriDftaZDPB78cZE7W9eskGbDibDePEV
         MacQ==
X-Gm-Message-State: AOJu0YwHqQwkJpw6BwEMzvPTDi2pVOB5iwRRCNY0ZVSLR+dkJaKDaVH+
	DsQKvkTq7rxbjUBkcXWg7A6nNinGd5YxTgXAanZyGA==
X-Google-Smtp-Source: AGHT+IGLxVHYBN4YJi+z5+HalzYdVADQ/IRYzWidcu2Ji/atGqIFAXQgU8cOxoHK1pmjGmBx4BMj8ebAiBn6KY0iG4o=
X-Received: by 2002:a5b:5cf:0:b0:c39:9e09:2c71 with SMTP id
 w15-20020a5b05cf000000b00c399e092c71mr8293260ybp.41.1691413526341; Mon, 07
 Aug 2023 06:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230726150225.483464-1-herve.codina@bootlin.com> <20230726150225.483464-25-herve.codina@bootlin.com>
In-Reply-To: <20230726150225.483464-25-herve.codina@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 7 Aug 2023 15:05:15 +0200
Message-ID: <CACRpkdYXCQRd3ZXNGHwMaQYiJc7tGtAJnBaSh5O-8ruDAJVdiA@mail.gmail.com>
Subject: Re: [PATCH v2 24/28] pinctrl: Add support for the Lantic PEF2256 pinmux
To: Herve Codina <herve.codina@bootlin.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Herve,

thanks for your patch!

First: is this patch something we could merge separately? I don't see
any dependency on the other patches.

On Wed, Jul 26, 2023 at 5:04=E2=80=AFPM Herve Codina <herve.codina@bootlin.=
com> wrote:

> The Lantiq PEF2256 is a framer and line interface component designed to
> fulfill all required interfacing between an analog E1/T1/J1 line and the
> digital PCM system highway/H.100 bus.
>
> This pinmux support handles the pin muxing part (pins RP(A..D) and pins
> XP(A..D)) of the PEF2256.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

So it is a bridge chip? Please use that terminology since Linux
DRM often talks about bridges.

> +++ b/drivers/pinctrl/pinctrl-pef2256-regs.h
(...)
> +#include "linux/bitfield.h"

Really? I don't think there is such a file there.

Do you mean <linux/bitfield.h> and does this even compile?

> diff --git a/drivers/pinctrl/pinctrl-pef2256.c b/drivers/pinctrl/pinctrl-=
pef2256.c
(...)
> +struct pef2256_pinctrl {
> +       struct device *dev;
> +       struct regmap *regmap;
> +       enum pef2256_version version;
> +       struct {
> +               struct pinctrl_desc pctrl_desc;
> +               const struct pef2256_function_desc *functions;
> +               unsigned int nfunctions;
> +       } pinctrl;

Uh anonymous struct... can't you just define the struct separately
with a name? Or fold it into struct pef2256_pinctrl without the
additional struct? Thanks.

Otherwise it looks neat!

Yours,
Linus Walleij
