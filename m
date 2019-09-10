Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81ECFAE98D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 13:54:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SNjY0MqQzDsPb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 21:54:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="PI+pE73W"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SNcm0TkPzDrqP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 21:49:58 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46SNcd6c96z9txgq;
 Tue, 10 Sep 2019 13:49:53 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=PI+pE73W; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 3v_1cA5buZFM; Tue, 10 Sep 2019 13:49:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46SNcd5RxQz9txgQ;
 Tue, 10 Sep 2019 13:49:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568116193; bh=TbjAy2wVdlhVpZD8prLibBzDi4PfIr/7P73XrESIlBI=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=PI+pE73WAltbsfp9m+HDRZZ3rfGT89d3DyEnJTCtT3HYxhlbpBGiUJ9Ql5djGlK/w
 RWClaFzbGnN2xbFQyuj7gWQpHC0TxZb/tJcseBDg7eKqlPvRYafuiELXDJAbaA522Q
 C6N71Cz4fz4nhE+lq1MpkojI8/avHoLv7wYLB16s=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 17E058B877;
 Tue, 10 Sep 2019 13:49:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mOadAyedBEiA; Tue, 10 Sep 2019 13:49:54 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C5F6D8B86F;
 Tue, 10 Sep 2019 13:49:54 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7D4CE6B750; Tue, 10 Sep 2019 11:49:54 +0000 (UTC)
Message-Id: <602c8aef42d5d2e7302cdd718c0ceca8eab34c68.1568116179.git.christophe.leroy@c-s.fr>
In-Reply-To: <bc2ef5a64175d734f0b32f101b63854d517f6589.1568116179.git.christophe.leroy@c-s.fr>
References: <bc2ef5a64175d734f0b32f101b63854d517f6589.1568116179.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 2/2] powerpc/kexec: move kexec files into a dedicated subdir.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 10 Sep 2019 11:49:54 +0000 (UTC)
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

arch/powerpc/kernel/ contains 7 files dedicated to kexec.

Move them into a dedicated subdirectory.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/Makefile                       | 16 +---------------
 arch/powerpc/kernel/kexec/Makefile                 | 22 ++++++++++++++++++++++
 arch/powerpc/kernel/{ => kexec}/ima_kexec.c        |  0
 arch/powerpc/kernel/{ => kexec}/kexec_32.S         |  2 +-
 arch/powerpc/kernel/{ => kexec}/kexec_elf_64.c     |  0
 arch/powerpc/kernel/{ => kexec}/machine_kexec.c    |  0
 arch/powerpc/kernel/{ => kexec}/machine_kexec_32.c |  0
 arch/powerpc/kernel/{ => kexec}/machine_kexec_64.c |  0
 .../kernel/{ => kexec}/machine_kexec_file_64.c     |  0
 9 files changed, 24 insertions(+), 16 deletions(-)
 create mode 100644 arch/powerpc/kernel/kexec/Makefile
 rename arch/powerpc/kernel/{ => kexec}/ima_kexec.c (100%)
 rename arch/powerpc/kernel/{ => kexec}/kexec_32.S (99%)
 rename arch/powerpc/kernel/{ => kexec}/kexec_elf_64.c (100%)
 rename arch/powerpc/kernel/{ => kexec}/machine_kexec.c (100%)
 rename arch/powerpc/kernel/{ => kexec}/machine_kexec_32.c (100%)
 rename arch/powerpc/kernel/{ => kexec}/machine_kexec_64.c (100%)
 rename arch/powerpc/kernel/{ => kexec}/machine_kexec_file_64.c (100%)

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index df708de6f866..b65c44d47157 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -81,7 +81,6 @@ obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
 obj-$(CONFIG_FA_DUMP)		+= fadump.o
 ifdef CONFIG_PPC32
 obj-$(CONFIG_E500)		+= idle_e500.o
-obj-$(CONFIG_KEXEC_CORE)	+= kexec_32.o
 endif
 obj-$(CONFIG_PPC_BOOK3S_32)	+= idle_6xx.o l2cr_6xx.o cpu_setup_6xx.o
 obj-$(CONFIG_TAU)		+= tau_6xx.o
