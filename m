Return-Path: <linuxppc-dev+bounces-8432-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A43D0AAF45E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 09:11:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtNZW2mNtz2xJ1;
	Thu,  8 May 2025 17:10:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746688243;
	cv=none; b=QLeOld1R96r7rVZYnyF2qZEDxswGoOYiFhFp1aW+Bxdj0ID7buZAgc2pVoiZ0Fr1QR47fAA/Y7b7k/i/qDkEz3NE7VcheEvVC2l6prxOuRXRKw1we1reC3gFma/P9B6d64I/rYUb+8wxvTjZ9MUMcQucEX6BYO0GvION66gjQAUyUvDtrNYj+OuS3QR7SZC4zKffH6KOAJTBr+8Xk1ZwyIrTeobN5b8h+KToQF6LRd30UnmH1zG0abc0WIMBd2aHAhSLGZ/rFNFwj9bSkTsrPl7mKPqSzbXHzwdb0DHlDj6sWU9vbXquxtPFvCRD89fhdY+PWzYgGGS6q+q3r4yRHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746688243; c=relaxed/relaxed;
	bh=ZCXJnaWqE0fAgUs100fVOe2mb9c5kJtvlpY1ACqYb3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZDyCRVD3mSHEVNeSxKrK/hOLM+bqNM2o6URgcuUHs4GD7aATmpFXJ53/GJU1/uHIsRBCVAXtemCEcpriBOWd5kwiXaBI9HszuWf+b4jswUiKkjmrUqCfya4RPCIfLbZvDmmrEhsR16xGwm95ZR1a0uEn0B6O30ggQ8X33cVFeDfnDKbZMSbAvuYs3d9qnZs9QipSZDlmoHgeiji7lTTevLpYZtsyJT6s6LY8LWJ3Riep+lSmDzhIvM/76a8ttsbE9i1pm7ybFj3Bv2A9HopNDxvihgswR1x/iZIKvP0a0Uv7ocf2kwq+Ey5gnBwywYsozFAJtZY8RQVkujV/m1kGmw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=is3JNbK1; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=is3JNbK1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtNZT5b8lz3050
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 17:10:41 +1000 (AEST)
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-39ee682e0ddso507030f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 May 2025 00:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746688238; x=1747293038; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZCXJnaWqE0fAgUs100fVOe2mb9c5kJtvlpY1ACqYb3k=;
        b=is3JNbK1FNR/zVqdTcadHET2evTYeH57luysAxbla5ToxHEqofuuf1nAhpKGgk8DVY
         qnz/HvCiebiWxXz1zRsQD/9i03s26OnK5Lak1jqnJ2xgA9m5Sf6ensL6zTirjLaDtVzU
         RkYMVLfE2tUftBXGn6GZEItW1hweO5vxpKbOLUPfAtAEDT1YKpIVNkHepPrWoi+r2BJb
         k6DkP3gW/z6JBNH4dghrf4nvgz/rwwt4ZHoRpP5mmQQq/mLrhRWgHif+6BfzIUAzi+yr
         fIktr5BsAp6pxwhgA5VzFxRY3d5driCi5iQPO8Zzqf5ICxRm71m3DhmJZ79IvDaFTXu9
         P0bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688238; x=1747293038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZCXJnaWqE0fAgUs100fVOe2mb9c5kJtvlpY1ACqYb3k=;
        b=L1pAzhg45ZoD6Fri5ietA3DQNzFtJvS2zhQhzaR1vo0A9YPEiRbLTLFXKf8hvdA1Cx
         HHfE18uRMssWRfjkh7Kyo1+COpKVNxNRu0+zGv7nTzH6Q4uHEq2e6I7BuUFCVH9wGGDo
         d5khhINHi08RkDNYE56gU+VUT9W5h2dWPouPK/yNJTdfsYWKzKJzorQrJNgVQBDH2JAm
         rU+IbyZdL5QOcN4C6/amwE6OOsI67EUhvPLSVTfcA1oPt7AUuomOlAaCOd9CwLG3hE/k
         mkVKEeT2c0F9gGvSUsLp0IN4E039GJYiFrJrWwj0+VNWMNoe2CKorkEBOoMicMKM+G/1
         Nx7w==
