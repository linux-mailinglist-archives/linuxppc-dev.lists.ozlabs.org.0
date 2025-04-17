Return-Path: <linuxppc-dev+bounces-7752-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E15EEA923BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 19:17:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zdl1S4DPjz3c2L;
	Fri, 18 Apr 2025 03:16:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744910202;
	cv=none; b=l+ZynF5JUGiXWCcOWg2BBBXdC0CNGf5Sur3tAJbRsK97bpRBWDFrTLOpYFsVVvgg4+op8BgzmUqPwi8V4nDKMjrwtUjFageYzF3fPJ7yzjQ/OhY4JYYEWtFsEsNbd9Vi+p2KDxZMgoSDhGjw546jzSVyYw6vGqgpf0zOXb5QH/4i/sCYfB5GA3YbruQYER9DErkvXcJaGzJ+eyc1pCukunLewRM9ypa3JeMZ1aVoW2JTY/Rr3eGgFOPSP3zRRsCvjNtLzP4BKO6R6Ew5ApislmxrEpmUdlMPkBoqXITD7UjUmKL70p56DdU/DWraJzp5G76oNBgneo2ZMiQbND0rsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744910202; c=relaxed/relaxed;
	bh=ifFHvG3hdl7+pcKI69icjTNPXuBs9nIjzkTU5vNm/Bw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nXipRsQXfnx5b1ceuPJ/Wx9ttoG2X87FU+fsdFF4hWL6q1VXipbaLu9yQFF6ZOcBc6iWypgOJZn+WzzG44Qp4mN3s9YLxLGTNbqoDR9FfpxT0l6disjbu5VetgQNjyg9X2ph2t+/EOZgj6LYJ6F5CLbT/dqHtbcp+SxPWtI8AWVbfgo/do0bBOzptX05xubcgip/4qwF8LnOZycAsF+NdoD9WPBlNt7D1469OHpP4gjjjwGIlFUlEU1vWi34A3DHQJTaDw+CwALRLnxK09+Bd7svJIxw5yH22FlnFWp3tnZD1ppeMJ6SPLrL482QIuFlZye28O16xXEW4gIT1sVNwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ctwSy7B8; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.linaro.org@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ctwSy7B8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.linaro.org@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zdl1N4wwRz3c1L
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 03:16:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9D8685C5806;
	Thu, 17 Apr 2025 17:14:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 14678C4CEF0;
	Thu, 17 Apr 2025 17:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744910197;
	bh=v5E+aOtX1b+E5OwEtcvzwlG6BCHoSNdwgBUEf0TStt0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ctwSy7B8nmyoVXDxWs6hs3cFnwafrmay3FmIFjuUX4tXVlTPaUb6SECJCuyZ6m1p4
	 gCqQ+U5tcxB5xcIBEPC5NcUF2HBD8htaxAOxsQctMiJORxCRqnGmpsjVsW/92EeAOd
	 j9GFgWQIR01eXEZMR0kjiyTcZS4WNKvjMsK5BluzGqfuJ0S4zm5riOR2Z0h7dX7wdL
	 Jobb/hH66cizg3Eaez2r8ch3NEpjbTBObP2seHvHFdwaMi7cQw9wUK0VDl2KMgYYr9
	 0IjhrBjybxOokpU+2y1qALbAgtEoQWL2mB3XoeQSXtuURXHPd+s0Hqb6pZczEgOhaz
	 ZTnhb6EWJ8YLA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06DDDC369C9;
	Thu, 17 Apr 2025 17:16:37 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Thu, 17 Apr 2025 22:46:29 +0530
Subject: [PATCH v3 3/5] PCI: host-common: Make the driver as a common
 library for host controller drivers
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
Message-Id: <20250417-pcie-reset-slot-v3-3-59a10811c962@linaro.org>
References: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
In-Reply-To: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
 Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7466;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=K/sPDFj1hecH/GGD3XDJ2CIncZKealVndyMKk1UM77I=;
 b=owGbwMvMwMUYOl/w2b+J574ynlZLYshgNM/fpqvZ+L5CtHvib4WcqW/iGq9cFvty3XjdrHMSM
 Q5s/R12nYzGLAyMXAyyYoos6UudtRo9Tt9YEqE+HWYQKxPIFAYuTgGYyIrjHAxNiles352M92uO
 OjP1m35YeOSWSV77GLewZYXO+1O/KlS3In+LwaTI/5fqLHxLja0FLefO8+PifCu8/vnF63P2ODr
 EH9VXZu1yOs2QHHvZN5ndqv9rmHKX+01BTpXDIgx8nY6uc2bFHzVvWBls9UbNX2jXuYzi+b+3fx
 abMKHDwapNT9kmg/PzMdNS84nf879Vrd3Y1PohItN27t8Vbvs4+c61/M4v95d/6Hluu+/esGt2J
 7StD7IFXprMPVdjb3nd5BKVnfVJpu/1nPY35tmpmC5bOlVQ7+VCUUUtQwGhnw3+tV2/ZkzpTHmo
 HrhH8W9MrGMXm/9dBq5uLcuEmpYPc5XWhn4rlRVLdnwPAA==
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

