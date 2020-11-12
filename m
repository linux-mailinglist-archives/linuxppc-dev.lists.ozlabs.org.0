Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2562B02BF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 11:31:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWyZX3vYgzDqsy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 21:31:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baikalelectronics.ru (client-ip=94.125.187.42;
 helo=mail.baikalelectronics.ru;
 envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=baikalelectronics.ru
Received: from mail.baikalelectronics.ru (unknown [94.125.187.42])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CWyXZ0mKkzDqsZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 21:30:00 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 4FE2E803017D;
 Thu, 12 Nov 2020 10:29:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iBiqa6pqHcYW; Thu, 12 Nov 2020 13:29:50 +0300 (MSK)
Date: Thu, 12 Nov 2020 13:29:46 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 10/18] dt-bindings: usb: Convert DWC USB3 bindings to
 DT schema
Message-ID: <20201112102946.ipcsiidty4ut4kap@mobilestation>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
 <20201111090853.14112-11-Sergey.Semin@baikalelectronics.ru>
 <20201111201423.GA1938179@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201111201423.GA1938179@bogus>
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

On Wed, Nov 11, 2020 at 02:14:23PM -0600, Rob Herring wrote:
> On Wed, Nov 11, 2020 at 12:08:45PM +0300, Serge Semin wrote:
> > DWC USB3 DT node is supposed to be compliant with the Generic xHCI
> > Controller schema, but with additional vendor-specific properties, the
> > controller-specific reference clocks and PHYs. So let's convert the
> > currently available legacy text-based DWC USB3 bindings to the DT schema
> > and make sure the DWC USB3 nodes are also validated against the
> > usb-xhci.yaml schema.
> > 
> > Note we have to discard the nodename restriction of being prefixed with
> > "dwc3@" string, since in accordance with the usb-hcd.yaml schema USB nodes
> > are supposed to be named as "^usb(@.*)".
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > ---
> > 
> > Changelog v2:
> > - Discard '|' from the descriptions, since we don't need to preserve
> >   the text formatting in any of them.
> > - Drop quotes from around the string constants.
> > - Fix the "clock-names" prop description to be referring the enumerated
> >   clock-names instead of the ones from the Databook.
> > 
> > Changelog v3:
> > - Apply usb-xhci.yaml# schema only if the controller is supposed to work
> >   as either host or otg.
> > 
> > Changelog v4:
> > - Apply usb-drd.yaml schema first. If the controller is configured
> >   to work in a gadget mode only, then apply the usb.yaml schema too,
> >   otherwise apply the usb-xhci.yaml schema.
> > - Discard the Rob'es Reviewed-by tag. Please review the patch one more
> >   time.
> > ---
> >  .../devicetree/bindings/usb/dwc3.txt          | 125 --------
> >  .../devicetree/bindings/usb/snps,dwc3.yaml    | 303 ++++++++++++++++++
> >  2 files changed, 303 insertions(+), 125 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
> >  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> > deleted file mode 100644
> > index d03edf9d3935..000000000000
> > --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> > +++ /dev/null
> > @@ -1,125 +0,0 @@
> > -synopsys DWC3 CORE
> > -
> > -DWC3- USB3 CONTROLLER. Complies to the generic USB binding properties
> > -      as described in 'usb/generic.txt'
> > -
> > -Required properties:
> > - - compatible: must be "snps,dwc3"
> > - - reg : Address and length of the register set for the device
> > - - interrupts: Interrupts used by the dwc3 controller.
> > - - clock-names: list of clock names. Ideally should be "ref",
> > -                "bus_early", "suspend" but may be less or more.
> > - - clocks: list of phandle and clock specifier pairs corresponding to
> > -           entries in the clock-names property.
> > -
> > -Exception for clocks:
> > -  clocks are optional if the parent node (i.e. glue-layer) is compatible to
> > -  one of the following:
> > -    "cavium,octeon-7130-usb-uctl"
> > -    "qcom,dwc3"
> > -    "samsung,exynos5250-dwusb3"
> > -    "samsung,exynos5433-dwusb3"
> > -    "samsung,exynos7-dwusb3"
> > -    "sprd,sc9860-dwc3"
> > -    "st,stih407-dwc3"
> > -    "ti,am437x-dwc3"
> > -    "ti,dwc3"
> > -    "ti,keystone-dwc3"
> > -    "rockchip,rk3399-dwc3"
> > -    "xlnx,zynqmp-dwc3"
> > -
> > -Optional properties:
> > - - usb-phy : array of phandle for the PHY device.  The first element
> > -   in the array is expected to be a handle to the USB2/HS PHY and
> > -   the second element is expected to be a handle to the USB3/SS PHY
> > - - phys: from the *Generic PHY* bindings
> > - - phy-names: from the *Generic PHY* bindings; supported names are "usb2-phy"
> > -	or "usb3-phy".
> > - - resets: set of phandle and reset specifier pairs
> > - - snps,usb2-lpm-disable: indicate if we don't want to enable USB2 HW LPM
> > - - snps,usb3_lpm_capable: determines if platform is USB3 LPM capable
> > - - snps,dis-start-transfer-quirk: when set, disable isoc START TRANSFER command
> > -			failure SW work-around for DWC_usb31 version 1.70a-ea06
> > -			and prior.
> > - - snps,disable_scramble_quirk: true when SW should disable data scrambling.
> > -	Only really useful for FPGA builds.
> > - - snps,has-lpm-erratum: true when DWC3 was configured with LPM Erratum enabled
> > - - snps,lpm-nyet-threshold: LPM NYET threshold
> > - - snps,u2exit_lfps_quirk: set if we want to enable u2exit lfps quirk
> > - - snps,u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
> > - - snps,req_p1p2p3_quirk: when set, the core will always request for
> > -			P1/P2/P3 transition sequence.
> > - - snps,del_p1p2p3_quirk: when set core will delay P1/P2/P3 until a certain
> > -			amount of 8B10B errors occur.
> > - - snps,del_phy_power_chg_quirk: when set core will delay PHY power change
> > -			from P0 to P1/P2/P3.
> > - - snps,lfps_filter_quirk: when set core will filter LFPS reception.
> > - - snps,rx_detect_poll_quirk: when set core will disable a 400us delay to start
> > -			Polling LFPS after RX.Detect.
> > - - snps,tx_de_emphasis_quirk: when set core will set Tx de-emphasis value.
> > - - snps,tx_de_emphasis: the value driven to the PHY is controlled by the
> > -			LTSSM during USB3 Compliance mode.
> > - - snps,dis_u3_susphy_quirk: when set core will disable USB3 suspend phy.
> > - - snps,dis_u2_susphy_quirk: when set core will disable USB2 suspend phy.
> > - - snps,dis_enblslpm_quirk: when set clears the enblslpm in GUSB2PHYCFG,
> > -			disabling the suspend signal to the PHY.
> > - - snps,dis-u1-entry-quirk: set if link entering into U1 needs to be disabled.
> > - - snps,dis-u2-entry-quirk: set if link entering into U2 needs to be disabled.
> > - - snps,dis_rxdet_inp3_quirk: when set core will disable receiver detection
> > -			in PHY P3 power state.
> > - - snps,dis-u2-freeclk-exists-quirk: when set, clear the u2_freeclk_exists
> > -			in GUSB2PHYCFG, specify that USB2 PHY doesn't provide
> > -			a free-running PHY clock.
> > - - snps,dis-del-phy-power-chg-quirk: when set core will change PHY power
> > -			from P0 to P1/P2/P3 without delay.
> > - - snps,dis-tx-ipgap-linecheck-quirk: when set, disable u2mac linestate check
> > -			during HS transmit.
> > - - snps,parkmode-disable-ss-quirk: when set, all SuperSpeed bus instances in
> > -			park mode are disabled.
> > - - snps,dis_metastability_quirk: when set, disable metastability workaround.
> > -			CAUTION: use only if you are absolutely sure of it.
> > - - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
> > -			utmi_l1_suspend_n, false when asserts utmi_sleep_n
> > - - snps,hird-threshold: HIRD threshold
> > - - snps,hsphy_interface: High-Speed PHY interface selection between "utmi" for
> > -   UTMI+ and "ulpi" for ULPI when the DWC_USB3_HSPHY_INTERFACE has value 3.
> > - - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
> > -	register for post-silicon frame length adjustment when the
> > -	fladj_30mhz_sdbnd signal is invalid or incorrect.
> > - - snps,rx-thr-num-pkt-prd: periodic ESS RX packet threshold count - host mode
> > -			only. Set this and rx-max-burst-prd to a valid,
> > -			non-zero value 1-16 (DWC_usb31 programming guide
> > -			section 1.2.4) to enable periodic ESS RX threshold.
> > - - snps,rx-max-burst-prd: max periodic ESS RX burst size - host mode only. Set
> > -			this and rx-thr-num-pkt-prd to a valid, non-zero value
> > -			1-16 (DWC_usb31 programming guide section 1.2.4) to
> > -			enable periodic ESS RX threshold.
> > - - snps,tx-thr-num-pkt-prd: periodic ESS TX packet threshold count - host mode
> > -			only. Set this and tx-max-burst-prd to a valid,
> > -			non-zero value 1-16 (DWC_usb31 programming guide
> > -			section 1.2.3) to enable periodic ESS TX threshold.
> > - - snps,tx-max-burst-prd: max periodic ESS TX burst size - host mode only. Set
> > -			this and tx-thr-num-pkt-prd to a valid, non-zero value
> > -			1-16 (DWC_usb31 programming guide section 1.2.3) to
> > -			enable periodic ESS TX threshold.
> > -
> > - - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
> > - - snps,incr-burst-type-adjustment: Value for INCR burst type of GSBUSCFG0
> > -			register, undefined length INCR burst type enable and INCRx type.
> > -			When just one value, which means INCRX burst mode enabled. When
> > -			more than one value, which means undefined length INCR burst type
> > -			enabled. The values can be 1, 4, 8, 16, 32, 64, 128 and 256.
> > -
> > - - in addition all properties from usb-xhci.txt from the current directory are
> > -   supported as well
> > -
> > -
> > -This is usually a subnode to DWC3 glue to which it is connected.
> > -
> > -dwc3@4a030000 {
> > -	compatible = "snps,dwc3";
> > -	reg = <0x4a030000 0xcfff>;
> > -	interrupts = <0 92 4>
> > -	usb-phy = <&usb2_phy>, <&usb3,phy>;
> > -	snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
> > -};
> > diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > new file mode 100644
> > index 000000000000..079617891da6
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > @@ -0,0 +1,303 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Synopsys DesignWare USB3 Controller
> > +
> > +maintainers:
> > +  - Felipe Balbi <balbi@kernel.org>
> > +
> > +description:
> > +  This is usually a subnode to DWC3 glue to which it is connected, but can also
> > +  be presented as a standalone DT node with an optional vendor-specific
> > +  compatible string.
> > +

