Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FADA862337
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 07:57:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bUTUq6+5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Thd3v0fLKz3vb6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 17:57:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=bUTUq6+5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Thd0s5ZnDz3vYB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Feb 2024 17:54:53 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5ca29c131ebso1233767a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 22:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708757691; x=1709362491; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gm7BOWCebEzto6pQtqllLk3GIjiAQNALfrviMiZ/ywU=;
        b=bUTUq6+5SdRS7ahtk65XNLHL8XbsfTkiOg0gPD/n3Y/e16bQOB4WAnEwA0aAJu39uk
         rM0ULbl/DBkETH92iL5LfA/5wc/tKlPg/e/Ra7L3WB6DfQ3tqxksexBbfP5SmzaDhMl1
         +8vSapazcx2dGrrqGlu8Skxe0dODQHS8FkCuCdSuR/qslOD52SpV8WCLSDBOn9mTk4Yg
         QBJHEf/LdskMVCnBi3GaDdrK2zJULfdBlZJjkff3/0uNEhiJ7H3YSMjq8A1jpit0fnb8
         fgqpbEtSiKVWmPLgmCBp5wx0XPBCyzSlpDrZUqoevnWrIfYif9M04gTH4mPSGcgZy+Hq
         wcAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708757691; x=1709362491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gm7BOWCebEzto6pQtqllLk3GIjiAQNALfrviMiZ/ywU=;
        b=l3VKEcylsaTbZJ0+r6EBzbM5aVjQaSfjDQYMmG3t4EAe7L9m0Sam8B/zLF8VC/bC6f
         3AOBjNsTUOW89uIY1CvNWkMPg3BLl2G76M8cYsT/ukUQnuR4lDPV74ouCbiyD2okoPE+
         N1PHWT09SoFiQhjDTPHLVSxA0D8lTKK8ignzttkmWk5L8E6K6VZETgWXCx2OEHnBDxNK
         G0o+NZaDVwcwqu2Za3MDAXgLZb6vB25Skow9dsUV2KsEn4Um4OWdJR6S8HG9rLEGuz4L
         2CeJf9XAwK/NuJmcIRE2otvAKda0CmoyhBR7M5wrS2Ax2ZAuJErq/K/DzeRtw2bP/M9a
         cf4g==
X-Forwarded-Encrypted: i=1; AJvYcCUgvPe+yWec0tMQY3AK6I+Ei7SDhQeeMSr6o7XSw8qDwrRXwwGLtexe7EALMTVoBAf8vuwwraGcLbiUlEkI0Ke0GaqGEcY4uIwfi8u2Pg==
X-Gm-Message-State: AOJu0YwPmeTE2YQymdfk3Fs/yC37W/kLq0U53d0kmTFjvAET+erIeoCj
	N1Q8qh8TbD8ttTA94wO34ty3Vo6vfKQlP87vTfDpxOa1P8jq1VhWoVEN3mmC9w==
X-Google-Smtp-Source: AGHT+IHWxIkDhPJyduioril8hiji11X7d7va4hiErOPNmMZew2cA9RMTzz/cgWgTY7GV8ZXijlFlZQ==
X-Received: by 2002:a05:6a20:c995:b0:1a0:d04a:8485 with SMTP id gy21-20020a056a20c99500b001a0d04a8485mr2121214pzb.22.1708757691194;
        Fri, 23 Feb 2024 22:54:51 -0800 (PST)
Received: from [127.0.1.1] ([120.138.12.46])
        by smtp.gmail.com with ESMTPSA id r5-20020aa78b85000000b006e4cb7f4393sm502932pfd.165.2024.02.23.22.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 22:54:50 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Sat, 24 Feb 2024 12:24:09 +0530
Subject: [PATCH v8 03/10] PCI: dwc: ep: Introduce dw_pcie_ep_cleanup() API
 for drivers supporting PERST#
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240224-pci-dbi-rework-v8-3-64c7fd0cfe64@linaro.org>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
In-Reply-To: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
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
 Kishon Vijay Abraham I <kishon@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3640;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=AMzVel+mzNPZDu5rNOshxFrNbNGmTb5cvr1qXK6YD5c=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl2ZKWN5s7yp9FVQGAuReNe7g8yseCdV9BNHSCP
 Zrav+1vZ/2JATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdmSlgAKCRBVnxHm/pHO
 9UFMB/9QN232kQi2reuocmy2tE//cMRFTozpfDoIA92osFCOoy0Cer23LiZEAcJeSGrpC5C49sC
 mgA1ZnNS7iSCH4PCISxuQiI86G73z/enEIpqSklDziO4mv0OyumLih98yNqum7HVp67XWtw3Vm9
 fGzA5s/htyFJnXZvvsTAIRUlBSyCkENUFLZZjR9X9iDCUeUWzWxKXHC+0E066ZOGDZdEuohlxNg
 TB5ZqF4hSHZaz18Uai4MAw0p+JFaIfZIfAcZwz67LBb5w4MFCIagUxuZfhWlQJ9M5tV6rpAzERJ
 tdNfrJDsEPY/efpFhDlwrXfYiKuRtY+jzlQqn6wXjmIuQe5/
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
Cc: linux-pci@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 11 +++++++++--
 drivers/pci/controller/dwc/pcie-designware.h    |  5 +++++
 drivers/pci/controller/dwc/pcie-qcom-ep.c       |  1 +
 drivers/pci/controller/dwc/pcie-tegra194.c      |  2 ++
 4 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index 2b11290aab4c..1205bfba8310 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -564,12 +564,19 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
+void dw_pcie_ep_cleanup(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
-	struct pci_epc *epc = ep->epc;
 
 	dw_pcie_edma_remove(pci);
+}
+EXPORT_SYMBOL_GPL(dw_pcie_ep_cleanup);
+
+void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
+{
+	struct pci_epc *epc = ep->epc;
+
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

