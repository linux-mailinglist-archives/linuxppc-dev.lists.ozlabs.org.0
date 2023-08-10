Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 160287776B2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 13:18:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QFhKu9tk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RM4D26Y0sz3cC7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Aug 2023 21:18:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=QFhKu9tk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2a; helo=mail-yb1-xb2a.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RM4CB6Qwnz2yZX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 21:17:24 +1000 (AEST)
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d3522283441so712888276.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Aug 2023 04:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691666241; x=1692271041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADRnTf+HtriZ7mqwDU3wWvmXrT7FB+Ztxvgw7H2KXeU=;
        b=QFhKu9tkFZ+fkU1lcY4zVfF0dk/FWoUgZD0eH36Sz7H5E6vylleVAxrx4pnTaXqwhk
         0+gy/gZj3JZk12Km6iz/EZoWzKbi128l5ProuMk6rD8PXzxfQdAWHaHfYFH+hT3tRM5T
         JhuEe8IlHx2uTiKvZWsgQrv6fkFqrBx0+2vETEZCqjNX/pWDMRwL/0BRd5MvDHtFVvKa
         BM/Lp+D9Uqm7WCUrVCer3WiE1OLLbVSPYEz4lyAydeXxxun5B/2ka3EMFk7a+ErH42db
         gw2/aA6IBStBu2S2LDjrdyts3q5jk/zxoySCSTATECPSlKOeat6hCKBGV6ZorzoWY9HV
         DN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691666241; x=1692271041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADRnTf+HtriZ7mqwDU3wWvmXrT7FB+Ztxvgw7H2KXeU=;
        b=QmQIzBMNuG6d4lquLkKmcYiXZj5xKTL+SgadfXViD7V6LW+HZpsxhVxqvkJaPg2PAQ
         isSuEyDqbMF3YtDwafH++Xx2DI/U4nBHOMRvCSieJZjRZPdN9NELGjIG0G8DJMG2RZ9A
         TsqXs8LOqaQ+lJt4w3EWS4SNwnp24E9oANBj2O1ySB12+YhUP3OT5JiC1WcmYZW6VBGc
         EnLGmH2/aGOmcjQAdoTzUAof/iTL0KYv33iRP4xbqlVhhi6MOp1C818Zot7RcJPfFeCD
         YBSv3kdGm54zlXqQ1D5dRDrxFP2BalE/Eldu3U8BrbYx0SJw4XT9/K/Dui27AfonFecp
         jK2w==
X-Gm-Message-State: AOJu0YxaVMlkkgzL/yu2/w1/I3aqIDSWkP+xAb08P2LxzkHNsNvVXY2v
	nwwg6M0yspKUBafGxQ8YwNQpJ8d2mUXLoaOuFLOPRw==
X-Google-Smtp-Source: AGHT+IG0cc60EKwg6aO/Vl/FWx+h3xKBM7qpk0WTUOrKZYJlTlQ3xEW/05G+n7KdFt0H+qP3lFIXHa3H2q7KcJby2j8=
X-Received: by 2002:a25:250f:0:b0:cea:6760:d2c6 with SMTP id
 l15-20020a25250f000000b00cea6760d2c6mr2046852ybl.41.1691666241474; Thu, 10
 Aug 2023 04:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230809132757.2470544-1-herve.codina@bootlin.com> <20230809132757.2470544-22-herve.codina@bootlin.com>
In-Reply-To: <20230809132757.2470544-22-herve.codina@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 10 Aug 2023 13:17:09 +0200
Message-ID: <CACRpkdZQ9_f6+9CseV1L_wGphHujFPAYXMjJfjUrzSZRakOBzg@mail.gmail.com>
Subject: Re: [PATCH v3 21/28] net: wan: Add framer framework support
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

On Wed, Aug 9, 2023 at 3:28=E2=80=AFPM Herve Codina <herve.codina@bootlin.c=
om> wrote:

> A framer is a component in charge of an E1/T1 line interface.
> Connected usually to a TDM bus, it converts TDM frames to/from E1/T1
> frames. It also provides information related to the E1/T1 line.
>
> The framer framework provides a set of APIs for the framer drivers
> (framer provider) to create/destroy a framer and APIs for the framer
> users (framer consumer) to obtain a reference to the framer, and
> use the framer.
>
> This basic implementation provides a framer abstraction for:
>  - power on/off the framer
>  - get the framer status (line state)
>  - be notified on framer status changes
>  - get/set the framer configuration
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

I love it, very clear commit message telling us what it is all
about.

The placement in the WAN subsystem also hints that this has
something to do with long distance links (relative to something)
so maybe mention that?

> +menu "Framer Subsystem"
> +
> +config GENERIC_FRAMER
> +       bool "Framer Core"
> +       help
> +         Generic Framer support.
> +
> +         This framework is designed to provide a generic interface for f=
ramer
> +         devices present in the kernel. This layer will have the generic
> +         API by which framer drivers can create framer using the framer
> +         framework and framer users can obtain reference to the framer.
> +         All the users of this framework should select this config.

But this description just says this is a framing framer that frames frames =
;)

So please copy some of the nice description from the commit message
into this Kconfig helptext.

Is "long distance link time division multiplexing (TDM) framer" more
to the point for example? Or is the ambition to frame other multiplexing
techniques as well with this subsystem? Such as FDM? Then mention
that.

Yours,
Linus Walleij
