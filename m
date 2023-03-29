Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C60586CD154
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 06:57:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PmZ6X55RNz3cgT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 15:57:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=oHzBbKmf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=oHzBbKmf;
	dkim-atps=neutral
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmZ5h1q9cz2xBF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 15:56:40 +1100 (AEDT)
Received: by mail-wr1-x42a.google.com with SMTP id l27so14337561wrb.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 21:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680065797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQMSo3dI1TiCgJ5bOYmXGeEP35jM8ytuP5TLzldwWRk=;
        b=oHzBbKmfvidPMXVZTsEnD3Nq8DrVl2ki2+fns5DbUkbhqkVcyOXHnVU1ShAOw6KMfN
         jRKYI06+OpsREA2TvO2HcVgRzHy36hzSfmGcbmpF6fQkFOCWxB67H4T8BvFIsWgBAvdq
         9oLf3Bj6yrlCorWf6W4vJ0M9L+T57cGuF39BtWSk279Vww3Yv1Jj095jPMBEAipUhvUs
         U9myrZhKJnMgsGxbidyNhkaEk0I0UGdO5RrjgQdqIFPlt5dgQBL2+aqZO+un5TtgpOWO
         DGKqZD7CUpiPHsBrH7foUX9kVx7D0a373qtyl0OeOaAkDgQI5POdME9T8+scDzUUlOvw
         9iiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680065797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQMSo3dI1TiCgJ5bOYmXGeEP35jM8ytuP5TLzldwWRk=;
        b=vINmlINJ037p0SZRIlxyZEfa1+K1IB0YoGPRAQBYOlNq/33jxIrGC1otQ8sPRPtX5J
         Qa4v8DQ1N0B2QFyV5esOyUNc3FkCEWtI+H0ZG//68ch+xkHRmI25D4kGuAyA3wXSKyiE
         utmFJAF3wFwsJcM/tekOIpV2/Z82nXsTWZy8UT6gOFUqdM+brMTZ/zlgvGn+QlzGkrgS
         htil9FFe1q7LMFrouue5e+DT/3d3hF8RrKQ0j5EZBuSBsvKsJgYVZxEGmpHrnWA8K4i2
         YywUqARaVWPLCBjQ1rvZn99i5+/3OysqStxIEAyXUt1dO+ngtHdikJNM9XtE3grDKkkP
         EfGw==
X-Gm-Message-State: AAQBX9d6I8jwYl6F5WCWz3U9VvNHsTg+D4XfIXLU4yseda/2IgxrjLOF
	PwYtcfB0+QxNGIXR04HpQbrW5Q==
X-Google-Smtp-Source: AKy350apw2rJxTh795JIx8DPttqwEHcr5qnVOJOYeKOdyO3sghAOnPCeswjEAny+PP0Gt+12hyUksA==
X-Received: by 2002:adf:fe51:0:b0:2d9:457a:1069 with SMTP id m17-20020adffe51000000b002d9457a1069mr14280855wrs.37.1680065796823;
        Tue, 28 Mar 2023 21:56:36 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id e8-20020adffd08000000b002c592535839sm29042488wrr.17.2023.03.28.21.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 21:56:36 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Nick Desaulniers <ndesaulniers@google.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v9 3/6] riscv: Introduce CONFIG_RELOCATABLE
Date: Wed, 29 Mar 2023 06:53:26 +0200
Message-Id: <20230329045329.64565-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230329045329.64565-1-alexghiti@rivosinc.com>
References: <20230329045329.64565-1-alexghiti@rivosinc.com>
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This config allows to compile 64b kernel as PIE and to relocate it at
any virtual address at runtime: this paves the way to KASLR.
Runtime relocation is possible since relocation metadata are embedded into
the kernel.

Note that relocating at runtime introduces an overhead even if the
kernel is loaded at the same address it was linked at and that the compiler
options are those used in arm64 which uses the same RELA relocation
format.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig              | 14 +++++++++
 arch/riscv/Makefile             |  7 +++--
 arch/riscv/kernel/vmlinux.lds.S | 17 +++++++++--
 arch/riscv/mm/Makefile          |  4 +++
 arch/riscv/mm/init.c            | 54 ++++++++++++++++++++++++++++++++-
 5 files changed, 91 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 3c5907431081..6ff9f574195d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -562,6 +562,20 @@ config COMPAT
 
 	  If you want to execute 32-bit userspace applications, say Y.
 
+config RELOCATABLE
+	bool "Build a relocatable kernel"
+	depends on MMU && 64BIT && !XIP_KERNEL
+	help
+          This builds a kernel as a Position Independent Executable (PIE),
+          which retains all relocation metadata required to relocate the
+          kernel binary at runtime to a different virtual address than the
+          address it was linked at.
+          Since RISCV uses the RELA relocation format, this requires a
+          relocation pass at runtime even if the kernel is loaded at the
+          same address it was linked at.
+
+          If unsure, say N.
+
 endmenu # "Kernel features"
 
 menu "Boot options"
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 6203c3378922..860b09e409c7 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -7,9 +7,12 @@
 #
 
 OBJCOPYFLAGS    := -O binary
-LDFLAGS_vmlinux :=
+ifeq ($(CONFIG_RELOCATABLE),y)
+	LDFLAGS_vmlinux += -shared -Bsymbolic -z notext -z norelro
+	KBUILD_CFLAGS += -fPIE
+endif
 ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
