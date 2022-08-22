Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B0E59BBCC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 10:40:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MB5Qh2y2gz3chB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 18:40:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=<UNKNOWN>)
X-Greylist: delayed 971 seconds by postgrey-1.36 at boromir; Mon, 22 Aug 2022 18:39:49 AEST
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MB5QF0vDbz3000
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 18:39:46 +1000 (AEST)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.53])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MB4zR2LXtz1N7HW;
	Mon, 22 Aug 2022 16:20:03 +0800 (CST)
Received: from localhost.localdomain (10.67.164.66) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 22 Aug 2022 16:23:30 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <akpm@linux-foundation.org>, <linux-mm@kvack.org>,
	<linux-arm-kernel@lists.infradead.org>, <x86@kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v3 1/4] Revert "Documentation/features: mark BATCHED_UNMAP_TLB_FLUSH doesn't apply to ARM64"
Date: Mon, 22 Aug 2022 16:21:17 +0800
Message-ID: <20220822082120.8347-2-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220822082120.8347-1-yangyicong@huawei.com>
References: <20220822082120.8347-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.164.66]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500009.china.huawei.com (7.192.105.203)
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
Cc: wangkefeng.wang@huawei.com, darren@os.amperecomputing.com, peterz@infradead.org, yangyicong@hisilicon.com, guojian@oppo.com, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, zhangshiming@oppo.com, lipeifeng@oppo.com, corbet@lwn.net, anshuman.khandual@arm.com, Barry Song <21cnbao@gmail.com>, linux-mips@vger.kernel.org, arnd@arndb.de, realmz6@gmail.com, Barry Song <v-songbaohua@oppo.com>, openrisc@lists.librecores.org, prime.zeng@hisilicon.com, xhao@linux.alibaba.com, linux-kernel@vger.kernel.org, huzhanyuan@oppo.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Barry Song <v-songbaohua@oppo.com>

This reverts commit 6bfef171d0d74cb050112e0e49feb20bfddf7f42.

I was wrong. Though ARM64 has hardware TLB flush, but it is not free
and it is still expensive.
We still have a good chance to enable batched and deferred TLB flush
on ARM64 for memory reclamation. A possible way is that we only queue
tlbi instructions in hardware's queue. When we have to broadcast TLB,
we broadcast it by dsb. We just need to get adapted the existing
BATCHED_UNMAP_TLB_FLUSH.

Tested-by: Xin Hao <xhao@linux.alibaba.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 Documentation/features/arch-support.txt        | 1 -
 Documentation/features/vm/TLB/arch-support.txt | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/features/arch-support.txt b/Documentation/features/arch-support.txt
index 118ae031840b..d22a1095e661 100644
--- a/Documentation/features/arch-support.txt
+++ b/Documentation/features/arch-support.txt
@@ -8,5 +8,4 @@ The meaning of entries in the tables is:
     | ok |  # feature supported by the architecture
     |TODO|  # feature not yet supported by the architecture
     | .. |  # feature cannot be supported by the hardware
-    | N/A|  # feature doesn't apply to the architecture
 
diff --git a/Documentation/features/vm/TLB/arch-support.txt b/Documentation/features/vm/TLB/arch-support.txt
index 039e4e91ada3..1c009312b9c1 100644
--- a/Documentation/features/vm/TLB/arch-support.txt
+++ b/Documentation/features/vm/TLB/arch-support.txt
@@ -9,7 +9,7 @@
     |       alpha: | TODO |
     |         arc: | TODO |
     |         arm: | TODO |
-    |       arm64: | N/A  |
+    |       arm64: | TODO |
     |        csky: | TODO |
     |     hexagon: | TODO |
     |        ia64: | TODO |
-- 
2.24.0

