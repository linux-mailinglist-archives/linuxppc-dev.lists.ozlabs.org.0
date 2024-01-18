Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9506831C7D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jan 2024 16:28:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hMcy5SKP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TG6935bhsz3cY7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 02:28:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hMcy5SKP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TG65Q2Tlyz3bqB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 02:25:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id BC54AB818EE;
	Thu, 18 Jan 2024 15:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1EB8AC433F1;
	Thu, 18 Jan 2024 15:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705591542;
	bh=w4PxFc/xAGdRj/8ioyLZhaAQGJf4tgw2WnyFI/gwxtM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=hMcy5SKPS7YCfFTJ/zALrx/WfPhrTcSjJxnjYu5dYuv2xw+sGpfl8xr9+mzDfWxZn
	 HuOzzytvzwA1oT+oxCn4yO9VdKgrtAJxQjOXqNM3YsefYeFf6T16W57OKMJr4NyuSf
	 t0KMPV367b6QJPHD3jj3j5fiJFRf279jB5ABJTSohRvFako3bktqRjxi/kayBafP17
	 xy/1bfVLBWTXhAomPYf7rmt7784n8iPUcfC+//VETDFCxjREHV7EjTTRZ54SLqsEJH
	 pdjgvIBx+UL4ZgxfGrpr8OYcj6emxg7LD3aSKQhYQg2dE4tDcKHdo9H8wlAhZ6uCp/
	 u7mvqgGBg1boA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04859C47DD3;
	Thu, 18 Jan 2024 15:25:42 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Thu, 18 Jan 2024 09:25:13 -0600
Subject: [PATCH RFC 2/5] dump_stack: Allow update of arch description
 string at runtime
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20240118-update-dump-stack-arch-str-v1-2-5c0f98d017b5@linux.ibm.com>
References:  <20240118-update-dump-stack-arch-str-v1-0-5c0f98d017b5@linux.ibm.com>
In-Reply-To:  <20240118-update-dump-stack-arch-str-v1-0-5c0f98d017b5@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Brian King <brking@linux.ibm.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 John Ogness <john.ogness@linutronix.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Petr Mladek <pmladek@suse.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Steven Rostedt <rostedt@goodmis.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705591541; l=5563;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=puwstkIXbA1WYmG0j5MptfrnsQZlAPEW8ptzDFaauAY=;
 b=eC8LjJAwEVJmB7aywPXDM9Fgrox4pSdU02exjnufpGg8u+eRTjMukN4/TZYFFwXn5BJq5ohdO
 C/iNekTxjZECl9oHRmoAfyZrnbvyLV4YTDMePIUJ7UKMcuSqHbW8e6v
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230817 with auth_id=78
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

The IBM PowerVM platform (targeted by powerpc/pseries) exposes the
physical machine model and firmware version to partitions (guests),
and this information is used to populate the arch description string,
e.g.

  IBM,8408-E8E POWER8E (raw) 0x4b0201 0xf000004 \
    of:IBM,FW860.50 (SV860_146) hv:phyp pSeries

The platform supports live migration of partitions between different
machine models and firmware versions, so the arch description string
set at boot can become inaccurate, potentially misleading anyone who's
analyzing stack traces produced after a migration.

Introduce a RCU-guarded pointer to the current arch description
string, initializing it to the static buffer populated at boot. Add to
dump_stack_print_info() a RCU read-side critical section that accesses
the buffer through this pointer. The majority of architectures which
don't need to update the string after boot incur only an additional
indirection.

As for platforms which do need that ability, they can use
dump_stack_update_arch_desc(), which allocates and formats a new
buffer, updates the pointer, and if appropriate frees the previous
buffer.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 include/linux/printk.h |  5 +++++
 lib/dump_stack.c       | 54 ++++++++++++++++++++++++++++++++++++++++++++++----
 2 files changed, 55 insertions(+), 4 deletions(-)

diff --git a/include/linux/printk.h b/include/linux/printk.h
index 8ef499ab3c1e..6138ae019d2a 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -187,6 +187,7 @@ u32 log_buf_len_get(void);
 void log_buf_vmcoreinfo_setup(void);
 void __init setup_log_buf(int early);
 __printf(1, 2) void dump_stack_set_arch_desc(const char *fmt, ...);
+__printf(1, 2) void dump_stack_update_arch_desc(const char *fmt, ...);
 void dump_stack_print_info(const char *log_lvl);
 void show_regs_print_info(const char *log_lvl);
 extern asmlinkage void dump_stack_lvl(const char *log_lvl) __cold;
