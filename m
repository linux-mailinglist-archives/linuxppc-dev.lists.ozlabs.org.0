Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EF96AD972
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 09:43:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PW89X19BFz3cfh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 19:43:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Eusd+XKK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Eusd+XKK;
	dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PW88c6LlXz3bh8
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 19:42:39 +1100 (AEDT)
Received: by mail-ed1-x52d.google.com with SMTP id da10so49283229edb.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Mar 2023 00:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678178555;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=unqTYip/nZX7WkFVVubRKmL0WM29EpJsVS8P0OsOpaE=;
        b=Eusd+XKKTE+5SuOXFhD4Jk4H8VMkJJ50GMAWk0gBxQei4r0OxVLwrd1mTkzNzFUiz2
         1wRs9FOXpNIKdrkWQ9ERJnKiotHtLrwu3n36DYL0+5ZEar49+NINtEXWHqwwPn4xNR5Y
         NWljxAdz10RbCv0R1G1rinKUjT/kKAIOf5kcs1qSA2HLqZOvfrvwYmskUjaxcuvWxnCb
         zUJc9Vg627t75Taw73EldUXKGTig9uECMUp/+1TqHVlAbwxt/hVAtt+0sJLByiKzYXlk
         2wdDyyfHBsKcrLjieYpPG1bgTCGHX706/B2Yj2HQG34z5CtkFsHDt0eU1lxIyKGotnaD
         uaCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678178555;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=unqTYip/nZX7WkFVVubRKmL0WM29EpJsVS8P0OsOpaE=;
        b=75CHI9Qs7ZzwlrpkWhbmA5LvbDz2bZtxDHWgozOEHgh/KrFVQpM+3eaKCZ1NnvkWMK
         g7o8cTgUKKpwDfC97FaWrf71ev8n2ijTr4lHu4ihGC9ZOno+CZ/8fqwX3XL+g3z5VSmD
         80Q3f+LM35TgQRc9vAYiZgzOncbKG8bUpW9YxjaIsD9sURuic3X+VKSX04uZ7arrUSV5
         c1N9xITWBdBTzEPZansT820xz8ybzDduiBKrGo1/X0jY0pGr0Ec6rMt7Qq6U6L3zRVRl
         GSPWHtzqLjH8BpGgOdLla+GekvYmhEjFmITV/sIqOYnbqkJk75sEd/1kJjB9ful6wzfC
         S3dA==
X-Gm-Message-State: AO0yUKUxyrbybzMMXBPSm/vwZJFNRS2JkvKkJR9LJI+Xa8REzuWlM/TM
	j7qWcP8yRt+YQbZh/PGhjuzJ+w==
X-Google-Smtp-Source: AK7set8Rs3NbWr/+syYwZkWacBKqzhW8dHm3qaImZJYpVxvN4EL2d7wEi9d0aVvqf+tbGrSHBr3kZA==
X-Received: by 2002:a17:907:7f09:b0:8b1:7e21:f0e9 with SMTP id qf9-20020a1709077f0900b008b17e21f0e9mr16867174ejc.18.1678178554921;
        Tue, 07 Mar 2023 00:42:34 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:5310:35c7:6f9e:2cd3? ([2a02:810d:15c0:828:5310:35c7:6f9e:2cd3])
        by smtp.gmail.com with ESMTPSA id r17-20020a50aad1000000b004bfa4f747d2sm6301772edc.54.2023.03.07.00.42.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 00:42:34 -0800 (PST)
Message-ID: <4c039e53-e3ca-29d7-e5ea-f24e385d28b0@linaro.org>
Date: Tue, 7 Mar 2023 09:42:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 03/13] dt-bindings: Convert gpio-mmio to yaml
Content-Language: en-US
To: Sean Anderson <sean.anderson@seco.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-phy@lists.infradead.org
References: <20230306191535.1917656-1-sean.anderson@seco.com>
 <20230306191535.1917656-4-sean.anderson@seco.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230306191535.1917656-4-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, =?UTF-8?Q?Fern=c3=a1ndez_Rojas?= <noltari@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Jonas Gorski <jonas.gorski@gmail.com>, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/03/2023 20:15, Sean Anderson wrote:
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

https://lore.kernel.org/all/20230126-gpio-mmio-fix-v2-1-38397aace340@ncr.com/

https://lore.kernel.org/all/9bc9349d6e13d81c6200b0cd8fa20c76263043f6.1462543458.git.chunkeey@googlemail.com/



Best regards,
Krzysztof

