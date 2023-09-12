Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 238B279DA8C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 23:05:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hQnWWRxk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rlbhc09JGz3dKm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 07:05:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hQnWWRxk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rlbgk3KRhz3cTZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 07:04:48 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d8032efa2bfso374248276.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 14:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694552683; x=1695157483; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vn/+r9lrRj3XCF0f1OgbLrVWHe/dDEBlspgHejgs8pM=;
        b=hQnWWRxkXhZvNcNWLw3XZiUpk+gtyPUz6g86qOC8bZGMyGIWJ+U6YlQYCGC2cXNHIF
         bECpBzKHCpgckfqUL0DQWNCK5N/ye3TKxul6H2FpS7f+oP6/ZVlhVqlHKv78ywmEto+S
         C/52IfyP++zegPQ/mECL+FNcy9Kz0As43Aq25DnQSBGM3Aa+VfiQwQzxgkJLFu7Wn6UV
         IbmcjT8GNQ/d+6I9NPzO8il8nWWlK+hFO/holRdB5WAeWww9rPFMJr5Hz6lNWl9yqsnQ
         f6u+NMA4fWqww4uF4MnZZt0yr4sdoVbGQGSuX232pZs1zcnB3/K0zX6VZS0guBVSAMDY
         TNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694552683; x=1695157483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vn/+r9lrRj3XCF0f1OgbLrVWHe/dDEBlspgHejgs8pM=;
        b=gcDAbsqQE98NaW6sw7ghZwp+oXjm8iqnHB2KyHoaxV6ROebrsL+lSBL6x4X97Jt3Ri
         34cC7WURxzolaFMSevtowFAEOE7TKOXnRefZLyBdzH/p3SvwHP7ZQK4oLXvRGYBsMZRv
         DifYOHO60oTEx9mcsOnfVb+8BuXK2ndlS/swLvzsCwgqoz0NFp0o1AZQosl/jQwfo50t
         FIT3vhSKVkQIZ/5Mzravrw5a7UuwZnX9iZelMyzJDsrY0crmAvOM8KwvaAIpRprsVMOU
         7PoSVnzj293RtHbBM0b0nxPq5impllHwoYqeM5KThEJb2y6aYrbfXfnp4u2n0UqkhHjV
         Z1Og==
X-Gm-Message-State: AOJu0Yzpc0vCXFLQRjVqaXLLCRgnKyoPOJGUInEc/KEnfBMRa9obDP5X
	sGnJbhltxZqYG7fG7PW4EJ2Ch4hLv0UEKmGrc4AdEA==
X-Google-Smtp-Source: AGHT+IGQDuLaoE4eOyZT+Z8hNNsgfwvWorKJwQ3GNnopbwgh3VM6Y+HWcMTMFBMaepKaqB0s4OiEEYQ95/LJVmcUlZY=
X-Received: by 2002:a25:aa6f:0:b0:d78:414d:1910 with SMTP id
 s102-20020a25aa6f000000b00d78414d1910mr4091514ybi.25.1694552683091; Tue, 12
 Sep 2023 14:04:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230912081527.208499-1-herve.codina@bootlin.com>
 <20230912101505.225899-1-herve.codina@bootlin.com> <CACRpkdbxdMZt4E1SF1v9as-jw=TpvS1mk2TQqAgywMBLbKaNoA@mail.gmail.com>
 <71761f94-14ea-4e2a-a079-c74dfa32387a@sirena.org.uk>
In-Reply-To: <71761f94-14ea-4e2a-a079-c74dfa32387a@sirena.org.uk>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Sep 2023 23:04:24 +0200
Message-ID: <CACRpkdbZK8GUgOcLA2D=7nDejK9cT=bxwP+HcC0GOKr-0yCJ4w@mail.gmail.com>
Subject: Re: [PATCH v5 28/31] pinctrl: Add support for the Lantic PEF2256 pinmux
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Herve Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Simon Horman <horms@kernel.org>, lin
 uxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 12, 2023 at 4:31=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
> On Tue, Sep 12, 2023 at 01:04:56PM +0200, Linus Walleij wrote:
> > On Tue, Sep 12, 2023 at 12:15=E2=80=AFPM Herve Codina <herve.codina@boo=
tlin.com> wrote:
>
> > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > +/*
>
> > I think SPDX mandates that you start the tag with C99 comments
>
> > // SPDX-License-Identifier: GPL-2.0-only
>
> Not for headers, they should use C style since they might be included in
> contexts where C++ isn't supported.

Oh right. Thanks Mark!

Yours,
Linus Walleij
