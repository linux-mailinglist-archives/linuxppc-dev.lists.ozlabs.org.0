Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B254A28E881
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 23:44:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBQsW5t4vzDqrn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 08:43:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baikalelectronics.ru (client-ip=94.125.187.42;
 helo=mail.baikalelectronics.ru;
 envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=baikalelectronics.ru
Received: from mail.baikalelectronics.ru (ns2.baikalelectronics.com
 [94.125.187.42])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CBQPS02nczDr83
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 08:23:07 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 12B99803073C;
 Wed, 14 Oct 2020 21:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id inYRWRerfTBc; Thu, 15 Oct 2020 00:23:05 +0300 (MSK)
Date: Thu, 15 Oct 2020 00:22:59 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
Message-ID: <20201014212259.ltckcgz2yrola7za@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
 <878sc8lx0e.fsf@kernel.org>
 <20201014143720.yny3jco5pkb7dr4b@mobilestation>
 <CAL_JsqKNuYS1ojJMCx1whLgynz+cTZ-Hvxn5pEFJc_PUgA1hsg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKNuYS1ojJMCx1whLgynz+cTZ-Hvxn5pEFJc_PUgA1hsg@mail.gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Linux USB List <linux-usb@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Wei Xu <xuwei5@hisilicon.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 arcml <linux-snps-arc@lists.infradead.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Mathias Nyman <mathias.nyman@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Patrice Chotard <patrice.chotard@st.com>,
 Serge Semin <fancer.lancer@gmail.com>, Li Yang <leoyang.li@nxp.com>,
 Manu Gautam <mgautam@codeaurora.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 14, 2020 at 01:35:16PM -0500, Rob Herring wrote:
> On Wed, Oct 14, 2020 at 9:37 AM Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> > On Wed, Oct 14, 2020 at 05:09:37PM +0300, Felipe Balbi wrote:
> > >
> > > Hi Serge,
> > >
> > > Serge Semin <Sergey.Semin@baikalelectronics.ru> writes:
> > > > In accordance with the DWC USB3 bindings the corresponding node name is
> > > > suppose to comply with Generic USB HCD DT schema, which requires the USB
> > >
> >
> > > DWC3 is not a simple HDC, though.
> >
> > Yeah, strictly speaking it is equipped with a lot of vendor-specific stuff,
> > which are tuned by the DWC USB3 driver in the kernel. But after that the
> > controller is registered as xhci-hcd device so it's serviced by the xHCI driver,
> > which then registers the HCD device so the corresponding DT node is supposed
> > to be compatible with the next bindings: usb/usb-hcd.yaml, usb/usb-xhci.yaml
> > and usb/snps,dwc3,yaml. I've created the later one so to validate the denoted
> > compatibility.
> >
> > >
> > > > nodes to have the name acceptable by the regexp: "^usb(@.*)?" . But a lot
> > > > of the DWC USB3-compatible nodes defined in the ARM/ARM64 DTS files have
> > > > name as "^dwc3@.*" or "^usb[1-3]@.*" or even "^dwusb@.*", which will cause
> > > > the dtbs_check procedure failure. Let's fix the nodes naming to be
> > > > compatible with the DWC USB3 DT schema to make dtbs_check happy.
> > > >
> > > > Note we don't change the DWC USB3-compatible nodes names of
> > > > arch/arm64/boot/dts/apm/{apm-storm.dtsi,apm-shadowcat.dtsi} since the
> > > > in-source comment says that the nodes name need to be preserved as
> > > > "^dwusb@.*" for some backward compatibility.
> > >
> >
> > > interesting, compatibility with what? Some debugfs files, perhaps? :-)
> >
> > Don't really know.) In my experience the worst type of such compatibility is
> > connected with some bootloader magic, which may add/remove/modify properties
> > to nodes with pre-defined names.
> 

> I seriously doubt anyone is using the APM machines with DT (even ACPI
> is somewhat doubtful). I say change them. Or remove the dts files and
> see what happens. Either way it can always be reverted.

Ok. I'll change them in v3.

-Sergey

> 
> Rob
