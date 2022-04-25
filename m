Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F69350E802
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 20:21:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnCys374Hz3brf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 04:21:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Fdw8tEJ7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52f;
 helo=mail-ed1-x52f.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Fdw8tEJ7; dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnCyB22jvz2yK6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 04:21:20 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id b24so19452960edu.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Apr 2022 11:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=wLhrlS1biKXpq5R4CE1YOn/L6FhykNWvxC4seQ/LW7U=;
 b=Fdw8tEJ7RzBEPPkeLkKiIRIonHGhUX5ZA2Ot4Xn7/Yf6h0e59AOylh6JysSNkqVKKz
 yeVOsu0matmwSl2qhR5pORhklf/+jvhzgB2PvcZyAbBmumv8gfAqge0Ufny3JDw0W9Wh
 fRXYNNTn+1W6VCYwgRbuxg4bQuC+nfFjpA7SgNRay92xwXG8bTDNw5l7E8oUhTFNhq2O
 bN67RgacYBXUua0id/Z0rSQXJNw+oK2jnAbWuWerE6tFYB52XBIBho1mVKC7OrSzlsi+
 DU26J+WDV0VSAUxCbrymNsH5yDPP8207EqHb5qqGGK/ec+v1O40t2OC3ropUGVruR2VX
 or1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=wLhrlS1biKXpq5R4CE1YOn/L6FhykNWvxC4seQ/LW7U=;
 b=iBIlEwYDoSnAPGi+TKl9Ap0t5uvk6nexY9JqVwpjxFOQcSCW9K+us4xFdYIHlsdwCa
 iIzF3OnltDsw89MvENjDVbSooAHVVIRo7i8IKDuFHvJuzJQorBBYueNdRXrMf+WslHGC
 Td38pmoD4ws9xwpPXxbElrNRkOgTE/NVQGrifhNiEpSMTRsGPb2qtmYKUKBn0BxCK9AI
 sQImP6ljHGp1DcGj4tl0h5c4ngkwGiibgRO6jdmIikxW2IKBmkBreftdcMw1QTas3DHw
 WTWjwYD+kB233968XAre3zzTXqI7dGKCawUhumG1H4wz0yTmBKAzB1Ys/WOgVrxeCr0S
 6vUQ==
X-Gm-Message-State: AOAM530m439/v3Fj7wWn6WQjKVsDh64oGpGN/2SM6BvPjhAUgrIJWvb+
 PfOBEha5F3d12FJgSYIylE30uw==
X-Google-Smtp-Source: ABdhPJwFoDnOLO0ckjGSwySlRYkY5M6AxkwPge7ifg3C7ch3KjrcUQD9X+CEAmNNCNFRJ3zcSLN5lg==
X-Received: by 2002:a05:6402:1450:b0:425:e43f:7ccd with SMTP id
 d16-20020a056402145000b00425e43f7ccdmr7717463edx.299.1650910874949; 
 Mon, 25 Apr 2022 11:21:14 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 kb9-20020a1709070f8900b006e889aad94esm3894075ejc.128.2022.04.25.11.21.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 11:21:14 -0700 (PDT)
Message-ID: <edcd5a65-26ef-a8de-be44-56aa63e485c3@linaro.org>
Date: Mon, 25 Apr 2022 20:21:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 2/2] dt-bindings: fsl: convert fsl,layerscape-scfg to
 YAML
Content-Language: en-US
To: Michael Walle <michael@walle.cc>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220425140214.32448-1-michael@walle.cc>
 <20220425140214.32448-2-michael@walle.cc>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220425140214.32448-2-michael@walle.cc>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Marc Zyngier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Li Yang <leoyang.li@nxp.com>, Thomas Gleixner <tglx@linutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 25/04/2022 16:02, Michael Walle wrote:
> Convert the fsl,layerscape-scfg binding to the new YAML format.
> 
> In the device trees, the device node always have a "syscon"
> compatible, which wasn't mentioned in the previous binding.
> 
> Also added, compared to the original binding, is the
> interrupt-controller subnode as used in arch/arm/boot/dts/ls1021a.dtsi
> as well as the litte-endian and big-endian properties.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> changes since v1:
>  - moved to soc/fsl/fsl,layerscape-scfg.yaml
>  - generic name for node in example
>  - mention added "syscon" compatible in commit message
>  - reference specific interrupt controller


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
