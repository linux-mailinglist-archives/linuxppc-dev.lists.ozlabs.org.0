Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A283599A4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 11:43:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGtVr6Wr4z3c0L
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 19:43:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com;
 envelope-from=yebin10@huawei.com; receiver=<UNKNOWN>)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGtVX2BQCz2yjD
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 19:43:31 +1000 (AEST)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGtRv0jpsz19L9r;
 Fri,  9 Apr 2021 17:41:15 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 17:43:20 +0800
From: Ye Bin <yebin10@huawei.com>
To: <yebin10@huawei.com>, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>
Subject: [PATCH -next] macintosh/via-pmu: Use DEFINE_SPINLOCK() for spinlock
Date: Fri, 9 Apr 2021 17:51:45 +0800
Message-ID: <20210409095145.2294210-1-yebin10@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.175.127.227]
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

spinlock can be initialized automatically with DEFINE_SPINLOCK()
rather than explicitly calling spin_lock_init().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Ye Bin <yebin10@huawei.com>
---
 drivers/macintosh/via-pmu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/macintosh/via-pmu.c b/drivers/macintosh/via-pmu.c
index 73e6ae88fafd..bab913e3541a 100644
--- a/drivers/macintosh/via-pmu.c
+++ b/drivers/macintosh/via-pmu.c
@@ -161,7 +161,7 @@ static unsigned char __iomem *gpio_reg;
 static int gpio_irq = 0;
 static int gpio_irq_enabled = -1;
 static volatile int pmu_suspended;
-static spinlock_t pmu_lock;
+static DEFINE_SPINLOCK(pmu_lock);
 static u8 pmu_intr_mask;
 static int pmu_version;
 static int drop_interrupts;
@@ -306,8 +306,6 @@ int __init find_via_pmu(void)
 		goto fail;
 	}
 
-	spin_lock_init(&pmu_lock);
-
 	pmu_has_adb = 1;
 
 	pmu_intr_mask =	PMU_INT_PCEJECT |
@@ -389,8 +387,6 @@ int __init find_via_pmu(void)
 
 	pmu_kind = PMU_UNKNOWN;
 
-	spin_lock_init(&pmu_lock);
-
 	pmu_has_adb = 1;
 
 	pmu_intr_mask =	PMU_INT_PCEJECT |

