Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 175316AD135
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 23:09:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVt6V6JpNz3fVw
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 09:09:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cj7ECO5t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::b33; helo=mail-yb1-xb33.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cj7ECO5t;
	dkim-atps=neutral
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com [IPv6:2607:f8b0:4864:20::b33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVt0C14t3z3fSl
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 09:04:26 +1100 (AEDT)
Received: by mail-yb1-xb33.google.com with SMTP id e82so9711087ybh.9
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 14:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678140262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cj4SlGol6U5c/Lr/TI0kdwQqKkOnoBxkEowA782E81I=;
        b=cj7ECO5tujuJz/Nv/pvwK/z+E/6PFURiEjAL8ZP6rwxHBj4TymSexHzYdOgSjbwSDg
         MwQKGhMdlya1ElMltvorZEfo6ZJ73Ip6mNFYPgFoZG3RBG9n8vd8aO3gFOKxb4hLKtcj
         5UurvCPm2SDS+D03MpgZtk7gpME+iyTgrrdpbUq4a9UamJ4XMWvLnKuADHOuTqCeur8n
         pzsgEAn2H6bn9WO7y2PbUC5fQdieXYo9qRfN9qAaGlvD+3LwzrYpu2Anrpzsvin4/kIS
         bCZtYTtSuMj3T6uNjKtmD1D6ZC3ueRRTkRQsADXbaO5VEWWe1Fb3pChYkPpvHmdgyQqM
         +WbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678140262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cj4SlGol6U5c/Lr/TI0kdwQqKkOnoBxkEowA782E81I=;
        b=jBFjFv62t8b8w9BWM8gbVBPXKkxjkiYg++uoO8FhNcbf+fZYxiBOgkNcmYb9mt6X3v
         pOFfLWg1WtWK4MLkT2ZpPdXbay/8XYW3cjxrKZUu76jJRcDD1A77P0aPE8vsaLvqB1Al
         F60MbLHuwYz29q2+pdEjtBRswXVLCe4OjwgwBvnswc6MlOlQc4UAlSShVFfvz5hFuECU
         2cDBesx5o5+LJVrQAODhnnt/MrsWDPHMK+Dcg8IcZmPCRAYtUBpm/P3vOMM3vK+5WKTo
         pIIbPn7fwHOSBvObepjL0ehJa1v+3xZvrthq4+b23xTixVQmk6+1y0nzdZW7FDQHQvWt
         kq/g==
X-Gm-Message-State: AO0yUKUSiaAsahnP2Wn3bhuVMhr6kfNHCMJSNTCmF5gZm57tFHr+zIIR
	G9/1RSV2tm1eZnL5wUzSKcH5+Ew8ioSpKZawVwmPgQ==
X-Google-Smtp-Source: AK7set+wFCsgXgUYIDGEpMHMB73UyMnPBcZS5Za+NjqsbNmPAPmuIolhDFJR/AUEXYiry/T4wHPpmiOkMAbODo6SuV8=
X-Received: by 2002:a25:9281:0:b0:b0a:7108:71e9 with SMTP id
 y1-20020a259281000000b00b0a710871e9mr3142078ybl.4.1678140261781; Mon, 06 Mar
 2023 14:04:21 -0800 (PST)
MIME-Version: 1.0
References: <20230306191535.1917656-1-sean.anderson@seco.com> <20230306191535.1917656-4-sean.anderson@seco.com>
In-Reply-To: <20230306191535.1917656-4-sean.anderson@seco.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 Mar 2023 23:04:10 +0100
Message-ID: <CACRpkdZ-adsE1siz+MKvewNPoBLfwqhT_EjwDue3N9K9n0ET3A@mail.gmail.com>
Subject: Re: [PATCH v10 03/13] dt-bindings: Convert gpio-mmio to yaml
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, =?UTF-8?Q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jonas Gorski <jonas.gorski@gmail.com>, linux-gpio@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sean,

thanks for doing this. I never got around to because time.

On Mon, Mar 6, 2023 at 8:16=E2=80=AFPM Sean Anderson <sean.anderson@seco.co=
m> wrote:

> This is a generic binding for simple MMIO GPIO controllers. Although we
> have a single driver for these controllers, they were previously spread
> over several files. Consolidate them. The register descriptions are
> adapted from the comments in the source. There is no set order for the
> registers, so I have not specified one.
>
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
(...)

> +  compatible:
> +    enum:
> +      - brcm,bcm6345-gpio # Broadcom BCM6345 GPIO controller
> +      - wd,mbl-gpio # Western Digital MyBook Live memory-mapped GPIO con=
troller
> +      - ni,169445-nand-gpio # National Instruments 169445 GPIO NAND cont=
roller

I think you can inline description: statements in the enum instead of
the # hash comments, however IIRC you have to use oneOf and
const: to do it, like I do in
Documentation/devicetree/bindings/input/touchscreen/cypress,cy8ctma340.yaml
but don't overinvest in this if it is cumbersome.

Either way:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
