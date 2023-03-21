Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 704AB6C3DBF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 23:34:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ph5xd2jzYz3f6k
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 09:34:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.169; helo=mail-oi1-f169.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Ph5x30Vhkz3c6X
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 09:33:41 +1100 (AEDT)
Received: by mail-oi1-f169.google.com with SMTP id e4so5478138oiy.10
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Mar 2023 15:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679438018;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lq5IHN4ky6w3nFPQn7CkTtEA1+7XZPAY5dbicjXStOc=;
        b=ayadv+7KiqJmSQ15hcpik41d0Qn2v94yFgYvtMXVycgXTA/dEWqTR1f6RKCV1pszbf
         BolIvAzwmOByRCiE4FbhFJMF8w+oZ0zrMv+Ki9HdZyRkNxJx0wOiOjUdQrVnbTHLjwtx
         0hiFDJctbK3xGRG0eXFjeEgMj48PlMVGDyiloWhBPNEMEAceEBJarPS6QluJljNRswqN
         9HeefZGieFsrfYzukVjzNXsHaGPZpXhBFSG+IeOGZzm+6MZqsawXrAjyHE7TagJGP2VO
         Xr8D4QpGE+Wln7oms/jcmDRhx5IzZuzZ7R4Ih3yJp0RRLUAoTyzt5d0+M77poz8tW8/7
         QoLA==
X-Gm-Message-State: AO0yUKV4JIykusnKxNM87mOpwzPN+gtaCtzW0Ri0zZSoLD7eq7t0ekEk
	TkjFQuTjNGh95TGV1MwNVA==
X-Google-Smtp-Source: AK7set+RTgO3GuSot4uEnORzZq3leOTPVHBZNtYNYKqkygCniCpnwFTc8h7YWpTGdM34MeQJSF3ztA==
X-Received: by 2002:aca:1a09:0:b0:387:1e2d:f28c with SMTP id a9-20020aca1a09000000b003871e2df28cmr328398oia.40.1679438017104;
        Tue, 21 Mar 2023 15:33:37 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b20-20020a056870d1d400b001768b4759e5sm4681974oac.14.2023.03.21.15.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 15:33:36 -0700 (PDT)
Received: (nullmailer pid 1784094 invoked by uid 1000);
	Tue, 21 Mar 2023 22:33:35 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230321201313.2507539-4-sean.anderson@seco.com>
References: <20230321201313.2507539-1-sean.anderson@seco.com>
 <20230321201313.2507539-4-sean.anderson@seco.com>
Message-Id: <167943790379.1778436.6467675853920923217.robh@kernel.org>
Subject: Re: [PATCH v12 03/13] dt-bindings: Convert gpio-mmio to yaml
Date: Tue, 21 Mar 2023 17:33:35 -0500
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Fernández Rojas <noltari@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-gpio@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Tue, 21 Mar 2023 16:13:02 -0400, Sean Anderson wrote:
> This is a generic binding for simple MMIO GPIO controllers. Although we
> have a single driver for these controllers, they were previously spread
> over several files. Consolidate them. The register descriptions are
> adapted from the comments in the source. There is no set order for the
> registers, and some registers may be omitted. Because of this, reg-names
> is mandatory, and no order is specified.
> 
> Rename brcm,bcm6345-gpio to brcm,bcm63xx-gpio to reflect that bcm6345
> has moved.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Linus or Bartosz, feel free to pick this up as the rest of this series
> may not be merged any time soon.
> 
> Changes in v12:
> - Put compatible first
> - Keep gpio-controller to one line
> - Add little-endian property
> - Alphabetize compatibles
> - Remove some comments
> - Remove some examples with insufficient novelty
> 
> Changes in v11:
> - Keep empty (or almost-empty) properties on a single line
> - Don't use | unnecessarily
> - Use gpio as the node name for examples
> - Rename brcm,bcm6345-gpio.yaml to brcm,bcm63xx-gpio.yaml
> 
> Changes in v10:
> - New
> 
>  ...m6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} |  16 +--
>  .../devicetree/bindings/gpio/gpio-mmio.yaml   | 117 ++++++++++++++++++
>  .../bindings/gpio/ni,169445-nand-gpio.txt     |  38 ------
>  .../devicetree/bindings/gpio/wd,mbl-gpio.txt  |  38 ------
>  4 files changed, 118 insertions(+), 91 deletions(-)
>  rename Documentation/devicetree/bindings/gpio/{brcm,bcm6345-gpio.yaml => brcm,bcm63xx-gpio.yaml} (78%)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-mmio.yaml
>  delete mode 100644 Documentation/devicetree/bindings/gpio/ni,169445-nand-gpio.txt
>  delete mode 100644 Documentation/devicetree/bindings/gpio/wd,mbl-gpio.txt
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/gpio/brcm,bcm63xx-gpio.yaml#
./Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/gpio/brcm,bcm6345-gpio.yaml
./Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/gpio/brcm,bcm6345-gpio.yaml
./Documentation/devicetree/bindings/mfd/brcm,bcm6362-gpio-sysctl.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/gpio/brcm,bcm6345-gpio.yaml
./Documentation/devicetree/bindings/mfd/brcm,bcm6368-gpio-sysctl.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/gpio/brcm,bcm6345-gpio.yaml
./Documentation/devicetree/bindings/mfd/brcm,bcm6328-gpio-sysctl.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/gpio/brcm,bcm6345-gpio.yaml
./Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml: Unable to find schema file matching $id: http://devicetree.org/schemas/gpio/brcm,bcm6345-gpio.yaml

doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml references a file that doesn't exist: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
Warning: Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml references a file that doesn't exist: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
Warning: Documentation/devicetree/bindings/mfd/brcm,bcm6328-gpio-sysctl.yaml references a file that doesn't exist: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
Warning: Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml references a file that doesn't exist: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
Warning: Documentation/devicetree/bindings/mfd/brcm,bcm6362-gpio-sysctl.yaml references a file that doesn't exist: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
Warning: Documentation/devicetree/bindings/mfd/brcm,bcm6368-gpio-sysctl.yaml references a file that doesn't exist: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
Documentation/devicetree/bindings/mfd/brcm,bcm6328-gpio-sysctl.yaml: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
Documentation/devicetree/bindings/mfd/brcm,bcm6362-gpio-sysctl.yaml: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml
Documentation/devicetree/bindings/mfd/brcm,bcm6368-gpio-sysctl.yaml: Documentation/devicetree/bindings/gpio/brcm,bcm6345-gpio.yaml

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230321201313.2507539-4-sean.anderson@seco.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

