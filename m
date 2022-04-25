Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F5D50E860
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 20:37:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnDJt5NDPz3bq5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 04:37:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=l73hcHZE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::52b;
 helo=mail-ed1-x52b.google.com; envelope-from=krzysztof.kozlowski@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=l73hcHZE; dkim-atps=neutral
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnDJC3TxFz2xgJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 04:36:58 +1000 (AEST)
Received: by mail-ed1-x52b.google.com with SMTP id y21so12628213edo.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Apr 2022 11:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ydNiU7IrIaCND48p0/RDJI06lFZyczTfdfRkiVUeW8I=;
 b=l73hcHZEi18QTdp+E3nZcuxNNVI85ZPRamsYOBKhKoF8H6lj21mm3351/qhk/047kT
 Kna9RplHzIIaYCN0Xx1Y76xufwbuYEk7xsymQptDb7eEQKufoznkuvRA3KSo/VaqVDcO
 6B2F12H6OaZmg4fJm8hqxnya6Fnv+HFqQNFHX6PN1r4rxaXmb9risNZNimV2/D9pufGu
 D/CmI/xX5GsZSQRT/4uL76r2GmLYqXKoc1DQo8G45bQfDOtfgbMt74s7ms2P6eNQnghz
 nJGMWFz0zo98iQb3+5Sol5++Ldr2mGyJtz0WfZmBDroUJcV8GJeLAYg91kBrZ8LhKj0z
 c90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ydNiU7IrIaCND48p0/RDJI06lFZyczTfdfRkiVUeW8I=;
 b=OQEEGSGP9z17nc0HSBk88bIsD0vHWYv4W9zXb2TM/4Yu2rGWTc3eNXgWONOk02IT2w
 9SZwEmCzDoEbsBjpvolrDksKBp1+A0dwlgToL3WFIIv2y6hoUHDboLCQCBucxq+J7pMe
 yrmJajToLTy/9IoMODCwlVXo09ZvbycjOkFSd9lirt02/vj4+IgMg7DmGsGWMbUEZ3oM
 cJVuL6BPwGO7Z/yJ0RqlgHPo9jtMjT021fqiBxmXNK9YW4Ne0flTWyJqGOD9R2426V+2
 ZxHkAEZL8EpqN7RwToigWnsMvicfxevoH8BGNKcpXnoONBc1k4Yfz0oD2rkzFT4V0b+U
 41rg==
X-Gm-Message-State: AOAM532aAnE9mTnAc8fjtp3S8RjIvapPAIA6604HjIeQQncD8EW+ZzSH
 FHMpuW9Kp+Id6qECin9Q/BXPuw==
X-Google-Smtp-Source: ABdhPJwi05uX9rNkGQP4GNoyT0fYFCErBALKyIKKTJ3M5Oz/OvBf+2meZYdauaUjaJiQa46PgKKvEw==
X-Received: by 2002:a05:6402:330b:b0:425:eded:7cfe with SMTP id
 e11-20020a056402330b00b00425eded7cfemr5100589eda.357.1650911814789; 
 Mon, 25 Apr 2022 11:36:54 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 jo11-20020a170906f6cb00b006f3955761c4sm1416631ejb.158.2022.04.25.11.36.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 11:36:54 -0700 (PDT)
Message-ID: <658851ed-33fd-8e2b-7db7-ef1ca9e31c33@linaro.org>
Date: Mon, 25 Apr 2022 20:36:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: fsl, ls-extirq:
 convert to YAML
Content-Language: en-US
To: Michael Walle <michael@walle.cc>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20220425140214.32448-1-michael@walle.cc>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220425140214.32448-1-michael@walle.cc>
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
> Convert the fsl,ls-extirq binding to the new YAML format.
> 

(...)

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.yaml
> new file mode 100644
> index 000000000000..39d120ad7549
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,ls-extirq.yaml
> @@ -0,0 +1,88 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/fsl,ls-extirq.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale Layerscape External Interrupt Controller
> +
> +maintainers:
> +  - Shawn Guo <shawnguo@kernel.org>
> +  - Li Yang <leoyang.li@nxp.com>
> +
> +description: |
> +  Some Layerscape SOCs (LS1021A, LS1043A, LS1046A LS1088A, LS208xA,
> +  LX216xA) support inverting the polarity of certain external interrupt
> +  lines.
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#

I have doubts whether this is here applicable. See also Rob's comment:
https://lore.kernel.org/all/YjjJpxLWJ%2FYOe0OX@robh.at.kernel.org/

This device does not have children, so the interrupt-controller schema
should be probably skipped.


> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - fsl,ls1021a-extirq
> +          - fsl,ls1043a-extirq
> +          - fsl,ls1088a-extirq
> +      - items:
> +          - enum:
> +              - fsl,ls1046a-extirq
> +          - const: fsl,ls1043a-extirq
> +      - items:
> +          - enum:
> +              - fsl,ls2080a-extirq
> +              - fsl,lx2160a-extirq
> +          - const: fsl,ls1088a-extirq
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  '#address-cells':
> +    const: 0
> +
> +  interrupt-controller: true
> +
> +  reg:
> +    maxItems: 1
> +    description:
> +      Specifies the Interrupt Polarity Control Register (INTPCR) in the
> +      SCFG or the External Interrupt Control Register (IRQCR) in the ISC.
> +
> +  interrupt-map:
> +    description: Specifies the mapping from external interrupts to GIC interrupts.
> +
> +  interrupt-map-mask:
> +    items:
> +      - const: 0xffffffff

This looks highly permissive mask and should be instead defined per
variant, for example (quickly looking at DTS):
0x7 for ls1021
0xf for ls1043a and ls1088a

You might need to correct the DTS. Some confirmation from someone with
datasheet would be good.


Best regards,
Krzysztof
