Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBDC8BBB82
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 14:45:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mxDeIuHV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWnTF0sF7z3cZ7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 22:45:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mxDeIuHV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42a; helo=mail-pf1-x42a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWn7Y3plPz3cY1
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 22:30:17 +1000 (AEST)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6f4521ad6c0so442441b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 May 2024 05:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714825816; x=1715430616; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CKMERDi15KOz6GwJ7PbGSAZH1z1AoRDwALd66J3X8U=;
        b=mxDeIuHVBqpSwcd0PuNLDczBGqMHncGpeyEjTMNywctCU+Dhj5TXDP+7SE7GV0CQAN
         5jFp1YLJ8v+EuGpU2Xln2kH3sJAR+JfFUgnbs7UZmP3/frh0PLqsV4w+WmCspvBXNxmh
         Opd77sJYGSRf01MHSdKONXbtcbs9WCzu92X0d7aI2d+Jql81jGPmg7E8oZZ1c+aQfGuE
         TO/tVbbueWAo5XWcJNX/OpucxqXg9ZAaCJBHEA3VMxBVJ/logJXgor3652m3TiC3LnrA
         Hs1Vvu6072ZPT7CITQTXN7GHyk7+If1kos/d7dreURKNk4Ul9GNw8rjeX8xcZn1LZC7y
         C+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825816; x=1715430616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CKMERDi15KOz6GwJ7PbGSAZH1z1AoRDwALd66J3X8U=;
        b=qubgi6F6QDBeNQswOgVYG0IVKx41xciCbsQdkZSaunyaaHvk8UXZ2+wzZaG1Wbv8Vp
         VwTbV2upuqOjX4P3h2B8AlFg2qK1rP3YOehSuyfy6MiCAVwo49aMOyxpIJgUYx8olLmW
         +6Y8Db1al1r/d7IPuPGWTcMxPp5867bo/NcVXucaXVVoxXKYG8oZHxae8L0mcJSHtgSm
         UkhIstbJCz5MfbSKXsKwze2OIpJTG950ATFF1w6fVQ+1uMCzFn95g/jIdivnP9Ellh4z
         Sa3zs/iGHycEV/AgX7veYiYLeVTmLQMvKR+IDW+sFuPw9pq2tsY2vlW7WJcmt6H8WEiv
         g3wg==
X-Forwarded-Encrypted: i=1; AJvYcCX7cF6Zq2wkVvKihNTX0XpzwrtYU+V3qT9bxomJn7gfdhLQ0HzrVxhoCAEFv9RvFaf6DbwnxejfH3asmaeQKo6KdbmbIi1jV5eLK7LBkw==
X-Gm-Message-State: AOJu0YzCJfAFDcIz9HK2QO84StBdbsotwfzE/0RKz4xBRMUrtIhsDbRr
	SIT78Rm9dk7CgZInatLTcv61ElcJ2dfwi7Nb/D9RbQ0ARsA0d0Hj
X-Google-Smtp-Source: AGHT+IGqAyt5fEzNhy0VWtCsC0GkSnROEX8VBW2bdBI+OO+V5N+PWXeQIXiDsYCyQl7jnFg4ZKN/hA==
X-Received: by 2002:a05:6a00:4b46:b0:6ec:ff28:df5 with SMTP id kr6-20020a056a004b4600b006ecff280df5mr6006369pfb.27.1714825815510;
        Sat, 04 May 2024 05:30:15 -0700 (PDT)
Received: from wheely.local0.net (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a000a9000b006f4473daa38sm3480068pfl.128.2024.05.04.05.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:30:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v9 22/31] powerpc: Add MMU support
Date: Sat,  4 May 2024 22:28:28 +1000
Message-ID: <20240504122841.1177683-23-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504122841.1177683-1-npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support for radix MMU, 4kB and 64kB pages.

This also adds MMU interrupt test cases, and runs the interrupts
test entirely with MMU enabled if it is available (aside from
machine check tests).

Acked-by: Andrew Jones <andrew.jones@linux.dev> (configure changes)
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 configure                     |  39 +++--
 lib/powerpc/asm/hcall.h       |   6 +
 lib/powerpc/asm/processor.h   |   1 +
 lib/powerpc/asm/reg.h         |   3 +
 lib/powerpc/asm/smp.h         |   2 +
 lib/powerpc/processor.c       |   9 ++
 lib/powerpc/setup.c           |   8 +-
 lib/ppc64/asm/mmu.h           |  11 ++
 lib/ppc64/asm/page.h          |  66 +++++++-
 lib/ppc64/asm/pgtable-hwdef.h |  66 ++++++++
 lib/ppc64/asm/pgtable.h       | 125 +++++++++++++++
 lib/ppc64/mmu.c               | 281 +++++++++++++++++++++++++++++++++
 lib/ppc64/opal-calls.S        |   4 +-
 powerpc/Makefile.common       |   4 +-
 powerpc/Makefile.ppc64        |   1 +
 powerpc/interrupts.c          |  96 ++++++++++--
 powerpc/mmu.c                 | 283 ++++++++++++++++++++++++++++++++++
 powerpc/unittests.cfg         |   4 +
 18 files changed, 980 insertions(+), 29 deletions(-)
 create mode 100644 lib/ppc64/asm/mmu.h
 create mode 100644 lib/ppc64/asm/pgtable-hwdef.h
 create mode 100644 lib/ppc64/asm/pgtable.h
 create mode 100644 lib/ppc64/mmu.c
 create mode 100644 powerpc/mmu.c

