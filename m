Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 755CA6B01FA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 09:49:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWmFy2JW0z3cLx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 19:49:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fWi10K1W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=fWi10K1W;
	dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWmF05cClz30QS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Mar 2023 19:48:34 +1100 (AEDT)
Received: by mail-ed1-x534.google.com with SMTP id u9so62748544edd.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Mar 2023 00:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678265307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1IW/RS0aLSSxBgB22OqTCxBSr+YdxHtk+0LFWe36vG8=;
        b=fWi10K1WTyMK+4gDA9j0bPprPuyGTBeu+XpocgR0cj+w9BYHj8UpNgU5t7v3PylQf4
         wY74bZ0VgPsmZ8GVnLZyawG4vExQk4VcpD8Sy0ZZgjLsoHTB/p4JGasSRwFQVP8ViAYf
         WHpwv0Mg5L+yjUF3WBMF54f2a2kM7teDdMKvcEZ8x1/hxlvMOJa3ayKvTtSdw6XnOinN
         42qPZITrCQ9SggMQB/mIKJWFKZbdt8OCZwawYh2mDlhPjzhsD2B27DiZmPzywHUBFkmE
         JZqgDm/dydu/Ju6adDOlnoDIvWPGAZEA9meFjPpRMZWO92uiHM2/um7Ka996PE42nENe
         VcMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678265307;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1IW/RS0aLSSxBgB22OqTCxBSr+YdxHtk+0LFWe36vG8=;
        b=t+cB0Yi8WunIYm80Lm4UcT+gv7H8bpVJJw/JRqU5f+gdYrbTyk5nJTDNuHl8Z12O/f
         zOyJ4aRLqtBrIEjNPeUXGySzrKjh2iaNVTDF0JIRc9Okt2zuSfFU0sKakFOTnNM8sYzJ
         5EcidXUsWcRAlIj2NclSJ/wVOaU1PKuE+bJ+5kR0FMKIQZmG4xDJTShDUTYxfQ9JYX8k
         QERiAUfDDSbEwDZVxoEJNF7WGe8rySSEhcnxuyxaMoRw3m2uBaZ3B3/BU80PCjVNMnbk
         c/FrUumG0sz7JrTpPJAo7iPV4+0+k36gH1GCbUUJjjuwy25Lwq6Ilt7kHA4zTDw/nRb7
         rY9w==
X-Gm-Message-State: AO0yUKU+06LN7lNMOtjPncZGj4HtEZhmJbgL+B5bRhPziRylslqsF34A
	Zae24i8tqDzWMqE49NFuxCkneA==
X-Google-Smtp-Source: AK7set+/a5vYatHyXTm+A6Q49AO+MfL5eXvY6zaULzOwyp5e47XvyDA35K8uivkmDjkP8sa9O9411w==
X-Received: by 2002:a17:906:1846:b0:8b8:c06e:52d8 with SMTP id w6-20020a170906184600b008b8c06e52d8mr16121027eje.36.1678265306937;
        Wed, 08 Mar 2023 00:48:26 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:bba:fbfa:8aec:a133? ([2a02:810d:15c0:828:bba:fbfa:8aec:a133])
        by smtp.gmail.com with ESMTPSA id a4-20020a17090682c400b008d4b6f086c9sm7141528ejy.185.2023.03.08.00.48.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 00:48:26 -0800 (PST)
Message-ID: <0013ce4d-d4a8-2a82-c72b-042dd4d9779c@linaro.org>
Date: Wed, 8 Mar 2023 09:48:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v10 03/13] dt-bindings: Convert gpio-mmio to yaml
To: Sean Anderson <sean.anderson@seco.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-phy@lists.infradead.org,
 Niall Leonard <nl250060@ncr.com>
References: <20230306191535.1917656-1-sean.anderson@seco.com>
 <20230306191535.1917656-4-sean.anderson@seco.com>
 <4c039e53-e3ca-29d7-e5ea-f24e385d28b0@linaro.org>
 <42ccbac0-53e2-f599-fb3d-064b896bde4a@seco.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <42ccbac0-53e2-f599-fb3d-064b896bde4a@seco.com>
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

On 07/03/2023 16:35, Sean Anderson wrote:
> Hi Krzysztof,
> 
> On 3/7/23 03:42, Krzysztof Kozlowski wrote:
>> On 06/03/2023 20:15, Sean Anderson wrote:
>>> This is a generic binding for simple MMIO GPIO controllers. Although we
>>> have a single driver for these controllers, they were previously spread
>>> over several files. Consolidate them. The register descriptions are
>>> adapted from the comments in the source. There is no set order for the
>>> registers, so I have not specified one.
>>>
>>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>>> ---
>>>
>>> Changes in v10:
>>> - New
>>>
>>>  .../bindings/gpio/brcm,bcm6345-gpio.yaml      |  16 +--
>>>  .../devicetree/bindings/gpio/gpio-mmio.yaml   | 136 ++++++++++++++++++
>>>  .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 -----
>>>  .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 -----
>>>  4 files changed, 137 insertions(+), 91 deletions(-)
>>>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
>>>  delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
>>>  delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
>>
>> https://lore.kernel.org/all/20230126-gpio-mmio-fix-v2-1-38397aace340@ncr.com/
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

Sure, sounds reasonable. You can just quickly check if my other comments
apply here as well (but seems not):
https://lore.kernel.org/all/4df3ec7a-e4af-89bc-9eda-21150395a935@linaro.org/

Best regards,
Krzysztof