> > +allOf:
> > +  - $ref: usb-drd.yaml#
> > +  - if:
> > +      properties:
> > +        dr_mode:
> > +          const: peripheral
> > +    then:
> > +      $ref: usb.yaml#
> 
> This part could be done in usb-drd.yaml?

Originally I was thinking about that, but then in order to minimize
the properties validation I've decided to split the properties in
accordance with the USB controllers functionality:

            +----- USB Gadget/Peripheral Controller. There is no
            |      specific schema for the gadgets since there is no
            |      common gadget properties (at least I failed to find
            |      ones). So the pure gadget controllers need to be
            |      validated just against usb.yaml schema.
            |
usb.yaml <--+-- usb-hcd.yaml - Generic USB Host Controller. The schema
                ^              turns out to include the OHCI/UHCI/EHCI
                |              properties, which AFAICS are also
                |              applicable for the other host controllers.
                |              So any USB host controller node needs to
                |              be validated against this schema.
                |
                +- usb-xhci.yaml - Generic xHCI Host controller.

usb-drd.yaml -- USB Dual-Role/OTG Controllers. It describes the
                DRD/OTG-specific properties and nothing else. So normally
                it should be applied together with one of the
                schemas described above.

So the use-cases of the suggested schemas is following:

1) USB Controller is pure gadget? Then:
   + allOf:
   +  - $ref: usb.yaml#