@@ -125,14 +124,7 @@ pci64-$(CONFIG_PPC64)		+= pci_dn.o pci-hotplug.o isa-bridge.o
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
@@ -164,12 +156,6 @@ endif
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
index 000000000000..d96ee5660572
--- /dev/null
+++ b/arch/powerpc/kernel/kexec/Makefile
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0
+#
+# Makefile for the linux kernel.
+#
+
+obj-y				+= machine_kexec.o crash.o machine_kexec_$(BITS).o
+
+obj-$(CONFIG_PPC32)		+= kexec_32.o
+
+obj-$(CONFIG_KEXEC_FILE)	+= machine_kexec_file_$(BITS).o kexec_elf_$(BITS).o
+
+ifdef CONFIG_HAVE_IMA_KEXEC
+ifdef CONFIG_IMA
+obj-y				+= ima_kexec.o
+endif
+endif
+
+
+# Disable GCOV, KCOV & sanitizers in odd or sensitive code
+GCOV_PROFILE_machine_kexec_$(BITS).o := n
+KCOV_INSTRUMENT_machine_kexec_$(BITS).o := n
+UBSAN_SANITIZE_machine_kexec_$(BITS).o := n
diff --git a/arch/powerpc/kernel/ima_kexec.c b/arch/powerpc/kernel/kexec/ima_kexec.c
similarity index 100%
rename from arch/powerpc/kernel/ima_kexec.c
rename to arch/powerpc/kernel/kexec/ima_kexec.c
diff --git a/arch/powerpc/kernel/kexec_32.S b/arch/powerpc/kernel/kexec/kexec_32.S
similarity index 99%
rename from arch/powerpc/kernel/kexec_32.S
rename to arch/powerpc/kernel/kexec/kexec_32.S
index 3f8ca6a566fb..b9355e0d5c85 100644
--- a/arch/powerpc/kernel/kexec_32.S
+++ b/arch/powerpc/kernel/kexec/kexec_32.S
@@ -32,7 +32,7 @@ relocate_new_kernel:
 	mr	r31, r5
 
 #define ENTRY_MAPPING_KEXEC_SETUP
-#include "fsl_booke_entry_mapping.S"
+#include <kernel/fsl_booke_entry_mapping.S>
 #undef ENTRY_MAPPING_KEXEC_SETUP
 
 	mr      r3, r29
diff --git a/arch/powerpc/kernel/kexec_elf_64.c b/arch/powerpc/kernel/kexec/kexec_elf_64.c
similarity index 100%
rename from arch/powerpc/kernel/kexec_elf_64.c
rename to arch/powerpc/kernel/kexec/kexec_elf_64.c
diff --git a/arch/powerpc/kernel/machine_kexec.c b/arch/powerpc/kernel/kexec/machine_kexec.c
similarity index 100%
rename from arch/powerpc/kernel/machine_kexec.c
rename to arch/powerpc/kernel/kexec/machine_kexec.c
diff --git a/arch/powerpc/kernel/machine_kexec_32.c b/arch/powerpc/kernel/kexec/machine_kexec_32.c
similarity index 100%
rename from arch/powerpc/kernel/machine_kexec_32.c
rename to arch/powerpc/kernel/kexec/machine_kexec_32.c
diff --git a/arch/powerpc/kernel/machine_kexec_64.c b/arch/powerpc/kernel/kexec/machine_kexec_64.c
similarity index 100%
rename from arch/powerpc/kernel/machine_kexec_64.c
rename to arch/powerpc/kernel/kexec/machine_kexec_64.c
diff --git a/arch/powerpc/kernel/machine_kexec_file_64.c b/arch/powerpc/kernel/kexec/machine_kexec_file_64.c
similarity index 100%
rename from arch/powerpc/kernel/machine_kexec_file_64.c
rename to arch/powerpc/kernel/kexec/machine_kexec_file_64.c
-- 
2.13.3

