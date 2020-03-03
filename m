Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D6A17721E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 10:14:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WrtC3QxhzDqSc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 20:14:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
X-Greylist: delayed 949 seconds by postgrey-1.36 at bilbo;
 Tue, 03 Mar 2020 20:12:24 AEDT
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Wrr852QTzDqSc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 20:12:20 +1100 (AEDT)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8FD36214148A0B4E2E5F;
 Tue,  3 Mar 2020 16:56:26 +0800 (CST)
Received: from localhost (10.173.223.234) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Tue, 3 Mar 2020
 16:56:16 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <benh@kernel.crashing.org>, <paulus@samba.org>, <mpe@ellerman.id.au>,
 <christophe.leroy@c-s.fr>
Subject: [PATCH v2 -next] powerpc/pmac/smp: drop unnecessary volatile qualifier
Date: Tue, 3 Mar 2020 16:56:04 +0800
Message-ID: <20200303085604.24952-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
In-Reply-To: <20191225114943.17216-1-yuehaibing@huawei.com>
References: <20191225114943.17216-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.173.223.234]
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

core99_l2_cache/core99_l3_cache no need to mark as volatile,
just remove it.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
v2: remove 'volatile' qualifier
---
 arch/powerpc/platforms/powermac/smp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index f95fbde..69ad567 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -661,8 +661,8 @@ static void smp_core99_gpio_tb_freeze(int freeze)
 #endif /* !CONFIG_PPC64 */
 
 /* L2 and L3 cache settings to pass from CPU0 to CPU1 on G4 cpus */
-volatile static long int core99_l2_cache;
-volatile static long int core99_l3_cache;
+static long core99_l2_cache;
+static long core99_l3_cache;
 
 static void core99_init_caches(int cpu)
 {
-- 
2.7.4


