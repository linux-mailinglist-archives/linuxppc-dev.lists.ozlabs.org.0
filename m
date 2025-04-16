Return-Path: <linuxppc-dev+bounces-7702-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9337DA908FA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 18:29:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zd61F0Qyxz3bpp;
	Thu, 17 Apr 2025 02:29:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744820960;
	cv=none; b=P0jykxS4TOyHGzKeiBNWFdrcNF5uCWB1AFipilqMU67++n1VnyU/iyHYqJApNX3TBoFk9V1Jz/QSbAVHEHeFkr7q//Ej70tBAM3P5ocRc2+67M1eW2hf10Nd2fEzYfuvjW9DALIpBIdE9ZVa/DCpgjrMWbZZGtwV3y4u4KB/Q8iS7wWPwFBs98KfiJjFwcdBpm+wF8r5z0HiZwVA1nl4dIDhtGry+muDyWDOAke213m4WQyNKUCxXpx4mDEonj5gu5jfR4OzyAGNSxvDb/smCEker5aZx0soe6DrRU50b1SWTVjrfdhAnyOLdJ2lNC/SkHSHHxMYX64SI1YyqGs9Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744820960; c=relaxed/relaxed;
	bh=iM6AQu8ELvmnTP0jMxmYu2ocH30v0M5gCGUb1IH5iow=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZDocDl7iZ0mJBqWEyITQ8gLPQWKcVlXkyoPBdU2sh6zRjZLK1lm59HklICxmDNsljAziDaQG7agGI8hivnBi98kcnrcbAMRvcnWPAIlsqYaOliR6P4nzhUF9KmA8M90qxHgKTfhIIlVDRsCLvHVeR0cfhzZRHxPlBpuS7lFs7pdO1rWDtot1T8bZKzG3tLzQO2mMrwxPCa3bhHBVGjvhVaNWNA3zLbQ3WYYqTNQET1h9U0+JgVlwqqH4Y06IOGw1QGvuFV4l/zZ0UnOOhu4p05g2PpEzofas2d1Of8sj+t8Z7/KNVqEE1WTKN1vzw31jQaVtVWRlxHyZAlYPfx39EA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=crB2dKg/; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.linaro.org@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=crB2dKg/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.linaro.org@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zd61C0vjhz3bsd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 02:29:18 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C2F7C5C4A53;
	Wed, 16 Apr 2025 16:26:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 755D4C4CEF1;
	Wed, 16 Apr 2025 16:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744820955;
	bh=VVNtNqLbvtE8kexzLh9DxK8ugOPeqCM3+F4GjZ9t2SI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=crB2dKg/c9rH0KjDGvpkiMspMeAitcPRNeS3hjCDevr3e9ZPuYh7gLQF6YKMz+YnV
	 jnU1e5AWsVgnxjshhw5TE9x26/NxsbMFT0/W+KlWJDs2I3aQzQM/gJFX08CdUuCALJ
	 uIXPmk/g291gSg+APdGmkAQFgrXg3SWQ5+aerYKhOMohv2zZRAWL/nPIMitf5Xo2zO
	 4KjguVMRXfGv9sN4pceagq0JI1FiT4jIBfd6/aT/iVYYqr0tLGeCmsqq5dSTEeVxZU
	 cFObGK7/gCHIXrPSM4NHLTpBWrLYNKGFhEVAPiFWyEKYzX1xsnKJusQXFFCtBNyQWO
	 eCyrLOCmXR4kQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686DBC369C4;
	Wed, 16 Apr 2025 16:29:15 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Date: Wed, 16 Apr 2025 21:59:06 +0530
