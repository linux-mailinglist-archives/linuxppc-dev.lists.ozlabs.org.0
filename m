Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21323613A60
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 16:41:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1HSp0DMHz3cK8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Nov 2022 02:41:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RtGAXtHN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RtGAXtHN;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1HQt051Yz2x9d
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Nov 2022 02:40:05 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 63E96B818EC;
	Mon, 31 Oct 2022 15:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0BEC433C1;
	Mon, 31 Oct 2022 15:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667230802;
	bh=w401ZqDLSQ8ZKux9B2AAv7FrlhU6ZkoTx88TnOOAwyI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RtGAXtHNEmUI43QINAf/8bggmgt+lk2tn1SsHUkQCBFC+kZhhYjO1Mi/RbC4KG8AV
	 +5qQjvfsJ9S/l6cQV9IkifW+lL8Z7boAMRmHArljQE62/kYaoF5LZIskX6342JcPCk
	 pQuvJf7CG5T/e03DNuLgyngik9ijeO4JsY+IiuCGRDMH3Z+uhRuT0YvshZ8UTjD5YG
	 nqOVl5st593g5shoVfxRsH72Y67K2r2bq46MxAWg5qG168GWCkvOAoVokF6uILY0bG
	 MWj7+TvKxH6JZPhO60qE7ZdeLMm6vbjM+sg8CU7Qs5eEhqdp1Kq99G98/6ega3Kp8E
	 8igJhZfDXDzGQ==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: [PATCH v3 1/5] PCI: altera-msi: Include <linux/irqdomain.h> explicitly
Date: Mon, 31 Oct 2022 10:39:50 -0500
Message-Id: <20221031153954.1163623-2-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221031153954.1163623-1-helgaas@kernel.org>
References: <20221031153954.1163623-1-helgaas@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Minghuan Lian <minghuan.Lian@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, Thierry Reding <thierry.reding@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>, Toan Le <toan@os.amperecomputing.com>, linux-riscv@lists.infradead.org, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Joyce Ooi <joyce.ooi@intel.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-rockchip@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, Shawn Lin <shawn.lin@rock-chips.com>, Ray Jui <rjui@broadcom.com>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, Michal Simek <michal.simek@amd.com>, Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, Scott Branden <sb
 randen@broadcom.com>, Daire McNamara <daire.mcnamara@microchip.com>, linux-kernel@vger.kernel.org, Tom Joseph <tjoseph@cadence.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bjorn Helgaas <bhelgaas@google.com>

pcie-altera-msi.c uses irq_domain_add_linear() and related interfaces, so
it needs <linux/irqdomain.h> but doesn't include it directly; it relies on
the fact that <linux/of_irq.h> includes it.

But pcie-altera-msi.c *doesn't* need <linux/of_irq.h> itself.  Include
<linux/irqdomain.h> directly to remove this implicit dependency so a future
patch can drop <linux/of_irq.h>.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/pci/controller/pcie-altera-msi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-altera-msi.c b/drivers/pci/controller/pcie-altera-msi.c
index 7b1d3ebc34ec..4366e042e98b 100644
--- a/drivers/pci/controller/pcie-altera-msi.c
+++ b/drivers/pci/controller/pcie-altera-msi.c
@@ -9,6 +9,7 @@
 
 #include <linux/interrupt.h>
 #include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/msi.h>
-- 
2.25.1

