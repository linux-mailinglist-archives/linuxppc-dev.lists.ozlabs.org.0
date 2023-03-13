Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1916B8493
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 23:14:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb9v44Vx1z3cJq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 09:14:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=i8CxBO0W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=i8CxBO0W;
	dkim-atps=neutral
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb9t93H0Xz2xY3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 09:14:07 +1100 (AEDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5418d54d77bso97344207b3.12
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 15:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678745644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixG+7bGig9QHUQWnSF4UiYBq7vDEpHXZ8tekX/nmxsQ=;
        b=i8CxBO0WR7OmBfqqlAHQje/zcyzikon1rCEQV8cWh4onUJHRcEPZyLMZHhYU8qM+wG
         tJzYFRNjiv1Z/A/sTasyGUOYa4VvMcsgTB5BpgqWnfGW84mjSKI5Mz89MrAdDJnorOwL
         BwanhOpukWSMVYSZyxO3rXY1pN8mY+BqNm4Beaw6YsLf/JPIPXUbt3MXDFT3t8Y0LK6u
         zZTkyf3m+KAQ5GPL/bPmsc+4fAsNSOagyt6yPbRI6DD016o5xrlwDmOcru7T9XjoLIPp
         A7B29wj2g8acbk3A5z+k4Kl0d5CN0tP0/YDsUdxAqmZ1w5q4Uq4UFH5TuzFxn1wneijl
         AKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678745644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixG+7bGig9QHUQWnSF4UiYBq7vDEpHXZ8tekX/nmxsQ=;
        b=a4XDdxgFgoB5DDhMwTBkHa9v8R62xW/5nko8lOx6tNA31txOOYKunJyAUIzUNknq3g
         ioV36bRu6lUdtjr4RNOEZR1ANI9PRhMbAlvKdEqmJDvPnnoK1zFR2bo90q6aTjGeIYl7
         ItHH22zxhExOPj0wMqViQp7MPMsDYj1Kt+8EfMCOrm70Z2Y6x8m4BaGaCDXMe4pIVw0O
         bPi6FRA6l1gZd0YDlf/4orqRv9XprmqQFHg4EiHah06ElEwNICvL8mZdRD3+P0yQNKaO
         i/gAg6PzsoaRwJoGlPtnZRFQj5RwVgNteIZuDc6KsbzKYGRaFqXS3Jiymkg4itMGAHK5
         tXCA==
X-Gm-Message-State: AO0yUKXskk/fS/3xgEJo3vbk4wrDX84VatWjWa8usdb+0bDBzLDTQfEa
	dkJdSdvJ7SxURgNh94yCTu0LsSHUPGEWZNSW+97ASg==
X-Google-Smtp-Source: AK7set+Bv76Po4Imp7oNwzB71WD5iLKQpfUzXDzH+Fp9A4JeoAaFi4DIdhTJ4chpyUfVvGitWyG/QEjZRdrFvDwK63c=
X-Received: by 2002:a81:4005:0:b0:532:e887:2c23 with SMTP id
 l5-20020a814005000000b00532e8872c23mr24535003ywn.9.1678745644324; Mon, 13 Mar
 2023 15:14:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230306191535.1917656-1-sean.anderson@seco.com>
 <20230306191535.1917656-4-sean.anderson@seco.com> <4c039e53-e3ca-29d7-e5ea-f24e385d28b0@linaro.org>
 <42ccbac0-53e2-f599-fb3d-064b896bde4a@seco.com> <CACRpkdaj-0dyqWdSbQbjyUed+khDLi-awgan1BnuDvuY2JBzFQ@mail.gmail.com>
 <d26bad8d-82ea-ed18-fa3e-081ba0d5dcf6@ncr.com>
In-Reply-To: <d26bad8d-82ea-ed18-fa3e-081ba0d5dcf6@ncr.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Mar 2023 23:13:52 +0100
Message-ID: <CACRpkdbDftrKzSHfRaO8Bk83FT=JwjR-X3M6wyjds4Jo9y8cEw@mail.gmail.com>
Subject: Re: [PATCH v10 03/13] dt-bindings: Convert gpio-mmio to yaml
To: "Leonard, Niall" <Niall.Leonard@ncr.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, =?UTF-8?Q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jonas Gorski <jonas.gorski@gmail.com>, Vinod Koul <vkoul@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 13, 2023 at 9:53=E2=80=AFAM Leonard, Niall <Niall.Leonard@ncr.c=
om> wrote:

> > Niall are you sending a v3 of this patch soon?
> > Include Sean on the reviewer list!

> I never got around to working on the V3 patch. The hold up for me was
> the changes to the bindings.
> I'm now wondering if I should wait on Sean's patch being accepted and
> then I could re-submit the driver changes.
> What's the consensus ?

Sean picked it up for shepherding, it looks very good, as soon as
the DT maintainers give it a nod Bartosz can merge it.

Yours,
Linus Walleij
