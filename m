Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 162E62C3B39
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 09:40:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgvTv3XtYzDqmX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Nov 2020 19:40:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baikalelectronics.ru (client-ip=87.245.175.226;
 helo=mail.baikalelectronics.ru;
 envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=baikalelectronics.ru
X-Greylist: delayed 393 seconds by postgrey-1.36 at bilbo;
 Wed, 25 Nov 2020 19:38:46 AEDT
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CgvS664wqzDqjY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Nov 2020 19:38:46 +1100 (AEDT)
Date: Wed, 25 Nov 2020 11:32:02 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 10/18] dt-bindings: usb: Convert DWC USB3 bindings to
 DT schema
Message-ID: <20201125083202.ytoyd62bg3s7kvvg@mobilestation>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
 <20201111090853.14112-11-Sergey.Semin@baikalelectronics.ru>
 <20201111201423.GA1938179@bogus>
 <20201112102946.ipcsiidty4ut4kap@mobilestation>
 <20201121124228.GA2039998@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201121124228.GA2039998@robh.at.kernel.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Manu Gautam <mgautam@codeaurora.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 21, 2020 at 06:42:28AM -0600, Rob Herring wrote:
> On Thu, Nov 12, 2020 at 01:29:46PM +0300, Serge Semin wrote:
> > On Wed, Nov 11, 2020 at 02:14:23PM -0600, Rob Herring wrote:
> > > On Wed, Nov 11, 2020 at 12:08:45PM +0300, Serge Semin wrote:
> > > > DWC USB3 DT node is supposed to be compliant with the Generic xHCI
> > > > Controller schema, but with additional vendor-specific properties, the
> > > > controller-specific reference clocks and PHYs. So let's convert the
> > > > currently available legacy text-based DWC USB3 bindings to the DT schema
> > > > and make sure the DWC USB3 nodes are also validated against the
> > > > usb-xhci.yaml schema.
> > > > 
> > > > Note we have to discard the nodename restriction of being prefixed with
> > > > "dwc3@" string, since in accordance with the usb-hcd.yaml schema USB nodes
> > > > are supposed to be named as "^usb(@.*)".
> > > > 
> > > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > > 
> > > > ---
> > > > 
> > > > Changelog v2:
> > > > - Discard '|' from the descriptions, since we don't need to preserve
> > > >   the text formatting in any of them.
> > > > - Drop quotes from around the string constants.
> > > > - Fix the "clock-names" prop description to be referring the enumerated
> > > >   clock-names instead of the ones from the Databook.
> > > > 
> > > > Changelog v3:
> > > > - Apply usb-xhci.yaml# schema only if the controller is supposed to work
> > > >   as either host or otg.
> > > > 
> > > > Changelog v4:
> > > > - Apply usb-drd.yaml schema first. If the controller is configured
> > > >   to work in a gadget mode only, then apply the usb.yaml schema too,
> > > >   otherwise apply the usb-xhci.yaml schema.
> > > > - Discard the Rob'es Reviewed-by tag. Please review the patch one more
> > > >   time.
> > > > ---
> > > >  .../devicetree/bindings/usb/dwc3.txt          | 125 --------
> > > >  .../devicetree/bindings/usb/snps,dwc3.yaml    | 303 ++++++++++++++++++
> > > >  2 files changed, 303 insertions(+), 125 deletions(-)
> > > >  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
> > > >  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> 
> 
> > > > diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > > > new file mode 100644
> > > > index 000000000000..079617891da6
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > > > @@ -0,0 +1,303 @@
> > > > +# SPDX-License-Identifier: GPL-2.0
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Synopsys DesignWare USB3 Controller
> > > > +
> > > > +maintainers:
> > > > +  - Felipe Balbi <balbi@kernel.org>
> > > > +
> > > > +description:
> > > > +  This is usually a subnode to DWC3 glue to which it is connected, but can also
> > > > +  be presented as a standalone DT node with an optional vendor-specific
> > > > +  compatible string.
> > > > +
> > 
> > > > +allOf:
> > > > +  - $ref: usb-drd.yaml#
> > > > +  - if:
> > > > +      properties:
> > > > +        dr_mode:
> > > > +          const: peripheral
> 

