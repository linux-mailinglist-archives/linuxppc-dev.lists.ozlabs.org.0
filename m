Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC27E860016
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 18:51:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=baikalelectronics.ru header.i=@baikalelectronics.ru header.a=rsa-sha256 header.s=post header.b=N4CfgLMK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tgggk5hpNz3vZ6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 04:51:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=baikalelectronics.ru header.i=@baikalelectronics.ru header.a=rsa-sha256 header.s=post header.b=N4CfgLMK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baikalelectronics.ru (client-ip=213.79.110.86; helo=post.baikalelectronics.com; envelope-from=sergey.semin@baikalelectronics.ru; receiver=lists.ozlabs.org)
Received: from post.baikalelectronics.com (post.baikalelectronics.com [213.79.110.86])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tggf74cx1z2yst
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 04:50:23 +1100 (AEDT)
Received: from post.baikalelectronics.com (localhost.localdomain [127.0.0.1])
	by post.baikalelectronics.com (Proxmox) with ESMTP id 45F81E0EC2;
	Thu, 22 Feb 2024 20:44:58 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	baikalelectronics.ru; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:from:from:message-id
	:mime-version:reply-to:subject:subject:to:to; s=post; bh=ECxaRkn
	9yfqjrxSfI8sHbBDrza4hdFLYIVczvySlchw=; b=N4CfgLMKNqKY1JTx83U2XNW
	HLxS2lzaYHex5BfzTb83yqoyLz27fK3KU+zjqSveb1yOUgUQbtykgEw8chgV3XBP
	pOZkKAjU/65EB0Gb+WUD3ebZ8vJ2fqcvyCjN1Psmq0jNEhILTMAE16xR46a8K/QB
	Rdq3Fno/FUkxZddqDTfA=
Received: from mail.baikal.int (mail.baikal.int [192.168.51.25])
	by post.baikalelectronics.com (Proxmox) with ESMTP id 1530EE0DE6;
	Thu, 22 Feb 2024 20:44:58 +0300 (MSK)
Received: from localhost (10.8.30.70) by mail (192.168.51.25) with Microsoft
 SMTP Server (TLS) id 15.0.1395.4; Thu, 22 Feb 2024 20:44:57 +0300
From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	<npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Aneesh
 Kumar K.V <aneesh.kumar@kernel.org>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>, Rob Herring <robh+dt@kernel.org>, Frank Rowand
	<frowand.list@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH RESEND v10 0/1] dt-bindings: usb: Harmonize xHCI/EHCI/OHCI/DWC3 nodes name
Date: Thu, 22 Feb 2024 20:44:50 +0300
Message-ID: <20240222174456.25903-1-Sergey.Semin@baikalelectronics.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.8.30.70]
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Serge Semin <Sergey.Semin@baikalelectronics.ru>, Serge Semin <fancer.lancer@gmail.com>, linuxppc-dev@lists.ozlabs.org
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

[1] Link: https://lore.kernel.org/linux-usb/20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru
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

Link: https://lore.kernel.org/linux-usb/20201210091756.18057-1-Sergey.Semin@baikalelectronics.ru
Changelog v5:
- Drop the patch:
  [PATCH v4 02/10] arm64: dts: amlogic: meson-g12: Set FL-adj property value
  since it has been applied to the corresponding maintainers repos.
- Get back the patch:
  [PATCH 21/29] arm: dts: ls1021a: Harmonize DWC USB3 DT nodes name
  as it has been missing in the kernel 5.11-rc7
- Rebase onto the kernel 5.11-rc7.

Link: https://lore.kernel.org/lkml/20210208135154.6645-1-Sergey.Semin@baikalelectronics.ru
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

Link: https://lore.kernel.org/lkml/20210324204836.29668-1-Sergey.Semin@baikalelectronics.ru
Changelog v8:
- Just resend.

Link: https://lore.kernel.org/lkml/20210409113029.7144-1-Sergey.Semin@baikalelectronics.ru
Changelog v9:
- Drop the patches:
  [PATCH RESEND v8 1/8] arm: dts: ls1021a: Harmonize DWC USB3 DT nodes name
  [PATCH RESEND v8 7/8] usb: dwc3: qcom: Detect DWC3 DT-nodes using compatible string
  since they have been applied to the corresponding maintainers repos.
- Rebase onto the kernel 5.19-rcX.

Link: https://lore.kernel.org/lkml/20220624141622.7149-1-Sergey.Semin@baikalelectronics.ru
Changelog v10:
- Just resend.
- Rebase onto the kernel 6.8-rc3.
- Drop the already merged in patches:
  [PATCH RESEND v9 1/5] arc: dts: Harmonize EHCI/OHCI DT nodes name
  [PATCH RESEND v9 2/5] arm: dts: lpc18xx: Harmonize EHCI/OHCI DT nodes name
  [PATCH RESEND v9 4/5] arm: dts: stih407-family: Harmonize DWC USB3 DT nodes name
  [PATCH RESEND v9 5/5] arm64: dts: apm: Harmonize DWC USB3 DT nodes name

Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-usb@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (1):
  powerpc: dts: akebono: Harmonize EHCI/OHCI DT nodes name

 arch/powerpc/boot/dts/akebono.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

-- 
2.43.0


