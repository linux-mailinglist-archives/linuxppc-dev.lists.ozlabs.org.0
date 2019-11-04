Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7640EE4E8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Nov 2019 17:41:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476JTf4F3czDqfF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 03:41:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=andrew.murray@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 476JQj2V4fzF3yR
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Nov 2019 03:38:47 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7F041F1;
 Mon,  4 Nov 2019 08:38:43 -0800 (PST)
Received: from e119886-lin.cambridge.arm.com (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4ECF43F71A;
 Mon,  4 Nov 2019 08:38:41 -0800 (PST)
From: Andrew Murray <andrew.murray@arm.com>
To: devicetree@vger.kernel.org, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-rockchip@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 rfi@lists.rocketboards.org
Subject: [PATCH v1 0/7] PCI: dt: Remove magic numbers for legacy PCI IRQ
 interrupts
Date: Mon,  4 Nov 2019 16:38:14 +0000
Message-Id: <20191104163834.8932-1-andrew.murray@arm.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PCI devices can trigger interrupts via 4 physical/virtual lines known
as INTA, INTB, INTC or INTD. Due to interrupt swizzling it is often
required to describe the interrupt mapping in the device tree. Let's
avoid the existing magic numbers and replace them with a #define to
improve clarity.

Based on v5.4-rc5, compile tested

Signed-off-by: Andrew Murray <andrew.murray@arm.com>


Andrew Murray (7):
  PCI: dt: Add legacy PCI IRQ defines
  arm64: dts: Use IRQ flags for legacy PCI IRQ interrupts
  arm: dts: Use IRQ flags for legacy PCI IRQ interrupts
  xtensa: dts: Use IRQ flags for legacy PCI IRQ interrupts
  powerpc: dts: fsl: Use IRQ flags for legacy PCI IRQ interrupts
  powerpc: dts: Use IRQ flags for legacy PCI IRQ interrupts
  dt-bindings: PCI: Use IRQ flags for legacy PCI IRQ interrupts

 .../devicetree/bindings/pci/83xx-512x-pci.txt |  18 +--
 .../devicetree/bindings/pci/aardvark-pci.txt  |  10 +-
 .../devicetree/bindings/pci/altera-pcie.txt   |  10 +-
 .../bindings/pci/axis,artpec6-pcie.txt        |  10 +-
 .../bindings/pci/cdns,cdns-pcie-host.txt      |  10 +-
 .../bindings/pci/faraday,ftpci100.txt         |  68 ++++----
 .../bindings/pci/fsl,imx6q-pcie.txt           |  10 +-
 .../bindings/pci/hisilicon-pcie.txt           |  20 +--
 .../bindings/pci/host-generic-pci.txt         |  10 +-
 .../devicetree/bindings/pci/kirin-pcie.txt    |  10 +-
 .../bindings/pci/layerscape-pci.txt           |  10 +-
 .../devicetree/bindings/pci/mediatek-pcie.txt |  40 ++---
 .../devicetree/bindings/pci/mobiveil-pcie.txt |   8 +-
 .../devicetree/bindings/pci/pci-rcar-gen2.txt |   8 +-
 .../bindings/pci/pci-thunder-pem.txt          |  10 +-
 .../devicetree/bindings/pci/pcie-al.txt       |   4 +-
 .../devicetree/bindings/pci/qcom,pcie.txt     |  20 +--
 .../bindings/pci/ralink,rt3883-pci.txt        |  18 +--
 .../bindings/pci/rockchip-pcie-host.txt       |  10 +-
 .../devicetree/bindings/pci/ti-pci.txt        |  10 +-
 .../devicetree/bindings/pci/uniphier-pcie.txt |  10 +-
 .../bindings/pci/v3-v360epc-pci.txt           |  34 ++--
 .../devicetree/bindings/pci/versatile.txt     |  40 ++---
 .../devicetree/bindings/pci/xgene-pci-msi.txt |  10 +-
 .../devicetree/bindings/pci/xgene-pci.txt     |  10 +-
 .../bindings/pci/xilinx-nwl-pcie.txt          |  10 +-
 .../devicetree/bindings/pci/xilinx-pcie.txt   |  20 +--
 arch/arm/boot/dts/alpine.dtsi                 |   6 +-
 arch/arm/boot/dts/artpec6.dtsi                |  10 +-
 arch/arm/boot/dts/gemini-dlink-dir-685.dts    |  34 ++--
 arch/arm/boot/dts/gemini-sl93512r.dts         |  34 ++--
 arch/arm/boot/dts/gemini-sq201.dts            |  34 ++--
 arch/arm/boot/dts/gemini-wbd111.dts           |  34 ++--
 arch/arm/boot/dts/gemini-wbd222.dts           |  34 ++--
 arch/arm/boot/dts/imx6qdl.dtsi                |  10 +-
 arch/arm/boot/dts/imx6sx.dtsi                 |  10 +-
 arch/arm/boot/dts/integratorap.dts            |  36 +++--
 arch/arm/boot/dts/keystone-k2e.dtsi           |  11 +-
 arch/arm/boot/dts/keystone.dtsi               |  10 +-
 arch/arm/boot/dts/qcom-apq8064.dtsi           |  10 +-
 arch/arm/boot/dts/qcom-ipq4019.dtsi           |  10 +-
 arch/arm/boot/dts/versatile-pb.dts            |  36 +++--
 arch/arm64/boot/dts/al/alpine-v2.dtsi         |   6 +-
 .../boot/dts/amd/amd-overdrive-rev-b0.dts     |   2 +-
 .../boot/dts/amd/amd-overdrive-rev-b1.dts     |   2 +-
 arch/arm64/boot/dts/amd/amd-overdrive.dts     |   2 +-
 arch/arm64/boot/dts/amd/amd-seattle-soc.dtsi  |  12 +-
 arch/arm64/boot/dts/amd/husky.dts             |   2 +-
 arch/arm64/boot/dts/arm/fvp-base-revc.dts     |  10 +-
 arch/arm64/boot/dts/arm/juno-base.dtsi        |  12 +-
 arch/arm64/boot/dts/cavium/thunder2-99xx.dtsi |  10 +-
 .../arm64/boot/dts/freescale/fsl-ls1012a.dtsi |  10 +-
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi     |  10 +-
 arch/arm64/boot/dts/hisilicon/hip06.dtsi      |  10 +-
 arch/arm64/boot/dts/qcom/msm8998.dtsi         |  10 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi          |  10 +-
 arch/arm64/boot/dts/rockchip/rk3399.dtsi      |  10 +-
 .../boot/dts/socionext/uniphier-ld20.dtsi     |  11 +-
 .../boot/dts/socionext/uniphier-pxs3.dtsi     |  11 +-
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |  12 +-
 arch/powerpc/boot/dts/bluestone.dts           |  12 +-
 arch/powerpc/boot/dts/charon.dts              |  12 +-
 arch/powerpc/boot/dts/digsy_mtc.dts           |  12 +-
 arch/powerpc/boot/dts/fsl/b4420qds.dts        |   4 +-
 arch/powerpc/boot/dts/fsl/b4420si-post.dtsi   |   2 +-
 arch/powerpc/boot/dts/fsl/b4860qds.dts        |   4 +-
 arch/powerpc/boot/dts/fsl/b4860si-post.dtsi   |   2 +-
 arch/powerpc/boot/dts/fsl/b4qds.dtsi          |   2 +-
 arch/powerpc/boot/dts/fsl/b4si-post.dtsi      |  12 +-
 arch/powerpc/boot/dts/fsl/bsc9132qds.dts      |   2 +-
 arch/powerpc/boot/dts/fsl/bsc9132si-post.dtsi |  12 +-
 arch/powerpc/boot/dts/fsl/c293pcie.dts        |   2 +-
 arch/powerpc/boot/dts/fsl/c293si-post.dtsi    |  12 +-
 arch/powerpc/boot/dts/fsl/gef_sbc310.dts      |  12 +-
 arch/powerpc/boot/dts/fsl/mpc8536ds.dts       |  12 +-
 arch/powerpc/boot/dts/fsl/mpc8536ds_36b.dts   |  12 +-
 arch/powerpc/boot/dts/fsl/mpc8540ads.dts      | 100 ++++++------
 arch/powerpc/boot/dts/fsl/mpc8544ds.dts       |  22 +--
 arch/powerpc/boot/dts/fsl/mpc8544ds.dtsi      |  22 +--
 arch/powerpc/boot/dts/fsl/mpc8548cds_32b.dts  |  14 +-
 arch/powerpc/boot/dts/fsl/mpc8548cds_36b.dts  |  14 +-
 arch/powerpc/boot/dts/fsl/mpc8548si-post.dtsi |  12 +-
 arch/powerpc/boot/dts/fsl/mpc8560ads.dts      | 100 ++++++------
 arch/powerpc/boot/dts/fsl/mpc8568mds.dts      |  22 +--
 arch/powerpc/boot/dts/fsl/mpc8568si-post.dtsi |  12 +-
 arch/powerpc/boot/dts/fsl/mpc8569mds.dts      |   2 +-
 arch/powerpc/boot/dts/fsl/mpc8569si-post.dtsi |  12 +-
 arch/powerpc/boot/dts/fsl/mpc8641_hpcn.dts    | 150 +++++++++---------
 .../powerpc/boot/dts/fsl/mpc8641_hpcn_36b.dts | 150 +++++++++---------
 arch/powerpc/boot/dts/fsl/p2020ds.dts         |   2 +-
 arch/powerpc/boot/dts/fsl/p2020ds.dtsi        |  46 +++---
 arch/powerpc/boot/dts/fsl/ppa8548.dts         |   2 +-
 arch/powerpc/boot/dts/fsl/sbc8641d.dts        |   4 +-
 arch/powerpc/boot/dts/haleakala.dts           |  12 +-
 arch/powerpc/boot/dts/holly.dts               |  42 ++---
 arch/powerpc/boot/dts/hotfoot.dts             |  12 +-
 arch/powerpc/boot/dts/kuroboxHD.dts           |  28 ++--
 arch/powerpc/boot/dts/kuroboxHG.dts           |  28 ++--
 arch/powerpc/boot/dts/lite5200.dts            |  12 +-
 arch/powerpc/boot/dts/lite5200b.dts           |  22 +--
 arch/powerpc/boot/dts/media5200.dts           |  26 +--
 arch/powerpc/boot/dts/mpc5121ads.dts          |  20 +--
 arch/powerpc/boot/dts/mpc8308rdb.dts          |  12 +-
 arch/powerpc/boot/dts/mpc8313erdb.dts         |  20 +--
 arch/powerpc/boot/dts/mpc832x_mds.dts         |  60 +++----
 arch/powerpc/boot/dts/mpc832x_rdb.dts         |  22 +--
 arch/powerpc/boot/dts/mpc8349emitxgp.dts      |   8 +-
 arch/powerpc/boot/dts/mpc836x_mds.dts         |  60 +++----
 arch/powerpc/boot/dts/mpc836x_rdk.dts         |  16 +-
 arch/powerpc/boot/dts/mucmc52.dts             |  12 +-
 arch/powerpc/boot/dts/mvme5100.dts            |  48 +++---
 arch/powerpc/boot/dts/pcm030.dts              |  22 +--
 arch/powerpc/boot/dts/pcm032.dts              |  22 +--
 arch/powerpc/boot/dts/pq2fads.dts             |  28 ++--
 arch/powerpc/boot/dts/socrates.dts            |   8 +-
 arch/powerpc/boot/dts/storcenter.dts          |  28 ++--
 arch/powerpc/boot/dts/stx_gp3_8560.dts        |  36 +++--
 arch/powerpc/boot/dts/taishan.dts             |  20 +--
 arch/powerpc/boot/dts/tqm5200.dts             |  12 +-
 arch/powerpc/boot/dts/tqm8540.dts             |  16 +-
 arch/powerpc/boot/dts/tqm8541.dts             |  16 +-
 arch/powerpc/boot/dts/tqm8555.dts             |  16 +-
 arch/powerpc/boot/dts/tqm8560.dts             |  16 +-
 arch/powerpc/boot/dts/virtex440-ml510.dts     |  43 ++---
 arch/powerpc/boot/dts/xcalibur1501.dts        |  13 +-
 arch/powerpc/boot/dts/xpedite5200.dts         |   8 +-
 arch/xtensa/boot/dts/virt.dts                 |  12 +-
 .../dt-bindings/interrupt-controller/irq.h    |   8 +
 128 files changed, 1326 insertions(+), 1189 deletions(-)

-- 
2.21.0

