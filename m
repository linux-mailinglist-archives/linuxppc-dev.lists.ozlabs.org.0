Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7AC29003D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 10:54:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCKhx30GJzDqc5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 19:54:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baikalelectronics.ru (client-ip=94.125.187.42;
 helo=mail.baikalelectronics.ru;
 envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=baikalelectronics.ru
Received: from mail.baikalelectronics.ru (mx.baikalchip.com [94.125.187.42])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CCKfn4ZG8zDqW8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 19:52:47 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id 8039D8030808;
 Fri, 16 Oct 2020 08:52:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PNU5UTBKGSXE; Fri, 16 Oct 2020 11:52:40 +0300 (MSK)
Date: Fri, 16 Oct 2020 11:52:35 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Alexandre Torgue <alexandre.torgue@st.com>
Subject: Re: [PATCH 18/20] arch: dts: Fix EHCI/OHCI DT nodes name
Message-ID: <20201016085235.znzzbqxac4yvh3cz@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-19-Sergey.Semin@baikalelectronics.ru>
 <8a7af322-227b-9923-8fb6-f284af582b40@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <8a7af322-227b-9923-8fb6-f284af582b40@st.com>
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
 Paul Cercueil <paul@crapouillou.net>, Paul Mackerras <paulus@samba.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 linux-stm32@st-md-mailman.stormreply.com,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Alexey Brodkin <abrodkin@synopsys.com>, Wei Xu <xuwei5@hisilicon.com>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Kevin Hilman <khilman@baylibre.com>, linux-snps-arc@lists.infradead.org,
 devicetree@vger.kernel.org, Mathias Nyman <mathias.nyman@intel.com>,
 Hauke Mehrtens <hauke@hauke-m.de>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Vladimir Zapolskiy <vz@mleia.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>,
 Felipe Balbi <balbi@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
 Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org,
 Manu Gautam <mgautam@codeaurora.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vineet Gupta <vgupta@synopsys.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Alexandre,

On Fri, Oct 16, 2020 at 09:08:23AM +0200, Alexandre Torgue wrote:
> Hi Serge,
> 
> On 10/14/20 12:14 PM, Serge Semin wrote:
> > In accordance with the Generic EHCI/OHCI bindings the corresponding node
> > name is suppose to comply with the Generic USB HCD DT schema, which
> > requires the USB nodes to have the name acceptable by the regexp:
> > "^usb(@.*)?" . Let's fix the DTS files, which have the nodes defined with
> > incompatible names.
> > 
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > 
> > ---
> > 
> > Please, test the patch out to make sure it doesn't brake the dependent DTS
> > files. I did only a manual grepping of the possible nodes dependencies.
> > ---
> >   arch/arc/boot/dts/axs10x_mb.dtsi               | 4 ++--
> >   arch/arc/boot/dts/hsdk.dts                     | 4 ++--
> >   arch/arc/boot/dts/vdk_axs10x_mb.dtsi           | 2 +-
> >   arch/arm/boot/dts/bcm5301x.dtsi                | 4 ++--
> >   arch/arm/boot/dts/bcm53573.dtsi                | 4 ++--
> >   arch/arm/boot/dts/hisi-x5hd2.dtsi              | 4 ++--
> >   arch/arm/boot/dts/lpc18xx.dtsi                 | 4 ++--
> >   arch/arm/boot/dts/stm32mp151.dtsi              | 4 ++--
> >   arch/arm64/boot/dts/hisilicon/hi3798cv200.dtsi | 4 ++--
> >   arch/arm64/boot/dts/hisilicon/hip06.dtsi       | 4 ++--
> >   arch/arm64/boot/dts/hisilicon/hip07.dtsi       | 4 ++--
> >   arch/mips/boot/dts/ingenic/jz4740.dtsi         | 2 +-
> >   arch/mips/boot/dts/ingenic/jz4770.dtsi         | 2 +-
> >   arch/mips/boot/dts/mti/sead3.dts               | 2 +-
> >   arch/mips/boot/dts/ralink/mt7628a.dtsi         | 2 +-
> >   arch/powerpc/boot/dts/akebono.dts              | 6 +++---
> >   16 files changed, 28 insertions(+), 28 deletions(-)
> > 
> 

> I surely missed something, but we have here in the same patch modifications
> for different architectures and different vendors.
> 
> Do you plan to split this patch after getting some Acked-by / Tested-by ?

Yeah, I'll split this patch and two next ones up in v3.

-Sergey

> 
> regards
> Alex
> 
> 
