Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3FBA5128E4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 03:35:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpdTf5SZXz3bVH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 11:35:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=Ms53zbjg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=Ms53zbjg; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpYsh1X8hz2xtQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 08:52:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/cdg0sKCsuwzrOmixxbC1Q4JQ/fbIS+o0nd/6r3SqdQ=; b=Ms53zbjgbkvE/VbvvERWDhiSlK
 xnfSZ26duHs4sJGmX9AjyiOpVrZ24qlvncFPTQgx0Ak1/K+qg/q6M3lNqtXBQSywskWJGGXxxZsyH
 0ZCt9ADqjTi/3V+XCpSLOfo1kVbAL88rsa3CWloXQYrPcKcjm0fr5wkBOKZGIirx4MPHlXEq/lSP6
 Wauj7ki9eqiIN/DWOEVCrOIQ5CDDEHA0P4AiVRkbPc3MLQuGkkZQLCDxyedC8rV+CPmlMqMLZGK7O
 pj27Q1YpHqsziDeg78TsiM6RPMIm39rOPoY53108P/vAvRYTx1t1bv7hv+1+u3acH1fsI00wIEzlf
 mvZOITKg==;
Received: from [179.113.53.197] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1njqVm-00026W-Rl; Thu, 28 Apr 2022 00:51:55 +0200
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com,
 kexec@lists.infradead.org
Subject: [PATCH 08/30] powerpc/setup: Refactor/untangle panic notifiers
Date: Wed, 27 Apr 2022 19:49:02 -0300
Message-Id: <20220427224924.592546-9-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220427224924.592546-1-gpiccoli@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 28 Apr 2022 11:34:03 +1000
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
Cc: linux-hyperv@vger.kernel.org, halves@canonical.com,
 gregkh@linuxfoundation.org, peterz@infradead.org,
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org, will@kernel.org,
 tglx@linutronix.de, linux-leds@vger.kernel.org, linux-s390@vger.kernel.org,
 mikelley@microsoft.com, john.ogness@linutronix.de, corbet@lwn.net,
 paulmck@kernel.org, fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, Hari Bathini <hbathini@linux.ibm.com>,
 xen-devel@lists.xenproject.org, dyoung@redhat.com, vgoyal@redhat.com,
 linux-xtensa@linux-xtensa.org, dave.hansen@linux.intel.com,
 keescook@chromium.org, arnd@arndb.de, linux-pm@vger.kernel.org,
 coresight@lists.linaro.org, linux-um@lists.infradead.org, rostedt@goodmis.org,
 rcu@vger.kernel.org, bp@alien8.de, Nicholas Piggin <npiggin@gmail.com>,
 luto@kernel.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, andriy.shevchenko@linux.intel.com,
 senozhatsky@chromium.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, linux-kernel@vger.kernel.org,
 stern@rowland.harvard.edu, gpiccoli@igalia.com, d.hatayama@jp.fujitsu.com,
 mhiramat@kernel.org, kernel-dev@igalia.com, linux-alpha@vger.kernel.org,
 vkuznets@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The panic notifiers infrastructure is a bit limited in the scope of
the callbacks - basically every kind of functionality is dropped
in a list that runs in the same point during the kernel panic path.
This is not really on par with the complexities and particularities
of architecture / hypervisors' needs, and a refactor is ongoing.

As part of this refactor, it was observed that powerpc has 2 notifiers,
with mixed goals: one is just a KASLR offset dumper, whereas the other
aims to hard-disable IRQs (necessary on panic path), warn firmware of
the panic event (fadump) and run low-level platform-specific machinery
that might stop kernel execution and never come back.

Clearly, the 2nd notifier has opposed goals: disable IRQs / fadump
should run earlier while low-level platform actions should
run late since it might not even return. Hence, this patch decouples
the notifiers splitting them in three:

- First one is responsible for hard-disable IRQs and fadump,
should run early;

- The kernel KASLR offset dumper is really an informative notifier,
harmless and may run at any moment in the panic path;

- The last notifier should run last, since it aims to perform
low-level actions for specific platforms, and might never return.
It is also only registered for 2 platforms, pseries and ps3.

The patch better documents the notifiers and clears the code too,
also removing a useless header.

Currently no functionality change should be observed, but after
the planned panic refactor we should expect more panic reliability
with this patch.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---

We'd like to thanks specially the MiniCloud infrastructure [0] maintainers,
that allow us to test PowerPC code in a very complete, functional and FREE
environment (there's no need even for adding a credit card, like many "free"
clouds require ¬¬ ).

