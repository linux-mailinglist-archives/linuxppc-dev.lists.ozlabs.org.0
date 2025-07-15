Return-Path: <linuxppc-dev+bounces-10267-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBBDB068D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jul 2025 23:51:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bhXvZ14MCz2yF0;
	Wed, 16 Jul 2025 07:51:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752589275;
	cv=none; b=SeV01yo5oyOnJz0eORBS0twnCkkkP3O7H0Qji2zxRGNBVNXpd6KhR+6FqCtzDwyfRbbViPc+LVJJ/whoA4n2qOCOFXT6g0DXoy7EtAmYFjmLSFz8yKFOvyaALmmaPGKf5ehSBofVo5y+jovG3vuwwOdQxNnH+0nTyYGzLQoQ03kj1oBLMHdRUVSajq2JXE8Al2AkGeDoo2/8tyzn+xSpKIN56VYfmxtCSgrE34V5BNHbxycOk48EH0EHJi++uOxCUVVaCX6SXA6GEHyBSRfGOVwEmjtnlo7uQdBAxaXvoi3w+6zXWnLVtENng7qX9k/jTo8Ahyldo0FwQ8YeAeLbOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752589275; c=relaxed/relaxed;
	bh=buqYssscW6HBuulBd2FJkTHajSJvXhiR16xC2+1WMvg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bAk0pd8K2UyBU0/gQJ4ajO34Pwmp6ZSEmDlKcbf8Tai5e5ZftzPQfYOZvs6o0e6B9h0R7lCOkYvEveOx7bTDR5u9JqCdVwGPW60J6DQYM7W7iE/R+m93rJzWnjp9EMLeETjYnpT2j37Aqc/kBzaW7dWQYBRKE+cDgFVS0fsdZlPCyqysbScIe1SeWz2u9VUN5o2ruo1ELB4bdsNvgov1enxPiNeoYJHs/ZJeUEe0UokFyw0MsRPHj8LW2hjEXTNg4rSL/tj5vA+DRn58czbfqh50/UF8htvZCVAwq8Y/efBVwSEWVbtt071ftni9WwL4ueDnlb6rD8W7ereTchEEXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mbb/bWM3; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mbb/bWM3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bhLvt2dRgz2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jul 2025 00:21:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D9E15C54A1;
	Tue, 15 Jul 2025 14:21:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBCD9C4CEE3;
	Tue, 15 Jul 2025 14:21:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752589270;
	bh=zVWl88t69qvQmJNOvzdu2b/qBUVRE3wqytBfM1uLa58=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=mbb/bWM3x7efQzejnFD5YQ5YLOKKZ+Q95pR2aliWDujkBQJGREaovmDRQr6l0e2US
	 jzTYAdgl0Wi577UiVHBtqE9yZxB1bEtdFDBpjPpwBXeD0Rf2+/E6SZB8RAnKRDg2DP
	 P7H5bvY6mp0s9uezBWP7+EYhOfCAc6uS1UUghKlw/kDyjjWqoaAFXx9O6yb5yS4Bpe
	 SigNuWxO0hA+0dDlfXphv4+BWvZg3Vxh+MJQapPjx9TeoH5viQPOIKUSmbHDSsKOe5
	 Zb2V5dU61NENPF2fvmtiTfMMBJ/Bw+2/LfpZBdMzHpAnR8AVvjbJFiNoqz1AsI6g60
	 2OHBeYl0J1Eug==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D16F0C83F22;
	Tue, 15 Jul 2025 14:21:10 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.oss.qualcomm.com@kernel.org>
Subject: [PATCH v6 0/4] PCI: Add support for resetting the Root Ports in a
 platform specific way
Date: Tue, 15 Jul 2025 19:51:03 +0530
Message-Id: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANBjdmgC/3WMQQ6CQAxFr0K6tmQYKQgr72FYIFOliTA4RaIh3
 N2RvZufvJ+8t4JyEFaokxUCL6LixwjFIYGub8c7o7jIYI0lU2aEUyc4+TBjYOUZc1dRVlFpMnu
 EKE2Bb/Leg5cmci86+/DZ+wv93r+phdCgLVpytjy5a27OXjV9vtpH54chjQPNtm1fRDtzprMAA
 AA=
X-Change-ID: 20250715-pci-port-reset-4d9519570123
To: Bjorn Helgaas <bhelgaas@google.com>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Niklas Cassel <cassel@kernel.org>, 
 Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 mani@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
 Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4632;
 i=manivannan.sadhasivam@oss.qualcomm.com; h=from:subject:message-id;
 bh=zVWl88t69qvQmJNOvzdu2b/qBUVRE3wqytBfM1uLa58=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBodmPTpP68PeP7S5mOvihNYGZRu6k0UgqJY+bSa
 wL0Q1raTaCJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaHZj0wAKCRBVnxHm/pHO
 9VrVB/sEOpRz2jWfexpNikVYAvlqnyV+VsE/hzfg9+9mkMJYFMgNFPJsfEVbeY0aUttZ2LAVAww
 9MddGux+8kU7nT0VGLY7iSFSK3Fv4knmzzPko07sVZlkFLb8Dwd5TnO9Czmcfrw8/giROuJizsX
 HjOUGxsR0uVIAbYHKTJH7LBXf/cY9stFc5Mran7/fIDOJ3igthjnnYZsKA8tYd4ojiz+Ow/LtZ2
 P8IpC3GgQ6zeoYz0OCVBuyxtcBMlE+WW4y9g23+AgI6+f+3uvlw+wgS3sS7f4FywokyToEMABdq
 mFgDl2cPx3QBIOFhCdKVwia609sG4ESLZpX27ALw8Obj7gSv