> Another thing, this evaluates to true if dr_mode is not present. You 
> need to add 'required'?

Right. Will something like this do that?

+ allOf:
+  - $ref: usb-drd.yaml#
+  - if:
+      properties:
+        dr_mode:
+          const: peripheral
+ 
+      required:
+        - dr_mode
+    then:
+      $ref: usb.yaml#
+    else
+      $ref: usb-xhci.yaml#

> If dr_mode is otg, then don't you need to apply 
> both usb.yaml and usb-xhci.yaml?

No I don't. Since there is no peripheral-specific DT schema, then the
only schema any USB-gadget node needs to pass is usb.yaml, which
is already included into the usb-xhci.yaml schema. So for pure OTG devices
with xHCI host and gadget capabilities it's enough to evaluate: allOf:
[$ref: usb-drd.yaml#, $ref: usb-xhci.yaml#].  Please see the
sketch/ASCII-figure below and the following text for details.

-Sergey

> 
> > > > +    then:
> > > > +      $ref: usb.yaml#
> > > 
> > > This part could be done in usb-drd.yaml?
> > 
> > Originally I was thinking about that, but then in order to minimize
> > the properties validation I've decided to split the properties in
> > accordance with the USB controllers functionality:
> > 
> >             +----- USB Gadget/Peripheral Controller. There is no
> >             |      specific schema for the gadgets since there is no
> >             |      common gadget properties (at least I failed to find
> >             |      ones). So the pure gadget controllers need to be
> >             |      validated just against usb.yaml schema.
> >             |
> > usb.yaml <--+-- usb-hcd.yaml - Generic USB Host Controller. The schema
> >                 ^              turns out to include the OHCI/UHCI/EHCI
> >                 |              properties, which AFAICS are also
> >                 |              applicable for the other host controllers.
> >                 |              So any USB host controller node needs to
> >                 |              be validated against this schema.
> >                 |
> >                 +- usb-xhci.yaml - Generic xHCI Host controller.
> > 
> > usb-drd.yaml -- USB Dual-Role/OTG Controllers. It describes the
> >                 DRD/OTG-specific properties and nothing else. So normally
> >                 it should be applied together with one of the
> >                 schemas described above.
> > 
> > So the use-cases of the suggested schemas is following:
> > 
> > 1) USB Controller is pure gadget? Then:
> >    + allOf:
> >    +  - $ref: usb.yaml#
> > 2) USB Controller is pure USB host (including OHCI/UHCI/EHCI)?
> >    + allOf:
> >    +   - $ref: usb-hcd.yaml#
> >    Note this prevents us from fixing all the currently available USB DT
> >    schemas, which already apply the usb-hcd.yaml schema.
> > 3) USB Controller is pure xHCI host controller? Then:
> >    + allOf:
> >    +   - $ref: usb-xhci.yaml#
> > 4) USB Controller is Dual-Role/OTG controller with USB 2.0 host? Then:
> >    + allOf:
> >    +   - $ref: usb-drd.yaml#
> >    +   - $ref: usb-hcd.yaml#
> > 5) USB Controller is Dual-Role/OTG controller with xHCI host? Then:
> >    + allOf:
> >    +   - $ref: usb-drd.yaml#
> >    +   - $ref: usb-xhci.yaml#
> > 6) USB Controller is Dual-Role/OTG controller which can only be a
> >    gadget? Then:
> >    + allOf:
> >    +   - $ref: usb-drd.yaml#
> >    +   - $ref: usb.yaml#
> > 
> > * Don't know really if controllers like in 6)-th really exist. Most
> > * likely they are still internally capable of dual-roling, but due to
> > * some conditions can be used as gadgets only.
> > 
> > It looks a bit complicated, but at least by having such design we'd minimize
> > the number of properties validation.
> > 

[...]
