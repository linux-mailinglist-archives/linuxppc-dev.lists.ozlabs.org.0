Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1418B477FBF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 23:02:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFR1S707hz3cR3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 09:02:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=awjX0otZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=awjX0otZ; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFQzV12QCz3036
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 09:00:52 +1100 (AEDT)
Received: by mail-qk1-x729.google.com with SMTP id t83so333507qke.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 14:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8oBu45VkxFqSaEXkRWs4JEDG1Kg1maCvWA4vn50C/No=;
 b=awjX0otZUlN29zAlJi21GrF5P2IhwBHUggdDb7JimWMkcowpsR86txYTtEe5apIh0f
 ZF8hVsJxV+1yfv41eU4EIQ1tRxuneUwczyE6L5c3P3TXtVflVxqJc8OndCEgUuEaNcoL
 GnMeaPVOipp7q9QHHxnBNjrMgF+Ml5frEiOs+ljgPvCGytttw3aQxA6fnEdX3GFYuPVp
 hQvabf+76s883PW4uvBhcmmzVPPlG+gr3hSOdR5nGWd+DQMmRuywQL3UfpuHdhpLU4dZ
 aZL1ZIQwuoWDQ8WQWYs0Ii01S7oJOIv/FRuFH7epE2uGhkfb2bw6Q1RIaQM62Kzdnqmk
 lYyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8oBu45VkxFqSaEXkRWs4JEDG1Kg1maCvWA4vn50C/No=;
 b=PvJkf8SqmRgB0bz50Plpt9SfJHXe1Qt0b3+vhv8GRtGvvgmX7sojLbE8x8ZanN/8CC
 l5Lshda9tLXKrisukY+3ZJjZjllXkDfGiXfnNR+bZRZWp7oqbgYKhIJLL3OyilvR60M7
 7pJD6M1l3p7j+REFH1Bnu3Tf09vwjAhQFP5JR54/Ppurhu/hLDD7RkJslfHXn+xf0Ofn
 VtWO7DkOm5wIhJQnBsrD+tPPr518PGK5O7z/BKjQ4yuTQVtjfADi6hO7T48PJAlevZlU
 HQuWukEZBWBkEx0JrQ8yX0Rs/SQ+U3QIQTbOSnqQ4zcWXjZbwfGiZ66o0WYF8LgA+TAR
 asfg==
X-Gm-Message-State: AOAM531vDL0iSK7QWYT+I4UxoB8KMQC68yWUXrjbjOn1TubEgn92QEa6
 q2dtzdJNbw/GkSZO3zQWVz1VBLpxIKA=
X-Google-Smtp-Source: ABdhPJw3b8q6yc75XXD2JwbA7jBfbEToWdBsOPKin7jI1ynfc/vIeJXOSFE8JqOtose06X2YjQgclw==
X-Received: by 2002:a37:c57:: with SMTP id 84mr35033qkm.699.1639692047527;
 Thu, 16 Dec 2021 14:00:47 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:dce6:135:603d:e519])
 by smtp.gmail.com with ESMTPSA id y21sm5478483qtw.10.2021.12.16.14.00.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:00:47 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 01/20] powerpc/kernel: Add __init attribute to eligible
 functions
