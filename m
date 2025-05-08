Return-Path: <linuxppc-dev+bounces-8433-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1556AAF460
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 09:11:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtNZX35bVz3050;
	Thu,  8 May 2025 17:10:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746688244;
	cv=none; b=jXj4IT1C9bZrweAP/Qkf+hqt75y2x6CwUNhZjK8FDDfCeD80C07SyRbHuw3r2uKfLNs2vwmSA0C2gSxMryOqX7xFsfhNfKtsN5QSgk+Dzhk6v1ukYqn3pLaIc4oFVJkaJnzLmXXH49hK8/xKOjElNUZFQhZkz5uLuobTzXEptO5tCjOtMf30bmETl9XdAjF78r6drpDOXgGzxzIeMnRCmznyvFJZnfFYpMzpLchxsCxZcjJWhs1evhtqGWLzsgRLI4OBjHthwxuOZngxHDwhvNCUJvwwk16NkZNECSzNPU2DUszF6flv1WDw+H6cYSrLQE8ljRLfQQAwRDOmphtVsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746688244; c=relaxed/relaxed;
	bh=ANtxwEr6laRS33/pxu2Fx1NdTAnqeBmRbC8AgVjEito=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lY4kn1P0tIMnAEYgD2+MtrkZWlmXpm+kzouYG91SehZG3DgH0h0ggzLURaZTAOmgheYrCSit4zbwTHPOV+jKDHz76sKU7lCvaNl4EA9Tuq9HSx7/gXz6GiGsqfC+AC+w2vAgk35+iOM4QYQXN0Ymc6hcDjVhcY/As1Q0NJJ5Cc1VfdHhu7oI57pv2johNJxOKXwy2Z3KRbPd7E26n69x1PvyEpwwJHa0U6658JGT5F+i9ZmkadUdTK3fcqkIMoK+9YK1JOLNhHoOodWJgDLWeGzbEcBoXerg99x65t/HdhNaujGW+1QrGzM8gBJWMIyG7XZ80EO9suyTKw5m0xRs7w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=reSfD+JM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=reSfD+JM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtNZV5rFxz30VR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 17:10:42 +1000 (AEST)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso3735945e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 May 2025 00:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746688239; x=1747293039; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ANtxwEr6laRS33/pxu2Fx1NdTAnqeBmRbC8AgVjEito=;
        b=reSfD+JMtHG3kpwjk1esqDGGa93L0oZT0LIp1qn3YLdC6Afh/iMLMBYaWsumwprHB2
         V0iICizj48fkyHx+2mdU4XUX6cGWLP1x67WbJnlwdH+nsdPd74ChQsIR0hAujo7S0ePY
         8AZFNW9fXm0E8VecZDEJVfYHEGTaEsv/fcvMBtNU2lVnTfn3bIU9J4l6Mgv8tHyAqpKc
         QyGzccUUbWneJx5zIUO1Zzej5tmtsicx7pGe+bbZejvMiHBlqApzweWovr6DSBs730Ka
         iSXwOth7I+pNAD+XjyAzi+BNzF5iO3RiHXMoMe9Y44KP9ZfD/iRab6Zt1N7J6fzPkJW3
         C/Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688239; x=1747293039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANtxwEr6laRS33/pxu2Fx1NdTAnqeBmRbC8AgVjEito=;
        b=nzoFpE2YT1AQ2bc+ip+nP1UPtRNWrr7roaKrlbDn0pM4On5OlbLNVboO8uBMiwi3dV
         eQmNN7aPEhInpHZhdSniNmTTRi7gwpYL+qH58R6nJC5QbdvN6m4YtW+o7RW2OuGjdAhw
         tbapmv9vbVTYBjQq0TzvsUm0zzYpkkKrHE+DD+eYidtfo24vK93Wlc/MAPDYeiKbn6jX
         U53qAEItFdS5/Sff+BhXT2gpmIKnHCb8WiqZs88C7eUfXG+7Qc2pLXBrTLDE/GjM1iw2
         XiH3VHrchViNAVyEPeH4jb0y+h2R47Ou1AbJTc7+lCkHQA9hh4Y3MlpqGcnypbAt5juO
         2QPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlMjE0EtxVDXTmEwTj2N0t7Emn5RLFGRsTXxx57nTNsbQ8gM5MXX0HTg+cxUrDF3cjpBqdy1wFA7L+0YQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyawZttgIvCiYQHiJ7ga5f2N0gMsfMe4uJtAMxzxc7/RTsg2P7H
	tf4+1+4zXuLbKLq9xdXK3DdmOtLy1C46TwLRBB7VEnr6iRqoaCGEHPVs2whTxQ==
