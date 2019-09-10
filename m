Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF868AEF85
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 18:26:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SVlw1f40zF1Rc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 02:26:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="tLMUSP0a"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SVgk2w4czF1Pm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 02:22:58 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46SVgd4bCYz9tyvS;
 Tue, 10 Sep 2019 18:22:53 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tLMUSP0a; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id nz-WxYFQc0gT; Tue, 10 Sep 2019 18:22:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46SVgd3Qyqz9tyvQ;
 Tue, 10 Sep 2019 18:22:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568132573; bh=+6o+78VZsQA+v7vQ/HRTMCRCI9xi61deAbzDhccBXKU=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=tLMUSP0aHHdfA/uGbuUYrb2i2RZcbnaUor8S5aGIXKI/8hTw6KLlkfP1zkiS+j7Iq
 wNjfSOdNqW2YyRvQbIUfQi6RYegbVQwKqqbLDUTsWGdvNCqJOYftPsLB+uPD9jqSDc
 WlccUH+JzrhK3heSCZunkAjJwVzvOAZLwBqjl39Y=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 234238B88E;
 Tue, 10 Sep 2019 18:22:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Z-JXUHdkEBL5; Tue, 10 Sep 2019 18:22:55 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CC1588B885;
 Tue, 10 Sep 2019 18:22:54 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 96AFD6B751; Tue, 10 Sep 2019 16:22:54 +0000 (UTC)
Message-Id: <d6979510ee67331de69d5859054258e483ceddfc.1568132567.git.christophe.leroy@c-s.fr>
In-Reply-To: <b8fbdac205bbebd8e860dc42e12246de29bcc68f.1568132567.git.christophe.leroy@c-s.fr>
References: <b8fbdac205bbebd8e860dc42e12246de29bcc68f.1568132567.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 2/2] powerpc/kexec: move kexec files into a dedicated
 subdir.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 10 Sep 2019 16:22:54 +0000 (UTC)
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

arch/powerpc/kernel/ contains 8 files dedicated to kexec.

Move them into a dedicated subdirectory.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>

---
v2: moved crash.c as well as it's part of kexec suite.
v3: renamed files to remove 'kexec' keyword from names.
---
 arch/powerpc/kernel/Makefile                       | 19 +---------------
 arch/powerpc/kernel/kexec/Makefile                 | 25 ++++++++++++++++++++++
 arch/powerpc/kernel/{ => kexec}/crash.c            |  0
 .../kernel/{kexec_elf_64.c => kexec/elf_64.c}      |  0
 arch/powerpc/kernel/{ima_kexec.c => kexec/ima.c}   |  0
 .../kernel/{machine_kexec.c => kexec/machine.c}    |  0
 .../{machine_kexec_32.c => kexec/machine_32.c}     |  0
 .../{machine_kexec_64.c => kexec/machine_64.c}     |  0
 .../machine_file_64.c}                             |  0
 .../{kexec_relocate_32.S => kexec/relocate_32.S}   |  2 +-
 10 files changed, 27 insertions(+), 19 deletions(-)
 create mode 100644 arch/powerpc/kernel/kexec/Makefile
 rename arch/powerpc/kernel/{ => kexec}/crash.c (100%)
 rename arch/powerpc/kernel/{kexec_elf_64.c => kexec/elf_64.c} (100%)
 rename arch/powerpc/kernel/{ima_kexec.c => kexec/ima.c} (100%)
 rename arch/powerpc/kernel/{machine_kexec.c => kexec/machine.c} (100%)
 rename arch/powerpc/kernel/{machine_kexec_32.c => kexec/machine_32.c} (100%)
 rename arch/powerpc/kernel/{machine_kexec_64.c => kexec/machine_64.c} (100%)
 rename arch/powerpc/kernel/{machine_kexec_file_64.c => kexec/machine_file_64.c} (100%)
 rename arch/powerpc/kernel/{kexec_relocate_32.S => kexec/relocate_32.S} (99%)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index f6c80f31502a..42e150e6e663 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -5,9 +5,6 @@
 
 CFLAGS_ptrace.o		+= -DUTS_MACHINE='"$(UTS_MACHINE)"'
 
-# Disable clang warning for using setjmp without setjmp.h header
-CFLAGS_crash.o		+= $(call cc-disable-warning, builtin-requires-header)
-
 ifdef CONFIG_PPC64
 CFLAGS_prom_init.o	+= $(NO_MINIMAL_TOC)
 endif
@@ -81,7 +78,6 @@ obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
 obj-$(CONFIG_FA_DUMP)		+= fadump.o
 ifdef CONFIG_PPC32
 obj-$(CONFIG_E500)		+= idle_e500.o
-obj-$(CONFIG_KEXEC_CORE)	+= kexec_relocate_32.o
 endif
 obj-$(CONFIG_PPC_BOOK3S_32)	+= idle_6xx.o l2cr_6xx.o cpu_setup_6xx.o
 obj-$(CONFIG_TAU)		+= tau_6xx.o
@@ -125,14 +121,7 @@ pci64-$(CONFIG_PPC64)		+= pci_dn.o pci-hotplug.o isa-bridge.o
 obj-$(CONFIG_PCI)		+= pci_$(BITS).o $(pci64-y) \
 				   pci-common.o pci_of_scan.o
 obj-$(CONFIG_PCI_MSI)		+= msi.o
