Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 733EC70FAF8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 17:58:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRG7V22QGz3f8F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 01:58:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Pn+45cZq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRG5m1dzxz3bkM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 01:57:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Pn+45cZq;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QRG5m07rzz4x4S;
	Thu, 25 May 2023 01:57:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1684943820;
	bh=GDuKLXAn5BUUvdYYWhO/CH+SzZ6lqi9yMcbEbaEW+8I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pn+45cZq+yBtuzx2SCr3q9xq09vAlzdOjza0S8ekG48O2WWN2nE1J31VscCi7d4W4
	 K/Q79HBsHlwEoaTHdE9vRNJzeLSfxYLOC5a0k8d9F9QhJXqVcTS2rbJwYoDLba+0jz
	 U0+GVlwBeMAkUfkHMOW7sR3eCqmpSu9osrcZ6pyrORuqV18ii5hGFiCyGsHgBuiEsK
	 +KM7s3TfL0ZepKbMXBPGpIRfVYoXGqUII7OfYQYUzouSdbOWvswXi6+aF/2zSq8uwP
	 BT+cipW+doVwTtnDBEb2YWoWAgPJ9dpfzV2LlDj6i7lu2FrANPJTldf1WJyMd4uL29
	 qZyI16sqmKl8g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/9] cpu/SMT: Store the current/max number of threads
Date: Thu, 25 May 2023 01:56:24 +1000
Message-Id: <20230524155630.794584-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524155630.794584-1-mpe@ellerman.id.au>
References: <20230524155630.794584-1-mpe@ellerman.id.au>
MIME-Version: 1.0
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, dave.hansen@linux.intel.com, mingo@redhat.com, bp@alien8.de, tglx@linutronix.de, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A subsequent patch will enable partial SMT states, ie. when not all SMT
threads are brought online.

To support that the SMT code needs to know the maximum number of SMT
threads, and also the currently configured number.

The arch code knows the max number of threads, so have the arch code
pass that value to cpu_smt_check_topology(). Note that although
topology_max_smt_threads() exists, it is not configured early enough to
be used here.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/x86/kernel/cpu/bugs.c |  3 ++-
 include/linux/cpu_smt.h    |  6 ++++--
 kernel/cpu.c               | 12 +++++++++++-
 3 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 182af64387d0..3406799c1e9d 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -34,6 +34,7 @@
 #include <asm/hypervisor.h>
 #include <asm/tlbflush.h>
 #include <asm/cpu.h>
+#include <asm/smp.h>
 
 #include "cpu.h"
 
@@ -133,7 +134,7 @@ void __init check_bugs(void)
 	 * identify_boot_cpu() initialized SMT support information, let the
 	 * core code know.
 	 */
-	cpu_smt_check_topology();
+	cpu_smt_check_topology(smp_num_siblings);
 
 	if (!IS_ENABLED(CONFIG_SMP)) {
 		pr_info("CPU: ");
diff --git a/include/linux/cpu_smt.h b/include/linux/cpu_smt.h
index 17e105b52d85..8d4ae26047c9 100644
--- a/include/linux/cpu_smt.h
+++ b/include/linux/cpu_smt.h
@@ -12,15 +12,17 @@ enum cpuhp_smt_control {
 
 #if defined(CONFIG_SMP) && defined(CONFIG_HOTPLUG_SMT)
 extern enum cpuhp_smt_control cpu_smt_control;
+extern unsigned int cpu_smt_num_threads;
 extern void cpu_smt_disable(bool force);
-extern void cpu_smt_check_topology(void);
+extern void cpu_smt_check_topology(unsigned int num_threads);
 extern bool cpu_smt_possible(void);
 extern int cpuhp_smt_enable(void);
 extern int cpuhp_smt_disable(enum cpuhp_smt_control ctrlval);
 #else
 # define cpu_smt_control		(CPU_SMT_NOT_IMPLEMENTED)
+# define cpu_smt_num_threads 1
 static inline void cpu_smt_disable(bool force) { }
-static inline void cpu_smt_check_topology(void) { }
+static inline void cpu_smt_check_topology(unsigned int num_threads) { }
 static inline bool cpu_smt_possible(void) { return false; }
 static inline int cpuhp_smt_enable(void) { return 0; }
 static inline int cpuhp_smt_disable(enum cpuhp_smt_control ctrlval) { return 0; }
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 01398ce3e131..a08dd8f93675 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -414,6 +414,8 @@ void __weak arch_smt_update(void) { }
 
 #ifdef CONFIG_HOTPLUG_SMT
 enum cpuhp_smt_control cpu_smt_control __read_mostly = CPU_SMT_ENABLED;
+static unsigned int cpu_smt_max_threads __ro_after_init;
+unsigned int cpu_smt_num_threads;
 
 void __init cpu_smt_disable(bool force)
 {
@@ -433,10 +435,18 @@ void __init cpu_smt_disable(bool force)
  * The decision whether SMT is supported can only be done after the full
  * CPU identification. Called from architecture code.
  */
-void __init cpu_smt_check_topology(void)
+void __init cpu_smt_check_topology(unsigned int num_threads)
 {
 	if (!topology_smt_supported())
 		cpu_smt_control = CPU_SMT_NOT_SUPPORTED;
+
+	cpu_smt_max_threads = num_threads;
+
+	// May already be disabled by nosmt command line parameter
+	if (cpu_smt_control != CPU_SMT_ENABLED)
+		cpu_smt_num_threads = 1;
+	else
+		cpu_smt_num_threads = num_threads;
 }
 
 static int __init smt_cmdline_disable(char *str)
-- 
2.40.1

