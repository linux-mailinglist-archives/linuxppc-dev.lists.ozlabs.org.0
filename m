Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2A028E86A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 23:31:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBQZk5P6kzDrDm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 08:31:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baikalelectronics.ru (client-ip=94.125.187.42;
 helo=mail.baikalelectronics.ru;
 envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=baikalelectronics.ru
Received: from mail.baikalelectronics.ru (ns2.baikalchip.com [94.125.187.42])
 by lists.ozlabs.org (Postfix) with ESMTP id 4CBJxP4j7szDqnV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 04:16:50 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
 by mail.baikalelectronics.ru (Postfix) with ESMTP id BDEBF803073C;
 Wed, 14 Oct 2020 17:16:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
 by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ys7tOGr55fWZ; Wed, 14 Oct 2020 20:16:46 +0300 (MSK)
Date: Wed, 14 Oct 2020 20:16:40 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 20/20] arch: dts: Fix DWC USB3 DT nodes name
Message-ID: <20201014171640.bup52mgaz4jvhtsy@mobilestation>
References: <20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru>
 <20201014101402.18271-21-Sergey.Semin@baikalelectronics.ru>
 <CAJKOXPeErocR5-3xCDqBR3-k3w_2EQ_768d71n229cbzeo4TtQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAJKOXPeErocR5-3xCDqBR3-k3w_2EQ_768d71n229cbzeo4TtQ@mail.gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-usb@vger.kernel.org,
 Neil Armstrong <narmstrong@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>, Wei Xu <xuwei5@hisilicon.com>,
 Chen-Yu Tsai <wens@csie.org>, Kukjin Kim <kgene@kernel.org>,
 Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Mathias Nyman <mathias.nyman@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Maxime Ripard <mripard@kernel.org>,
 Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
 Rob Herring <robh+dt@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Roger Quadros <rogerq@ti.com>, Felipe Balbi <balbi@kernel.org>,
 linux-mips@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linuxppc-dev@lists.ozlabs.org, Patrice Chotard <patrice.chotard@st.com>,
 Serge Semin <fancer.lancer@gmail.com>, Li Yang <leoyang.li@nxp.com>,
 Manu Gautam <mgautam@codeaurora.org>,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 14, 2020 at 12:33:25PM +0200, Krzysztof Kozlowski wrote:
> On Wed, 14 Oct 2020 at 12:23, Serge Semin
> <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> > In accordance with the DWC USB3 bindings the corresponding node name is
> > suppose to comply with Generic USB HCD DT schema, which requires the USB
> > nodes to have the name acceptable by the regexp: "^usb(@.*)?" . But a lot
> > of the DWC USB3-compatible nodes defined in the ARM/ARM64 DTS files have
> > name as "^dwc3@.*" or "^usb[1-3]@.*" or even "^dwusb@.*", which will cause
> > the dtbs_check procedure failure. Let's fix the nodes naming to be
> > compatible with the DWC USB3 DT schema to make dtbs_check happy.
> >
> > Note we don't change the DWC USB3-compatible nodes names of
> > arch/arm64/boot/dts/apm/{apm-storm.dtsi,apm-shadowcat.dtsi} since the
> > in-source comment says that the nodes name need to be preserved as
> > "^dwusb@.*" for some backward compatibility.
> >
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> >
> > ---
> >
> > Please, test the patch out to make sure it doesn't brake the dependent DTS
> > files. I did only a manual grepping of the possible nodes dependencies.
> 

