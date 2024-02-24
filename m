Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B23A862308
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 07:55:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GdssP4Fj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Thd1J1NmPz3vZJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Feb 2024 17:55:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GdssP4Fj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2001:4860:4864:20::33; helo=mail-oa1-x33.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Thd0W2gsNz2xFk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Feb 2024 17:54:33 +1100 (AEDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-21fa872dce3so656949fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 22:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708757665; x=1709362465; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GWgl52BYCJ4PwBk/V86UifQusawgYoQTONtG8UzIO9M=;
        b=GdssP4FjAkfudzAK0PFOqg9tFze6Uff3ytgNhJi6Euolt0b5Dyv31zD/OIccGstcxJ
         JwbZ/WimCDLfaWj9eNHeNfVCpGP1HREqq3UXQ7XBbqIlo3DO7QI1cCP8u+9/RjBbPyWP
         RENI6ZLRPyBC5L2sOn91kFp3sZEvm11aKZet5VCK/XB837ddkXU9F1a5MCw5sQSAK7zt
         h0TRyOMoy7RXI07QO3GwNSXywyEiSdcD6uVjucnF1cbDUTcDMJYk5qFkspgYzisLI+cW
         7I1DaiAc+mRT8CoRoLXXn01hpxf3BGTzIHPwNkPqlndwPy8gRIPDKpDGKq8ACNgDEIxg
         n8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708757665; x=1709362465;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWgl52BYCJ4PwBk/V86UifQusawgYoQTONtG8UzIO9M=;
        b=vGZJ0htZ8xXyZ6eYkEXBf4uNbts6HFBpId6t61H7vVV9Mk4qNUnYnw07UKArImC7TJ
         BSX8587brDOLIIekszvK5Qmg2ANNcW8xEKUP21lCneyo+3VngpffOqBBtJitZOCfpcCN
         NrhSAQ6eEDcoSfQ3bdEfTd9Bj+KXpsctQIrvvqheFAz6ywUv8OSQZtXHr+iuaid9tK3W
         KbYXXowK9ERiNrSYafeMKEW7GpnmAw6WnAqo16kMJKj6w1lLdVhUZERTherKtV9aTAyS
         IUBFEZqJIHVYdyfKzqixf6TO412/E9rEBndQ75v9jCgXvBja0hGT6xn7e9FwSGXN2Vva
         qSyw==
X-Forwarded-Encrypted: i=1; AJvYcCUNTSo7nTgqJlJlMo9dXs+SouQY025ABfb1Mnw72UdH7OY7tamoCxvcLNY9uHlH9RYrC5Va0piAEGzXd6PxrMWXMOSNC7BQp4heMPpBMg==
X-Gm-Message-State: AOJu0Yx3Rj/4LnNApkzQKd4lBJpQ88ciJ4Q55d1unI8bl7qI864tSvYA
	vA0mpxMr32DMgkj9hWh0EVNiEXt4RfXnccnedy7F8VtVgUWUXCz5mFD+v9cx8Q==
X-Google-Smtp-Source: AGHT+IF06E9v7eucC47KNmijoQVmhjzoq9rivDk5iXaa+yfwLA6gzHHWi6ef9Qq7OZDo1ytULmGgdQ==
X-Received: by 2002:a05:6358:7618:b0:17b:304f:b3d with SMTP id r24-20020a056358761800b0017b304f0b3dmr2293513rwg.23.1708757665005;
        Fri, 23 Feb 2024 22:54:25 -0800 (PST)
Received: from [127.0.1.1] ([120.138.12.46])
        by smtp.gmail.com with ESMTPSA id r5-20020aa78b85000000b006e4cb7f4393sm502932pfd.165.2024.02.23.22.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 22:54:24 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v8 00/10] PCI: dwc: ep: Fix DBI access failure for drivers
 requiring refclk from host
Date: Sat, 24 Feb 2024 12:24:06 +0530
Message-Id: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI6S2WUC/x3MMQqAMAxA0auUzAZKFLFeRRxsjRoELSmoULy7x
 fEN/2dIrMIJepNB+ZIk51HQVQbCNh0ro8zFQJYaS9RgDIKzF1S+T93REzs3teRqG6BEUXmR5x8
 O4/t+RAjzGGAAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4532;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=x754MZuCG5B4tIf+C0S5CY+BH4+h4u4WEZxh/Gpxfvg=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl2ZKQE8Qt4hWcXaLPZGKeHcZfe3X7OduUiUiV0
 oFeVosxH6eJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdmSkAAKCRBVnxHm/pHO
 9Tg+B/9h+50d00vh+TLHKGgy9bamVqprezEgWpVebuQtbPLH+0qaZ/yinkzuIHcFOSIYsepmyoF
 oxctWzI4aBO+ljYpcYNwRyR0U9rV/u4BaiB/PSHZyb/rV2K80Rnhwpg1H9T0rgaW5J9euOgIDYs
 QG2g/9pkqHm/o6enI9UHI1m4SNbYFo+qJGtSy8sWX0kPlfITYqKbKoMsJiT13Uo8mJIK9m32aLx
 XUeyXu7WaeT6766mCCWMuM04zRG+wA8qsTIEdw/DgXK0GfQa3HctlA/x04RvKdeIIqqzW+y6Vz3
 ys9mXnb7Q06Mk0kRPmzAWj3CCFOqVHo4+1bh2WFBOiVr7dkh
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

