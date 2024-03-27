Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6CB88D9DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 10:14:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FDx2Nv8l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4LbS3GLHz3vYD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 20:14:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FDx2Nv8l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::32e; helo=mail-ot1-x32e.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4LZh57Qnz3cLj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 20:14:02 +1100 (AEDT)
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6e6d063e88bso2018393a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 02:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711530839; x=1712135639; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m7YoevRtWoIrX5inKpmhV/jNINZnpRhSbmQj7YxoH3s=;
        b=FDx2Nv8lIIX2mlqof5jhJGrFhfYTEhsSQYMoQOXhQhYSQhXX66wmLc2HyH8lkzxhOy
         4FTgb6qi/VDcsl8WB9pH+1xfgNIO9Cb12WuOrw1k3t9gl1t9T96d3cu0EgXWE2Gmwcs0
         gNd3rAM8vcODCrysci2+AZVlT+HY85ms4M6cekc6wajdE/IjEozdSdSNkDbrKmHS1JO1
         gWkdEuCv9FdFew6UNC0TIRa6mZ+Cc8fdm+Clokbiib/IYK8Iizy1wNxEmmKW9BeKntaK
         qfkkt7ThZo4RFemoUnWJUDeVv6uvqLIw/KRtiqNmNCXI+RUow4P8laP8pN+GJYAvL+C1
         vugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711530839; x=1712135639;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m7YoevRtWoIrX5inKpmhV/jNINZnpRhSbmQj7YxoH3s=;
        b=ZzmrJD2tuCZz3Pob45+kFnu77OzEAII35q0jjAU/VwNEhGvnljYeVey9Z4npiyIJHO
         1NE2eC7j36WmjvVdtnNlEk3jtD2cYqWzb8PpMW2vh2e8TJxIBBvJc3Q+A9J5B4tJzD3y
         g8W8BCs1oN/LS8VpDBrGrM2OwVO/nutPe5ucXre4HaHaxZPgF2AoGzEjOPFhb1ZEbWhI
         gZIa2lB4y6T+Z+5HoEZjiU+WBdQ0RuauYo4ZQMhv7C/LPeVFUFzwh2wYK2H42RP9kmS2
         APZ/RfdFyo0e39RPQ1OnmXKji1MNr/Z+d4WKb2ySL8pXq8YofOYbcqIqSXWPccfWTw9K
         gnFg==
X-Forwarded-Encrypted: i=1; AJvYcCVQIWPDbFzGqTi7uDoV8jT0FjAwm3j1ulRPat/yVBcztCN5QlH/Oqj1mnEHN30ZnxJs1MJf1PkOeOMvXXS1hvcw3GVFtgmMH8vt7BudFg==
X-Gm-Message-State: AOJu0Yw5jVXWipj7VrZo2J2djCBqRCzfgSjw2N6ND6ouUppv9Bfp27y3
	SRNi9ASlLpAcYzMqaKVuRIe+eB41KeJCe4CSPW+W2T2P3dsuqBkPhMH9iZSEbw==
X-Google-Smtp-Source: AGHT+IHLrC+cElHqEJHgQI6bNudg5V3T5UyMpSvlDNp0VTqd68nwYnF3OIdtHfvbZn/Wx5NtZMwQqQ==
X-Received: by 2002:a9d:4f07:0:b0:6e6:ded0:8a69 with SMTP id d7-20020a9d4f07000000b006e6ded08a69mr5193012otl.31.1711530839288;
        Wed, 27 Mar 2024 02:13:59 -0700 (PDT)
Received: from [127.0.1.1] ([120.60.52.77])
        by smtp.gmail.com with ESMTPSA id h190-20020a6383c7000000b005dc4fc80b21sm8673871pge.70.2024.03.27.02.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 02:13:58 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v12 0/8] PCI: dwc: ep: Fix DBI access failure for drivers
 requiring refclk from host
Date: Wed, 27 Mar 2024 14:43:29 +0530
Message-Id: <20240327-pci-dbi-rework-v12-0-082625472414@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADnjA2YC/3XPS2oDMQyA4asEr+Mgy56Huuo9SheOLSeiYRw8Z
 doS5u71ZNME06UE/yd0UzMX4Vm97G6q8CKz5KkOBvc7Fc5+OrGWWBcKAR0gOn0NouNRdOGvXD7
 0EZnI90gWgqrRtXCS77v49l7ns8yfufzcDyzjtv2XWkYNundhSBFC4t69XmTyJR9yOanNWuivt
 9D2VHuk6KyNRCH6pjfwAJgWMFAF47zrQufJjtwK5kHAoRXM9kPqsKNE0A/2SVjX9ReJR8rQcgE
 AAA==
