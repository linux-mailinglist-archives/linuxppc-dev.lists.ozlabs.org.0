Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5827C138CE
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2019 12:27:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44x4tx4pRCzDqS5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2019 20:27:21 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44x4rj10K7zDqFh
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2019 20:25:23 +1000 (AEST)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5909689F2E5ECEAAF074;
 Sat,  4 May 2019 18:25:18 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.439.0; Sat, 4 May 2019
 18:25:11 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <benh@kernel.crashing.org>, <paulus@samba.org>, <mpe@ellerman.id.au>,
 <christophe.leroy@c-s.fr>, <aneesh.kumar@linux.vnet.ibm.com>
Subject: [PATCH -next] powerpc/book3s64: Make some symbols static
Date: Sat, 4 May 2019 18:24:27 +0800
Message-ID: <20190504102427.12332-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.177.31.96]
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

arch/powerpc/mm/book3s64/radix_pgtable.c:326:13: warning: symbol 'radix_init_pgtable' was not declared. Should it be static?
arch/powerpc/mm/book3s64/hash_native.c:48:1: warning: symbol 'native_tlbie_lock' was not declared. Should it be static?
arch/powerpc/mm/book3s64/hash_utils.c:988:24: warning: symbol 'init_hash_mm_context' was not declared. Should it be static?

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 arch/powerpc/mm/book3s64/hash_native.c   | 2 +-
 arch/powerpc/mm/book3s64/hash_utils.c    | 2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_native.c b/arch/powerpc/mm/book3s64/hash_native.c
index aaa28fd..47caecd 100644
--- a/arch/powerpc/mm/book3s64/hash_native.c
+++ b/arch/powerpc/mm/book3s64/hash_native.c
@@ -45,7 +45,7 @@
 #define HPTE_LOCK_BIT (56+3)
 #endif
 
-DEFINE_RAW_SPINLOCK(native_tlbie_lock);
+static DEFINE_RAW_SPINLOCK(native_tlbie_lock);
 
 static inline void tlbiel_hash_set_isa206(unsigned int set, unsigned int is)
 {
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 919a861..1ff4518 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -985,7 +985,7 @@ void __init hash__early_init_devtree(void)
 	htab_scan_page_sizes();
 }
 
-struct hash_mm_context init_hash_mm_context;
+static struct hash_mm_context init_hash_mm_context;
 void __init hash__early_init_mmu(void)
 {
 #ifndef CONFIG_PPC_64K_PAGES
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index c9bcf42..c929d31 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -323,7 +323,7 @@ static int __meminit create_physical_mapping(unsigned long start,
 	return 0;
 }
 
-void __init radix_init_pgtable(void)
+static void __init radix_init_pgtable(void)
 {
 	unsigned long rts_field;
 	struct memblock_region *reg;
-- 
2.7.4