[0] https://openpower.ic.unicamp.br/minicloud

 arch/powerpc/kernel/setup-common.c | 74 ++++++++++++++++++++++--------
 1 file changed, 54 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 518ae5aa9410..52f96b209a96 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -23,7 +23,6 @@
 #include <linux/console.h>
 #include <linux/screen_info.h>
 #include <linux/root_dev.h>
-#include <linux/notifier.h>
 #include <linux/cpu.h>
 #include <linux/unistd.h>
 #include <linux/serial.h>
@@ -680,8 +679,25 @@ int check_legacy_ioport(unsigned long base_port)
 }
 EXPORT_SYMBOL(check_legacy_ioport);
 
-static int ppc_panic_event(struct notifier_block *this,
-                             unsigned long event, void *ptr)
+/*
+ * Panic notifiers setup
+ *
+ * We have 3 notifiers for powerpc, each one from a different "nature":
+ *
+ * - ppc_panic_fadump_handler() is a hypervisor notifier, which hard-disables
+ *   IRQs and deal with the Firmware-Assisted dump, when it is configured;
+ *   should run early in the panic path.
+ *
+ * - dump_kernel_offset() is an informative notifier, just showing the KASLR
+ *   offset if we have RANDOMIZE_BASE set.
+ *
+ * - ppc_panic_platform_handler() is a low-level handler that's registered
+ *   only if the platform wishes to perform final actions in the panic path,
+ *   hence it should run late and might not even return. Currently, only
+ *   pseries and ps3 platforms register callbacks.
+ */
+static int ppc_panic_fadump_handler(struct notifier_block *this,
+				    unsigned long event, void *ptr)
 {
 	/*
 	 * panic does a local_irq_disable, but we really
@@ -691,45 +707,63 @@ static int ppc_panic_event(struct notifier_block *this,
 
 	/*
 	 * If firmware-assisted dump has been registered then trigger
-	 * firmware-assisted dump and let firmware handle everything else.
+	 * its callback and let the firmware handles everything else.
 	 */
 	crash_fadump(NULL, ptr);
-	if (ppc_md.panic)
-		ppc_md.panic(ptr);  /* May not return */
+
 	return NOTIFY_DONE;
 }
 
-static struct notifier_block ppc_panic_block = {
-	.notifier_call = ppc_panic_event,
-	.priority = INT_MIN /* may not return; must be done last */
-};
-
-/*
- * Dump out kernel offset information on panic.
- */
 static int dump_kernel_offset(struct notifier_block *self, unsigned long v,
 			      void *p)
 {
 	pr_emerg("Kernel Offset: 0x%lx from 0x%lx\n",
 		 kaslr_offset(), KERNELBASE);
 
-	return 0;
+	return NOTIFY_DONE;
 }
 
+static int ppc_panic_platform_handler(struct notifier_block *this,
+				      unsigned long event, void *ptr)
+{
+	/*
+	 * This handler is only registered if we have a panic callback
+	 * on ppc_md, hence NULL check is not needed.
+	 * Also, it may not return, so it runs really late on panic path.
+	 */
+	ppc_md.panic(ptr);
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block ppc_fadump_block = {
+	.notifier_call = ppc_panic_fadump_handler,
+	.priority = INT_MAX, /* run early, to notify the firmware ASAP */
+};
+
 static struct notifier_block kernel_offset_notifier = {
-	.notifier_call = dump_kernel_offset
+	.notifier_call = dump_kernel_offset,
+};
+
+static struct notifier_block ppc_panic_block = {
+	.notifier_call = ppc_panic_platform_handler,
+	.priority = INT_MIN, /* may not return; must be done last */
 };
 
 void __init setup_panic(void)
 {
+	/* Hard-disables IRQs + deal with FW-assisted dump (fadump) */
+	atomic_notifier_chain_register(&panic_notifier_list,
+				       &ppc_fadump_block);
+
 	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && kaslr_offset() > 0)
 		atomic_notifier_chain_register(&panic_notifier_list,
 					       &kernel_offset_notifier);
 
-	/* PPC64 always does a hard irq disable in its panic handler */
-	if (!IS_ENABLED(CONFIG_PPC64) && !ppc_md.panic)
-		return;
-	atomic_notifier_chain_register(&panic_notifier_list, &ppc_panic_block);
+	/* Low-level platform-specific routines that should run on panic */
+	if (ppc_md.panic)
+		atomic_notifier_chain_register(&panic_notifier_list,
+					       &ppc_panic_block);
 }
 
 #ifdef CONFIG_CHECK_CACHE_COHERENCY
-- 
2.36.0

