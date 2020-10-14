Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC6D28E86E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 23:34:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBQfY18fzzDrGG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 08:34:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baikalelectronics.ru (client-ip=94.125.187.42;
 helo=mail.baikalelectronics.ru;
 envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=baikalelectronics.ru
Received: from mail.baikalelectronics.ru (mx.baikalelectronics.ru
 [94.125.187.42])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CBKNl0z3dzDqnV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 04:37:10 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 0B34B803073E;
 Wed, 14 Oct 2020 17:37:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qiTZazrqpn09; Wed, 14 Oct 2020 20:37:08 +0300 (MSK)
Date: Wed, 14 Oct 2020 20:37:06 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 09/20] dt-bindings: usb: Convert DWC USB3 bindings to DT
 schema
Message-ID: <20201014173706.jojxkhdicyg62hlo@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-10-Sergey.Semin@baikalelectronics.ru>
 <20201014133219.GA1545403@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20201014133219.GA1545403@bogus>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
X-Mailman-Approved-At: Thu, 15 Oct 2020 07:49:50 +1100
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
 Kevin Hilman <khilman@baylibre.com>, Andy Gross <agross@kernel.org>,
 linux-snps-arc@lists.infradead.org, devicetree@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>,
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

On Wed, Oct 14, 2020 at 08:32:19AM -0500, Rob Herring wrote:
> On Wed, 14 Oct 2020 13:13:51 +0300, Serge Semin wrote:
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
> > ---
> >  .../devicetree/bindings/usb/dwc3.txt          | 125 --------
> >  .../devicetree/bindings/usb/snps,dwc3.yaml    | 295 ++++++++++++++++++
> >  2 files changed, 295 insertions(+), 125 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/usb/dwc3.txt
> >  create mode 100644 Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> > 
> 
> 

> My bot found errors running 'make dt_binding_check' on your patch:
> 
> ./Documentation/devicetree/bindings/usb/snps,dwc3.yaml:44:4: [warning] wrong indentation: expected 4 but found 3 (indentation)
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/qcom,dwc3.example.dt.yaml: dwc3@a600000: $nodename:0: 'dwc3@a600000' does not match '^usb(@.*)?'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/amlogic,meson-g12a-usb-ctrl.example.dt.yaml: usb@ff500000: snps,quirk-frame-length-adjustment: True is not of type 'array'
> 	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
> 
> 
> See https://patchwork.ozlabs.org/patch/1382003
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.
> 

Both of these errors are fixed in the following patches of the series:
[PATCH 17/20] dt-bindings: usb: qcom,dwc3: Validate DWC3 sub-node
[PATCH 15/20] dt-bindings: usb: meson-g12a-usb: Fix FL-adj property value

This patch preserves the original legacy bindings and doesn't touch the
depended bogus DT schemas.

-Sergey

