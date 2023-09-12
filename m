Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B894A79CF3B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 13:06:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Mj1X58Ek;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlLPs0dNWz3cnR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 21:06:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Mj1X58Ek;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1135; helo=mail-yw1-x1135.google.com; envelope-from=linus.walleij@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com [IPv6:2607:f8b0:4864:20::1135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlLNz2nD4z3c3Y
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 21:06:11 +1000 (AEST)
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-58fb8963617so54559517b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 04:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694516768; x=1695121568; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxeKap40n9N0Jct85TnQoxJYlNgRlyoVOdviavwIIv8=;
        b=Mj1X58Ek7kIreSEds33CFNx1PH7s22GgV0pnZHRW5FkHPmWDSX+1Ec2boaGuDYZ/tR
         11f57M53DONHRkCgmWHBuPRNa9NGXmWmXyxNgiIKgWXQha3xYZ+iwx/5MmNF4ZoXibCj
         C0NaJ2vZwobxjA2XEru6pEHgeiEDge6d6faKSbi70uYXbOKJ1cJxcY3d31PPBRn6t1Ek
         fOUULuYmDI1h8gGAvci55/AmRlk6qMcPb41rdvr+rZ3KMFWm23ziDgFTRvZYUWiw5Air
         plIZETRW5Spt3FqQin1hsWqjVCI3xMF7AaqBVIhFBokQfDaPLrkNkFLm2qV5CKmOuhxu
         xSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694516768; x=1695121568;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxeKap40n9N0Jct85TnQoxJYlNgRlyoVOdviavwIIv8=;
        b=l+bJ1mvlGU1n5TaU0VS1qmlelUhBWvYD7ZH+YQbGHkZ6VbO3QIbhy0ZmHpq/wH52TA
         MB+kWF5ZCjWLVpNYbusDpnQ8f5bXyl1+dp2dmoNF5sB9dUfQ6FgxkpviABEneiD3dwBD
         PBjNfWj20mFh6t9G0AH6699r3F4R2ihj71tqjmSSnBu6u+FexTRKif4uZ17VZkSitC9I
         wk9hIu6QuUmHtB8eWS3iwwxMm/4pY74PagfmVCvBb/PKN16HoelAVGeN9YroyASqV8Jr
         o/OKH043Y9TrNH4wmkvLnrLlOPot9hvjWLQbyzUyJUuJlx8inPlsBu7hew4NN2N3ueZd
         yZ1A==
X-Gm-Message-State: AOJu0Yze8aizjlCv8eIAeRb1ueAccc9xA9nRWVmZg9GKjtq3CP8Zt+Fo
	PB5HEO0ozZW8H1NBC8s5iBgOl1ZpBWQkjlRPLd/5bw==
X-Google-Smtp-Source: AGHT+IGyZPp4TVH1sBukbcNRmYX2EySx2o/za6wxn39EVFdbUk9RivbE+m6qOSfkNS/rkWMpLDTgnTAoDhF0TgN1JVo=
X-Received: by 2002:a5b:743:0:b0:d79:d23f:b49c with SMTP id
 s3-20020a5b0743000000b00d79d23fb49cmr10905306ybq.35.1694516768133; Tue, 12
 Sep 2023 04:06:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230912081527.208499-1-herve.codina@bootlin.com> <20230912101510.225920-1-herve.codina@bootlin.com>
In-Reply-To: <20230912101510.225920-1-herve.codina@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 12 Sep 2023 13:05:57 +0200
Message-ID: <CACRpkdZ2svQJVG4wiJu90X6HhKudMuAerz12zw2nd84ekLaEJA@mail.gmail.com>
Subject: Re: [PATCH v5 29/31] MAINTAINERS: Add the Lantiq PEF2256 driver entry
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

On Tue, Sep 12, 2023 at 12:15=E2=80=AFPM Herve Codina <herve.codina@bootlin=
.com> wrote:

> After contributing the driver, add myself as the maintainer for the
> Lantiq PEF2256 driver.
>
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  MAINTAINERS | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8b987f2c8633..dbc5867016bc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11876,6 +11876,15 @@ S:     Maintained
>  F:     arch/mips/lantiq
>  F:     drivers/soc/lantiq
>
> +LANTIQ PEF2256 DRIVER
> +M:     Herve Codina <herve.codina@bootlin.com>
> +S:     Maintained
> +F:     Documentation/devicetree/bindings/net/lantiq,pef2256.yaml
> +F:     drivers/net/wan/framer/pef2256/
> +F:     drivers/pinctrl/pinctrl-pef2256-regs.h
> +F:     drivers/pinctrl/pinctrl-pef2256.c

Just use a glob expression:
F:     drivers/pinctrl/pinctrl-pef2256-*

Yours,
Linus Walleij
