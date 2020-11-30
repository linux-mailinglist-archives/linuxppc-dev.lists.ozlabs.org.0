Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1AFD2C886F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Nov 2020 16:43:19 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cl8dc0SL5zDq9k
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 02:43:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=TGtTQIAP; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cl8X74n0BzDqlF
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Dec 2020 02:38:31 +1100 (AEDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B876121D7F
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 15:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606750709;
 bh=/mwcAGKismYKxXjOUto0bcfFSTR7WENjNq8FNtV/FvQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TGtTQIAPJ9GJO83pkypK6YRWOwz5+SHe0ZTJRql4oB+vhBWwbPXl/3SeqookpuJeF
 FcWzRE4DfKNaT7RsTLr/GIxS3efT+YrckzTnJIxA2dqFVYQLuB5aiNChcHwl9NcLLG
 BeQLy9vQX71V4qBvt462uq3i0tce7SBxNiT+R/D0=
Received: by mail-ej1-f43.google.com with SMTP id f9so20417819ejw.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Nov 2020 07:38:28 -0800 (PST)
X-Gm-Message-State: AOAM533GxxwU6fr0+boDXm9LzfJltnBEXk4DwmJojEZyJSN7zKgLnSym
 qIumHEwpeuTV02rmk/atI2kXcJ/5W1+JSkNP3A==
X-Google-Smtp-Source: ABdhPJwfi/bEMZouaafRm5GbGn1YKFdYDmO1WDNjm1A+nVHVN3DMiM3lra3WgVaV1huC2tZ8DwNzz0146k2O8pmy8Hk=
X-Received: by 2002:a17:907:2718:: with SMTP id
 w24mr15750107ejk.525.1606750707036; 
 Mon, 30 Nov 2020 07:38:27 -0800 (PST)
MIME-Version: 1.0
References: <20201111090853.14112-1-Sergey.Semin@baikalelectronics.ru>
 <20201111090853.14112-11-Sergey.Semin@baikalelectronics.ru>
 <20201111201423.GA1938179@bogus>
 <20201112102946.ipcsiidty4ut4kap@mobilestation>
 <20201121124228.GA2039998@robh.at.kernel.org>
 <20201125083202.ytoyd62bg3s7kvvg@mobilestation>
In-Reply-To: <20201125083202.ytoyd62bg3s7kvvg@mobilestation>
From: Rob Herring <robh@kernel.org>
Date: Mon, 30 Nov 2020 08:38:13 -0700
X-Gmail-Original-Message-ID: <CAL_JsqKscjEgArQDbdEgbdNfC7PGVku7Wmk1myjADpsBWqJt+g@mail.gmail.com>
Message-ID: <CAL_JsqKscjEgArQDbdEgbdNfC7PGVku7Wmk1myjADpsBWqJt+g@mail.gmail.com>
Subject: Re: [PATCH v4 10/18] dt-bindings: usb: Convert DWC USB3 bindings to
 DT schema
To: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset="UTF-8"
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
 arcml <linux-snps-arc@lists.infradead.org>, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Linux USB List <linux-usb@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Serge Semin <fancer.lancer@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Manu Gautam <mgautam@codeaurora.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 25, 2020 at 1:32 AM Serge Semin
<Sergey.Semin@baikalelectronics.ru> wrote:
>
> On Sat, Nov 21, 2020 at 06:42:28AM -0600, Rob Herring wrote:
> > On Thu, Nov 12, 2020 at 01:29:46PM +0300, Serge Semin wrote:
> > > On Wed, Nov 11, 2020 at 02:14:23PM -0600, Rob Herring wrote:
> > > > On Wed, Nov 11, 2020 at 12:08:45PM +0300, Serge Semin wrote:
> > > > > DWC USB3 DT node is supposed to be compliant with the Generic xHCI
> > > > > Controller schema, but with additional vendor-specific properties, the
> > > > > controller-specific reference clocks and PHYs. So let's convert the
> > > > > currently available legacy text-based DWC USB3 bindings to the DT schema
> > > > > and make sure the DWC USB3 nodes are also validated against the
> > > > > usb-xhci.yaml schema.
> > > > >
> > > > > Note we have to discard the nodename restriction of being prefixed with
> > > > > "dwc3@" string, since in accordance with the usb-hcd.yaml schema USB nodes
> > > > > are supposed to be named as "^usb(@.*)".
> > > > >
> > > > > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > > > >
> > > > > ---
> > > > >
> > > > > Changelog v2:
> > > > > - Discard '|' from the descriptions, since we don't need to preserve
> > > > >   the text formatting in any of them.
> > > > > - Drop quotes from around the string constants.
> > > > > - Fix the "clock-names" prop description to be referring the enumerated
> > > > >   clock-names instead of the ones from the Databook.
> > > > >
> > > > > Changelog v3:
> > > > > - Apply usb-xhci.yaml# schema only if the controller is supposed to work
> > > > >   as either host or otg.
> > > > >
> > > > > Changelog v4:
> > > > > - Apply usb-drd.yaml schema first. If the controller is configured
> > > > >   to work in a gadget mode only, then apply the usb.yaml schema too,
> > > > >   otherwise apply the usb-xhci.yaml schema.
> > > > > - Discard the Rob'es Reviewed-by tag. Please review the patch one more
> > > > >   time.
> > > > > ---
> > > > >  .../devicetree/bindings/usb/dwc3.txt          | 125 --------
> > > > >  .../devicetree/bindings/usb/snps,dwc3.yaml    | 303 ++++++++++++++++++
> > > > >  2 files changed, 303 insertions(+), 125 deletions(-)
> > > > >  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
> > > > >  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> >
> >
> > > > > diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > > > > new file mode 100644
> > > > > index 000000000000..079617891da6
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > > > > @@ -0,0 +1,303 @@
> > > > > +# SPDX-License-Identifier: GPL-2.0
> > > > > +%YAML 1.2
> > > > > +---
> > > > > +$id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
> > > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > > +
> > > > > +title: Synopsys DesignWare USB3 Controller
> > > > > +
> > > > > +maintainers:
> > > > > +  - Felipe Balbi <balbi@kernel.org>
> > > > > +
> > > > > +description:
> > > > > +  This is usually a subnode to DWC3 glue to which it is connected, but can also
> > > > > +  be presented as a standalone DT node with an optional vendor-specific
> > > > > +  compatible string.
> > > > > +
> > >
> > > > > +allOf:
> > > > > +  - $ref: usb-drd.yaml#
> > > > > +  - if:
> > > > > +      properties:
> > > > > +        dr_mode:
> > > > > +          const: peripheral
> >
>
> > Another thing, this evaluates to true if dr_mode is not present. You
> > need to add 'required'?
>
> Right. Will something like this do that?

Yes.

>
> + allOf:
> +  - $ref: usb-drd.yaml#
> +  - if:
> +      properties:
> +        dr_mode:
> +          const: peripheral
> +
> +      required:
> +        - dr_mode
> +    then:
> +      $ref: usb.yaml#
> +    else
> +      $ref: usb-xhci.yaml#
>
> > If dr_mode is otg, then don't you need to apply
> > both usb.yaml and usb-xhci.yaml?
>
> No I don't. Since there is no peripheral-specific DT schema, then the
> only schema any USB-gadget node needs to pass is usb.yaml, which
> is already included into the usb-xhci.yaml schema. So for pure OTG devices
> with xHCI host and gadget capabilities it's enough to evaluate: allOf:
> [$ref: usb-drd.yaml#, $ref: usb-xhci.yaml#].  Please see the
> sketch/ASCII-figure below and the following text for details.

Okay.

Rob
