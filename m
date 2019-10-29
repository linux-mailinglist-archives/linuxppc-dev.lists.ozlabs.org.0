Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7D8E87E3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 13:17:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472VvX0TflzF355
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 23:17:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="cEbXbtI3"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472Vqx53LVzF34D
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 23:14:03 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 472Vqp3W2tz9tys6;
 Tue, 29 Oct 2019 13:13:58 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=cEbXbtI3; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id h_u-eYPogtao; Tue, 29 Oct 2019 13:13:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 472Vqp1sxyz9tys3;
 Tue, 29 Oct 2019 13:13:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1572351238; bh=SBWd/036wgjBoKT8USjU074K7r+/2H+2G92oXpDUOas=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=cEbXbtI3pe9i6LKyDEISsX1xA0bTlzwBUSYV++SsU9PXg5VOQi4Cd3zVIblgYmy3A
 IhhB4vYQuB6xtbc+DVgfhHuJZGC+Or3+ID52oSwOyebZ72y6RUAejtBCo3+IZlPpff
 sxineOtBiypi45gD2iIrhQ5mXrFUOByTlfGJA4qM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 76B4F8B854;
 Tue, 29 Oct 2019 13:13:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id s36zX9qoWdCv; Tue, 29 Oct 2019 13:13:59 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2AABA8B755;
 Tue, 29 Oct 2019 13:13:59 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id F041566315; Tue, 29 Oct 2019 12:13:58 +0000 (UTC)
Message-Id: <afbef97ec6a978574a5cf91a4441000e0a9da42a.1572351221.git.christophe.leroy@c-s.fr>
In-Reply-To: <e235973a1198195763afd3b6baffa548a83f4611.1572351221.git.christophe.leroy@c-s.fr>
References: <e235973a1198195763afd3b6baffa548a83f4611.1572351221.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 2/2] powerpc/kexec: move kexec files into a dedicated
 subdir.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 29 Oct 2019 12:13:58 +0000 (UTC)
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
v4: removed a ifdef in kexec/Makefile
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
index ca1a0ffa068d..6f9667e336d4 100644
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
@@ -83,7 +80,6 @@ obj-y				+= fadump.o
 endif
 ifdef CONFIG_PPC32
 obj-$(CONFIG_E500)		+= idle_e500.o
-obj-$(CONFIG_KEXEC_CORE)	+= kexec_relocate_32.o
 endif
 obj-$(CONFIG_PPC_BOOK3S_32)	+= idle_6xx.o l2cr_6xx.o cpu_setup_6xx.o
 obj-$(CONFIG_TAU)		+= tau_6xx.o
@@ -127,14 +123,7 @@ pci64-$(CONFIG_PPC64)		+= pci_dn.o pci-hotplug.o isa-bridge.o
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
@@ -166,12 +155,6 @@ endif
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
index 8a8b4887c879..61946c19e07c 100644
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

