Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A590741D436
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 09:12:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HKkw34Lbnz300x
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Sep 2021 17:12:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HKkrv19WLz3c5f
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Sep 2021 17:09:51 +1000 (AEST)
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HKkph62DZzWHtG;
 Thu, 30 Sep 2021 15:07:56 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 30 Sep 2021 15:09:17 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Thu, 30 Sep 2021 15:09:16 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <arnd@arndb.de>, <linux-arch@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <rostedt@goodmis.org>, <mingo@redhat.com>, <davem@davemloft.net>,
 <ast@kernel.org>, <ryabinin.a.a@gmail.com>, <akpm@linux-foundation.org>
Subject: [PATCH v4 05/11] x86: mm: Rename __is_kernel_text() to
 is_x86_32_kernel_text()
Date: Thu, 30 Sep 2021 15:11:37 +0800
Message-ID: <20210930071143.63410-6-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210930071143.63410-1-wangkefeng.wang@huawei.com>
References: <20210930071143.63410-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500001.china.huawei.com (7.185.36.107)
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, paulus@samba.org,
 linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
 bpf@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit b56cd05c55a1 ("x86/mm: Rename is_kernel_text to __is_kernel_text"),
add '__' prefix not to get in conflict with existing is_kernel_text() in
<linux/kallsyms.h>.

We will add __is_kernel_text() for the basic kernel text range check in the
next patch, so use private is_x86_32_kernel_text() naming for x86 special
check.

Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/x86/mm/init_32.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/x86/mm/init_32.c b/arch/x86/mm/init_32.c
index bd90b8fe81e4..523743ee9dea 100644
--- a/arch/x86/mm/init_32.c
+++ b/arch/x86/mm/init_32.c
@@ -238,11 +238,7 @@ page_table_range_init(unsigned long start, unsigned long end, pgd_t *pgd_base)
 	}
 }
 
-/*
- * The <linux/kallsyms.h> already defines is_kernel_text,
- * using '__' prefix not to get in conflict.
- */
-static inline int __is_kernel_text(unsigned long addr)
+static inline int is_x86_32_kernel_text(unsigned long addr)
 {
 	if (addr >= (unsigned long)_text && addr <= (unsigned long)__init_end)
 		return 1;
@@ -333,8 +329,8 @@ kernel_physical_mapping_init(unsigned long start,
 				addr2 = (pfn + PTRS_PER_PTE-1) * PAGE_SIZE +
 					PAGE_OFFSET + PAGE_SIZE-1;
 
-				if (__is_kernel_text(addr) ||
-				    __is_kernel_text(addr2))
+				if (is_x86_32_kernel_text(addr) ||
+				    is_x86_32_kernel_text(addr2))
 					prot = PAGE_KERNEL_LARGE_EXEC;
 
 				pages_2m++;
@@ -359,7 +355,7 @@ kernel_physical_mapping_init(unsigned long start,
 				 */
 				pgprot_t init_prot = __pgprot(PTE_IDENT_ATTR);
 
-				if (__is_kernel_text(addr))
+				if (is_x86_32_kernel_text(addr))
 					prot = PAGE_KERNEL_EXEC;
 
 				pages_4k++;
@@ -820,7 +816,7 @@ static void mark_nxdata_nx(void)
 	 */
 	unsigned long start = PFN_ALIGN(_etext);
 	/*
-	 * This comes from __is_kernel_text upper limit. Also HPAGE where used:
+	 * This comes from is_x86_32_kernel_text upper limit. Also HPAGE where used:
 	 */
 	unsigned long size = (((unsigned long)__init_end + HPAGE_SIZE) & HPAGE_MASK) - start;
 
-- 
2.26.2