diff --git a/configure b/configure
index 0e0a28825..d744ec4dc 100755
--- a/configure
+++ b/configure
@@ -245,25 +245,33 @@ fi
 if [ -z "$page_size" ]; then
     if [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
         page_size="4096"
+    elif [ "$arch" = "ppc64" ]; then
+        page_size="65536"
     fi
 else
-    if [ "$arch" != "arm64" ]; then
-        echo "--page-size is not supported for $arch"
-        usage
-    fi
-
     if [ "${page_size: -1}" = "K" ] || [ "${page_size: -1}" = "k" ]; then
         page_size=$(( ${page_size%?} * 1024 ))
     fi
-    if [ "$page_size" != "4096" ] && [ "$page_size" != "16384" ] &&
-           [ "$page_size" != "65536" ]; then
-        echo "arm64 doesn't support page size of $page_size"
+
+    if [ "$arch" = "arm64" ]; then
+        if [ "$page_size" != "4096" ] && [ "$page_size" != "16384" ] &&
+               [ "$page_size" != "65536" ]; then
+            echo "arm64 doesn't support page size of $page_size"
+            usage
+        fi
+        if [ "$efi" = 'y' ] && [ "$page_size" != "4096" ]; then
+            echo "efi must use 4K pages"
+            exit 1
+        fi
+    elif [ "$arch" = "ppc64" ]; then
+        if [ "$page_size" != "4096" ] && [ "$page_size" != "65536" ]; then
+            echo "ppc64 doesn't support page size of $page_size"
+            usage
+        fi
+    else
+        echo "--page-size is not supported for $arch"
         usage
     fi
-    if [ "$efi" = 'y' ] && [ "$page_size" != "4096" ]; then
-        echo "efi must use 4K pages"
-        exit 1
-    fi
 fi
 
 [ -z "$processor" ] && processor="$arch"
@@ -472,6 +480,13 @@ cat <<EOF >> lib/config.h
 
 #define CONFIG_UART_EARLY_BASE ${arm_uart_early_addr}
 #define CONFIG_ERRATA_FORCE ${errata_force}
+
+EOF
+fi
+
+if [ "$arch" = "arm" ] || [ "$arch" = "arm64" ] || [ "$arch" = "ppc64" ]; then
+cat <<EOF >> lib/config.h
+
 #define CONFIG_PAGE_SIZE _AC(${page_size}, UL)
 
 EOF
diff --git a/lib/powerpc/asm/hcall.h b/lib/powerpc/asm/hcall.h
index e0f5009e3..3b44dd204 100644
--- a/lib/powerpc/asm/hcall.h
+++ b/lib/powerpc/asm/hcall.h
@@ -24,6 +24,12 @@
 #define H_PUT_TERM_CHAR		0x58
 #define H_RANDOM		0x300
 #define H_SET_MODE		0x31C
+#define H_REGISTER_PROCESS_TABLE	0x37C
+
+#define PTBL_NEW		0x18
+#define PTBL_UNREGISTER		0x10
+#define PTBL_RADIX		0x04
+#define PTBL_GTSE		0x01
 
 #define KVMPPC_HCALL_BASE	0xf000
 #define KVMPPC_H_RTAS		(KVMPPC_HCALL_BASE + 0x0)
diff --git a/lib/powerpc/asm/processor.h b/lib/powerpc/asm/processor.h
index a3859b5d4..d348239c5 100644
--- a/lib/powerpc/asm/processor.h
+++ b/lib/powerpc/asm/processor.h
@@ -14,6 +14,7 @@ extern bool cpu_has_hv;
 extern bool cpu_has_power_mce;
 extern bool cpu_has_siar;
 extern bool cpu_has_heai;
+extern bool cpu_has_radix;
 extern bool cpu_has_prefix;
 extern bool cpu_has_sc_lev;
 extern bool cpu_has_pause_short;
diff --git a/lib/powerpc/asm/reg.h b/lib/powerpc/asm/reg.h
index 12f9e8ac6..b2fab4313 100644
--- a/lib/powerpc/asm/reg.h
+++ b/lib/powerpc/asm/reg.h
@@ -11,6 +11,7 @@
 #define SPR_SRR0	0x01a
 #define SPR_SRR1	0x01b
 #define   SRR1_PREFIX		UL(0x20000000)
+#define SPR_PIDR	0x030
 #define SPR_FSCR	0x099
 #define   FSCR_PREFIX		UL(0x2000)
 #define SPR_HFSCR	0x0be
@@ -36,7 +37,9 @@
 #define SPR_LPCR	0x13e
 #define   LPCR_HDICE		UL(0x1)
 #define   LPCR_LD		UL(0x20000)
+#define SPR_LPIDR	0x13f
 #define SPR_HEIR	0x153
+#define SPR_PTCR	0x1d0
 #define SPR_MMCR0	0x31b
 #define   MMCR0_FC		UL(0x80000000)
 #define   MMCR0_PMAE		UL(0x04000000)
diff --git a/lib/powerpc/asm/smp.h b/lib/powerpc/asm/smp.h
index 66188b9dd..3d7d3d08f 100644
--- a/lib/powerpc/asm/smp.h
+++ b/lib/powerpc/asm/smp.h
@@ -3,6 +3,7 @@
 
 #include <libcflat.h>
 #include <asm/processor.h>
+#include <asm/page.h>
 
 typedef void (*secondary_entry_fn)(int cpu_id);
 
@@ -11,6 +12,7 @@ struct cpu {
 	unsigned long stack;
 	unsigned long exception_stack;
 	secondary_entry_fn entry;
+	pgd_t *pgtable;
 };
 
 extern int nr_cpus_present;
diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
index a6ce3c905..09f6bb9d8 100644
--- a/lib/powerpc/processor.c
+++ b/lib/powerpc/processor.c
@@ -13,6 +13,7 @@
 #include <asm/barrier.h>
 #include <asm/hcall.h>
 #include <asm/handlers.h>
+#include <asm/mmu.h>
 #include <asm/smp.h>
 
 static struct {
@@ -47,6 +48,14 @@ void do_handle_exception(struct pt_regs *regs)
 
 	__current_cpu = (struct cpu *)mfspr(SPR_SPRG0);
 
+	/*
+	 * We run with AIL=0, so interrupts taken with MMU disabled.
+	 * Enable here.
+	 */
+	assert(!(mfmsr() & (MSR_IR|MSR_DR)));
+	if (mmu_enabled())
+		mtmsr(mfmsr() | (MSR_IR|MSR_DR));
+
 	v = regs->trap >> 5;
 
 	if (v < 128 && handlers[v].func) {
diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
index 622b99e5d..53ecbb830 100644
--- a/lib/powerpc/setup.c
+++ b/lib/powerpc/setup.c
@@ -103,6 +103,7 @@ bool cpu_has_hv;
 bool cpu_has_power_mce; /* POWER CPU machine checks */
 bool cpu_has_siar;
 bool cpu_has_heai;
+bool cpu_has_radix;
 bool cpu_has_prefix;
 bool cpu_has_sc_lev; /* sc interrupt has LEV field in SRR1 */
 bool cpu_has_pause_short;
@@ -125,6 +126,7 @@ static void cpu_init_params(void)
 		cpu_has_sc_lev = true;
 		cpu_has_pause_short = true;
 	case PVR_VER_POWER9:
+		cpu_has_radix = true;
 	case PVR_VER_POWER8E:
 	case PVR_VER_POWER8NVL:
 	case PVR_VER_POWER8:
@@ -202,10 +204,11 @@ void cpu_init(struct cpu *cpu, int cpu_id)
 {
 	cpu->server_no = cpu_id;
 
-	cpu->stack = (unsigned long)memalign(SZ_4K, SZ_64K);
+	cpu->stack = (unsigned long)memalign_pages(SZ_4K, SZ_64K);
 	cpu->stack += SZ_64K - 64;
-	cpu->exception_stack = (unsigned long)memalign(SZ_4K, SZ_64K);
+	cpu->exception_stack = (unsigned long)memalign_pages(SZ_4K, SZ_64K);
 	cpu->exception_stack += SZ_64K - 64;
+	cpu->pgtable = NULL;
 }
 
 void setup(const void *fdt)
@@ -224,6 +227,7 @@ void setup(const void *fdt)
 	cpu->server_no = fdt_boot_cpuid_phys(fdt);
 	cpu->exception_stack = (unsigned long)boot_exception_stack;
 	cpu->exception_stack += EXCEPTION_STACK_SIZE - 64;
+	cpu->pgtable = NULL;
 
 	mtspr(SPR_SPRG0, (unsigned long)cpu);
 	__current_cpu = cpu;
diff --git a/lib/ppc64/asm/mmu.h b/lib/ppc64/asm/mmu.h
new file mode 100644
index 000000000..fadeee4bc
--- /dev/null
+++ b/lib/ppc64/asm/mmu.h
@@ -0,0 +1,11 @@
+#ifndef _ASMPOWERPC_MMU_H_
+#define _ASMPOWERPC_MMU_H_
+
+#include <asm/pgtable.h>
+
+bool vm_available(void);
+bool mmu_enabled(void);
+void mmu_enable(pgd_t *pgtable);
+void mmu_disable(void);
+
+#endif
diff --git a/lib/ppc64/asm/page.h b/lib/ppc64/asm/page.h
index 1a8b62711..c497d86b9 100644
--- a/lib/ppc64/asm/page.h
+++ b/lib/ppc64/asm/page.h
@@ -1 +1,65 @@
-#include <asm-generic/page.h>
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASMPPC64_PAGE_H_
+#define _ASMPPC64_PAGE_H_
+/*
+ * Adapted from
+ *   lib/arm64/asm/page.h and Linux kernel defines.
+ *
+ * Copyright (C) 2017, Red Hat Inc, Andrew Jones <drjones@redhat.com>
+ */
+
+#include <config.h>
+#include <linux/const.h>
+#include <libcflat.h>
+
+#define VA_BITS			52
+
+#define PAGE_SIZE		CONFIG_PAGE_SIZE
+#if PAGE_SIZE == SZ_64K
+#define PAGE_SHIFT		16
+#elif PAGE_SIZE == SZ_4K
+#define PAGE_SHIFT		12
+#else
+#error Unsupported PAGE_SIZE
+#endif
+#define PAGE_MASK		(~(PAGE_SIZE-1))
+
+#ifndef __ASSEMBLY__
+
+#define PAGE_ALIGN(addr)	ALIGN(addr, PAGE_SIZE)
+
+typedef u64 pteval_t;
+typedef u64 pmdval_t;
+typedef u64 pudval_t;
+typedef u64 pgdval_t;
+typedef struct { pteval_t pte; } pte_t;
+typedef struct { pmdval_t pmd; } pmd_t;
+typedef struct { pudval_t pud; } pud_t;
+typedef struct { pgdval_t pgd; } pgd_t;
+typedef struct { pteval_t pgprot; } pgprot_t;
+
+#define pte_val(x)		((x).pte)
+#define pmd_val(x)		((x).pmd)
+#define pud_val(x)		((x).pud)
+#define pgd_val(x)		((x).pgd)
+#define pgprot_val(x)		((x).pgprot)
+
+#define __pte(x)		((pte_t) { (x) } )
+#define __pmd(x)		((pmd_t) { (x) } )
+#define __pud(x)		((pud_t) { (x) } )
+#define __pgd(x)		((pgd_t) { (x) } )
+#define __pgprot(x)		((pgprot_t) { (x) } )
+
+#define __va(x)			((void *)__phys_to_virt((phys_addr_t)(x)))
+#define __pa(x)			__virt_to_phys((unsigned long)(x))
+
+#define virt_to_pfn(kaddr)	(__pa(kaddr) >> PAGE_SHIFT)
+#define pfn_to_virt(pfn)	__va((pfn) << PAGE_SHIFT)
+
+extern phys_addr_t __virt_to_phys(unsigned long addr);
+extern unsigned long __phys_to_virt(phys_addr_t addr);
+
+extern void *__ioremap(phys_addr_t phys_addr, size_t size);
+
+#endif /* !__ASSEMBLY__ */
+#endif /* _ASMPPC64_PAGE_H_ */
diff --git a/lib/ppc64/asm/pgtable-hwdef.h b/lib/ppc64/asm/pgtable-hwdef.h
new file mode 100644
index 000000000..7cb2c7476
--- /dev/null
+++ b/lib/ppc64/asm/pgtable-hwdef.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASMPPC64_PGTABLE_HWDEF_H_
+#define _ASMPPC64_PGTABLE_HWDEF_H_
+/*
+ * Copyright (C) 2024, IBM Inc, Nicholas Piggin <npiggin@gmail.com>
+ *
+ * Derived from Linux kernel MMU code.
+ */
+
+#include <asm/page.h>
+
+#define UL(x) _AC(x, UL)
+
+/*
+ * Book3S-64 Radix page table
+ */
+#define PGDIR_SHIFT		39
+#define PUD_SHIFT		30
+#define PMD_SHIFT		21
+
+#define PTRS_PER_PGD		(SZ_64K / 8)
+#define PTRS_PER_PUD		(SZ_4K / 8)
+#define PTRS_PER_PMD		(SZ_4K / 8)
+#if PAGE_SIZE == SZ_4K
+#define PTRS_PER_PTE		(SZ_4K / 8)
+#else /* 64K */
+#define PTRS_PER_PTE		(256 / 8)
+#endif
+
+#define PGDIR_SIZE		(UL(1) << PGDIR_SHIFT)
+#define PGDIR_MASK		(~(PGDIR_SIZE-1))
+
+#define PUD_SIZE		(UL(1) << PUD_SHIFT)
+#define PUD_MASK		(~(PUD_SIZE-1))
+
+#define PMD_SIZE		(UL(1) << PMD_SHIFT)
+#define PMD_MASK		(~(PMD_SIZE-1))
+
+#define _PAGE_VALID		0x8000000000000000UL
+#define _PAGE_PTE		0x4000000000000000UL
+
+#define _PAGE_EXEC              0x00001 /* execute permission */
+#define _PAGE_WRITE             0x00002 /* write access allowed */
+#define _PAGE_READ              0x00004 /* read access allowed */
+#define _PAGE_PRIVILEGED        0x00008 /* kernel access only */
+#define _PAGE_SAO               0x00010 /* Strong access order */
+#define _PAGE_NON_IDEMPOTENT    0x00020 /* non idempotent memory */
+#define _PAGE_TOLERANT          0x00030 /* tolerant memory, cache inhibited */
+#define _PAGE_DIRTY             0x00080 /* C: page changed */
+#define _PAGE_ACCESSED          0x00100 /* R: page referenced */
+
+/*
+ * Software bits
+ */
+#define _PAGE_SW0		0x2000000000000000UL
+#define _PAGE_SW1		0x00800UL
+#define _PAGE_SW2		0x00400UL
+#define _PAGE_SW3		0x00200UL
+
+/*
+ * Highest possible physical address.
+ */
+#define PHYS_MASK_SHIFT		(48)
+#define PHYS_MASK		((UL(1) << PHYS_MASK_SHIFT) - 1)
+
+#endif /* _ASMPPC64_PGTABLE_HWDEF_H_ */
diff --git a/lib/ppc64/asm/pgtable.h b/lib/ppc64/asm/pgtable.h
new file mode 100644
index 000000000..a6ee0d4cd
--- /dev/null
+++ b/lib/ppc64/asm/pgtable.h
@@ -0,0 +1,125 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASMARM64_PGTABLE_H_
+#define _ASMARM64_PGTABLE_H_
+/*
+ * Copyright (C) 2024, IBM Inc, Nicholas Piggin <npiggin@gmail.com>
+ *
+ * Derived from Linux kernel MMU code.
+ */
+#include <alloc.h>
+#include <alloc_page.h>
+#include <asm/io.h>
+#include <asm/setup.h>
+#include <asm/page.h>
+#include <asm/pgtable-hwdef.h>
+
+#include <linux/compiler.h>
+
+/*
+ * We can convert va <=> pa page table addresses with simple casts
+ * because we always allocate their pages with alloc_page(), and
+ * alloc_page() always returns identity mapped pages.
+ */
+#define pgtable_va(x)		((void *)(unsigned long)(x))
+#define pgtable_pa(x)		((unsigned long)(x))
+
+#define pgd_none(pgd)		(!pgd_val(pgd))
+#define pud_none(pud)		(!pud_val(pud))
+#define pmd_none(pmd)		(!pmd_val(pmd))
+#define pte_none(pte)		(!pte_val(pte))
+
+#define pgd_valid(pgd)		(pgd_val(pgd) & cpu_to_be64(_PAGE_VALID))
+#define pud_valid(pud)		(pud_val(pud) & cpu_to_be64(_PAGE_VALID))
+#define pmd_valid(pmd)		(pmd_val(pmd) & cpu_to_be64(_PAGE_VALID))
+#define pte_valid(pte)		(pte_val(pte) & cpu_to_be64(_PAGE_VALID))
+
+#define pmd_huge(pmd)		false
+
+static inline pud_t *pgd_page_vaddr(pgd_t pgd)
+{
+	return pgtable_va(be64_to_cpu(pgd_val(pgd)) & PHYS_MASK & ~0xfffULL);
+}
+
+static inline pmd_t *pud_page_vaddr(pud_t pud)
+{
+	return pgtable_va(be64_to_cpu(pud_val(pud)) & PHYS_MASK & ~0xfffULL);
+}
+
+static inline pte_t *pmd_page_vaddr(pmd_t pmd)
+{
+	return pgtable_va(be64_to_cpu(pmd_val(pmd)) & PHYS_MASK & ~0xfffULL);
+}
+
+#define pgd_index(addr)		(((addr) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))
+#define pgd_offset(pt, addr)	((pt) + pgd_index(addr))
+#define pud_index(addr)		(((addr) >> PUD_SHIFT) & (PTRS_PER_PUD - 1))
+#define pud_offset(pgd, addr)	(pgd_page_vaddr(*(pgd)) + pud_index(addr))
+#define pmd_index(addr)		(((addr) >> PMD_SHIFT) & (PTRS_PER_PMD - 1))
+#define pmd_offset(pud, addr)	(pud_page_vaddr(*(pud)) + pmd_index(addr))
+#define pte_index(addr)		(((addr) >> PAGE_SHIFT) & (PTRS_PER_PTE - 1))
+#define pte_offset(pmd, addr)	(pmd_page_vaddr(*(pmd)) + pte_index(addr))
+
+#define pgd_free(pgd) free(pgd)
+static inline pgd_t *pgd_alloc_one(void)
+{
+	size_t sz = PTRS_PER_PGD * sizeof(pgd_t);
+	pgd_t *pgd = memalign_pages(sz, sz);
+	memset(pgd, 0, sz);
+	return pgd;
+}
+
+#define pud_free(pud) free(pud)
+static inline pud_t *pud_alloc_one(void)
+{
+	size_t sz = PTRS_PER_PGD * sizeof(pud_t);
+	pud_t *pud = memalign_pages(sz, sz);
+	memset(pud, 0, sz);
+	return pud;
+}
+static inline pud_t *pud_alloc(pgd_t *pgd, unsigned long addr)
+{
+	if (pgd_none(*pgd)) {
+		pgd_t entry;
+		pgd_val(entry) = cpu_to_be64(pgtable_pa(pud_alloc_one()) | _PAGE_VALID | (12 - 3) /* 4k pud page */);
+		WRITE_ONCE(*pgd, entry);
+	}
+	return pud_offset(pgd, addr);
+}
+
+#define pmd_free(pmd) free(pmd)
+static inline pmd_t *pmd_alloc_one(void)
+{
+	size_t sz = PTRS_PER_PMD * sizeof(pmd_t);
+	pmd_t *pmd = memalign_pages(sz, sz);
+	memset(pmd, 0, sz);
+	return pmd;
+}
+static inline pmd_t *pmd_alloc(pud_t *pud, unsigned long addr)
+{
+	if (pud_none(*pud)) {
+		pud_t entry;
+		pud_val(entry) = cpu_to_be64(pgtable_pa(pmd_alloc_one()) | _PAGE_VALID | (12 - 3) /* 4k pmd page */);
+		WRITE_ONCE(*pud, entry);
+	}
+	return pmd_offset(pud, addr);
+}
+
+#define pte_free(pte) free(pte)
+static inline pte_t *pte_alloc_one(void)
+{
+	size_t sz = PTRS_PER_PTE * sizeof(pte_t);
+	pte_t *pte = memalign_pages(sz, sz);
+	memset(pte, 0, sz);
+	return pte;
+}
+static inline pte_t *pte_alloc(pmd_t *pmd, unsigned long addr)
+{
+	if (pmd_none(*pmd)) {
+		pmd_t entry;
+		pmd_val(entry) = cpu_to_be64(pgtable_pa(pte_alloc_one()) | _PAGE_VALID | (21 - PAGE_SHIFT) /* 4k/256B pte page */);
+		WRITE_ONCE(*pmd, entry);
+	}
+	return pte_offset(pmd, addr);
+}
+
+#endif /* _ASMPPC64_PGTABLE_H_ */
diff --git a/lib/ppc64/mmu.c b/lib/ppc64/mmu.c
new file mode 100644
index 000000000..5307cd862
--- /dev/null
+++ b/lib/ppc64/mmu.c
@@ -0,0 +1,281 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Radix MMU support
+ *
+ * Copyright (C) 2024, IBM Inc, Nicholas Piggin <npiggin@gmail.com>
+ *
+ * Derived from Linux kernel MMU code.
+ */
+#include <asm/mmu.h>
+#include <asm/setup.h>
+#include <asm/smp.h>
+#include <asm/page.h>
+#include <asm/io.h>
+#include <asm/processor.h>
+#include <asm/hcall.h>
+
+#include "alloc_page.h"
+#include "vmalloc.h"
+#include <asm/pgtable-hwdef.h>
+#include <asm/pgtable.h>
+
+#include <linux/compiler.h>
+
+static pgd_t *identity_pgd;
+
+bool vm_available(void)
+{
+	return cpu_has_radix;
+}
+
+bool mmu_enabled(void)
+{
+	return current_cpu()->pgtable != NULL;
+}
+
+void mmu_enable(pgd_t *pgtable)
+{
+	struct cpu *cpu = current_cpu();
+
+	if (!pgtable)
+		pgtable = identity_pgd;
+
+	cpu->pgtable = pgtable;
+
+	mtmsr(mfmsr() | (MSR_IR|MSR_DR));
+}
+
+void mmu_disable(void)
+{
+	struct cpu *cpu = current_cpu();
+
+	cpu->pgtable = NULL;
+
+	mtmsr(mfmsr() & ~(MSR_IR|MSR_DR));
+}
+
+static inline void tlbie(unsigned long rb, unsigned long rs, int ric, int prs, int r)
+{
+	asm volatile(".machine push ; .machine power9; ptesync ; tlbie %0,%1,%2,%3,%4 ; eieio ; tlbsync ; ptesync ; .machine pop" :: "r"(rb), "r"(rs), "i"(ric), "i"(prs), "i"(r) : "memory");
+}
+
+static void flush_tlb_page(uintptr_t vaddr)
+{
+	unsigned long rb;
+	unsigned long ap;
+
+	/* AP should come from dt (for pseries, at least) */
+	if (PAGE_SIZE == SZ_4K)
+		ap = 0;
+	else if (PAGE_SIZE == SZ_64K)
+		ap = 5;
+	else if (PAGE_SIZE == SZ_2M)
+		ap = 1;
+	else if (PAGE_SIZE == SZ_1G)
+		ap = 2;
+	else
+		assert(0);
+
+	rb = vaddr & ~((1UL << 12) - 1);
+	rb |= ap << 5;
+
+	tlbie(rb, 0, 0, 1, 1);
+}
+
+static pteval_t *get_pte(pgd_t *pgtable, uintptr_t vaddr)
+{
+	pgd_t *pgd = pgd_offset(pgtable, vaddr);
+	pud_t *pud = pud_alloc(pgd, vaddr);
+	pmd_t *pmd = pmd_alloc(pud, vaddr);
+	pte_t *pte = pte_alloc(pmd, vaddr);
+
+	return &pte_val(*pte);
+}
+
+static pteval_t *install_pte(pgd_t *pgtable, uintptr_t vaddr, pteval_t pte)
+{
+	pteval_t *p_pte = get_pte(pgtable, vaddr);
+
+	if (READ_ONCE(*p_pte) & cpu_to_be64(_PAGE_VALID)) {
+		WRITE_ONCE(*p_pte, 0);
+		flush_tlb_page(vaddr);
+	}
+
+	WRITE_ONCE(*p_pte, cpu_to_be64(pte));
+
+	return p_pte;
+}
+
+static pteval_t *install_page_prot(pgd_t *pgtable, phys_addr_t phys,
+				   uintptr_t vaddr, pgprot_t prot)
+{
+	pteval_t pte = phys;
+	pte |= _PAGE_VALID | _PAGE_PTE;
+	pte |= pgprot_val(prot);
+	return install_pte(pgtable, vaddr, pte);
+}
+
+pteval_t *install_page(pgd_t *pgtable, phys_addr_t phys, void *virt)
+{
+	if (!pgtable)
+		pgtable = identity_pgd;
+
+	return install_page_prot(pgtable, phys, (uintptr_t)virt,
+				 __pgprot(_PAGE_VALID | _PAGE_PTE |
+					  _PAGE_READ | _PAGE_WRITE |
+					  _PAGE_EXEC | _PAGE_ACCESSED |
+					  _PAGE_DIRTY));
+}
+
+static pteval_t *follow_pte(pgd_t *pgtable, uintptr_t vaddr)
+{
+	pgd_t *pgd;
+	pud_t *pud;
+	pmd_t *pmd;
+	pte_t *pte;
+
+	pgd = pgd_offset(pgtable, vaddr);
+	if (!pgd_valid(*pgd))
+		return NULL;
+
+	pud = pud_offset(pgd, vaddr);
+	if (!pud_valid(*pud))
+		return NULL;
+
+	pmd = pmd_offset(pud, vaddr);
+	if (!pmd_valid(*pmd))
+		return NULL;
+	if (pmd_huge(*pmd))
+		return &pmd_val(*pmd);
+
+	pte = pte_offset(pmd, vaddr);
+	if (!pte_valid(*pte))
+		return NULL;
+
+        return &pte_val(*pte);
+}
+
+phys_addr_t virt_to_pte_phys(pgd_t *pgtable, void *virt)
+{
+	phys_addr_t mask;
+	pteval_t *pteval;
+
+	if (!pgtable)
+		pgtable = identity_pgd;
+
+	pteval = follow_pte(pgtable, (uintptr_t)virt);
+	if (!pteval) {
+		install_page(pgtable, (phys_addr_t)(unsigned long)virt, virt);
+		return (phys_addr_t)(unsigned long)virt;
+	}
+
+	if (pmd_huge(__pmd(*pteval)))
+		mask = PMD_MASK;
+	else
+		mask = PAGE_MASK;
+
+	return (be64_to_cpu(*pteval) & PHYS_MASK & mask) |
+		((phys_addr_t)(unsigned long)virt & ~mask);
+}
+
+struct partition_table_entry {
+	uint64_t dw0;
+	uint64_t dw1;
+};
+
+static struct partition_table_entry *partition_table;
+
+struct process_table_entry {
+	uint64_t dw0;
+	uint64_t dw1;
+};
+
+static struct process_table_entry *process_table;
+
+void *setup_mmu(phys_addr_t phys_end, void *unused)
+{
+	phys_addr_t addr;
+	uint64_t dw0, dw1;
+
+	if (identity_pgd)
+		goto enable;
+
+	assert_msg(cpu_has_radix, "MMU support requires radix MMU.");
+
+	/* 32G address is reserved for vmalloc, cap phys_end at 31G */
+	if (phys_end > (31ul << 30)) {
+		/* print warning */
+		phys_end = 31ul << 30;
+	}
+
+	init_alloc_vpage((void *)(32ul << 30));
+
+	process_table = memalign_pages(SZ_4K, SZ_4K);
+	memset(process_table, 0, SZ_4K);
+
+	identity_pgd = pgd_alloc_one();
+
+	dw0 = (unsigned long)identity_pgd;
+	dw0 |= 16UL - 3; /* 64K pgd size */
+	dw0 |= (0x2UL << 61) | (0x5UL << 5); /* 52-bit virt */
+	process_table[1].dw0 = cpu_to_be64(dw0);
+
+	if (machine_is_pseries()) {
+		int ret;
+
+		ret = hcall(H_REGISTER_PROCESS_TABLE, PTBL_NEW | PTBL_RADIX | PTBL_GTSE, process_table, 0, 0 /* 4K size */);
+		assert_msg(!ret, "H_REGISTER_PROCESS_TABLE failed! err=%d\n", ret);
+	} else if (machine_is_powernv()) {
+		partition_table = memalign_pages(SZ_4K, SZ_4K);
+		memset(partition_table, 0, SZ_4K);
+
+		/* Reuse dw0 for partition table */
+		dw0 |= 1ULL << 63; /* Host radix */
+		dw1 = (unsigned long)process_table; /* 4K size */
+		partition_table[0].dw0 = cpu_to_be64(dw0);
+		partition_table[0].dw1 = cpu_to_be64(dw1);
+
+	} else {
+		/* Only pseries and powernv support radix so far */
+		assert(0);
+	}
+
+	for (addr = 0; addr < phys_end; addr += PAGE_SIZE)
+		install_page(identity_pgd, addr, __va(addr));
+
+enable:
+	if (machine_is_powernv()) {
+		mtspr(SPR_PTCR, (unsigned long)partition_table); /* 4KB size */
+
+		mtspr(SPR_LPIDR, 0);
+		/* Set LPCR[UPRT] and LPCR[HR] for radix */
+		mtspr(SPR_LPCR, mfspr(SPR_LPCR) | (1ULL << 22) | (1ULL << 20));
+	}
+
+	/* PID=1 is used because PID=0 is also mapped in quadrant 3 */
+	mtspr(SPR_PIDR, 1);
+
+	mmu_enable(identity_pgd);
+
+	return identity_pgd;
+}
+
+phys_addr_t __virt_to_phys(unsigned long addr)
+{
+	if (mmu_enabled()) {
+		pgd_t *pgtable = current_cpu()->pgtable;
+		return virt_to_pte_phys(pgtable, (void *)addr);
+	}
+	return addr;
+}
+
+unsigned long __phys_to_virt(phys_addr_t addr)
+{
+	/*
+	 * We don't guarantee that phys_to_virt(virt_to_phys(vaddr)) == vaddr, but
+	 * the default page tables do identity map all physical addresses, which
+	 * means phys_to_virt(virt_to_phys((void *)paddr)) == paddr.
+	 */
+	assert(!mmu_enabled() || __virt_to_phys(addr) == addr);
+	return addr;
+}
diff --git a/lib/ppc64/opal-calls.S b/lib/ppc64/opal-calls.S
index 8cb4c3e91..bc9c51f84 100644
--- a/lib/ppc64/opal-calls.S
+++ b/lib/ppc64/opal-calls.S
@@ -25,8 +25,8 @@ opal_call:
 	mfmsr	r12
 	std	r12,-16(r1) /* use redzone */
 
-	/* switch to BE when we enter OPAL */
-	li	r11,(1 << MSR_LE_BIT)
+	/* switch to BE and real-mode when we enter OPAL */
+	li	r11,(1 << MSR_LE_BIT) | MSR_IR | MSR_DR
 	ori	r11,r11,(1 << MSR_EE_BIT)
 	andc	r12,r12,r11
 	mtspr	SPR_HSRR1,r12
diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index b273033d1..7378b1137 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -16,7 +16,8 @@ tests-common = \
 	$(TEST_DIR)/smp.elf \
 	$(TEST_DIR)/sprs.elf \
 	$(TEST_DIR)/timebase.elf \
-	$(TEST_DIR)/interrupts.elf
+	$(TEST_DIR)/interrupts.elf \
+	$(TEST_DIR)/mmu.elf
 
 tests-all = $(tests-common) $(tests)
 all: directories $(TEST_DIR)/boot_rom.bin $(tests-all)
@@ -42,6 +43,7 @@ cflatobjs += lib/getchar.o
 cflatobjs += lib/alloc_phys.o
 cflatobjs += lib/alloc.o
 cflatobjs += lib/alloc_page.o
+cflatobjs += lib/vmalloc.o
 cflatobjs += lib/devicetree.o
 cflatobjs += lib/migrate.o
 cflatobjs += lib/powerpc/io.o
diff --git a/powerpc/Makefile.ppc64 b/powerpc/Makefile.ppc64
index a18a9628f..2466471f9 100644
--- a/powerpc/Makefile.ppc64
+++ b/powerpc/Makefile.ppc64
@@ -18,6 +18,7 @@ reloc.o  = $(TEST_DIR)/reloc64.o
 
 OBJDIRS += lib/ppc64
 cflatobjs += lib/ppc64/stack.o
+cflatobjs += lib/ppc64/mmu.o
 cflatobjs += lib/ppc64/opal.o
 cflatobjs += lib/ppc64/opal-calls.o
 
diff --git a/powerpc/interrupts.c b/powerpc/interrupts.c
index 552c48ef2..6bed26e41 100644
--- a/powerpc/interrupts.c
+++ b/powerpc/interrupts.c
@@ -14,6 +14,9 @@
 #include <asm/processor.h>
 #include <asm/time.h>
 #include <asm/barrier.h>
+#include <asm/mmu.h>
+#include "alloc_phys.h"
+#include "vmalloc.h"
 
 static volatile bool got_interrupt;
 static volatile struct pt_regs recorded_regs;
@@ -44,6 +47,7 @@ static void test_mce(void)
 	unsigned long addr = -4ULL;
 	uint8_t tmp;
 	bool is_fetch;
+	bool mmu = mmu_enabled();
 
 	report_prefix_push("mce");
 
@@ -53,6 +57,9 @@ static void test_mce(void)
 	handle_exception(0x400, fault_handler, NULL);
 	handle_exception(0x480, fault_handler, NULL);
 
+	if (mmu)
+		mmu_disable();
+
 	if (machine_is_powernv()) {
 		enable_mcheck();
 	} else {
@@ -71,7 +78,6 @@ static void test_mce(void)
 
 	is_fetch = false;
 	asm volatile("lbz %0,0(%1)" : "=r"(tmp) : "r"(addr));
-
 	report(got_interrupt, "MCE on access to invalid real address");
 	if (got_interrupt) {
 		report(mfspr(SPR_DAR) == addr, "MCE sets DAR correctly");
@@ -90,6 +96,9 @@ static void test_mce(void)
 		got_interrupt = false;
 	}
 
+	if (mmu)
+		mmu_enable(NULL);
+
 	handle_exception(0x200, NULL, NULL);
 	handle_exception(0x300, NULL, NULL);
 	handle_exception(0x380, NULL, NULL);
@@ -99,29 +108,36 @@ static void test_mce(void)
 	report_prefix_pop();
 }
 
-static void dseg_handler(struct pt_regs *regs, void *data)
+static void dside_handler(struct pt_regs *regs, void *data)
 {
 	got_interrupt = true;
 	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
 	regs_advance_insn(regs);
-	regs->msr &= ~MSR_DR;
 }
 
-static void test_dseg(void)
+static void iside_handler(struct pt_regs *regs, void *data)
+{
+	got_interrupt = true;
+	memcpy((void *)&recorded_regs, regs, sizeof(struct pt_regs));
+	regs->nip = regs->link;
+}
+
+static void test_dseg_nommu(void)
 {
 	uint64_t msr, tmp;
 
-	report_prefix_push("data segment");
+	report_prefix_push("dseg");
 
 	/* Some HV start in radix mode and need 0x300 */
-	handle_exception(0x300, &dseg_handler, NULL);
-	handle_exception(0x380, &dseg_handler, NULL);
+	handle_exception(0x300, &dside_handler, NULL);
+	handle_exception(0x380, &dside_handler, NULL);
 
 	asm volatile(
 "		mfmsr	%0		\n \
-		ori	%0,%0,%2	\n \
-		mtmsrd	%0		\n \
-		lbz	%1,0(0)		"
+		ori	%1,%0,%2	\n \
+		mtmsrd	%1		\n \
+		lbz	%1,0(0)		\n \
+		mtmsrd	%0		"
 		: "=r"(msr), "=r"(tmp) : "i"(MSR_DR): "memory");
 
 	report(got_interrupt, "interrupt on NULL dereference");
@@ -133,6 +149,61 @@ static void test_dseg(void)
 	report_prefix_pop();
 }
 
+static void test_mmu(void)
+{
+	uint64_t tmp, addr;
+	phys_addr_t base, top;
+
+	if (!mmu_enabled()) {
+		test_dseg_nommu();
+		return;
+	}
+
+	phys_alloc_get_unused(&base, &top);
+
+	report_prefix_push("dsi");
+	addr = top + PAGE_SIZE;
+	handle_exception(0x300, &dside_handler, NULL);
+	asm volatile("lbz %0,0(%1)" : "=r"(tmp) : "r"(addr));
+	report(got_interrupt, "dsi on out of range dereference");
+	report(mfspr(SPR_DAR) == addr, "DAR set correctly");
+	report(mfspr(SPR_DSISR) & (1ULL << 30), "DSISR set correctly");
+	got_interrupt = false;
+	handle_exception(0x300, NULL, NULL);
+	report_prefix_pop();
+
+	report_prefix_push("dseg");
+	addr = -4ULL;
+	handle_exception(0x380, &dside_handler, NULL);
+	asm volatile("lbz %0,0(%1)" : "=r"(tmp) : "r"(addr));
+	report(got_interrupt, "dseg on out of range dereference");
+	report(mfspr(SPR_DAR) == addr, "DAR set correctly");
+	got_interrupt = false;
+	handle_exception(0x380, NULL, NULL);
+	report_prefix_pop();
+
+	report_prefix_push("isi");
+	addr = top + PAGE_SIZE;
+	handle_exception(0x400, &iside_handler, NULL);
+	asm volatile("mtctr %0 ; bctrl" :: "r"(addr) : "ctr", "lr");
+	report(got_interrupt, "isi on out of range fetch");
+	report(recorded_regs.nip == addr, "SRR0 set correctly");
+	report(recorded_regs.msr & (1ULL << 30), "SRR1 set correctly");
+	got_interrupt = false;
+	handle_exception(0x400, NULL, NULL);
+	report_prefix_pop();
+
+	report_prefix_push("iseg");
+	addr = -4ULL;
+	handle_exception(0x480, &iside_handler, NULL);
+	asm volatile("mtctr %0 ; bctrl" :: "r"(addr) : "ctr", "lr");
+	report(got_interrupt, "isi on out of range fetch");
+	report(recorded_regs.nip == addr, "SRR0 set correctly");
+	got_interrupt = false;
+	handle_exception(0x480, NULL, NULL);
+	report_prefix_pop();
+}
+
 static void dec_handler(struct pt_regs *regs, void *data)
 {
 	got_interrupt = true;
@@ -400,9 +471,12 @@ int main(int argc, char **argv)
 {
 	report_prefix_push("interrupts");
 
+	if (vm_available())
+		setup_vm();
+
 	if (cpu_has_power_mce)
 		test_mce();
-	test_dseg();
+	test_mmu();
 	test_illegal();
 	test_dec();
 	test_sc();
diff --git a/powerpc/mmu.c b/powerpc/mmu.c
new file mode 100644
index 000000000..fef790506
--- /dev/null
+++ b/powerpc/mmu.c
@@ -0,0 +1,283 @@
+/* SPDX-License-Identifier: LGPL-2.0-only */
+/*
+ * MMU Tests
+ *
+ * Copyright 2024 Nicholas Piggin, IBM Corp.
+ */
+#include <libcflat.h>
+#include <asm/atomic.h>
+#include <asm/barrier.h>
+#include <asm/processor.h>
+#include <asm/mmu.h>
+#include <asm/smp.h>
+#include <asm/setup.h>
+#include <asm/ppc_asm.h>
+#include <vmalloc.h>
+#include <devicetree.h>
+
+static inline void tlbie(unsigned long rb, unsigned long rs, int ric, int prs, int r)
+{
+	asm volatile(".machine push ; .machine power9; ptesync ; tlbie %0,%1,%2,%3,%4 ; eieio ; tlbsync ; ptesync ; .machine pop" :: "r"(rb), "r"(rs), "i"(ric), "i"(prs), "i"(r) : "memory");
+}
+
+static inline void tlbiel(unsigned long rb, unsigned long rs, int ric, int prs, int r)
+{
+	asm volatile(".machine push ; .machine power9; ptesync ; tlbiel %0,%1,%2,%3,%4 ; ptesync ; .machine pop" :: "r"(rb), "r"(rs), "i"(ric), "i"(prs), "i"(r) : "memory");
+}
+
+static inline void flush_tlb_page_global(uintptr_t vaddr)
+{
+	unsigned long rb;
+	unsigned long rs = (1ULL << 32); /* pid */
+	unsigned long ap;
+
+	/* AP should come from dt (for pseries, at least) */
+	if (PAGE_SIZE == SZ_4K)
+		ap = 0;
+	else if (PAGE_SIZE == SZ_64K)
+		ap = 5;
+	else if (PAGE_SIZE == SZ_2M)
+		ap = 1;
+	else if (PAGE_SIZE == SZ_1G)
+		ap = 2;
+	else
+		assert(0);
+
+	rb = vaddr & ~((1UL << 12) - 1);
+	rb |= ap << 5;
+
+	tlbie(rb, rs, 0, 1, 1);
+}
+
+static inline void flush_tlb_page_local(uintptr_t vaddr)
+{
+	unsigned long rb;
+	unsigned long rs = (1ULL << 32); /* pid */
+	unsigned long ap;
+
+	/* AP should come from dt (for pseries, at least) */
+	if (PAGE_SIZE == SZ_4K)
+		ap = 0;
+	else if (PAGE_SIZE == SZ_64K)
+		ap = 5;
+	else if (PAGE_SIZE == SZ_2M)
+		ap = 1;
+	else if (PAGE_SIZE == SZ_1G)
+		ap = 2;
+	else
+		assert(0);
+
+	rb = vaddr & ~((1UL << 12) - 1);
+	rb |= ap << 5;
+
+	tlbiel(rb, rs, 0, 1, 1);
+}
+
+static volatile bool tlbie_test_running = true;
+static volatile bool tlbie_test_failed = false;
+static int tlbie_fn_started;
+
+static void *memory;
+
+static void trap_handler(struct pt_regs *regs, void *opaque)
+{
+	tlbie_test_failed = true;
+	regs_advance_insn(regs);
+}
+
+static void tlbie_fn(int cpu_id)
+{
+	volatile char *m = memory;
+
+	setup_mmu(0, NULL);
+
+	atomic_fetch_inc(&tlbie_fn_started);
+	while (tlbie_test_running) {
+		unsigned long tmp;
+
+		/*
+		 * This is intended to execuse a QEMU TCG bug by forming a
+		 * large TB which can prevent async work from running while the
+		 * TB executes, so it could miss a broadcast TLB invalidation
+		 * and pick up a stale translation.
+		 */
+		asm volatile (".rept 256 ; lbz %0,0(%1) ; tdnei %0,0 ; .endr" : "=&r"(tmp) : "r"(m));
+	}
+}
+
+#define ITERS 10000000
+
+static void test_tlbie(int argc, char **argv)
+{
+	void *m[2];
+	phys_addr_t p[2];
+	pteval_t pteval[2];
+	pteval_t *ptep;
+	int i;
+
+	if (argc > 2)
+		report_abort("Unsupported argument: '%s'", argv[2]);
+
+	if (nr_cpus_present < 2) {
+		report_skip("Requires SMP (2 or more CPUs)");
+		return;
+	}
+
+	handle_exception(0x700, &trap_handler, NULL);
+
+	m[0] = alloc_page();
+	p[0] = virt_to_phys(m[0]);
+	memset(m[0], 0, PAGE_SIZE);
+	m[1] = alloc_page();
+	p[1] = virt_to_phys(m[1]);
+	memset(m[1], 0, PAGE_SIZE);
+
+	memory = alloc_vpages(1);
+	ptep = install_page(NULL, p[0], memory);
+	pteval[0] = *ptep;
+	assert(ptep == install_page(NULL, p[1], memory));
+	pteval[1] = *ptep;
+	assert(ptep == install_page(NULL, p[0], memory));
+	assert(pteval[0] == *ptep);
+	flush_tlb_page_global((unsigned long)memory);
+
+	if (!start_all_cpus(tlbie_fn))
+		report_abort("Failed to start secondary cpus");
+
+	while (tlbie_fn_started < nr_cpus_present - 1) {
+		cpu_relax();
+	}
+
+	for (i = 0; i < ITERS; i++) {
+		*ptep = pteval[1];
+		flush_tlb_page_global((unsigned long)memory);
+		*(long *)m[0] = -1;
+		barrier();
+		*(long *)m[0] = 0;
+		barrier();
+		*ptep = pteval[0];
+		flush_tlb_page_global((unsigned long)memory);
+		*(long *)m[1] = -1;
+		barrier();
+		*(long *)m[1] = 0;
+		barrier();
+		if (tlbie_test_failed)
+			break;
+	}
+
+	tlbie_test_running = false;
+
+	stop_all_cpus();
+
+	handle_exception(0x700, NULL, NULL);
+
+	/* TCG has a known race invalidating other CPUs */
+	report_kfail(true, !tlbie_test_failed, "tlbie");
+}
+
+#define THIS_ITERS 100000
+
+static void test_tlbie_this_cpu(int argc, char **argv)
+{
+	void *m[2];
+	phys_addr_t p[2];
+	pteval_t pteval[2];
+	pteval_t *ptep;
+	int i;
+	bool success;
+
+	if (argc > 2)
+		report_abort("Unsupported argument: '%s'", argv[2]);
+
+	m[0] = alloc_page();
+	p[0] = virt_to_phys(m[0]);
+	memset(m[0], 0, PAGE_SIZE);
+	m[1] = alloc_page();
+	p[1] = virt_to_phys(m[1]);
+	memset(m[1], 0, PAGE_SIZE);
+
+	memory = alloc_vpages(1);
+	ptep = install_page(NULL, p[0], memory);
+	pteval[0] = *ptep;
+	assert(ptep == install_page(NULL, p[1], memory));
+	pteval[1] = *ptep;
+	assert(ptep == install_page(NULL, p[0], memory));
+	assert(pteval[0] == *ptep);
+	flush_tlb_page_global((unsigned long)memory);
+
+	*(long *)m[0] = 0;
+	*(long *)m[1] = -1;
+
+	success = true;
+	for (i = 0; i < THIS_ITERS; i++) {
+		if (*(long *)memory != 0) {
+			success = false;
+			break;
+		}
+		*ptep = pteval[1];
+		flush_tlb_page_local((unsigned long)memory);
+		if (*(long *)memory != -1) {
+			success = false;
+			break;
+		}
+		*ptep = pteval[0];
+		flush_tlb_page_local((unsigned long)memory);
+	}
+	report(success, "tlbiel");
+
+	success = true;
+	flush_tlb_page_global((unsigned long)memory);
+	for (i = 0; i < THIS_ITERS; i++) {
+		if (*(long *)memory != 0) {
+			success = false;
+			break;
+		}
+		*ptep = pteval[1];
+		flush_tlb_page_global((unsigned long)memory);
+		if (*(long *)memory != -1) {
+			success = false;
+			break;
+		}
+		*ptep = pteval[0];
+		flush_tlb_page_global((unsigned long)memory);
+	}
+	report(success, "tlbie");
+}
+
+
+struct {
+	const char *name;
+	void (*func)(int argc, char **argv);
+} hctests[] = {
+	{ "tlbi-this-cpu", test_tlbie_this_cpu },
+	{ "tlbi-other-cpu", test_tlbie },
+	{ NULL, NULL }
+};
+
+int main(int argc, char **argv)
+{
+	bool all;
+	int i;
+
+	if (!vm_available()) {
+		report_skip("MMU is only supported for radix");
+		return 0;
+	}
+
+	setup_vm();
+
+	all = argc == 1 || !strcmp(argv[1], "all");
+
+	report_prefix_push("mmu");
+
+	for (i = 0; hctests[i].name != NULL; i++) {
+		if (all || strcmp(argv[1], hctests[i].name) == 0) {
+			report_prefix_push(hctests[i].name);
+			hctests[i].func(argc, argv);
+			report_prefix_pop();
+		}
+	}
+
+	report_prefix_pop();
+	return report_summary();
+}
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 39e6dea3c..286e11782 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -69,6 +69,10 @@ file = emulator.elf
 [interrupts]
 file = interrupts.elf
 
+[mmu]
+file = mmu.elf
+smp = $MAX_SMP
+
 [smp]
 file = smp.elf
 smp = 2
-- 
2.43.0

