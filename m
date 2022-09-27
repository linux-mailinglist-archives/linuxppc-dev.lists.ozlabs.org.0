Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5681A5EC6AD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 16:40:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McMjF2g4Cz3fHJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 00:40:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.173; helo=mail-oi1-f173.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McMhW6wX3z3fFH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 00:39:23 +1000 (AEST)
Received: by mail-oi1-f173.google.com with SMTP id n83so12051860oif.11
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 07:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=aXapzxkwJjXshh7yZTouvFh3NO4W45oOiG6QOPv9xbg=;
        b=lsDpH4kTMja57PwUsDV35oT//YbgTRRp0I+/W9cGau5Mn03gK5yrwjjmytEVXvOQHo
         BhLA/yx7VMjDi4mkrm3m63tnCimdYqGbI7nEy/kLNAEMn7sgiycx1R3DrZUSZCTil1sK
         A6hEha84f5FUNi4soa2NIUDjMzbPQhSc/sSZa9vEOCnDZEUj00HsrVCTdJH4RM1V8JrG
         gnNFWWw6An7uE2eM529BSwLowgTZVJFJcqY8vvIHPgkTmt6h/D1GzQ8/QRezZsOYpqlm
         FMGnGdN32Tf0T3f9cIxsbjBNxG/pD5DNkaAod8OZ51Dz2/sIOSeYhvpxGgGmdeJ5ZxrM
         dddw==
X-Gm-Message-State: ACrzQf17FH4MIge7sg5EW7/s04+9nv7VHoQ/hKN6VDqe6rBxbTcxgLJy
	KimV32z9tM0T/qwvOMch2A==
X-Google-Smtp-Source: AMsMyM4hNo1lj9rE/jk87Z2GYcC05y3cmAk+GwtgMB/vVsr+Y0jnhpLHuNbLvB+pBZP2SyJ7pntfMg==
X-Received: by 2002:a05:6808:ca:b0:350:2d75:f3ed with SMTP id t10-20020a05680800ca00b003502d75f3edmr1899153oic.175.1664289559695;
        Tue, 27 Sep 2022 07:39:19 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q16-20020a9d6550000000b00636fd78dd57sm763037otl.41.2022.09.27.07.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Sep 2022 07:39:19 -0700 (PDT)
Received: (nullmailer pid 943210 invoked by uid 1000);
	Tue, 27 Sep 2022 14:39:18 -0000
From: Rob Herring <robh@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
In-Reply-To: <20220926190322.2889342-2-sean.anderson@seco.com>
References: <20220926190322.2889342-1-sean.anderson@seco.com> <20220926190322.2889342-2-sean.anderson@seco.com>
Subject: Re: [PATCH net-next v5 1/9] dt-bindings: net: Expand pcs-handle to an array
Date: Tue, 27 Sep 2022 09:39:18 -0500
Message-Id: <1664289558.335769.943209.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, netdev@vger.kernel.org, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "linuxppc-dev @ lists . ozlabs . org" <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 26 Sep 2022 15:03:13 -0400, Sean Anderson wrote:
> This allows multiple phandles to be specified for pcs-handle, such as
> when multiple PCSs are present for a single MAC. To differentiate
> between them, also add a pcs-handle-names property.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> This was previously submitted as [1]. I expect to update this series
> more, so I have moved it here. Changes from that version include:
> - Add maxItems to existing bindings
> - Add a dependency from pcs-names to pcs-handle.
> 
> [1] https://lore.kernel.org/netdev/20220711160519.741990-3-sean.anderson@seco.com/
> 
> (no changes since v4)
> 
> Changes in v4:
> - Use pcs-handle-names instead of pcs-names, as discussed
> 
> Changes in v3:
> - New
> 
>  .../bindings/net/dsa/renesas,rzn1-a5psw.yaml           |  1 +
>  .../devicetree/bindings/net/ethernet-controller.yaml   | 10 +++++++++-
>  .../devicetree/bindings/net/fsl,qoriq-mc-dpmac.yaml    |  2 +-
>  3 files changed, 11 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml: properties:ethernet-ports:patternProperties:^(ethernet-)?port@[0-4]$:properties:pcs-handle:maxItems: False schema does not allow 1
	hint: Scalar properties should not have array keywords
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml: ignoring, error in schema: properties: ethernet-ports: patternProperties: ^(ethernet-)?port@[0-4]$: properties: pcs-handle: maxItems
Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.example.dtb:0:0: /example-0/switch@44050000: failed to match any schema with compatible: ['renesas,r9a06g032-a5psw', 'renesas,rzn1-a5psw']
Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.example.dtb:0:0: /example-0/switch@44050000: failed to match any schema with compatible: ['renesas,r9a06g032-a5psw', 'renesas,rzn1-a5psw']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

