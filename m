Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3D587B8ED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 08:52:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FuIABJBe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwKNv2m9tz3vkq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 18:52:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FuIABJBe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwKJy2lc2z3dTw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 18:49:22 +1100 (AEDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6e6cb0f782bso400712b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 00:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710402560; x=1711007360; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESlUf6Tb8Sm/rW4Mp2Hu3vGGr3y8fch0rbkMlMxrb2c=;
        b=FuIABJBe+voONkFwf0z8rREnA5wCr0grhGtrhZjdGJvgEkuiYL+wPw3Uvdo0IQ8rdt
         vwmEmBTsscOJWxTUMJ5S2xBSzZhegDBiZ5ynEyd4NkrdHEocnVD9DYnx8UpLl5Wg3E3v
         J1XdFTF1Uy+SwSQvzu1noGQpF9TOIJNPX33YA4YdNnxt8qK+RxVrS7Itdebxr7pycxjv
         8FQuC1EqeOFK5i9zQaR6vbWcYuU+uN1nLmsb3yWoeez2AIOlhmHec8F01eIbekNNmdhQ
         Xvc3NVbT0DVhQU9OvyPVhoAMAG0rMgPil/6atWYGlUHKw/YVzZnBdRVdzNoE92jC13/H
         gwDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710402560; x=1711007360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESlUf6Tb8Sm/rW4Mp2Hu3vGGr3y8fch0rbkMlMxrb2c=;
        b=kR4eTi+VZqxuhC3nnwrwVkFc3IgUtmbq3rFDTEt/ayWJRu8lH1by7PmxTQPOzDagy4
         3CMeXIySPAUKfjQfyRWz2hFubItFhJkG5Gith3W49IBicY45EUqtEUXwUFD5+d9lT4QF
         rh5khNK/Wj7T5O3z628ezxnouzarAnZby+hKkuYUJ2s5EHuKzFHTUuw9Z71Sh8ssdJLd
         cWypOelEMufdHKOhuwdqoc4UxX0fwLmde/qbR8EPE6bgn+M5K5jKFrUUMhWhCa8rG5dM
         rn2rS0JOs0tUVaJgI63ncmdhXQeOo+H/wZGl0Yb1Eao8RFW0oDwrltIfDWkXHnuaoPeN
         F6Pw==
X-Forwarded-Encrypted: i=1; AJvYcCU1qQ4IQZx0R5Nj9yaSaqbkZHj4wn2uP0qdj3c5iVLz4alXizfQomlatE93bLG5hCGKdftFegT5fbP6KcZpw2KtwLC1DrqkSJmx34zHJg==
X-Gm-Message-State: AOJu0Yy1GzyS3nigDR5zWMyq1/ADGSUlYyL6zWqiCq3oWF9gourf9w3t
	QFI5BS469ZgwA6eK9HXntyoYOzxIOdN9sPsN8/MjTnspVxBchLck3bM+1OgQXw==
X-Google-Smtp-Source: AGHT+IEKswWdphtTPJ4HcqEk2fhjYUb20veQMIQPkNeooGY2W1+++rGKjrQVD7nsT+n6PVQWl9ipyg==
X-Received: by 2002:a05:6a20:ce4c:b0:1a0:fcf5:c931 with SMTP id id12-20020a056a20ce4c00b001a0fcf5c931mr1425804pzb.29.1710402559843;
        Thu, 14 Mar 2024 00:49:19 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.30.211])
        by smtp.gmail.com with ESMTPSA id l9-20020a170903120900b001dd4fabf695sm946321plh.38.2024.03.14.00.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 00:49:19 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Thu, 14 Mar 2024 13:18:03 +0530
