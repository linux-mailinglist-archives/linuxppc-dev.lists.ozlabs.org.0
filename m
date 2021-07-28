Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E22433D897E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 10:08:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZRBP69BNz3dgF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 18:08:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZR9H4VSzz3cnL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jul 2021 18:07:47 +1000 (AEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4GZR1n30c7zYdS8;
 Wed, 28 Jul 2021 16:01:17 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 16:07:13 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 28 Jul 2021 16:07:12 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <arnd@arndb.de>, <linux-arch@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <rostedt@goodmis.org>, <mingo@redhat.com>, <davem@davemloft.net>,
 <ast@kernel.org>, <ryabinin.a.a@gmail.com>
Subject: [PATCH v2 4/7] sections: Move is_kernel_inittext() into sections.h
Date: Wed, 28 Jul 2021 16:13:17 +0800
Message-ID: <20210728081320.20394-5-wangkefeng.wang@huawei.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, paulus@samba.org,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The is_kernel_inittext() and init_kernel_text() are with same
functionality, let's just keep is_kernel_inittext() and move
it into sections.h, then update all the callers.

Cc: Ingo Molnar <mingo@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: x86@kernel.org
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/x86/kernel/unwind_orc.c   |  2 +-
 include/asm-generic/sections.h | 14 ++++++++++++++
 include/linux/kallsyms.h       |  8 --------
 include/linux/kernel.h         |  1 -
 kernel/extable.c               | 12 ++----------
 5 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/arch/x86/kernel/unwind_orc.c b/arch/x86/kernel/unwind_orc.c
index a1202536fc57..d92ec2ced059 100644
--- a/arch/x86/kernel/unwind_orc.c
+++ b/arch/x86/kernel/unwind_orc.c
@@ -175,7 +175,7 @@ static struct orc_entry *orc_find(unsigned long ip)
 	}
 
 	/* vmlinux .init slow lookup: */
-	if (init_kernel_text(ip))
+	if (is_kernel_inittext(ip))
 		return __orc_find(__start_orc_unwind_ip, __start_orc_unwind,
 				  __stop_orc_unwind_ip - __start_orc_unwind_ip, ip);
 
diff --git a/include/asm-generic/sections.h b/include/asm-generic/sections.h
index 26ed9fc9b4e3..4f2f32aa2b7a 100644
--- a/include/asm-generic/sections.h
+++ b/include/asm-generic/sections.h
@@ -170,4 +170,18 @@ static inline bool is_kernel_rodata(unsigned long addr)
 	       addr < (unsigned long)__end_rodata;
 }
 
+/**
+ * is_kernel_inittext - checks if the pointer address is located in the
+ *                    .init.text section
+ *
+ * @addr: address to check
+ *
+ * Returns: true if the address is located in .init.text, false otherwise.
+ */
+static inline bool is_kernel_inittext(unsigned long addr)
+{
+	return addr >= (unsigned long)_sinittext &&
+	       addr < (unsigned long)_einittext;
+}
+
 #endif /* _ASM_GENERIC_SECTIONS_H_ */
diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
index b016c62f30a6..8a9d329c927c 100644
--- a/include/linux/kallsyms.h
+++ b/include/linux/kallsyms.h
@@ -24,14 +24,6 @@
 struct cred;
 struct module;
 
-static inline int is_kernel_inittext(unsigned long addr)
-{
-	if (addr >= (unsigned long)_sinittext
-	    && addr < (unsigned long)_einittext)
-		return 1;
-	return 0;
-}
-
 static inline int is_kernel_text(unsigned long addr)
 {
 	if ((addr >= (unsigned long)_stext && addr < (unsigned long)_etext))
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 0622418bafbc..d4ba46cf4737 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -229,7 +229,6 @@ extern bool parse_option_str(const char *str, const char *option);
 extern char *next_arg(char *args, char **param, char **val);
 
 extern int core_kernel_text(unsigned long addr);
-extern int init_kernel_text(unsigned long addr);
 extern int __kernel_text_address(unsigned long addr);
 extern int kernel_text_address(unsigned long addr);
 extern int func_ptr_is_kernel_text(void *ptr);
diff --git a/kernel/extable.c b/kernel/extable.c
index da26203841d4..98ca627ac5ef 100644
--- a/kernel/extable.c
+++ b/kernel/extable.c
@@ -62,14 +62,6 @@ const struct exception_table_entry *search_exception_tables(unsigned long addr)
 	return e;
 }
 
-int init_kernel_text(unsigned long addr)
-{
-	if (addr >= (unsigned long)_sinittext &&
-	    addr < (unsigned long)_einittext)
-		return 1;
-	return 0;
-}
-
 int notrace core_kernel_text(unsigned long addr)
 {
 	if (addr >= (unsigned long)_stext &&
@@ -77,7 +69,7 @@ int notrace core_kernel_text(unsigned long addr)
 		return 1;
 
 	if (system_state < SYSTEM_RUNNING &&
-	    init_kernel_text(addr))
+	    is_kernel_inittext(addr))
 		return 1;
 	return 0;
 }
@@ -94,7 +86,7 @@ int __kernel_text_address(unsigned long addr)
 	 * Since we are after the module-symbols check, there's
 	 * no danger of address overlap:
 	 */
-	if (init_kernel_text(addr))
+	if (is_kernel_inittext(addr))
 		return 1;
 	return 0;
 }
-- 
2.26.2

