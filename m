Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6713D270B27
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 08:38:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Btgyb2SMFzDqsM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Sep 2020 16:38:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=huawei.com;
 envelope-from=yangyingliang@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Btgwv711bzDqpC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 16:37:14 +1000 (AEST)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id AE9DCAF8C0271C6EA084;
 Sat, 19 Sep 2020 14:37:03 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Sat, 19 Sep 2020
 14:36:59 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next v2] tty: hvc: fix link error with
 CONFIG_SERIAL_CORE_CONSOLE=n
Date: Sat, 19 Sep 2020 14:35:35 +0800
Message-ID: <20200919063535.2809707-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.124.27]
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
Cc: gregkh@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

aarch64-linux-gnu-ld: drivers/tty/hvc/hvc_dcc.o: in function `dcc_early_write':
hvc_dcc.c:(.text+0x164): undefined reference to `uart_console_write'

The driver uses the uart_console_write(), but SERIAL_CORE_CONSOLE is not
selected, so uart_console_write is not defined, then we get the error.
Fix this by selecting SERIAL_CORE_CONSOLE.

Fixes: d1a1af2cdf19 ("hvc: dcc: Add earlycon support")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/tty/hvc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/hvc/Kconfig b/drivers/tty/hvc/Kconfig
index d1b27b0522a3..8d60e0ff67b4 100644
--- a/drivers/tty/hvc/Kconfig
+++ b/drivers/tty/hvc/Kconfig
@@ -81,6 +81,7 @@ config HVC_DCC
 	bool "ARM JTAG DCC console"
 	depends on ARM || ARM64
 	select HVC_DRIVER
+	select SERIAL_CORE_CONSOLE
 	help
 	  This console uses the JTAG DCC on ARM to create a console under the HVC
 	  driver. This console is used through a JTAG only on ARM. If you don't have
-- 
2.25.1

