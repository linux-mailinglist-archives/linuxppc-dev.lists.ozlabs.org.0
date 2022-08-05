Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCBB58AC25
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 16:10:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LznYS3YbWz3bl3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Aug 2022 00:10:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.166.170; helo=mail-il1-f170.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LznY117Jhz2xGs
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Aug 2022 00:09:56 +1000 (AEST)
Received: by mail-il1-f170.google.com with SMTP id d4so1423498ilc.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Aug 2022 07:09:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=4wU29egtLMNG+tGI0yk/oLxzbleDgRoflVboG4WD0GM=;
        b=qmB8XskAfKGgfg0p+/5XNJehbHuYfLUIgGTkFgDhsZAU36lMjtaeOeWQ8PqwqpK4va
         5jFDeENUSesw5yj8riS+yju8x2K8csJdWOAgGSiqVgTGJJDgpVv4vsjQOE6V59NB5zjI
         G/UfVaCk6UztJ/hyZBKFx4defrZ1lEa2Rqfoz4AxFtqhKjgTaHC6zXhznoV4oTevIn6f
         bnvtqkOrj6wCGzmPcUCdA/wzdKtrtzGqXG+/AbqGFTR3fTkqAX0B6zslOQ+OMZmPHjlH
         U7wNMH5sb2+esok1nKO6zICPOjcadt2OchbU5pAa3dZ7AfnBxi0bTaQwqt4R8MDU4e+y
         NVGw==
X-Gm-Message-State: ACgBeo0HbFzxhVkOJlw35nCNMt6J+oVYlz/F1k5EwxCa0swKo1hUjrA1
	noSTrd1pG26SxdcJlC0abQ==
X-Google-Smtp-Source: AA6agR5/LQJibOTqVIimFgDhK095NQ+fg7nigus3m4Dfff2GNYlsUbKl8lciS3gMG3znsPQfY2wOsg==
X-Received: by 2002:a05:6e02:1a87:b0:2de:8da2:9ecf with SMTP id k7-20020a056e021a8700b002de8da29ecfmr3104073ilv.263.1659708593198;
        Fri, 05 Aug 2022 07:09:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id s17-20020a92cc11000000b002ddf58d8828sm1687134ilp.19.2022.08.05.07.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 07:09:52 -0700 (PDT)
Received: (nullmailer pid 1802483 invoked by uid 1000);
	Fri, 05 Aug 2022 14:09:50 -0000
From: Rob Herring <robh@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20220804220602.477589-3-sean.anderson@seco.com>
References: <20220804220602.477589-1-sean.anderson@seco.com> <20220804220602.477589-3-sean.anderson@seco.com>
Subject: Re: [PATCH v4 2/8] dt-bindings: phy: Add Lynx 10G phy binding
Date: Fri, 05 Aug 2022 08:09:50 -0600
Message-Id: <1659708590.965354.1802482.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 04 Aug 2022 18:05:56 -0400, Sean Anderson wrote:
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
> ---
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

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/phy/fsl,lynx-10g.example.dts:51.27-28 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:383: Documentation/devicetree/bindings/phy/fsl,lynx-10g.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1404: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

