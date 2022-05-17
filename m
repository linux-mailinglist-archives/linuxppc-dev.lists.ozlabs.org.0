Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF7B529E77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 11:49:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2WYX5yQQz3c8l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 19:49:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com;
 envelope-from=yuehaibing@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2WY76hKpz2yXM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 19:49:15 +1000 (AEST)
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4L2WX76253zcmxx;
 Tue, 17 May 2022 17:48:23 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 17 May
 2022 17:49:11 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <mpe@ellerman.id.au>, <benh@kernel.crashing.org>, <paulus@samba.org>
Subject: [PATCH -next] powerpc/kaslr_booke: Fix build error
Date: Tue, 17 May 2022 17:49:00 +0800
Message-ID: <20220517094900.14900-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500007.china.huawei.com (7.192.104.62)
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

arch/powerpc/mm/nohash/kaslr_booke.c: In function ‘kaslr_get_cmdline’:
arch/powerpc/mm/nohash/kaslr_booke.c:46:2: error: implicit declaration of function ‘early_init_dt_scan_chosen’; did you mean ‘early_init_mmu_secondary’? [-Werror=implicit-function-declaration]
  early_init_dt_scan_chosen(boot_command_line);
  ^~~~~~~~~~~~~~~~~~~~~~~~~
  early_init_mmu_secondary
arch/powerpc/mm/nohash/kaslr_booke.c: In function ‘get_initrd_range’:
arch/powerpc/mm/nohash/kaslr_booke.c:210:10: error: implicit declaration of function ‘of_read_number’; did you mean ‘seq_read_iter’? [-Werror=implicit-function-declaration]
  start = of_read_number(prop, len / 4);
          ^~~~~~~~~~~~~~
          seq_read_iter

Add missing include files to fix this.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/powerpc/mm/nohash/kaslr_booke.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
index 5da604cd2be6..1f3f9fedf1bc 100644
--- a/arch/powerpc/mm/nohash/kaslr_booke.c
+++ b/arch/powerpc/mm/nohash/kaslr_booke.c
@@ -14,6 +14,8 @@
 #include <linux/memblock.h>
 #include <linux/libfdt.h>
 #include <linux/crash_core.h>
+#include <linux/of.h>
+#include <linux/of_fdt.h>
 #include <asm/cacheflush.h>
 #include <asm/kdump.h>
 #include <mm/mmu_decl.h>
-- 
2.17.1

