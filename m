Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73879777364
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 10:54:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cSx8JAyG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RM11m2qLrz3cN7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 18:54:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cSx8JAyG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1130; helo=mail-yw1-x1130.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RM10v5TXNz2ygx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 18:53:17 +1000 (AEST)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-583c48a9aa1so8757977b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 01:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691657595; x=1692262395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISTwavJo5QNRA0ml/ZYkxWD9JkMB48oJk0Oc/hedKZY=;
        b=cSx8JAyGkOmdsAHLDtARFe5E+bmkrOnNzYHajkz/Im644aeTTP5xiTIfbcqyJUfyjM
         BWgv30uk2EgU3NPHpdPaFDcXp2dzkL5bmF7NQmKV/xk5hAbfSYA57I9FdoiPX6WTL5If
         h8yELZgSUyiI3o+78nsOuxVjK4znn77Cp/xnizFqIcinv/C96+9SADDtYu+wfKZEfO+c
         SqPxyPVMe1oUATXZyDVrBSxCsWaPgJv7fXDcSfajqF2J1NY6VnqOYeDWrWZNxrkG5oMc
         N+HtOZtTumcoJfYCMGjZR0FJqXZUsdejxxhXhj932VOqQMh7f/xkPB2IVDQbVJYtd2yb
         kJEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691657595; x=1692262395;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISTwavJo5QNRA0ml/ZYkxWD9JkMB48oJk0Oc/hedKZY=;
        b=WwceIIEMoz3tLhoJlMUS+HWstTdfc/ud2YvQQS2ASnEzMOKe9yh6amm10PJGsJDPak
         mrwJ/27DhA8oS8F7ZTzuRooXBDwOcmd812fZdyeTd1MVKQyw4Z8JZF/SKRR6NrTDHmSa
         1TRMHJeJXdpUfgdEND+m/DErGem7x13uh3ZgTMKaiCl79Lpl4hYUxnornn7ULD0svm7z
         aKy+JVq4SB6gmkY2PfqJzeHDfu1XayUpX+f780tXAwEELdbdT7a4Kr17YFrKBGHt3zzv
         gYbfnG1jhMrOHglVBZUuN1+RI8ravkwF/AKV2Y2L0x1NsVDeyTCiwQOT3QMN9nuSpNNQ
         yLtw==
X-Gm-Message-State: AOJu0YwV80iC2DsDNY6CTUjskAzkXjPcER9FLwdJoDnO7Q45urViVgcm
	tDuceWTu6KW/aKwASfus471+kkNypfia0UoL2TVKZA==
X-Google-Smtp-Source: AGHT+IHR3OcxJgk9HIqvUQ98dw3GrFDpfjo2OZ3Zn5ukK1Ej8qavilwui19M8MLrNbXgTNYPBDiu1AU0FMOIqqB8uTs=
X-Received: by 2002:a25:6993:0:b0:d63:5e7:4e1b with SMTP id
 e141-20020a256993000000b00d6305e74e1bmr2168294ybc.26.1691657595551; Thu, 10
 Aug 2023 01:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230809132757.2470544-1-herve.codina@bootlin.com> <20230809132757.2470544-23-herve.codina@bootlin.com>
In-Reply-To: <20230809132757.2470544-23-herve.codina@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Aug 2023 10:53:04 +0200
Message-ID: <CACRpkdZWHw7sL6EKe0EP0hX5TEsdhzgkPSdVtPPYhS3LqJRHFg@mail.gmail.com>
Subject: Re: [PATCH v3 22/28] dt-bindings: net: Add the Lantiq PEF2256
 E1/T1/J1 framer
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

On Wed, Aug 9, 2023 at 3:28=E2=80=AFPM Herve Codina <herve.codina@bootlin.c=
om> wrote:

> The Lantiq PEF2256 is a framer and line interface component designed to
> fulfill all required interfacing between an analog E1/T1/J1 line and the
> digital PCM system highway/H.100 bus.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
(...)
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        $ref: /schemas/pinctrl/pincfg-node.yaml#

Shouldn't that be pinmux-node.yaml?

> +        additionalProperties: false
> +
> +        properties:
> +          pins:
> +            enum: [ RPA, RPB, RPC, RPD, XPA, XPB, XPC, XPD ]
> +
> +          function:
> +            enum: [ SYPR, RFM, RFMB, RSIGM, RSIG, DLR, FREEZE, RFSP, LOS=
,
> +                    SYPX, XFMS, XSIG, TCLK, XMFB, XSIGM, DLX, XCLK, XLT,
> +                    GPI, GPOH, GPOL ]
> +
> +        required:
> +          - pins
> +          - function

Because those are certainly defined in that file.

Yours,
Linus Walleij
