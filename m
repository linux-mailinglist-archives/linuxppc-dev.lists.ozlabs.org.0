Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E15DB41E577
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 02:17:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HL9fK6hgLz3cFQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Oct 2021 10:17:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HL9dP5HjPz2ywd
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Oct 2021 10:16:24 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D360F1A0D8B;
 Fri,  1 Oct 2021 02:09:29 +0200 (CEST)
Received: from smtp.na-rdc02.nxp.com (usphx01srsp001v.us-phx01.nxp.com
 [134.27.49.11])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 982411A0D7C;
 Fri,  1 Oct 2021 02:09:29 +0200 (CEST)
Received: from right.am.freescale.net (right.am.freescale.net [10.81.116.142])
 by usphx01srsp001v.us-phx01.nxp.com (Postfix) with ESMTP id
 C47CB40A55; Thu, 30 Sep 2021 17:09:28 -0700 (MST)
From: Li Yang <leoyang.li@nxp.com>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] convert ifc binding to yaml and drop "simple-bus"
Date: Thu, 30 Sep 2021 19:09:19 -0500
Message-Id: <20211001000924.15421-1-leoyang.li@nxp.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert the ifc binding to yaml schema, in the mean while remove the
"simple-bus" compatible from the binding to make sure ifc device probes
before any of the child devices.  Update the driver and existing DTSes
accordingly.

DTS changes should be merged together with the driver/binding changes
if DTS maintainer is ok with it or after the driver changes are applied.

Li Yang (5):
  dt-bindings: memory: fsl: convert ifc binding to yaml schema
  memory: fsl_ifc: populate child devices without relying on simple-bus
  ARM: dts: ls1021a: remove "simple-bus" compatible from ifc node
  arm64: dts: remove "simple-bus" compatible from ifc node
  powerpc/mpc85xx: remove "simple-bus" compatible from ifc node

 .../bindings/memory-controllers/fsl/ifc.txt   |  82 -----------
 .../bindings/memory-controllers/fsl/ifc.yaml  | 137 ++++++++++++++++++
 arch/arm/boot/dts/ls1021a.dtsi                |   2 +-
 .../arm64/boot/dts/freescale/fsl-ls1043a.dtsi |   2 +-
 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi |   2 +-
 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi |   2 +-
 .../arm64/boot/dts/freescale/fsl-ls208xa.dtsi |   2 +-
 arch/powerpc/boot/dts/fsl/b4si-post.dtsi      |   2 +-
 arch/powerpc/boot/dts/fsl/bsc9131si-post.dtsi |   2 +-
 arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi |   2 +-
 arch/powerpc/boot/dts/fsl/c293si-post.dtsi    |   2 +-
 arch/powerpc/boot/dts/fsl/p1010si-post.dtsi   |   2 +-
 arch/powerpc/boot/dts/fsl/t1023si-post.dtsi   |   2 +-
 arch/powerpc/boot/dts/fsl/t1040si-post.dtsi   |   2 +-
 arch/powerpc/boot/dts/fsl/t2081si-post.dtsi   |   2 +-
 arch/powerpc/boot/dts/fsl/t4240si-post.dtsi   |   2 +-
 drivers/memory/fsl_ifc.c                      |   9 ++
 17 files changed, 160 insertions(+), 96 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/fsl/ifc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/fsl/ifc.yaml

-- 
2.25.1

