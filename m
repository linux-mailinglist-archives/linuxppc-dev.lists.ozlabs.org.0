Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EFA02AF91A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 20:32:17 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWZcY5LHMzDqwl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 06:32:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baikalelectronics.ru (client-ip=94.125.187.42;
 helo=mail.baikalelectronics.ru;
 envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=baikalelectronics.ru
Received: from mail.baikalelectronics.ru (unknown [94.125.187.42])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CWZZp3YcdzDqtt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 06:30:39 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id C53D3803071C;
 Wed, 11 Nov 2020 19:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JBorFac4oRnu; Wed, 11 Nov 2020 22:30:32 +0300 (MSK)
Date: Wed, 11 Nov 2020 22:30:29 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 01/18] dt-bindings: usb: usb-hcd: Detach generic USB
 controller properties
Message-ID: <20201111193029.ao6kdwrhpsdxb7il@mobilestation>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
 <20201111090853.14112-2-Sergey.Semin@baikalelectronics.ru>
 <20201111191640.GA1857205@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201111191640.GA1857205@bogus>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
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

On Wed, Nov 11, 2020 at 01:16:40PM -0600, Rob Herring wrote:
> On Wed, 11 Nov 2020 12:08:36 +0300, Serge Semin wrote:
> > There can be three distinctive types of the USB controllers: USB hosts,
> > USB peripherals/gadgets and USB OTG, which can switch from one role to
> > another. In order to have that hierarchy handled in the DT binding files,
> > we need to collect common properties in a common DT schema and specific
> > properties in dedicated schemas. Seeing the usb-hcd.yaml DT schema is
> > dedicated for the USB host controllers only, let's move some common
> > properties from there into the usb.yaml schema. So the later would be
> > available to evaluate all currently supported types of the USB
> > controllers.
> > 
> > While at it add an explicit "additionalProperties: true" into the
> > usb-hcd.yaml as setting the additionalProperties/unevaluateProperties
> > properties is going to be get mandatory soon.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > ---
> > 
> > Changelog v4:
> > - This is a new patch created as a result of the comment left
> >   by Chunfeng Yun in v3
> > ---
> >  .../devicetree/bindings/usb/usb-hcd.yaml      | 14 ++-------
> >  .../devicetree/bindings/usb/usb.yaml          | 29 +++++++++++++++++++
> >  2 files changed, 32 insertions(+), 11 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/usb/usb.yaml
> > 
> 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 

> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/usb/usb-hcd.yaml:17:1: [error] duplication of key "additionalProperties" in mapping (key-duplicates)

Oh my. Don't know how this has slipped in. It's even more weird given
that I've performed dt_binding_check before sending the patches out.
Anyway I'll fix the duplication in v5. Please proceed with the series
review.

-Sergey

> 
> dtschema/dtc warnings/errors:
> Traceback (most recent call last):
>   File "/usr/local/bin/dt-extract-example", line 45, in <module>
>     binding = yaml.load(open(args.yamlfile, encoding='utf-8').read())
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/main.py", line 343, in load
>     return constructor.get_single_data()
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 113, in get_single_data
>     return self.construct_document(node)
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 123, in construct_document
>     for _dummy in generator:
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 723, in construct_yaml_map
>     value = self.construct_mapping(node)
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 440, in construct_mapping
>     return BaseConstructor.construct_mapping(self, node, deep=deep)
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 257, in construct_mapping
>     if self.check_mapping_key(node, key_node, mapping, key, value):
>   File "/usr/local/lib/python3.8/dist-packages/ruamel/yaml/constructor.py", line 295, in check_mapping_key
>     raise DuplicateKeyError(*args)
> ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
>   in "<unicode string>", line 4, column 1
> found duplicate key "additionalProperties" with value "True" (original value: "True")
>   in "<unicode string>", line 17, column 1
> 
> To suppress this check see:
>     http://yaml.readthedocs.io/en/latest/api.html#duplicate-keys
> 
> Duplicate keys will become an error in future releases, and are errors
> by default when using the new API.
> 
> make[1]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/usb/usb-hcd.example.dts] Error 1
> make[1]: *** Deleting file 'Documentation/devicetree/bindings/usb/usb-hcd.example.dts'
> make[1]: *** Waiting for unfinished jobs....
> make[1]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 123
> make: *** [Makefile:1364: dt_binding_check] Error 2
> 
> 
> See https://patchwork.ozlabs.org/patch/1398034
> 
> The base for the patch is generally the last rc1. Any dependencies
> should be noted.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit.
> 