-obj-$(CONFIG_KEXEC_CORE)	+= machine_kexec.o crash.o \
-				   machine_kexec_$(BITS).o
-obj-$(CONFIG_KEXEC_FILE)	+= machine_kexec_file_$(BITS).o kexec_elf_$(BITS).o
-ifdef CONFIG_HAVE_IMA_KEXEC
-ifdef CONFIG_IMA
-obj-y				+= ima_kexec.o
-endif
-endif
+obj-$(CONFIG_KEXEC_CORE)	+= kexec/
 
 obj-$(CONFIG_AUDIT)		+= audit.o
 obj64-$(CONFIG_AUDIT)		+= compat_audit.o
@@ -164,12 +153,6 @@ endif
 GCOV_PROFILE_prom_init.o := n
 KCOV_INSTRUMENT_prom_init.o := n
 UBSAN_SANITIZE_prom_init.o := n
-GCOV_PROFILE_machine_kexec_64.o := n
-KCOV_INSTRUMENT_machine_kexec_64.o := n
-UBSAN_SANITIZE_machine_kexec_64.o := n
-GCOV_PROFILE_machine_kexec_32.o := n
-KCOV_INSTRUMENT_machine_kexec_32.o := n
-UBSAN_SANITIZE_machine_kexec_32.o := n
 GCOV_PROFILE_kprobes.o := n
 KCOV_INSTRUMENT_kprobes.o := n
 UBSAN_SANITIZE_kprobes.o := n
diff --git a/arch/powerpc/kernel/kexec/Makefile b/arch/powerpc/kernel/kexec/Makefile
new file mode 100644
index 000000000000..46e52ee95322
--- /dev/null
+++ b/arch/powerpc/kernel/kexec/Makefile
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the linux kernel.
+#
+
+# Disable clang warning for using setjmp without setjmp.h header
+CFLAGS_crash.o		+= $(call cc-disable-warning, builtin-requires-header)
+
+obj-y				+= machine.o crash.o machine_$(BITS).o
+
+obj-$(CONFIG_PPC32)		+= relocate_32.o
+
+obj-$(CONFIG_KEXEC_FILE)	+= machine_file_$(BITS).o elf_$(BITS).o
+
+ifdef CONFIG_HAVE_IMA_KEXEC
+ifdef CONFIG_IMA
+obj-y				+= ima.o
+endif
+endif
+
+
+# Disable GCOV, KCOV & sanitizers in odd or sensitive code
+GCOV_PROFILE_machine_$(BITS).o := n
+KCOV_INSTRUMENT_machine_$(BITS).o := n
+UBSAN_SANITIZE_machine_$(BITS).o := n
diff --git a/arch/powerpc/kernel/crash.c b/arch/powerpc/kernel/kexec/crash.c
similarity index 100%
rename from arch/powerpc/kernel/crash.c
rename to arch/powerpc/kernel/kexec/crash.c
diff --git a/arch/powerpc/kernel/kexec_elf_64.c b/arch/powerpc/kernel/kexec/elf_64.c
similarity index 100%
rename from arch/powerpc/kernel/kexec_elf_64.c
rename to arch/powerpc/kernel/kexec/elf_64.c
diff --git a/arch/powerpc/kernel/ima_kexec.c b/arch/powerpc/kernel/kexec/ima.c
similarity index 100%
rename from arch/powerpc/kernel/ima_kexec.c
rename to arch/powerpc/kernel/kexec/ima.c
diff --git a/arch/powerpc/kernel/machine_kexec.c b/arch/powerpc/kernel/kexec/machine.c
similarity index 100%
rename from arch/powerpc/kernel/machine_kexec.c
rename to arch/powerpc/kernel/kexec/machine.c
diff --git a/arch/powerpc/kernel/machine_kexec_32.c b/arch/powerpc/kernel/kexec/machine_32.c
similarity index 100%
rename from arch/powerpc/kernel/machine_kexec_32.c
rename to arch/powerpc/kernel/kexec/machine_32.c
diff --git a/arch/powerpc/kernel/machine_kexec_64.c b/arch/powerpc/kernel/kexec/machine_64.c
similarity index 100%
rename from arch/powerpc/kernel/machine_kexec_64.c
rename to arch/powerpc/kernel/kexec/machine_64.c
diff --git a/arch/powerpc/kernel/machine_kexec_file_64.c b/arch/powerpc/kernel/kexec/machine_file_64.c
similarity index 100%
rename from arch/powerpc/kernel/machine_kexec_file_64.c
rename to arch/powerpc/kernel/kexec/machine_file_64.c
diff --git a/arch/powerpc/kernel/kexec_relocate_32.S b/arch/powerpc/kernel/kexec/relocate_32.S
similarity index 99%
rename from arch/powerpc/kernel/kexec_relocate_32.S
rename to arch/powerpc/kernel/kexec/relocate_32.S
index 3f8ca6a566fb..b9355e0d5c85 100644
--- a/arch/powerpc/kernel/kexec_relocate_32.S
+++ b/arch/powerpc/kernel/kexec/relocate_32.S
@@ -32,7 +32,7 @@ relocate_new_kernel:
 	mr	r31, r5
 
 #define ENTRY_MAPPING_KEXEC_SETUP
-#include "fsl_booke_entry_mapping.S"
+#include <kernel/fsl_booke_entry_mapping.S>
 #undef ENTRY_MAPPING_KEXEC_SETUP
 
 	mr      r3, r29
-- 
2.13.3

