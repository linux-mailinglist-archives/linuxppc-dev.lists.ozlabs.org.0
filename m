Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 237C86FEE8E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 11:19:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QH5vH70Bdz3fRB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 19:19:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bgdev-pl.20221208.gappssmtp.com header.i=@bgdev-pl.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=IJ2xCqIT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2607:f8b0:4864:20::931; helo=mail-ua1-x931.google.com; envelope-from=brgl@bgdev.pl; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20221208.gappssmtp.com header.i=@bgdev-pl.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=IJ2xCqIT;
	dkim-atps=neutral
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QH5tP0xmCz3cd4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 19:18:51 +1000 (AEST)
Received: by mail-ua1-x931.google.com with SMTP id a1e0cc1a2514c-77d0419750eso2219733241.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 02:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1683796727; x=1686388727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCpJk3R8UEUc900fWaZ36e4XkCAv/PqWqpOGayqH3do=;
        b=IJ2xCqITqQxYd2j21guIc8CZ8a3qzOQddlNmBPpwRr3wVfJWaXyJI/ZKssRhmcOTgA
         ilyj2rg2fCrteFz+fjY/juhlucDO3hu6UGVP/mhHZ/5db2Ph3NG2SEHP5q6avENqPQEw
         vd7GdnA5jMAlyOsQA09qOdBp7bqPEQ/s8ZXp8QFwSB7RC/I3DqQbtiDdGq6uemVS2Ld0
         x0bGAOvDLv5PbDm8I88MTMA4AP3yIQlfKTU+4zyo27lkONLtPWZOXMYYdHg9qekj+JYY
         lSKV46S0nCXogvNJCBGFhU8sEupT0DaXqxj9jwiG6qCwOmNnPzyk2uadn5QFM2mO4lxW
         LegQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683796727; x=1686388727;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mCpJk3R8UEUc900fWaZ36e4XkCAv/PqWqpOGayqH3do=;
        b=gMotgtQii7502jj6TTRzqCjm2o5Mz4TdR+wWPSERABeiqUs56iKmKBCP02ie4QLmv1
         Z3wtAFzkWWX4TyTFHQgrT0Epe2+jV38NOLVV/UH5H86My1yWCRwCWuLhTv7BSkcGopYZ
         roIVPiXz+O5E4/S2dbVsd+W6n7Vn80tsjlSS2Qf5gBFAi0bSnbvp1dGsh9/9zjOoX97K
         IL9V5+pQEIUrlcO2UJHkyK6Q9dj52LbYSRX07w80FA97Brk2oqFYc3HrPcMDmc/WEVeq
         6weI42JgE6OSyoqxDV8TVZU0q+SmR3W19n7XMsfZ2bI4EAFBHuDLNQmIojlpvxYwoeiI
         s76Q==
X-Gm-Message-State: AC+VfDyxiXp9s3GoB01507YHxKrIbcB9uBzq7Giati4CAMncjCQrtlf3
	QLGjZk/DdoqiK15bdHOmGDcpYbfRCxErPGOYZUnHng==
X-Google-Smtp-Source: ACHHUZ7PfcbhhIISYu9xCWNbAAg7XKAZcsN35LL5BB55uAZP1vndrSeFKFLrjV9j0Mzf8/9C95DuBCkC6LahVX2mBwE=
X-Received: by 2002:a05:6102:2857:b0:436:158:cf6c with SMTP id
 az23-20020a056102285700b004360158cf6cmr4794491vsb.6.1683796727674; Thu, 11
 May 2023 02:18:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230413160607.4128315-1-sean.anderson@seco.com> <20230413160607.4128315-4-sean.anderson@seco.com>
In-Reply-To: <20230413160607.4128315-4-sean.anderson@seco.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 11 May 2023 11:18:36 +0200
Message-ID: <CAMRc=Mft9a3PNo78jiSGfKaZDhAkpPTrcTfarcr=tSmLWzj-Qw@mail.gmail.com>
Subject: Re: [PATCH v14 03/15] dt-bindings: Convert gpio-mmio to yaml
To: Sean Anderson <sean.anderson@seco.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, =?UTF-8?Q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-gpio@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 13, 2023 at 6:06=E2=80=AFPM Sean Anderson <sean.anderson@seco.c=
om> wrote:
>
> This is a generic binding for simple MMIO GPIO controllers. Although we
> have a single driver for these controllers, they were previously spread
> over several files. Consolidate them. The register descriptions are
> adapted from the comments in the source. There is no set order for the
> registers, and some registers may be omitted. Because of this, reg-names
> is mandatory, and no order is specified.
>
> Rename brcm,bcm6345-gpio to brcm,bcm63xx-gpio to reflect that bcm6345
> has moved.
>
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus or Bartosz, feel free to pick this up as the rest of this series
> may not be merged any time soon.
>

Applied, thanks!

Bart