Date: Thu, 16 Dec 2021 17:00:16 -0500
Message-Id: <20211216220035.605465-2-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216220035.605465-1-nick.child@ibm.com>
References: <20211216220035.605465-1-nick.child@ibm.com>
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some functions defined in `arch/powerpc/kernel` (and one in `arch/powerpc/
kexec`) are deserving of an `__init` macro attribute. These functions are
only called by other initialization functions and therefore should inherit
the attribute.
Also, change function declarations in header files to include `__init`.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/include/asm/btext.h           | 10 +++++-----
 arch/powerpc/include/asm/eeh.h             |  2 +-
 arch/powerpc/include/asm/fadump-internal.h |  6 +++---
 arch/powerpc/include/asm/kexec.h           |  2 +-
 arch/powerpc/include/asm/kvm_guest.h       |  2 +-
 arch/powerpc/include/asm/pci.h             |  2 +-
 arch/powerpc/include/asm/setup.h           |  4 ++--
 arch/powerpc/include/asm/udbg.h            |  8 ++++----
 arch/powerpc/kernel/btext.c                | 12 ++++++------
 arch/powerpc/kernel/dt_cpu_ftrs.c          |  2 +-
 arch/powerpc/kernel/eeh_cache.c            |  2 +-
 arch/powerpc/kernel/fadump.c               | 18 +++++++++---------
 arch/powerpc/kernel/nvram_64.c             |  6 +++---
 arch/powerpc/kernel/pci-common.c           |  2 +-
 arch/powerpc/kernel/pci_32.c               |  4 ++--
 arch/powerpc/kernel/prom.c                 |  4 ++--
 arch/powerpc/kernel/prom_init.c            | 12 ++++++------
 arch/powerpc/kernel/rtasd.c                |  6 +++---
 arch/powerpc/kernel/security.c             |  4 ++--
 arch/powerpc/kernel/setup_64.c             |  2 +-
 arch/powerpc/kernel/smp.c                  |  5 +++--
 arch/powerpc/kernel/sysfs.c                | 10 +++++-----
 arch/powerpc/kernel/udbg_16550.c           | 10 +++++-----
 arch/powerpc/kexec/core.c                  |  2 +-
 24 files changed, 69 insertions(+), 68 deletions(-)

diff --git a/arch/powerpc/include/asm/btext.h b/arch/powerpc/include/asm/btext.h
index 461b0f193864..860f8868f11e 100644
--- a/arch/powerpc/include/asm/btext.h
+++ b/arch/powerpc/include/asm/btext.h
@@ -23,12 +23,12 @@ extern void btext_unmap(void);
 
 extern void btext_drawchar(char c);
 extern void btext_drawstring(const char *str);
-extern void btext_drawhex(unsigned long v);
-extern void btext_drawtext(const char *c, unsigned int len);
+void __init btext_drawhex(unsigned long v);
+void __init btext_drawtext(const char *c, unsigned int len);
 
-extern void btext_clearscreen(void);
-extern void btext_flushscreen(void);
-extern void btext_flushline(void);
+void __init btext_clearscreen(void);
+void __init btext_flushscreen(void);
+void __init btext_flushline(void);
 
 #endif /* __KERNEL__ */
 #endif /* __PPC_BTEXT_H */
diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
index b1a5bba2e0b9..bd513fd49be9 100644
--- a/arch/powerpc/include/asm/eeh.h
+++ b/arch/powerpc/include/asm/eeh.h
@@ -460,7 +460,7 @@ static inline void eeh_readsl(const volatile void __iomem *addr, void * buf,
 }
 
 
-void eeh_cache_debugfs_init(void);
+void __init eeh_cache_debugfs_init(void);
 
 #endif /* CONFIG_PPC64 */
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
index 8d61c8f3fec4..52189928ec08 100644
--- a/arch/powerpc/include/asm/fadump-internal.h
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -137,10 +137,10 @@ struct fadump_ops {
 };
 
 /* Helper functions */
-s32 fadump_setup_cpu_notes_buf(u32 num_cpus);
+s32 __init fadump_setup_cpu_notes_buf(u32 num_cpus);
 void fadump_free_cpu_notes_buf(void);
-u32 *fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs);
-void fadump_update_elfcore_header(char *bufp);
+u32 *__init fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs);
+void __init fadump_update_elfcore_header(char *bufp);
 bool is_fadump_boot_mem_contiguous(void);
 bool is_fadump_reserved_mem_contiguous(void);
 
diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index c6f250eca3fb..8ebdd23d987c 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -84,7 +84,7 @@ extern int crash_shutdown_register(crash_shutdown_t handler);
 extern int crash_shutdown_unregister(crash_shutdown_t handler);
 
 extern void crash_kexec_secondary(struct pt_regs *regs);
