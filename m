Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7648380408
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 09:11:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FhKSm5PLWz2ykS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 May 2021 17:11:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FhKSL6ZYPz2ykF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 May 2021 17:10:55 +1000 (AEST)
Received: from dggems704-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FhKP0014jzBvLN;
 Fri, 14 May 2021 15:08:03 +0800 (CST)
Received: from dggema769-chm.china.huawei.com (10.1.198.211) by
 dggems704-chm.china.huawei.com (10.3.19.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Fri, 14 May 2021 15:10:46 +0800
Received: from localhost (10.174.179.215) by dggema769-chm.china.huawei.com
 (10.1.198.211) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 14
 May 2021 15:10:45 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>
Subject: [PATCH -next] powerpc/pseries/memhotplug: Remove unused inline
 function dlpar_memory_remove()
Date: Fri, 14 May 2021 15:10:41 +0800
Message-ID: <20210514071041.17432-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggema769-chm.china.huawei.com (10.1.198.211)
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

dlpar_memory_remove() is never used, so can be removed.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/powerpc/platforms/pseries/hotplug-memory.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 8377f1f7c78e..3d93f1c48e23 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -585,10 +585,6 @@ static inline int pseries_remove_mem_node(struct device_node *np)
 {
 	return 0;
 }
-static inline int dlpar_memory_remove(struct pseries_hp_errorlog *hp_elog)
-{
-	return -EOPNOTSUPP;
-}
 static int dlpar_remove_lmb(struct drmem_lmb *lmb)
 {
 	return -EOPNOTSUPP;
-- 
2.17.1