To: Jingoo Han <jingoohan1@gmail.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Vidya Sagar <vidyas@nvidia.com>, 
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
 Srikanth Thokala <srikanth.thokala@intel.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=6302;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=iO9oNvG+QPX6EBHlzWrbZgkGzqEkhIYMPjFQURkQp1E=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmA+NIo/FDU1Qzm8K9RhxHEI8Jtmbq4KExhILxr
 h8EcXGlx0SJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZgPjSAAKCRBVnxHm/pHO
 9XMZB/9ZVvwo9sSG/E7aVel5CSG/nMG/jLxOi0rHJgyMN7yji8HK5ajSrTKUXs0jT4mdCTclZ8j
 yGj4IxADoOnlwcHIjiz7NfE8eueVtUlnoWSzqXxWV9FrLNUtwYp98RXIOc3UvpMlvG/0QgbH3uv
 K7YTyqGd4NsP7zM3fHjaWXkw0pB60QsEos4YQLk9lBpRKQxz40KLuAET6DwRV5ZNfua1ew+4L65
 zr+NXa5ghbAqbrbm05gK3xe5iivUEFGH7lu9dMy5+yyytQgKM7Qf1VrUGShOtJKMAPZ0TB5p/5R
 pFm/tz8l8TQYBVCiCxd0wAYH21S9gVFyCpuDBh/w4ikx2xHy
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
Cc: linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@axis.com, linux-renesas-soc@vger.kernel.org, Niklas Cassel <cassel@kernel.org>, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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

Changes in v12:
- Fixed the init_notify() API used in non-dwc drivers (thanks Niklas)
- Dropped Gustavo from CC since his email is bouncing
- Link to v11: https://lore.kernel.org/r/20240327-pci-dbi-rework-v11-0-6f5259f90673@linaro.org

Changes in v11:
- Minor cleanups reported by Niklas
- 'epc->init_complete = false' is set in dw_pcie_ep_cleanup() to avoid
  triggering init complete notification before refclk. This will be moved to EPC
  core in the following series adding deinit notifier.
- Collected review tags.
- Link to v10: https://lore.kernel.org/r/20240314-pci-dbi-rework-v10-0-14a45c5a938e@linaro.org

Changes in v10:
- Reordered the commits by moving the independent fixes/cleanups first (Niklas)
- Addressed several comments from Niklas
- Moved PTM register setting out of dw_pcie_ep_init_non_sticky_registers() (Niklas)
- Addressed the issue that EPF drivers were missing init notification after the
  removal of core_init_notifier (Niklas)
- Dropped a few cleanup patches to be clubbed with the follow up series
- Collected review tags
- Dropped the review tags for patch 8/8 as it got changed
- Link to v9: https://lore.kernel.org/r/20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org

Changes in v9:
- Incorporated changes for missing drivers (Niklas)
- Reworded the dw_pcie_ep_cleanup() API kdoc (Niklas)
- Reworded the description of patch 6/10 (Frank)
- Collected reviews
- Link to v8: https://lore.kernel.org/r/20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org

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
Manivannan Sadhasivam (8):
      PCI: dwc: ep: Fix DBI access failure for drivers requiring refclk from host
      PCI: dwc: ep: Add Kernel-doc comments for APIs
      PCI: dwc: ep: Remove deinit() callback from struct dw_pcie_ep_ops
      PCI: dwc: ep: Rename dw_pcie_ep_exit() to dw_pcie_ep_deinit()
      PCI: dwc: ep: Introduce dw_pcie_ep_cleanup() API for drivers supporting PERST#
      PCI: dwc: ep: Rename dw_pcie_ep_init_complete() to dw_pcie_ep_init_registers()
      PCI: dwc: ep: Call dw_pcie_ep_init_registers() API directly from all glue drivers
      PCI: endpoint: Remove "core_init_notifier" flag

 drivers/pci/controller/cadence/pcie-cadence-ep.c  |   2 +
 drivers/pci/controller/dwc/pci-dra7xx.c           |   9 +
 drivers/pci/controller/dwc/pci-imx6.c             |  10 +
 drivers/pci/controller/dwc/pci-keystone.c         |  11 +
 drivers/pci/controller/dwc/pci-layerscape-ep.c    |   9 +
 drivers/pci/controller/dwc/pcie-artpec6.c         |  15 +-
 drivers/pci/controller/dwc/pcie-designware-ep.c   | 238 +++++++++++++++-------
 drivers/pci/controller/dwc/pcie-designware-plat.c |  11 +
 drivers/pci/controller/dwc/pcie-designware.h      |  14 +-
 drivers/pci/controller/dwc/pcie-keembay.c         |  18 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c         |   4 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  28 ++-
 drivers/pci/controller/dwc/pcie-tegra194.c        |   5 +-
 drivers/pci/controller/dwc/pcie-uniphier-ep.c     |  15 +-
 drivers/pci/controller/pcie-rcar-ep.c             |   2 +
 drivers/pci/controller/pcie-rockchip-ep.c         |   2 +
 drivers/pci/endpoint/functions/pci-epf-test.c     |  18 +-
 drivers/pci/endpoint/pci-ep-cfs.c                 |   9 +
 drivers/pci/endpoint/pci-epc-core.c               |  22 ++
 include/linux/pci-epc.h                           |   7 +-
 20 files changed, 338 insertions(+), 111 deletions(-)
---
base-commit: 4cece764965020c22cff7665b18a012006359095
change-id: 20240224-pci-dbi-rework-b2e99a62930c

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

