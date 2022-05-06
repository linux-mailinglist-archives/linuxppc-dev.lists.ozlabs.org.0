Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CEA51D416
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 11:15:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvlKJ5tR2z3fYT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 19:15:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvlJb3jw0z3drG
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 19:14:55 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KvlJR5Y1Yz9sTl;
 Fri,  6 May 2022 11:14:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oAB7MkILClr2; Fri,  6 May 2022 11:14:47 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KvlJP6RGgz9sTp;
 Fri,  6 May 2022 11:14:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CF53F8B792;
 Fri,  6 May 2022 11:14:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id kqZOMMeIw0YN; Fri,  6 May 2022 11:14:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.81])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7FF028B763;
 Fri,  6 May 2022 11:14:45 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 2469EWOK1217948
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 6 May 2022 11:14:32 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 2469ETd61217947;
 Fri, 6 May 2022 11:14:29 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 1/2] powerpc: Include asm/firmware.h in all users of
 firmware_has_feature()
Date: Fri,  6 May 2022 11:14:24 +0200
Message-Id: <11956ec181a034b51a881ac9c059eea72c679a73.1651828453.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1651828460; l=7162; s=20211009;
 h=from:subject:message-id; bh=Juipd5i26iTjgx0fV6t7bfYlUfVYpwpgpz5hm9D866I=;
 b=/JOb3L3ilxHpKZnjoags2IiXCbk0CCaDwmlemCYMVKEzSmWtenzkiASVNS7ZWc8IticgfRkglN7o
 JrAKRBtAC0Cnqu0q2SjASm8hKmAeXwVprqo5jbCk6PwbpX3O0/1b
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Trying to remove asm/ppc_asm.h from all places that don't need it
leads to several failures linked to firmware_has_feature().

To fix it, include asm/firmware.h in all files using
firmware_has_feature()

All users found with:

	git grep -L "firmware\.h" ` git grep -l "firmware_has_feature("`

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/64/hugetlb.h              | 3 +++
 arch/powerpc/include/asm/cputime.h                        | 1 +
 arch/powerpc/include/asm/interrupt.h                      | 1 +
 arch/powerpc/include/asm/mman.h                           | 1 +
 arch/powerpc/include/asm/prom.h                           | 1 +
 arch/powerpc/kernel/dawr.c                                | 1 +
 arch/powerpc/kexec/core.c                                 | 1 +
 arch/powerpc/kvm/book3s_64_mmu_radix.c                    | 1 +
 arch/powerpc/kvm/book3s_hv_nested.c                       | 1 +
 arch/powerpc/mm/book3s64/hash_pgtable.c                   | 1 +
 arch/powerpc/mm/book3s64/pkeys.c                          | 1 +
 arch/powerpc/mm/hugetlbpage.c                             | 1 +
 arch/powerpc/platforms/pseries/papr_platform_attributes.c | 1 +
 arch/powerpc/platforms/pseries/vas.c                      | 1 +
 14 files changed, 16 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/hugetlb.h b/arch/powerpc/include/asm/book3s/64/hugetlb.h
index 12e150e615b7..1c42a0786290 100644
--- a/arch/powerpc/include/asm/book3s/64/hugetlb.h
+++ b/arch/powerpc/include/asm/book3s/64/hugetlb.h
@@ -1,6 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 #ifndef _ASM_POWERPC_BOOK3S_64_HUGETLB_H
 #define _ASM_POWERPC_BOOK3S_64_HUGETLB_H