2) USB Controller is pure USB host (including OHCI/UHCI/EHCI)?
   + allOf:
   +   - $ref: usb-hcd.yaml#
   Note this prevents us from fixing all the currently available USB DT
   schemas, which already apply the usb-hcd.yaml schema.
3) USB Controller is pure xHCI host controller? Then:
   + allOf:
   +   - $ref: usb-xhci.yaml#
4) USB Controller is Dual-Role/OTG controller with USB 2.0 host? Then:
   + allOf:
   +   - $ref: usb-drd.yaml#
   +   - $ref: usb-hcd.yaml#
5) USB Controller is Dual-Role/OTG controller with xHCI host? Then:
   + allOf:
   +   - $ref: usb-drd.yaml#
   +   - $ref: usb-xhci.yaml#
6) USB Controller is Dual-Role/OTG controller which can only be a
   gadget? Then:
   + allOf:
   +   - $ref: usb-drd.yaml#
   +   - $ref: usb.yaml#

* Don't know really if controllers like in 6)-th really exist. Most
* likely they are still internally capable of dual-roling, but due to
* some conditions can be used as gadgets only.

It looks a bit complicated, but at least by having such design we'd minimize
the number of properties validation.

Alternatively we could implement a hierarchy like this (as you, Rob,
suggested in the comment above): 

            +-- USB Gadget/Peripheral Controller
            |
            +-- usb-drd.yaml - USB Dual-Role/OTG Controllers
            |   
