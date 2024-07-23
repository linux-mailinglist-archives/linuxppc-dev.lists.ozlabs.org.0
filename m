Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C307939C18
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 09:58:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSqKR2dtZz3fvw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 17:58:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huaweicloud.com (client-ip=45.249.212.56; helo=dggsgout12.his.huawei.com; envelope-from=zhengyejian@huaweicloud.com; receiver=lists.ozlabs.org)
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSnpY06brz3clL
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 16:50:28 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4WSnP146mVz4f3khK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 14:31:49 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id EE73B1A0568
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 14:32:01 +0800 (CST)
Received: from localhost.localdomain (unknown [10.67.175.61])
	by APP2 (Coremail) with SMTP id Syh0CgA34wpOTp9mjImuAw--.48686S7;
	Tue, 23 Jul 2024 14:32:01 +0800 (CST)
From: Zheng Yejian <zhengyejian@huaweicloud.com>
To: masahiroy@kernel.org,
	peterz@infradead.org,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen.n.rao@linux.ibm.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	mcgrof@kernel.org,
	mathieu.desnoyers@efficios.com,
	nathan@kernel.org,
	nicolas@fjasle.eu,
	ojeda@kernel.org,
	akpm@linux-foundation.org,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kent.overstreet@linux.dev,
	james.clark@arm.com,
	jpoimboe@kernel.org
Subject: [PATCH v2 5/5] ftrace: Revert the FTRACE_MCOUNT_MAX_OFFSET workaround
Date: Tue, 23 Jul 2024 14:32:58 +0800
Message-Id: <20240723063258.2240610-6-zhengyejian@huaweicloud.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240723063258.2240610-1-zhengyejian@huaweicloud.com>
References: <20240723063258.2240610-1-zhengyejian@huaweicloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Syh0CgA34wpOTp9mjImuAw--.48686S7
X-Coremail-Antispam: 1UD129KBjvJXoWxKFy7Cw17Zw1kCFy7CF4kWFg_yoW3GFWfpF
	ZIya1qgrW7CF4jga9Fgr1DCFyakrn0kryaq3yDG34FywnYqr4j9F92yrWqvr97JrWkCa4f
	XFW7ZrW2yFnxZ3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmS14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr1j6r
	xdM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0D
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
	IY04v7MxkF7I0En4kS14v26rWY6Fy7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF
	4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBI
	daVFxhVjvjDU0xZFpf9x0pR4E__UUUUU=
X-CM-SenderInfo: x2kh0w51hmxt3q6k3tpzhluzxrxghudrp/
X-Mailman-Approved-At: Tue, 23 Jul 2024 17:56:45 +1000
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
Cc: zhengyejian@huaweicloud.com, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
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

Signed-off-by: Zheng Yejian <zhengyejian@huaweicloud.com>
---
 arch/powerpc/include/asm/ftrace.h |   7 --
 arch/x86/include/asm/ftrace.h     |   7 --
 kernel/trace/ftrace.c             | 141 +-----------------------------
 3 files changed, 2 insertions(+), 153 deletions(-)

diff --git a/arch/powerpc/include/asm/ftrace.h b/arch/powerpc/include/asm/ftrace.h
index 559560286e6d..328cf55acfb7 100644
--- a/arch/powerpc/include/asm/ftrace.h
+++ b/arch/powerpc/include/asm/ftrace.h
@@ -8,13 +8,6 @@
 #define MCOUNT_ADDR		((unsigned long)(_mcount))
 #define MCOUNT_INSN_SIZE	4 /* sizeof mcount call */
 
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
index 0152a81d9b4a..6a3a4a8830dc 100644
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
index 6947be8801d9..37510c591498 100644
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
@@ -4208,105 +4206,6 @@ static void add_trampoline_func(struct seq_file *m, struct ftrace_ops *ops,
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
@@ -4334,13 +4233,7 @@ static int t_show(struct seq_file *m, void *v)
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
 
@@ -4720,24 +4613,6 @@ add_rec_by_index(struct ftrace_hash *hash, struct ftrace_glob *func_g,
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
@@ -4745,12 +4620,7 @@ ftrace_match_record(struct dyn_ftrace *rec, struct ftrace_glob *func_g,
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
@@ -7399,13 +7269,6 @@ void ftrace_module_enable(struct module *mod)
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

