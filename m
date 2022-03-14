Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C5A4D81A7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 12:50:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHFGd2Bfnz3bfB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 22:50:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHFG773PNz2xTp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 22:50:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KHFG04JZJz9sSq;
 Mon, 14 Mar 2022 12:50:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w1ehqrj_Vl7f; Mon, 14 Mar 2022 12:50:00 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KHFG039zLz9sRx;
 Mon, 14 Mar 2022 12:50:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5A6328B76C;
 Mon, 14 Mar 2022 12:50:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nENlX6af9-A6; Mon, 14 Mar 2022 12:50:00 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F29B48B763;
 Mon, 14 Mar 2022 12:49:59 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 22EBni374150439
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 12:49:44 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 22EBnbIq4150437;
 Mon, 14 Mar 2022 12:49:37 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jason Baron <jbaron@akamai.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH v2] static_call: Don't make __static_call_return0 static
Date: Mon, 14 Mar 2022 12:49:36 +0100
Message-Id: <30821468a0e7d28251954b578e5051dc09300d04.1647258493.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1647258575; l=17029; s=20211009;
 h=from:subject:message-id; bh=w2L7N9/FA8UrE58+ldydwqFwqASPQLE6/DQ9sDxHZGw=;
 b=Ao5fHNlwTm3XqCxmma/8GXaqUzUE9hoSGXPCapBe0pDm3XUmYGBU+v6m9xD5gXAjQG1GLNqEYrTu
 xjmp/03tBsUahE7RA6Wvlh0TbpKJr3XBsy4+7J/JyEgsL2vUECuN
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
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
Cc: x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

System.map shows that vmlinux contains several instances of
__static_call_return0():

	c0004fc0 t __static_call_return0
	c0011518 t __static_call_return0
	c00d8160 t __static_call_return0

arch_static_call_transform() uses the middle one to check whether we are
setting a call to __static_call_return0 or not:

	c0011520 <arch_static_call_transform>:
	c0011520:       3d 20 c0 01     lis     r9,-16383	<== r9 =  0xc001 << 16
	c0011524:       39 29 15 18     addi    r9,r9,5400	<== r9 += 0x1518
	c0011528:       7c 05 48 00     cmpw    r5,r9		<== r9 has value 0xc0011518 here

So if static_call_update() is called with one of the other instances of
__static_call_return0(), arch_static_call_transform() won't recognise it.

In order to work properly, global single instance of __static_call_return0() is required.

Fixes: 3f2a8fc4b15d ("static_call/x86: Add __static_call_return0()")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Add linux/static_call.h to avoid "missing prototype - should it be static" warning.
---
 include/linux/static_call.h                   |   5 +-
 kernel/Makefile                               |   3 +-
 kernel/static_call.c                          | 541 ------------------
 .../{static_call.c => static_call_inline.c}   |   5 -
 4 files changed, 3 insertions(+), 551 deletions(-)
 copy kernel/{static_call.c => static_call_inline.c} (99%)

diff --git a/include/linux/static_call.h b/include/linux/static_call.h
index 8ee175d233d7..df53bed9d71f 100644
--- a/include/linux/static_call.h
+++ b/include/linux/static_call.h
@@ -262,10 +262,7 @@ static inline int static_call_text_reserved(void *start, void *end)
 	return 0;
 }
 
-static inline long __static_call_return0(void)
-{
-	return 0;
-}
+extern long __static_call_return0(void);
 
 #define EXPORT_STATIC_CALL(name)					\
 	EXPORT_SYMBOL(STATIC_CALL_KEY(name));				\
diff --git a/kernel/Makefile b/kernel/Makefile
index 56f4ee97f328..a18d169732d2 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -113,7 +113,8 @@ obj-$(CONFIG_CPU_PM) += cpu_pm.o
 obj-$(CONFIG_BPF) += bpf/
 obj-$(CONFIG_KCSAN) += kcsan/
 obj-$(CONFIG_SHADOW_CALL_STACK) += scs.o
-obj-$(CONFIG_HAVE_STATIC_CALL_INLINE) += static_call.o
+obj-$(CONFIG_HAVE_STATIC_CALL) += static_call.o
+obj-$(CONFIG_HAVE_STATIC_CALL_INLINE) += static_call_inline.o
 obj-$(CONFIG_CFI_CLANG) += cfi.o
 
 obj-$(CONFIG_PERF_EVENTS) += events/