usb.yaml <--+-- usb-dcd.yaml - Generic USB Host Controller
                ^
                |
                +- usb-xhci.yaml - Generic xHCI Host controller

But, for instance, if we got to have an OTG controller with USB 2.0
host capability, the schema would have needed to be validated as
described in 4) in the list above. That would have caused the usb.yaml
schema validation twice.

Of course I could have missed or misunderstood something. So any
suggestion, any help with making things easier would be very
appreciated. I asked Greg what he was thinking in this matter in
the previous patchset thread, but he didn't respond.

> 
> > +    else:
> > +      $ref: usb-xhci.yaml#
> 
> I'd really prefer if all the schema can just be applied unconditionally. 
> Shouldn't someone (like a bootloader) be able to change dr_mode without 
> changing anything else to set the mode? That would imply all the 
> schemas can be applied.

Theoretically it's possible, but I don't really know whether it can be
practically met. Of course I fully agree with you and it's preferable to
simplify the schema by getting rid of the condition if it's possible.

My point of using the conditional schema here has been based
on the driver implementation. According to the driver code if OTG mode is
enabled by means of the dr_mode property, then the controller can work as
either host or gadget. If either host or gadget mode is enabled in
the dr_mode property, the mode updating won't be supported. So any
properties specific to the unsupported mode will be just ignored.

In addition to that DWC USB3 IP-core can be synthesized with different
DWC_USB3_MODE parameter value. The controller can be either device
(gadget), or host, or DRD, or HUB. In that case the dr_mode should be
set in accordance with that parameter value. It means that the
DWC USB3 controller will support the features in accordance with the
selected parameter.

Should we really bother with all of that? Could we just apply the
schema like: allOf: [$ref: usb-drd.yaml#, $ref: usb-hcd.yaml#] and
have the things much easier seeing the host-specific properties aren't
required anyway? That's the main question. I've decided to bother,
since it give us a better hardware description. If you think it's better
to keep things easier, I'll be ok with this. It won't be that
contradicting to the hardware capabilities after all.

-Sergey

> 
> Rob
