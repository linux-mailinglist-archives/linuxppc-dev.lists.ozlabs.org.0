Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F253631121
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 22:37:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NF6SX2rqtz3f5L
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Nov 2022 08:37:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.49; helo=mail-oa1-f49.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NF6Ry04YFz307C
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Nov 2022 08:37:00 +1100 (AEDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-14279410bf4so8068171fac.8
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 13:37:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:subject:message-id:references:in-reply-to:cc:to:from
         :mime-version:content-transfer-encoding:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RRq8v0X3p2aZwGAcJtCVZBHI71mA/UO0IQVawSCBv34=;
        b=gZmnYAIYUYa4AP+9Vh7v8wfdljkFT276SRSaF9c5MFuEBVJuk8ahi37li6TAQT7XJx
         fvzBAjEbxRXyL/qqOY7h0T5EwEqHbwA6xJHbqQ/yNmejITGJwCIHwqbqB74EEC1HQEmq
         BODGvnsyXgu8f11SkSKWIkTBaF3j1R5V2HDP6bbTo3bhLShE6P+pLXqDlwK9+q3Raqta
         IP05k8CZxxmp+6hQYXoq7Q4AlYOl5ftJOtNEf7zhSLzZdAOMDRkV1ub8nOnyjmnbKce6
         9i/PZDF5h7L9AZcfC8N/fwgiZUPR3VyiWnUYQKL2VFUdkovucj8vryxIuO6HK7J33vWN
         VByQ==
X-Gm-Message-State: ANoB5pluVCes6CDTSEs5Qv3chMxKsju7do2FFSW0sv7oT3lvAUnIk1eY
	uzWQFSmN7rgSWaVV4SOi4w==
X-Google-Smtp-Source: AA0mqf6Qq1z9a/mzRxMv2BFvCXiMTKDB6BCsV/LVkYxS3D+Q8JDWh9D/bIjXsO5eeOK7FCVAJ273Qw==
X-Received: by 2002:a05:6870:4b98:b0:13b:8097:79aa with SMTP id lx24-20020a0568704b9800b0013b809779aamr10072700oab.118.1668893814432;
        Sat, 19 Nov 2022 13:36:54 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id cd15-20020a056830620f00b006619f38a686sm3124148otb.56.2022.11.19.13.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Nov 2022 13:36:53 -0800 (PST)
Received: (nullmailer pid 1829799 invoked by uid 1000);
	Sat, 19 Nov 2022 21:36:55 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Ash Logan <ash@heyquark.com>
In-Reply-To: <20221119113041.284419-2-ash@heyquark.com>
References: <20220628133144.142185-1-ash@heyquark.com>
 <20221119113041.284419-1-ash@heyquark.com>
 <20221119113041.284419-2-ash@heyquark.com>
Message-Id: <166889377396.1828488.10770101082867021611.robh@kernel.org>
Subject: Re: [PATCH v4 01/11] dt-bindings: wiiu: Document the Nintendo Wii U
 devicetree
Date: Sat, 19 Nov 2022 15:36:55 -0600
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
Cc: devicetree@vger.kernel.org, pali@kernel.org, linkmauve@linkmauve.fr, linux-kernel@vger.kernel.org, joel@jms.id.au, robh+dt@kernel.org, paulus@samba.org, rw-r-r-0644@protonmail.com, krzysztof.kozlowski+dt@linaro.org, linuxppc-dev@lists.ozlabs.org, j.ne@posteo.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Sat, 19 Nov 2022 22:30:31 +1100, Ash Logan wrote:
> Adds schema for the various Wii U devicetree nodes used.
> 
> Signed-off-by: Ash Logan <ash@heyquark.com>
> ---
> v3->v4: Rework to match expected style and conciceness.
> 
>  .../bindings/powerpc/nintendo/wiiu.yaml       | 25 +++++++++
>  .../powerpc/nintendo/wiiu/espresso-pic.yaml   | 48 ++++++++++++++++
>  .../bindings/powerpc/nintendo/wiiu/gpu7.yaml  | 42 ++++++++++++++
>  .../powerpc/nintendo/wiiu/latte-ahci.yaml     | 50 +++++++++++++++++
>  .../powerpc/nintendo/wiiu/latte-dsp.yaml      | 35 ++++++++++++
>  .../powerpc/nintendo/wiiu/latte-pic.yaml      | 55 +++++++++++++++++++
>  .../powerpc/nintendo/wiiu/latte-sdhci.yaml    | 46 ++++++++++++++++
>  .../bindings/powerpc/nintendo/wiiu/latte.yaml | 31 +++++++++++
>  .../devicetree/bindings/usb/generic-ehci.yaml |  1 +
>  9 files changed, 333 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu.yaml
>  create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/espresso-pic.yaml
>  create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/gpu7.yaml
>  create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-ahci.yaml
>  create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-dsp.yaml
>  create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-pic.yaml
>  create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte-sdhci.yaml
>  create mode 100644 Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/fsl,spba-bus.example.dtb: spba-bus@30000000: compatible:0: 'nintendo,latte' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.example.dtb: bus@c0000000: compatible:0: 'nintendo,latte' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/arm,integrator-ap-lm.example.dtb: bus@c0000000: compatible: ['simple-bus'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/baikal,bt1-apb.example.dtb: bus@1f059000: compatible:0: 'nintendo,latte' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/baikal,bt1-axi.example.dtb: bus@1f05a000: compatible:0: 'nintendo,latte' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.example.dtb: bus@100000: compatible:0: 'nintendo,latte' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.example.dtb: bus@100000: compatible: ['simple-bus'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.example.dtb: bus@100000: compatible:0: 'nintendo,latte' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.example.dtb: bus@100000: compatible: ['simple-bus'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.example.dtb: bus@28380000: compatible:0: 'nintendo,latte' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.example.dtb: bus@28380000: compatible: ['simple-bus'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/iio/dac/fsl,vf610-dac.example.dtb: bus@40000000: compatible:0: 'nintendo,latte' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/arm/stm32/st,mlahb.example.dtb: ahb@38000000: compatible:0: 'nintendo,latte' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/imx/fsl,aips-bus.example.dtb: bus@30000000: compatible:0: 'nintendo,latte' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/imx/imx8m-soc.example.dtb: soc@0: compatible:0: 'nintendo,latte' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/intel/intel,hps-copy-engine.example.dtb: bus@80000000: compatible:0: 'nintendo,latte' was expected
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/intel/intel,hps-copy-engine.example.dtb: bus@80000000: compatible: ['simple-bus'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/powerpc/nintendo/wiiu/latte.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20221119113041.284419-2-ash@heyquark.com

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command.