> 1. It is you who should compare the decompiled DTS, not us. For example:
> $ for i in dts-old/*/*dtb dts-old/*/*/*dtb; do echo $i; crosc64
> scripts/dtc/dtx_diff ${i} dts-new/${i#dts-old/} ; done
> 
> $ for i in dts-old/*/*dtb dts-old/*/*/*dtb; do echo $i; crosc64
> fdtdump ${i} > ${i}.fdt ; crosc64 fdtdump dts-new/${i#dts-old/} >
> dts-new/${i#dts-old/}.fdt ; diff -ubB ${i}.fdt
> dts-new/${i#dts-old/}.fdt ; done

So basically you suggest first to compile the old and new dts files, then to
de-compile them, then diff old and new fdt's, and visually compare the results.
Personally it isn't that much better than what I did, since each old and new
dtbs will for sure differ due to the node names change suggested in this patch.
So it will lead to the visual debugging too, which isn't that effective. But
your approach is still more demonstrative to make sure that I didn't loose any
nodes redefinition, since in the occasion the old and new de-compiled nodes will
differ not only by the node names but with an additional old named node.

So to speak thanks for suggesting it. I'll try it to validate the proposed
changes.

Two questions:
1) Any advise of a good inliner/command to compile all dtbs at once? Of course I
can get all the updated dtsi'es, then find out all the dts'es which include
them, then directly use dtc to compile the found dts'es... On the other hand I
can just compile all dts'es, then compare old and new ones. The diff of the
non-modified dtb'es will be just empty...
2) What crosc64 is?

> 
> 2. Split it per arm architectures (and proper subject prefix - not
> "arch") and subarchitectures so maintainers can pick it up.

Why? The changes are simple and can be formatted as a single patch. I've seen
tons of patches submitted like that, accepted and then merged. What you suggest
is just much more work, which I don't see quite required.

> 
> 3. The subject title could be more accurate - there is no fix here
> because there was no errors in the first place. Requirement of DWC
> node names comes recently, so it is more alignment with dtschema.
> Otherwise automatic-pickup-stable-bot might want to pick up... and it
> should not go to stable.

Actually it is a fix, because the USB DT nodes should have been named with "usb"
prefix in the first place. Legacy DWC USB3 bindings didn't define the nodes
naming, but implied to be "usb"-prefixed by the USB HCD schema. The Qualcomm
DWC3 schema should have defined the sub-nodes as "dwc3@"-prefixed, which was
wrong in the first place.

Regarding automatic-pickup-stable-bot if it exists I don't think it scans all the
emails, but most likely the stable@vger.kernel.org list only or the emails
having the "Fixes:" tag. If I am wrong please give me a link to the bot sources
or refer to a doc where I can read about the way it works, to take it into
account in future commits. Just to note I submitted patches which did some fixes,
had the word "fix" in the subject but weren't selected to be backported to the
stable kernel.

Anyway I don't really care that much about the subject text using the word "fix"
or some else. So if you suggest some better alternative, I'd be glad to consider
it.

-Sergey

> 
> Best regards,
> Krzysztof
> 
> >  arch/arm/boot/dts/armada-375.dtsi              | 2 +-
> >  arch/arm/boot/dts/exynos5250.dtsi              | 2 +-
> >  arch/arm/boot/dts/exynos54xx.dtsi              | 4 ++--
> >  arch/arm/boot/dts/keystone-k2e.dtsi            | 4 ++--
> >  arch/arm/boot/dts/keystone.dtsi                | 2 +-
> >  arch/arm/boot/dts/ls1021a.dtsi                 | 2 +-
> >  arch/arm/boot/dts/omap5-l4.dtsi                | 2 +-
> >  arch/arm/boot/dts/stih407-family.dtsi          | 2 +-
> >  arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi   | 2 +-
> >  arch/arm64/boot/dts/exynos/exynos5433.dtsi     | 4 ++--
> >  arch/arm64/boot/dts/exynos/exynos7.dtsi        | 2 +-
> >  arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi | 4 ++--
> >  arch/arm64/boot/dts/freescale/fsl-ls1043a.dtsi | 6 +++---
> >  arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 4 ++--
> >  arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 4 ++--
> >  arch/arm64/boot/dts/hisilicon/hi3660.dtsi      | 2 +-
> >  arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi   | 4 ++--
> >  arch/arm64/boot/dts/qcom/ipq8074.dtsi          | 4 ++--
> >  arch/arm64/boot/dts/qcom/msm8996.dtsi          | 4 ++--
> >  arch/arm64/boot/dts/qcom/msm8998.dtsi          | 2 +-
> >  arch/arm64/boot/dts/qcom/qcs404-evb.dtsi       | 2 +-
> >  arch/arm64/boot/dts/qcom/qcs404.dtsi           | 4 ++--
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi           | 2 +-
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi           | 4 ++--
> >  arch/arm64/boot/dts/qcom/sm8150.dtsi           | 2 +-
> >  25 files changed, 38 insertions(+), 38 deletions(-)
> >