@@ -253,6 +254,10 @@ static inline __printf(1, 2) void dump_stack_set_arch_desc(const char *fmt, ...)
 {
 }
 
+static inline __printf(1, 2) void dump_stack_update_arch_desc(const char *fmt, ...)
+{
+}
+
 static inline void dump_stack_print_info(const char *log_lvl)
 {
 }
diff --git a/lib/dump_stack.c b/lib/dump_stack.c
index 1057f102f6f2..bd497e7797ee 100644
--- a/lib/dump_stack.c
+++ b/lib/dump_stack.c
@@ -8,15 +8,18 @@
 #include <linux/buildid.h>
 #include <linux/cache.h>
 #include <linux/export.h>
+#include <linux/rcupdate.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/smp.h>
+#include <linux/spinlock.h>
 #include <linux/atomic.h>
 #include <linux/kexec.h>
 #include <linux/utsname.h>
 #include <linux/stop_machine.h>
 
 static char dump_stack_arch_desc_str[128] __ro_after_init;
+static const char *dump_stack_arch_desc_ptr = dump_stack_arch_desc_str;
 
 /**
  * dump_stack_set_arch_desc - set arch-specific str to show with task dumps
@@ -28,7 +31,7 @@ static char dump_stack_arch_desc_str[128] __ro_after_init;
  * arch wants to make use of such an ID string, it should initialize this
  * as soon as possible during boot.
  */
-void __init dump_stack_set_arch_desc(const char *fmt, ...)
+void dump_stack_set_arch_desc(const char *fmt, ...)
 {
 	va_list args;
 
@@ -38,6 +41,45 @@ void __init dump_stack_set_arch_desc(const char *fmt, ...)
 	va_end(args);
 }
 
+/**
+ * dump_stack_update_arch_desc() - Update the arch description string at runtime.
+ * @fmt: printf-style format string
+ * @...: arguments for the format string
+ *
+ * A runtime counterpart of dump_stack_set_arch_desc(). Arch code
+ * should use this when the arch description set at boot potentially
+ * has become inaccurate, such as after a guest migration.
+ *
+ * Context: May sleep.
+ */
+void dump_stack_update_arch_desc(const char *fmt, ...)
+{
+	static DEFINE_SPINLOCK(arch_desc_update_lock);
+	const char *old;
+	const char *new;
+	va_list args;
+
+	va_start(args, fmt);
+	new = kvasprintf(GFP_KERNEL, fmt, args);
+	va_end(args);
+
+	if (!new)
+		return;
+
+	spin_lock(&arch_desc_update_lock);
+	old = rcu_replace_pointer(dump_stack_arch_desc_ptr, new,
+				  lockdep_is_held(&arch_desc_update_lock));
+	spin_unlock(&arch_desc_update_lock);
+
+	/*
+	 * Avoid freeing the static buffer initialized during boot.
+	 */
+	if (old == dump_stack_arch_desc_str)
+		return;
+
+	kfree_rcu_mightsleep(old);
+}
+
 #if IS_ENABLED(CONFIG_STACKTRACE_BUILD_ID)
 #define BUILD_ID_FMT " %20phN"
 #define BUILD_ID_VAL vmlinux_build_id
@@ -55,6 +97,8 @@ void __init dump_stack_set_arch_desc(const char *fmt, ...)
  */
 void dump_stack_print_info(const char *log_lvl)
 {
+	const char *arch_str;
+
 	printk("%sCPU: %d PID: %d Comm: %.20s %s%s %s %.*s" BUILD_ID_FMT "\n",
 	       log_lvl, raw_smp_processor_id(), current->pid, current->comm,
 	       kexec_crash_loaded() ? "Kdump: loaded " : "",
@@ -63,9 +107,11 @@ void dump_stack_print_info(const char *log_lvl)
 	       (int)strcspn(init_utsname()->version, " "),
 	       init_utsname()->version, BUILD_ID_VAL);
 
-	if (dump_stack_arch_desc_str[0] != '\0')
-		printk("%sHardware name: %s\n",
-		       log_lvl, dump_stack_arch_desc_str);
+	rcu_read_lock();
+	arch_str = rcu_dereference(dump_stack_arch_desc_ptr);
+	if (arch_str[0] != '\0')
+		printk("%sHardware name: %s\n", log_lvl, arch_str);
+	rcu_read_unlock();
 
 	print_worker_info(log_lvl, current);
 	print_stop_info(log_lvl, current);

-- 
2.43.0

