Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB762AE67D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 03:42:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CW8CX6jZVzDqW2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 13:42:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.190; helo=szxga04-in.huawei.com;
 envelope-from=zhangxiaoxu5@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CW7Nm13CLzDqCg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 13:05:25 +1100 (AEDT)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CW7NJ44D7zkj08;
 Wed, 11 Nov 2020 10:05:04 +0800 (CST)
Received: from localhost.localdomain (10.175.101.6) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Wed, 11 Nov 2020 10:05:05 +0800
From: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
To: <tyreld@linux.ibm.com>, <zhangxiaoxu5@huawei.com>,
 <linuxppc-dev@lists.ozlabs.org>, <mpe@ellerman.id.au>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <groug@kaod.org>
Subject: [PATCH] Revert "powerpc/pseries/hotplug-cpu: Remove double free in
 error path"
Date: Tue, 10 Nov 2020 21:07:52 -0500
Message-ID: <20201111020752.1686139-1-zhangxiaoxu5@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 11 Nov 2020 13:41:06 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit a0ff72f9f5a780341e7ff5e9ba50a0dad5fa1980.

Since the commit b015f6bc9547 ("powerpc/pseries: Add cpu DLPAR
support for drc-info property"), the 'cpu_drcs' wouldn't be double
freed when the 'cpus' node not found.

So we needn't apply this patch, otherwise, the memory will be leak.

Fixes: a0ff72f9f5a7 ("powerpc/pseries/hotplug-cpu: Remove double free in error path")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
---
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index f2837e33bf5d..4bb1c9f2bb11 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -743,6 +743,7 @@ static int dlpar_cpu_add_by_count(u32 cpus_to_add)
 	parent = of_find_node_by_path("/cpus");
 	if (!parent) {
 		pr_warn("Could not find CPU root node in device tree\n");
+		kfree(cpu_drcs);
 		return -1;
 	}
 
-- 
2.25.4