X-Gm-Gg: ASbGncur7PwRVvZMLDTq9q+oJwlF8GFyHYYcbKOtRm0+aUZF10R2mFJ8fwrshDH7KqV
	V7qfSYV07syp4npjbBWvANiuR62jGrLb+2mxZD1nxYJc4dcCYj5uuF37pZvEHqhGJJThYOuKtnJ
	JRUAb8D6C84fAR6+8zpj6FDexwIiSMfJxgub3USpjDfCK0k6MOzdAIym/b/6hIFG36mnTHdjCyo
	QapDnKcpB79rJ8u6R6AC5l1oj+IWL0ZHpYxxMWym2y+njA+Z8KIHqtwp9/NLgdwfgIWLUuNflv6
	QuKLIaWnGrnfnH1nzVxfP6y3L0hWhWF4Ma4+suaLmOcjbn2PGds7GnDHeHNouELVTnYXDJ662V2
	T+U1fv37u2FcpFFhxpXGZJ5DSliU=
X-Google-Smtp-Source: AGHT+IEzLeXl64VuG3LDBY0EBEtsib+I2DE0INi6/ZnHENyuUXbkLuxvlx2tOJR3jgevvW/m5m9a1A==
X-Received: by 2002:a05:600c:5111:b0:440:68db:9fef with SMTP id 5b1f17b1804b1-442d034ad4fmr13925925e9.20.1746688239310;
        Thu, 08 May 2025 00:10:39 -0700 (PDT)