Hello,

This series is the continuation of previous work by Vidya Sagar [1] to fix the
issues related to accessing DBI register space before completing the core
initialization in some EP platforms like Tegra194/234 and Qcom EP.

Since Vidya is busy, I took over the series based on his consent (off-list
discussion).

NOTE
====

Based on the comments received in v7 [2], I've heavily modified the series
to fix several other issues reported by Bjorn and Niklas. One noticeable
change is getting rid of the 'core_init_notifer' flag added to differentiate
between glue drivers requiring refclk from host and drivers getting refclk
locally.

By getting rid of this flag, now both the DWC EP driver and the EPF drivers
can use a single flow and need not distinguish between the glue drivers.

We can also get rid of the 'link_up_notifier' flag in the future by following
the same convention.

Testing
=======

I've tested the series on Qcom SM8450 based dev board that depends on refclk
from host with EPF_MHI driver. It'd be good to test this series on platforms
that generate refclk locally and also with EPF_TEST driver.

- Mani

[1] https://lore.kernel.org/linux-pci/20221013175712.7539-1-vidyas@nvidia.com/
[2] https://lore.kernel.org/linux-pci/20231120084014.108274-1-manivannan.sadhasivam@linaro.org/

Changes in v8:

- Rebased on top of v6.8-rc1
- Removed the deinit callback from struct dw_pcie_ep_ops
- Renamed dw_pcie_ep_exit() to dw_pcie_ep_deinit()
- Introduced dw_pcie_ep_cleanup() API for drivers supporting PERST#
- Renamed dw_pcie_ep_init_complete() to dw_pcie_ep_init_registers()
- Called dw_pcie_ep_init_registers() API directly from all glue drivers
- Removed "core_init_notifier" flag
- Added a generic dw_pcie_ep_linkdown() API to handle LINK_DOWN event and used
  it in qcom driver
- Added Kernel-doc comments for DWC EP APIs

Changes in v7:

- Rebased on top of v6.7-rc1
- Kept the current dw_pcie_ep_init_complete() API instead of renaming it to
  dw_pcie_ep_init_late(), since changing the name causes a slight ambiguity.
- Splitted the change that moves pci_epc_init_notify() inside
  dw_pcie_ep_init_notify() to help bisecting and also to avoid build issue.
- Added a new patch that moves pci_epc_init_notify() inside
  dw_pcie_ep_init_notify().
- Took over the authorship and dropped the previous Ack as the patches are
  heavily modified.

Changes in v6:

- Rebased on top of pci/next (6e2fca71e187)
- removed ep_init_late() callback as it is no longer necessary

For previous changelog, please refer [1].

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Manivannan Sadhasivam (10):
      PCI: dwc: ep: Remove deinit() callback from struct dw_pcie_ep_ops
      PCI: dwc: ep: Rename dw_pcie_ep_exit() to dw_pcie_ep_deinit()
      PCI: dwc: ep: Introduce dw_pcie_ep_cleanup() API for drivers supporting PERST#
      PCI: dwc: ep: Fix DBI access failure for drivers requiring refclk from host
      PCI: dwc: ep: Rename dw_pcie_ep_init_complete() to dw_pcie_ep_init_registers()
      PCI: dwc: ep: Call dw_pcie_ep_init_registers() API directly from all glue drivers
      PCI: dwc: ep: Remove "core_init_notifier" flag
      PCI: dwc: ep: Add a generic dw_pcie_ep_linkdown() API to handle LINK_DOWN event
      PCI: qcom-ep: Use the generic dw_pcie_ep_linkdown() API to handle LINK_DOWN event
      PCI: dwc: ep: Add Kernel-doc comments for APIs

 drivers/pci/controller/dwc/pci-dra7xx.c           |   9 +
 drivers/pci/controller/dwc/pci-imx6.c             |  10 +
 drivers/pci/controller/dwc/pci-keystone.c         |  11 +
 drivers/pci/controller/dwc/pci-layerscape-ep.c    |   9 +
 drivers/pci/controller/dwc/pcie-designware-ep.c   | 307 +++++++++++++++-------
 drivers/pci/controller/dwc/pcie-designware-plat.c |  11 +
 drivers/pci/controller/dwc/pcie-designware.h      |  19 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c         |   6 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  28 +-
 drivers/pci/controller/dwc/pcie-tegra194.c        |   5 +-
 drivers/pci/controller/dwc/pcie-uniphier-ep.c     |  15 +-
 drivers/pci/endpoint/functions/pci-epf-test.c     |  18 +-
 include/linux/pci-epc.h                           |   3 -
 13 files changed, 321 insertions(+), 130 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240224-pci-dbi-rework-b2e99a62930c

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

