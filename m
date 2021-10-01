Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E90E841EE55
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 15:17:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HLVyc6GL6z3c6R
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 23:17:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.173;
 helo=mail-oi1-f173.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HLVy74b9jz2yPK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 23:17:02 +1000 (AEST)
Received: by mail-oi1-f173.google.com with SMTP id 24so11450583oix.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Oct 2021 06:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=s93FCbEY6wiV8iS/EDoBTCM7Mo8XJASc8RhUVRLOCxo=;
 b=OGgYCik7KreMEqPkqRQ3qTfeeF9sfK/1QMJH/Pu7PqVg34VZJLer7vy4SyYvOxfd/D
 /Be5f0FAoEKNueVc/NT2V/7FL+kC4FxepZCAq2tb8jmgLzk08n71aLmow0JHjqSaBd85
 6If6tEHk68n9spcFzoE54k6yE4KCVCKuOvWtbj6ghIv3dxNW0DGhMWFnZsI32Y0Q/hyr
 /QIYdY+1eDKQRjxV+/5vOEaymY03lSUcj0aqEsNQvZNF0agU8T5vcEsjYi6Y7eKjiGOI
 YMZa1dnm6i3hBJBY/5iYkzSD66FhXQUZ+zlwRK4zvls0D/vw5xb1smgmMtj69TCWdcg7
 DrXw==
X-Gm-Message-State: AOAM533MbV6Hepmi3X5E62kau8vymcxLyOy7Rc8FJZtVqFnwoitat57H
 sPt9u5X871rDyTtUv5xJWR2irBkCqQ==
X-Google-Smtp-Source: ABdhPJxqIZBVEGOYTlvgGELRTch2AV0JHIMbH+6kmz85mv3lykRhU/J6zCE6YTwRePhunB+9Higd6A==
X-Received: by 2002:aca:d686:: with SMTP id n128mr3734516oig.144.1633094219252; 
 Fri, 01 Oct 2021 06:16:59 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c21sm1124500oiy.18.2021.10.01.06.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 06:16:58 -0700 (PDT)
Received: (nullmailer pid 3666441 invoked by uid 1000);
 Fri, 01 Oct 2021 13:16:57 -0000
From: Rob Herring <robh@kernel.org>
To: Li Yang <leoyang.li@nxp.com>
In-Reply-To: <20211001000924.15421-2-leoyang.li@nxp.com>
References: <20211001000924.15421-1-leoyang.li@nxp.com>
 <20211001000924.15421-2-leoyang.li@nxp.com>
Subject: Re: [PATCH 1/5] dt-bindings: memory: fsl: convert ifc binding to yaml
 schema
Date: Fri, 01 Oct 2021 08:16:57 -0500
Message-Id: <1633094217.843390.3666440.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 30 Sep 2021 19:09:20 -0500, Li Yang wrote:
> Convert the txt binding to yaml format and add description.  Drop the
> "simple-bus" compatible string from the example and not allowed by the
> binding any more.  This will help to enforce the correct probe order
> between parent device and child devices, but will require the ifc driver
> to probe the child devices to work properly.
> 
> Signed-off-by: Li Yang <leoyang.li@nxp.com>
> ---
> updates from previous submission:
> - Drop "simple-bus" from binding and only "fsl,ifc" as compatible
> - Fix one identiation problem of "reg"
> - Add type restriction to "little-endian" property
> 
>  .../bindings/memory-controllers/fsl/ifc.txt   |  82 -----------
>  .../bindings/memory-controllers/fsl/ifc.yaml  | 137 ++++++++++++++++++
>  2 files changed, 137 insertions(+), 82 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
>  create mode 100644 Documentation/devicetree/bindings/memory-controllers/fsl/ifc.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/memory-controllers/fsl/ifc.example.dt.yaml:0:0: /example-0/soc/ifc@ffe1e000/flash@1,0: failed to match any schema with compatible: ['fsl,ifc-nand']
Documentation/devicetree/bindings/memory-controllers/fsl/ifc.example.dt.yaml:0:0: /example-0/soc/ifc@ffe1e000/cpld@3,0: failed to match any schema with compatible: ['fsl,p1010rdb-cpld']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1535102

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

