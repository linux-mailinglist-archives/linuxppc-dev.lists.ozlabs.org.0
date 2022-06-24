Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C1D559B32
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 16:17:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTzhg37Tkz3chL
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jun 2022 00:17:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=baikalelectronics.ru header.i=@baikalelectronics.ru header.a=rsa-sha256 header.s=mail header.b=T3jUpF2m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baikalelectronics.ru (client-ip=87.245.175.230; helo=mail.baikalelectronics.com; envelope-from=sergey.semin@baikalelectronics.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=baikalelectronics.ru header.i=@baikalelectronics.ru header.a=rsa-sha256 header.s=mail header.b=T3jUpF2m;
	dkim-atps=neutral
Received: from mail.baikalelectronics.com (mail.baikalelectronics.com [87.245.175.230])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTzh52zfXz3bfH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jun 2022 00:16:34 +1000 (AEST)
Received: from mail (mail.baikal.int [192.168.51.25])
	by mail.baikalelectronics.com (Postfix) with ESMTP id 95B3D16C0;
	Fri, 24 Jun 2022 17:17:45 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.baikalelectronics.com 95B3D16C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=baikalelectronics.ru; s=mail; t=1656080266;
	bh=gBO/Fzd57VMdbFrJwQvKed9BQE5emVVvGrhVWB1wuys=;
	h=From:To:CC:Subject:Date:From;
	b=T3jUpF2mg1ifssmj2BLTpIeonf7tZ9POgcShAWvunW2aoQY7wFVMvXCKCfS0HdEKO
	 jTquOmGBsEk9lJCatArY/PSLAOdFDO6GX/AETPiPv4aQVzYpmHMH2pUiyHSDt6TzqF
	 FedEE1DTPTYIl+EWVNTDGRxutTQAVSCGR7zccvqE=
Received: from localhost (192.168.53.207) by mail (192.168.51.25) with
 Microsoft SMTP Server (TLS) id 15.0.1395.4; Fri, 24 Jun 2022 17:16:25 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson
	<bjorn.andersson@linaro.org>, Felipe Balbi <balbi@kernel.org>, Michael
 Ellerman <mpe@ellerman.id.au>, Vladimir Zapolskiy <vz@mleia.com>, Alexey
 Brodkin <abrodkin@synopsys.com>, Vineet Gupta <vgupta@synopsys.com>, Rob
 Herring <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski
	<krzk@kernel.org>, <linux-usb@vger.kernel.org>
Subject: [PATCH RESEND v9 0/5] dt-bindings: usb: Harmonize xHCI/EHCI/OHCI/DWC3 nodes name
Date: Fri, 24 Jun 2022 17:16:16 +0300
Message-ID: <20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, Khuong Dinh <khuong@os.amperecomputing.com>, Patrice Chotard <patrice.chotard@st.com>, Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org, Serge Semin <Sergey.Semin@baikalelectronics.ru>, Paul Mackerras <paulus@samba.org>, linux-arm-msm@vger.kernel.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As the subject states this series is an attempt to harmonize the xHCI,
EHCI, OHCI and DWC USB3 DT nodes with the DT schema introduced in the
framework of the patchset [1].

Firstly as Krzysztof suggested we've deprecated a support of DWC USB3
controllers with "synopsys,"-vendor prefix compatible string in favor of
the ones with valid "snps,"-prefix. It's done in all the DTS files,
which have been unfortunate to define such nodes.

Secondly we suggest to fix the snps,quirk-frame-length-adjustment property
declaration in the Amlogic meson-g12-common.dtsi DTS file, since it has
been erroneously declared as boolean while having uint32 type. Neil said
it was ok to init that property with 0x20 value.

Thirdly the main part of the patchset concern fixing the xHCI, EHCI/OHCI
and DWC USB3 DT nodes name as in accordance with their DT schema the
corresponding node name is suppose to comply with the Generic USB HCD DT
schema, which requires the USB nodes to have the name acceptable by the
regexp: "^usb(@.*)?". Such requirement had been applicable even before we
introduced the new DT schema in [1], but as we can see it hasn't been
strictly implemented for a lot the DTS files. Since DT schema is now
available the automated DTS validation shall make sure that the rule isn't
violated.

Note most of these patches have been a part of the last three patches of
[1]. But since there is no way to have them merged in in a combined
manner, I had to move them to the dedicated series and split them up so to
be accepted by the corresponding subsystem maintainers one-by-one.

[1] Link: https://lore.kernel.org/linux-usb/20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru/
Changelog v1:
- As Krzysztof suggested I've created a script which checked whether the
  node names had been also updated in all the depended dts files. As a
  result I found two more files which should have been also modified:
  arch/arc/boot/dts/{axc003.dtsi,axc003_idu.dtsi}
- Correct the USB DWC3 nodes name found in
  arch/arm64/boot/dts/apm/{apm-storm.dtsi,apm-shadowcat.dtsi} too.

Link: https://lore.kernel.org/linux-usb/20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru
Changelog v2:
- Drop the patch:
  [PATCH 01/29] usb: dwc3: Discard synopsys,dwc3 compatibility string
  and get back the one which marks the "synopsys,dwc3" compatible string
  as deprecated into the DT schema related series.
- Drop the patches:
  [PATCH 03/29] arm: dts: am437x: Correct DWC USB3 compatible string
  [PATCH 04/29] arm: dts: exynos: Correct DWC USB3 compatible string
  [PATCH 07/29] arm: dts: bcm53x: Harmonize EHCI/OHCI DT nodes name
  [PATCH 08/29] arm: dts: stm32: Harmonize EHCI/OHCI DT nodes name
  [PATCH 16/29] arm: dts: bcm5301x: Harmonize xHCI DT nodes name
  [PATCH 19/29] arm: dts: exynos: Harmonize DWC USB3 DT nodes name
  [PATCH 21/29] arm: dts: ls1021a: Harmonize DWC USB3 DT nodes name
  [PATCH 22/29] arm: dts: omap5: Harmonize DWC USB3 DT nodes name
  [PATCH 24/29] arm64: dts: allwinner: h6: Harmonize DWC USB3 DT nodes name
  [PATCH 26/29] arm64: dts: exynos: Harmonize DWC USB3 DT nodes name
  [PATCH 27/29] arm64: dts: layerscape: Harmonize DWC USB3 DT nodes name
  since they have been applied to the corresponding maintainers repos.
- Fix drivers/usb/dwc3/dwc3-qcom.c to be looking for the "usb@"-prefixed
  sub-node and falling back to the "dwc3@"-prefixed one on failure.

Link: https://lore.kernel.org/linux-usb/20201111091552.15593-1-Sergey.Semin@baikalelectronics.ru
Changelog v3:
- Drop the patches:
  [PATCH v2 04/18] arm: dts: hisi-x5hd2: Harmonize EHCI/OHCI DT nodes name
  [PATCH v2 06/18] arm64: dts: hisi: Harmonize EHCI/OHCI DT nodes name
  [PATCH v2 07/18] mips: dts: jz47x: Harmonize EHCI/OHCI DT nodes name
  [PATCH v2 08/18] mips: dts: sead3: Harmonize EHCI/OHCI DT nodes name
  [PATCH v2 09/18] mips: dts: ralink: mt7628a: Harmonize EHCI/OHCI DT nodes name
  [PATCH v2 11/18] arm64: dts: marvell: cp11x: Harmonize xHCI DT nodes name
  [PATCH v2 12/18] arm: dts: marvell: armada-375: Harmonize DWC USB3 DT nodes name
  [PATCH v2 16/18] arm64: dts: hi3660: Harmonize DWC USB3 DT nodes name
  since they have been applied to the corresponding maintainers repos.

Link: https://lore.kernel.org/linux-usb/20201205155621.3045-1-Sergey.Semin@baikalelectronics.ru
Changelog v4:
- Just resend.

Link: https://lore.kernel.org/linux-usb/20201210091756.18057-1-Sergey.Semin@baikalelectronics.ru/
Changelog v5:
- Drop the patch:
  [PATCH v4 02/10] arm64: dts: amlogic: meson-g12: Set FL-adj property value
  since it has been applied to the corresponding maintainers repos.
- Get back the patch:
  [PATCH 21/29] arm: dts: ls1021a: Harmonize DWC USB3 DT nodes name
  as it has been missing in the kernel 5.11-rc7
- Rebase onto the kernel 5.11-rc7.

Link: https://lore.kernel.org/lkml/20210208135154.6645-1-Sergey.Semin@baikalelectronics.ru/
Changelog v6:
- Just resend and add linux-usb.vger.kernel.org to the list of Ccecipients.

Link: https://lore.kernel.org/linux-usb/20210210172850.20849-1-Sergey.Semin@baikalelectronics.ru
Link: https://lore.kernel.org/linux-usb/20210212205521.14280-1-Sergey.Semin@baikalelectronics.ru
Changelog v7:
- Replace "of_get_child_by_name(np, "usb") ?: of_get_child_by_name(np, "dwc3");"
  pattern with using of_get_compatible_child() method in the Qcom DWC3 driver.
- Drop the patches:
  [PATCH v6 01/10] arm: dts: ls1021a: Harmonize DWC USB3 DT nodes name
  [PATCH v6 02/10] arm: dts: keystone: Correct DWC USB3 compatible string
  [PATCH v6 06/10] arm: dts: keystone: Harmonize DWC USB3 DT nodes name
  since they have been applied to the corresponding maintainers repos.
- Cleanup the list of recipients.
- Rebase onto kernel 5.12-rc4.

Link: https://lore.kernel.org/lkml/20210324204836.29668-1-Sergey.Semin@baikalelectronics.ru/
Changelog v8:
- Just resend.

Link: https://lore.kernel.org/lkml/20210409113029.7144-1-Sergey.Semin@baikalelectronics.ru
Changelog v9:
- Drop the patches:
  [PATCH RESEND v8 1/8] arm: dts: ls1021a: Harmonize DWC USB3 DT nodes name
  [PATCH RESEND v8 7/8] usb: dwc3: qcom: Detect DWC3 DT-nodes using compatible string
  since they have been applied to the corresponding maintainers repos.
- Rebase onto the kernel 5.19-rcX.

Cc: Khuong Dinh <khuong@os.amperecomputing.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-snps-arc@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (5):
  arc: dts: Harmonize EHCI/OHCI DT nodes name
  arm: dts: lpc18xx: Harmonize EHCI/OHCI DT nodes name
  powerpc: dts: akebono: Harmonize EHCI/OHCI DT nodes name
  arm: dts: stih407-family: Harmonize DWC USB3 DT nodes name
  arm64: dts: apm: Harmonize DWC USB3 DT nodes name

 arch/arc/boot/dts/axc003.dtsi              | 4 ++--
 arch/arc/boot/dts/axc003_idu.dtsi          | 4 ++--
 arch/arc/boot/dts/axs10x_mb.dtsi           | 4 ++--
 arch/arc/boot/dts/hsdk.dts                 | 4 ++--
 arch/arc/boot/dts/vdk_axs10x_mb.dtsi       | 2 +-
 arch/arm/boot/dts/lpc18xx.dtsi             | 4 ++--
 arch/arm/boot/dts/stih407-family.dtsi      | 2 +-
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi | 4 ++--
 arch/arm64/boot/dts/apm/apm-storm.dtsi     | 6 +++---
 arch/powerpc/boot/dts/akebono.dts          | 6 +++---
 10 files changed, 20 insertions(+), 20 deletions(-)

-- 
2.35.1