diff --git a/kernel/static_call.c b/kernel/static_call.c
index 43ba0b1e0edb..dae74642b3e1 100644
--- a/kernel/static_call.c
+++ b/kernel/static_call.c
@@ -1,548 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
-#include <linux/init.h>
 #include <linux/static_call.h>
-#include <linux/bug.h>
-#include <linux/smp.h>
-#include <linux/sort.h>
-#include <linux/slab.h>
-#include <linux/module.h>
-#include <linux/cpu.h>
-#include <linux/processor.h>
-#include <asm/sections.h>
-
-extern struct static_call_site __start_static_call_sites[],
-			       __stop_static_call_sites[];
-extern struct static_call_tramp_key __start_static_call_tramp_key[],
-				    __stop_static_call_tramp_key[];
-
-static bool static_call_initialized;
-
-/* mutex to protect key modules/sites */
-static DEFINE_MUTEX(static_call_mutex);
-
-static void static_call_lock(void)
-{
-	mutex_lock(&static_call_mutex);
-}
-
-static void static_call_unlock(void)
-{
-	mutex_unlock(&static_call_mutex);
-}
-
-static inline void *static_call_addr(struct static_call_site *site)
-{
-	return (void *)((long)site->addr + (long)&site->addr);
-}
-
-static inline unsigned long __static_call_key(const struct static_call_site *site)
-{
-	return (long)site->key + (long)&site->key;
-}
-
-static inline struct static_call_key *static_call_key(const struct static_call_site *site)
-{
-	return (void *)(__static_call_key(site) & ~STATIC_CALL_SITE_FLAGS);
-}
-
-/* These assume the key is word-aligned. */
-static inline bool static_call_is_init(struct static_call_site *site)
-{
-	return __static_call_key(site) & STATIC_CALL_SITE_INIT;
-}
-
-static inline bool static_call_is_tail(struct static_call_site *site)
-{
-	return __static_call_key(site) & STATIC_CALL_SITE_TAIL;
-}
-
-static inline void static_call_set_init(struct static_call_site *site)
-{
-	site->key = (__static_call_key(site) | STATIC_CALL_SITE_INIT) -
-		    (long)&site->key;
-}
-
-static int static_call_site_cmp(const void *_a, const void *_b)
-{
-	const struct static_call_site *a = _a;
-	const struct static_call_site *b = _b;
-	const struct static_call_key *key_a = static_call_key(a);
-	const struct static_call_key *key_b = static_call_key(b);
-
-	if (key_a < key_b)
-		return -1;
-
-	if (key_a > key_b)
-		return 1;
-
-	return 0;
-}
-
-static void static_call_site_swap(void *_a, void *_b, int size)
-{
-	long delta = (unsigned long)_a - (unsigned long)_b;
-	struct static_call_site *a = _a;
-	struct static_call_site *b = _b;
-	struct static_call_site tmp = *a;
-
-	a->addr = b->addr  - delta;
-	a->key  = b->key   - delta;
-
-	b->addr = tmp.addr + delta;
-	b->key  = tmp.key  + delta;
-}
-
-static inline void static_call_sort_entries(struct static_call_site *start,
-					    struct static_call_site *stop)
-{
-	sort(start, stop - start, sizeof(struct static_call_site),
-	     static_call_site_cmp, static_call_site_swap);
-}
-
-static inline bool static_call_key_has_mods(struct static_call_key *key)
-{
-	return !(key->type & 1);
-}
-
-static inline struct static_call_mod *static_call_key_next(struct static_call_key *key)
-{
-	if (!static_call_key_has_mods(key))
-		return NULL;
-
-	return key->mods;
-}
-
-static inline struct static_call_site *static_call_key_sites(struct static_call_key *key)
-{
-	if (static_call_key_has_mods(key))
-		return NULL;
-
-	return (struct static_call_site *)(key->type & ~1);
-}
-
-void __static_call_update(struct static_call_key *key, void *tramp, void *func)
-{
-	struct static_call_site *site, *stop;
-	struct static_call_mod *site_mod, first;
-
-	cpus_read_lock();
-	static_call_lock();
-
-	if (key->func == func)
-		goto done;
-
-	key->func = func;
-
-	arch_static_call_transform(NULL, tramp, func, false);
-
-	/*
-	 * If uninitialized, we'll not update the callsites, but they still
-	 * point to the trampoline and we just patched that.
-	 */
-	if (WARN_ON_ONCE(!static_call_initialized))
-		goto done;
-
-	first = (struct static_call_mod){
-		.next = static_call_key_next(key),
-		.mod = NULL,
-		.sites = static_call_key_sites(key),
-	};
-
-	for (site_mod = &first; site_mod; site_mod = site_mod->next) {
-		bool init = system_state < SYSTEM_RUNNING;
-		struct module *mod = site_mod->mod;
-
-		if (!site_mod->sites) {
-			/*
-			 * This can happen if the static call key is defined in
-			 * a module which doesn't use it.
-			 *
-			 * It also happens in the has_mods case, where the
-			 * 'first' entry has no sites associated with it.
-			 */
-			continue;
-		}
-
-		stop = __stop_static_call_sites;
-
-		if (mod) {
-#ifdef CONFIG_MODULES
-			stop = mod->static_call_sites +
-			       mod->num_static_call_sites;
-			init = mod->state == MODULE_STATE_COMING;
-#endif
-		}
-
-		for (site = site_mod->sites;
-		     site < stop && static_call_key(site) == key; site++) {
-			void *site_addr = static_call_addr(site);
-
-			if (!init && static_call_is_init(site))
-				continue;
-
-			if (!kernel_text_address((unsigned long)site_addr)) {
-				/*
-				 * This skips patching built-in __exit, which
-				 * is part of init_section_contains() but is
-				 * not part of kernel_text_address().
-				 *
-				 * Skipping built-in __exit is fine since it
-				 * will never be executed.
-				 */
-				WARN_ONCE(!static_call_is_init(site),
-					  "can't patch static call site at %pS",
-					  site_addr);
-				continue;
-			}
-
-			arch_static_call_transform(site_addr, NULL, func,
-						   static_call_is_tail(site));
-		}
-	}
-
-done:
-	static_call_unlock();
-	cpus_read_unlock();
-}
-EXPORT_SYMBOL_GPL(__static_call_update);
-
-static int __static_call_init(struct module *mod,
-			      struct static_call_site *start,
-			      struct static_call_site *stop)
-{
-	struct static_call_site *site;
-	struct static_call_key *key, *prev_key = NULL;
-	struct static_call_mod *site_mod;
-
-	if (start == stop)
-		return 0;
-
-	static_call_sort_entries(start, stop);
-
-	for (site = start; site < stop; site++) {
-		void *site_addr = static_call_addr(site);
-
-		if ((mod && within_module_init((unsigned long)site_addr, mod)) ||
-		    (!mod && init_section_contains(site_addr, 1)))
-			static_call_set_init(site);
-
-		key = static_call_key(site);
-		if (key != prev_key) {
-			prev_key = key;
-
-			/*
-			 * For vmlinux (!mod) avoid the allocation by storing
-			 * the sites pointer in the key itself. Also see
-			 * __static_call_update()'s @first.
-			 *
-			 * This allows architectures (eg. x86) to call
-			 * static_call_init() before memory allocation works.
-			 */
-			if (!mod) {
-				key->sites = site;
-				key->type |= 1;
-				goto do_transform;
-			}
-
-			site_mod = kzalloc(sizeof(*site_mod), GFP_KERNEL);
-			if (!site_mod)
-				return -ENOMEM;
-
-			/*
-			 * When the key has a direct sites pointer, extract
-			 * that into an explicit struct static_call_mod, so we
-			 * can have a list of modules.
-			 */
-			if (static_call_key_sites(key)) {
-				site_mod->mod = NULL;
-				site_mod->next = NULL;
-				site_mod->sites = static_call_key_sites(key);
-
-				key->mods = site_mod;
-
-				site_mod = kzalloc(sizeof(*site_mod), GFP_KERNEL);
-				if (!site_mod)
-					return -ENOMEM;
-			}
-
-			site_mod->mod = mod;
-			site_mod->sites = site;
-			site_mod->next = static_call_key_next(key);
-			key->mods = site_mod;
-		}
-
-do_transform:
-		arch_static_call_transform(site_addr, NULL, key->func,
-				static_call_is_tail(site));
-	}
-
-	return 0;
-}
-
-static int addr_conflict(struct static_call_site *site, void *start, void *end)
-{
-	unsigned long addr = (unsigned long)static_call_addr(site);
-
-	if (addr <= (unsigned long)end &&
-	    addr + CALL_INSN_SIZE > (unsigned long)start)
-		return 1;
-
-	return 0;
-}
-
-static int __static_call_text_reserved(struct static_call_site *iter_start,
-				       struct static_call_site *iter_stop,
-				       void *start, void *end, bool init)
-{
-	struct static_call_site *iter = iter_start;
-
-	while (iter < iter_stop) {
-		if (init || !static_call_is_init(iter)) {
-			if (addr_conflict(iter, start, end))
-				return 1;
-		}
-		iter++;
-	}
-
-	return 0;
-}
-
-#ifdef CONFIG_MODULES
-
-static int __static_call_mod_text_reserved(void *start, void *end)
-{
-	struct module *mod;
-	int ret;
-
-	preempt_disable();
-	mod = __module_text_address((unsigned long)start);
-	WARN_ON_ONCE(__module_text_address((unsigned long)end) != mod);
-	if (!try_module_get(mod))
-		mod = NULL;
-	preempt_enable();
-
-	if (!mod)
-		return 0;
-
-	ret = __static_call_text_reserved(mod->static_call_sites,
-			mod->static_call_sites + mod->num_static_call_sites,
-			start, end, mod->state == MODULE_STATE_COMING);
-
-	module_put(mod);
-
-	return ret;
-}
-
-static unsigned long tramp_key_lookup(unsigned long addr)
-{
-	struct static_call_tramp_key *start = __start_static_call_tramp_key;
-	struct static_call_tramp_key *stop = __stop_static_call_tramp_key;
-	struct static_call_tramp_key *tramp_key;
-
-	for (tramp_key = start; tramp_key != stop; tramp_key++) {
-		unsigned long tramp;
-
-		tramp = (long)tramp_key->tramp + (long)&tramp_key->tramp;
-		if (tramp == addr)
-			return (long)tramp_key->key + (long)&tramp_key->key;
-	}
-
-	return 0;
-}
-
-static int static_call_add_module(struct module *mod)
-{
-	struct static_call_site *start = mod->static_call_sites;
-	struct static_call_site *stop = start + mod->num_static_call_sites;
-	struct static_call_site *site;
-
-	for (site = start; site != stop; site++) {
-		unsigned long s_key = __static_call_key(site);
-		unsigned long addr = s_key & ~STATIC_CALL_SITE_FLAGS;
-		unsigned long key;
-
-		/*
-		 * Is the key is exported, 'addr' points to the key, which
-		 * means modules are allowed to call static_call_update() on
-		 * it.
-		 *
-		 * Otherwise, the key isn't exported, and 'addr' points to the
-		 * trampoline so we need to lookup the key.
-		 *
-		 * We go through this dance to prevent crazy modules from
-		 * abusing sensitive static calls.
-		 */
-		if (!kernel_text_address(addr))
-			continue;
-
-		key = tramp_key_lookup(addr);
-		if (!key) {
-			pr_warn("Failed to fixup __raw_static_call() usage at: %ps\n",
-				static_call_addr(site));
-			return -EINVAL;
-		}
-
-		key |= s_key & STATIC_CALL_SITE_FLAGS;
-		site->key = key - (long)&site->key;
-	}
-
-	return __static_call_init(mod, start, stop);
-}
-
-static void static_call_del_module(struct module *mod)
-{
-	struct static_call_site *start = mod->static_call_sites;
-	struct static_call_site *stop = mod->static_call_sites +
-					mod->num_static_call_sites;
-	struct static_call_key *key, *prev_key = NULL;
-	struct static_call_mod *site_mod, **prev;
-	struct static_call_site *site;
-
-	for (site = start; site < stop; site++) {
-		key = static_call_key(site);
-		if (key == prev_key)
-			continue;
-
-		prev_key = key;
-
-		for (prev = &key->mods, site_mod = key->mods;
-		     site_mod && site_mod->mod != mod;
-		     prev = &site_mod->next, site_mod = site_mod->next)
-			;
-
-		if (!site_mod)
-			continue;
-
-		*prev = site_mod->next;
-		kfree(site_mod);
-	}
-}
-
-static int static_call_module_notify(struct notifier_block *nb,
-				     unsigned long val, void *data)
-{
-	struct module *mod = data;
-	int ret = 0;
-
-	cpus_read_lock();
-	static_call_lock();
-
-	switch (val) {
-	case MODULE_STATE_COMING:
-		ret = static_call_add_module(mod);
-		if (ret) {
-			WARN(1, "Failed to allocate memory for static calls");
-			static_call_del_module(mod);
-		}
-		break;
-	case MODULE_STATE_GOING:
-		static_call_del_module(mod);
-		break;
-	}
-
-	static_call_unlock();
-	cpus_read_unlock();
-
-	return notifier_from_errno(ret);
-}
-
-static struct notifier_block static_call_module_nb = {
-	.notifier_call = static_call_module_notify,
-};
-
-#else
-
-static inline int __static_call_mod_text_reserved(void *start, void *end)
-{
-	return 0;
-}
-
-#endif /* CONFIG_MODULES */
-
-int static_call_text_reserved(void *start, void *end)
-{
-	bool init = system_state < SYSTEM_RUNNING;
-	int ret = __static_call_text_reserved(__start_static_call_sites,
-			__stop_static_call_sites, start, end, init);
-
-	if (ret)
-		return ret;
-
-	return __static_call_mod_text_reserved(start, end);
-}
-
-int __init static_call_init(void)
-{
-	int ret;
-
-	if (static_call_initialized)
-		return 0;
-
-	cpus_read_lock();
-	static_call_lock();
-	ret = __static_call_init(NULL, __start_static_call_sites,
-				 __stop_static_call_sites);
-	static_call_unlock();
-	cpus_read_unlock();
-
-	if (ret) {
-		pr_err("Failed to allocate memory for static_call!\n");
-		BUG();
-	}
-
-	static_call_initialized = true;
-
-#ifdef CONFIG_MODULES
-	register_module_notifier(&static_call_module_nb);
-#endif
-	return 0;
-}
-early_initcall(static_call_init);
 
 long __static_call_return0(void)
 {
 	return 0;
 }
