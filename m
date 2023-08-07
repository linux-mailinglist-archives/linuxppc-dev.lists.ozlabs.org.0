Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA23C772506
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 15:07:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xpSCvUoQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RKGnt4B95z3cCH
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 23:07:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=xpSCvUoQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RKGmw2cMjz2y1Y
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 23:06:56 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d45caf42d73so2842244276.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Aug 2023 06:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691413613; x=1692018413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YN5TMkTY0ygg4jFnAPE5f0kWVzSNcpz9+iRD79bC3Z8=;
        b=xpSCvUoQbw1tjxn+0pZ6cSy2bPnR/cI/N5v1Xa8IkA31SVzn/S+g0e9pWhC2z1ew5h
         oU+JROfYYJZovhf186MJRP0DNrRNrtrBKPxMbRVGMSwQNFUZUm1h2qHsVrIZ/9OJIv9C
         fvgBVwcUpM2siwYe6A84FoyH8wuJBQVrP09+Zo6NBG9tl9SnLf1wNV0xx7hmw5RePlMs
         qwKSXeFlTsIy//gg+MU4nPzw9JfVuTmRxNIn+vTPB3YG30SvjpzU70gSB20XUwlCptb6
         LFbcqdFnalTPgXLGlG/1iJcEwt4cYFbpKf1ws5droSP7fBmcsG3P5llSCwvsY/eQIsiV
         maoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691413613; x=1692018413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YN5TMkTY0ygg4jFnAPE5f0kWVzSNcpz9+iRD79bC3Z8=;
        b=iUM5A469vTaa19+2CwbU6X6FDz3y6SoEinrnNzPKCxHuxeNmy6hMN/jP0Wj2s+rqRf
         aDVnkoAExaFLlqs57nuX1gXa7vd20ZK/22m9sr1SzI9OpS/UYT6e2HKgctYIwkeXyc+R
         /8Mk3efcv5wq7nrkgOe+tjtdhpmisWxzcKiijZD8N7xLbo+Vx3LH/vkbXGqa3HpiG7BW
         zP+5LwGLWR89siaaA+u45iHMtioC9aNY3jU6Wr2FodoTWxIaeO1DSlNdBHM4oY8brsvw
         EQCc+lrus8WS013cCQZe0ex5UYPfqX0tzbe+Rm6nWTNcHAhCGqXX8xhsoAiVXszQvXcZ
         i+vQ==
X-Gm-Message-State: AOJu0Yzvwt+ydwv5GO4/lpPrjcuJ7EUB8mXCYizZVzfiaLm+EjZ3qKiu
	83lAAVFFh4+Ud6GhpRryf8Uubpz0qo0/h+eYN+7DXw==
X-Google-Smtp-Source: AGHT+IEMKCq/m3/N1+FiikwFsnDje8GRItyWdNDJE1nuhiz2PrdZl+YFSqKhB6L6a9fy66xvdbZfHLOx9hNasWI6TVw=
X-Received: by 2002:a05:6902:4f4:b0:d09:85d3:4edb with SMTP id
 w20-20020a05690204f400b00d0985d34edbmr8822226ybs.7.1691413613049; Mon, 07 Aug
 2023 06:06:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230726150225.483464-1-herve.codina@bootlin.com>
 <20230726150225.483464-25-herve.codina@bootlin.com> <CACRpkdYXCQRd3ZXNGHwMaQYiJc7tGtAJnBaSh5O-8ruDAJVdiA@mail.gmail.com>
In-Reply-To: <CACRpkdYXCQRd3ZXNGHwMaQYiJc7tGtAJnBaSh5O-8ruDAJVdiA@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 7 Aug 2023 15:06:42 +0200
Message-ID: <CACRpkdZebvrdGXooLXmgXhUcgdgxBczJBpdEoEyJDR39abaAqQ@mail.gmail.com>
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

On Mon, Aug 7, 2023 at 3:05=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:

> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>
> So it is a bridge chip? Please use that terminology since Linux
> DRM often talks about bridges.

Replying to self: no it's not a bridge, it's a WAN thingy.

So perhaps write that this is a WAN interface adapter chip.

Yours,
Linus Walleij
