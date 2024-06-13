Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9548D907E88
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 00:04:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0bzT3lpVz3dDn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 08:04:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=zhengyejian1@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0PBc6V6Nz3bqP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 23:58:16 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4W0Ncy3KstzwTml;
	Thu, 13 Jun 2024 21:32:34 +0800 (CST)
Received: from dggpeml500012.china.huawei.com (unknown [7.185.36.15])
	by mail.maildlp.com (Postfix) with ESMTPS id BFC44140154;
	Thu, 13 Jun 2024 21:36:41 +0800 (CST)
Received: from localhost.localdomain (10.67.175.61) by
 dggpeml500012.china.huawei.com (7.185.36.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 13 Jun 2024 21:36:41 +0800
From: Zheng Yejian <zhengyejian1@huawei.com>
To: <rostedt@goodmis.org>, <mhiramat@kernel.org>, <mark.rutland@arm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen.n.rao@linux.ibm.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	<hpa@zytor.com>, <mcgrof@kernel.org>, <mathieu.desnoyers@efficios.com>,
	<masahiroy@kernel.org>, <nathan@kernel.org>, <nicolas@fjasle.eu>,
	<kees@kernel.org>, <james.clark@arm.com>, <kent.overstreet@linux.dev>,
	<yhs@fb.com>, <jpoimboe@kernel.org>, <peterz@infradead.org>
Subject: [PATCH 6/6] ftrace: Revert the FTRACE_MCOUNT_MAX_OFFSET workaround
Date: Thu, 13 Jun 2024 21:37:11 +0800
Message-ID: <20240613133711.2867745-7-zhengyejian1@huawei.com>
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

After patch titled "ftrace: Skip invalid __fentry__ in
ftrace_process_locs()", __fentry__ locations in overridden weak function
have been checked and skipped, then all records in ftrace_pages are
valid, the FTRACE_MCOUNT_MAX_OFFSET workaround can be reverted, include:
 1. commit b39181f7c690 ("ftrace: Add FTRACE_MCOUNT_MAX_OFFSET to avoid
    adding weak function")
 2. commit 7af82ff90a2b ("powerpc/ftrace: Ignore weak functions")
 3. commit f6834c8c59a8 ("powerpc/ftrace: Fix dropping weak symbols with
    older toolchains")

Signed-off-by: Zheng Yejian <zhengyejian1@huawei.com>
---
 arch/powerpc/include/asm/ftrace.h |   7 --
 arch/x86/include/asm/ftrace.h     |   7 --
 kernel/trace/ftrace.c             | 141 +-----------------------------
 3 files changed, 2 insertions(+), 153 deletions(-)

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index 107fc5a48456..d6ed058c8041 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -10,13 +10,6 @@
 
 #define HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
 
-/* Ignore unused weak functions which will have larger offsets */
-#if defined(CONFIG_MPROFILE_KERNEL) || defined(CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY)
-#define FTRACE_MCOUNT_MAX_OFFSET	16
-#elif defined(CONFIG_PPC32)
-#define FTRACE_MCOUNT_MAX_OFFSET	8
-#endif
-
 #ifndef __ASSEMBLY__
 extern void _mcount(void);
 
diff --git a/arch/x86/include/asm/ftrace.h b/arch/x86/include/asm/ftrace.h
index 897cf02c20b1..7a147c9da08d 100644
--- a/arch/x86/include/asm/ftrace.h
+++ b/arch/x86/include/asm/ftrace.h
@@ -9,13 +9,6 @@
 # define MCOUNT_ADDR		((unsigned long)(__fentry__))
 #define MCOUNT_INSN_SIZE	5 /* sizeof mcount call */
 
-/* Ignore unused weak functions which will have non zero offsets */
-#ifdef CONFIG_HAVE_FENTRY
-# include <asm/ibt.h>
-/* Add offset for endbr64 if IBT enabled */
-# define FTRACE_MCOUNT_MAX_OFFSET	ENDBR_INSN_SIZE
-#endif
-
 #ifdef CONFIG_DYNAMIC_FTRACE
 #define ARCH_SUPPORTS_FTRACE_OPS 1
 #endif
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index c46c35ac9b42..1d60dc9a850b 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -49,8 +49,6 @@
 #define FTRACE_NOCLEAR_FLAGS	(FTRACE_FL_DISABLED | FTRACE_FL_TOUCHED | \
 				 FTRACE_FL_MODIFIED)
 
-#define FTRACE_INVALID_FUNCTION		"__ftrace_invalid_address__"
-
 #define FTRACE_WARN_ON(cond)			\
 	({					\
 		int ___r = cond;		\
@@ -3709,105 +3707,6 @@ static void add_trampoline_func(struct seq_file *m, struct ftrace_ops *ops,
 		seq_printf(m, " ->%pS", ptr);
 }
 
-#ifdef FTRACE_MCOUNT_MAX_OFFSET
-/*
- * Weak functions can still have an mcount/fentry that is saved in
- * the __mcount_loc section. These can be detected by having a
- * symbol offset of greater than FTRACE_MCOUNT_MAX_OFFSET, as the
- * symbol found by kallsyms is not the function that the mcount/fentry
- * is part of. The offset is much greater in these cases.
- *
- * Test the record to make sure that the ip points to a valid kallsyms
- * and if not, mark it disabled.
- */
-static int test_for_valid_rec(struct dyn_ftrace *rec)
-{
-	char str[KSYM_SYMBOL_LEN];
-	unsigned long offset;
-	const char *ret;
-
-	ret = kallsyms_lookup(rec->ip, NULL, &offset, NULL, str);
-
-	/* Weak functions can cause invalid addresses */
-	if (!ret || offset > FTRACE_MCOUNT_MAX_OFFSET) {
-		rec->flags |= FTRACE_FL_DISABLED;
-		return 0;
-	}
-	return 1;
-}
-
-static struct workqueue_struct *ftrace_check_wq __initdata;
-static struct work_struct ftrace_check_work __initdata;
-
-/*
- * Scan all the mcount/fentry entries to make sure they are valid.
- */
-static __init void ftrace_check_work_func(struct work_struct *work)
-{
-	struct ftrace_page *pg;
-	struct dyn_ftrace *rec;
-
-	mutex_lock(&ftrace_lock);
-	do_for_each_ftrace_rec(pg, rec) {
-		test_for_valid_rec(rec);
-	} while_for_each_ftrace_rec();
-	mutex_unlock(&ftrace_lock);
-}
-
-static int __init ftrace_check_for_weak_functions(void)
-{
-	INIT_WORK(&ftrace_check_work, ftrace_check_work_func);
-
-	ftrace_check_wq = alloc_workqueue("ftrace_check_wq", WQ_UNBOUND, 0);
-
-	queue_work(ftrace_check_wq, &ftrace_check_work);
-	return 0;
-}
-
-static int __init ftrace_check_sync(void)
-{
-	/* Make sure the ftrace_check updates are finished */
-	if (ftrace_check_wq)
-		destroy_workqueue(ftrace_check_wq);
-	return 0;
-}
-
-late_initcall_sync(ftrace_check_sync);
-subsys_initcall(ftrace_check_for_weak_functions);
-
-static int print_rec(struct seq_file *m, unsigned long ip)
-{
-	unsigned long offset;
-	char str[KSYM_SYMBOL_LEN];
-	char *modname;
-	const char *ret;
-
-	ret = kallsyms_lookup(ip, NULL, &offset, &modname, str);
-	/* Weak functions can cause invalid addresses */
-	if (!ret || offset > FTRACE_MCOUNT_MAX_OFFSET) {
-		snprintf(str, KSYM_SYMBOL_LEN, "%s_%ld",
-			 FTRACE_INVALID_FUNCTION, offset);
-		ret = NULL;
-	}
-
-	seq_puts(m, str);
-	if (modname)
-		seq_printf(m, " [%s]", modname);
-	return ret == NULL ? -1 : 0;
-}
-#else
-static inline int test_for_valid_rec(struct dyn_ftrace *rec)
-{
-	return 1;
-}
-
-static inline int print_rec(struct seq_file *m, unsigned long ip)
-{
-	seq_printf(m, "%ps", (void *)ip);
-	return 0;
-}
-#endif
-
 static int t_show(struct seq_file *m, void *v)
 {
 	struct ftrace_iterator *iter = m->private;
@@ -3835,13 +3734,7 @@ static int t_show(struct seq_file *m, void *v)
 	if (iter->flags & FTRACE_ITER_ADDRS)
 		seq_printf(m, "%lx ", rec->ip);
 
-	if (print_rec(m, rec->ip)) {
-		/* This should only happen when a rec is disabled */
-		WARN_ON_ONCE(!(rec->flags & FTRACE_FL_DISABLED));
-		seq_putc(m, '\n');
-		return 0;
-	}
-
+	seq_printf(m, "%ps", (void *)rec->ip);
 	if (iter->flags & (FTRACE_ITER_ENABLED | FTRACE_ITER_TOUCHED)) {
 		struct ftrace_ops *ops;
 
@@ -4221,24 +4114,6 @@ add_rec_by_index(struct ftrace_hash *hash, struct ftrace_glob *func_g,
 	return 0;
 }
 
-#ifdef FTRACE_MCOUNT_MAX_OFFSET
-static int lookup_ip(unsigned long ip, char **modname, char *str)
-{
-	unsigned long offset;
-
-	kallsyms_lookup(ip, NULL, &offset, modname, str);
-	if (offset > FTRACE_MCOUNT_MAX_OFFSET)
-		return -1;
-	return 0;
-}
-#else
-static int lookup_ip(unsigned long ip, char **modname, char *str)
-{
-	kallsyms_lookup(ip, NULL, NULL, modname, str);
-	return 0;
-}
-#endif
-
 static int
 ftrace_match_record(struct dyn_ftrace *rec, struct ftrace_glob *func_g,
 		struct ftrace_glob *mod_g, int exclude_mod)
@@ -4246,12 +4121,7 @@ ftrace_match_record(struct dyn_ftrace *rec, struct ftrace_glob *func_g,
 	char str[KSYM_SYMBOL_LEN];
 	char *modname;
 
-	if (lookup_ip(rec->ip, &modname, str)) {
-		/* This should only happen when a rec is disabled */
-		WARN_ON_ONCE(system_state == SYSTEM_RUNNING &&
-			     !(rec->flags & FTRACE_FL_DISABLED));
-		return 0;
-	}
+	kallsyms_lookup(rec->ip, NULL, NULL, &modname, str);
 
 	if (mod_g) {
 		int mod_matches = (modname) ? ftrace_match(modname, mod_g) : 0;
@@ -6887,13 +6757,6 @@ void ftrace_module_enable(struct module *mod)
 		if (!within_module(rec->ip, mod))
 			break;
 
-		/* Weak functions should still be ignored */
-		if (!test_for_valid_rec(rec)) {
-			/* Clear all other flags. Should not be enabled anyway */
-			rec->flags = FTRACE_FL_DISABLED;
-			continue;
-		}
-
 		cnt = 0;
 
 		/*
-- 
2.25.1

