Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B0D4B346F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Feb 2022 12:14:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jwnv20TTpz3cBH
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Feb 2022 22:14:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=izvQ7W58;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwntN0s5Jz30Md
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Feb 2022 22:14:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=izvQ7W58; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JwntK4rT9z4xcY;
 Sat, 12 Feb 2022 22:14:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1644664441;
 bh=2ijfFjoJAnTi6NsxLzCJtDzBFE4CJNp0RKvyw4uKgZk=;
 h=From:To:Subject:Date:From;
 b=izvQ7W58F3o8TdXEYreNIMxaxP9QOV/z1F6jclskNnnM0ZNASado7NPKTGrEOzC0B
 ruYFiKqlUVhp/AgA7gK5XdOOenhYnPmkFFXRb9bPRxNcSERxOjRlAE85XinXl1wzLz
 FpSF6XPr/uVt0gxZ1irfsgC7hdm3isgwhrKhqhhB3mGh8XXHewBPSfO0Afav9sMlZb
 dkSxoSW86d+k/2QfhJKxt+rvZn5qaFFHUeBqHSAHgfIqhb6KuiRCTdm4tz52+HbHA6
 tFKW9gDejoGIeMFKxkvDoQ6eiBio0Y+MEIDVGMa34//BPeVbd8QD41Y0yDeW9JcPZM
 qlcu80wIhSjbA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Fix STACKTRACE=n build
Date: Sat, 12 Feb 2022 22:13:49 +1100
Message-Id: <20220212111349.2806972-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Our skiroot_defconfig doesn't enable FTRACE, and so doesn't get
STACKTRACE enabled either. That leads to a build failure since commit
1614b2b11fab ("arch: Make ARCH_STACKWALK independent of STACKTRACE")
made stacktrace.c build even when STACKTRACE=n.

  arch/powerpc/kernel/stacktrace.c: In function ‘handle_backtrace_ipi’:
  arch/powerpc/kernel/stacktrace.c:171:2: error: implicit declaration of function ‘nmi_cpu_backtrace’
    171 |  nmi_cpu_backtrace(regs);
        |  ^~~~~~~~~~~~~~~~~
  arch/powerpc/kernel/stacktrace.c: In function ‘arch_trigger_cpumask_backtrace’:
  arch/powerpc/kernel/stacktrace.c:226:2: error: implicit declaration of function ‘nmi_trigger_cpumask_backtrace’
    226 |  nmi_trigger_cpumask_backtrace(mask, exclude_self, raise_backtrace_ipi);
        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

This happens because our headers haven't defined
arch_trigger_cpumask_backtrace, which causes lib/nmi_backtrace.c not to
build nmi_cpu_backtrace().

The code in question doesn't actually depend on STACKTRACE=y, that was
just added because arch_trigger_cpumask_backtrace() lived in
stacktrace.c for convenience. So drop the dependency on
CONFIG_STACKTRACE, that causes lib/nmi_backtrace.c to build
nmi_cpu_backtrace() etc. and fixes the build.

Fixes: 1614b2b11fab ("arch: Make ARCH_STACKWALK independent of STACKTRACE")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/nmi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/nmi.h b/arch/powerpc/include/asm/nmi.h
index 160abcb8e9fa..ea0e487f87b1 100644
--- a/arch/powerpc/include/asm/nmi.h
+++ b/arch/powerpc/include/asm/nmi.h
@@ -9,7 +9,7 @@ long soft_nmi_interrupt(struct pt_regs *regs);
 static inline void arch_touch_nmi_watchdog(void) {}
 #endif
 
-#if defined(CONFIG_NMI_IPI) && defined(CONFIG_STACKTRACE)
+#ifdef CONFIG_NMI_IPI
 extern void arch_trigger_cpumask_backtrace(const cpumask_t *mask,
 					   bool exclude_self);
 #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
-- 
2.34.1

