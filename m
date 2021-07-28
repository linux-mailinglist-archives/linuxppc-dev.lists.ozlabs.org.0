Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5F53D8981
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 10:09:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZRCP6wv7z30H5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 18:09:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZR9L5dYrz3dBy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jul 2021 18:07:50 +1000 (AEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GZR4h6NLZzZtq0;
 Wed, 28 Jul 2021 16:03:48 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 16:07:14 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 16:07:14 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <arnd@arndb.de>, <linux-arch@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <rostedt@goodmis.org>, <mingo@redhat.com>, <davem@davemloft.net>,
 <ast@kernel.org>, <ryabinin.a.a@gmail.com>
Subject: [PATCH v2 6/7] sections: Add new is_kernel() and is_kernel_text()
Date: Wed, 28 Jul 2021 16:13:19 +0800
Message-ID: <20210728081320.20394-7-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210728081320.20394-1-wangkefeng.wang@huawei.com>
References: <20210728081320.20394-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The new is_kernel() check the kernel address ranges, and the
new is_kernel_text() check the kernel text section ranges.

Then use them to make some code clear.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 include/asm-generic/sections.h | 27 +++++++++++++++++++++++++++
 include/linux/kallsyms.h       |  4 ++--
 kernel/extable.c               |  3 +--
 mm/kasan/report.c              |  2 +-
 4 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
index 4f2f32aa2b7a..6b143637ab88 100644
--- a/include/asm-generic/sections.h
+++ b/include/asm-generic/sections.h
@@ -170,6 +170,20 @@ static inline bool is_kernel_rodata(unsigned long addr)
 	       addr < (unsigned long)__end_rodata;
 }
 
+/**
+ * is_kernel_text - checks if the pointer address is located in the
+ *                  .text section
+ *
+ * @addr: address to check
+ *
+ * Returns: true if the address is located in .text, false otherwise.
+ */
+static inline bool is_kernel_text(unsigned long addr)
+{
+	return addr >= (unsigned long)_stext &&
+	       addr < (unsigned long)_etext;
+}
+
 /**
  * is_kernel_inittext - checks if the pointer address is located in the
  *                    .init.text section
@@ -184,4 +198,17 @@ static inline bool is_kernel_inittext(unsigned long addr)
 	       addr < (unsigned long)_einittext;
 }
 
+/**
+ * is_kernel - checks if the pointer address is located in the kernel range
+ *
+ * @addr: address to check
+ *
+ * Returns: true if the address is located in kernel range, false otherwise.
+ */
+static inline bool is_kernel(unsigned long addr)
+{
+	return addr >= (unsigned long)_stext &&
+	       addr < (unsigned long)_end;
+}
+
 #endif /* _ASM_GENERIC_SECTIONS_H_ */
diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
index 4f501ac9c2c2..897d5720884f 100644
--- a/include/linux/kallsyms.h
+++ b/include/linux/kallsyms.h
@@ -26,14 +26,14 @@ struct module;
 
 static inline int is_kernel_text_or_gate_area(unsigned long addr)
 {
-	if ((addr >= (unsigned long)_stext && addr < (unsigned long)_etext))
+	if (is_kernel_text(addr))
 		return 1;
 	return in_gate_area_no_mm(addr);
 }
 
 static inline int is_kernel_or_gate_area(unsigned long addr)
 {
-	if (addr >= (unsigned long)_stext && addr < (unsigned long)_end)
+	if (is_kernel(addr))
 		return 1;
 	return in_gate_area_no_mm(addr);
 }
diff --git a/kernel/extable.c b/kernel/extable.c
index 98ca627ac5ef..0ba383d850ff 100644
--- a/kernel/extable.c
+++ b/kernel/extable.c
@@ -64,8 +64,7 @@ const struct exception_table_entry *search_exception_tables(unsigned long addr)
 
 int notrace core_kernel_text(unsigned long addr)
 {
-	if (addr >= (unsigned long)_stext &&
-	    addr < (unsigned long)_etext)
+	if (is_kernel_text(addr))
 		return 1;
 
 	if (system_state < SYSTEM_RUNNING &&
diff --git a/mm/kasan/report.c b/mm/kasan/report.c
index 884a950c7026..88f5b0c058b7 100644
--- a/mm/kasan/report.c
+++ b/mm/kasan/report.c
@@ -235,7 +235,7 @@ static void describe_object(struct kmem_cache *cache, void *object,
 
 static inline bool kernel_or_module_addr(const void *addr)
 {
-	if (addr >= (void *)_stext && addr < (void *)_end)
+	if (is_kernel((unsigned long)addr))
 		return true;
 	if (is_module_address((unsigned long)addr))
 		return true;
-- 
2.26.2