X-Developer-Key: i=manivannan.sadhasivam@oss.qualcomm.com; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@oss.qualcomm.com/default with auth_id=461
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reply-To: manivannan.sadhasivam@oss.qualcomm.com
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

Currently, in the event of AER/DPC, PCI core will try to reset the slot (Root
Port) and its subordinate devices by invoking bridge control reset and FLR. But
in some cases like AER Fatal error, it might be necessary to reset the Root
Ports using the PCI host bridge drivers in a platform specific way (as indicated
by the TODO in the pcie_do_recovery() function in drivers/pci/pcie/err.c).
Otherwise, the PCI link won't be recovered successfully.

So this series adds a new callback 'pci_host_bridge::reset_root_port' for the
host bridge drivers to reset the Root Port when a fatal error happens.

Also, this series allows the host bridge drivers to handle PCI link down event
by resetting the Root Ports and recovering the bus. This is accomplished by the
help of the new 'pci_host_handle_link_down()' API. Host bridge drivers are
expected to call this API (preferrably from a threaded IRQ handler) with
relevant Root Port 'pci_dev' when a link down event is detected for the port.
The API will reuse the pcie_do_recovery() function to recover the link if AER
support is enabled, otherwise it will directly call the reset_root_port()
callback of the host bridge driver (if exists).

For reference, I've modified the pcie-qcom driver to call
pci_host_handle_link_down() API with Root Port 'pci_dev' after receiving the
LINK_DOWN global_irq event and populated 'pci_host_bridge::reset_root_port()'
callback to reset the Root Port. Since the Qcom PCIe controllers support only
a single Root Port (slot) per controller instance, the API is going to be
invoked only once. For multi Root Port controllers, the controller driver is
expected to detect the Root Port that received the link down event and call
the pci_host_handle_link_down() API with 'pci_dev' of that Root Port.

Testing
-------

I've lost access to my test setup now. So Krishna (Cced) will help with testing
on the Qcom platform and Wilfred or Niklas should be able to test it on Rockchip
platform. For the moment, this series is compile tested only.

Changes in v6:
- Incorporated the patch: https://lore.kernel.org/all/20250524185304.26698-2-manivannan.sadhasivam@linaro.org/
- Link to v5: https://lore.kernel.org/r/20250715-pci-port-reset-v5-0-26a5d278db40@oss.qualcomm.com

Changes in v5:
* Reworked the pci_host_handle_link_down() to accept Root Port instead of
  resetting all Root Ports in the event of link down.
* Renamed 'reset_slot' to 'reset_root_port' to avoid confusion as both terms
  were used interchangibly and the series is intended to reset Root Port only.
* Added the Rockchip driver change to this series.
* Dropped the applied patches and review/tested tags due to rework.
* Rebased on top of v6.16-rc1.

Changes in v4:
- Handled link down first in the irq handler
- Updated ICC & OPP bandwidth after link up in reset_slot() callback
- Link to v3: https://lore.kernel.org/r/20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org

Changes in v3:
- Made the pci-host-common driver as a common library for host controller
  drivers
- Moved the reset slot code to pci-host-common library
- Link to v2: https://lore.kernel.org/r/20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org

Changes in v2:
- Moved calling reset_slot() callback from pcie_do_recovery() to pcibios_reset_secondary_bus()
- Link to v1: https://lore.kernel.org/r/20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Manivannan Sadhasivam (3):
      PCI/ERR: Add support for resetting the Root Ports in a platform specific way
      PCI: host-common: Add link down handling for Root Ports
      PCI: qcom: Add support for resetting the Root Port due to link down event

Wilfred Mallawa (1):
      PCI: dw-rockchip: Add support to reset Root Port upon link down event

 drivers/pci/controller/dwc/Kconfig            |   2 +
 drivers/pci/controller/dwc/pcie-dw-rockchip.c |  91 ++++++++++++++++++-
 drivers/pci/controller/dwc/pcie-qcom.c        | 120 ++++++++++++++++++++++++--
 drivers/pci/controller/pci-host-common.c      |  33 +++++++
 drivers/pci/controller/pci-host-common.h      |   1 +
 drivers/pci/pci.c                             |  21 +++++
 drivers/pci/pcie/err.c                        |   6 +-
 include/linux/pci.h                           |   1 +
 8 files changed, 260 insertions(+), 15 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250715-pci-port-reset-4d9519570123

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>



