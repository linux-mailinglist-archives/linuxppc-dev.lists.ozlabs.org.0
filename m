Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A792F5B806C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 06:57:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MS7Nd4ykKz3c9K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 14:57:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=linyujun809@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MS5T00s7bz2xdQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 13:30:38 +1000 (AEST)
Received: from dggpeml500020.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MS5NS5fxSzcfgj;
	Wed, 14 Sep 2022 11:26:48 +0800 (CST)
Received: from dggpeml500010.china.huawei.com (7.185.36.155) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 14 Sep 2022 11:30:33 +0800
Received: from huawei.com (10.67.175.33) by dggpeml500010.china.huawei.com
 (7.185.36.155) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 14 Sep
 2022 11:30:33 +0800
From: Lin Yujun <linyujun809@huawei.com>
To: <benh@kernel.crashing.org>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<christophe.leroy@csgroup.eu>, <Julia.Lawall@inria.fr>, <joel@jms.id.au>,
	<paulus@samba.org>
Subject: [PATCH -next] powerpc: Avoid platform device Leak in the event of platform_device_add() fails
Date: Wed, 14 Sep 2022 11:26:59 +0800
Message-ID: <20220914032659.96388-1-linyujun809@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.175.33]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500010.china.huawei.com (7.185.36.155)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 14 Sep 2022 14:56:46 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use platform_device_put() to free the platform device and return
directly in the event platform_device_add() fails.

Fixes: a28d3af2a26c ("[PATCH] 2/5 powerpc: Rework PowerMac i2c part 2")
Signed-off-by: Lin Yujun <linyujun809@huawei.com>
---
 arch/powerpc/platforms/powermac/low_i2c.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index c1c430c66dc9..5171635c3450 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -1487,6 +1487,7 @@ static int __init pmac_i2c_create_platform_devices(void)
 {
 	struct pmac_i2c_bus *bus;
 	int i = 0;
+	int ret;
 
 	/* In the case where we are initialized from smp_init(), we must
 	 * not use the timer (and thus the irq). It's safe from now on
@@ -1502,7 +1503,11 @@ static int __init pmac_i2c_create_platform_devices(void)
 			return -ENOMEM;
 		bus->platform_dev->dev.platform_data = bus;
 		bus->platform_dev->dev.of_node = bus->busnode;
-		platform_device_add(bus->platform_dev);
+		ret = platform_device_add(bus->platform_dev);
+		if (ret) {
+			platform_device_put(bus->platform_dev);
+			return ret;
+		}
 	}
 
 	/* Now call platform "init" functions */
-- 
2.17.1

