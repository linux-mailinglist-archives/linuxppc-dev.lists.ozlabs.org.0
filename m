Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C64DC2AF9A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 21:16:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWbbS0Jq6zDqvV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 07:16:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWbYM4KL9zDqGB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 07:14:30 +1100 (AEDT)
Received: by mail-ot1-f68.google.com with SMTP id y22so3335521oti.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 12:14:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RW7iciLpTFVtUIjk/YYI/BRkMGKbkwUgND+NEWuybYQ=;
 b=mVNXmptcWyJebYnQDq+DU0+HfNWc07H2dz7k3+aBF/q2SueYOC30nKaLrqTajhpZbc
 UslmXnekIXX0K1SSj3J2Q6U+AKaUadrXQHrbBdvkNbWFZgVXRcvigpbp3fBbwPX0OCZN
 NXGY2Dfj1lBSh6nYsqNqh5Mv1pBcxt9NyivAUmYjxGFG/4RUeI5qYO+lm9VQVRTI+Apb
 vMHQVlTwHNi5ufbAODcf3YmXsNtjJ6r7PXy6qaIFNA7mcaA/UNhrcFCiqyOf4AzDZaUN
 MhcrPwubxeo1PdXJf/il61KIS6m5adso3yF6LVZWhubYZGgnCSVfvnzJUyDr1+NDSzT1
 JcWQ==
X-Gm-Message-State: AOAM532C6gxXolC6xYxZl47/f3HfKMVtlOsIu4eGEWkJgLDA2Zn8v/0D
 qQCf8zQ2fkMh/PBWp+r2gA==
X-Google-Smtp-Source: ABdhPJzci4qX/Kp+zw12l4IqzSqkdA3v9PxKQpWr5j7ZQm/YhmO2gvRjdUkaFlALdWlraxApWhlEqg==
X-Received: by 2002:a9d:2255:: with SMTP id o79mr17718495ota.174.1605125666944; 
 Wed, 11 Nov 2020 12:14:26 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id j6sm721443ots.32.2020.11.11.12.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 12:14:25 -0800 (PST)
Received: (nullmailer pid 1950724 invoked by uid 1000);
 Wed, 11 Nov 2020 20:14:23 -0000
Date: Wed, 11 Nov 2020 14:14:23 -0600
From: Rob Herring <robh@kernel.org>
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Subject: Re: [PATCH v4 10/18] dt-bindings: usb: Convert DWC USB3 bindings to
 DT schema
Message-ID: <20201111201423.GA1938179@bogus>
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
 <20201111090853.14112-11-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201111090853.14112-11-Sergey.Semin@baikalelectronics.ru>
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

