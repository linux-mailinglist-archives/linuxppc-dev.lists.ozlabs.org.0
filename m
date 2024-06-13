Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1266907E7F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 00:02:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0bxF3myrz3dDn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 08:02:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=zhengyejian1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0P5316mNz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 23:53:27 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4W0Ncx4JDtzwTlf;
	Thu, 13 Jun 2024 21:32:33 +0800 (CST)
Received: from dggpeml500012.china.huawei.com (unknown [7.185.36.15])
	by mail.maildlp.com (Postfix) with ESMTPS id E049B140154;
	Thu, 13 Jun 2024 21:36:40 +0800 (CST)
Received: from localhost.localdomain (10.67.175.61) by
 dggpeml500012.china.huawei.com (7.185.36.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 21:36:40 +0800
From: Zheng Yejian <zhengyejian1@huawei.com>
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>, <mark.rutland@arm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen.n.rao@linux.ibm.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <mcgrof@kernel.org>, <mathieu.desnoyers@efficios.com>,
	<masahiroy@kernel.org>, <nathan@kernel.org>, <nicolas@fjasle.eu>,
	<kees@kernel.org>, <james.clark@arm.com>, <kent.overstreet@linux.dev>,
	<yhs@fb.com>, <jpoimboe@kernel.org>, <peterz@infradead.org>
Subject: [PATCH 3/6] module: kallsyms: Determine exact function size
Date: Thu, 13 Jun 2024 21:37:08 +0800
Message-ID: <20240613133711.2867745-4-zhengyejian1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613133711.2867745-1-zhengyejian1@huawei.com>
References: <20240613133711.2867745-1-zhengyejian1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.175.61]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500012.china.huawei.com (7.185.36.15)
X-Mailman-Approved-At: Fri, 14 Jun 2024 08:01:41 +1000
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
Cc: zhengyejian1@huawei.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When a weak type function is overridden, its symbol will be removed
from the symbol table, but its code will not been removed. It will
cause find_kallsyms_symbol() to compute a larger function size than
it actually is, just because symbol of its following weak function is
removed.

To fix this issue, check that an given address is within the size of
the function found.

Signed-off-by: Zheng Yejian <zhengyejian1@huawei.com>
---
 include/linux/module.h   |  7 +++++++
 kernel/module/kallsyms.c | 19 +++++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index ffa1c603163c..13518f464d3f 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -597,6 +597,13 @@ static inline unsigned long kallsyms_symbol_value(const Elf_Sym *sym)
 }
 #endif
 
+#ifndef HAVE_ARCH_KALLSYMS_SYMBOL_TYPE
+static inline unsigned int kallsyms_symbol_type(const Elf_Sym *sym)
+{
+	return ELF_ST_TYPE(sym->st_info);
+}
+#endif
+
 /* FIXME: It'd be nice to isolate modules during init, too, so they
    aren't used before they (may) fail.  But presently too much code
    (IDE & SCSI) require entry into the module during init.*/
diff --git a/kernel/module/kallsyms.c b/kernel/module/kallsyms.c
index 62fb57bb9f16..092ae6f43dad 100644
--- a/kernel/module/kallsyms.c
+++ b/kernel/module/kallsyms.c
@@ -262,6 +262,7 @@ static const char *find_kallsyms_symbol(struct module *mod,
 	unsigned long nextval, bestval;
 	struct mod_kallsyms *kallsyms = rcu_dereference_sched(mod->kallsyms);
 	struct module_memory *mod_mem;
+	const Elf_Sym *sym;
 
 	/* At worse, next value is at end of module */
 	if (within_module_init(addr, mod))
@@ -278,9 +279,10 @@ static const char *find_kallsyms_symbol(struct module *mod,
 	 * starts real symbols at 1).
 	 */
 	for (i = 1; i < kallsyms->num_symtab; i++) {
-		const Elf_Sym *sym = &kallsyms->symtab[i];
-		unsigned long thisval = kallsyms_symbol_value(sym);
+		unsigned long thisval;
 
+		sym = &kallsyms->symtab[i];
+		thisval = kallsyms_symbol_value(sym);
 		if (sym->st_shndx == SHN_UNDEF)
 			continue;
 
@@ -292,6 +294,13 @@ static const char *find_kallsyms_symbol(struct module *mod,
 		    is_mapping_symbol(kallsyms_symbol_name(kallsyms, i)))
 			continue;
 
+		if (kallsyms_symbol_type(sym) == STT_FUNC &&
+		    addr >= thisval && addr < thisval + sym->st_size) {
+			best = i;
+			bestval = thisval;
+			nextval = thisval + sym->st_size;
+			goto find;
+		}
 		if (thisval <= addr && thisval > bestval) {
 			best = i;
 			bestval = thisval;
@@ -303,6 +312,12 @@ static const char *find_kallsyms_symbol(struct module *mod,
 	if (!best)
 		return NULL;
 
+	sym = &kallsyms->symtab[best];
+	if (kallsyms_symbol_type(sym) == STT_FUNC && sym->st_size &&
+	    addr >= kallsyms_symbol_value(sym) + sym->st_size)
+		return NULL;
+
+find:
 	if (size)
 		*size = nextval - bestval;
 	if (offset)
-- 
2.25.1

