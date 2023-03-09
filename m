Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3614D6B1FB6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 10:17:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXNqt0lPmz3cLB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Mar 2023 20:17:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=l62t2ivl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=linus.walleij@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=l62t2ivl;
	dkim-atps=neutral
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXNpm0b7vz3cd1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Mar 2023 20:16:31 +1100 (AEDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-53d277c1834so23072237b3.10
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Mar 2023 01:16:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678353388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4oOjO1iZqHHqppZpeEVZpEKQdPcmPUQRfadcX5/5t0=;
        b=l62t2ivlUxilMsIapwCQyovxHKcjFK0D4LIQAKwW2mD7FsZY4aDwDtSxJ7m/K8NmKU
         AJdQyIoT9ZWXji9+bD5ZurYVNpOiHzkB+kyAceWN/C+vqyHBsqWxFBIz0gIcXEU26XYP
         bGq+xR7SNxzStcFc98oMENNMTFUqLRv00f4ca3YRP9hrFQ5iiAGTyWbVDmTPcBjDcaLh
         IlfoxCyIw1UDxoTylhClVL/Kg3AcCk5cE9JmnflkYohAdEeI3uKYp9tbvftu+zZg/O4l
         GFOJ7buxjOQ4QXp7E5LpS0pj8Nl26YP6QkXVQFvGPTiT3bw4KmkTs3rpR4wxRJBlc8UZ
         KlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678353388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4oOjO1iZqHHqppZpeEVZpEKQdPcmPUQRfadcX5/5t0=;
        b=LDhdgLEzOSZhQd3bmF1F0SNIOQVL+QONh9/H/wseCUXSgR3CGZuXfv+lpZKJakA2Ym
         wdZZV7Ama9ii6q+JAd37RiP4p5lS6dhfRBXBm6kysoDDlALbCL0yGMWbLJPgaALj8BJH
         GbzcDqWGjDwWd0dVvn9oc+J0H9n7iyJlWVcZK8OvhQDmvNFsPsjQMk2RL99Nk9dCUg3t
         17JJi9cbLUwHmPcImsnOI9E7lmMOqjLxtOdu5CUFtoOv7/bsB4BlquSajLska/BkdqyV
         fWcAIN2d1v599hLLaWS3l/WKzAySD0D1qPr/67yGpspTSMXy1pzd3fZfchW6QsI82XnS
         FGWg==
X-Gm-Message-State: AO0yUKXiPvQLwjdqVVYyqHRCLZgalUvrCIkckOrvUsYAztoGPio4dSyI
	5A1bwxO/Mh4m//gAmB3FMeCiblgEBwEf7u5rkQxWhQ==
X-Google-Smtp-Source: AK7set/xO9yLZW6FEwts8sv8BrRfJLxSKPDPCskVFgtuZJ0c4xCwq7UwoYUvM1OKfG5y166F1nne9p8uWnZAcO2Kp/8=
X-Received: by 2002:a81:4312:0:b0:52e:b718:24d5 with SMTP id
 q18-20020a814312000000b0052eb71824d5mr13578418ywa.9.1678353387956; Thu, 09
 Mar 2023 01:16:27 -0800 (PST)
MIME-Version: 1.0
References: <20230306191535.1917656-1-sean.anderson@seco.com>
 <20230306191535.1917656-4-sean.anderson@seco.com> <4c039e53-e3ca-29d7-e5ea-f24e385d28b0@linaro.org>
 <42ccbac0-53e2-f599-fb3d-064b896bde4a@seco.com>
In-Reply-To: <42ccbac0-53e2-f599-fb3d-064b896bde4a@seco.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 9 Mar 2023 10:16:16 +0100
Message-ID: <CACRpkdaj-0dyqWdSbQbjyUed+khDLi-awgan1BnuDvuY2JBzFQ@mail.gmail.com>
Subject: Re: [PATCH v10 03/13] dt-bindings: Convert gpio-mmio to yaml
To: Sean Anderson <sean.anderson@seco.com>, Niall Leonard <nl250060@ncr.com>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, =?UTF-8?Q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jonas Gorski <jonas.gorski@gmail.com>, Vinod Koul <vkoul@kernel.org>, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 7, 2023 at 4:35=E2=80=AFPM Sean Anderson <sean.anderson@seco.co=
m> wrote:
> On 3/7/23 03:42, Krzysztof Kozlowski wrote:

> > https://lore.kernel.org/all/20230126-gpio-mmio-fix-v2-1-38397aace340@nc=
r.com/
>
> Thanks for linking to that.
>
> I believe this patch should be applied instead of that one because
>
> - It documents all the registers, which were previously only documented
>   in the driver
> - It handles the endianness properties.
> - It consolidates the various descriptions of this binding into one
>   schema.

Niall are you sending a v3 of this patch soon?
Include Sean on the reviewer list!

Yours,
Linus Walleij
