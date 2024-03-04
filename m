Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B637E86FD55
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 10:24:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aZJGTPrS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpCvq2KdQz3vf1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Mar 2024 20:24:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aZJGTPrS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpCsp0b0jz3d2j
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Mar 2024 20:23:09 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dc96f64c10so38273705ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 01:23:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709544188; x=1710148988; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZnWb8d3C9Og59KtRq5XtOfAx+xAmaYSx4xuR1PV3YM=;
        b=aZJGTPrSGoCefIT/K3FCgkzJrlPVti9FbTruJdpgf/A6nWWWLmUe+ICXHb880FTmlz
         Ghfmd1A+H/pTmVhdMmLE+y8PP4Yjk+awoMrhosw2iadws3ZcISHuhYmxvUvHMI7V4w+z
         CC0ZCsFlTu+3Tc+EROBPh3N8O5JJyyLmkVrq8zpAxOgkPxPYHoy9EdRw3sbePLIf9hE0
         dmz9lmyp+0UqYmpVwPOSbQdNUFO6eeqVI6VUroLHQVLcnA9tvYmrrnlAZHfNuoJswAHk
         knmz9KrsGiV6yHni1oaHz3duNbhALhsQ2ZTwzWiotZJvLTkyzR7b59Rc/Yy0MJZOiNm6
         zZ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709544188; x=1710148988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kZnWb8d3C9Og59KtRq5XtOfAx+xAmaYSx4xuR1PV3YM=;
        b=n+CEhI1WdG7DQeP0N0dHPSz/YfK2fUaL8jn9m1TRR2UAwu0dS38UVQtDY/mMeszNtO
         cQcg1BHItca58YYo2ynOsnwV5l5cAAfJmjTQRvvxVn+gPPCFoJwe8JAcJPUYGcuwVOTb
         HWw2/9At0DezxeNhADw6+I4X+ocdiI9aKMS2Uo4N27Q57BZQLj/Efq4MahCWucSsH/uS
         S0Txm4YQ4aDilVgfEX7g5+1VgBMMsd9km7RlPs5EazfGGtS6C3E6Cvh7YJqypJ0j6qxo
         DbGOdWvjIH02r0lfLe3HLouzMIlUv3qzW0QRabRBmyi2QUWC0Dh0Wx/hH8mwFh7H+fao
         oNKg==
X-Forwarded-Encrypted: i=1; AJvYcCV7qEHm0VN8J9a5zr1hThXAeQY4XE+NFq19TAMS2/WN2H3TkWK4+xAXLPRMDjffGT62tZ9z+4pcEuSa3zog47KlC3WgFjy58Z++L7g07g==
X-Gm-Message-State: AOJu0Yx0dG1L5ZAZ9DYQg60YCptWhXbFi9jgeTd5fpUOkPc9KQdrkbAy
	mIEOvAhfJ7n3Da9NPenafVX9QBH9nhDf1mCBXekPj2/T3j7iFxY3lbO/cn0IYQ==
X-Google-Smtp-Source: AGHT+IHadCZKDO8osCpF110ohJVMlzHI0kv3tjJxc8CaEETJeKyA9lQGvRZuMus+Vv0XnXpHiNbvhA==
X-Received: by 2002:a17:903:230f:b0:1dc:3ab7:cc78 with SMTP id d15-20020a170903230f00b001dc3ab7cc78mr10226033plh.29.1709544187965;
        Mon, 04 Mar 2024 01:23:07 -0800 (PST)
Received: from [127.0.1.1] ([117.202.187.165])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902c1c500b001dbb06b6138sm7996648plc.252.2024.03.04.01.22.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Mar 2024 01:23:07 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date: Mon, 04 Mar 2024 14:52:14 +0530
Subject: [PATCH v9 02/10] PCI: dwc: ep: Rename dw_pcie_ep_exit() to
 dw_pcie_ep_deinit()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240304-pci-dbi-rework-v9-2-29d433d99cda@linaro.org>
References: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
In-Reply-To: <20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2960;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=g9mNmvK51fz68J5jozssdi6/0DjCS9JLFmd7JogEd4g=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl5ZLXLJvwcaTA0KTIiIimACQMqOxY/E6kuxppM
 brQVyYuBSaJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZeWS1wAKCRBVnxHm/pHO
 9ZBmCACR44IY3tYba7u1CXyA0GkFEwPK5rfEAqNS+RMbvaQgu1eBEjBy7p6qV4aZbq+AXk31mP3
 hd/duOXibZWgwM4dASbi9vKug6dAA2zo87v7soROe6bTNLzhj1/0NhrY5aOIIw9Ncy3vyEJuY6V
 0UA7/7tNWcsch3hQeOluQb8K11fko+nM5rq4l3COPMBAdTpkmavtgoEvAZEkuHs/EOQOFqFzo+t
 MHAXyZQYcdwqQFHG2Ve4dxbksMkzUi6NLXAjBZOSKQEUWVNECwmhz9X3pNWuYCp8yTBydtXUmyM
 SjH94JeOXyPfiXAfCEi8WYvaMPxBF3Mh/rK7mq/AfA3JryTh
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

dw_pcie_ep_exit() API is undoing what the dw_pcie_ep_init() API has done
already (at least partly). But the API name dw_pcie_ep_exit() is not quite
reflecting that. So let's rename it to dw_pcie_ep_deinit() to make the
purpose of this API clear. This also aligns with the DWC host driver.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/pci/controller/dwc/pcie-designware-ep.c | 4 ++--
 drivers/pci/controller/dwc/pcie-designware.h    | 4 ++--
 drivers/pci/controller/dwc/pcie-rcar-gen4.c     | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
index d305f9b4cdfe..2b11290aab4c 100644
--- a/drivers/pci/controller/dwc/pcie-designware-ep.c
+++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
@@ -564,7 +564,7 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
 	return 0;
 }
 
-void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
+void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
 	struct pci_epc *epc = ep->epc;
@@ -576,7 +576,7 @@ void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
 
 	pci_epc_mem_exit(epc);
 }
-EXPORT_SYMBOL_GPL(dw_pcie_ep_exit);
+EXPORT_SYMBOL_GPL(dw_pcie_ep_deinit);
 
 static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
 {
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index ab7431a37209..61465203bb60 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -671,7 +671,7 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init(struct dw_pcie_ep *ep);
 int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep);
 void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
-void dw_pcie_ep_exit(struct dw_pcie_ep *ep);
+void dw_pcie_ep_deinit(struct dw_pcie_ep *ep);
 int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no);
 int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
 			     u8 interrupt_num);
@@ -701,7 +701,7 @@ static inline void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
 {
 }
 
-static inline void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
+static inline void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
 {
 }
 
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index ac97d594ea47..9d9d22e367bb 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -430,7 +430,7 @@ static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 
 static void rcar_gen4_remove_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
 {
-	dw_pcie_ep_exit(&rcar->dw.ep);
+	dw_pcie_ep_deinit(&rcar->dw.ep);
 	rcar_gen4_pcie_ep_deinit(rcar);
 }
 

-- 
2.25.1

