Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF6F782010
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Aug 2023 23:07:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EkbIjelb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RTSqF5CDwz3bx8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Aug 2023 07:07:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EkbIjelb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RTSpM40Qsz2yD4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Aug 2023 07:06:32 +1000 (AEST)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-d665467e134so2807254276.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Aug 2023 14:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692565587; x=1693170387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jD9cyaHgSU7OecxP7U/v+MRhNN5iRGNEtNN5f+NxK3E=;
        b=EkbIjelbdLkuzIuqi8lN2IaFia7QROWlfjiI7q7zlP6jDAvGYdauZr5rWGeP5TyNj/
         FTLwzTAVecCKL3BibvaoUCvO+gGncYmRqvynbSCU/H9CSnnaBpgnH1tOwcSw/jhwlTNE
         yxf9olC181R4u63D7T09ydG+I3s3ZtZ/u2PVgFULhzS48dJpD5wb5F9dF3a9Y+PsFYj+
         NHgSZ9uwlOzKa4/KiVA0h3lpcev49Jt9Lvu2vbMboOBUQF5Ovmhefg1ifsF1lEHMhDCm
         MbXMx2vz3Or/EDK9+/FBko1YDMvcoaLkgfWLakufV6DztPp4m3w4Zu6/QJHcRw+4VVzp
         LubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692565587; x=1693170387;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jD9cyaHgSU7OecxP7U/v+MRhNN5iRGNEtNN5f+NxK3E=;
        b=EohB/mRZu80vJoITjTakLVKRLTT4cyTEVo5hK2QqbNv/zJqL40YyhSEh9RWXpEjlWu
         jiRUxMiYhieypm26r8dgKKRM4ar3gyruxcVLh242QqwtvkIDVKQNgOCOTNoEPE1IwXKY
         FJuT43wwLctc4nml8zqyKiUNdtXWn1jP92POe+oP/QfTauL+9Jqs2j4xJ2J3gthZsfyI
         Rnz12/D9bwHsyfdYg+ANoWxnCl92W+eMaSsIxX9pi84HV6/2ukKMDRKArdrn6XX5uU0/
         svG5r3QEDeV8GOMwoHCpWa6ENIQmtEoh6ietDSNgwOCuHNGWn4PmPTVyM9IBJIHBk8Ln
         jq7Q==
X-Gm-Message-State: AOJu0YzWhD6icKA1b9/s70AQXXsm7Y04c6yB74M4bqViuVVQyPX5RMWR
	FMJW/AkaqFjuyUftWXL4/f5OIGZc/Qjwd63QSa8m+g==
X-Google-Smtp-Source: AGHT+IFUaS1hymFHjE/AoExPooLhJU9s7gYCM4hD5xHtjEpweKryYFaY4soUhFjoyRUlcRmul8KDvXSLKE35vGSqXJ8=
X-Received: by 2002:a81:7283:0:b0:589:8b55:f8cf with SMTP id
 n125-20020a817283000000b005898b55f8cfmr4756130ywc.50.1692565587414; Sun, 20
 Aug 2023 14:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692376360.git.christophe.leroy@csgroup.eu> <5f671caf19be0a9bb7ea7b96a6c86381e243ca4c.1692376361.git.christophe.leroy@csgroup.eu>
In-Reply-To: <5f671caf19be0a9bb7ea7b96a6c86381e243ca4c.1692376361.git.christophe.leroy@csgroup.eu>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 20 Aug 2023 23:06:16 +0200
Message-ID: <CACRpkdamyFvzqrQ1=k04CbfEJn1azOF+yP5Ls2Qa3Ux6WGq7_A@mail.gmail.com>
Subject: Re: [PATCH v4 21/28] net: wan: Add framer framework support
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Andrew Lunn <andrew@lunn.ch>, alsa-devel@alsa-project.org, Herve Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Eric Dumazet <edumazet@google.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Fabio Estevam <festevam@gmail.com>, Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Nicolin Chen <nicoleotsuka@gmail.com>, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Liam Girdwood <lgirdwood@gmail.com>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem
 @davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 18, 2023 at 6:41=E2=80=AFPM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:

> From: Herve Codina <herve.codina@bootlin.com>
>
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
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

I had these review comments, you must have missed them?
https://lore.kernel.org/netdev/CACRpkdZQ9_f6+9CseV1L_wGphHujFPAYXMjJfjUrzSZ=
RakOBzg@mail.gmail.com/

Yours,
Linus Walleij
