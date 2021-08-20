Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D013F2914
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 11:26:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Grbqd4RkQz3d8r
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 19:26:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Grbq853Mdz30Hn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 19:26:08 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Grbq143h3z9sW6;
 Fri, 20 Aug 2021 11:26:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cOX1mvPEk9rR; Fri, 20 Aug 2021 11:26:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Grbq136J2z9sW5;
 Fri, 20 Aug 2021 11:26:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 504A18B87A;
 Fri, 20 Aug 2021 11:26:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id D13dkWQaE3Al; Fri, 20 Aug 2021 11:26:05 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0993A8B875;
 Fri, 20 Aug 2021 11:26:05 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BA99F6BB81; Fri, 20 Aug 2021 09:26:04 +0000 (UTC)
Message-Id: <075703befe8f7e0f5cef3fe7455e648f12c210a5.1629451489.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH] powerpc/audit: Convert powerpc to
 AUDIT_ARCH_COMPAT_GENERIC
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 20 Aug 2021 09:26:04 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No time to finalise commit description and testing before the
weekend, sending out as RFC to eventually get some feedback.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig               |  5 +-
 arch/powerpc/kernel/Makefile       |  3 --
 arch/powerpc/kernel/audit.c        | 84 ------------------------------
 arch/powerpc/kernel/compat_audit.c | 44 ----------------
 4 files changed, 1 insertion(+), 135 deletions(-)
 delete mode 100644 arch/powerpc/kernel/audit.c
 delete mode 100644 arch/powerpc/kernel/compat_audit.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 663766fbf505..5472358609d2 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -163,6 +163,7 @@ config PPC
 	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
 	select ARCH_WANT_LD_ORPHAN_WARN
 	select ARCH_WEAK_RELEASE_ACQUIRE
+	select AUDIT_ARCH_COMPAT_GENERIC
 	select BINFMT_ELF
 	select BUILDTIME_TABLE_SORT
 	select CLONE_BACKWARDS
@@ -316,10 +317,6 @@ config GENERIC_TBSYNC
 	bool
 	default y if PPC32 && SMP
 
-config AUDIT_ARCH
-	bool
-	default y
-
 config GENERIC_BUG
 	bool
 	default y
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 7be36c1e1db6..825121eba3c2 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -125,9 +125,6 @@ obj-$(CONFIG_PCI)		+= pci_$(BITS).o $(pci64-y) \
 				   pci-common.o pci_of_scan.o
 obj-$(CONFIG_PCI_MSI)		+= msi.o
 
-obj-$(CONFIG_AUDIT)		+= audit.o
-obj64-$(CONFIG_AUDIT)		+= compat_audit.o
-
 obj-$(CONFIG_PPC_IO_WORKAROUNDS)	+= io-workarounds.o
 
 obj-y				+= trace/
diff --git a/arch/powerpc/kernel/audit.c b/arch/powerpc/kernel/audit.c
deleted file mode 100644
index a2dddd7f3d09..000000000000
--- a/arch/powerpc/kernel/audit.c
+++ /dev/null
@@ -1,84 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#include <linux/init.h>
-#include <linux/types.h>
-#include <linux/audit.h>
-#include <asm/unistd.h>
-
-static unsigned dir_class[] = {
-#include <asm-generic/audit_dir_write.h>
-~0U
-};
-
-static unsigned read_class[] = {
-#include <asm-generic/audit_read.h>
-~0U
-};
-
-static unsigned write_class[] = {
-#include <asm-generic/audit_write.h>
-~0U
-};
-
-static unsigned chattr_class[] = {
-#include <asm-generic/audit_change_attr.h>
-~0U
-};
-
-static unsigned signal_class[] = {
-#include <asm-generic/audit_signal.h>
-~0U
-};
-
-int audit_classify_arch(int arch)
-{
-#ifdef CONFIG_PPC64
-	if (arch == AUDIT_ARCH_PPC)
-		return 1;
-#endif
-	return 0;
-}
-
-int audit_classify_syscall(int abi, unsigned syscall)
-{
-#ifdef CONFIG_PPC64
-	extern int ppc32_classify_syscall(unsigned);
-	if (abi == AUDIT_ARCH_PPC)
-		return ppc32_classify_syscall(syscall);
-#endif
-	switch(syscall) {
-	case __NR_open:
-		return 2;
-	case __NR_openat:
-		return 3;
-	case __NR_socketcall:
-		return 4;
-	case __NR_execve:
-		return 5;
-	default:
-		return 0;
-	}
-}
-
-static int __init audit_classes_init(void)
-{
-#ifdef CONFIG_PPC64
-	extern __u32 ppc32_dir_class[];
-	extern __u32 ppc32_write_class[];
-	extern __u32 ppc32_read_class[];
-	extern __u32 ppc32_chattr_class[];
-	extern __u32 ppc32_signal_class[];
-	audit_register_class(AUDIT_CLASS_WRITE_32, ppc32_write_class);
-	audit_register_class(AUDIT_CLASS_READ_32, ppc32_read_class);
-	audit_register_class(AUDIT_CLASS_DIR_WRITE_32, ppc32_dir_class);
-	audit_register_class(AUDIT_CLASS_CHATTR_32, ppc32_chattr_class);
-	audit_register_class(AUDIT_CLASS_SIGNAL_32, ppc32_signal_class);
-#endif
-	audit_register_class(AUDIT_CLASS_WRITE, write_class);
-	audit_register_class(AUDIT_CLASS_READ, read_class);
-	audit_register_class(AUDIT_CLASS_DIR_WRITE, dir_class);
-	audit_register_class(AUDIT_CLASS_CHATTR, chattr_class);
-	audit_register_class(AUDIT_CLASS_SIGNAL, signal_class);
-	return 0;
-}
-
-__initcall(audit_classes_init);
diff --git a/arch/powerpc/kernel/compat_audit.c b/arch/powerpc/kernel/compat_audit.c
deleted file mode 100644
index 55c6ccda0a85..000000000000
--- a/arch/powerpc/kernel/compat_audit.c
+++ /dev/null
@@ -1,44 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-#undef __powerpc64__
-#include <asm/unistd.h>
-
-unsigned ppc32_dir_class[] = {
-#include <asm-generic/audit_dir_write.h>
-~0U
-};
-
-unsigned ppc32_chattr_class[] = {
-#include <asm-generic/audit_change_attr.h>
-~0U
-};
-
-unsigned ppc32_write_class[] = {
-#include <asm-generic/audit_write.h>
-~0U
-};
-
-unsigned ppc32_read_class[] = {
-#include <asm-generic/audit_read.h>
-~0U
-};
-
-unsigned ppc32_signal_class[] = {
-#include <asm-generic/audit_signal.h>
-~0U
-};
-
-int ppc32_classify_syscall(unsigned syscall)
-{
-	switch(syscall) {
-	case __NR_open:
-		return 2;
-	case __NR_openat:
-		return 3;
-	case __NR_socketcall:
-		return 4;
-	case __NR_execve:
-		return 5;
-	default:
-		return 1;
-	}
-}
-- 
2.25.0