-
-#ifdef CONFIG_STATIC_CALL_SELFTEST
-
-static int func_a(int x)
-{
-	return x+1;
-}
-
-static int func_b(int x)
-{
-	return x+2;
-}
-
-DEFINE_STATIC_CALL(sc_selftest, func_a);
-
-static struct static_call_data {
-      int (*func)(int);
-      int val;
-      int expect;
-} static_call_data [] __initdata = {
-      { NULL,   2, 3 },
-      { func_b, 2, 4 },
-      { func_a, 2, 3 }
-};
-
-static int __init test_static_call_init(void)
-{
-      int i;
-
-      for (i = 0; i < ARRAY_SIZE(static_call_data); i++ ) {
-	      struct static_call_data *scd = &static_call_data[i];
-
-              if (scd->func)
-                      static_call_update(sc_selftest, scd->func);
-
-              WARN_ON(static_call(sc_selftest)(scd->val) != scd->expect);
-      }
-
-      return 0;
-}
-early_initcall(test_static_call_init);
-
-#endif /* CONFIG_STATIC_CALL_SELFTEST */
diff --git a/kernel/static_call.c b/kernel/static_call_inline.c
similarity index 99%
copy from kernel/static_call.c
copy to kernel/static_call_inline.c
index 43ba0b1e0edb..dc5665b62814 100644
--- a/kernel/static_call.c
+++ b/kernel/static_call_inline.c
@@ -499,11 +499,6 @@ int __init static_call_init(void)
 }
 early_initcall(static_call_init);
 
-long __static_call_return0(void)
-{
-	return 0;
-}
-
 #ifdef CONFIG_STATIC_CALL_SELFTEST
 
 static int func_a(int x)
-- 
2.35.1

