Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9578E38763E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 12:14:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FksLM1wqBz3bsL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 20:14:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=ghiti.fr
 (client-ip=217.70.183.196; helo=relay4-d.mail.gandi.net;
 envelope-from=alex@ghiti.fr; receiver=<UNKNOWN>)
X-Greylist: delayed 67 seconds by postgrey-1.36 at boromir;
 Tue, 18 May 2021 20:14:14 AEST
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FksKy19ZFz2yWT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 May 2021 20:14:13 +1000 (AEST)
Received: (Authenticated sender: alex@ghiti.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 504C0E0003;
 Tue, 18 May 2021 10:14:01 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v6 1/3] riscv: Introduce CONFIG_RELOCATABLE
Date: Tue, 18 May 2021 12:12:50 +0200
Message-Id: <20210518101252.1484465-2-alex@ghiti.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210518101252.1484465-1-alex@ghiti.fr>
References: <20210518101252.1484465-1-alex@ghiti.fr>
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
Cc: Alexandre Ghiti <alex@ghiti.fr>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This config allows to compile 64b kernel as PIE and to relocate it at
any virtual address at runtime: this paves the way to KASLR.
Runtime relocation is possible since relocation metadata are embedded into
the kernel.

Note that relocating at runtime introduces an overhead even if the
kernel is loaded at the same address it was linked at and that the compiler
options are those used in arm64 which uses the same RELA relocation
format.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/Kconfig              | 12 ++++++++
 arch/riscv/Makefile             |  5 +++-
 arch/riscv/kernel/vmlinux.lds.S |  6 ++++
 arch/riscv/mm/Makefile          |  4 +++
 arch/riscv/mm/init.c            | 53 ++++++++++++++++++++++++++++++++-
 5 files changed, 78 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a8ad8eb76120..7d49c9fa9a91 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -205,6 +205,18 @@ config PGTABLE_LEVELS
 config LOCKDEP_SUPPORT
 	def_bool y
 
+config RELOCATABLE
+	bool
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
 source "arch/riscv/Kconfig.socs"
 source "arch/riscv/Kconfig.erratas"
 
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 3eb9590a0775..2d217ecb6e6b 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -9,7 +9,10 @@
 #
 
 OBJCOPYFLAGS    := -O binary
-LDFLAGS_vmlinux :=
+ifeq ($(CONFIG_RELOCATABLE),y)
+LDFLAGS_vmlinux := -shared -Bsymbolic -z notext -z norelro
+KBUILD_CFLAGS += -fPIE
+endif
 ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
 	LDFLAGS_vmlinux := --no-relax
 	KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY
diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 891742ff75a7..1517fd1c7246 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -133,6 +133,12 @@ SECTIONS
 
 	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
 
+	.rela.dyn : ALIGN(8) {
+		__rela_dyn_start = .;
+		*(.rela .rela*)
+		__rela_dyn_end = .;
+	}
+
 #ifdef CONFIG_EFI
 	. = ALIGN(PECOFF_SECTION_ALIGNMENT);
 	__pecoff_data_virt_size = ABSOLUTE(. - __pecoff_text_end);
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 7ebaef10ea1b..2d33ec574bbb 100644
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
index 4faf8bd157ea..5e0a19d9d8fa 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -18,6 +18,9 @@
 #include <linux/set_memory.h>
 #include <linux/dma-map-ops.h>
 #include <linux/crash_dump.h>
+#ifdef CONFIG_RELOCATABLE
+#include <linux/elf.h>
+#endif
 
 #include <asm/fixmap.h>
 #include <asm/tlbflush.h>
@@ -99,7 +102,7 @@ static void __init print_vm_layout(void)
 	print_mlm("lowmem", (unsigned long)PAGE_OFFSET,
 		  (unsigned long)high_memory);
 #ifdef CONFIG_64BIT
-	print_mlm("kernel", (unsigned long)KERNEL_LINK_ADDR,
+	print_mlm("kernel", (unsigned long)kernel_virt_addr,
 		  (unsigned long)ADDRESS_SPACE_END);
 #endif
 }
@@ -454,6 +457,44 @@ asmlinkage void __init __copy_data(void)
 #error "setup_vm() is called from head.S before relocate so it should not use absolute addressing."
 #endif
 
+#ifdef CONFIG_RELOCATABLE
+extern unsigned long __rela_dyn_start, __rela_dyn_end;
+
+void __init relocate_kernel(uintptr_t load_pa)
+{
+	Elf64_Rela *rela = (Elf64_Rela *)&__rela_dyn_start;
+	/*
+	 * This holds the offset between the linked virtual address and the
+	 * relocated virtual address.
+	 */
+	uintptr_t reloc_offset = kernel_virt_addr - KERNEL_LINK_ADDR;
+	/*
+	 * This holds the offset between kernel linked virtual address and
+	 * physical address.
+	 */
+	uintptr_t va_kernel_link_pa_offset = KERNEL_LINK_ADDR - load_pa;
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
+#endif
+
 uintptr_t load_pa, load_sz;
 #ifdef CONFIG_XIP_KERNEL
 #define load_pa        (*((uintptr_t *)XIP_FIXUP(&load_pa)))
@@ -524,6 +565,16 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 
 	pfn_base = PFN_DOWN(load_pa);
 
+#ifdef CONFIG_RELOCATABLE
+	/*
+	 * Early page table uses only one PGDIR, which makes it possible
+	 * to map PGDIR_SIZE aligned on PGDIR_SIZE: if the relocation offset
+	 * makes the kernel cross over a PGDIR_SIZE boundary, raise a bug
+	 * since a part of the kernel would not get mapped.
+	 */
+	BUG_ON(PGDIR_SIZE - (kernel_virt_addr & (PGDIR_SIZE - 1)) < load_sz);
+	relocate_kernel(load_pa);
+#endif
 	/*
 	 * Enforce boot alignment requirements of RV32 and
 	 * RV64 by only allowing PMD or PGD mappings.
-- 
2.30.2