Subject: [PATCH v2 4/4] PCI: qcom: Add support for resetting the slot due
 to link down event
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
Message-Id: <20250416-pcie-reset-slot-v2-4-efe76b278c10@linaro.org>
References: <20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org>
In-Reply-To: <20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6126;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=u/UvQ7QZOIYDpjR36le74CWa9kFm5T00hOF6YTv343I=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBn/9rYJo2pzHO0PJSZIFRclRPwqiYKcpVt0WcD1
 30o9+sLpDyJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZ//a2AAKCRBVnxHm/pHO
 9QARB/9ByY8CCpO1DLSOJaeQ+13Fx1JKIuFwhuKvwb2W3Kjfngd6gYA+zC6FiE+8CAyJ2GUBurV
 ix/qLs4RJXZ9xIm6CjiqjDBC5iGzo69HghE3H7Bjzive33tcLbmofsRF1Y/QqvbYzDPIXuLi9vz
 lZ30ZpTrB1pJgQEapz9yPtRf29gGLtnLHX9UAHJKSalv1o22GavTdvTnaRNIdZVe55ZbXzv4kK0
 fIOerpBMmwHr2F+s6fpEhKpMyxOIDo//7UEuTy5eagf62kl7b61DBkJqSiAqrU06c4b1xF9yfF7
 9oTsO7BKKOP9fnV99atYQOOwKyYJP6IdqcTYOInEwdgHQ3i1
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

The PCIe link can go down under circumstances such as the device firmware
crash, link instability, etc... When that happens, the PCIe slot needs to
be reset to make it operational again. Currently, the driver is not
handling the link down event, due to which the users have to restart the
machine to make PCIe link operational again. So fix it by detecting the
link down event and resetting the slot.

Since the Qcom PCIe controllers report the link down event through the
'global' IRQ, enable the link down event by setting PARF_INT_ALL_LINK_DOWN
bit in PARF_INT_ALL_MASK register.

Then in the case of the event, call pci_host_handle_link_down() API
in the handler to let the PCI core handle the link down condition.

The API will internally call, 'pci_host_bridge::reset_slot()' callback to
reset the slot in a platform specific way. So implement the callback to
reset the slot by first resetting the PCIe core, followed by reinitializing
the resources and then finally starting the link again.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 89 +++++++++++++++++++++++++++++++++-
 1 file changed, 87 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index dc98ae63362db0422384b1879a2b9a7dc564d091..b0df108fb4f3c6a8b8290062ecb3e1c5c34ddd4c 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -55,6 +55,7 @@
 #define PARF_INT_ALL_STATUS			0x224
 #define PARF_INT_ALL_CLEAR			0x228
 #define PARF_INT_ALL_MASK			0x22c
+#define PARF_STATUS				0x230
 #define PARF_SID_OFFSET				0x234
 #define PARF_BDF_TRANSLATE_CFG			0x24c
 #define PARF_DBI_BASE_ADDR_V2			0x350
@@ -130,8 +131,11 @@
 
 /* PARF_LTSSM register fields */
 #define LTSSM_EN				BIT(8)
+#define SW_CLEAR_FLUSH_MODE			BIT(10)
+#define FLUSH_MODE				BIT(11)
 
 /* PARF_INT_ALL_{STATUS/CLEAR/MASK} register fields */
+#define PARF_INT_ALL_LINK_DOWN			BIT(1)
 #define PARF_INT_ALL_LINK_UP			BIT(13)
 #define PARF_INT_MSI_DEV_0_7			GENMASK(30, 23)
 
@@ -145,6 +149,9 @@
 /* PARF_BDF_TO_SID_CFG fields */
 #define BDF_TO_SID_BYPASS			BIT(0)
 
+/* PARF_STATUS fields */
+#define FLUSH_COMPLETED				BIT(8)
+
 /* ELBI_SYS_CTRL register fields */
 #define ELBI_SYS_CTRL_LT_ENABLE			BIT(0)
 
@@ -169,6 +176,7 @@
 						PCIE_CAP_SLOT_POWER_LIMIT_SCALE)
 
 #define PERST_DELAY_US				1000
+#define FLUSH_TIMEOUT_US			100
 
 #define QCOM_PCIE_CRC8_POLYNOMIAL		(BIT(2) | BIT(1) | BIT(0))
 
@@ -274,11 +282,14 @@ struct qcom_pcie {
 	struct icc_path *icc_cpu;
 	const struct qcom_pcie_cfg *cfg;
 	struct dentry *debugfs;
+	int global_irq;
 	bool suspended;
 	bool use_pm_opp;
 };
 
 #define to_qcom_pcie(x)		dev_get_drvdata((x)->dev)
