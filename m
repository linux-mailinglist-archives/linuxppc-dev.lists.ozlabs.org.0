Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 194F879CF34
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 13:06:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=U5/sS5Tx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlLNk34zPz3cML
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 21:05:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=U5/sS5Tx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlLMr3WkBz30fd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 21:05:11 +1000 (AEST)
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-d7b9de8139fso4755628276.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 04:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694516708; x=1695121508; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FMoBWtmvLq6bgdekThyp6v4fhBAV0YiqC8BS8aCPcE=;
        b=U5/sS5TxgX0QDQ0S8CL5D+Xn6zh3lcnM0IgPN6AQcFFQiKwm31qrazGxt5JUyJp3b8
         G3etJ8+L4dW5moYbGhcso6ub4/uFiSmNW5fikuE0R3mhkQzhzeYvyiGnJTkSl9JrOItf
         3BlqzFkK3r+cyrV+0t2QaZMuv4+jw4XGEYuqG9e63zH4iW1Xmf2idgJYFsQ9mFBc46BK
         3rnJMK1BTOS9gZI4SaEzMhNgZaZhBFpnugdXpDb0zze0RQvozQ6rjm1hWmZnBwbAVtNa
         2YHuLZiXOFvmbGnCcDEPgig0v3TA367hnwM/H4o8I2otzmRBPZmzBMunz0Ey2eqOk7am
         l34A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694516708; x=1695121508;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FMoBWtmvLq6bgdekThyp6v4fhBAV0YiqC8BS8aCPcE=;
        b=T+zrZz0pT/ZK8R1hBGN2PG2q1Y/DrnYox/EF+OvyLdzr4hA3l6buJsqi6qwg1uYrIn
         aUbC7rT61AI6DBwbM1ajIK9hmXeliu8PdHK4e50/qwZOUMiX9GCNlSJyhfVvn1KSdEBs
         jvNvcVw59OmjXkTtfNvXaWiVb7xHd/nvDoVJTgw+jmeptTe+Paie1JhoJg//WRPUkhFt
         qRMBOBcNAKgtwGo/xHgYIxB33hU+QftUoh2Tib/1+aMDY9Hf1A8CjGKzBph/5IONdNWP
         2BDO4t0wLYJEd8OkusnSQwO1aZ6QjuRg3kBzOXNm8jOvOtsjO8BRfh8F0p/c66s59IUy
         FkHg==
X-Gm-Message-State: AOJu0Yxmc8ilw3ASxtpfuE7r0YQ4pMvvncbyIknb7SQ8YP3DYvT+NbJd
	4kG7LtvLDIWnNteU61/KZU1JS858mk6nStuPp6G6VA==
X-Google-Smtp-Source: AGHT+IHWFG9XShCR9EYCQbjpGN6Qxg22q5tUHNLhGUJSf212PqAwCH8zHTtn0AYfPfJADbtFAnVTC3aGLAvqi8JMMgU=
X-Received: by 2002:a25:d695:0:b0:d62:6514:45b7 with SMTP id
 n143-20020a25d695000000b00d62651445b7mr11205815ybg.37.1694516708153; Tue, 12
 Sep 2023 04:05:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230912081527.208499-1-herve.codina@bootlin.com> <20230912101505.225899-1-herve.codina@bootlin.com>
In-Reply-To: <20230912101505.225899-1-herve.codina@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Sep 2023 13:04:56 +0200
Message-ID: <CACRpkdbxdMZt4E1SF1v9as-jw=TpvS1mk2TQqAgywMBLbKaNoA@mail.gmail.com>
Subject: Re: [PATCH v5 28/31] pinctrl: Add support for the Lantic PEF2256 pinmux
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Simon Horman <horms@kernel.org>, linuxppc-de
 v@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Herve,

thanks for your patch!

On Tue, Sep 12, 2023 at 12:15=E2=80=AFPM Herve Codina <herve.codina@bootlin=
.com> wrote:

> The Lantiq PEF2256 is a framer and line interface component designed to
> fulfill all required interfacing between an analog E1/T1/J1 line and the
> digital PCM system highway/H.100 bus.
>
> This kind of component can be found in old telecommunication system.
> It was used to digital transmission of many simultaneous telephone calls
> by time-division multiplexing. Also using HDLC protocol, WAN networks
> can be reached through the framer.
>
> This pinmux support handles the pin muxing part (pins RP(A..D) and pins
> XP(A..D)) of the PEF2256.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Nice to see this as a proper pin control driver!

>  drivers/pinctrl/pinctrl-pef2256-regs.h |  65 ++++++
>  drivers/pinctrl/pinctrl-pef2256.c      | 308 +++++++++++++++++++++++++

Do you really need a separate header just for some registers?
But it's a matter of taste so I'm not gonna complain if you want
it this way.

> +config PINCTRL_PEF2256
> +       tristate "Lantiq PEF2256 (FALC56) pin controller driver"
> +       depends on OF && FRAMER_PEF2256
> +       select PINMUX

select PINCONF

> +       select GENERIC_PINCONF

This brings it in implicitly but I prefer that you just select it.

> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*

I think SPDX mandates that you start the tag with C99 comments

// SPDX-License-Identifier: GPL-2.0-only

> +       /* We map 1 group <-> 1 pin */

Also known as "the qualcomm trick", but hey: it's fine.

> +static int pef2256_register_pinctrl(struct pef2256_pinctrl *pef2256)
> +{
> +       struct pinctrl_dev      *pctrl;
> +
> +       pef2256->pctrl_desc.name    =3D dev_name(pef2256->dev);
> +       pef2256->pctrl_desc.owner   =3D THIS_MODULE;
> +       pef2256->pctrl_desc.pctlops =3D &pef2256_pctlops;
> +       pef2256->pctrl_desc.pmxops  =3D &pef2256_pmxops;
> +       if (pef2256->version =3D=3D PEF2256_VERSION_1_2) {
> +               pef2256->pctrl_desc.pins  =3D pef2256_v12_pins;
> +               pef2256->pctrl_desc.npins =3D ARRAY_SIZE(pef2256_v12_pins=
);
> +               pef2256->functions  =3D pef2256_v12_functions;
> +               pef2256->nfunctions =3D ARRAY_SIZE(pef2256_v12_functions)=
;
> +       } else {
> +               pef2256->pctrl_desc.pins  =3D pef2256_v2x_pins;
> +               pef2256->pctrl_desc.npins =3D ARRAY_SIZE(pef2256_v2x_pins=
);
> +               pef2256->functions  =3D pef2256_v2x_functions;
> +               pef2256->nfunctions =3D ARRAY_SIZE(pef2256_v2x_functions)=
;
> +       }
> +
> +       pctrl =3D devm_pinctrl_register(pef2256->dev, &pef2256->pctrl_des=
c, pef2256);
> +       if (IS_ERR(pctrl)) {
> +               dev_err(pef2256->dev, "pinctrl driver registration failed=
\n");
> +               return PTR_ERR(pctrl);
> +       }
> +
> +       return 0;

You could use
return dev_err_probe(...);

> +       pef2256_reset_pinmux(pef2256_pinctrl);
> +       ret =3D pef2256_register_pinctrl(pef2256_pinctrl);
> +       if (ret)
> +               return ret;

Or you could use it down here.

With or without these changes (because they are nitpicks)
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
