Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 730B6F503F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 16:53:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478lDv4tv8zF4lr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 02:53:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478gRW589xzF6qp
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 00:02:44 +1100 (AEDT)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id CD6587B9FF91A25B08F4;
 Fri,  8 Nov 2019 21:02:33 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Fri, 8 Nov 2019
 21:02:25 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <leoyang.li@nxp.com>, <alexandre.belloni@bootlin.com>
Subject: [PATCH -next] soc: fsl: Enable COMPILE_TEST
Date: Fri, 8 Nov 2019 21:02:13 +0800
Message-ID: <20191108130213.23684-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
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
Cc: YueHaibing <yuehaibing@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When do COMPILE_TEST buiding for RTC_DRV_FSL_FTM_ALARM,
we get this warning:

WARNING: unmet direct dependencies detected for FSL_RCPM
  Depends on [n]: PM_SLEEP [=y] && (ARM || ARM64)
  Selected by [m]:
  - RTC_DRV_FSL_FTM_ALARM [=m] && RTC_CLASS [=y] && (ARCH_LAYERSCAPE || SOC_LS1021A || COMPILE_TEST [=y])

This enable COMPILE_TEST for FSL_RCPM to fix the issue.

Fixes: e1c2feb1efa2 ("rtc: fsl-ftm-alarm: allow COMPILE_TEST")
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
In commit c6c2d36bc46f ("rtc: fsl-ftm-alarm: Fix build error without PM_SLEEP")
I posted a wrong kconfig warning(which PM_SLEEP is n), sorry for confusion.
---
 drivers/soc/fsl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/Kconfig b/drivers/soc/fsl/Kconfig
index 4df32bc..e142662 100644
--- a/drivers/soc/fsl/Kconfig
+++ b/drivers/soc/fsl/Kconfig
@@ -43,7 +43,7 @@ config DPAA2_CONSOLE
 
 config FSL_RCPM
 	bool "Freescale RCPM support"
-	depends on PM_SLEEP && (ARM || ARM64)
+	depends on PM_SLEEP && (ARM || ARM64 || COMPILE_TEST)
 	help
 	  The NXP QorIQ Processors based on ARM Core have RCPM module
 	  (Run Control and Power Management), which performs all device-level
-- 
2.7.4


