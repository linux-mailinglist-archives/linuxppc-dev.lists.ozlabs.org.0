Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E45A85118B2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 16:19:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpLTZ5pJcz3brM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 00:18:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.160.42; helo=mail-oa1-f42.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpLT705xcz2xvW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 00:18:34 +1000 (AEST)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-d6e29fb3d7so2066993fac.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 07:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=PMYFToIIw9gCyKckeLz6QNSj28pYwPtqHEMymIKkXRA=;
 b=siTYa2LFufoOQvOLKD2QSx42b6jhx889LmNQMY9CkdQPmBacTKCsI9YjmK3LvXMINg
 k6kEMVvgrx4wR0d3LbOlpbYUb8DfcuLEEuGs1PQPuZ020czuwuQZ8bFrbx5v2ia/qKsH
 rTGCUsixn+OBMiUv20NjBlzzlTF3j1ElUSMCYLRrULqAHkEMQLdzIKmGf+3BGhSrNJU4
 rroW8YOgTne4lQw1jznSBD1LvqVHLiiu5A6xUq8ZuSC07nWJPUxpVBv1dLoJ5SXZG/UR
 2N17kv3NB7hmK6HywqJOTSCcRa67EqbVY2LgqkzPFce7KWEHzBL3i4g43m6nJ6JtsSps
 waXg==
X-Gm-Message-State: AOAM532EjidgF62Z93KYnxhsva1+RMUtkUVtlyOAc+UTchCNsKuMj5cj
 fu7AuxTRuty+5GOwEgAjxQ==
X-Google-Smtp-Source: ABdhPJyS08rrT9jgCgkOe3uGHzv/NwWEfTH0q/IX+PLWPJjo6NzGWHPEYfF02mq/cITg/8Jmteod+w==
X-Received: by 2002:a05:6870:6307:b0:e9:6ed6:cb2f with SMTP id
 s7-20020a056870630700b000e96ed6cb2fmr2954367oao.26.1651069110640; 
 Wed, 27 Apr 2022 07:18:30 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 h21-20020a9d6015000000b006025edf7cafsm6020169otj.22.2022.04.27.07.18.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 07:18:30 -0700 (PDT)
Received: (nullmailer pid 4142587 invoked by uid 1000);
 Wed, 27 Apr 2022 14:18:28 -0000
From: Rob Herring <robh@kernel.org>
To: Michael Walle <michael@walle.cc>
In-Reply-To: <20220427075338.1156449-5-michael@walle.cc>
References: <20220427075338.1156449-1-michael@walle.cc>
 <20220427075338.1156449-5-michael@walle.cc>
Subject: Re: [PATCH v3 4/4] dt-bindings: fsl: convert fsl,
 layerscape-scfg to YAML
Date: Wed, 27 Apr 2022 09:18:28 -0500
Message-Id: <1651069108.159837.4142586.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 27 Apr 2022 09:53:38 +0200, Michael Walle wrote:
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
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> changes since v2:
>  - none
> 
> changes since v1:
>  - moved to soc/fsl/fsl,layerscape-scfg.yaml
>  - generic name for node in example
>  - mention added "syscon" compatible in commit message
>  - reference specific interrupt controller
> 
>  .../arm/freescale/fsl,layerscape-scfg.txt     | 19 ------
>  .../bindings/soc/fsl/fsl,layerscape-scfg.yaml | 58 +++++++++++++++++++
>  2 files changed, 58 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/arm/freescale/fsl,layerscape-scfg.txt
>  create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-scfg.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


scfg@1570000: interrupt-controller@1ac:interrupt-map-mask:0:0: 15 was expected
	arch/arm64/boot/dts/freescale/fsl-ls1043a-qds.dtb
	arch/arm64/boot/dts/freescale/fsl-ls1043a-rdb.dtb
	arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb
	arch/arm64/boot/dts/freescale/fsl-ls1046a-qds.dtb
	arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dtb

scfg@1570000: interrupt-controller@1ac:interrupt-map-mask:0:0: 7 was expected
	arch/arm/boot/dts/ls1021a-moxa-uc-8410a.dtb
	arch/arm/boot/dts/ls1021a-qds.dtb
	arch/arm/boot/dts/ls1021a-tsn.dtb
	arch/arm/boot/dts/ls1021a-twr.dtb

