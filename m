Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B405E5E67FF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 18:01:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYKlc4wzRz3dpn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 02:01:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p9HhITvA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=p9HhITvA;
	dkim-atps=neutral
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYKl02cVDz309f
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 02:01:00 +1000 (AEST)
Received: by mail-lf1-x12a.google.com with SMTP id w8so15395657lft.12
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 09:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=81pL7DGs9HD5w7I37cpuZ7MXwqHOECwJdeVMBgzAlQw=;
        b=p9HhITvAiTLIOA9Xo9RkPoH1sLpf0YyHjNBG9YCwwqIrBHvl401CFBSWoEt1sVFO+7
         ymzYQY5i35KlA6q+G6SBXoLHML5N4MtO0DVQwt7qDLviEtR6HVss78HJK7NOGHBgLNI/
         Mpj3KN9khXDzOMP9REWxPpa7QusEkgXmTa/9tzQxHHNpnEVPKZsyAlH4c2TgBZfZNsTi
         yiBjg56FL4PsxXbBeNYwljk2EDScJqL3zkEJuOia1Pb2YRxvsCUYuh1us9eMIFEXvswP
         z/0zWWf5V0DhlkgA18+c1dK9JZ5cxblbt7d/a0ljJNov97Bp6PUEm7hrR7NYkDqUcsFJ
         hy8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=81pL7DGs9HD5w7I37cpuZ7MXwqHOECwJdeVMBgzAlQw=;
        b=qGQtCEHSX4+yFW8H9XFY8FffvOk+9hW3CrPBfY/M5HpxJzzGzoGuqnl0JW483rXuAt
         L2x843Da11avo4fDr62T04Nkn9/93lcunckPsIuh/ayRi+wcBtz5OURTDrB2Bj65KfOy
         GFJzX0qUuxAXtRPgSzfMiboIGVxFWWll52JX/01TitvNwFm1M7+z6hq7O08tay5Yc8tO
         XDbZuReZh46B3+M0/vRS5m9MGGgM8lMyk2j8t/REUu9TSt09r4Ym/R2o8RhNDFONm+Qy
         erGmHUhcJvUpp5EG5+fgfXvbvUxC461hLpysInySz1TDYzE1woClxO55WFJ9Vl5Knlv6
         kXXw==
X-Gm-Message-State: ACrzQf0t6NoxP3H7i4+z04d9flhZ7AbcHS9I1OmbXiXzXceLo5SwdV1z
	ozkuDFLhMCIXMigjBKNcJ7AEZg==
X-Google-Smtp-Source: AMsMyM7zp82NHkC7Tv6Mqv+9LGkxDK/DsUhOCxklWQbvOP7x7UlHQe656cZRo7e1NfMasN7HH9hIng==
X-Received: by 2002:a05:6512:2621:b0:491:10ba:321a with SMTP id bt33-20020a056512262100b0049110ba321amr1407331lfb.187.1663862456786;
        Thu, 22 Sep 2022 09:00:56 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k3-20020a2eb743000000b0026c5bc6ed1asm952108ljo.69.2022.09.22.09.00.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 09:00:56 -0700 (PDT)
Message-ID: <c66e2bbe-4758-4d8e-f8aa-5b7bd1b7c2e3@linaro.org>
Date: Thu, 22 Sep 2022 18:00:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v6 2/8] dt-bindings: phy: Add Lynx 10G phy binding
Content-Language: en-US
To: Sean Anderson <sean.anderson@seco.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-phy@lists.infradead.org
References: <20220920202356.1451033-1-sean.anderson@seco.com>
 <20220920202356.1451033-3-sean.anderson@seco.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220920202356.1451033-3-sean.anderson@seco.com>
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20/09/2022 22:23, Sean Anderson wrote:
> This adds a binding for the SerDes module found on QorIQ processors.
> Each phy is a subnode of the top-level device, possibly supporting
> multiple lanes and protocols. This "thick" #phy-cells is used due to
> allow for better organization of parameters. Note that the particular
> parameters necessary to select a protocol-controller/lane combination
> vary across different SoCs, and even within different SerDes on the same
> SoC.
> 
> The driver is designed to be able to completely reconfigure lanes at
> runtime. Generally, the phy consumer can select the appropriate
> protocol using set_mode.
> 
> There are two PLLs, each of which can be used as the master clock for
> each lane. Each PLL has its own reference. For the moment they are
> required, because it simplifies the driver implementation. Absent
> reference clocks can be modeled by a fixed-clock with a rate of 0.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> 
> Changes in v6:
> - fsl,type -> phy-type
> 
> Changes in v4:
> - Use subnodes to describe lane configuration, instead of describing
>   PCCRs. This is the same style used by phy-cadence-sierra et al.
> 
> Changes in v3:
> - Manually expand yaml references
> - Add mode configuration to device tree
> 
> Changes in v2:
> - Rename to fsl,lynx-10g.yaml
> - Refer to the device in the documentation, rather than the binding
> - Move compatible first
> - Document phy cells in the description
> - Allow a value of 1 for phy-cells. This allows for compatibility with
>   the similar (but according to Ioana Ciornei different enough) lynx-28g
>   binding.
> - Remove minItems
> - Use list for clock-names
> - Fix example binding having too many cells in regs
> - Add #clock-cells. This will allow using assigned-clocks* to configure
>   the PLLs.
> - Document the structure of the compatible strings
> 
>  .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 236 ++++++++++++++++++
>  1 file changed, 236 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> new file mode 100644
> index 000000000000..ce9afdbf33f4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> @@ -0,0 +1,236 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/fsl,lynx-10g.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP Lynx 10G SerDes
> +
> +maintainers:
> +  - Sean Anderson <sean.anderson@seco.com>
> +
> +description: |
> +  These Lynx "SerDes" devices are found in NXP's QorIQ line of processors. The
> +  SerDes provides up to eight lanes. Each lane may be configured individually,
> +  or may be combined with adjacent lanes for a multi-lane protocol. The SerDes
> +  supports a variety of protocols, including up to 10G Ethernet, PCIe, SATA, and
> +  others. The specific protocols supported for each lane depend on the
> +  particular SoC.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,ls1046a-serdes
> +          - fsl,ls1088a-serdes
> +      - const: fsl,lynx-10g
> +
> +  "#address-cells":

If there is going to be resend, use only one type of quotes: ' or ".

FWIW (Rob's reviewed it):

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

