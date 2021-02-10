Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E99B3316F03
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 19:45:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbTGC5ysXzDwhG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 05:45:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=baikalelectronics.ru (client-ip=87.245.175.226;
 helo=mail.baikalelectronics.ru;
 envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
Received: from mail.baikalelectronics.ru (mail.baikalelectronics.com
 [87.245.175.226])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DbTD5330MzDwh7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 05:43:16 +1100 (AEDT)
Date: Wed, 10 Feb 2021 21:43:11 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [PATCH RESEND v6 00/10] dt-bindings: usb: Harmonize
 xHCI/EHCI/OHCI/DWC3 nodes name
Message-ID: <20210210184311.ouc6zft675kybyjx@mobilestation>
References: <20210210172850.20849-1-Sergey.Semin@baikalelectronics.ru>
 <e169630f-1255-7597-86f2-63ee8760cc8c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <e169630f-1255-7597-86f2-63ee8760cc8c@gmail.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Amelie Delaunay <amelie.delaunay@st.com>,
 Tony Lindgren <tony@atomide.com>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Paul Cercueil <paul@crapouillou.net>, Paul Mackerras <paulus@samba.org>,
 Wei Xu <xuwei5@hisilicon.com>, linux-stm32@st-md-mailman.stormreply.com,
 linux-kernel@vger.kernel.org, Alexandre Torgue <alexandre.torgue@st.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>, linux-samsung-soc@vger.kernel.org,
 Gregory Clement <gregory.clement@bootlin.com>,
 Rafal Milecki <zajec5@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Andy Gross <agross@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 linux-arm-msm@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 devicetree@vger.kernel.org, Jason Cooper <jason@lakedaemon.net>,
 Hauke Mehrtens <hauke@hauke-m.de>, linuxppc-dev@lists.ozlabs.org,
 Maxime Ripard <mripard@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Rob Herring <robh+dt@kernel.org>, Jun Li <lijun.kernel@gmail.com>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Felipe Balbi <balbi@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Patrice Chotard <patrice.chotard@st.com>,
 Serge Semin <fancer.lancer@gmail.com>, Li Yang <leoyang.li@nxp.com>,
 Kukjin Kim <kgene@kernel.org>, Benoit Cousson <bcousson@baylibre.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-mediatek@lists.infradead.org,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 10, 2021 at 10:21:47AM -0800, Florian Fainelli wrote:
> On 2/10/21 9:28 AM, Serge Semin wrote:
> > As the subject states this series is an attempt to harmonize the xHCI,
> > EHCI, OHCI and DWC USB3 DT nodes with the DT schema introduced in the
> > framework of the patchset [1].
> > 
> > Firstly as Krzysztof suggested we've deprecated a support of DWC USB3
> > controllers with "synopsys,"-vendor prefix compatible string in favor of
> > the ones with valid "snps,"-prefix. It's done in all the DTS files,
> > which have been unfortunate to define such nodes.
> > 
> > Secondly we suggest to fix the snps,quirk-frame-length-adjustment property
> > declaration in the Amlogic meson-g12-common.dtsi DTS file, since it has
> > been erroneously declared as boolean while having uint32 type. Neil said
> > it was ok to init that property with 0x20 value.
> > 
> > Thirdly the main part of the patchset concern fixing the xHCI, EHCI/OHCI
> > and DWC USB3 DT nodes name as in accordance with their DT schema the
> > corresponding node name is suppose to comply with the Generic USB HCD DT
> > schema, which requires the USB nodes to have the name acceptable by the
> > regexp: "^usb(@.*)?". Such requirement had been applicable even before we
> > introduced the new DT schema in [1], but as we can see it hasn't been
> > strictly implemented for a lot the DTS files. Since DT schema is now
> > available the automated DTS validation shall make sure that the rule isn't
> > violated.
> > 
> > Note most of these patches have been a part of the last three patches of
> > [1]. But since there is no way to have them merged in in a combined
> > manner, I had to move them to the dedicated series and split them up so to
> > be accepted by the corresponding subsystem maintainers one-by-one.
> > 
> > [1] Link: https://lore.kernel.org/linux-usb/20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru/
> > Changelog v1:
> > - As Krzysztof suggested I've created a script which checked whether the
> >   node names had been also updated in all the depended dts files. As a
> >   result I found two more files which should have been also modified:
> >   arch/arc/boot/dts/{axc003.dtsi,axc003_idu.dtsi}
> > - Correct the USB DWC3 nodes name found in
> >   arch/arm64/boot/dts/apm/{apm-storm.dtsi,apm-shadowcat.dtsi} too.
> > 
> > Link: https://lore.kernel.org/linux-usb/20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru
> > Changelog v2:
> > - Drop the patch:
> >   [PATCH 01/29] usb: dwc3: Discard synopsys,dwc3 compatibility string
> >   and get back the one which marks the "synopsys,dwc3" compatible string
> >   as deprecated into the DT schema related series.
> > - Drop the patches:
> >   [PATCH 03/29] arm: dts: am437x: Correct DWC USB3 compatible string
> >   [PATCH 04/29] arm: dts: exynos: Correct DWC USB3 compatible string
> >   [PATCH 07/29] arm: dts: bcm53x: Harmonize EHCI/OHCI DT nodes name
> >   [PATCH 08/29] arm: dts: stm32: Harmonize EHCI/OHCI DT nodes name
> >   [PATCH 16/29] arm: dts: bcm5301x: Harmonize xHCI DT nodes name
> >   [PATCH 19/29] arm: dts: exynos: Harmonize DWC USB3 DT nodes name
> >   [PATCH 21/29] arm: dts: ls1021a: Harmonize DWC USB3 DT nodes name
> >   [PATCH 22/29] arm: dts: omap5: Harmonize DWC USB3 DT nodes name
> >   [PATCH 24/29] arm64: dts: allwinner: h6: Harmonize DWC USB3 DT nodes name
> >   [PATCH 26/29] arm64: dts: exynos: Harmonize DWC USB3 DT nodes name
> >   [PATCH 27/29] arm64: dts: layerscape: Harmonize DWC USB3 DT nodes name
> >   since they have been applied to the corresponding maintainers repos.
> > - Fix drivers/usb/dwc3/dwc3-qcom.c to be looking for the "usb@"-prefixed
> >   sub-node and falling back to the "dwc3@"-prefixed one on failure.
> > 
> > Link: https://lore.kernel.org/linux-usb/20201111091552.15593-1-Sergey.Semin@baikalelectronics.ru
> > Changelog v3:
> > - Drop the patches:
> >   [PATCH v2 04/18] arm: dts: hisi-x5hd2: Harmonize EHCI/OHCI DT nodes name
> >   [PATCH v2 06/18] arm64: dts: hisi: Harmonize EHCI/OHCI DT nodes name
> >   [PATCH v2 07/18] mips: dts: jz47x: Harmonize EHCI/OHCI DT nodes name
> >   [PATCH v2 08/18] mips: dts: sead3: Harmonize EHCI/OHCI DT nodes name
> >   [PATCH v2 09/18] mips: dts: ralink: mt7628a: Harmonize EHCI/OHCI DT nodes name
> >   [PATCH v2 11/18] arm64: dts: marvell: cp11x: Harmonize xHCI DT nodes name
> >   [PATCH v2 12/18] arm: dts: marvell: armada-375: Harmonize DWC USB3 DT nodes name
> >   [PATCH v2 16/18] arm64: dts: hi3660: Harmonize DWC USB3 DT nodes name
> >   since they have been applied to the corresponding maintainers repos.
> > 
> > Link: https://lore.kernel.org/linux-usb/20201205155621.3045-1-Sergey.Semin@baikalelectronics.ru
> > Changelog v4:
> > - Just resend.
> > 
> > Link: https://lore.kernel.org/linux-usb/20201210091756.18057-1-Sergey.Semin@baikalelectronics.ru/
> > Changelog v5:
> > - Drop the patch:
> >   [PATCH v4 02/10] arm64: dts: amlogic: meson-g12: Set FL-adj property value
> >   since it has been applied to the corresponding maintainers repos.
> > - Get back the patch:
> >   [PATCH 21/29] arm: dts: ls1021a: Harmonize DWC USB3 DT nodes name
> >   as it has been missing in the kernel 5.11-rc7
> > - Rebase onto the kernel 5.11-rc7
> > 
> > Link: https://lore.kernel.org/lkml/20210208135154.6645-1-Sergey.Semin@baikalelectronics.ru/
> > Changelog v6:
> > - Just resend and add linux-usb.vger.kernel.org to the list of Ccecipients.
> 
> 

> If this needs to go on, can you drop the people who already took your
> patches (trying to lower my email amount to something manageable).
> Thank you.

Ah, sorry for the noise. I'll clean the Cc-list up in the next attempt
to have this finally fully accepted.

-Sergey

> -- 
> Florian