This common library will be used as a placeholder for helper functions
shared by the host controller drivers. This avoids placing the host
controller drivers specific helpers in drivers/pci/*.c, to avoid enlarging
the kernel Image on platforms that do not use host controller drivers at
all (like x86/ACPI platforms).

Suggested-by: Lukas Wunner <lukas@wunner.de>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/Kconfig                    |  8 ++++----
 drivers/pci/controller/dwc/pcie-hisi.c            |  1 +
 drivers/pci/controller/pci-host-common.c          |  6 ++++--
 drivers/pci/controller/pci-host-common.h          | 16 ++++++++++++++++
 drivers/pci/controller/pci-host-generic.c         |  2 ++
 drivers/pci/controller/pci-thunder-ecam.c         |  2 ++
 drivers/pci/controller/pci-thunder-pem.c          |  1 +
 drivers/pci/controller/pcie-apple.c               |  2 ++
 drivers/pci/controller/plda/pcie-microchip-host.c |  1 +
 include/linux/pci-ecam.h                          |  6 ------
 10 files changed, 33 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 9800b768105402d6dd1ba4b134c2ec23da6e4201..9bb8bf669a807272777b6168d042f8fd7490aeec 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -3,6 +3,10 @@
 menu "PCI controller drivers"
 	depends on PCI
 
+config PCI_HOST_COMMON
+	tristate
+	select PCI_ECAM
+
 config PCI_AARDVARK
 	tristate "Aardvark PCIe controller"
 	depends on (ARCH_MVEBU && ARM64) || COMPILE_TEST
@@ -119,10 +123,6 @@ config PCI_FTPCI100
 	depends on OF
 	default ARCH_GEMINI
 
-config PCI_HOST_COMMON
-	tristate
-	select PCI_ECAM
-
 config PCI_HOST_GENERIC
 	tristate "Generic PCI host controller"
 	depends on OF
diff --git a/drivers/pci/controller/dwc/pcie-hisi.c b/drivers/pci/controller/dwc/pcie-hisi.c
index 8904b5b85ee589576afcb6c81bb4bd39ff960c15..3c17897e56fcb60ec08cf522ee1485f90a2f36a3 100644
--- a/drivers/pci/controller/dwc/pcie-hisi.c
+++ b/drivers/pci/controller/dwc/pcie-hisi.c
@@ -15,6 +15,7 @@
 #include <linux/pci-acpi.h>
 #include <linux/pci-ecam.h>
 #include "../../pci.h"
+#include "../pci-host-common.h"
 
 #if defined(CONFIG_PCI_HISI) || (defined(CONFIG_ACPI) && defined(CONFIG_PCI_QUIRKS))
 
diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index f441bfd6f96a8bde1c07fcf97d43d0693c424a27..f93bc7034e697250711833a5151f7ef177cd62a0 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Generic PCI host driver common code
+ * Common library for PCI host controller drivers
  *
  * Copyright (C) 2014 ARM Limited
  *
@@ -15,6 +15,8 @@
 #include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
 
+#include "pci-host-common.h"
+
 static void gen_pci_unmap_cfg(void *ptr)
 {
 	pci_ecam_free((struct pci_config_window *)ptr);
@@ -94,5 +96,5 @@ void pci_host_common_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(pci_host_common_remove);
 
-MODULE_DESCRIPTION("Generic PCI host common driver");
+MODULE_DESCRIPTION("Common library for PCI host controller drivers");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
new file mode 100644
index 0000000000000000000000000000000000000000..30253ff26e01fb445ecf67b795209e6d0a9ec7c4
--- /dev/null
+++ b/drivers/pci/controller/pci-host-common.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Common library for PCI host controller drivers
+ *
+ * Copyright (C) 2025 Linaro Limited
+ *
+ * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+ */
+
+#ifndef _PCI_HOST_COMMON_H
+#define _PCI_HOST_COMMON_H
+
+int pci_host_common_probe(struct platform_device *pdev);
+void pci_host_common_remove(struct platform_device *pdev);
+
+#endif
diff --git a/drivers/pci/controller/pci-host-generic.c b/drivers/pci/controller/pci-host-generic.c
index 4051b9b61dace669422e5a6453cc9f58a081beb5..c1bc0d34348f44c9fdd549811f637fb50fe89c64 100644
--- a/drivers/pci/controller/pci-host-generic.c
+++ b/drivers/pci/controller/pci-host-generic.c
@@ -14,6 +14,8 @@
 #include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
 