-extern int overlaps_crashkernel(unsigned long start, unsigned long size);
+int __init overlaps_crashkernel(unsigned long start, unsigned long size);
 extern void reserve_crashkernel(void);
 extern void machine_kexec_mask_interrupts(void);
 
diff --git a/arch/powerpc/include/asm/kvm_guest.h b/arch/powerpc/include/asm/kvm_guest.h
index c63105d2c9e7..68e499abdb24 100644
--- a/arch/powerpc/include/asm/kvm_guest.h
+++ b/arch/powerpc/include/asm/kvm_guest.h
@@ -16,7 +16,7 @@ static inline bool is_kvm_guest(void)
 	return static_branch_unlikely(&kvm_guest);
 }
 
-int check_kvm_guest(void);
+int __init check_kvm_guest(void);
 #else
 static inline bool is_kvm_guest(void) { return false; }
 static inline int check_kvm_guest(void) { return 0; }
diff --git a/arch/powerpc/include/asm/pci.h b/arch/powerpc/include/asm/pci.h
index d1f53260725c..915d6ee4b40a 100644
--- a/arch/powerpc/include/asm/pci.h
+++ b/arch/powerpc/include/asm/pci.h
@@ -48,7 +48,7 @@ static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
 }
 
 #ifdef CONFIG_PCI
-extern void set_pci_dma_ops(const struct dma_map_ops *dma_ops);
+void __init set_pci_dma_ops(const struct dma_map_ops *dma_ops);
 #else	/* CONFIG_PCI */
 #define set_pci_dma_ops(d)
 #endif
diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
index 6c1a7d217d1a..cff58db6130f 100644
--- a/arch/powerpc/include/asm/setup.h
+++ b/arch/powerpc/include/asm/setup.h
@@ -55,7 +55,7 @@ void setup_entry_flush(bool enable);
 void setup_uaccess_flush(bool enable);
 void do_rfi_flush_fixups(enum l1d_flush_type types);
 #ifdef CONFIG_PPC_BARRIER_NOSPEC
-void setup_barrier_nospec(void);
+void __init setup_barrier_nospec(void);
 #else
 static inline void setup_barrier_nospec(void) { }
 #endif
@@ -71,7 +71,7 @@ static inline void do_barrier_nospec_fixups_range(bool enable, void *start, void
 #endif
 
 #ifdef CONFIG_PPC_FSL_BOOK3E
-void setup_spectre_v2(void);
+void __init setup_spectre_v2(void);
 #else
 static inline void setup_spectre_v2(void) {}
 #endif
diff --git a/arch/powerpc/include/asm/udbg.h b/arch/powerpc/include/asm/udbg.h
index 0ea9e70ed78b..5aec53f2dae0 100644
--- a/arch/powerpc/include/asm/udbg.h
+++ b/arch/powerpc/include/asm/udbg.h
@@ -23,11 +23,11 @@ extern void udbg_printf(const char *fmt, ...)
 	__attribute__ ((format (printf, 1, 2)));
 extern void udbg_progress(char *s, unsigned short hex);
 
-extern void udbg_uart_init_mmio(void __iomem *addr, unsigned int stride);
-extern void udbg_uart_init_pio(unsigned long port, unsigned int stride);
+void __init udbg_uart_init_mmio(void __iomem *addr, unsigned int stride);
+void __init udbg_uart_init_pio(unsigned long port, unsigned int stride);
 
-extern void udbg_uart_setup(unsigned int speed, unsigned int clock);
-extern unsigned int udbg_probe_uart_speed(unsigned int clock);
+void __init udbg_uart_setup(unsigned int speed, unsigned int clock);
+unsigned int __init udbg_probe_uart_speed(unsigned int clock);
 
 struct device_node;
 extern void udbg_scc_init(int force_scc);
diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
index 1cffb5e7c38d..9d9d56b574cc 100644
--- a/arch/powerpc/kernel/btext.c
+++ b/arch/powerpc/kernel/btext.c
@@ -161,7 +161,7 @@ void btext_map(void)
 	boot_text_mapped = 1;
 }
 