On Wed, Nov 11, 2020 at 12:08:45PM +0300, Serge Semin wrote:
> DWC USB3 DT node is supposed to be compliant with the Generic xHCI
> Controller schema, but with additional vendor-specific properties, the
> controller-specific reference clocks and PHYs. So let's convert the
> currently available legacy text-based DWC USB3 bindings to the DT schema
> and make sure the DWC USB3 nodes are also validated against the
> usb-xhci.yaml schema.
> 
> Note we have to discard the nodename restriction of being prefixed with
> "dwc3@" string, since in accordance with the usb-hcd.yaml schema USB nodes
> are supposed to be named as "^usb(@.*)".
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> 
> ---
> 
> Changelog v2:
> - Discard '|' from the descriptions, since we don't need to preserve
>   the text formatting in any of them.
> - Drop quotes from around the string constants.
> - Fix the "clock-names" prop description to be referring the enumerated
>   clock-names instead of the ones from the Databook.
> 
> Changelog v3:
> - Apply usb-xhci.yaml# schema only if the controller is supposed to work
>   as either host or otg.
> 
> Changelog v4:
> - Apply usb-drd.yaml schema first. If the controller is configured
>   to work in a gadget mode only, then apply the usb.yaml schema too,
>   otherwise apply the usb-xhci.yaml schema.
> - Discard the Rob'es Reviewed-by tag. Please review the patch one more
>   time.
> ---
>  .../devicetree/bindings/usb/dwc3.txt          | 125 --------
>  .../devicetree/bindings/usb/snps,dwc3.yaml    | 303 ++++++++++++++++++
>  2 files changed, 303 insertions(+), 125 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
>  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc3.txt b/Documentation/devicetree/bindings/usb/dwc3.txt
> deleted file mode 100644
> index d03edf9d3935..000000000000
> --- a/Documentation/devicetree/bindings/usb/dwc3.txt
> +++ /dev/null
> @@ -1,125 +0,0 @@
> -synopsys DWC3 CORE
> -
> -DWC3- USB3 CONTROLLER. Complies to the generic USB binding properties
> -      as described in 'usb/generic.txt'
> -
> -Required properties:
> - - compatible: must be "snps,dwc3"
> - - reg : Address and length of the register set for the device
> - - interrupts: Interrupts used by the dwc3 controller.
> - - clock-names: list of clock names. Ideally should be "ref",
> -                "bus_early", "suspend" but may be less or more.
> - - clocks: list of phandle and clock specifier pairs corresponding to
> -           entries in the clock-names property.
> -
> -Exception for clocks:
> -  clocks are optional if the parent node (i.e. glue-layer) is compatible to
> -  one of the following:
> -    "cavium,octeon-7130-usb-uctl"
> -    "qcom,dwc3"
> -    "samsung,exynos5250-dwusb3"
> -    "samsung,exynos5433-dwusb3"
> -    "samsung,exynos7-dwusb3"
> -    "sprd,sc9860-dwc3"
> -    "st,stih407-dwc3"
> -    "ti,am437x-dwc3"
> -    "ti,dwc3"
> -    "ti,keystone-dwc3"
> -    "rockchip,rk3399-dwc3"
> -    "xlnx,zynqmp-dwc3"
> -
> -Optional properties:
> - - usb-phy : array of phandle for the PHY device.  The first element
> -   in the array is expected to be a handle to the USB2/HS PHY and
> -   the second element is expected to be a handle to the USB3/SS PHY
> - - phys: from the *Generic PHY* bindings
> - - phy-names: from the *Generic PHY* bindings; supported names are "usb2-phy"
> -	or "usb3-phy".
> - - resets: set of phandle and reset specifier pairs
> - - snps,usb2-lpm-disable: indicate if we don't want to enable USB2 HW LPM
> - - snps,usb3_lpm_capable: determines if platform is USB3 LPM capable
> - - snps,dis-start-transfer-quirk: when set, disable isoc START TRANSFER command
> -			failure SW work-around for DWC_usb31 version 1.70a-ea06
> -			and prior.
> - - snps,disable_scramble_quirk: true when SW should disable data scrambling.
> -	Only really useful for FPGA builds.
> - - snps,has-lpm-erratum: true when DWC3 was configured with LPM Erratum enabled
> - - snps,lpm-nyet-threshold: LPM NYET threshold
> - - snps,u2exit_lfps_quirk: set if we want to enable u2exit lfps quirk
> - - snps,u2ss_inp3_quirk: set if we enable P3 OK for U2/SS Inactive quirk
> - - snps,req_p1p2p3_quirk: when set, the core will always request for
> -			P1/P2/P3 transition sequence.
> - - snps,del_p1p2p3_quirk: when set core will delay P1/P2/P3 until a certain
> -			amount of 8B10B errors occur.
> - - snps,del_phy_power_chg_quirk: when set core will delay PHY power change
> -			from P0 to P1/P2/P3.
> - - snps,lfps_filter_quirk: when set core will filter LFPS reception.
> - - snps,rx_detect_poll_quirk: when set core will disable a 400us delay to start
> -			Polling LFPS after RX.Detect.
> - - snps,tx_de_emphasis_quirk: when set core will set Tx de-emphasis value.
> - - snps,tx_de_emphasis: the value driven to the PHY is controlled by the
> -			LTSSM during USB3 Compliance mode.
> - - snps,dis_u3_susphy_quirk: when set core will disable USB3 suspend phy.
> - - snps,dis_u2_susphy_quirk: when set core will disable USB2 suspend phy.
> - - snps,dis_enblslpm_quirk: when set clears the enblslpm in GUSB2PHYCFG,
> -			disabling the suspend signal to the PHY.
> - - snps,dis-u1-entry-quirk: set if link entering into U1 needs to be disabled.
> - - snps,dis-u2-entry-quirk: set if link entering into U2 needs to be disabled.
> - - snps,dis_rxdet_inp3_quirk: when set core will disable receiver detection
> -			in PHY P3 power state.
> - - snps,dis-u2-freeclk-exists-quirk: when set, clear the u2_freeclk_exists
> -			in GUSB2PHYCFG, specify that USB2 PHY doesn't provide
> -			a free-running PHY clock.
> - - snps,dis-del-phy-power-chg-quirk: when set core will change PHY power
> -			from P0 to P1/P2/P3 without delay.
> - - snps,dis-tx-ipgap-linecheck-quirk: when set, disable u2mac linestate check
> -			during HS transmit.
> - - snps,parkmode-disable-ss-quirk: when set, all SuperSpeed bus instances in
> -			park mode are disabled.
> - - snps,dis_metastability_quirk: when set, disable metastability workaround.
> -			CAUTION: use only if you are absolutely sure of it.
> - - snps,is-utmi-l1-suspend: true when DWC3 asserts output signal
> -			utmi_l1_suspend_n, false when asserts utmi_sleep_n
> - - snps,hird-threshold: HIRD threshold
> - - snps,hsphy_interface: High-Speed PHY interface selection between "utmi" for
> -   UTMI+ and "ulpi" for ULPI when the DWC_USB3_HSPHY_INTERFACE has value 3.
> - - snps,quirk-frame-length-adjustment: Value for GFLADJ_30MHZ field of GFLADJ
> -	register for post-silicon frame length adjustment when the
> -	fladj_30mhz_sdbnd signal is invalid or incorrect.
> - - snps,rx-thr-num-pkt-prd: periodic ESS RX packet threshold count - host mode
> -			only. Set this and rx-max-burst-prd to a valid,
> -			non-zero value 1-16 (DWC_usb31 programming guide
> -			section 1.2.4) to enable periodic ESS RX threshold.
> - - snps,rx-max-burst-prd: max periodic ESS RX burst size - host mode only. Set
> -			this and rx-thr-num-pkt-prd to a valid, non-zero value
> -			1-16 (DWC_usb31 programming guide section 1.2.4) to
> -			enable periodic ESS RX threshold.
> - - snps,tx-thr-num-pkt-prd: periodic ESS TX packet threshold count - host mode
> -			only. Set this and tx-max-burst-prd to a valid,
> -			non-zero value 1-16 (DWC_usb31 programming guide
> -			section 1.2.3) to enable periodic ESS TX threshold.
> - - snps,tx-max-burst-prd: max periodic ESS TX burst size - host mode only. Set
> -			this and tx-thr-num-pkt-prd to a valid, non-zero value
> -			1-16 (DWC_usb31 programming guide section 1.2.3) to
> -			enable periodic ESS TX threshold.
> -
> - - <DEPRECATED> tx-fifo-resize: determines if the FIFO *has* to be reallocated.
> - - snps,incr-burst-type-adjustment: Value for INCR burst type of GSBUSCFG0
> -			register, undefined length INCR burst type enable and INCRx type.
> -			When just one value, which means INCRX burst mode enabled. When
> -			more than one value, which means undefined length INCR burst type
> -			enabled. The values can be 1, 4, 8, 16, 32, 64, 128 and 256.
> -
> - - in addition all properties from usb-xhci.txt from the current directory are
> -   supported as well
> -
> -
> -This is usually a subnode to DWC3 glue to which it is connected.
> -
> -dwc3@4a030000 {
> -	compatible = "snps,dwc3";
> -	reg = <0x4a030000 0xcfff>;
> -	interrupts = <0 92 4>
> -	usb-phy = <&usb2_phy>, <&usb3,phy>;
> -	snps,incr-burst-type-adjustment = <1>, <4>, <8>, <16>;
> -};
> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> new file mode 100644
> index 000000000000..079617891da6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> @@ -0,0 +1,303 @@
> +# SPDX-License-Identifier: GPL-2.0
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Synopsys DesignWare USB3 Controller
> +
> +maintainers:
> +  - Felipe Balbi <balbi@kernel.org>
> +
> +description:
> +  This is usually a subnode to DWC3 glue to which it is connected, but can also
> +  be presented as a standalone DT node with an optional vendor-specific
> +  compatible string.
> +
> +allOf:
> +  - $ref: usb-drd.yaml#
> +  - if:
> +      properties:
> +        dr_mode:
> +          const: peripheral
> +    then:
> +      $ref: usb.yaml#

This part could be done in usb-drd.yaml?

> +    else:
> +      $ref: usb-xhci.yaml#

I'd really prefer if all the schema can just be applied unconditionally. 
Shouldn't someone (like a bootloader) be able to change dr_mode without 
changing anything else to set the mode? That would imply all the 
schemas can be applied.

Rob
