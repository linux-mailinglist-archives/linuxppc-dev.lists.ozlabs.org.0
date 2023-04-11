Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F55A6DE83C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 01:45:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Px2X33TCWz3f4T
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 09:45:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.43; helo=mail-ot1-f43.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Px2WX47Bpz3bhx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 09:44:55 +1000 (AEST)
Received: by mail-ot1-f43.google.com with SMTP id bu14-20020a0568300d0e00b0069fab3f4cafso4671132otb.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 16:44:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681256691; x=1683848691;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bhO8R9GioOCOagQ6Y9fLjNmhaghaaAAsdr3nkk8G91Q=;
        b=Cjazo24xp7++bcIkWiBu13idDNAHEKwF8D/DThTp7KBkPncZKsedvCP641u9NkMjDj
         ipSYB7cOp7lZ5na/hHwqkXJsfiuGZTk80ALPfDFYvDj5PyZHb0t1CAHHCLn8DI9+R/5N
         8IZblBZVR+Regm3tmsW/Qtcyz340/ntnsovFT6LO0L1JGT4QQwGjuA9986vVXLl5djzQ
         Bp7Jz1SnftiWfmFB65g3G2UaJGKw2M1lg9J5BKAqD+L5zEZLQJpNlIJUJEVeRwpdBy4t
         9vR2jPChDEJpyKxZn0iNxVpSH9fn/XT5vKGvCb4oGNBd+1luai+dzNFgq3+V5F0pS5IE
         Qwfw==
X-Gm-Message-State: AAQBX9e5wzrus7crMDOVzD2B5sJorgY7a6u1SO3jTHrM01Aw2GByZn1l
	LnoRSicY6FiU9K0sg4ajkQ==
X-Google-Smtp-Source: AKy350Y4GC3JdkRk79jMyBG3SpXIy4yOATtALC36XtJb/GoPcjog7NeXxd7pXFccoDWD6Pn4a81+Jg==
X-Received: by 2002:a9d:7e98:0:b0:6a4:1980:2a93 with SMTP id m24-20020a9d7e98000000b006a419802a93mr294955otp.29.1681256691465;
        Tue, 11 Apr 2023 16:44:51 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m13-20020a0568301e6d00b0069faa14e99fsm5897068otr.10.2023.04.11.16.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 16:44:50 -0700 (PDT)
Received: (nullmailer pid 60808 invoked by uid 1000);
	Tue, 11 Apr 2023 23:44:49 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20230411184313.3679145-4-sean.anderson@seco.com>
References: <20230411184313.3679145-1-sean.anderson@seco.com>
 <20230411184313.3679145-4-sean.anderson@seco.com>
Message-Id: <168125645190.55087.12770846806127473997.robh@kernel.org>
Subject: Re: [PATCH v13 03/15] dt-bindings: Convert gpio-mmio to yaml
Date: Tue, 11 Apr 2023 18:44:49 -0500
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, =?utf-8?q?Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, Jonas Gorski <jonas.gorski@gmail.com>, linux-gpio@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Tue, 11 Apr 2023 14:43:00 -0400, Sean Anderson wrote:
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
> Changes in v13:
> - Fix references to brcm,bcm63xx-gpio.yaml (neé brcm,bcm6345-gpio)
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
>  .../mfd/brcm,bcm6318-gpio-sysctl.yaml         |   4 +-
>  .../mfd/brcm,bcm63268-gpio-sysctl.yaml        |   4 +-
>  .../mfd/brcm,bcm6328-gpio-sysctl.yaml         |   4 +-
>  .../mfd/brcm,bcm6358-gpio-sysctl.yaml         |   4 +-
>  .../mfd/brcm,bcm6362-gpio-sysctl.yaml         |   4 +-
>  .../mfd/brcm,bcm6368-gpio-sysctl.yaml         |   4 +-
>  10 files changed, 130 insertions(+), 103 deletions(-)
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
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.example.dtb: syscon@10000080: gpio@0: False schema does not allow {'compatible': ['brcm,bcm6318-gpio'], 'reg-names': ['dirout', 'dat'], 'reg': [[0, 8], [8, 8]], 'gpio-controller': True, 'gpio-ranges': [[1, 0, 0, 50]], '#gpio-cells': [[2]]}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.example.dtb: syscon@100000c0: gpio@0: False schema does not allow {'compatible': ['brcm,bcm63268-gpio'], 'reg-names': ['dirout', 'dat'], 'reg': [[0, 8], [8, 8]], 'gpio-controller': True, 'gpio-ranges': [[1, 0, 0, 52]], '#gpio-cells': [[2]]}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm63268-gpio-sysctl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm6362-gpio-sysctl.example.dtb: syscon@10000080: gpio@0: False schema does not allow {'compatible': ['brcm,bcm6362-gpio'], 'reg-names': ['dirout', 'dat'], 'reg': [[0, 8], [8, 8]], 'gpio-controller': True, 'gpio-ranges': [[1, 0, 0, 48]], '#gpio-cells': [[2]]}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm6362-gpio-sysctl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm6328-gpio-sysctl.example.dtb: syscon@10000080: gpio@0: False schema does not allow {'compatible': ['brcm,bcm6328-gpio'], 'reg-names': ['dirout', 'dat'], 'reg': [[0, 8], [8, 8]], 'gpio-controller': True, 'gpio-ranges': [[1, 0, 0, 32]], '#gpio-cells': [[2]]}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm6328-gpio-sysctl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.example.dtb: syscon@fffe0080: gpio@0: False schema does not allow {'compatible': ['brcm,bcm6358-gpio'], 'reg-names': ['dirout', 'dat'], 'reg': [[0, 8], [8, 8]], 'gpio-controller': True, 'gpio-ranges': [[1, 0, 0, 40]], '#gpio-cells': [[2]]}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm6358-gpio-sysctl.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm6368-gpio-sysctl.example.dtb: syscon@10000080: gpio@0: False schema does not allow {'compatible': ['brcm,bcm6368-gpio'], 'reg-names': ['dirout', 'dat'], 'reg': [[0, 8], [8, 8]], 'gpio-controller': True, 'gpio-ranges': [[1, 0, 0, 38]], '#gpio-cells': [[2]]}
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/brcm,bcm6368-gpio-sysctl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230411184313.3679145-4-sean.anderson@seco.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

