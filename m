Return-Path: <linuxppc-dev+bounces-7698-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8CCA908ED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 18:29:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zd61B6YvSz3brP;
	Thu, 17 Apr 2025 02:29:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744820958;
	cv=none; b=UkD/lN1OLI+XoEUSOH2zTG6y3AVhnPITlXPlgOAEJT08xeNptRxmnoViBMtGFGuJL6RgBLUrMLCpdziN/CN5aiprlg08f30ET6Vboj/cwqbp68UbhKUrZLSw0XxfLa82UX18HnVj3zfyvfMKKTZZlB1Jan/6z36pnokVQfwYEBoIi4HVxddmhTe0xsTEvYZKUYLu4OsKBRlUXX9XO3JUu8+XQ5SLQ97BUy3YjK9oXO5q5NlFCvCBviOYfRCU1vy/r1d/6QRjt/R1cx0lZMC7ovI9pWIj1WtwhFCkFpXQMxbbLuLR9QgW8PK29Ck2tRQrh1luFBRK6242tVLrdcOSWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744820958; c=relaxed/relaxed;
	bh=mdCYSd0KyAxsSIeYj7XzE5yyprKtUhbwJi+XkpS9P4U=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JjZRptufGuMtN7zC+mVyTnqyggdXudRNdoK3lNcLbJi+I9ND/9FwzYjZAJNJFg1CkTQoQpoXwB+A8cSYJuhZJoPajyBPdEph8aIugrsusE9xT2Jozw4+HrDRgX4rnniAhZVVwhnIUxWrhdxlFEstne9WTXpWovtCFR7kEgrpMkhAoXm0eWWOLrheIBV1G8gi0gvyY8l6ZQ9/3ACFsel2HG315tBL+QAHHnxhMAvQbFyPAdJVCnLhH7PB2ztcnqB4waLyxK95XmxrAkIoSJWRyuO+Nkh0HPbGCVlPzKeJTqE7cY172tYOlB3QCacNelabuLdYUKu8auLs6oj1AXrdtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B1IUL+59; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.linaro.org@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=B1IUL+59;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.linaro.org@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 89517 seconds by postgrey-1.37 at boromir; Thu, 17 Apr 2025 02:29:17 AEST
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zd6195rCRz3bps
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 02:29:17 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DEA2439D6;
	Wed, 16 Apr 2025 16:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2650BC4CEE2;
	Wed, 16 Apr 2025 16:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744820955;
	bh=qkB19ebsdB7yF8JrqmDzhAIvjQoXMD7T3mmriNCrqxE=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=B1IUL+59kGeD7mqga7bCyxPIxG2tp3cXVrKCvl5dVtHYI0OhB5uCNAOGJiOc0bp+l
	 HsYGTqjEsLaHjBoX4CofSq+N9qa3eKcmpemd67bkz6OaFrkFLEkyLMD+1OE8YbB0lG
	 KLv12g/nY3FdONOL1EgWm3Xw4t8o0vKBbJuJSzLNnFufjeaKx3lfX1dZDk6RPSJOng
	 oAQCbEQd1tTf6NwWRPx5fSaohAq4P5rcqnD3z+EgBYIuR7vOFa6VklFzFzPOJGwxpH
	 zu86cEMnCqpkacuKS0dZhcYisejR0kc+z2kDbH66j8nILxYuGVpK2rSjNJJQn4MHUN
	 5SfMBNL6P3Jfg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1ECC369BA;
	Wed, 16 Apr 2025 16:29:15 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Subject: [PATCH v2 0/4] PCI: Add support for resetting the slots in a
 platform specific way
Date: Wed, 16 Apr 2025 21:59:02 +0530
Message-Id: <20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM/a/2cC/3WNwQqDMBBEf0X23C1Jqmh66n8UD9FudEES2UhoE
 f+9qfce3zDzZodEwpTgXu0glDlxDAXMpYJxdmEi5FdhMMo0qlY1riMTCiXaMC1xw/amBu9a7Uo
 DymoV8vw+jc++8Mxpi/I5D7L+pf9dWaNC29nGWN0N3qrHwsFJvEaZoD+O4wsJP+HXrwAAAA==
