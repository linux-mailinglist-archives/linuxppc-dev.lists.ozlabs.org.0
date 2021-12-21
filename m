Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0074347B9C8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 07:00:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJ5QW60Qwz3cXD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 17:00:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (unknown [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JJ5Pl0qPtz2ynK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 16:59:22 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id AA51680B64;
 Tue, 21 Dec 2021 00:59:15 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH llvm 1/6] powerpc/toc: PowerPC64 future proof kernel toc,
 revised for lld
Date: Tue, 21 Dec 2021 16:58:59 +1100
Message-Id: <20211221055904.555763-2-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211221055904.555763-1-aik@ozlabs.ru>
References: <20211221055904.555763-1-aik@ozlabs.ru>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, Alan Modra <amodra@au1.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alan Modra <amodra@au1.ibm.com>

This patch future-proofs the kernel against linker changes that might
put the toc pointer at some location other than .got+0x8000, by
replacing __toc_start+0x8000 with .TOC. throughout.  If the kernel's
idea of the toc pointer doesn't agree with the linker, bad things
happen.

prom_init.c code relocating its toc is also changed so that a symbolic
__prom_init_toc_start toc-pointer relative address is calculated
rather than assuming that it is always at toc-pointer - 0x8000.  The
length calculations loading values from the toc are also avoided.
It's a little incestuous to do that with unreloc_toc picking up
adjusted values (which is fine in practice, they both adjust by the
same amount if all goes well).

I've also changed the way .got is aligned in vmlinux.lds and
zImage.lds, mostly so that dumping out section info by objdump or
readelf plainly shows the alignment is 256.  This linker script
feature was added 2005-09-27, available in FSF binutils releases from
2.17 onwards.  Should be safe to use in the kernel, I think.

Finally, put *(.got) before the prom_init.o entry which only needs
*(.toc), so that the GOT header goes in the correct place.  I don't
believe this makes any difference for the kernel as it would for
dynamic objects being loaded by ld.so.  That change is just to stop
lusers who blindly copy kernel scripts being led astray.  Of course,
this change needs the prom_init.c changes.

Some notes on .toc and .got.

.toc is a compiler generated section of addresses.  .got is a linker
generated section of addresses, generally built when the linker sees
R_*_*GOT* relocations.  In the case of powerpc64 ld.bfd, there are
multiple generated .got sections, one per input object file.  So you
can somewhat reasonably write in a linker script an input section
statement like *prom_init.o(.got .toc) to mean "the .got and .toc
section for files matching *prom_init.o".  On other architectures that
doesn't make sense, because the linker generally has just one .got
section.  Even on powerpc64, note well that the GOT entries for
prom_init.o may be merged with GOT entries from other objects.  That
means that if prom_init.o references, say, _end via some GOT
relocation, and some other object also references _end via a GOT
relocation, the GOT entry for _end may be in the range
__prom_init_toc_start to __prom_init_toc_end and if the kernel does
something special to GOT/TOC entries in that range then the value of
_end as seen by objects other than prom_init.o will be affected.  On
the other hand the GOT entry for _end may not be in the range
__prom_init_toc_start to __prom_init_toc_end.  Which way it turns out
is deterministic but a detail of linker operation that should not be
relied on.

A feature of ld.bfd is that input .toc (and .got) sections matching
one linker input section statement may be sorted, to put entries used
by small-model code first, near the toc base.  This is why scripts for
powerpc64 normally use *(.got .toc) rather than *(.got) *(.toc), since
the first form allows more freedom to sort.

Another feature of ld.bfd is that indirect addressing sequences using
the GOT/TOC may be edited by the linker to relative addressing.  In
many cases relative addressing would be emitted by gcc for
-mcmodel=medium if you appropriately decorate variable declarations
with non-default visibility.

The original patch is here:
https://lore.kernel.org/linuxppc-dev/20210310034813.GM6042@bubble.grove.modra.org/

Signed-off-by: Alan Modra <amodra@au1.ibm.com>
[aik: removed non-relocatable which is gone in 24d33ac5b8ffb]
[aik: added <=2.24 check]
[aik: because of llvm-as, kernel_toc_addr() uses "mr" instead of global register variable]
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 arch/powerpc/Makefile               |  5 +++--
 arch/powerpc/include/asm/sections.h | 14 +++++++-------
 arch/powerpc/boot/crt0.S            |  2 +-
 arch/powerpc/boot/zImage.lds.S      |  7 ++-----
 arch/powerpc/kernel/head_64.S       |  2 +-
 arch/powerpc/kernel/vmlinux.lds.S   |  8 +++-----
 6 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index e02568f17334..e9aa4e8b07dd 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -445,10 +445,11 @@ PHONY += checkbin
 # Check toolchain versions:
 # - gcc-4.6 is the minimum kernel-wide version so nothing required.
 checkbin:
-	@if test "x${CONFIG_CPU_LITTLE_ENDIAN}" = "xy" \
-	    && $(LD) --version | head -1 | grep ' 2\.24$$' >/dev/null ; then \
+	@if test "x${CONFIG_LD_IS_LLD}" != "xy" -a \
+		"x$(call ld-ifversion, -le, 22400, y)" = "xy" ; then \
 		echo -n '*** binutils 2.24 miscompiles weak symbols ' ; \
 		echo 'in some circumstances.' ; \
+		echo    '*** binutils 2.23 do not define the TOC symbol ' ; \
 		echo -n '*** Please use a different binutils version.' ; \
 		false ; \
 	fi
diff --git a/arch/powerpc/include/asm/sections.h b/arch/powerpc/include/asm/sections.h
index 79cb7a25a5fb..38f79e42bf3c 100644
--- a/arch/powerpc/include/asm/sections.h
+++ b/arch/powerpc/include/asm/sections.h
@@ -25,16 +25,16 @@ extern char start_virt_trampolines[];
 extern char end_virt_trampolines[];
 #endif
 
+/*
+ * This assumes the kernel is never compiled -mcmodel=small or
+ * the total .toc is always less than 64k.
+ */
 static inline unsigned long kernel_toc_addr(void)
 {
-	/* Defined by the linker, see vmlinux.lds.S */
-	extern unsigned long __toc_start;
+	unsigned long toc_ptr;
 
-	/*
-	 * The TOC register (r2) points 32kB into the TOC, so that 64kB of
-	 * the TOC can be addressed using a single machine instruction.
-	 */
-	return (unsigned long)(&__toc_start) + 0x8000UL;
+	asm volatile("mr %0, 2" : "=r" (toc_ptr));
+	return toc_ptr;
 }
 
 static inline int overlaps_interrupt_vector_text(unsigned long start,
diff --git a/arch/powerpc/boot/crt0.S b/arch/powerpc/boot/crt0.S
index e8f10a599659..feadee18e271 100644
--- a/arch/powerpc/boot/crt0.S
+++ b/arch/powerpc/boot/crt0.S
@@ -28,7 +28,7 @@ p_etext:	.8byte	_etext
 p_bss_start:	.8byte	__bss_start
 p_end:		.8byte	_end
 
-p_toc:		.8byte	__toc_start + 0x8000 - p_base
+p_toc:		.8byte	.TOC. - p_base
 p_dyn:		.8byte	__dynamic_start - p_base
 p_rela:		.8byte	__rela_dyn_start - p_base
 p_prom:		.8byte	0
diff --git a/arch/powerpc/boot/zImage.lds.S b/arch/powerpc/boot/zImage.lds.S
index d6f072865627..d65cd55a6f38 100644
--- a/arch/powerpc/boot/zImage.lds.S
+++ b/arch/powerpc/boot/zImage.lds.S
@@ -36,12 +36,9 @@ SECTIONS
   }
 
 #ifdef CONFIG_PPC64_BOOT_WRAPPER
-  . = ALIGN(256);
-  .got :
+  .got : ALIGN(256)
   {
-    __toc_start = .;
-    *(.got)
-    *(.toc)
+    *(.got .toc)
   }
 #endif
 
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index f17ae2083733..a08c050ff645 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -904,7 +904,7 @@ _GLOBAL(relative_toc)
 	blr
 
 .balign 8
-p_toc:	.8byte	__toc_start + 0x8000 - 0b
+p_toc:	.8byte	.TOC. - 0b
 
 /*
  * This is where the main kernel code starts.
diff --git a/arch/powerpc/kernel/vmlinux.lds.S b/arch/powerpc/kernel/vmlinux.lds.S
index dfc3f39d365f..2bcca818136a 100644
--- a/arch/powerpc/kernel/vmlinux.lds.S
+++ b/arch/powerpc/kernel/vmlinux.lds.S
@@ -337,15 +337,13 @@ SECTIONS
 		*(.branch_lt)
 	}
 
-	. = ALIGN(256);
-	.got : AT(ADDR(.got) - LOAD_OFFSET) {
-		__toc_start = .;
+	.got : AT(ADDR(.got) - LOAD_OFFSET) ALIGN(256) {
+		*(.got)
 #ifndef CONFIG_RELOCATABLE
 		__prom_init_toc_start = .;
-		arch/powerpc/kernel/prom_init.o*(.toc .got)
+		arch/powerpc/kernel/prom_init.o*(.toc)
 		__prom_init_toc_end = .;
 #endif
-		*(.got)
 		*(.toc)
 	}
 #endif
-- 
2.30.2

