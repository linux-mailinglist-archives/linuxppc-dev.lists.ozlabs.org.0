Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3959A2AF8D8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 20:18:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWZJj3vH2zDqvD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 06:18:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.196;
 helo=mail-oi1-f196.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWZGn5Kf3zDqtl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 06:16:46 +1100 (AEDT)
Received: by mail-oi1-f196.google.com with SMTP id w145so3406920oie.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 11:16:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AiCDPZgcTf3GX/z2zx/26J8ErQhTL1mnCpMM32GGzw4=;
 b=KQZ33Hkx+UODM2qzNQzPs0zwSV4He2bI5siTQg2K3ZICFTaYUkdCkqWjsl3YoGxXm6
 GhhzPGwKbICfUBRo0hykVmm4Y+ucEVqLtFEn0KyTaqBTqq8UtkKFUw4pRG571d9GaUUh
 VvrNTODQ21Km+aAv0r11GAcol79dd1Q8YmgYtoRPtLz0moiRAMcukoMbT8s51oVKOrfo
 Mv6SYRrofPv+YQJgFaRT8xYJotQUK3RteyKDQd4GtGFvaTiIO1h7ntnupqiivRm3dufU
 A8YSu7J5KeS+cnlCymOcrvjiMYbKXrhRLfXBRiFWYPd4ably0CLk5CPxPHjBBxaTBJap
 Uubg==
X-Gm-Message-State: AOAM530oyjuZn+LAzskp+B8keTP4Qa1ZrCAOfVUEtj+smmycFCqIln9R
 tdepdcC8+hQAjVvr0enHxA==
X-Google-Smtp-Source: ABdhPJwyi016mtmjmTLTqVQpJJDCJFBGadh4UUgCNqobL85eUP5paFNnEC8U07pacXIsSPdIILspgQ==
X-Received: by 2002:aca:72ca:: with SMTP id p193mr3299201oic.9.1605122202551; 
 Wed, 11 Nov 2020 11:16:42 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n81sm588991oif.53.2020.11.11.11.16.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 11:16:41 -0800 (PST)
Received: (nullmailer pid 1857962 invoked by uid 1000);
 Wed, 11 Nov 2020 19:16:40 -0000
Date: Wed, 11 Nov 2020 13:16:40 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v4 01/18] dt-bindings: usb: usb-hcd: Detach generic USB
 controller properties
Message-ID: <20201111191640.GA1857205@bogus>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
 <20201111090853.14112-2-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111090853.14112-2-Sergey.Semin@baikalelectronics.ru>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, linux-mips@vger.kernel.org,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, Manu Gautam <mgautam@codeaurora.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 11 Nov 2020 12:08:36 +0300, Serge Semin wrote:
> There can be three distinctive types of the USB controllers: USB hosts,
> USB peripherals/gadgets and USB OTG, which can switch from one role to
> another. In order to have that hierarchy handled in the DT binding files,
> we need to collect common properties in a common DT schema and specific
> properties in dedicated schemas. Seeing the usb-hcd.yaml DT schema is
> dedicated for the USB host controllers only, let's move some common
> properties from there into the usb.yaml schema. So the later would be
> available to evaluate all currently supported types of the USB
> controllers.
> 
> While at it add an explicit "additionalProperties: true" into the
> usb-hcd.yaml as setting the additionalProperties/unevaluateProperties
> properties is going to be get mandatory soon.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v4:
> - This is a new patch created as a result of the comment left
>   by Chunfeng Yun in v3
> ---
>  .../devicetree/bindings/usb/usb-hcd.yaml      | 14 ++-------
>  .../devicetree/bindings/usb/usb.yaml          | 29 +++++++++++++++++++
>  2 files changed, 32 insertions(+), 11 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/usb.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/usb/usb-hcd.yaml:17:1: [error] duplication of key "additionalProperties" in mapping (key-duplicates)

dtschema/dtc warnings/errors:
Traceback (most recent call last):
  File "/usr/local/bin/dt-extract-example", line 45, in <module>
    binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
    return constructor.get_single_data()
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 113, in get_single_data
    return self.construct_document(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 123, in construct_document
    for _dummy in generator:
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 723, in construct_yaml_map
    value = self.construct_mapping(node)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 440, in construct_mapping
    return BaseConstructor.construct_mapping(self, node, deep=deep)
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 257, in construct_mapping
    if self.check_mapping_key(node, key_node, mapping, key, value):
  File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 295, in check_mapping_key
    raise DuplicateKeyError(*args)
ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 4, column 1
found duplicate key "additionalProperties" with value "True" (original value: "True")
  in "<unicode string>", line 17, column 1

To suppress this check see:
    http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys

Duplicate keys will become an error in future releases, and are errors
by default when using the new API.

make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/usb/usb-hcd.example.dts] Error 1
make[1]: *** Deleting file 'Documentation/devicetree/bindings/usb/usb-hcd.example.dts'
make[1]: *** Waiting for unfinished jobs....
make[1]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 123
make: *** [Makefile:1364: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1398034

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