+#include "pci-host-common.h"
+
 static const struct pci_ecam_ops gen_pci_cfg_cam_bus_ops = {
 	.bus_shift	= 16,
 	.pci_ops	= {
diff --git a/drivers/pci/controller/pci-thunder-ecam.c b/drivers/pci/controller/pci-thunder-ecam.c
index 08161065a89c35a95714df935ef437dfc8845697..b5b4a958e6a22b21501cad45bb242a95a784efc1 100644
--- a/drivers/pci/controller/pci-thunder-ecam.c
+++ b/drivers/pci/controller/pci-thunder-ecam.c
@@ -11,6 +11,8 @@
 #include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
 
+#include "pci-host-common.h"
+
 #if defined(CONFIG_PCI_HOST_THUNDER_ECAM) || (defined(CONFIG_ACPI) && defined(CONFIG_PCI_QUIRKS))
 
 static void set_val(u32 v, int where, int size, u32 *val)
diff --git a/drivers/pci/controller/pci-thunder-pem.c b/drivers/pci/controller/pci-thunder-pem.c
index f1bd5de67997cddac173723bc7f4ec20aaf20064..5fa037fb61dc356f3029d1b5cae632ae1da5bb9b 100644
--- a/drivers/pci/controller/pci-thunder-pem.c
+++ b/drivers/pci/controller/pci-thunder-pem.c
@@ -14,6 +14,7 @@
 #include <linux/platform_device.h>
 #include <linux/io-64-nonatomic-lo-hi.h>
 #include "../pci.h"
+#include "pci-host-common.h"
 
 #if defined(CONFIG_PCI_HOST_THUNDER_PEM) || (defined(CONFIG_ACPI) && defined(CONFIG_PCI_QUIRKS))
 
diff --git a/drivers/pci/controller/pcie-apple.c b/drivers/pci/controller/pcie-apple.c
index 18e11b9a7f46479348815c3f706319189e0a80b5..edd4c8c683c6a693401b47f5f056641c13ae89f8 100644
--- a/drivers/pci/controller/pcie-apple.c
+++ b/drivers/pci/controller/pcie-apple.c
@@ -29,6 +29,8 @@
 #include <linux/of_irq.h>
 #include <linux/pci-ecam.h>
 
+#include "pci-host-common.h"
+
 #define CORE_RC_PHYIF_CTL		0x00024
 #define   CORE_RC_PHYIF_CTL_RUN		BIT(0)
 #define CORE_RC_PHYIF_STAT		0x00028
diff --git a/drivers/pci/controller/plda/pcie-microchip-host.c b/drivers/pci/controller/plda/pcie-microchip-host.c
index 3fdfffdf027001bf88df8e1c2538587298228220..24bbf93b8051fa0d9027ce6983eae34cad81065e 100644
--- a/drivers/pci/controller/plda/pcie-microchip-host.c
+++ b/drivers/pci/controller/plda/pcie-microchip-host.c
@@ -23,6 +23,7 @@
 #include <linux/wordpart.h>
 
 #include "../../pci.h"
+#include "../pci-host-common.h"
 #include "pcie-plda.h"
 
 #define MC_MAX_NUM_INBOUND_WINDOWS		8
diff --git a/include/linux/pci-ecam.h b/include/linux/pci-ecam.h
index 3a10f8cfc3ad5c90585a8fc971be714011ed18fe..d930651473b4d0b406e657a24ede87e09517d091 100644
--- a/include/linux/pci-ecam.h
+++ b/include/linux/pci-ecam.h
@@ -93,10 +93,4 @@ extern const struct pci_ecam_ops al_pcie_ops;	/* Amazon Annapurna Labs PCIe */
 extern const struct pci_ecam_ops tegra194_pcie_ops; /* Tegra194 PCIe */
 extern const struct pci_ecam_ops loongson_pci_ecam_ops; /* Loongson PCIe */
 #endif
-
-#if IS_ENABLED(CONFIG_PCI_HOST_COMMON)
-/* for DT-based PCI controllers that support ECAM */
-int pci_host_common_probe(struct platform_device *pdev);
-void pci_host_common_remove(struct platform_device *pdev);
-#endif
 #endif

-- 
2.43.0