+
+#include <asm/firmware.h>
+
 /*
  * For radix we want generic code to handle hugetlb. But then if we want
  * both hash and radix to be enabled together we need to workaround the
diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/asm/cputime.h
index 504f7fe6711a..6d2b27997492 100644
--- a/arch/powerpc/include/asm/cputime.h
+++ b/arch/powerpc/include/asm/cputime.h
@@ -19,6 +19,7 @@
 #include <asm/div64.h>
 #include <asm/time.h>
 #include <asm/param.h>
+#include <asm/firmware.h>
 
 typedef u64 __nocast cputime_t;
 typedef u64 __nocast cputime64_t;
diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index f964ef5c57d8..e8f6fd6b1cce 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -69,6 +69,7 @@
 #include <linux/context_tracking.h>
 #include <linux/hardirq.h>
 #include <asm/cputime.h>
+#include <asm/firmware.h>
 #include <asm/ftrace.h>
 #include <asm/kprobes.h>
 #include <asm/runlatch.h>
diff --git a/arch/powerpc/include/asm/mman.h b/arch/powerpc/include/asm/mman.h
index 7cb6d18f5cd6..699b3c5e144c 100644
--- a/arch/powerpc/include/asm/mman.h
+++ b/arch/powerpc/include/asm/mman.h
@@ -12,6 +12,7 @@
 #include <linux/mm.h>
 #include <linux/pkeys.h>
 #include <asm/cpu_has_feature.h>
+#include <asm/firmware.h>
 
 static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
 		unsigned long pkey)
diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/prom.h
index 5c80152e8f18..6f109b5cb84e 100644
--- a/arch/powerpc/include/asm/prom.h
+++ b/arch/powerpc/include/asm/prom.h
@@ -14,6 +14,7 @@
 #include <linux/types.h>
 #include <asm/irq.h>
 #include <linux/atomic.h>
+#include <asm/firmware.h>
 
 /* These includes should be removed once implicit includes are cleaned up. */
 #include <linux/of.h>
diff --git a/arch/powerpc/kernel/dawr.c b/arch/powerpc/kernel/dawr.c
index 64e423d2fe0f..bb818ae85785 100644
--- a/arch/powerpc/kernel/dawr.c
+++ b/arch/powerpc/kernel/dawr.c
@@ -11,6 +11,7 @@
 #include <linux/debugfs.h>
 #include <asm/machdep.h>
 #include <asm/hvcall.h>
+#include <asm/firmware.h>
 
 bool dawr_force_enable;
 EXPORT_SYMBOL_GPL(dawr_force_enable);
diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index abf5897ae88c..f0774ff3296f 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -20,6 +20,7 @@
 #include <asm/pgalloc.h>
 #include <asm/prom.h>
 #include <asm/sections.h>
+#include <asm/firmware.h>
 
 void machine_kexec_mask_interrupts(void) {
 	unsigned int i;
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 42851c32ff3b..9d4b3feda3b6 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -22,6 +22,7 @@
 #include <asm/ultravisor.h>
 #include <asm/kvm_book3s_uvmem.h>
 #include <asm/plpar_wrappers.h>
+#include <asm/firmware.h>
 
 /*
  * Supported radix tree geometry.
diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
index c943a051c6e7..fae06f4fbce1 100644
--- a/arch/powerpc/kvm/book3s_hv_nested.c
+++ b/arch/powerpc/kvm/book3s_hv_nested.c
@@ -20,6 +20,7 @@
 #include <asm/pte-walk.h>
 #include <asm/reg.h>
 #include <asm/plpar_wrappers.h>
+#include <asm/firmware.h>
 
 static struct patb_entry *pseries_partition_tb;
 
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index 7ce8914992e3..f1cadf771b40 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -13,6 +13,7 @@
 #include <asm/sections.h>
 #include <asm/mmu.h>
 #include <asm/tlb.h>
+#include <asm/firmware.h>
 
 #include <mm/mmu_decl.h>
 
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index 753e62ba67af..1d2675ab6711 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -10,6 +10,7 @@
 #include <asm/mmu.h>
 #include <asm/setup.h>
 #include <asm/smp.h>
+#include <asm/firmware.h>
 
 #include <linux/pkeys.h>
 #include <linux/of_fdt.h>
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index b642a5a8668f..73d91c499bd3 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -24,6 +24,7 @@
 #include <asm/setup.h>
 #include <asm/hugetlb.h>
 #include <asm/pte-walk.h>
+#include <asm/firmware.h>
 
 bool hugetlb_disabled = false;
 
diff --git a/arch/powerpc/platforms/pseries/papr_platform_attributes.c b/arch/powerpc/platforms/pseries/papr_platform_attributes.c
index 515150417bb3..526c621b098b 100644
--- a/arch/powerpc/platforms/pseries/papr_platform_attributes.c
+++ b/arch/powerpc/platforms/pseries/papr_platform_attributes.c
@@ -22,6 +22,7 @@
 
 #include <asm/hvcall.h>
 #include <asm/machdep.h>
+#include <asm/firmware.h>
 
 #include "pseries.h"
 
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 1f59d78c77a1..f510220918b1 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -16,6 +16,7 @@
 #include <asm/machdep.h>
 #include <asm/hvcall.h>
 #include <asm/plpar_wrappers.h>
+#include <asm/firmware.h>
 #include <asm/vas.h>
 #include "vas.h"
 
-- 
2.35.1