X-Forwarded-Encrypted: i=1; AJvYcCWBtjA0vBoIZNTpdvTd3CD+H/uJrYgLHYIsepcFJwyJe6gdq1hHX6A3I+OyKkYvhA1Eqc7vSaurNQoKh2k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx14Vbncre/RzaB/SkivtFC79nXIv7uxePMV/VGZlUFFkWoLjA/
	YD5YOY9dhDvigBS2J29s0I8un2r+gzIVc+fqzVUIQxzyVkacSpewA/KIMqQYYg==
X-Gm-Gg: ASbGncvidQxDZVb2Oxt1FwUfjBbKWbIuySwwkK0IiXyV2E380pQDhk9ubZq4IwRGTzr
	G7wAVwkQ53Z2hAnNVkq1jY5DNPEaEQNIUb9ZQXsMGe5idgSPl8phSJzNavxOcNAgHb4XQ7NL0mo
	hXpOhswpA4QHuo8e37o0njwM0QkCilaLTFNGS3pl3JYKj7sFuVkGXnITJJarOuIE+b1nKjKU5Fs
	Dl8xwtPq2I33h9cxSHqmPKRZokJXO+sDgI3BUNJhlF/x9vYSaqCBvYzyxSgPClMb00ishVlZ69K
	PmSPTVM/4HrFon27+wYm/+FktNNuoCPdEkUXJhBQ397NyZbpQi9YQBULMqVO4wPgDpAhS4SbLuu
	ySiWgUzyh4bC0LfB7afbXiBzw3HU=
X-Google-Smtp-Source: AGHT+IHV1JSfv4qBQwupY4Va2+Wb9i9D07szr7SibcAfJ9Za0IJyccsIDSZGMhPonRwpb8x04FLbNA==
X-Received: by 2002:a5d:5988:0:b0:39e:e557:7d9 with SMTP id ffacd0b85a97d-3a0b49e9fa9mr4148948f8f.5.1746688238305;
        Thu, 08 May 2025 00:10:38 -0700 (PDT)
Received: from [127.0.1.1] (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b178absm19500236f8f.97.2025.05.08.00.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:10:37 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 08 May 2025 12:40:32 +0530
Subject: [PATCH v4 3/5] PCI: host-common: Make the driver as a common
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-pcie-reset-slot-v4-3-7050093e2b50@linaro.org>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
In-Reply-To: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7440;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=9YTGSyyEjJBWzKcv9X508Ju9+VcoznZB2wd8RCZhBIA=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoHFjp1kFqMhXSTF/eBh/n6fZtF2vM5B0B0c5Ul
 nv49HMJlUuJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaBxY6QAKCRBVnxHm/pHO
 9du0B/sGQkAQ1jOTMZmz5FNWat7V9HdLSW4K3BY3FD4mEBtb8jIpZDNiJTYBb085icKcXYPQ31M
 FICFZzr47/EPEyJr5oHdHiHCT8+qdsDKMOpTy2RdIU+iNDY9GUhOtVFVMU28cHFcQsNAtOKy2kx
 6Qf1JpijCSxiu+KVABIWBz/rhP8pvPTX2kP+U22LEeMkDtoPjU0HsKK9f3VWPQbHlWZlbO8zQtn
 G889qzgpaWL0nyW20O6LrdnY/6FAo53jRjxSzQvt9/ufEIqUyTj51abVn0y2cNfYfLC+v1SLdW7
 HtCcl1pwMCMjjs3Q5IGertLvu1r/cz+TfDDhWWGVtWqkYZCl
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

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
index 0000000000000000000000000000000000000000..d8be024ca68d43afb147fd9104d632b907277144
--- /dev/null
+++ b/drivers/pci/controller/pci-host-common.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Common library for PCI host controller drivers
+ *
+ * Copyright (C) 2014 ARM Limited
+ *
+ * Author: Will Deacon <will.deacon@arm.com>
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