X-Change-ID: 20250404-pcie-reset-slot-730bfa71a202
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3553;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=qkB19ebsdB7yF8JrqmDzhAIvjQoXMD7T3mmriNCrqxE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBn/9rVLvxXFkai8cVNkg23+3JBYRdthOY/lxQwa
 fbOegB4XfmJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZ//a1QAKCRBVnxHm/pHO
 9SGRB/40rRHb9fGiMK5kD1aBd/MewJxI5StivHVa5Erzx+HMuFj97jziyHXdpUsz4ffhJ4XQFoQ
 EMKPxKj+ocduRoORbAYIa33SUHBLn9X5/XInHvLBEw/E47p6YBkQDFCSXZOAgZ+9FX0D0Te5tNb
 2CDt7KVi+T2IKCwkbBX+pLkKJfs0hbfGBijN3F6/qNXG/stthtJKfzrFg9VYRmfOjaLGXksNq1d
 OiiXevAEEKFNC81mjU+Y6fQGpvjisAiglcBeql266ba4ZFT+yV17zxaxnd1oV7XdMRq/Nmthza6
 b/hxtehyr4BdSL0Vhz0u0SENUH1/6Tv88cWuux5Xhjrb+IJ7
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

Currently, in the event of AER/DPC, PCI core will try to reset the slot and its
subordinate devices by invoking bridge control reset and FLR. But in some
cases like AER Fatal error, it might be necessary to reset the slots using the
PCI host bridge drivers in a platform specific way (as indicated by the TODO in
the pcie_do_recovery() function in drivers/pci/pcie/err.c). Otherwise, the PCI
link won't be recovered successfully.

So this series adds a new callback 'pci_host_bridge::reset_slot' for the host
bridge drivers to reset the slot when a fatal error happens.

Also, this series allows the host bridge drivers to handle PCI link down event
by resetting the slots and recovering the bus. This is accomplished by the
help of a new API 'pci_host_handle_link_down()'. Host bridge drivers are
expected to call this API (preferrably from a threaded IRQ handler) when a link
down event is detected. The API will reuse the pcie_do_recovery() function to
recover the link if AER support is enabled, otherwise it will directly call the
reset_slot() callback of the host bridge driver (if exists).

For reference, I've modified the pcie-qcom driver to call
pci_host_handle_link_down() after receiving LINK_DOWN global_irq event and
populated the 'pci_host_bridge::reset_slot()' callback to reset the controller
(there by slots). Since the Qcom PCIe controllers support only a single root
port (slot) per controller instance, reset_slot() callback is going to be
invoked only once. For multi root port controllers, this callback is supposed to
identify the slots using the supplied 'pci_dev' pointer and reset them.

NOTE
====

This series is a reworked version of the earlier series [1] that I submitted for
handling PCI link down event. In this series, I've made use of the AER helpers
to recover the link as it allows notifying the device drivers and also
allows saving/restoring the config space.

Testing
=======

This series is tested on Qcom RB5 and SA8775p Ride boards by triggering the link
down event manually by writing to LTSSM register. For the error recovery to
succeed (if AER is enabled), all the drivers in the bridge hierarchy should have
the 'err_handlers' populated. Otherwise, the link recovery will fail.

[1] https://lore.kernel.org/linux-pci/20250221172309.120009-1-manivannan.sadhasivam@linaro.org

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Changes in v2:
- Moved calling reset_slot() callback from pcie_do_recovery() to pcibios_reset_secondary_bus()
- Link to v1: https://lore.kernel.org/r/20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org

---
Manivannan Sadhasivam (4):
      PCI/ERR: Remove misleading TODO regarding kernel panic
      PCI/ERR: Add support for resetting the slots in a platform specific way
      PCI: Add link down handling for host bridges
      PCI: qcom: Add support for resetting the slot due to link down event

 drivers/pci/controller/dwc/pcie-qcom.c | 89 +++++++++++++++++++++++++++++++++-
 drivers/pci/pci.c                      | 12 +++++
 drivers/pci/pci.h                      | 21 ++++++++
 drivers/pci/pcie/err.c                 | 33 ++++++++++---
 drivers/pci/probe.c                    |  7 +++
 include/linux/pci.h                    |  2 +
 6 files changed, 156 insertions(+), 8 deletions(-)
---
base-commit: 08733088b566b58283f0f12fb73f5db6a9a9de30
change-id: 20250404-pcie-reset-slot-730bfa71a202

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>



