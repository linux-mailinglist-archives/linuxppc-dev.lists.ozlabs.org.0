Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA072FEB09
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 07:59:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47FR0f64y0zF4LJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 17:59:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=chenwandun@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47FL3V20ZVzF3qQ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2019 14:16:35 +1100 (AEDT)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id C094365A3DAFF918123B;
 Sat, 16 Nov 2019 11:01:03 +0800 (CST)
Received: from localhost.localdomain (10.90.53.225) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Sat, 16 Nov 2019 11:00:52 +0800
From: Chen Wandun <chenwandun@huawei.com>
To: <tyreld@linux.ibm.com>, <mpe@ellerman.id.au>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
 <mahesh@linux.vnet.ibm.com>, <paulus@samba.org>
Subject: [PATCH] powerpc/pseries: remove variable 'status' set but not used
Date: Sat, 16 Nov 2019 11:07:30 +0800
Message-ID: <1573873650-62511-1-git-send-email-chenwandun@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 16 Nov 2019 17:58:04 +1100
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
Cc: chenwandun@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes gcc '-Wunused-but-set-variable' warning:

arch/powerpc/platforms/pseries/ras.c: In function ras_epow_interrupt:
arch/powerpc/platforms/pseries/ras.c:319:6: warning: variable status set but not used [-Wunused-but-set-variable]

Signed-off-by: Chen Wandun <chenwandun@huawei.com>
---
 arch/powerpc/platforms/pseries/ras.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 1d7f973..4a61d0f 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -316,12 +316,11 @@ static irqreturn_t ras_hotplug_interrupt(int irq, void *dev_id)
 /* Handle environmental and power warning (EPOW) interrupts. */
 static irqreturn_t ras_epow_interrupt(int irq, void *dev_id)
 {
-	int status;
 	int state;
 	int critical;
 
-	status = rtas_get_sensor_fast(EPOW_SENSOR_TOKEN, EPOW_SENSOR_INDEX,
-				      &state);
+	rtas_get_sensor_fast(EPOW_SENSOR_TOKEN, EPOW_SENSOR_INDEX,
+			     &state);
 
 	if (state > 3)
 		critical = 1;		/* Time Critical */
@@ -330,12 +329,12 @@ static irqreturn_t ras_epow_interrupt(int irq, void *dev_id)
 
 	spin_lock(&ras_log_buf_lock);
 
-	status = rtas_call(ras_check_exception_token, 6, 1, NULL,
-			   RTAS_VECTOR_EXTERNAL_INTERRUPT,
-			   virq_to_hw(irq),
-			   RTAS_EPOW_WARNING,
-			   critical, __pa(&ras_log_buf),
-				rtas_get_error_log_max());
+	rtas_call(ras_check_exception_token, 6, 1, NULL,
+		  RTAS_VECTOR_EXTERNAL_INTERRUPT,
+		  virq_to_hw(irq),
+		  RTAS_EPOW_WARNING,
+		  critical, __pa(&ras_log_buf),
+		  rtas_get_error_log_max());
 
 	log_error(ras_log_buf, ERR_TYPE_RTAS_LOG, 0);
 
-- 
2.7.4

