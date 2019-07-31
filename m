Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D08FB7BD64
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 11:39:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45z7fj1L2xzDqRs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 19:39:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.191; helo=huawei.com; envelope-from=yanaijie@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45z7N45N7fzDqRj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 19:26:28 +1000 (AEST)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 6415EE926006C7F60C56;
 Wed, 31 Jul 2019 17:26:18 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Wed, 31 Jul 2019
 17:26:10 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>,
 <diana.craciun@nxp.com>, <christophe.leroy@c-s.fr>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>
Subject: [PATCH v3 02/10] powerpc: move memstart_addr and kernstart_addr to
 init-common.c
Date: Wed, 31 Jul 2019 17:43:10 +0800
Message-ID: <20190731094318.26538-3-yanaijie@huawei.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190731094318.26538-1-yanaijie@huawei.com>
References: <20190731094318.26538-1-yanaijie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.124.28]
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
Cc: wangkefeng.wang@huawei.com, Jason Yan <yanaijie@huawei.com>,
 linux-kernel@vger.kernel.org, jingxiangfeng@huawei.com,
 zhaohongjiang@huawei.com, thunder.leizhen@huawei.com, fanchengyang@huawei.com,
 yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These two variables are both defined in init_32.c and init_64.c. Move
them to init-common.c.

Signed-off-by: Jason Yan <yanaijie@huawei.com>
Cc: Diana Craciun <diana.craciun@nxp.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Kees Cook <keescook@chromium.org>
Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/init-common.c | 5 +++++
 arch/powerpc/mm/init_32.c     | 5 -----
 arch/powerpc/mm/init_64.c     | 5 -----
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/mm/init-common.c b/arch/powerpc/mm/init-common.c
index a84da92920f7..152ae0d21435 100644
--- a/arch/powerpc/mm/init-common.c
+++ b/arch/powerpc/mm/init-common.c
@@ -21,6 +21,11 @@
 #include <asm/pgtable.h>
 #include <asm/kup.h>
 
+phys_addr_t memstart_addr = (phys_addr_t)~0ull;
+EXPORT_SYMBOL_GPL(memstart_addr);
+phys_addr_t kernstart_addr;
+EXPORT_SYMBOL_GPL(kernstart_addr);
+
 static bool disable_kuep = !IS_ENABLED(CONFIG_PPC_KUEP);
 static bool disable_kuap = !IS_ENABLED(CONFIG_PPC_KUAP);
 
diff --git a/arch/powerpc/mm/init_32.c b/arch/powerpc/mm/init_32.c
index b04896a88d79..872df48ae41b 100644
--- a/arch/powerpc/mm/init_32.c
+++ b/arch/powerpc/mm/init_32.c
@@ -56,11 +56,6 @@
 phys_addr_t total_memory;
 phys_addr_t total_lowmem;
 
-phys_addr_t memstart_addr = (phys_addr_t)~0ull;
-EXPORT_SYMBOL(memstart_addr);
-phys_addr_t kernstart_addr;
-EXPORT_SYMBOL(kernstart_addr);
-
 #ifdef CONFIG_RELOCATABLE
 /* Used in __va()/__pa() */
 long long virt_phys_offset;
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index a44f6281ca3a..c836f1269ee7 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -63,11 +63,6 @@
 
 #include <mm/mmu_decl.h>
 
-phys_addr_t memstart_addr = ~0;
-EXPORT_SYMBOL_GPL(memstart_addr);
-phys_addr_t kernstart_addr;
-EXPORT_SYMBOL_GPL(kernstart_addr);
-
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
 /*
  * Given an address within the vmemmap, determine the pfn of the page that
-- 
2.17.2