Received: from [127.0.1.1] (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b178absm19500236f8f.97.2025.05.08.00.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:10:38 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 08 May 2025 12:40:33 +0530
Subject: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
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
Message-Id: <20250508-pcie-reset-slot-v4-4-7050093e2b50@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5013;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=3LL1EMi315Z/B5zK3zsxrKW113WDL+SEaQ+1pl/P2Rg=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoHFjpL07zvpNmz80RZq+CJ23rDNKQ4rbWHFYvk
 WEYaovGi+WJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaBxY6QAKCRBVnxHm/pHO
 9TldB/0enq4tJZ2uTvuG8JYQU+8hIIEyWbBv64ohIiJ9BqvlzzpZxAmt8uyb0qahy2kubec5Boj
 avyvEzax3nAwi5ldUbHq7FXTSTXx8LCRlABHPcw9wmG91cGx16OfkgnM3FUKgIfEO9YVsD65aVW
 hB3ecw9FGLzTLX/x2ywNimLi3H2pQK5LFPgsfYyWd54qJ+oWgFNzT/OXKVDjzrgDDKMskxj2P7p
 QJ7/UAOOlUhxcSmCfawGsRN43aCRDBvW4uO0c6YViOIz/cfYgfrAhcmXt/ge3QP0PbwEGZvqfe+
 bAfEPRFBQTvnwJgd3CK6yQ8dGSbCpx4cQgfIduSe8Ne8/aEQ
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The PCI link, when down, needs to be recovered to bring it back. But that
cannot be done in a generic way as link recovery procedure is specific to
host bridges. So add a new API pci_host_handle_link_down() that could be
called by the host bridge drivers when the link goes down.

The API will iterate through all the slots and calls the pcie_do_recovery()
function with 'pci_channel_io_frozen' as the state. This will result in the
execution of the AER Fatal error handling code. Since the link down
recovery is pretty much the same as AER Fatal error handling,
pcie_do_recovery() helper is reused here. First the AER error_detected
callback will be triggered for the bridge and the downstream devices. Then,
pci_host_reset_slot() will be called for the slot, which will reset the
slot using 'reset_slot' callback to recover the link. Once that's done,
resume message will be broadcasted to the bridge and the downstream devices
indicating successful link recovery.

In case if the AER support is not enabled in the kernel, only
pci_bus_error_reset() will be called for each slots as there is no way we
could inform the drivers about link recovery.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/pci-host-common.c | 58 ++++++++++++++++++++++++++++++++
 drivers/pci/controller/pci-host-common.h |  1 +
 drivers/pci/pci.c                        |  1 +
 drivers/pci/pcie/err.c                   |  1 +
 4 files changed, 61 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index f93bc7034e697250711833a5151f7ef177cd62a0..f916f0a874a61ddfbfd99f96975c00fb66dd224c 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -12,9 +12,11 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_pci.h>
+#include <linux/pci.h>
 #include <linux/pci-ecam.h>
 #include <linux/platform_device.h>
 
+#include "../pci.h"
 #include "pci-host-common.h"
 
 static void gen_pci_unmap_cfg(void *ptr)
@@ -96,5 +98,61 @@ void pci_host_common_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(pci_host_common_remove);
 
+#if IS_ENABLED(CONFIG_PCIEAER)
+static pci_ers_result_t pci_host_reset_slot(struct pci_dev *dev)
+{
+	int ret;
+
+	ret = pci_bus_error_reset(dev);
+	if (ret) {
+		pci_err(dev, "Failed to reset slot: %d\n", ret);
+		return PCI_ERS_RESULT_DISCONNECT;
+	}
+
+	pci_info(dev, "Slot has been reset\n");
+
+	return PCI_ERS_RESULT_RECOVERED;
+}
+
+static void pci_host_recover_slots(struct pci_host_bridge *host)
+{
+	struct pci_bus *bus = host->bus;
+	struct pci_dev *dev;
+
+	for_each_pci_bridge(dev, bus) {
+		if (!pci_is_root_bus(bus))
+			continue;
+
+		pcie_do_recovery(dev, pci_channel_io_frozen,
+				 pci_host_reset_slot);
+	}
+}
+#else
+static void pci_host_recover_slots(struct pci_host_bridge *host)
+{
+	struct pci_bus *bus = host->bus;
+	struct pci_dev *dev;
+	int ret;
+
+	for_each_pci_bridge(dev, bus) {
+		if (!pci_is_root_bus(bus))
+			continue;
+
+		ret = pci_bus_error_reset(dev);
+		if (ret)
+			pci_err(dev, "Failed to reset slot: %d\n", ret);
+		else
+			pci_info(dev, "Slot has been reset\n");
+	}
+}
+#endif
+
+void pci_host_handle_link_down(struct pci_host_bridge *bridge)
+{
+	dev_info(&bridge->dev, "Recovering slots due to Link Down\n");
+	pci_host_recover_slots(bridge);
+}
+EXPORT_SYMBOL_GPL(pci_host_handle_link_down);
+
 MODULE_DESCRIPTION("Common library for PCI host controller drivers");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
index d8be024ca68d43afb147fd9104d632b907277144..904698c1a2695888a0fc9c2fac360e456116eb1d 100644
--- a/drivers/pci/controller/pci-host-common.h
+++ b/drivers/pci/controller/pci-host-common.h
@@ -12,5 +12,6 @@
 
 int pci_host_common_probe(struct platform_device *pdev);
 void pci_host_common_remove(struct platform_device *pdev);
+void pci_host_handle_link_down(struct pci_host_bridge *bridge);
 
 #endif
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 13709bb898a967968540826a2b7ee8ade6b7e082..4d396bbab4a8f33cae0ffe8982da120a9f1d92c9 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -5781,6 +5781,7 @@ int pci_bus_error_reset(struct pci_dev *bridge)
 	mutex_unlock(&pci_slot_mutex);
 	return pci_bus_reset(bridge->subordinate, PCI_RESET_DO_RESET);
 }
+EXPORT_SYMBOL_GPL(pci_bus_error_reset);
 
 /**
  * pci_probe_reset_bus - probe whether a PCI bus can be reset
diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index b834fc0d705938540d3d7d3d8739770c09fe7cf1..3e3084bb7cb7fa06b526e6fab60e77927aba0ad0 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -270,3 +270,4 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 
 	return status;
 }
+EXPORT_SYMBOL_GPL(pcie_do_recovery);

-- 
2.43.0


