Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F035D065
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 15:20:21 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45dPxG1W4mzDqYX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 23:20:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.35; helo=huawei.com; envelope-from=yuehaibing@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45dPtc0lbSzDqLr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 23:17:58 +1000 (AEST)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 9459D9F5B332EABA387F;
 Tue,  2 Jul 2019 21:17:51 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Tue, 2 Jul 2019
 21:17:42 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <benh@kernel.crashing.org>, <paulus@samba.org>, <mpe@ellerman.id.au>,
 <robh@kernel.org>, <gregkh@linuxfoundation.org>, <tglx@linutronix.de>,
 <allison@lohutok.net>, <groug@kaod.org>, <shilpa.bhat@linux.vnet.ibm.com>
Subject: [PATCH -next] powerpc/powernv: Make some sysbols static
Date: Tue, 2 Jul 2019 21:17:33 +0800
Message-ID: <20190702131733.44100-1-yuehaibing@huawei.com>
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
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix sparse warnings:

arch/powerpc/platforms/powernv/opal-psr.c:20:1:
 warning: symbol 'psr_mutex' was not declared. Should it be static?
arch/powerpc/platforms/powernv/opal-psr.c:27:3:
 warning: symbol 'psr_attrs' was not declared. Should it be static?
arch/powerpc/platforms/powernv/opal-powercap.c:20:1:
 warning: symbol 'powercap_mutex' was not declared. Should it be static?
arch/powerpc/platforms/powernv/opal-sensor-groups.c:20:1:
 warning: symbol 'sg_mutex' was not declared. Should it be static?

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/powerpc/platforms/powernv/opal-powercap.c      | 2 +-
 arch/powerpc/platforms/powernv/opal-psr.c           | 4 ++--
 arch/powerpc/platforms/powernv/opal-sensor-groups.c | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-powercap.c b/arch/powerpc/platforms/powernv/opal-powercap.c
index dc599e7..c16d44f 100644
--- a/arch/powerpc/platforms/powernv/opal-powercap.c
+++ b/arch/powerpc/platforms/powernv/opal-powercap.c
@@ -13,7 +13,7 @@
 
 #include <asm/opal.h>
 
-DEFINE_MUTEX(powercap_mutex);
+static DEFINE_MUTEX(powercap_mutex);
 
 static struct kobject *powercap_kobj;
 
diff --git a/arch/powerpc/platforms/powernv/opal-psr.c b/arch/powerpc/platforms/powernv/opal-psr.c
index b6ccb30..69d7e75 100644
--- a/arch/powerpc/platforms/powernv/opal-psr.c
+++ b/arch/powerpc/platforms/powernv/opal-psr.c
@@ -13,11 +13,11 @@
 
 #include <asm/opal.h>
 
-DEFINE_MUTEX(psr_mutex);
+static DEFINE_MUTEX(psr_mutex);
 
 static struct kobject *psr_kobj;
 
-struct psr_attr {
+static struct psr_attr {
 	u32 handle;
 	struct kobj_attribute attr;
 } *psr_attrs;
diff --git a/arch/powerpc/platforms/powernv/opal-sensor-groups.c b/arch/powerpc/platforms/powernv/opal-sensor-groups.c
index 31f13c1..f8ae1fb 100644
--- a/arch/powerpc/platforms/powernv/opal-sensor-groups.c
+++ b/arch/powerpc/platforms/powernv/opal-sensor-groups.c
@@ -13,7 +13,7 @@
 
 #include <asm/opal.h>
 
-DEFINE_MUTEX(sg_mutex);
+static DEFINE_MUTEX(sg_mutex);
 
 static struct kobject *sg_kobj;
 
-- 
2.7.4