+static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
+				  struct pci_dev *pdev);
 
 static void qcom_ep_reset_assert(struct qcom_pcie *pcie)
 {
@@ -1263,6 +1274,8 @@ static int qcom_pcie_host_init(struct dw_pcie_rp *pp)
 			goto err_assert_reset;
 	}
 
+	pp->bridge->reset_slot = qcom_pcie_reset_slot;
+
 	return 0;
 
 err_assert_reset:
@@ -1300,6 +1313,73 @@ static const struct dw_pcie_host_ops qcom_pcie_dw_ops = {
 	.post_init	= qcom_pcie_host_post_init,
 };
 
+static int qcom_pcie_reset_slot(struct pci_host_bridge *bridge,
+				  struct pci_dev *pdev)
+{
+	struct pci_bus *bus = bridge->bus;
+	struct dw_pcie_rp *pp = bus->sysdata;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct qcom_pcie *pcie = to_qcom_pcie(pci);
+	struct device *dev = pcie->pci->dev;
+	u32 val;
+	int ret;
+
+	/* Wait for the pending transactions to be completed */
+	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_STATUS, val,
+					 val & FLUSH_COMPLETED, 10,
+					 FLUSH_TIMEOUT_US);
+	if (ret) {
+		dev_err(dev, "Flush completion failed: %d\n", ret);
+		goto err_host_deinit;
+	}
+
+	/* Clear the FLUSH_MODE to allow the core to be reset */
+	val = readl(pcie->parf + PARF_LTSSM);
+	val |= SW_CLEAR_FLUSH_MODE;
+	writel(val, pcie->parf + PARF_LTSSM);
+
+	/* Wait for the FLUSH_MODE to clear */
+	ret = readl_relaxed_poll_timeout(pcie->parf + PARF_LTSSM, val,
+					 !(val & FLUSH_MODE), 10,
+					 FLUSH_TIMEOUT_US);
+	if (ret) {
+		dev_err(dev, "Flush mode clear failed: %d\n", ret);
+		goto err_host_deinit;
+	}
+
+	qcom_pcie_host_deinit(pp);
+
+	ret = qcom_pcie_host_init(pp);
+	if (ret) {
+		dev_err(dev, "Host init failed\n");
+		return ret;
+	}
+
+	ret = dw_pcie_setup_rc(pp);
+	if (ret)
+		goto err_host_deinit;
+
+	/*
+	 * Re-enable global IRQ events as the PARF_INT_ALL_MASK register is
+	 * non-sticky.
+	 */
+	if (pcie->global_irq)
+		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_ALL_LINK_DOWN |
+			       PARF_INT_MSI_DEV_0_7, pcie->parf + PARF_INT_ALL_MASK);
+
+	qcom_pcie_start_link(pci);
+	dw_pcie_wait_for_link(pci);
+
+	dev_dbg(dev, "Slot reset completed\n");
+
+	return 0;
+
+err_host_deinit:
+	qcom_pcie_host_deinit(pp);
+
+	return ret;
+}
+
 /* Qcom IP rev.: 2.1.0	Synopsys IP rev.: 4.01a */
 static const struct qcom_pcie_ops ops_2_1_0 = {
 	.get_resources = qcom_pcie_get_resources_2_1_0,
@@ -1571,6 +1651,9 @@ static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
 		pci_unlock_rescan_remove();
 
 		qcom_pcie_icc_opp_update(pcie);
+	} else if (FIELD_GET(PARF_INT_ALL_LINK_DOWN, status)) {
+		dev_dbg(dev, "Received Link down event\n");
+		pci_host_handle_link_down(pp->bridge);
 	} else {
 		dev_WARN_ONCE(dev, 1, "Received unknown event. INT_STATUS: 0x%08x\n",
 			      status);
@@ -1732,8 +1815,10 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 			goto err_host_deinit;
 		}
 
-		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_MSI_DEV_0_7,
-			       pcie->parf + PARF_INT_ALL_MASK);
+		writel_relaxed(PARF_INT_ALL_LINK_UP | PARF_INT_ALL_LINK_DOWN |
+			       PARF_INT_MSI_DEV_0_7, pcie->parf + PARF_INT_ALL_MASK);
+
+		pcie->global_irq = irq;
 	}
 
 	qcom_pcie_icc_opp_update(pcie);

-- 
2.43.0



