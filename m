Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1368D295676
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 04:37:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGs346GtmzDqX9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 13:37:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=perches.com
 (client-ip=216.40.44.206; helo=smtprelay.hostedemail.com;
 envelope-from=joe@perches.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=perches.com
Received: from smtprelay.hostedemail.com (smtprelay0206.hostedemail.com
 [216.40.44.206])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGs1Y0PB1zDqPf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 13:36:15 +1100 (AEDT)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay08.hostedemail.com (Postfix) with ESMTP id CDB1A182CED2A;
 Thu, 22 Oct 2020 02:36:10 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 50, 0, 0, , d41d8cd98f00b204, joe@perches.com, ,
 RULES_HIT:69:196:334:355:379:541:857:960:966:967:968:973:981:982:988:989:1042:1260:1311:1314:1345:1431:1437:1500:1515:1605:1730:1747:1777:1792:1801:1981:2194:2196:2198:2199:2200:2201:2393:2525:2538:2567:2682:2685:2693:2731:2859:2892:2896:2899:2902:2904:2933:2937:2939:2942:2945:2947:2951:2954:3022:3138:3139:3140:3141:3142:3865:3866:3867:3868:3870:3871:3872:3874:3934:3936:3938:3941:3944:3947:3950:3953:3956:3959:4250:4321:4384:4385:4395:4419:4605:5007:6261:7875:7903:7904:7969:7974:8603:8660:8957:8985:9010:9025:9036:9140:10004:10848:11026:11232:11233:11657:11914:12043:12050:12294:12296:12297:12438:12555:12679:12694:12737:12895:12986:13148:13161:13229:13230:13894:13972:14394:14877:21063:21080:21347:21433:21451:21611:21627:21740:21772:21773:21789:21811:21939:21987:21990:30003:30012:30029:30045:30054:30070:30075:30080:30090,
 0, RBL:none, CacheIP:none, Bayesian:0.5, 0.5, 0.5, Netcheck:none,
 DomainCache:0, MSF:not bulk, SPF:, MSBL:0, DNSBL:none, Cu
X-HE-Tag: gun48_400bde92724d
X-Filterd-Recvd-Size: 84789
Received: from joe-laptop.perches.com (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf13.hostedemail.com (Postfix) with ESMTPA;
 Thu, 22 Oct 2020 02:36:08 +0000 (UTC)
From: Joe Perches <joe@perches.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH] treewide: Convert macro and uses of __section(foo) to
 __section("foo")
Date: Wed, 21 Oct 2020 19:36:07 -0700
Message-Id: <fe8abcc88cff676ead8ee48db1e993e63b0611c7.1603327264.git.joe@perches.com>
X-Mailer: git-send-email 2.26.0
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
Cc: clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use a more generic form for __section that requires quotes to avoid
complications with clang and gcc differences.

Remove the quote operator # from compiler_attributes.h __section macro.

Convert all unquoted __section(foo) uses to quoted __section("foo").
Also convert __attribute__((section("foo"))) uses to __section("foo")
even if the __attribute__ has multiple list entry forms.

Conversion done using a script:

Link: https://lore.kernel.org/lkml/75393e5ddc272dc7403de74d645e6c6e0f4e70eb.camel@perches.com/2-convert_section.pl

Signed-off-by: Joe Perches <joe@perches.com>
---

This conversion was previously submitted to -next last month
https://lore.kernel.org/lkml/46f69161e60b802488ba8c8f3f8bbf922aa3b49b.camel@perches.com/

Nick Desaulniers found a defect in the conversion of 2 boot files
for powerpc, but no other defect was found for any other arch.

The script was corrected to avoid converting these 2 files.

There is no difference between the script output when run on today's -next
and Linus' tree through commit f804b3159482, so this should be reasonable to
apply now.

 arch/arc/include/asm/linkage.h        |  8 +++----
 arch/arc/include/asm/mach_desc.h      |  2 +-
 arch/arc/plat-hsdk/platform.c         |  2 +-
 arch/arm/include/asm/cache.h          |  2 +-
 arch/arm/include/asm/cpuidle.h        |  2 +-
 arch/arm/include/asm/idmap.h          |  2 +-
 arch/arm/include/asm/mach/arch.h      |  4 ++--
 arch/arm/include/asm/setup.h          |  2 +-
 arch/arm/include/asm/smp.h            |  2 +-
 arch/arm/include/asm/tcm.h            |  8 +++----
 arch/arm/kernel/cpuidle.c             |  2 +-
 arch/arm/kernel/devtree.c             |  2 +-
 arch/arm64/include/asm/cache.h        |  2 +-
 arch/arm64/kernel/efi.c               |  2 +-
 arch/arm64/kernel/smp_spin_table.c    |  2 +-
 arch/arm64/mm/mmu.c                   |  2 +-
 arch/csky/include/asm/tcm.h           |  8 +++----
 arch/ia64/include/asm/cache.h         |  2 +-
 arch/microblaze/kernel/setup.c        |  2 +-
 arch/mips/include/asm/cache.h         |  2 +-
 arch/mips/include/asm/machine.h       |  2 +-
 arch/mips/kernel/setup.c              |  2 +-
 arch/mips/mm/init.c                   |  2 +-
 arch/parisc/include/asm/cache.h       |  2 +-
 arch/parisc/include/asm/ldcw.h        |  2 +-
 arch/parisc/kernel/ftrace.c           |  2 +-
 arch/parisc/mm/init.c                 |  6 ++---
 arch/powerpc/include/asm/cache.h      |  2 +-
 arch/powerpc/include/asm/machdep.h    |  2 +-
 arch/powerpc/kernel/btext.c           |  2 +-
 arch/powerpc/kernel/prom_init.c       |  2 +-
 arch/powerpc/kvm/book3s_64_vio_hv.c   |  2 +-
 arch/riscv/include/asm/soc.h          |  4 ++--
 arch/riscv/kernel/cpu_ops.c           |  4 ++--
 arch/riscv/kernel/setup.c             |  4 ++--
 arch/s390/boot/startup.c              |  2 +-
 arch/s390/include/asm/cache.h         |  2 +-
 arch/s390/include/asm/sections.h      |  4 ++--
 arch/s390/mm/init.c                   |  2 +-
 arch/sh/boards/of-generic.c           |  2 +-
 arch/sh/include/asm/cache.h           |  2 +-
 arch/sh/include/asm/machvec.h         |  2 +-
 arch/sh/include/asm/smp.h             |  2 +-
 arch/sparc/include/asm/cache.h        |  2 +-
 arch/sparc/kernel/btext.c             |  2 +-
 arch/um/include/shared/init.h         | 22 ++++++++---------
 arch/um/kernel/skas/clone.c           |  2 +-
 arch/um/kernel/um_arch.c              |  2 +-
 arch/x86/boot/compressed/pgtable_64.c |  2 +-
 arch/x86/boot/tty.c                   |  8 +++----
 arch/x86/boot/video.h                 |  2 +-
 arch/x86/include/asm/apic.h           |  4 ++--
 arch/x86/include/asm/cache.h          |  2 +-
 arch/x86/include/asm/intel-mid.h      |  2 +-
 arch/x86/include/asm/irqflags.h       |  2 +-
 arch/x86/include/asm/mem_encrypt.h    |  2 +-
 arch/x86/include/asm/setup.h          |  2 +-
 arch/x86/kernel/cpu/cpu.h             |  2 +-
 arch/x86/kernel/head64.c              |  2 +-
 arch/x86/mm/mem_encrypt.c             |  6 ++---
 arch/x86/mm/mem_encrypt_identity.c    |  2 +-
 arch/x86/platform/pvh/enlighten.c     |  4 ++--
 arch/x86/purgatory/purgatory.c        |  4 ++--
 arch/x86/um/stub_segv.c               |  2 +-
 arch/x86/xen/enlighten.c              |  2 +-
 arch/x86/xen/enlighten_pvh.c          |  2 +-
 arch/xtensa/kernel/setup.c            |  2 +-
 drivers/clk/clk.c                     |  2 +-
 drivers/clocksource/timer-probe.c     |  2 +-
 drivers/irqchip/irqchip.c             |  2 +-
 drivers/of/of_reserved_mem.c          |  2 +-
 drivers/thermal/thermal_core.h        |  2 +-
 fs/xfs/xfs_message.h                  |  2 +-
 include/asm-generic/bug.h             |  6 ++---
 include/asm-generic/error-injection.h |  2 +-
 include/asm-generic/kprobes.h         |  4 ++--
 include/kunit/test.h                  |  2 +-
 include/linux/acpi.h                  |  4 ++--
 include/linux/cache.h                 |  2 +-
 include/linux/compiler.h              |  8 +++----
 include/linux/compiler_attributes.h   |  2 +-
 include/linux/cpu.h                   |  2 +-
 include/linux/dynamic_debug.h         |  2 +-
 include/linux/export.h                |  2 +-
 include/linux/firmware.h              |  2 +-
 include/linux/init.h                  | 34 +++++++++++++--------------
 include/linux/init_task.h             |  4 ++--
 include/linux/interrupt.h             |  4 ++--
 include/linux/kernel.h                |  6 ++---
 include/linux/linkage.h               |  4 ++--
 include/linux/lsm_hooks.h             |  4 ++--
 include/linux/module.h                |  2 +-
 include/linux/moduleparam.h           |  4 ++--
 include/linux/mtd/xip.h               |  2 +-
 include/linux/objtool.h               |  2 +-
 include/linux/of.h                    |  2 +-
 include/linux/percpu-defs.h           |  2 +-
 include/linux/printk.h                |  4 ++--
 include/linux/rcupdate.h              |  2 +-
 include/linux/sched/debug.h           |  2 +-
 include/linux/serial_core.h           |  2 +-
 include/linux/spinlock.h              |  2 +-
 include/linux/syscalls.h              |  6 ++---
 include/linux/trace_events.h          |  2 +-
 include/linux/tracepoint.h            |  8 +++----
 include/trace/bpf_probe.h             |  2 +-
 include/trace/trace_events.h          | 10 ++++----
 kernel/kallsyms.c                     |  4 ++--
 kernel/sched/deadline.c               |  2 +-
 kernel/sched/fair.c                   |  2 +-
 kernel/sched/idle.c                   |  2 +-
 kernel/sched/rt.c                     |  2 +-
 kernel/sched/stop_task.c              |  2 +-
 kernel/trace/trace.h                  |  2 +-
 kernel/trace/trace_export.c           |  2 +-
 scripts/mod/modpost.c                 |  4 ++--
 tools/include/linux/objtool.h         |  2 +-
 117 files changed, 193 insertions(+), 193 deletions(-)

diff --git a/arch/arc/include/asm/linkage.h b/arch/arc/include/asm/linkage.h
index fe19f1d412e7..c9434ff3aa4c 100644
--- a/arch/arc/include/asm/linkage.h
+++ b/arch/arc/include/asm/linkage.h
@@ -64,15 +64,15 @@
 #else	/* !__ASSEMBLY__ */
 
 #ifdef CONFIG_ARC_HAS_ICCM
-#define __arcfp_code __section(.text.arcfp)
+#define __arcfp_code __section(".text.arcfp")
 #else
-#define __arcfp_code __section(.text)
+#define __arcfp_code __section(".text")
 #endif
 
 #ifdef CONFIG_ARC_HAS_DCCM
-#define __arcfp_data __section(.data.arcfp)
+#define __arcfp_data __section(".data.arcfp")
 #else
-#define __arcfp_data __section(.data)
+#define __arcfp_data __section(".data")
 #endif
 
 #endif /* __ASSEMBLY__ */
diff --git a/arch/arc/include/asm/mach_desc.h b/arch/arc/include/asm/mach_desc.h
index 73746ed5b834..c4e197059379 100644
--- a/arch/arc/include/asm/mach_desc.h
+++ b/arch/arc/include/asm/mach_desc.h
@@ -53,7 +53,7 @@ extern const struct machine_desc __arch_info_begin[], __arch_info_end[];
  */
 #define MACHINE_START(_type, _name)			\
 static const struct machine_desc __mach_desc_##_type	\
-__used __section(.arch.info.init) = {			\
+__used __section(".arch.info.init") = {			\
 	.name		= _name,
 
 #define MACHINE_END				\
diff --git a/arch/arc/plat-hsdk/platform.c b/arch/arc/plat-hsdk/platform.c
index 0b961a2a10b8..0b63fc095b99 100644
--- a/arch/arc/plat-hsdk/platform.c
+++ b/arch/arc/plat-hsdk/platform.c
@@ -13,7 +13,7 @@
 #include <asm/io.h>
 #include <asm/mach_desc.h>
 
-int arc_hsdk_axi_dmac_coherent __section(.data) = 0;
+int arc_hsdk_axi_dmac_coherent __section(".data") = 0;
 
 #define ARC_CCM_UNUSED_ADDR	0x60000000
 
diff --git a/arch/arm/include/asm/cache.h b/arch/arm/include/asm/cache.h
index 1d65ed3a2755..e3ea34558ada 100644
--- a/arch/arm/include/asm/cache.h
+++ b/arch/arm/include/asm/cache.h
@@ -24,6 +24,6 @@
 #define ARCH_SLAB_MINALIGN 8
 #endif
 
-#define __read_mostly __attribute__((__section__(".data..read_mostly")))
+#define __read_mostly __section(".data..read_mostly")
 
 #endif
diff --git a/arch/arm/include/asm/cpuidle.h b/arch/arm/include/asm/cpuidle.h
index 6b2ff7243b4b..0d67ed682e07 100644
--- a/arch/arm/include/asm/cpuidle.h
+++ b/arch/arm/include/asm/cpuidle.h
@@ -42,7 +42,7 @@ struct of_cpuidle_method {
 
 #define CPUIDLE_METHOD_OF_DECLARE(name, _method, _ops)			\
 	static const struct of_cpuidle_method __cpuidle_method_of_table_##name \
-	__used __section(__cpuidle_method_of_table)			\
+	__used __section("__cpuidle_method_of_table")			\
 	= { .method = _method, .ops = _ops }
 
 extern int arm_cpuidle_suspend(int index);
diff --git a/arch/arm/include/asm/idmap.h b/arch/arm/include/asm/idmap.h
index aab7e8358e6a..baebb67b3512 100644
--- a/arch/arm/include/asm/idmap.h
+++ b/arch/arm/include/asm/idmap.h
@@ -6,7 +6,7 @@
 #include <linux/pgtable.h>
 
 /* Tag a function as requiring to be executed via an identity mapping. */
-#define __idmap __section(.idmap.text) noinline notrace
+#define __idmap __section(".idmap.text") noinline notrace
 
 extern pgd_t *idmap_pgd;
 
diff --git a/arch/arm/include/asm/mach/arch.h b/arch/arm/include/asm/mach/arch.h
index e7df5a822cab..eec0c0bda766 100644
--- a/arch/arm/include/asm/mach/arch.h
+++ b/arch/arm/include/asm/mach/arch.h
@@ -81,7 +81,7 @@ extern const struct machine_desc __arch_info_begin[], __arch_info_end[];
 #define MACHINE_START(_type,_name)			\
 static const struct machine_desc __mach_desc_##_type	\
  __used							\
- __attribute__((__section__(".arch.info.init"))) = {	\
+ __section(".arch.info.init") = {			\
 	.nr		= MACH_TYPE_##_type,		\
 	.name		= _name,
 
@@ -91,7 +91,7 @@ static const struct machine_desc __mach_desc_##_type	\
 #define DT_MACHINE_START(_name, _namestr)		\
 static const struct machine_desc __mach_desc_##_name	\
  __used							\
- __attribute__((__section__(".arch.info.init"))) = {	\
+ __section(".arch.info.init") = {			\
 	.nr		= ~0,				\
 	.name		= _namestr,
 
diff --git a/arch/arm/include/asm/setup.h b/arch/arm/include/asm/setup.h
index 67d20712cb48..3ae68a1b3de6 100644
--- a/arch/arm/include/asm/setup.h
+++ b/arch/arm/include/asm/setup.h
@@ -14,7 +14,7 @@
 #include <uapi/asm/setup.h>
 
 
-#define __tag __used __attribute__((__section__(".taglist.init")))
+#define __tag __used __section(".taglist.init")
 #define __tagtable(tag, fn) \
 static const struct tagtable __tagtable_##fn __tag = { tag, fn }
 
diff --git a/arch/arm/include/asm/smp.h b/arch/arm/include/asm/smp.h
index 0ca55a607d0a..5d508f5d56c4 100644
--- a/arch/arm/include/asm/smp.h
+++ b/arch/arm/include/asm/smp.h
@@ -112,7 +112,7 @@ struct of_cpu_method {
 
 #define CPU_METHOD_OF_DECLARE(name, _method, _ops)			\
 	static const struct of_cpu_method __cpu_method_of_table_##name	\
-		__used __section(__cpu_method_of_table)			\
+		__used __section("__cpu_method_of_table")		\
 		= { .method = _method, .ops = _ops }
 /*
  * set platform specific SMP operations
diff --git a/arch/arm/include/asm/tcm.h b/arch/arm/include/asm/tcm.h
index b845b10fe29a..d8bd8a4b0ede 100644
--- a/arch/arm/include/asm/tcm.h
+++ b/arch/arm/include/asm/tcm.h
@@ -16,13 +16,13 @@
 #include <linux/compiler.h>
 
 /* Tag variables with this */
-#define __tcmdata __section(.tcm.data)
+#define __tcmdata __section(".tcm.data")
 /* Tag constants with this */
-#define __tcmconst __section(.tcm.rodata)
+#define __tcmconst __section(".tcm.rodata")
 /* Tag functions inside TCM called from outside TCM with this */
-#define __tcmfunc __attribute__((long_call)) __section(.tcm.text) noinline
+#define __tcmfunc __attribute__((long_call)) __section(".tcm.text") noinline
 /* Tag function inside TCM called from inside TCM  with this */
-#define __tcmlocalfunc __section(.tcm.text)
+#define __tcmlocalfunc __section(".tcm.text")
 
 void *tcm_alloc(size_t len);
 void tcm_free(void *addr, size_t len);
diff --git a/arch/arm/kernel/cpuidle.c b/arch/arm/kernel/cpuidle.c
index 093368e0d020..e1684623e1b2 100644
--- a/arch/arm/kernel/cpuidle.c
+++ b/arch/arm/kernel/cpuidle.c
@@ -11,7 +11,7 @@
 extern struct of_cpuidle_method __cpuidle_method_of_table[];
 
 static const struct of_cpuidle_method __cpuidle_method_of_table_sentinel
-	__used __section(__cpuidle_method_of_table_end);
+	__used __section("__cpuidle_method_of_table_end");
 
 static struct cpuidle_ops cpuidle_ops[NR_CPUS] __ro_after_init;
 
diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
index 39c978698406..7f0745a97e20 100644
--- a/arch/arm/kernel/devtree.c
+++ b/arch/arm/kernel/devtree.c
@@ -29,7 +29,7 @@
 extern struct of_cpu_method __cpu_method_of_table[];
 
 static const struct of_cpu_method __cpu_method_of_table_sentinel
-	__used __section(__cpu_method_of_table_end);
+	__used __section("__cpu_method_of_table_end");
 
 
 static int __init set_smp_ops_by_method(struct device_node *node)
diff --git a/arch/arm64/include/asm/cache.h b/arch/arm64/include/asm/cache.h
index a4d1b5f771f6..0ac3e06a2118 100644
--- a/arch/arm64/include/asm/cache.h
+++ b/arch/arm64/include/asm/cache.h
@@ -79,7 +79,7 @@ static inline u32 cache_type_cwg(void)
 	return (read_cpuid_cachetype() >> CTR_CWG_SHIFT) & CTR_CWG_MASK;
 }
 
-#define __read_mostly __section(.data..read_mostly)
+#define __read_mostly __section(".data..read_mostly")
 
 static inline int cache_line_size_of_cpu(void)
 {
diff --git a/arch/arm64/kernel/efi.c b/arch/arm64/kernel/efi.c
index d0cf596db82c..fa02efb28e88 100644
--- a/arch/arm64/kernel/efi.c
+++ b/arch/arm64/kernel/efi.c
@@ -54,7 +54,7 @@ static __init pteval_t create_mapping_protection(efi_memory_desc_t *md)
 }
 
 /* we will fill this structure from the stub, so don't put it in .bss */
-struct screen_info screen_info __section(.data);
+struct screen_info screen_info __section(".data");
 
 int __init efi_create_mapping(struct mm_struct *mm, efi_memory_desc_t *md)
 {
diff --git a/arch/arm64/kernel/smp_spin_table.c b/arch/arm64/kernel/smp_spin_table.c
index 5892e79fa429..056772c26098 100644
--- a/arch/arm64/kernel/smp_spin_table.c
+++ b/arch/arm64/kernel/smp_spin_table.c
@@ -19,7 +19,7 @@
 #include <asm/smp_plat.h>
 
 extern void secondary_holding_pen(void);
-volatile unsigned long __section(.mmuoff.data.read)
+volatile unsigned long __section(".mmuoff.data.read")
 secondary_holding_pen_release = INVALID_HWID;
 
 static phys_addr_t cpu_release_addr[NR_CPUS];
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index beff3ad8c7f8..1c0f3e02f731 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -43,7 +43,7 @@
 u64 idmap_t0sz = TCR_T0SZ(VA_BITS);
 u64 idmap_ptrs_per_pgd = PTRS_PER_PGD;
 
-u64 __section(.mmuoff.data.write) vabits_actual;
+u64 __section(".mmuoff.data.write") vabits_actual;
 EXPORT_SYMBOL(vabits_actual);
 
 u64 kimage_voffset __ro_after_init;
diff --git a/arch/csky/include/asm/tcm.h b/arch/csky/include/asm/tcm.h
index 2b135cefb73f..bd1e662ecdfa 100644
--- a/arch/csky/include/asm/tcm.h
+++ b/arch/csky/include/asm/tcm.h
@@ -10,13 +10,13 @@
 #include <linux/compiler.h>
 
 /* Tag variables with this */
-#define __tcmdata __section(.tcm.data)
+#define __tcmdata __section(".tcm.data")
 /* Tag constants with this */
-#define __tcmconst __section(.tcm.rodata)
+#define __tcmconst __section(".tcm.rodata")
 /* Tag functions inside TCM called from outside TCM with this */
-#define __tcmfunc __section(.tcm.text) noinline
+#define __tcmfunc __section(".tcm.text") noinline
 /* Tag function inside TCM called from inside TCM  with this */
-#define __tcmlocalfunc __section(.tcm.text)
+#define __tcmlocalfunc __section(".tcm.text")
 
 void *tcm_alloc(size_t len);
 void tcm_free(void *addr, size_t len);
diff --git a/arch/ia64/include/asm/cache.h b/arch/ia64/include/asm/cache.h
index 4eb6f742d14f..2f1c70647068 100644
--- a/arch/ia64/include/asm/cache.h
+++ b/arch/ia64/include/asm/cache.h
@@ -25,6 +25,6 @@
 # define SMP_CACHE_BYTES	(1 << 3)
 #endif
 
-#define __read_mostly __attribute__((__section__(".data..read_mostly")))
+#define __read_mostly __section(".data..read_mostly")
 
 #endif /* _ASM_IA64_CACHE_H */
diff --git a/arch/microblaze/kernel/setup.c b/arch/microblaze/kernel/setup.c
index 2310daff1f8a..333b09658ca8 100644
--- a/arch/microblaze/kernel/setup.c
+++ b/arch/microblaze/kernel/setup.c
@@ -46,7 +46,7 @@ DEFINE_PER_CPU(unsigned int, CURRENT_SAVE);	/* Saved current pointer */
  * ASM code. Default position is BSS section which is cleared
  * in machine_early_init().
  */
-char cmd_line[COMMAND_LINE_SIZE] __attribute__ ((section(".data")));
+char cmd_line[COMMAND_LINE_SIZE] __section(".data");
 
 void __init setup_arch(char **cmdline_p)
 {
diff --git a/arch/mips/include/asm/cache.h b/arch/mips/include/asm/cache.h
index 8b14c2706aa5..29187e12b861 100644
--- a/arch/mips/include/asm/cache.h
+++ b/arch/mips/include/asm/cache.h
@@ -14,6 +14,6 @@
 #define L1_CACHE_SHIFT		CONFIG_MIPS_L1_CACHE_SHIFT
 #define L1_CACHE_BYTES		(1 << L1_CACHE_SHIFT)
 
-#define __read_mostly __attribute__((__section__(".data..read_mostly")))
+#define __read_mostly __section(".data..read_mostly")
 
 #endif /* _ASM_CACHE_H */
diff --git a/arch/mips/include/asm/machine.h b/arch/mips/include/asm/machine.h
index 29ca344a8cab..fc64cce270f0 100644
--- a/arch/mips/include/asm/machine.h
+++ b/arch/mips/include/asm/machine.h
@@ -23,7 +23,7 @@ extern long __mips_machines_end;
 
 #define MIPS_MACHINE(name)						\
 	static const struct mips_machine __mips_mach_##name		\
-		__used __section(.mips.machines.init)
+		__used __section(".mips.machines.init")
 
 #define for_each_mips_machine(mach)					\
 	for ((mach) = (struct mips_machine *)&__mips_machines_start;	\
diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index fccdbe2e7c2b..0d4253208bde 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -44,7 +44,7 @@
 #include <asm/prom.h>
 
 #ifdef CONFIG_MIPS_ELF_APPENDED_DTB
-const char __section(.appended_dtb) __appended_dtb[0x100000];
+const char __section(".appended_dtb") __appended_dtb[0x100000];
 #endif /* CONFIG_MIPS_ELF_APPENDED_DTB */
 
 struct cpuinfo_mips cpu_data[NR_CPUS] __read_mostly;
diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
index 6c7bbfe35ba3..07e84a774938 100644
--- a/arch/mips/mm/init.c
+++ b/arch/mips/mm/init.c
@@ -569,7 +569,7 @@ unsigned long pgd_current[NR_CPUS];
  * size, and waste space.  So we place it in its own section and align
  * it in the linker script.
  */
-pgd_t swapper_pg_dir[PTRS_PER_PGD] __section(.bss..swapper_pg_dir);
+pgd_t swapper_pg_dir[PTRS_PER_PGD] __section(".bss..swapper_pg_dir");
 #ifndef __PAGETABLE_PUD_FOLDED
 pud_t invalid_pud_table[PTRS_PER_PUD] __page_aligned_bss;
 #endif
diff --git a/arch/parisc/include/asm/cache.h b/arch/parisc/include/asm/cache.h
index e5de3f897633..d53e9e27dba0 100644
--- a/arch/parisc/include/asm/cache.h
+++ b/arch/parisc/include/asm/cache.h
@@ -22,7 +22,7 @@
 
 #define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
 
-#define __read_mostly __section(.data..read_mostly)
+#define __read_mostly __section(".data..read_mostly")
 
 void parisc_cache_init(void);	/* initializes cache-flushing */
 void disable_sr_hashing_asm(int); /* low level support for above */
diff --git a/arch/parisc/include/asm/ldcw.h b/arch/parisc/include/asm/ldcw.h
index e080143e79a3..6d28b5514699 100644
--- a/arch/parisc/include/asm/ldcw.h
+++ b/arch/parisc/include/asm/ldcw.h
@@ -52,7 +52,7 @@
 })
 
 #ifdef CONFIG_SMP
-# define __lock_aligned __section(.data..lock_aligned)
+# define __lock_aligned __section(".data..lock_aligned")
 #endif
 
 #endif /* __PARISC_LDCW_H */
diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
index 4bab21c71055..63e3ecb9da81 100644
--- a/arch/parisc/kernel/ftrace.c
+++ b/arch/parisc/kernel/ftrace.c
@@ -21,7 +21,7 @@
 #include <asm/ftrace.h>
 #include <asm/patch.h>
 
-#define __hot __attribute__ ((__section__ (".text.hot")))
+#define __hot __section(".text.hot")
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 /*
diff --git a/arch/parisc/mm/init.c b/arch/parisc/mm/init.c
index 4381b65ae1e0..3ec633b11b54 100644
--- a/arch/parisc/mm/init.c
+++ b/arch/parisc/mm/init.c
@@ -42,11 +42,11 @@ extern void parisc_kernel_start(void);	/* Kernel entry point in head.S */
  * guarantee that global objects will be laid out in memory in the same order
  * as the order of declaration, so put these in different sections and use
  * the linker script to order them. */
-pmd_t pmd0[PTRS_PER_PMD] __attribute__ ((__section__ (".data..vm0.pmd"), aligned(PAGE_SIZE)));
+pmd_t pmd0[PTRS_PER_PMD] __section(".data..vm0.pmd") __attribute__ ((aligned(PAGE_SIZE)));
 #endif
 
-pgd_t swapper_pg_dir[PTRS_PER_PGD] __attribute__ ((__section__ (".data..vm0.pgd"), aligned(PAGE_SIZE)));
-pte_t pg0[PT_INITIAL * PTRS_PER_PTE] __attribute__ ((__section__ (".data..vm0.pte"), aligned(PAGE_SIZE)));
+pgd_t swapper_pg_dir[PTRS_PER_PGD] __section(".data..vm0.pgd") __attribute__ ((aligned(PAGE_SIZE)));
+pte_t pg0[PT_INITIAL * PTRS_PER_PTE] __section(".data..vm0.pte") __attribute__ ((aligned(PAGE_SIZE)));
 
 static struct resource data_resource = {
 	.name	= "Kernel data",
diff --git a/arch/powerpc/include/asm/cache.h b/arch/powerpc/include/asm/cache.h
index 2124b7090db9..ae0a68a838e8 100644
--- a/arch/powerpc/include/asm/cache.h
+++ b/arch/powerpc/include/asm/cache.h
@@ -97,7 +97,7 @@ static inline u32 l1_icache_bytes(void)
 
 #endif
 
-#define __read_mostly __section(.data..read_mostly)
+#define __read_mostly __section(".data..read_mostly")
 
 #ifdef CONFIG_PPC_BOOK3S_32
 extern long _get_L2CR(void);
diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 95081078aa8a..475687f24f4a 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -232,7 +232,7 @@ extern void book3e_idle(void);
 extern struct machdep_calls ppc_md;
 extern struct machdep_calls *machine_id;
 
-#define __machine_desc __attribute__ ((__section__ (".machine.desc")))
+#define __machine_desc __section(".machine.desc")
 
 #define define_machine(name)					\
 	extern struct machdep_calls mach_##name;		\
diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
index c22a8e0dbc93..803c2a45b22a 100644
--- a/arch/powerpc/kernel/btext.c
+++ b/arch/powerpc/kernel/btext.c
@@ -26,7 +26,7 @@
 static void scrollscreen(void);
 #endif
 
-#define __force_data __section(.data)
+#define __force_data __section(".data")
 
 static int g_loc_X __force_data;
 static int g_loc_Y __force_data;
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index 5090a5ab54e5..38ae5933d917 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -45,7 +45,7 @@
 #include <linux/linux_logo.h>
 
 /* All of prom_init bss lives here */
-#define __prombss __section(.bss.prominit)
+#define __prombss __section(".bss.prominit")
 
 /*
  * Eventually bump that one up
diff --git a/arch/powerpc/kvm/book3s_64_vio_hv.c b/arch/powerpc/kvm/book3s_64_vio_hv.c
index ac6ac192b8bb..483ed84a1330 100644
--- a/arch/powerpc/kvm/book3s_64_vio_hv.c
+++ b/arch/powerpc/kvm/book3s_64_vio_hv.c
@@ -32,7 +32,7 @@
 #ifdef CONFIG_BUG
 
 #define WARN_ON_ONCE_RM(condition)	({			\
-	static bool __section(.data.unlikely) __warned;		\
+	static bool __section(".data.unlikely") __warned;	\
 	int __ret_warn_once = !!(condition);			\
 								\
 	if (unlikely(__ret_warn_once && !__warned)) {		\
diff --git a/arch/riscv/include/asm/soc.h b/arch/riscv/include/asm/soc.h
index 136a442ef876..6c8363b1f327 100644
--- a/arch/riscv/include/asm/soc.h
+++ b/arch/riscv/include/asm/soc.h
@@ -13,7 +13,7 @@
 
 #define SOC_EARLY_INIT_DECLARE(name, compat, fn)			\
 	static const struct of_device_id __soc_early_init__##name	\
-		__used __section(__soc_early_init_table)		\
+		__used __section("__soc_early_init_table")		\
 		 = { .compatible = compat, .data = fn  }
 
 void soc_early_init(void);
@@ -46,7 +46,7 @@ struct soc_builtin_dtb {
 	}								\
 									\
 	static const struct soc_builtin_dtb __soc_builtin_dtb__##name	\
-		__used __section(__soc_builtin_dtb_table) =		\
+		__used __section("__soc_builtin_dtb_table") =		\
 	{								\
 		.vendor_id = vendor,					\
 		.arch_id   = arch,					\
diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
index 0ec22354018c..1985884fe829 100644
--- a/arch/riscv/kernel/cpu_ops.c
+++ b/arch/riscv/kernel/cpu_ops.c
@@ -15,8 +15,8 @@
 
 const struct cpu_operations *cpu_ops[NR_CPUS] __ro_after_init;
 
-void *__cpu_up_stack_pointer[NR_CPUS] __section(.data);
-void *__cpu_up_task_pointer[NR_CPUS] __section(.data);
+void *__cpu_up_stack_pointer[NR_CPUS] __section(".data");
+void *__cpu_up_task_pointer[NR_CPUS] __section(".data");
 
 extern const struct cpu_operations cpu_ops_sbi;
 extern const struct cpu_operations cpu_ops_spinwait;
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 4c96ac198e14..c424cc6dd833 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -32,7 +32,7 @@
 #include "head.h"
 
 #if defined(CONFIG_DUMMY_CONSOLE) || defined(CONFIG_EFI)
-struct screen_info screen_info __section(.data) = {
+struct screen_info screen_info __section(".data") = {
 	.orig_video_lines	= 30,
 	.orig_video_cols	= 80,
 	.orig_video_mode	= 0,
@@ -47,7 +47,7 @@ struct screen_info screen_info __section(.data) = {
  * This is used before the kernel initializes the BSS so it can't be in the
  * BSS.
  */
-atomic_t hart_lottery __section(.sdata);
+atomic_t hart_lottery __section(".sdata");
 unsigned long boot_cpu_hartid;
 static DEFINE_PER_CPU(struct cpu, cpu_devices);
 
diff --git a/arch/s390/boot/startup.c b/arch/s390/boot/startup.c
index 90842936545b..cc96b04cc0ba 100644
--- a/arch/s390/boot/startup.c
+++ b/arch/s390/boot/startup.c
@@ -46,7 +46,7 @@ struct diag_ops __bootdata_preserved(diag_dma_ops) = {
 	.diag0c = _diag0c_dma,
 	.diag308_reset = _diag308_reset_dma
 };
-static struct diag210 _diag210_tmp_dma __section(.dma.data);
+static struct diag210 _diag210_tmp_dma __section(".dma.data");
 struct diag210 *__bootdata_preserved(__diag210_tmp_dma) = &_diag210_tmp_dma;
 
 void error(char *x)
diff --git a/arch/s390/include/asm/cache.h b/arch/s390/include/asm/cache.h
index d5e22e837416..00128174c025 100644
--- a/arch/s390/include/asm/cache.h
+++ b/arch/s390/include/asm/cache.h
@@ -14,6 +14,6 @@
 #define L1_CACHE_SHIFT     8
 #define NET_SKB_PAD	   32
 
-#define __read_mostly __section(.data..read_mostly)
+#define __read_mostly __section(".data..read_mostly")
 
 #endif
diff --git a/arch/s390/include/asm/sections.h b/arch/s390/include/asm/sections.h
index 42de04ad9c07..a996d3990a02 100644
--- a/arch/s390/include/asm/sections.h
+++ b/arch/s390/include/asm/sections.h
@@ -26,14 +26,14 @@ static inline int arch_is_kernel_initmem_freed(unsigned long addr)
  * final .boot.data section, which should be identical in the decompressor and
  * the decompressed kernel (that is checked during the build).
  */
-#define __bootdata(var) __section(.boot.data.var) var
+#define __bootdata(var) __section(".boot.data.var") var
 
 /*
  * .boot.preserved.data is similar to .boot.data, but it is not part of the
  * .init section and thus will be preserved for later use in the decompressed
  * kernel.
  */
-#define __bootdata_preserved(var) __section(.boot.preserved.data.var) var
+#define __bootdata_preserved(var) __section(".boot.preserved.data.var") var
 
 extern unsigned long __sdma, __edma;
 extern unsigned long __stext_dma, __etext_dma;
diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
index d3ddb4361361..bed87f4efbc2 100644
--- a/arch/s390/mm/init.c
+++ b/arch/s390/mm/init.c
@@ -47,7 +47,7 @@
 #include <asm/dma-mapping.h>
 #include <asm/uv.h>
 
-pgd_t swapper_pg_dir[PTRS_PER_PGD] __section(.bss..swapper_pg_dir);
+pgd_t swapper_pg_dir[PTRS_PER_PGD] __section(".bss..swapper_pg_dir");
 
 unsigned long empty_zero_page, zero_page_mask;
 EXPORT_SYMBOL(empty_zero_page);
diff --git a/arch/sh/boards/of-generic.c b/arch/sh/boards/of-generic.c
index d91065e81a4e..bffbe69b2236 100644
--- a/arch/sh/boards/of-generic.c
+++ b/arch/sh/boards/of-generic.c
@@ -49,7 +49,7 @@ static struct plat_smp_ops dummy_smp_ops = {
 
 extern const struct of_cpu_method __cpu_method_of_table[];
 const struct of_cpu_method __cpu_method_of_table_sentinel
-	__section(__cpu_method_of_table_end);
+	__section("__cpu_method_of_table_end");
 
 static void sh_of_smp_probe(void)
 {
diff --git a/arch/sh/include/asm/cache.h b/arch/sh/include/asm/cache.h
index a293343456af..32dfa6b82ec6 100644
--- a/arch/sh/include/asm/cache.h
+++ b/arch/sh/include/asm/cache.h
@@ -14,7 +14,7 @@
 
 #define L1_CACHE_BYTES		(1 << L1_CACHE_SHIFT)
 
-#define __read_mostly __attribute__((__section__(".data..read_mostly")))
+#define __read_mostly __section(".data..read_mostly")
 
 #ifndef __ASSEMBLY__
 struct cache_info {
diff --git a/arch/sh/include/asm/machvec.h b/arch/sh/include/asm/machvec.h
index f7d05546beca..2b4b085e8f21 100644
--- a/arch/sh/include/asm/machvec.h
+++ b/arch/sh/include/asm/machvec.h
@@ -36,6 +36,6 @@ extern struct sh_machine_vector sh_mv;
 #define get_system_type()	sh_mv.mv_name
 
 #define __initmv \
-	__used __section(.machvec.init)
+	__used __section(".machvec.init")
 
 #endif /* _ASM_SH_MACHVEC_H */
diff --git a/arch/sh/include/asm/smp.h b/arch/sh/include/asm/smp.h
index 100bf241340b..199381f77293 100644
--- a/arch/sh/include/asm/smp.h
+++ b/arch/sh/include/asm/smp.h
@@ -71,7 +71,7 @@ struct of_cpu_method {
 
 #define CPU_METHOD_OF_DECLARE(name, _method, _ops)			\
 	static const struct of_cpu_method __cpu_method_of_table_##name	\
-		__used __section(__cpu_method_of_table)			\
+		__used __section("__cpu_method_of_table")		\
 		= { .method = _method, .ops = _ops }
 
 #else
diff --git a/arch/sparc/include/asm/cache.h b/arch/sparc/include/asm/cache.h
index dcfd58118c11..e62fd0e72606 100644
--- a/arch/sparc/include/asm/cache.h
+++ b/arch/sparc/include/asm/cache.h
@@ -21,6 +21,6 @@
 
 #define SMP_CACHE_BYTES (1 << SMP_CACHE_BYTES_SHIFT)
 
-#define __read_mostly __attribute__((__section__(".data..read_mostly")))
+#define __read_mostly __section(".data..read_mostly")
 
 #endif /* !(_SPARC_CACHE_H) */
diff --git a/arch/sparc/kernel/btext.c b/arch/sparc/kernel/btext.c
index 5869773f3dc4..e2d3f0d2971f 100644
--- a/arch/sparc/kernel/btext.c
+++ b/arch/sparc/kernel/btext.c
@@ -24,7 +24,7 @@ static void draw_byte_32(unsigned char *bits, unsigned int *base, int rb);
 static void draw_byte_16(unsigned char *bits, unsigned int *base, int rb);
 static void draw_byte_8(unsigned char *bits, unsigned int *base, int rb);
 
-#define __force_data __attribute__((__section__(".data")))
+#define __force_data __section(".data")
 
 static int g_loc_X __force_data;
 static int g_loc_Y __force_data;
diff --git a/arch/um/include/shared/init.h b/arch/um/include/shared/init.h
index c66de434a983..1a659e2e8cc3 100644
--- a/arch/um/include/shared/init.h
+++ b/arch/um/include/shared/init.h
@@ -45,15 +45,15 @@ typedef void (*exitcall_t)(void);
 
 /* These are for everybody (although not all archs will actually
    discard it in modules) */
-#define __init		__section(.init.text)
-#define __initdata	__section(.init.data)
-#define __exitdata	__section(.exit.data)
-#define __exit_call	__used __section(.exitcall.exit)
+#define __init		__section(".init.text")
+#define __initdata	__section(".init.data")
+#define __exitdata	__section(".exit.data")
+#define __exit_call	__used __section(".exitcall.exit")
 
 #ifdef MODULE
-#define __exit		__section(.exit.text)
+#define __exit		__section(".exit.text")
 #else
-#define __exit		__used __section(.exit.text)
+#define __exit		__used __section(".exit.text")
 #endif
 
 #endif
@@ -102,10 +102,10 @@ extern struct uml_param __uml_setup_start, __uml_setup_end;
  * Mark functions and data as being only used at initialization
  * or exit time.
  */
-#define __uml_init_setup	__used __section(.uml.setup.init)
-#define __uml_setup_help	__used __section(.uml.help.init)
-#define __uml_postsetup_call	__used __section(.uml.postsetup.init)
-#define __uml_exit_call		__used __section(.uml.exitcall.exit)
+#define __uml_init_setup	__used __section(".uml.setup.init")
+#define __uml_setup_help	__used __section(".uml.help.init")
+#define __uml_postsetup_call	__used __section(".uml.postsetup.init")
+#define __uml_exit_call		__used __section(".uml.exitcall.exit")
 
 #ifdef __UM_HOST__
 
@@ -120,7 +120,7 @@ extern struct uml_param __uml_setup_start, __uml_setup_end;
 
 #define __exitcall(fn) static exitcall_t __exitcall_##fn __exit_call = fn
 
-#define __init_call	__used __section(.initcall.init)
+#define __init_call	__used __section(".initcall.init")
 
 #endif
 
diff --git a/arch/um/kernel/skas/clone.c b/arch/um/kernel/skas/clone.c
index bfb70c456b30..95c355181dcd 100644
--- a/arch/um/kernel/skas/clone.c
+++ b/arch/um/kernel/skas/clone.c
@@ -21,7 +21,7 @@
  * on some systems.
  */
 
-void __attribute__ ((__section__ (".__syscall_stub")))
+void __section(".__syscall_stub")
 stub_clone_handler(void)
 {
 	struct stub_data *data = (struct stub_data *) STUB_DATA;
diff --git a/arch/um/kernel/um_arch.c b/arch/um/kernel/um_arch.c
index 00141e70de56..76b37297b7d4 100644
--- a/arch/um/kernel/um_arch.c
+++ b/arch/um/kernel/um_arch.c
@@ -52,7 +52,7 @@ struct cpuinfo_um boot_cpu_data = {
 };
 
 union thread_union cpu0_irqstack
-	__attribute__((__section__(".data..init_irqstack"))) =
+	__section(".data..init_irqstack") =
 		{ .thread_info = INIT_THREAD_INFO(init_task) };
 
 /* Changed in setup_arch, which is called in early boot */
diff --git a/arch/x86/boot/compressed/pgtable_64.c b/arch/x86/boot/compressed/pgtable_64.c
index 7d0394f4ebf9..dc4c06d3547a 100644
--- a/arch/x86/boot/compressed/pgtable_64.c
+++ b/arch/x86/boot/compressed/pgtable_64.c
@@ -23,7 +23,7 @@ static char trampoline_save[TRAMPOLINE_32BIT_SIZE];
  * Avoid putting the pointer into .bss as it will be cleared between
  * paging_prepare() and extract_kernel().
  */
-unsigned long *trampoline_32bit __section(.data);
+unsigned long *trampoline_32bit __section(".data");
 
 extern struct boot_params *boot_params;
 int cmdline_find_option_bool(const char *option);
diff --git a/arch/x86/boot/tty.c b/arch/x86/boot/tty.c
index 1fedabdb95ad..f7eb976b0a4b 100644
--- a/arch/x86/boot/tty.c
+++ b/arch/x86/boot/tty.c
@@ -25,7 +25,7 @@ int early_serial_base;
  * error during initialization.
  */
 
-static void __attribute__((section(".inittext"))) serial_putchar(int ch)
+static void __section(".inittext") serial_putchar(int ch)
 {
 	unsigned timeout = 0xffff;
 
@@ -35,7 +35,7 @@ static void __attribute__((section(".inittext"))) serial_putchar(int ch)
 	outb(ch, early_serial_base + TXR);
 }
 
-static void __attribute__((section(".inittext"))) bios_putchar(int ch)
+static void __section(".inittext") bios_putchar(int ch)
 {
 	struct biosregs ireg;
 
@@ -47,7 +47,7 @@ static void __attribute__((section(".inittext"))) bios_putchar(int ch)
 	intcall(0x10, &ireg, NULL);
 }
 
-void __attribute__((section(".inittext"))) putchar(int ch)
+void __section(".inittext") putchar(int ch)
 {
 	if (ch == '\n')
 		putchar('\r');	/* \n -> \r\n */
@@ -58,7 +58,7 @@ void __attribute__((section(".inittext"))) putchar(int ch)
 		serial_putchar(ch);
 }
 
-void __attribute__((section(".inittext"))) puts(const char *str)
+void __section(".inittext") puts(const char *str)
 {
 	while (*str)
 		putchar(*str++);
diff --git a/arch/x86/boot/video.h b/arch/x86/boot/video.h
index cbf7fed22441..04bde0bb2003 100644
--- a/arch/x86/boot/video.h
+++ b/arch/x86/boot/video.h
@@ -78,7 +78,7 @@ struct card_info {
 	u16 xmode_n;		/* Size of unprobed mode range */
 };
 
-#define __videocard struct card_info __attribute__((used,section(".videocards")))
+#define __videocard struct card_info __section(".videocards") __attribute__((used))
 extern struct card_info video_cards[], video_cards_end[];
 
 int mode_defined(u16 mode);	/* video.c */
diff --git a/arch/x86/include/asm/apic.h b/arch/x86/include/asm/apic.h
index 1c129abb7f09..4e3099d9ae62 100644
--- a/arch/x86/include/asm/apic.h
+++ b/arch/x86/include/asm/apic.h
@@ -374,12 +374,12 @@ extern struct apic *apic;
 #define apic_driver(sym)					\
 	static const struct apic *__apicdrivers_##sym __used		\
 	__aligned(sizeof(struct apic *))			\
-	__section(.apicdrivers) = { &sym }
+	__section(".apicdrivers") = { &sym }
 
 #define apic_drivers(sym1, sym2)					\
 	static struct apic *__apicdrivers_##sym1##sym2[2] __used	\
 	__aligned(sizeof(struct apic *))				\
-	__section(.apicdrivers) = { &sym1, &sym2 }
+	__section(".apicdrivers") = { &sym1, &sym2 }
 
 extern struct apic *__apicdrivers[], *__apicdrivers_end[];
 
diff --git a/arch/x86/include/asm/cache.h b/arch/x86/include/asm/cache.h
index abe08690a887..69404eae9983 100644
--- a/arch/x86/include/asm/cache.h
+++ b/arch/x86/include/asm/cache.h
@@ -8,7 +8,7 @@
 #define L1_CACHE_SHIFT	(CONFIG_X86_L1_CACHE_SHIFT)
 #define L1_CACHE_BYTES	(1 << L1_CACHE_SHIFT)
 
-#define __read_mostly __attribute__((__section__(".data..read_mostly")))
+#define __read_mostly __section(".data..read_mostly")
 
 #define INTERNODE_CACHE_SHIFT CONFIG_X86_INTERNODE_CACHE_SHIFT
 #define INTERNODE_CACHE_BYTES (1 << INTERNODE_CACHE_SHIFT)
diff --git a/arch/x86/include/asm/intel-mid.h b/arch/x86/include/asm/intel-mid.h
index de58391bdee0..cf0e25f45422 100644
--- a/arch/x86/include/asm/intel-mid.h
+++ b/arch/x86/include/asm/intel-mid.h
@@ -43,7 +43,7 @@ struct devs_id {
 
 #define sfi_device(i)								\
 	static const struct devs_id *const __intel_mid_sfi_##i##_dev __used	\
-	__attribute__((__section__(".x86_intel_mid_dev.init"))) = &i
+	__section(".x86_intel_mid_dev.init") = &i
 
 /**
 * struct mid_sd_board_info - template for SD device creation
diff --git a/arch/x86/include/asm/irqflags.h b/arch/x86/include/asm/irqflags.h
index 02a0cf547d7b..2dfc8d380dab 100644
--- a/arch/x86/include/asm/irqflags.h
+++ b/arch/x86/include/asm/irqflags.h
@@ -9,7 +9,7 @@
 #include <asm/nospec-branch.h>
 
 /* Provide __cpuidle; we can't safely include <linux/cpu.h> */
-#define __cpuidle __attribute__((__section__(".cpuidle.text")))
+#define __cpuidle __section(".cpuidle.text")
 
 /*
  * Interrupt control:
diff --git a/arch/x86/include/asm/mem_encrypt.h b/arch/x86/include/asm/mem_encrypt.h
index c9f5df0a1c10..2f62bbdd9d12 100644
--- a/arch/x86/include/asm/mem_encrypt.h
+++ b/arch/x86/include/asm/mem_encrypt.h
@@ -54,7 +54,7 @@ bool sme_active(void);
 bool sev_active(void);
 bool sev_es_active(void);
 
-#define __bss_decrypted __attribute__((__section__(".bss..decrypted")))
+#define __bss_decrypted __section(".bss..decrypted")
 
 #else	/* !CONFIG_AMD_MEM_ENCRYPT */
 
diff --git a/arch/x86/include/asm/setup.h b/arch/x86/include/asm/setup.h
index 7d7a064af6ff..389d851a02c4 100644
--- a/arch/x86/include/asm/setup.h
+++ b/arch/x86/include/asm/setup.h
@@ -119,7 +119,7 @@ void *extend_brk(size_t size, size_t align);
  * executable.)
  */
 #define RESERVE_BRK(name,sz)						\
-	static void __section(.discard.text) __used notrace		\
+	static void __section(".discard.text") __used notrace		\
 	__brk_reservation_fn_##name##__(void) {				\
 		asm volatile (						\
 			".pushsection .brk_reservation,\"aw\",@nobits;" \
diff --git a/arch/x86/kernel/cpu/cpu.h b/arch/x86/kernel/cpu/cpu.h
index 9d033693519a..67944128876d 100644
--- a/arch/x86/kernel/cpu/cpu.h
+++ b/arch/x86/kernel/cpu/cpu.h
@@ -38,7 +38,7 @@ struct _tlb_table {
 
 #define cpu_dev_register(cpu_devX) \
 	static const struct cpu_dev *const __cpu_dev_##cpu_devX __used \
-	__attribute__((__section__(".x86_cpu_dev.init"))) = \
+	__section(".x86_cpu_dev.init") = \
 	&cpu_devX;
 
 extern const struct cpu_dev *const __x86_cpu_dev_start[],
diff --git a/arch/x86/kernel/head64.c b/arch/x86/kernel/head64.c
index 4199f25c0063..05e117137b45 100644
--- a/arch/x86/kernel/head64.c
+++ b/arch/x86/kernel/head64.c
@@ -84,7 +84,7 @@ static struct desc_ptr startup_gdt_descr = {
 	.address = 0,
 };
 
-#define __head	__section(.head.text)
+#define __head	__section(".head.text")
 
 static void __head *fixup_pointer(void *ptr, unsigned long physaddr)
 {
diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
index ebb7edc8bc0a..efbb3de472df 100644
--- a/arch/x86/mm/mem_encrypt.c
+++ b/arch/x86/mm/mem_encrypt.c
@@ -37,13 +37,13 @@
  * reside in the .data section so as not to be zeroed out when the .bss
  * section is later cleared.
  */
-u64 sme_me_mask __section(.data) = 0;
-u64 sev_status __section(.data) = 0;
+u64 sme_me_mask __section(".data") = 0;
+u64 sev_status __section(".data") = 0;
 EXPORT_SYMBOL(sme_me_mask);
 DEFINE_STATIC_KEY_FALSE(sev_enable_key);
 EXPORT_SYMBOL_GPL(sev_enable_key);
 
-bool sev_enabled __section(.data);
+bool sev_enabled __section(".data");
 
 /* Buffer used for early in-place encryption by BSP, no locking needed */
 static char sme_early_buffer[PAGE_SIZE] __initdata __aligned(PAGE_SIZE);
diff --git a/arch/x86/mm/mem_encrypt_identity.c b/arch/x86/mm/mem_encrypt_identity.c
index 68d75379e06a..733b983f3a89 100644
--- a/arch/x86/mm/mem_encrypt_identity.c
+++ b/arch/x86/mm/mem_encrypt_identity.c
@@ -81,7 +81,7 @@ struct sme_populate_pgd_data {
  * section is 2MB aligned to allow for simple pagetable setup using only
  * PMD entries (see vmlinux.lds.S).
  */
-static char sme_workarea[2 * PMD_PAGE_SIZE] __section(.init.scratch);
+static char sme_workarea[2 * PMD_PAGE_SIZE] __section(".init.scratch");
 
 static char sme_cmdline_arg[] __initdata = "mem_encrypt";
 static char sme_cmdline_on[]  __initdata = "on";
diff --git a/arch/x86/platform/pvh/enlighten.c b/arch/x86/platform/pvh/enlighten.c
index c0a502f7e3a7..9ac7457f52a3 100644
--- a/arch/x86/platform/pvh/enlighten.c
+++ b/arch/x86/platform/pvh/enlighten.c
@@ -19,8 +19,8 @@
  * pvh_bootparams and pvh_start_info need to live in the data segment since
  * they are used after startup_{32|64}, which clear .bss, are invoked.
  */
-struct boot_params pvh_bootparams __attribute__((section(".data")));
-struct hvm_start_info pvh_start_info __attribute__((section(".data")));
+struct boot_params pvh_bootparams __section(".data");
+struct hvm_start_info pvh_start_info __section(".data");
 
 unsigned int pvh_start_info_sz = sizeof(pvh_start_info);
 
diff --git a/arch/x86/purgatory/purgatory.c b/arch/x86/purgatory/purgatory.c
index 2961234d0795..7b37a412f829 100644
--- a/arch/x86/purgatory/purgatory.c
+++ b/arch/x86/purgatory/purgatory.c
@@ -14,9 +14,9 @@
 
 #include "../boot/string.h"
 
-u8 purgatory_sha256_digest[SHA256_DIGEST_SIZE] __section(.kexec-purgatory);
+u8 purgatory_sha256_digest[SHA256_DIGEST_SIZE] __section(".kexec-purgatory");
 
-struct kexec_sha_region purgatory_sha_regions[KEXEC_SEGMENT_MAX] __section(.kexec-purgatory);
+struct kexec_sha_region purgatory_sha_regions[KEXEC_SEGMENT_MAX] __section(".kexec-purgatory");
 
 static int verify_sha256_digest(void)
 {
diff --git a/arch/x86/um/stub_segv.c b/arch/x86/um/stub_segv.c
index 27361cbb7ca9..fdcd58af707a 100644
--- a/arch/x86/um/stub_segv.c
+++ b/arch/x86/um/stub_segv.c
@@ -8,7 +8,7 @@
 #include <sysdep/mcontext.h>
 #include <sys/ucontext.h>
 
-void __attribute__ ((__section__ (".__syscall_stub")))
+void __section(".__syscall_stub")
 stub_segv_handler(int sig, siginfo_t *info, void *p)
 {
 	ucontext_t *uc = p;
diff --git a/arch/x86/xen/enlighten.c b/arch/x86/xen/enlighten.c
index 205b1176084f..aa9f50fccc5d 100644
--- a/arch/x86/xen/enlighten.c
+++ b/arch/x86/xen/enlighten.c
@@ -71,7 +71,7 @@ EXPORT_SYMBOL_GPL(xen_have_vector_callback);
  * NB: needs to live in .data because it's used by xen_prepare_pvh which runs
  * before clearing the bss.
  */
-uint32_t xen_start_flags __attribute__((section(".data"))) = 0;
+uint32_t xen_start_flags __section(".data") = 0;
 EXPORT_SYMBOL(xen_start_flags);
 
 /*
diff --git a/arch/x86/xen/enlighten_pvh.c b/arch/x86/xen/enlighten_pvh.c
index 80a79db72fcf..0d5e34b9e6f9 100644
--- a/arch/x86/xen/enlighten_pvh.c
+++ b/arch/x86/xen/enlighten_pvh.c
@@ -21,7 +21,7 @@
  * The variable xen_pvh needs to live in the data segment since it is used
  * after startup_{32|64} is invoked, which will clear the .bss segment.
  */
-bool xen_pvh __attribute__((section(".data"))) = 0;
+bool xen_pvh __section(".data") = 0;
 
 void __init xen_pvh_init(struct boot_params *boot_params)
 {
diff --git a/arch/xtensa/kernel/setup.c b/arch/xtensa/kernel/setup.c
index be2c78f71695..ed184106e4cf 100644
--- a/arch/xtensa/kernel/setup.c
+++ b/arch/xtensa/kernel/setup.c
@@ -93,7 +93,7 @@ typedef struct tagtable {
 } tagtable_t;
 
 #define __tagtable(tag, fn) static tagtable_t __tagtable_##fn 		\
-	__attribute__((used, section(".taglist"))) = { tag, fn }
+	__section(".taglist") __attribute__((used)) = { tag, fn }
 
 /* parse current tag */
 
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0a9261a099bd..f83dac54ed85 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4363,7 +4363,7 @@ struct of_clk_provider {
 
 extern struct of_device_id __clk_of_table;
 static const struct of_device_id __clk_of_table_sentinel
-	__used __section(__clk_of_table_end);
+	__used __section("__clk_of_table_end");
 
 static LIST_HEAD(of_clk_providers);
 static DEFINE_MUTEX(of_clk_mutex);
diff --git a/drivers/clocksource/timer-probe.c b/drivers/clocksource/timer-probe.c
index ee9574da53c0..b7860bc0db4b 100644
--- a/drivers/clocksource/timer-probe.c
+++ b/drivers/clocksource/timer-probe.c
@@ -11,7 +11,7 @@
 extern struct of_device_id __timer_of_table[];
 
 static const struct of_device_id __timer_of_table_sentinel
-	__used __section(__timer_of_table_end);
+	__used __section("__timer_of_table_end");
 
 void __init timer_probe(void)
 {
diff --git a/drivers/irqchip/irqchip.c b/drivers/irqchip/irqchip.c
index d2341153e181..3570f0a588c4 100644
--- a/drivers/irqchip/irqchip.c
+++ b/drivers/irqchip/irqchip.c
@@ -22,7 +22,7 @@
  * special section.
  */
 static const struct of_device_id
-irqchip_of_match_end __used __section(__irqchip_of_table_end);
+irqchip_of_match_end __used __section("__irqchip_of_table_end");
 
 extern struct of_device_id __irqchip_of_table[];
 
diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 46b9371c8a33..bcd154485972 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -162,7 +162,7 @@ static int __init __reserved_mem_alloc_size(unsigned long node,
 }
 
 static const struct of_device_id __rmem_of_table_sentinel
-	__used __section(__reservedmem_of_table_end);
+	__used __section("__reservedmem_of_table_end");
 
 /**
  * __reserved_mem_init_node() - call region specific reserved memory init code
diff --git a/drivers/thermal/thermal_core.h b/drivers/thermal/thermal_core.h
index 764c2de31771..681209db42a8 100644
--- a/drivers/thermal/thermal_core.h
+++ b/drivers/thermal/thermal_core.h
@@ -34,7 +34,7 @@ extern struct thermal_governor *__governor_thermal_table_end[];
 
 #define THERMAL_TABLE_ENTRY(table, name)			\
 	static typeof(name) *__thermal_table_entry_##name	\
-	__used __section(__##table##_thermal_table) = &name
+	__used __section("__" #table "_thermal_table") = &name
 
 #define THERMAL_GOVERNOR_DECLARE(name)	THERMAL_TABLE_ENTRY(governor, name)
 
diff --git a/fs/xfs/xfs_message.h b/fs/xfs/xfs_message.h
index 4d9bd6bb63ca..3c392b1512ac 100644
--- a/fs/xfs/xfs_message.h
+++ b/fs/xfs/xfs_message.h
@@ -42,7 +42,7 @@ do {									\
 
 #define xfs_printk_once(func, dev, fmt, ...)			\
 ({								\
-	static bool __section(.data.once) __print_once;		\
+	static bool __section(".data.once") __print_once;	\
 	bool __ret_print_once = !__print_once; 			\
 								\
 	if (!__print_once) {					\
diff --git a/include/asm-generic/bug.h b/include/asm-generic/bug.h
index 18b0f4eee8cb..76a10e0dca9f 100644
--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -141,7 +141,7 @@ void __warn(const char *file, int line, void *caller, unsigned taint,
 
 #ifndef WARN_ON_ONCE
 #define WARN_ON_ONCE(condition)	({				\
-	static bool __section(.data.once) __warned;		\
+	static bool __section(".data.once") __warned;		\
 	int __ret_warn_once = !!(condition);			\
 								\
 	if (unlikely(__ret_warn_once && !__warned)) {		\
@@ -153,7 +153,7 @@ void __warn(const char *file, int line, void *caller, unsigned taint,
 #endif
 
 #define WARN_ONCE(condition, format...)	({			\
-	static bool __section(.data.once) __warned;		\
+	static bool __section(".data.once") __warned;		\
 	int __ret_warn_once = !!(condition);			\
 								\
 	if (unlikely(__ret_warn_once && !__warned)) {		\
@@ -164,7 +164,7 @@ void __warn(const char *file, int line, void *caller, unsigned taint,
 })
 
 #define WARN_TAINT_ONCE(condition, taint, format...)	({	\
-	static bool __section(.data.once) __warned;		\
+	static bool __section(".data.once") __warned;		\
 	int __ret_warn_once = !!(condition);			\
 								\
 	if (unlikely(__ret_warn_once && !__warned)) {		\
diff --git a/include/asm-generic/error-injection.h b/include/asm-generic/error-injection.h
index 80ca61058dd2..7ddd9dc10ce9 100644
--- a/include/asm-generic/error-injection.h
+++ b/include/asm-generic/error-injection.h
@@ -25,7 +25,7 @@ struct pt_regs;
  */
 #define ALLOW_ERROR_INJECTION(fname, _etype)				\
 static struct error_injection_entry __used				\
-	__attribute__((__section__("_error_injection_whitelist")))	\
+	__section("_error_injection_whitelist")				\
 	_eil_addr_##fname = {						\
 		.addr = (unsigned long)fname,				\
 		.etype = EI_ETYPE_##_etype,				\
diff --git a/include/asm-generic/kprobes.h b/include/asm-generic/kprobes.h
index 4a982089c95c..060eab094e5a 100644
--- a/include/asm-generic/kprobes.h
+++ b/include/asm-generic/kprobes.h
@@ -10,11 +10,11 @@
  */
 # define __NOKPROBE_SYMBOL(fname)				\
 static unsigned long __used					\
-	__attribute__((__section__("_kprobe_blacklist")))	\
+	__section("_kprobe_blacklist")				\
 	_kbl_addr_##fname = (unsigned long)fname;
 # define NOKPROBE_SYMBOL(fname)	__NOKPROBE_SYMBOL(fname)
 /* Use this to forbid a kprobes attach on very low level functions */
-# define __kprobes	__attribute__((__section__(".kprobes.text")))
+# define __kprobes	__section(".kprobes.text")
 # define nokprobe_inline	__always_inline
 #else
 # define NOKPROBE_SYMBOL(fname)
diff --git a/include/kunit/test.h b/include/kunit/test.h
index a423fffefea0..9197da792336 100644
--- a/include/kunit/test.h
+++ b/include/kunit/test.h
@@ -288,7 +288,7 @@ static inline int kunit_run_all_tests(void)
 	static struct kunit_suite *unique_array[] = { __VA_ARGS__, NULL };     \
 	kunit_test_suites_for_module(unique_array);			       \
 	static struct kunit_suite **unique_suites			       \
-	__used __section(.kunit_test_suites) = unique_array
+	__used __section(".kunit_test_suites") = unique_array
 
 /**
  * kunit_test_suites() - used to register one or more &struct kunit_suite
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 143c6ffce2db..39263c6b52e1 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1153,7 +1153,7 @@ struct acpi_probe_entry {
 #define ACPI_DECLARE_PROBE_ENTRY(table, name, table_id, subtable,	\
 				 valid, data, fn)			\
 	static const struct acpi_probe_entry __acpi_probe_##name	\
-		__used __section(__##table##_acpi_probe_table) = {	\
+		__used __section("__" #table "_acpi_probe_table") = {	\
 			.id = table_id,					\
 			.type = subtable,				\
 			.subtable_valid = valid,			\
@@ -1164,7 +1164,7 @@ struct acpi_probe_entry {
 #define ACPI_DECLARE_SUBTABLE_PROBE_ENTRY(table, name, table_id,	\
 					  subtable, valid, data, fn)	\
 	static const struct acpi_probe_entry __acpi_probe_##name	\
-		__used __section(__##table##_acpi_probe_table) = {	\
+		__used __section("__" #table "_acpi_probe_table") = {	\
 			.id = table_id,					\
 			.type = subtable,				\
 			.subtable_valid = valid,			\
diff --git a/include/linux/cache.h b/include/linux/cache.h
index 1aa8009f6d06..d742c57eaee5 100644
--- a/include/linux/cache.h
+++ b/include/linux/cache.h
@@ -34,7 +34,7 @@
  * but may get written to during init, so can't live in .rodata (via "const").
  */
 #ifndef __ro_after_init
-#define __ro_after_init __attribute__((__section__(".data..ro_after_init")))
+#define __ro_after_init __section(".data..ro_after_init")
 #endif
 
 #ifndef ____cacheline_aligned
diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index ac45f6d40d39..e512f5505dad 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -24,7 +24,7 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
 			long ______r;					\
 			static struct ftrace_likely_data		\
 				__aligned(4)				\
-				__section(_ftrace_annotated_branch)	\
+				__section("_ftrace_annotated_branch")	\
 				______f = {				\
 				.data.func = __func__,			\
 				.data.file = __FILE__,			\
@@ -60,7 +60,7 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
 #define __trace_if_value(cond) ({			\
 	static struct ftrace_branch_data		\
 		__aligned(4)				\
-		__section(_ftrace_branch)		\
+		__section("_ftrace_branch")		\
 		__if_trace = {				\
 			.func = __func__,		\
 			.file = __FILE__,		\
@@ -118,7 +118,7 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
 	".popsection\n\t"
 
 /* Annotate a C jump table to allow objtool to follow the code flow */
-#define __annotate_jump_table __section(.rodata..c_jump_table)
+#define __annotate_jump_table __section(".rodata..c_jump_table")
 
 #else
 #define annotate_reachable()
@@ -206,7 +206,7 @@ void ftrace_likely_update(struct ftrace_likely_data *f, int val,
  * visible to the compiler.
  */
 #define __ADDRESSABLE(sym) \
-	static void * __section(.discard.addressable) __used \
+	static void * __section(".discard.addressable") __used \
 		__UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
 
 /**
diff --git a/include/linux/compiler_attributes.h b/include/linux/compiler_attributes.h
index ea7b756b1c8f..b2a3f4f641a7 100644
--- a/include/linux/compiler_attributes.h
+++ b/include/linux/compiler_attributes.h
@@ -254,7 +254,7 @@
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Variable-Attributes.html#index-section-variable-attribute
  * clang: https://clang.llvm.org/docs/AttributeReference.html#section-declspec-allocate
  */
-#define __section(S)                    __attribute__((__section__(#S)))
+#define __section(section)              __attribute__((__section__(section)))
 
 /*
  *   gcc: https://gcc.gnu.org/onlinedocs/gcc/Common-Function-Attributes.html#index-unused-function-attribute
diff --git a/include/linux/cpu.h b/include/linux/cpu.h
index 8aa84c052fdf..d6428aaf67e7 100644
--- a/include/linux/cpu.h
+++ b/include/linux/cpu.h
@@ -173,7 +173,7 @@ void cpu_startup_entry(enum cpuhp_state state);
 void cpu_idle_poll_ctrl(bool enable);
 
 /* Attach to any functions which should be considered cpuidle. */
-#define __cpuidle	__attribute__((__section__(".cpuidle.text")))
+#define __cpuidle	__section(".cpuidle.text")
 
 bool cpu_in_idle(unsigned long pc);
 
diff --git a/include/linux/dynamic_debug.h b/include/linux/dynamic_debug.h
index 8aa0c7c2608c..a57ee75342cf 100644
--- a/include/linux/dynamic_debug.h
+++ b/include/linux/dynamic_debug.h
@@ -84,7 +84,7 @@ void __dynamic_ibdev_dbg(struct _ddebug *descriptor,
 
 #define DEFINE_DYNAMIC_DEBUG_METADATA(name, fmt)		\
 	static struct _ddebug  __aligned(8)			\
-	__section(__dyndbg) name = {				\
+	__section("__dyndbg") name = {				\
 		.modname = KBUILD_MODNAME,			\
 		.function = __func__,				\
 		.filename = __FILE__,				\
diff --git a/include/linux/export.h b/include/linux/export.h
index 8933ff6ad23a..fceb5e855717 100644
--- a/include/linux/export.h
+++ b/include/linux/export.h
@@ -130,7 +130,7 @@ struct kernel_symbol {
  * discarded in the final link stage.
  */
 #define __ksym_marker(sym)	\
-	static int __ksym_marker_##sym[0] __section(.discard.ksym) __used
+	static int __ksym_marker_##sym[0] __section(".discard.ksym") __used
 
 #define __EXPORT_SYMBOL(sym, sec, ns)					\
 	__ksym_marker(sym);						\
diff --git a/include/linux/firmware.h b/include/linux/firmware.h
index c15acadc6cf4..84e346ae766e 100644
--- a/include/linux/firmware.h
+++ b/include/linux/firmware.h
@@ -36,7 +36,7 @@ struct builtin_fw {
 
 #define DECLARE_BUILTIN_FIRMWARE_SIZE(name, blob, size)			     \
 	static const struct builtin_fw __fw_concat(__builtin_fw,__COUNTER__) \
-	__used __section(.builtin_fw) = { name, blob, size }
+	__used __section(".builtin_fw") = { name, blob, size }
 
 #if defined(CONFIG_FW_LOADER) || (defined(CONFIG_FW_LOADER_MODULE) && defined(MODULE))
 int request_firmware(const struct firmware **fw, const char *name,
diff --git a/include/linux/init.h b/include/linux/init.h
index 212fc9e2f691..7b53cb3092ee 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -47,11 +47,11 @@
 
 /* These are for everybody (although not all archs will actually
    discard it in modules) */
-#define __init		__section(.init.text) __cold  __latent_entropy __noinitretpoline
-#define __initdata	__section(.init.data)
-#define __initconst	__section(.init.rodata)
-#define __exitdata	__section(.exit.data)
-#define __exit_call	__used __section(.exitcall.exit)
+#define __init		__section(".init.text") __cold  __latent_entropy __noinitretpoline
+#define __initdata	__section(".init.data")
+#define __initconst	__section(".init.rodata")
+#define __exitdata	__section(".exit.data")
+#define __exit_call	__used __section(".exitcall.exit")
 
 /*
  * modpost check for section mismatches during the kernel build.
@@ -70,9 +70,9 @@
  *
  * The markers follow same syntax rules as __init / __initdata.
  */
-#define __ref            __section(.ref.text) noinline
-#define __refdata        __section(.ref.data)
-#define __refconst       __section(.ref.rodata)
+#define __ref            __section(".ref.text") noinline
+#define __refdata        __section(".ref.data")
+#define __refconst       __section(".ref.rodata")
 
 #ifdef MODULE
 #define __exitused
@@ -80,16 +80,16 @@
 #define __exitused  __used
 #endif
 
-#define __exit          __section(.exit.text) __exitused __cold notrace
+#define __exit          __section(".exit.text") __exitused __cold notrace
 
 /* Used for MEMORY_HOTPLUG */
-#define __meminit        __section(.meminit.text) __cold notrace \
+#define __meminit        __section(".meminit.text") __cold notrace \
 						  __latent_entropy
-#define __meminitdata    __section(.meminit.data)
-#define __meminitconst   __section(.meminit.rodata)
-#define __memexit        __section(.memexit.text) __exitused __cold notrace
-#define __memexitdata    __section(.memexit.data)
-#define __memexitconst   __section(.memexit.rodata)
+#define __meminitdata    __section(".meminit.data")
+#define __meminitconst   __section(".meminit.rodata")
+#define __memexit        __section(".memexit.text") __exitused __cold notrace
+#define __memexitdata    __section(".memexit.data")
+#define __memexitconst   __section(".memexit.rodata")
 
 /* For assembly routines */
 #define __HEAD		.section	".head.text","ax"
@@ -254,7 +254,7 @@ struct obs_kernel_param {
 	static const char __setup_str_##unique_id[] __initconst		\
 		__aligned(1) = str; 					\
 	static struct obs_kernel_param __setup_##unique_id		\
-		__used __section(.init.setup)				\
+		__used __section(".init.setup")				\
 		__attribute__((aligned((sizeof(long)))))		\
 		= { __setup_str_##unique_id, fn, early }
 
@@ -298,7 +298,7 @@ void __init parse_early_options(char *cmdline);
 #endif
 
 /* Data marked not to be saved by software suspend */
-#define __nosavedata __section(.data..nosave)
+#define __nosavedata __section(".data..nosave")
 
 #ifdef MODULE
 #define __exit_p(x) x
diff --git a/include/linux/init_task.h b/include/linux/init_task.h
index 2c620d7ac432..b2412b4d4c20 100644
--- a/include/linux/init_task.h
+++ b/include/linux/init_task.h
@@ -40,12 +40,12 @@ extern struct cred init_cred;
 
 /* Attach to the init_task data structure for proper alignment */
 #ifdef CONFIG_ARCH_TASK_STRUCT_ON_STACK
-#define __init_task_data __attribute__((__section__(".data..init_task")))
+#define __init_task_data __section(".data..init_task")
 #else
 #define __init_task_data /**/
 #endif
 
 /* Attach to the thread_info data structure for proper alignment */
-#define __init_thread_info __attribute__((__section__(".data..init_thread_info")))
+#define __init_thread_info __section(".data..init_thread_info")
 
 #endif
diff --git a/include/linux/interrupt.h b/include/linux/interrupt.h
index f9aee3538461..ee8299eb1f52 100644
--- a/include/linux/interrupt.h
+++ b/include/linux/interrupt.h
@@ -792,9 +792,9 @@ extern int arch_early_irq_init(void);
  * We want to know which function is an entrypoint of a hardirq or a softirq.
  */
 #ifndef __irq_entry
-# define __irq_entry	 __attribute__((__section__(".irqentry.text")))
+# define __irq_entry	 __section(".irqentry.text")
 #endif
 
-#define __softirq_entry  __attribute__((__section__(".softirqentry.text")))
+#define __softirq_entry  __section(".softirqentry.text")
 
 #endif
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index c629215fdad9..2f05e9128201 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -729,7 +729,7 @@ do {							\
 #define do_trace_printk(fmt, args...)					\
 do {									\
 	static const char *trace_printk_fmt __used			\
-		__attribute__((section("__trace_printk_fmt"))) =	\
+		__section("__trace_printk_fmt") =			\
 		__builtin_constant_p(fmt) ? fmt : NULL;			\
 									\
 	__trace_printk_check_format(fmt, ##args);			\
@@ -773,7 +773,7 @@ int __trace_printk(unsigned long ip, const char *fmt, ...);
 
 #define trace_puts(str) ({						\
 	static const char *trace_printk_fmt __used			\
-		__attribute__((section("__trace_printk_fmt"))) =	\
+		__section("__trace_printk_fmt") =			\
 		__builtin_constant_p(str) ? str : NULL;			\
 									\
 	if (__builtin_constant_p(str))					\
@@ -795,7 +795,7 @@ extern void trace_dump_stack(int skip);
 do {									\
 	if (__builtin_constant_p(fmt)) {				\
 		static const char *trace_printk_fmt __used		\
-		  __attribute__((section("__trace_printk_fmt"))) =	\
+		  __section("__trace_printk_fmt") =			\
 			__builtin_constant_p(fmt) ? fmt : NULL;		\
 									\
 		__ftrace_vbprintk(_THIS_IP_, trace_printk_fmt, vargs);	\
diff --git a/include/linux/linkage.h b/include/linux/linkage.h
index d796ec20d114..5bcfbd972e97 100644
--- a/include/linux/linkage.h
+++ b/include/linux/linkage.h
@@ -36,8 +36,8 @@
 		  __stringify(name))
 #endif
 
-#define __page_aligned_data	__section(.data..page_aligned) __aligned(PAGE_SIZE)
-#define __page_aligned_bss	__section(.bss..page_aligned) __aligned(PAGE_SIZE)
+#define __page_aligned_data	__section(".data..page_aligned") __aligned(PAGE_SIZE)
+#define __page_aligned_bss	__section(".bss..page_aligned") __aligned(PAGE_SIZE)
 
 /*
  * For assembly routines.
diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index 8814e3d5952d..c503f7ab8afb 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -1611,12 +1611,12 @@ extern struct lsm_info __start_early_lsm_info[], __end_early_lsm_info[];
 
 #define DEFINE_LSM(lsm)							\
 	static struct lsm_info __lsm_##lsm				\
-		__used __section(.lsm_info.init)			\
+		__used __section(".lsm_info.init")			\
 		__aligned(sizeof(unsigned long))
 
 #define DEFINE_EARLY_LSM(lsm)						\
 	static struct lsm_info __early_lsm_##lsm			\
-		__used __section(.early_lsm_info.init)			\
+		__used __section(".early_lsm_info.init")		\
 		__aligned(sizeof(unsigned long))
 
 #ifdef CONFIG_SECURITY_SELINUX_DISABLE
diff --git a/include/linux/module.h b/include/linux/module.h
index a29187f7c360..7ccdf87f376f 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -278,7 +278,7 @@ extern typeof(name) __mod_##type##__##name##_device_table		\
 		.version	= _version,				\
 	};								\
 	static const struct module_version_attribute			\
-	__used __attribute__ ((__section__ ("__modver")))		\
+	__used __section("__modver")					\
 	* __moduleparam_const __modver_attr = &___modver_attr
 #endif
 
diff --git a/include/linux/moduleparam.h b/include/linux/moduleparam.h
index 47879fc7f75e..6388eb9734a5 100644
--- a/include/linux/moduleparam.h
+++ b/include/linux/moduleparam.h
@@ -22,7 +22,7 @@
 
 #define __MODULE_INFO(tag, name, info)					  \
 static const char __UNIQUE_ID(name)[]					  \
-  __used __attribute__((section(".modinfo"), unused, aligned(1)))	  \
+  __used __section(".modinfo") __attribute__((unused, aligned(1)))	  \
   = __MODULE_INFO_PREFIX __stringify(tag) "=" info
 
 #define __MODULE_PARM_TYPE(name, _type)					  \
@@ -289,7 +289,7 @@ struct kparam_array
 	static const char __param_str_##name[] = prefix #name;		\
 	static struct kernel_param __moduleparam_const __param_##name	\
 	__used								\
-    __attribute__ ((unused,__section__ ("__param"),aligned(sizeof(void *)))) \
+    __section("__param") __attribute__ ((unused, aligned(sizeof(void *)))) \
 	= { __param_str_##name, THIS_MODULE, ops,			\
 	    VERIFY_OCTAL_PERMISSIONS(perm), level, flags, { arg } }
 
diff --git a/include/linux/mtd/xip.h b/include/linux/mtd/xip.h
index a4e352b1dfe6..3cac9360588f 100644
--- a/include/linux/mtd/xip.h
+++ b/include/linux/mtd/xip.h
@@ -28,7 +28,7 @@
  * those functions so they get relocated to ram.
  */
 #ifdef CONFIG_XIP_KERNEL
-#define __xipram noinline __attribute__ ((__section__ (".xiptext")))
+#define __xipram noinline __section(".xiptext")
 #endif
 
 /*
diff --git a/include/linux/objtool.h b/include/linux/objtool.h
index ab82c793c897..577f51436cf9 100644
--- a/include/linux/objtool.h
+++ b/include/linux/objtool.h
@@ -60,7 +60,7 @@ struct unwind_hint {
  * For more information, see tools/objtool/Documentation/stack-validation.txt.
  */
 #define STACK_FRAME_NON_STANDARD(func) \
-	static void __used __section(.discard.func_stack_frame_non_standard) \
+	static void __used __section(".discard.func_stack_frame_non_standard") \
 		*__func_stack_frame_non_standard_##func = func
 
 #else /* __ASSEMBLY__ */
diff --git a/include/linux/of.h b/include/linux/of.h
index 481ec0467285..5d51891cbf1a 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1299,7 +1299,7 @@ static inline int of_get_available_child_count(const struct device_node *np)
 #if defined(CONFIG_OF) && !defined(MODULE)
 #define _OF_DECLARE(table, name, compat, fn, fn_type)			\
 	static const struct of_device_id __of_table_##name		\
-		__used __section(__##table##_of_table)			\
+		__used __section("__" #table "_of_table")		\
 		 = { .compatible = compat,				\
 		     .data = (fn == (fn_type)NULL) ? fn : fn  }
 #else
diff --git a/include/linux/percpu-defs.h b/include/linux/percpu-defs.h
index 176bfbd52d97..dff7040f629a 100644
--- a/include/linux/percpu-defs.h
+++ b/include/linux/percpu-defs.h
@@ -51,7 +51,7 @@
 	PER_CPU_ATTRIBUTES
 
 #define __PCPU_DUMMY_ATTRS						\
-	__attribute__((section(".discard"), unused))
+	__section(".discard") __attribute__((unused))
 
 /*
  * s390 and alpha modules require percpu variables to be defined as
diff --git a/include/linux/printk.h b/include/linux/printk.h
index 78479633ccfc..fe7eb2351610 100644
--- a/include/linux/printk.h
+++ b/include/linux/printk.h
@@ -437,7 +437,7 @@ extern int kptr_restrict;
 #ifdef CONFIG_PRINTK
 #define printk_once(fmt, ...)					\
 ({								\
-	static bool __section(.data.once) __print_once;		\
+	static bool __section(".data.once") __print_once;	\
 	bool __ret_print_once = !__print_once;			\
 								\
 	if (!__print_once) {					\
@@ -448,7 +448,7 @@ extern int kptr_restrict;
 })
 #define printk_deferred_once(fmt, ...)				\
 ({								\
-	static bool __section(.data.once) __print_once;		\
+	static bool __section(".data.once") __print_once;	\
 	bool __ret_print_once = !__print_once;			\
 								\
 	if (!__print_once) {					\
diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index 7c1ceff02852..6cdd0152c253 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -299,7 +299,7 @@ static inline int rcu_read_lock_any_held(void)
  */
 #define RCU_LOCKDEP_WARN(c, s)						\
 	do {								\
-		static bool __section(.data.unlikely) __warned;		\
+		static bool __section(".data.unlikely") __warned;	\
 		if (debug_lockdep_rcu_enabled() && !__warned && (c)) {	\
 			__warned = true;				\
 			lockdep_rcu_suspicious(__FILE__, __LINE__, s);	\
diff --git a/include/linux/sched/debug.h b/include/linux/sched/debug.h
index 00c45a0e6abe..ae51f4529fc9 100644
--- a/include/linux/sched/debug.h
+++ b/include/linux/sched/debug.h
@@ -43,7 +43,7 @@ extern void proc_sched_set_task(struct task_struct *p);
 #endif
 
 /* Attach to any functions which should be ignored in wchan output. */
-#define __sched		__attribute__((__section__(".sched.text")))
+#define __sched		__section(".sched.text")
 
 /* Linker adds these: start and end of __sched functions */
 extern char __sched_text_start[], __sched_text_end[];
diff --git a/include/linux/serial_core.h b/include/linux/serial_core.h
index 8a99279a579b..ff63c2963359 100644
--- a/include/linux/serial_core.h
+++ b/include/linux/serial_core.h
@@ -373,7 +373,7 @@ extern const struct earlycon_id *__earlycon_table_end[];
 		    .compatible = compat,				\
 		    .setup = fn  };					\
 	static const struct earlycon_id EARLYCON_USED_OR_UNUSED		\
-		__section(__earlycon_table)				\
+		__section("__earlycon_table")				\
 		* const __PASTE(__p, unique_id) = &unique_id
 
 #define OF_EARLYCON_DECLARE(_name, compat, fn)				\
diff --git a/include/linux/spinlock.h b/include/linux/spinlock.h
index f2f12d746dbd..79897841a2cc 100644
--- a/include/linux/spinlock.h
+++ b/include/linux/spinlock.h
@@ -76,7 +76,7 @@
 #define LOCK_SECTION_END                        \
         ".previous\n\t"
 
-#define __lockfunc __attribute__((section(".spinlock.text")))
+#define __lockfunc __section(".spinlock.text")
 
 /*
  * Pull the arch_spinlock_t and arch_rwlock_t definitions:
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 2eda7678fe1d..37bea07c12f2 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -144,7 +144,7 @@ extern struct trace_event_functions exit_syscall_print_funcs;
 		.flags                  = TRACE_EVENT_FL_CAP_ANY,	\
 	};								\
 	static struct trace_event_call __used				\
-	  __attribute__((section("_ftrace_events")))			\
+	  __section("_ftrace_events")					\
 	 *__event_enter_##sname = &event_enter_##sname;
 
 #define SYSCALL_TRACE_EXIT_EVENT(sname)					\
@@ -160,7 +160,7 @@ extern struct trace_event_functions exit_syscall_print_funcs;
 		.flags                  = TRACE_EVENT_FL_CAP_ANY,	\
 	};								\
 	static struct trace_event_call __used				\
-	  __attribute__((section("_ftrace_events")))			\
+	  __section("_ftrace_events")					\
 	*__event_exit_##sname = &event_exit_##sname;
 
 #define SYSCALL_METADATA(sname, nb, ...)			\
@@ -184,7 +184,7 @@ extern struct trace_event_functions exit_syscall_print_funcs;
 		.enter_fields	= LIST_HEAD_INIT(__syscall_meta_##sname.enter_fields), \
 	};							\
 	static struct syscall_metadata __used			\
-	  __attribute__((section("__syscalls_metadata")))	\
+	  __section("__syscalls_metadata")			\
 	 *__p_syscall_meta_##sname = &__syscall_meta_##sname;
 
 static inline int is_syscall_trace_event(struct trace_event_call *tp_event)
diff --git a/include/linux/trace_events.h b/include/linux/trace_events.h
index 5c6943354049..d321fe5ad1a1 100644
--- a/include/linux/trace_events.h
+++ b/include/linux/trace_events.h
@@ -709,7 +709,7 @@ do {									\
 	tracing_record_cmdline(current);				\
 	if (__builtin_constant_p(fmt)) {				\
 		static const char *trace_printk_fmt			\
-		  __attribute__((section("__trace_printk_fmt"))) =	\
+		  __section("__trace_printk_fmt") =			\
 			__builtin_constant_p(fmt) ? fmt : NULL;		\
 									\
 		__trace_bprintk(ip, trace_printk_fmt, ##args);		\
diff --git a/include/linux/tracepoint.h b/include/linux/tracepoint.h
index 81fa0b2f271e..0f21617f1a66 100644
--- a/include/linux/tracepoint.h
+++ b/include/linux/tracepoint.h
@@ -119,7 +119,7 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 
 #define __TRACEPOINT_ENTRY(name)					 \
 	static tracepoint_ptr_t __tracepoint_ptr_##name __used		 \
-	__section(__tracepoints_ptrs) = &__tracepoint_##name
+	__section("__tracepoints_ptrs") = &__tracepoint_##name
 #endif
 
 #endif /* _LINUX_TRACEPOINT_H */
@@ -286,11 +286,11 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
  */
 #define DEFINE_TRACE_FN(_name, _reg, _unreg, proto, args)		\
 	static const char __tpstrtab_##_name[]				\
-	__section(__tracepoints_strings) = #_name;			\
+	__section("__tracepoints_strings") = #_name;			\
 	extern struct static_call_key STATIC_CALL_KEY(tp_func_##_name);	\
 	int __traceiter_##_name(void *__data, proto);			\
 	struct tracepoint __tracepoint_##_name	__used			\
-	__section(__tracepoints) = {					\
+	__section("__tracepoints") = {					\
 		.name = __tpstrtab_##_name,				\
 		.key = STATIC_KEY_INIT_FALSE,				\
 		.static_call_key = &STATIC_CALL_KEY(tp_func_##_name),	\
@@ -396,7 +396,7 @@ static inline struct tracepoint *tracepoint_ptr_deref(tracepoint_ptr_t *p)
 		static const char *___tp_str __tracepoint_string = str; \
 		___tp_str;						\
 	})
-#define __tracepoint_string	__used __section(__tracepoint_str)
+#define __tracepoint_string	__used __section("__tracepoint_str")
 #else
 /*
  * tracepoint_string() is used to save the string address for userspace
diff --git a/include/trace/bpf_probe.h b/include/trace/bpf_probe.h
index 1ce3be63add1..cd74bffed5c6 100644
--- a/include/trace/bpf_probe.h
+++ b/include/trace/bpf_probe.h
@@ -79,7 +79,7 @@ static union {								\
 	struct bpf_raw_event_map event;					\
 	btf_trace_##call handler;					\
 } __bpf_trace_tp_map_##call __used					\
-__attribute__((section("__bpf_raw_tp_map"))) = {			\
+__section("__bpf_raw_tp_map") = {					\
 	.event = {							\
 		.tp		= &__tracepoint_##call,			\
 		.bpf_func	= __bpf_trace_##template,		\
diff --git a/include/trace/trace_events.h b/include/trace/trace_events.h
index 1bc3e7bba9a4..7785961d82ba 100644
--- a/include/trace/trace_events.h
+++ b/include/trace/trace_events.h
@@ -45,7 +45,7 @@ TRACE_MAKE_SYSTEM_STR();
 		.eval_value = a				\
 	};						\
 	static struct trace_eval_map __used		\
-	__attribute__((section("_ftrace_eval_map")))	\
+	__section("_ftrace_eval_map")			\
 	*TRACE_SYSTEM##_##a = &__##TRACE_SYSTEM##_##a
 
 #undef TRACE_DEFINE_SIZEOF
@@ -58,7 +58,7 @@ TRACE_MAKE_SYSTEM_STR();
 		.eval_value = sizeof(a)			\
 	};						\
 	static struct trace_eval_map __used		\
-	__attribute__((section("_ftrace_eval_map")))	\
+	__section("_ftrace_eval_map")			\
 	*TRACE_SYSTEM##_##a = &__##TRACE_SYSTEM##_##a
 
 /*
@@ -607,7 +607,7 @@ static inline notrace int trace_event_get_offsets_##call(		\
  * // its only safe to use pointers when doing linker tricks to
  * // create an array.
  * static struct trace_event_call __used
- * __attribute__((section("_ftrace_events"))) *__event_<call> = &event_<call>;
+ * __section("_ftrace_events") *__event_<call> = &event_<call>;
  *
  */
 
@@ -755,7 +755,7 @@ static struct trace_event_call __used event_##call = {			\
 	.flags			= TRACE_EVENT_FL_TRACEPOINT,		\
 };									\
 static struct trace_event_call __used					\
-__attribute__((section("_ftrace_events"))) *__event_##call = &event_##call
+__section("_ftrace_events") *__event_##call = &event_##call
 
 #undef DEFINE_EVENT_PRINT
 #define DEFINE_EVENT_PRINT(template, call, proto, args, print)		\
@@ -772,6 +772,6 @@ static struct trace_event_call __used event_##call = {			\
 	.flags			= TRACE_EVENT_FL_TRACEPOINT,		\
 };									\
 static struct trace_event_call __used					\
-__attribute__((section("_ftrace_events"))) *__event_##call = &event_##call
+__section("_ftrace_events") *__event_##call = &event_##call
 
 #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 4fb15fa96734..fe9de067771c 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -40,10 +40,10 @@ extern const u8 kallsyms_names[] __weak;
  * has one (eg: FRV).
  */
 extern const unsigned int kallsyms_num_syms
-__attribute__((weak, section(".rodata")));
+__section(".rodata") __attribute__((weak));
 
 extern const unsigned long kallsyms_relative_base
-__attribute__((weak, section(".rodata")));
+__section(".rodata") __attribute__((weak));
 
 extern const char kallsyms_token_table[] __weak;
 extern const u16 kallsyms_token_index[] __weak;
diff --git a/kernel/sched/deadline.c b/kernel/sched/deadline.c
index 6d93f4518734..f232305dcefe 100644
--- a/kernel/sched/deadline.c
+++ b/kernel/sched/deadline.c
@@ -2504,7 +2504,7 @@ static void prio_changed_dl(struct rq *rq, struct task_struct *p,
 }
 
 const struct sched_class dl_sched_class
-	__attribute__((section("__dl_sched_class"))) = {
+	__section("__dl_sched_class") = {
 	.enqueue_task		= enqueue_task_dl,
 	.dequeue_task		= dequeue_task_dl,
 	.yield_task		= yield_task_dl,
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index aa4c6227cd6d..0d2e8d064997 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -11159,7 +11159,7 @@ static unsigned int get_rr_interval_fair(struct rq *rq, struct task_struct *task
  * All the scheduling class methods:
  */
 const struct sched_class fair_sched_class
-	__attribute__((section("__fair_sched_class"))) = {
+	__section("__fair_sched_class") = {
 	.enqueue_task		= enqueue_task_fair,
 	.dequeue_task		= dequeue_task_fair,
 	.yield_task		= yield_task_fair,
diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index f324dc36fc43..24d0ee26377d 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -458,7 +458,7 @@ static void update_curr_idle(struct rq *rq)
  * Simple, special scheduling class for the per-CPU idle tasks:
  */
 const struct sched_class idle_sched_class
-	__attribute__((section("__idle_sched_class"))) = {
+	__section("__idle_sched_class") = {
 	/* no enqueue/yield_task for idle tasks */
 
 	/* dequeue is not valid, we print a debug message there: */
diff --git a/kernel/sched/rt.c b/kernel/sched/rt.c
index f215eea6a966..49ec096a8aa1 100644
--- a/kernel/sched/rt.c
+++ b/kernel/sched/rt.c
@@ -2430,7 +2430,7 @@ static unsigned int get_rr_interval_rt(struct rq *rq, struct task_struct *task)
 }
 
 const struct sched_class rt_sched_class
-	__attribute__((section("__rt_sched_class"))) = {
+	__section("__rt_sched_class") = {
 	.enqueue_task		= enqueue_task_rt,
 	.dequeue_task		= dequeue_task_rt,
 	.yield_task		= yield_task_rt,
diff --git a/kernel/sched/stop_task.c b/kernel/sched/stop_task.c
index 394bc8126a1e..ceb5b6b12561 100644
--- a/kernel/sched/stop_task.c
+++ b/kernel/sched/stop_task.c
@@ -110,7 +110,7 @@ static void update_curr_stop(struct rq *rq)
  * Simple, special scheduling class for the per-CPU stop tasks:
  */
 const struct sched_class stop_sched_class
-	__attribute__((section("__stop_sched_class"))) = {
+	__section("__stop_sched_class") = {
 
 	.enqueue_task		= enqueue_task_stop,
 	.dequeue_task		= dequeue_task_stop,
diff --git a/kernel/trace/trace.h b/kernel/trace/trace.h
index 34e0c4d5a6e7..f3f5e77123ad 100644
--- a/kernel/trace/trace.h
+++ b/kernel/trace/trace.h
@@ -99,7 +99,7 @@ enum trace_type {
 
 /* Use this for memory failure errors */
 #define MEM_FAIL(condition, fmt, ...) ({			\
-	static bool __section(.data.once) __warned;		\
+	static bool __section(".data.once") __warned;		\
 	int __ret_warn_once = !!(condition);			\
 								\
 	if (unlikely(__ret_warn_once && !__warned)) {		\
diff --git a/kernel/trace/trace_export.c b/kernel/trace/trace_export.c
index 70d3d0a09053..90f81d33fa3f 100644
--- a/kernel/trace/trace_export.c
+++ b/kernel/trace/trace_export.c
@@ -176,7 +176,7 @@ struct trace_event_call __used event_##call = {				\
 	.flags			= TRACE_EVENT_FL_IGNORE_ENABLE,		\
 };									\
 static struct trace_event_call __used						\
-__attribute__((section("_ftrace_events"))) *__event_##call = &event_##call;
+__section("_ftrace_events") *__event_##call = &event_##call;
 
 #undef FTRACE_ENTRY
 #define FTRACE_ENTRY(call, struct_name, etype, tstruct, print)		\
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 69341b36f271..f882ce0d9327 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2254,7 +2254,7 @@ static void add_header(struct buffer *b, struct module *mod)
 	buf_printf(b, "MODULE_INFO(name, KBUILD_MODNAME);\n");
 	buf_printf(b, "\n");
 	buf_printf(b, "__visible struct module __this_module\n");
-	buf_printf(b, "__section(.gnu.linkonce.this_module) = {\n");
+	buf_printf(b, "__section(\".gnu.linkonce.this_module\") = {\n");
 	buf_printf(b, "\t.name = KBUILD_MODNAME,\n");
 	if (mod->has_init)
 		buf_printf(b, "\t.init = init_module,\n");
@@ -2308,7 +2308,7 @@ static int add_versions(struct buffer *b, struct module *mod)
 
 	buf_printf(b, "\n");
 	buf_printf(b, "static const struct modversion_info ____versions[]\n");
-	buf_printf(b, "__used __section(__versions) = {\n");
+	buf_printf(b, "__used __section(\"__versions\") = {\n");
 
 	for (s = mod->unres; s; s = s->next) {
 		if (!s->module)
diff --git a/tools/include/linux/objtool.h b/tools/include/linux/objtool.h
index ab82c793c897..577f51436cf9 100644
--- a/tools/include/linux/objtool.h
+++ b/tools/include/linux/objtool.h
@@ -60,7 +60,7 @@ struct unwind_hint {
  * For more information, see tools/objtool/Documentation/stack-validation.txt.
  */
 #define STACK_FRAME_NON_STANDARD(func) \
-	static void __used __section(.discard.func_stack_frame_non_standard) \
+	static void __used __section(".discard.func_stack_frame_non_standard") \
 		*__func_stack_frame_non_standard_##func = func
 
 #else /* __ASSEMBLY__ */
-- 
2.26.0

