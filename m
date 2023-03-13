Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAC76B8426
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 22:44:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb9Ck0xVPz3cd9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 08:44:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wNETqUCx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b31; helo=mail-yb1-xb31.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wNETqUCx;
	dkim-atps=neutral
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com [IPv6:2607:f8b0:4864:20::b31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb9Bp1xLgz3bW0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 08:43:29 +1100 (AEDT)
Received: by mail-yb1-xb31.google.com with SMTP id i6so13483428ybu.8
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 14:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678743806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSd3V+HZ2T3mn2cPqXWrHfR5YkKZfdZAyYpCo4chbXU=;
        b=wNETqUCxQ2QTd0peBTohCpYEJ2IuKEYfhzChAAwi15Ax+cZ7Nu5/9on8O8dEN3/Yhk
         uUGfMvg+3ONZHcO34fS2YEBbMgnkk0EjwRwnZsdKpZoc5KuSgpvVSqF//mB1TCI7rcr4
         DHyrzg0Rc6r31JQtJXvJJR4kaM/Sb6kinPnzSv/iHCW5UCe6wbyk8dQIZB0PkpSMnWGe
         ttkmmIR2DJNzR+RoFcTUnKUx/ndmMrYASfV+2JBR/gqgzJDHaSw1/wb3/vHHmbOc5Moj
         v1D7GhXJa6ikrvJDzXnH1h0rYF3IQJnTCt4v6ikbPATQZBqEJ8YkTZNNhxRUOMTsjBRy
         T30w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678743806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSd3V+HZ2T3mn2cPqXWrHfR5YkKZfdZAyYpCo4chbXU=;
        b=eJ6WxZ0jzj43wFrTsDRFLRk6nhw4krue5kG6XaS2f+oBSP4LgYLGEQ32Q+zb+K9dib
         lhp+/zQGPkVsgv7abjkYW8RdQrnKgJWqjWPYm/NRlYCUgOozWfngCrjlK6N48HFpR15u
         OqHp1OwO7MpKlnxCrWQFswnMTeiSxxwLr5qs16UtnRZlmKsFRcXFCiKLHlUIK4KBq0L+
         YZNZZ06q9VgnfUaiE6EA0LdFPuMkbN/HODKHcv7w7t09heI3OdbgbodJU/ohin4k9AEX
         /QB5e2tbW4AjmXTgLjSjNf2DXpk0NxnOxaML5spNmokabo5cNOSB638ttLOR7Ks24+OM
         gnaw==
X-Gm-Message-State: AO0yUKVLXbCq6KjzWjPlyE2kk4HuzwptGl+EEgQOXhXf+MDr3i4wwuU3
	WCbGuRgccJtOS+7KmSpE6tFkhV1qQ7VSo7KWHwFnxA==
X-Google-Smtp-Source: AK7set/44tdYO4dx/yFdy6mWrlex/dEJSg8Dq1+hFA0Q9cUVadFi5fLDSwyepQRkDs4fZQ1h3nRg33KAEHniI/POZO0=
X-Received: by 2002:a5b:c7:0:b0:b3b:d433:b063 with SMTP id d7-20020a5b00c7000000b00b3bd433b063mr168215ybp.4.1678743806009;
 Mon, 13 Mar 2023 14:43:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230313161138.3598068-1-sean.anderson@seco.com> <20230313161138.3598068-4-sean.anderson@seco.com>
In-Reply-To: <20230313161138.3598068-4-sean.anderson@seco.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Mar 2023 22:43:14 +0100
Message-ID: <CACRpkdan3xZPWazk5tS-i9uAvKB=UO3kt5WS0VALkwnUk6ckgg@mail.gmail.com>
Subject: Re: [PATCH v11 03/13] dt-bindings: Convert gpio-mmio to yaml
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, =?UTF-8?Q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jonas Gorski <jonas.gorski@gmail.com>, linux-gpio@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 13, 2023 at 5:12=E2=80=AFPM Sean Anderson <sean.anderson@seco.c=
om> wrote:

> This is a generic binding for simple MMIO GPIO controllers. Although we
> have a single driver for these controllers, they were previously spread
> over several files. Consolidate them. The register descriptions are
> adapted from the comments in the source. There is no set order for the
> registers, so I have not specified one.
>
> Rename brcm,bcm6345-gpio to brcm,bcm63xx-gpio to reflect that bcm6345
> has moved.
>
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus or Bartosz, feel free to pick this up as the rest of this series
> may not be merged any time soon.

I think Bartosz will pick this as soon as the DT maintainers ACK it.

Yours,
Linus Walleij