-static int btext_initialize(struct device_node *np)
+static int __init btext_initialize(struct device_node *np)
 {
 	unsigned int width, height, depth, pitch;
 	unsigned long address = 0;
@@ -292,7 +292,7 @@ void btext_update_display(unsigned long phys, int width, int height,
 }
 EXPORT_SYMBOL(btext_update_display);
 
-void btext_clearscreen(void)
+void __init btext_clearscreen(void)
 {
 	unsigned int *base	= (unsigned int *)calc_base(0, 0);
 	unsigned long width 	= ((dispDeviceRect[2] - dispDeviceRect[0]) *
@@ -310,7 +310,7 @@ void btext_clearscreen(void)
 	rmci_maybe_off();
 }
 
-void btext_flushscreen(void)
+void __init btext_flushscreen(void)
 {
 	unsigned int *base	= (unsigned int *)calc_base(0, 0);
 	unsigned long width 	= ((dispDeviceRect[2] - dispDeviceRect[0]) *
@@ -329,7 +329,7 @@ void btext_flushscreen(void)
 	__asm__ __volatile__ ("sync" ::: "memory");
 }
 
-void btext_flushline(void)
+void __init btext_flushline(void)
 {
 	unsigned int *base	= (unsigned int *)calc_base(0, g_loc_Y << 4);
 	unsigned long width 	= ((dispDeviceRect[2] - dispDeviceRect[0]) *
@@ -544,7 +544,7 @@ void btext_drawstring(const char *c)
 		btext_drawchar(*c++);
 }
 
-void btext_drawtext(const char *c, unsigned int len)
+void __init btext_drawtext(const char *c, unsigned int len)
 {
 	if (!boot_text_mapped)
 		return;
@@ -552,7 +552,7 @@ void btext_drawtext(const char *c, unsigned int len)
 		btext_drawchar(*c++);
 }
 
-void btext_drawhex(unsigned long v)
+void __init btext_drawhex(unsigned long v)
 {
 	if (!boot_text_mapped)
 		return;
diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
index 1ac8d7357195..7d1b2c4a4891 100644
--- a/arch/powerpc/kernel/dt_cpu_ftrs.c
+++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
@@ -344,7 +344,7 @@ static int __init feat_enable_dscr(struct dt_cpu_feature *f)
 	return 1;
 }
 
-static void hfscr_pmu_enable(void)
+static void __init hfscr_pmu_enable(void)
 {
 	u64 hfscr = mfspr(SPRN_HFSCR);
 	hfscr |= PPC_BIT(60);
diff --git a/arch/powerpc/kernel/eeh_cache.c b/arch/powerpc/kernel/eeh_cache.c
index 9bdaaf7fddc9..2f9dbf8ad2ee 100644
--- a/arch/powerpc/kernel/eeh_cache.c
+++ b/arch/powerpc/kernel/eeh_cache.c
@@ -280,7 +280,7 @@ static int eeh_addr_cache_show(struct seq_file *s, void *v)
 }
 DEFINE_SHOW_ATTRIBUTE(eeh_addr_cache);
 
-void eeh_cache_debugfs_init(void)
+void __init eeh_cache_debugfs_init(void)
 {
 	debugfs_create_file_unsafe("eeh_address_cache", 0400,
 			arch_debugfs_dir, NULL,
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index b7ceb041743c..7499160a314d 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -251,7 +251,7 @@ bool is_fadump_reserved_mem_contiguous(void)
 }
 
 /* Print firmware assisted dump configurations for debugging purpose. */
-static void fadump_show_config(void)
+static void __init fadump_show_config(void)
 {
 	int i;
 
@@ -353,7 +353,7 @@ static __init u64 fadump_calculate_reserve_size(void)
  * Calculate the total memory size required to be reserved for
  * firmware-assisted dump registration.
  */
-static unsigned long get_fadump_area_size(void)
+static unsigned long __init get_fadump_area_size(void)
 {
 	unsigned long size = 0;
 
@@ -462,7 +462,7 @@ static int __init fadump_get_boot_mem_regions(void)
  * with the given memory range.
  * False, otherwise.
  */
-static bool overlaps_reserved_ranges(u64 base, u64 end, int *idx)
+static bool __init overlaps_reserved_ranges(u64 base, u64 end, int *idx)
 {
 	bool ret = false;
 	int i;
@@ -737,7 +737,7 @@ void crash_fadump(struct pt_regs *regs, const char *str)
 	fw_dump.ops->fadump_trigger(fdh, str);
 }
 
-u32 *fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs)
+u32 *__init fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs)
 {
 	struct elf_prstatus prstatus;
 
@@ -752,7 +752,7 @@ u32 *fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs)
 	return buf;
 }
 
-void fadump_update_elfcore_header(char *bufp)
+void __init fadump_update_elfcore_header(char *bufp)
 {
 	struct elf_phdr *phdr;
 
@@ -770,7 +770,7 @@ void fadump_update_elfcore_header(char *bufp)
 	return;
 }
 
-static void *fadump_alloc_buffer(unsigned long size)
+static void *__init fadump_alloc_buffer(unsigned long size)
 {
 	unsigned long count, i;
 	struct page *page;
@@ -792,7 +792,7 @@ static void fadump_free_buffer(unsigned long vaddr, unsigned long size)
 	free_reserved_area((void *)vaddr, (void *)(vaddr + size), -1, NULL);
 }
 
-s32 fadump_setup_cpu_notes_buf(u32 num_cpus)
+s32 __init fadump_setup_cpu_notes_buf(u32 num_cpus)
 {
 	/* Allocate buffer to hold cpu crash notes. */
 	fw_dump.cpu_notes_buf_size = num_cpus * sizeof(note_buf_t);
@@ -1447,7 +1447,7 @@ static ssize_t release_mem_store(struct kobject *kobj,
 }
 
 /* Release the reserved memory and disable the FADump */
-static void unregister_fadump(void)
+static void __init unregister_fadump(void)
 {
 	fadump_cleanup();
 	fadump_release_memory(fw_dump.reserve_dump_area_start,
@@ -1547,7 +1547,7 @@ ATTRIBUTE_GROUPS(fadump);
 
 DEFINE_SHOW_ATTRIBUTE(fadump_region);
 
-static void fadump_init_files(void)
+static void __init fadump_init_files(void)
 {
 	int rc = 0;
 
diff --git a/arch/powerpc/kernel/nvram_64.c b/arch/powerpc/kernel/nvram_64.c
index 3c8d9bbb51cf..0d9f9cd41e13 100644
--- a/arch/powerpc/kernel/nvram_64.c
+++ b/arch/powerpc/kernel/nvram_64.c
@@ -540,7 +540,7 @@ static struct pstore_info nvram_pstore_info = {
 	.write = nvram_pstore_write,
 };
 
-static int nvram_pstore_init(void)
+static int __init nvram_pstore_init(void)
 {
 	int rc = 0;
 
@@ -562,7 +562,7 @@ static int nvram_pstore_init(void)
 	return rc;
 }
 #else
-static int nvram_pstore_init(void)
+static int __init nvram_pstore_init(void)
 {
 	return -1;
 }
@@ -755,7 +755,7 @@ static unsigned char __init nvram_checksum(struct nvram_header *p)
  * Per the criteria passed via nvram_remove_partition(), should this
  * partition be removed?  1=remove, 0=keep
  */
-static int nvram_can_remove_partition(struct nvram_partition *part,
+static int __init nvram_can_remove_partition(struct nvram_partition *part,
 		const char *name, int sig, const char *exceptions[])
 {
 	if (part->header.signature != sig)
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index 6749905932f4..8bc9cf62cd93 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -62,7 +62,7 @@ EXPORT_SYMBOL(isa_mem_base);
 
 static const struct dma_map_ops *pci_dma_ops;
 
-void set_pci_dma_ops(const struct dma_map_ops *dma_ops)
+void __init set_pci_dma_ops(const struct dma_map_ops *dma_ops)
 {
 	pci_dma_ops = dma_ops;
 }
diff --git a/arch/powerpc/kernel/pci_32.c b/arch/powerpc/kernel/pci_32.c
index b49e1060a3bf..48537964fba1 100644
--- a/arch/powerpc/kernel/pci_32.c
+++ b/arch/powerpc/kernel/pci_32.c
@@ -37,7 +37,7 @@ int pcibios_assign_bus_offset = 1;
 EXPORT_SYMBOL(isa_io_base);
 EXPORT_SYMBOL(pci_dram_offset);
 
-void pcibios_make_OF_bus_map(void);
+void __init pcibios_make_OF_bus_map(void);
 
 static void fixup_cpc710_pci64(struct pci_dev* dev);
 static u8* pci_to_OF_bus_map;
@@ -109,7 +109,7 @@ make_one_node_map(struct device_node* node, u8 pci_bus)
 	}
 }
 	
-void
+void __init
 pcibios_make_OF_bus_map(void)
 {
 	int i;
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 75678ff04dd7..4c4a047f691c 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -447,7 +447,7 @@ static int __init early_init_dt_scan_chosen_ppc(unsigned long node,
  */
 
 #ifdef CONFIG_SPARSEMEM
-static bool validate_mem_limit(u64 base, u64 *size)
+static bool __init validate_mem_limit(u64 base, u64 *size)
 {
 	u64 max_mem = 1UL << (MAX_PHYSMEM_BITS);
 
@@ -458,7 +458,7 @@ static bool validate_mem_limit(u64 base, u64 *size)
 	return true;
 }
 #else
-static bool validate_mem_limit(u64 base, u64 *size)
+static bool __init validate_mem_limit(u64 base, u64 *size)
 {
 	return true;
 }
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index f845065c860e..0ac5faacc909 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -672,7 +672,7 @@ static inline int __init prom_getproplen(phandle node, const char *pname)
 	return call_prom("getproplen", 2, 1, node, ADDR(pname));
 }
 
-static void add_string(char **str, const char *q)
+static void __init add_string(char **str, const char *q)
 {
 	char *p = *str;
 
@@ -682,7 +682,7 @@ static void add_string(char **str, const char *q)
 	*str = p;
 }
 
-static char *tohex(unsigned int x)
+static char *__init tohex(unsigned int x)
 {
 	static const char digits[] __initconst = "0123456789abcdef";
 	static char result[9] __prombss;
@@ -728,7 +728,7 @@ static int __init prom_setprop(phandle node, const char *nodename,
 #define prom_islower(c)	('a' <= (c) && (c) <= 'z')
 #define prom_toupper(c)	(prom_islower(c) ? ((c) - 'a' + 'A') : (c))
 
-static unsigned long prom_strtoul(const char *cp, const char **endp)
+static unsigned long __init prom_strtoul(const char *cp, const char **endp)
 {
 	unsigned long result = 0, base = 10, value;
 
@@ -753,7 +753,7 @@ static unsigned long prom_strtoul(const char *cp, const char **endp)
 	return result;
 }
 
-static unsigned long prom_memparse(const char *ptr, const char **retptr)
+static unsigned long __init prom_memparse(const char *ptr, const char **retptr)
 {
 	unsigned long ret = prom_strtoul(ptr, retptr);
 	int shift = 0;
@@ -1786,7 +1786,7 @@ static void __init prom_close_stdin(void)
 }
 
 #ifdef CONFIG_PPC_SVM
-static int prom_rtas_hcall(uint64_t args)
+static int __init prom_rtas_hcall(uint64_t args)
 {
 	register uint64_t arg1 asm("r3") = H_RTAS;
 	register uint64_t arg2 asm("r4") = args;
@@ -3248,7 +3248,7 @@ static void __init prom_check_initrd(unsigned long r3, unsigned long r4)
 /*
  * Perform the Enter Secure Mode ultracall.
  */
-static int enter_secure_mode(unsigned long kbase, unsigned long fdt)
+static int __init enter_secure_mode(unsigned long kbase, unsigned long fdt)
 {
 	register unsigned long r3 asm("r3") = UV_ESM;
 	register unsigned long r4 asm("r4") = kbase;
diff --git a/arch/powerpc/kernel/rtasd.c b/arch/powerpc/kernel/rtasd.c
index 32ee17753eb4..cf0f42909ddf 100644
--- a/arch/powerpc/kernel/rtasd.c
+++ b/arch/powerpc/kernel/rtasd.c
@@ -455,7 +455,7 @@ static void rtas_event_scan(struct work_struct *w)
 }
 
 #ifdef CONFIG_PPC64
-static void retrieve_nvram_error_log(void)
+static void __init retrieve_nvram_error_log(void)
 {
 	unsigned int err_type ;
 	int rc ;
@@ -473,12 +473,12 @@ static void retrieve_nvram_error_log(void)
 	}
 }
 #else /* CONFIG_PPC64 */
-static void retrieve_nvram_error_log(void)
+static void __init retrieve_nvram_error_log(void)
 {
 }
 #endif /* CONFIG_PPC64 */
 
-static void start_event_scan(void)
+static void __init start_event_scan(void)
 {
 	printk(KERN_DEBUG "RTAS daemon started\n");
 	pr_debug("rtasd: will sleep for %d milliseconds\n",
diff --git a/arch/powerpc/kernel/security.c b/arch/powerpc/kernel/security.c
index 15fb5ea1b9ea..e159d4093d98 100644
--- a/arch/powerpc/kernel/security.c
+++ b/arch/powerpc/kernel/security.c
@@ -44,7 +44,7 @@ static void enable_barrier_nospec(bool enable)
 	do_barrier_nospec_fixups(enable);
 }
 
-void setup_barrier_nospec(void)
+void __init setup_barrier_nospec(void)
 {
 	bool enable;
 
@@ -132,7 +132,7 @@ early_param("nospectre_v2", handle_nospectre_v2);
 #endif /* CONFIG_PPC_FSL_BOOK3E || CONFIG_PPC_BOOK3S_64 */
 
 #ifdef CONFIG_PPC_FSL_BOOK3E
-void setup_spectre_v2(void)
+void __init setup_spectre_v2(void)
 {
 	if (no_spectrev2 || cpu_mitigations_off())
 		do_btb_flush_fixups();
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 703a2e6ab08d..d87f7c1103ce 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -499,7 +499,7 @@ void smp_release_cpus(void)
  * routines and/or provided to userland
  */
 
-static void init_cache_info(struct ppc_cache_info *info, u32 size, u32 lsize,
+static void __init init_cache_info(struct ppc_cache_info *info, u32 size, u32 lsize,
 			    u32 bsize, u32 sets)
 {
 	info->size = size;
diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index aee3a7119f97..8f02d1881633 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -896,7 +896,8 @@ static struct thread_groups *__init get_thread_groups(int cpu,
 	return tg;
 }
 
-static int update_mask_from_threadgroup(cpumask_var_t *mask, struct thread_groups *tg, int cpu, int cpu_group_start)
+static int __init update_mask_from_threadgroup(cpumask_var_t *mask, struct thread_groups *tg,
+					       int cpu, int cpu_group_start)
 {
 	int first_thread = cpu_first_thread_sibling(cpu);
 	int i;
@@ -1642,7 +1643,7 @@ int setup_profiling_timer(unsigned int multiplier)
 }
 #endif
 
-static void fixup_topology(void)
+static void __init fixup_topology(void)
 {
 	int i;
 
diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index 08d8072d6e7a..d45a415d5374 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -214,7 +214,7 @@ static ssize_t __used store_dscr_default(struct device *dev,
 static DEVICE_ATTR(dscr_default, 0600,
 		show_dscr_default, store_dscr_default);
 
-static void sysfs_create_dscr_default(void)
+static void __init sysfs_create_dscr_default(void)
 {
 	if (cpu_has_feature(CPU_FTR_DSCR)) {
 		int cpu;
@@ -744,12 +744,12 @@ static ssize_t show_svm(struct device *dev, struct device_attribute *attr, char
 }
 static DEVICE_ATTR(svm, 0444, show_svm, NULL);
 
-static void create_svm_file(void)
+static void __init create_svm_file(void)
 {
 	device_create_file(cpu_subsys.dev_root, &dev_attr_svm);
 }
 #else
-static void create_svm_file(void)
+static void __init create_svm_file(void)
 {
 }
 #endif /* CONFIG_PPC_SVM */
@@ -1110,7 +1110,7 @@ EXPORT_SYMBOL_GPL(cpu_remove_dev_attr_group);
 /* NUMA stuff */
 
 #ifdef CONFIG_NUMA
-static void register_nodes(void)
+static void __init register_nodes(void)
 {
 	int i;
 
@@ -1134,7 +1134,7 @@ void sysfs_remove_device_from_node(struct device *dev, int nid)
 EXPORT_SYMBOL_GPL(sysfs_remove_device_from_node);
 
 #else
-static void register_nodes(void)
+static void __init register_nodes(void)
 {
 	return;
 }
diff --git a/arch/powerpc/kernel/udbg_16550.c b/arch/powerpc/kernel/udbg_16550.c
index 8513aa49614e..d3942de254c6 100644
--- a/arch/powerpc/kernel/udbg_16550.c
+++ b/arch/powerpc/kernel/udbg_16550.c
@@ -84,7 +84,7 @@ static int udbg_uart_getc(void)
 	return udbg_uart_in(UART_RBR);
 }
 
-static void udbg_use_uart(void)
+static void __init udbg_use_uart(void)
 {
 	udbg_putc = udbg_uart_putc;
 	udbg_flush = udbg_uart_flush;
@@ -92,7 +92,7 @@ static void udbg_use_uart(void)
 	udbg_getc_poll = udbg_uart_getc_poll;
 }
 
-void udbg_uart_setup(unsigned int speed, unsigned int clock)
+void __init udbg_uart_setup(unsigned int speed, unsigned int clock)
 {
 	unsigned int dll, base_bauds;
 
@@ -121,7 +121,7 @@ void udbg_uart_setup(unsigned int speed, unsigned int clock)
 	udbg_uart_out(UART_FCR, 0x7);
 }
 
-unsigned int udbg_probe_uart_speed(unsigned int clock)
+unsigned int __init udbg_probe_uart_speed(unsigned int clock)
 {
 	unsigned int dll, dlm, divisor, prescaler, speed;
 	u8 old_lcr;
@@ -172,7 +172,7 @@ static void udbg_uart_out_pio(unsigned int reg, u8 data)
 	outb(data, udbg_uart.pio_base + (reg * udbg_uart_stride));
 }
 
-void udbg_uart_init_pio(unsigned long port, unsigned int stride)
+void __init udbg_uart_init_pio(unsigned long port, unsigned int stride)
 {
 	if (!port)
 		return;
@@ -194,7 +194,7 @@ static void udbg_uart_out_mmio(unsigned int reg, u8 data)
 }
 
 
-void udbg_uart_init_mmio(void __iomem *addr, unsigned int stride)
+void __init udbg_uart_init_mmio(void __iomem *addr, unsigned int stride)
 {
 	if (!addr)
 		return;
diff --git a/arch/powerpc/kexec/core.c b/arch/powerpc/kexec/core.c
index a2242017e55f..8b68d9f91a03 100644
--- a/arch/powerpc/kexec/core.c
+++ b/arch/powerpc/kexec/core.c
@@ -185,7 +185,7 @@ void __init reserve_crashkernel(void)
 	}
 }
 
-int overlaps_crashkernel(unsigned long start, unsigned long size)
+int __init overlaps_crashkernel(unsigned long start, unsigned long size)
 {
 	return (start + size) > crashk_res.start && start <= crashk_res.end;
 }
-- 
2.25.1

