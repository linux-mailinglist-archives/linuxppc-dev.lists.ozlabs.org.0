Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CCB6ACF93
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 21:53:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVrPl5v0Xz3cjJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 07:52:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dWF4gRYq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=jonas.gorski@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dWF4gRYq;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVrNs49Zyz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 07:52:12 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id m20-20020a17090ab79400b00239d8e182efso14399725pjr.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 12:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678135929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Oux/kKp1lM08/7grSN0HZ+znLDUrmAGftfv0brXoKpo=;
        b=dWF4gRYqHh/tEVbtpDIt+W9gf8vs0vpmqkEL7vgV5h8ShMeeeBg4DOA0W0i7Uw27bC
         fEf2Lwmy99mkXcmn73y7yx3d4WfSl9zmySPV0R19eyzphnQkN7He+pu27N7EX1Ty+B6B
         g2hfm0rRk1aUdaZjK8wN/CJLg5PEiANFT1ecUTf3aMAv+mxEvvDKt1npJEmSw1qiLilj
         rdtQ5ihSPW2hH7xDajrfobWXVZMs3iwwLO5+pOExqhIbGSoD1e5Vpg04/8nkj0ltH6nW
         1v2F/Pd87PpqVvsP4WH9PQqOqZ/K1KobwyEnqw1oIcAJnQdw8+WkovpEtLR72XacW0HB
         MAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678135929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oux/kKp1lM08/7grSN0HZ+znLDUrmAGftfv0brXoKpo=;
        b=yPYORq78BE+zeHH+3kCgIgOmkSI6S01oUW6GVhl3EnHHvWXU3dF4BjD1+kECwn72bQ
         o6Na40ouwFLU50Ay+MEoUp4nPU1kWOhDunulmv1rUEA7j55HFVrQM8OHYkCVYXRGBiWK
         8R065GijwMqqci7BkP6N0+AW5ScSUsX10evUtSwPyZvBTjYY1EIT/xGOZ1OV0djXihDq
         PDu4o+jPtqAjzi9f6wT4p11fLTwtii6GVdN/bOlT/V6RreiF+E1ww3idd2I0MUXtQXtC
         0IankJpg2XArH1xHBdzC7dreXJMR5ftRR9nIO7apS5rLk0y6KrQWQRJx1JfSb6dXXamP
         gjYA==
X-Gm-Message-State: AO0yUKViXfNuWw99karbzemYl5dRb1bET/FRfSY4tQaagAxoKc1EmIF5
	d110BSkTqe3qDRURgVrmMkmmi5vA2ZPa1vJV8pY=
X-Google-Smtp-Source: AK7set+U7+BjxK9GuSOyIzk3Mz6GfIoDtNlvzdJ3Qf8VW2ImDlI8u9ebqH7AKGbq+b723nC8ffejrhUx8OcOTjAw69s=
X-Received: by 2002:a17:903:31d5:b0:19a:f9d9:28d4 with SMTP id
 v21-20020a17090331d500b0019af9d928d4mr4768103ple.3.1678135929039; Mon, 06 Mar
 2023 12:52:09 -0800 (PST)
MIME-Version: 1.0
References: <20230306191535.1917656-1-sean.anderson@seco.com> <20230306191535.1917656-4-sean.anderson@seco.com>
In-Reply-To: <20230306191535.1917656-4-sean.anderson@seco.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Mon, 6 Mar 2023 21:51:57 +0100
Message-ID: <CAOiHx=mcANqHTk9=b0TGHa2rk9nppnKa2EB1v05uHb5jhzoawA@mail.gmail.com>
Subject: Re: [PATCH v10 03/13] dt-bindings: Convert gpio-mmio to yaml
To: Sean Anderson <sean.anderson@seco.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, =?UTF-8?Q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Mon, 6 Mar 2023 at 20:16, Sean Anderson <sean.anderson@seco.com> wrote:
>
> This is a generic binding for simple MMIO GPIO controllers. Although we
> have a single driver for these controllers, they were previously spread
> over several files. Consolidate them. The register descriptions are
> adapted from the comments in the source. There is no set order for the
> registers, so I have not specified one.
>
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
>
> Changes in v10:
> - New
>
>  .../bindings/gpio/brcm,bcm6345-gpio.yaml      |  16 +--
>  .../devicetree/bindings/gpio/gpio-mmio.yaml   | 136 ++++++++++++++++++
>  .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 -----
>  .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 -----
>  4 files changed, 137 insertions(+), 91 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
>  delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
>
> diff --git a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> index 4d69f79df859..e11f4af49c52 100644
> --- a/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml

You are (re-)moving the compatible this file is named after, you might
want to rename the file as well then. Going by age bcm6358 would be
the next oldest one (bcm6318 would be the newest, despite the lowest
number).

Regards
Jonas
