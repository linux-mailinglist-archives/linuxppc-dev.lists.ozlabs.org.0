Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AEC1CA3A8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 08:19:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JKsx6l6JzDr73
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 May 2020 16:19:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=biwen.li@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=oss.nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JKK36CQXzDqsw
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 May 2020 15:54:10 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7B7731A12CB;
 Fri,  8 May 2020 07:54:06 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F06EA1A077F;
 Fri,  8 May 2020 07:54:01 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 0A06A40288;
 Fri,  8 May 2020 13:53:55 +0800 (SGT)
From: Biwen Li <biwen.li@oss.nxp.com>
To: leoyang.li@nxp.com, robh+dt@kernel.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com
Subject: [PATCH 1/3] rtc: ds1374: add uie_unsupported property to drop warning
Date: Fri,  8 May 2020 13:49:23 +0800
Message-Id: <20200508054925.48237-1-biwen.li@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Fri, 08 May 2020 16:18:03 +1000
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Biwen Li <biwen.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Biwen Li <biwen.li@nxp.com>

Add uie_unsupported property to drop warning as follows:
    - $ hwclock.util-linux
      hwclock.util-liux: select() /dev/rtc0
      to wait for clock tick timed out

My case:
    - RTC ds1374's INT pin is connected to VCC on T4240RDB,
      then the RTC cannot inform cpu about the alarm
      interrupt

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 drivers/rtc/rtc-ds1374.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/rtc/rtc-ds1374.c b/drivers/rtc/rtc-ds1374.c
index 9c51a12cf70f..e530e887a17e 100644
--- a/drivers/rtc/rtc-ds1374.c
+++ b/drivers/rtc/rtc-ds1374.c
@@ -651,6 +651,10 @@ static int ds1374_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
+	if (of_property_read_bool(client->dev.of_node,
+						 "uie_unsupported"))
+		ds1374->rtc->uie_unsupported = true;
+
 #ifdef CONFIG_RTC_DRV_DS1374_WDT
 	save_client = client;
 	ret = misc_register(&ds1374_miscdev);
-- 
2.17.1