Subject: [PATCH v10 5/8] PCI: dwc: ep: Introduce dw_pcie_ep_cleanup() API
 for drivers supporting PERST#
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240314-pci-dbi-rework-v10-5-14a45c5a938e@linaro.org>
References: <20240314-pci-dbi-rework-v10-0-14a45c5a938e@linaro.org>
In-Reply-To: <20240314-pci-dbi-rework-v10-0-14a45c5a938e@linaro.org>
To: Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
 Roy Zang <roy.zang@nxp.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Srikanth Thokala <srikanth.thokala@intel.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4250;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=imNUy+f7eKE6KAlrBpk8JwGpYkEF4zA5IlOifIZB9Hs=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl8qvDNh9SoNQS7cCRqGiggvD+IxFKqux+H5pE4
 aNIO/Bun6WJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZfKrwwAKCRBVnxHm/pHO
 9QbwB/9IPw0cbRyNEQBGZFD+88QKUklHkJ/Q0V8R5oOp3iToag0Ul6YZsg1J3cyv8cdlU05yQFK
 nMe8mzxyjLeNS2V5Dq5wp58OvhMVogisL52A9q6Rzss373950T9/uvNOBFirkSpKUCi2DxK29Bp
 wRlSc6nAaZMuRWC6sbXUZDhRTqr8k/NXJ0b+3AW8l7IaDUb8J32OnsY/7nOqqxQSpFaqkDBOJVb
 lz1CKHwq0JEs9fjYSl1fBXISGY8a5Uabg+hWQ6xBE4O2+ZegzcOe7evzGuhyWpwSUT0QkvfCQOM
 G4Ye13hO2ZQxBiD6n6BOtCk4kp1aUUr1SjHSMLmNPolQy6hu
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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
Cc: linux-pci@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com, linux-renesas-soc@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For DWC glue drivers supporting PERST# (currently Qcom and Tegra194), some
of the DWC resources like eDMA should be cleaned up during the PERST#
assert time.

So let's introduce a dw_pcie_ep_cleanup() API that could be called by these
drivers to cleanup the DWC specific resources. Currently, it just removes
eDMA.

Reported-by: Niklas Cassel <cassel@kernel.org>
Closes: https://lore.kernel.org/linux-pci/ZWYmX8Y%2F7Q9WMxES@x1-carbon
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 19 +++++++++++++++++--
 drivers/pci/controller/dwc/pcie-designware.h    |  5 +++++
 drivers/pci/controller/dwc/pcie-qcom-ep.c       |  1 +
 drivers/pci/controller/dwc/pcie-tegra194.c      |  2 ++
 4 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index fa7b26da8718..4c21a38245b6 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -618,6 +618,22 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
+/**
+ * dw_pcie_ep_cleanup - Cleanup DWC EP resources after fundamental reset
+ * @ep: DWC EP device
+ *
+ * Cleans up the DWC EP specific resources like eDMA etc... after fundamental
+ * reset like PERST#. Note that this API is only applicable for drivers
+ * supporting PERST# or any other methods of fundamental reset.
+ */
+void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
+
+	dw_pcie_edma_remove(pci);
+}
+EXPORT_SYMBOL_GPL(dw_pcie_ep_cleanup);
+
 /**
  * dw_pcie_ep_deinit - Deinitialize the endpoint device
  * @ep: DWC EP device
@@ -627,10 +643,9 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
  */
 void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
-	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct pci_epc *epc = ep->epc;
 
-	dw_pcie_edma_remove(pci);
+	dw_pcie_ep_cleanup(ep);
 
 	pci_epc_mem_free_addr(epc, ep->msi_mem_phys, ep->msi_mem,
 			      epc->mem->window.page_size);
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 61465203bb60..351d2fe3ea4d 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -672,6 +672,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep);
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
 void dw_pcie_ep_deinit(struct dw_pcie_ep *ep);
+void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep);
 int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no);
 int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 			     u8 interrupt_num);
@@ -705,6 +706,10 @@ static inline void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 }
 
+static inline void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
+{
+}
+
 static inline int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no)
 {
 	return 0;
diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 36e5e80cd22f..59b1c0110288 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -507,6 +507,7 @@ static void qcom_pcie_perst_assert(struct dw_pcie *pci)
 		return;
 	}
 
+	dw_pcie_ep_cleanup(&pci->ep);
 	qcom_pcie_disable_resources(pcie_ep);
 	pcie_ep->link_status = QCOM_PCIE_EP_LINK_DISABLED;
 }
diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 7afa9e9aabe2..68bfeed3429b 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -1715,6 +1715,8 @@ static void pex_ep_event_pex_rst_assert(struct tegra_pcie_dw *pcie)
 	if (ret)
 		dev_err(pcie->dev, "Failed to go Detect state: %d\n", ret);
 
+	dw_pcie_ep_cleanup(&pcie->pci.ep);
+
 	reset_control_assert(pcie->core_rst);
 
 	tegra_pcie_disable_phy(pcie);

-- 
2.25.1

