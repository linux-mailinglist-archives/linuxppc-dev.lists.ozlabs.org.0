Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BAB052B699
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 12:09:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L37xS2Cxcz3cHD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 May 2022 20:09:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=F8xKRNm5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L37ws6R11z3bwG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 May 2022 20:08:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=F8xKRNm5; dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix)
 id 4L37ws40Myz4xcS; Wed, 18 May 2022 20:08:29 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
 id 4L37ws3t5sz4xc1; Wed, 18 May 2022 20:08:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1652868509;
 bh=NhK1oG9u5aYKNFg2ALFmuW24Q+F5e+LtCRozxg4AXAU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F8xKRNm5iABVt3Q2wZa3/C6b9mYzZ5McCpMGPMA3xpWcOKMJFMdqhXKRXWYTvJSWt
 hp1APhSjXLJmTmvDY8NwXGhNqRjzE+xHDZ66aKzPnZHhC5vv+eL05BlNWW3+HSDSnY
 nVhdp38CJiTOgaQtZX20iEY41P+s5tGHQ+bbMf9ViagOrFwCdJ4PM+9PChaIUQjzTW
 0QQaLYjzoouve/UJ3Ba5lY1egxH3QgcxxybaAglVie+a9T6+sl3iMlKhBsqgox+Bj2
 1b9tiAkYAZld7R2voplGHVPOxM6hGCFRxORekFtPOt17W9PiV3JnkmcV6KuwSuIgop
 CaXwNpjQ4tlng==
Date: Wed, 18 May 2022 20:07:05 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 5/6] powerpc/kasan: Disable address sanitization in kexec
 paths
Message-ID: <YoTFSQ2TUSEaDdVC@cleo>
References: <YoTEb2BaH3MDkH+2@cleo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YoTEb2BaH3MDkH+2@cleo>
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Daniel Axtens <dja@axtens.net>

The kexec code paths involve code that necessarily run in real mode,
as CPUs are disabled and control is transferred to the new kernel.
Disable address sanitization for the kexec code and the functions
called in real mode on CPUs being disabled.

[paulus@ozlabs.org: combined a few work-in-progress commits of
 Daniel's and wrote the commit message.]

Signed-off-by: Daniel Axtens <dja@axtens.net>
Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
---
 arch/powerpc/kexec/Makefile             | 2 ++
 arch/powerpc/platforms/pseries/Makefile | 3 +++
 arch/powerpc/sysdev/xics/xics-common.c  | 4 ++--
 arch/powerpc/sysdev/xive/common.c       | 4 ++--
 4 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kexec/Makefile b/arch/powerpc/kexec/Makefile
index b6c52608cb49..0c2abe7f9908 100644
--- a/arch/powerpc/kexec/Makefile
+++ b/arch/powerpc/kexec/Makefile
@@ -13,3 +13,5 @@ obj-$(CONFIG_KEXEC_FILE)	+= file_load.o ranges.o file_load_$(BITS).o elf_$(BITS)
 GCOV_PROFILE_core_$(BITS).o := n
 KCOV_INSTRUMENT_core_$(BITS).o := n
 UBSAN_SANITIZE_core_$(BITS).o := n
+KASAN_SANITIZE_core.o := n
+KASAN_SANITIZE_core_$(BITS) := n
diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index b407fdeb6e78..98e878c32a21 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -35,3 +35,6 @@ obj-$(CONFIG_ARCH_HAS_CC_PLATFORM)	+= cc_platform.o
 
 # nothing that operates in real mode is safe for KASAN
 KASAN_SANITIZE_ras.o := n
+KASAN_SANITIZE_kexec.o := n
+#machine_kexec
+KASAN_SANITIZE_setup.o := n
diff --git a/arch/powerpc/sysdev/xics/xics-common.c b/arch/powerpc/sysdev/xics/xics-common.c
index f3fb2a12124c..322b2b8bd467 100644
--- a/arch/powerpc/sysdev/xics/xics-common.c
+++ b/arch/powerpc/sysdev/xics/xics-common.c
@@ -146,7 +146,7 @@ void __init xics_smp_probe(void)
 
 #endif /* CONFIG_SMP */
 
-void xics_teardown_cpu(void)
+noinstr void xics_teardown_cpu(void)
 {
 	struct xics_cppr *os_cppr = this_cpu_ptr(&xics_cppr);
 
@@ -159,7 +159,7 @@ void xics_teardown_cpu(void)
 	icp_ops->teardown_cpu();
 }
 
-void xics_kexec_teardown_cpu(int secondary)
+noinstr void xics_kexec_teardown_cpu(int secondary)
 {
 	xics_teardown_cpu();
 
diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
index 1ca5564bda9d..87b825b7401d 100644
--- a/arch/powerpc/sysdev/xive/common.c
+++ b/arch/powerpc/sysdev/xive/common.c
@@ -1241,7 +1241,7 @@ static int xive_setup_cpu_ipi(unsigned int cpu)
 	return 0;
 }
 
-static void xive_cleanup_cpu_ipi(unsigned int cpu, struct xive_cpu *xc)
+noinstr static void xive_cleanup_cpu_ipi(unsigned int cpu, struct xive_cpu *xc)
 {
 	unsigned int xive_ipi_irq = xive_ipi_cpu_to_irq(cpu);
 
@@ -1634,7 +1634,7 @@ void xive_flush_interrupt(void)
 
 #endif /* CONFIG_SMP */
 
-void xive_teardown_cpu(void)
+noinstr void xive_teardown_cpu(void)
 {
 	struct xive_cpu *xc = __this_cpu_read(xive_cpu);
 	unsigned int cpu = smp_processor_id();
-- 
2.35.3