-	LDFLAGS_vmlinux := --no-relax
+	LDFLAGS_vmlinux += --no-relax
 	KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
 ifeq ($(CONFIG_RISCV_ISA_C),y)
 	CC_FLAGS_FTRACE := -fpatchable-function-entry=4
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index e05e6df44225..615ff5842690 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -122,10 +122,23 @@ SECTIONS
 		*(.sdata*)
 	}
 
-	.rela.dyn : {
-		*(.rela*)
+	.rela.dyn : ALIGN(8) {
+		__rela_dyn_start = .;
+		*(.rela .rela*)
+		__rela_dyn_end = .;
 	}
 
+#ifdef CONFIG_RELOCATABLE
+	.data.rel : { *(.data.rel*) }
+	.got : { *(.got*) }
+	.plt : { *(.plt) }
+	.dynamic : { *(.dynamic) }
+	.dynsym : { *(.dynsym) }
+	.dynstr : { *(.dynstr) }
+	.hash : { *(.hash) }
+	.gnu.hash : { *(.gnu.hash) }
+#endif
+
 #ifdef CONFIG_EFI
 	.pecoff_edata_padding : { BYTE(0); . = ALIGN(PECOFF_FILE_ALIGNMENT); }
 	__pecoff_data_raw_size = ABSOLUTE(. - __pecoff_text_end);
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 2ac177c05352..b85e9e82f082 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -1,6 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 CFLAGS_init.o := -mcmodel=medany
+ifdef CONFIG_RELOCATABLE
+CFLAGS_init.o += -fno-pie
+endif
+
 ifdef CONFIG_FTRACE
 CFLAGS_REMOVE_init.o = $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_cacheflush.o = $(CC_FLAGS_FTRACE)
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index f803671d18b2..bce899b180cd 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -20,6 +20,9 @@
 #include <linux/dma-map-ops.h>
 #include <linux/crash_dump.h>
 #include <linux/hugetlb.h>
+#ifdef CONFIG_RELOCATABLE
+#include <linux/elf.h>
+#endif
 
 #include <asm/fixmap.h>
 #include <asm/tlbflush.h>
@@ -146,7 +149,7 @@ static void __init print_vm_layout(void)
 		print_ml("kasan", KASAN_SHADOW_START, KASAN_SHADOW_END);
 #endif
 
-		print_ml("kernel", (unsigned long)KERNEL_LINK_ADDR,
+		print_ml("kernel", (unsigned long)kernel_map.virt_addr,
 			 (unsigned long)ADDRESS_SPACE_END);
 	}
 }
@@ -831,6 +834,44 @@ static __init void set_satp_mode(void)
 #error "setup_vm() is called from head.S before relocate so it should not use absolute addressing."
 #endif
 
+#ifdef CONFIG_RELOCATABLE
+extern unsigned long __rela_dyn_start, __rela_dyn_end;
+
+static void __init relocate_kernel(void)
+{
+	Elf64_Rela *rela = (Elf64_Rela *)&__rela_dyn_start;
+	/*
+	 * This holds the offset between the linked virtual address and the
+	 * relocated virtual address.
+	 */
+	uintptr_t reloc_offset = kernel_map.virt_addr - KERNEL_LINK_ADDR;
+	/*
+	 * This holds the offset between kernel linked virtual address and
+	 * physical address.
+	 */
+	uintptr_t va_kernel_link_pa_offset = KERNEL_LINK_ADDR - kernel_map.phys_addr;
+
+	for ( ; rela < (Elf64_Rela *)&__rela_dyn_end; rela++) {
+		Elf64_Addr addr = (rela->r_offset - va_kernel_link_pa_offset);
+		Elf64_Addr relocated_addr = rela->r_addend;
+
+		if (rela->r_info != R_RISCV_RELATIVE)
+			continue;
+
+		/*
+		 * Make sure to not relocate vdso symbols like rt_sigreturn
+		 * which are linked from the address 0 in vmlinux since
+		 * vdso symbol addresses are actually used as an offset from
+		 * mm->context.vdso in VDSO_OFFSET macro.
+		 */
+		if (relocated_addr >= KERNEL_LINK_ADDR)
+			relocated_addr += reloc_offset;
+
+		*(Elf64_Addr *)addr = relocated_addr;
+	}
+}
+#endif /* CONFIG_RELOCATABLE */
+
 #ifdef CONFIG_XIP_KERNEL
 static void __init create_kernel_page_table(pgd_t *pgdir,
 					    __always_unused bool early)
@@ -1029,6 +1070,17 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	BUG_ON((kernel_map.virt_addr + kernel_map.size) > ADDRESS_SPACE_END - SZ_4K);
 #endif
 
+#ifdef CONFIG_RELOCATABLE
+	/*
+	 * Early page table uses only one PUD, which makes it possible
+	 * to map PUD_SIZE aligned on PUD_SIZE: if the relocation offset
+	 * makes the kernel cross over a PUD_SIZE boundary, raise a bug
+	 * since a part of the kernel would not get mapped.
+	 */
+	BUG_ON(PUD_SIZE - (kernel_map.virt_addr & (PUD_SIZE - 1)) < kernel_map.size);
+	relocate_kernel();
+#endif
+
 	apply_early_boot_alternatives();
 	pt_ops_set_early();
 
-- 
2.37.2

