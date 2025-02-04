Return-Path: <linuxppc-dev+bounces-5810-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE4FA27106
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Feb 2025 13:07:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YnMXX1RMqz301B;
	Tue,  4 Feb 2025 23:06:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738670780;
	cv=none; b=eVE+V2wobW2pq+ALGcQ8kmp1kvS9oHtiJ4LCZzBAQFjD0SBHGKIFJIaN21NN+NPjULFjlilqfO7YkKkOJPGR01zgoAKjfdSj2bKLlu61rwQjNNP+zXR2YTgaEsdidLZZA2h+mxSoaCZgqeX6xV/iow2CCnLM93VBZxjc/TpPJjAl9pcK7BA+yQR0b6f5w2/5pIgLyfkvO+cqz1n4emHDrT1im9t4EQykZgiLRIQWrDZxyZFZlJUMgTnSQYSX2X7wS4pvcgOEa477asxnhTktoTgdMy3SnDGCyZI1O7cUXBmrv6+dddK6yDRjGxivnbIoZxd7Zcksn4XsBA7vkGxnuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738670780; c=relaxed/relaxed;
	bh=GZz2/Rzl4nxRjyZQQuDhbTH9jSENhKbkcAsB9GqXUdM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UR6jRMEJ4HwbGsVk/sxnWzF2AnO3QBU40SRTblWkqqd8UXd1QUyKrMz9jLm1yEnMjHfB2m6Pttr3c5Yi8oMaV/3JWmwHoDgs3kDOReY1bnSQgJ3kokpivWzIu6SMo8D2IQ+8wWTLdNOjMTg0Q3FJ2GEnxxwpN3XOkNhavInKNHtfvvhQGfGZ92kr16/2TEIPJRKq4XWcW2z9O3QCktuUWW+diFvfKTNP/36O9BxW2qhTBT601EpOcgps24gQfjO6sXh1CxZ7b8twDMQQdKi7P7WVHDd+sR4nrsBSXpPeKVuZFXqDQ1jjYg9dxbrpxoCuWLmcvR+HW7nJyPB9+vR5tg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=assPOJ51; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=D7lAtpX7; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=assPOJ51;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=D7lAtpX7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4YnMXS5ghWz2ytT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Feb 2025 23:06:16 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738670771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GZz2/Rzl4nxRjyZQQuDhbTH9jSENhKbkcAsB9GqXUdM=;
	b=assPOJ51aEtZGHPeZR8DfVLVLsfR5ijN6FQuGtHLR7lOK9zEpf+k6fKHfUNQY3mn9wcvW6
	HKNl0ddEG6HABQ/ABVcIBV0O90P7qWv3lLQuAwvR4QvIq2Z8GKfagNGhWDV05gexPR7Iw9
	onh/UGtkhkECynApBpie3MUZGX8YEq5vR2IIADnNrdXCnIvbdM8A8XUrsF5gEJnoVKMJ17
	jRCJqFFEYAMRrCVHh/Cg3Q+CGp4LNXH5xiUpDOJZCc5RHFYbOBwgTG+KYnWkBOoyz1S3Ax
	rRQ9bx3H3sGz22PzRTZnbnAgsYpjVwkfQYXJCmyjU3Vxi2BMbULsQyF7JZnEog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738670771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GZz2/Rzl4nxRjyZQQuDhbTH9jSENhKbkcAsB9GqXUdM=;
	b=D7lAtpX70oczYfL8sipzeVjnw7sG9Ucu6JX8PD8iu7Q48cE3dEK6SkzmWc1ED3WIPPC/Ri
	spZApFelUc1QBKDg==
Date: Tue, 04 Feb 2025 13:05:41 +0100
Subject: [PATCH v3 09/18] riscv: vdso: Switch to generic storage
 implementation
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250204-vdso-store-rng-v3-9-13a4669dfc8c@linutronix.de>
References: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
In-Reply-To: <20250204-vdso-store-rng-v3-0-13a4669dfc8c@linutronix.de>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>, 
 Guo Ren <guoren@kernel.org>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 linux-csky@vger.kernel.org
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738670761; l=11319;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6t0lg0Na27ddLTdUfv6lKQXgP1HzHS/ol/Tbe6sB3/Q=;
 b=wzA/J93W0m9VwhWAnFu+qG3daI8Y64RCmMP1riYieah1J7OMgKaBhEwcWUuKP6vz/7wdToNFv
 dRFo2G/roj1DHY84oWrDuRWvdNKnipPnO2ZzJkNFwMTdjqCumuTDOf+
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The generic storage implementation provides the same features as the
custom one. However it can be shared between architectures, making
maintenance easier.

Co-developed-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/riscv/Kconfig                                 |  3 +-
 arch/riscv/include/asm/vdso.h                      |  2 +-
 .../include/asm/vdso/{time_data.h => arch_data.h}  |  8 +-
 arch/riscv/include/asm/vdso/gettimeofday.h         | 14 +---
 arch/riscv/include/asm/vdso/vsyscall.h             |  9 ---
 arch/riscv/kernel/sys_hwprobe.c                    |  3 +-
 arch/riscv/kernel/vdso.c                           | 90 +---------------------
 arch/riscv/kernel/vdso/hwprobe.c                   |  6 +-
 arch/riscv/kernel/vdso/vdso.lds.S                  |  7 +-
 9 files changed, 18 insertions(+), 124 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7612c52e9b1e35607f1dd4603a596416d3357a71..aa8ea53186c04ad68582255f74b09a0605fe8368 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -53,7 +53,7 @@ config RISCV
 	select ARCH_HAS_SYSCALL_WRAPPER
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN
-	select ARCH_HAS_VDSO_TIME_DATA
+	select ARCH_HAS_VDSO_ARCH_DATA if GENERIC_VDSO_DATA_STORE
 	select ARCH_KEEP_MEMBLOCK if ACPI
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
@@ -116,6 +116,7 @@ config RISCV
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL if MMU && 64BIT
+	select GENERIC_VDSO_DATA_STORE if MMU
 	select GENERIC_VDSO_TIME_NS if HAVE_GENERIC_VDSO
 	select HARDIRQS_SW_RESEND
 	select HAS_IOPORT if MMU
diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
index f891478829a52c41e06240f67611694cc28197d9..c130d8100232cbe50e52e35eb418e354bd114cb7 100644
--- a/arch/riscv/include/asm/vdso.h
+++ b/arch/riscv/include/asm/vdso.h
@@ -14,7 +14,7 @@
  */
 #ifdef CONFIG_MMU
 
-#define __VVAR_PAGES    2
+#define __VDSO_PAGES    4
 
 #ifndef __ASSEMBLY__
 #include <generated/vdso-offsets.h>
diff --git a/arch/riscv/include/asm/vdso/time_data.h b/arch/riscv/include/asm/vdso/arch_data.h
similarity index 71%
rename from arch/riscv/include/asm/vdso/time_data.h
rename to arch/riscv/include/asm/vdso/arch_data.h
index dfa65228999bed41dfd6c5e36cb678e1e055eec8..da57a3786f7a53c866fc00948826b4a2d839940f 100644
--- a/arch/riscv/include/asm/vdso/time_data.h
+++ b/arch/riscv/include/asm/vdso/arch_data.h
@@ -1,12 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __RISCV_ASM_VDSO_TIME_DATA_H
-#define __RISCV_ASM_VDSO_TIME_DATA_H
+#ifndef __RISCV_ASM_VDSO_ARCH_DATA_H
+#define __RISCV_ASM_VDSO_ARCH_DATA_H
 
 #include <linux/types.h>
 #include <vdso/datapage.h>
 #include <asm/hwprobe.h>
 
-struct arch_vdso_time_data {
+struct vdso_arch_data {
 	/* Stash static answers to the hwprobe queries when all CPUs are selected. */
 	__u64 all_cpu_hwprobe_values[RISCV_HWPROBE_MAX_KEY + 1];
 
@@ -14,4 +14,4 @@ struct arch_vdso_time_data {
 	__u8 homogeneous_cpus;
 };
 
-#endif /* __RISCV_ASM_VDSO_TIME_DATA_H */
+#endif /* __RISCV_ASM_VDSO_ARCH_DATA_H */
diff --git a/arch/riscv/include/asm/vdso/gettimeofday.h b/arch/riscv/include/asm/vdso/gettimeofday.h
index ba3283cf7accaa93a38512d2c17eda0eefde0612..29164f84f93cec6e28251e6a0adfbc341ac88241 100644
--- a/arch/riscv/include/asm/vdso/gettimeofday.h
+++ b/arch/riscv/include/asm/vdso/gettimeofday.h
@@ -69,7 +69,7 @@ int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
 #endif /* CONFIG_GENERIC_TIME_VSYSCALL */
 
 static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
-						 const struct vdso_data *vd)
+						 const struct vdso_time_data *vd)
 {
 	/*
 	 * The purpose of csr_read(CSR_TIME) is to trap the system into
@@ -79,18 +79,6 @@ static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
 	return csr_read(CSR_TIME);
 }
 
-static __always_inline const struct vdso_data *__arch_get_vdso_data(void)
-{
-	return _vdso_data;
-}
-
-#ifdef CONFIG_TIME_NS
-static __always_inline
-const struct vdso_data *__arch_get_timens_vdso_data(const struct vdso_data *vd)
-{
-	return _timens_data;
-}
-#endif
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __ASM_VDSO_GETTIMEOFDAY_H */
diff --git a/arch/riscv/include/asm/vdso/vsyscall.h b/arch/riscv/include/asm/vdso/vsyscall.h
index e8a9c4b53c0c9f4744196eed800b21f3918d1040..1140b54b4bc8278d7a322036cd9f84f71258f246 100644
--- a/arch/riscv/include/asm/vdso/vsyscall.h
+++ b/arch/riscv/include/asm/vdso/vsyscall.h
@@ -6,15 +6,6 @@
 
 #include <vdso/datapage.h>
 
-extern struct vdso_data *vdso_data;
-
-static __always_inline struct vdso_data *__riscv_get_k_vdso_data(void)
-{
-	return vdso_data;
-}
-
-#define __arch_get_k_vdso_data __riscv_get_k_vdso_data
-
 /* The asm-generic header needs to be included after the definitions above */
 #include <asm-generic/vdso/vsyscall.h>
 
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index bcd3b816306c22df62f60ad044f4ae58f7dad4d1..04a4e549551284bb3340673eb76a2e7bd457025e 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -450,8 +450,7 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
 
 static int __init init_hwprobe_vdso_data(void)
 {
-	struct vdso_data *vd = __arch_get_k_vdso_data();
-	struct arch_vdso_time_data *avd = &vd->arch_data;
+	struct vdso_arch_data *avd = vdso_k_arch_data;
 	u64 id_bitsmash = 0;
 	struct riscv_hwprobe pair;
 	int key;
diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index 3ca3ae4277e187e790a8bf513a9e80d8b6290bb2..cc2895d1fbc2fe752b3edc94f4e28a6a8fca7a3b 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -13,20 +13,11 @@
 #include <linux/err.h>
 #include <asm/page.h>
 #include <asm/vdso.h>
-#include <linux/time_namespace.h>
+#include <linux/vdso_datastore.h>
 #include <vdso/datapage.h>
 #include <vdso/vsyscall.h>
 
-enum vvar_pages {
-	VVAR_DATA_PAGE_OFFSET,
-	VVAR_TIMENS_PAGE_OFFSET,
-	VVAR_NR_PAGES,
-};
-
-#define VVAR_SIZE  (VVAR_NR_PAGES << PAGE_SHIFT)
-
-static union vdso_data_store vdso_data_store __page_aligned_data;
-struct vdso_data *vdso_data = vdso_data_store.data;
+#define VVAR_SIZE  (VDSO_NR_PAGES << PAGE_SHIFT)
 
 struct __vdso_info {
 	const char *name;
@@ -79,78 +70,6 @@ static void __init __vdso_init(struct __vdso_info *vdso_info)
 	vdso_info->cm->pages = vdso_pagelist;
 }
 
-#ifdef CONFIG_TIME_NS
-struct vdso_data *arch_get_vdso_data(void *vvar_page)
-{
-	return (struct vdso_data *)(vvar_page);
-}
-
-static const struct vm_special_mapping rv_vvar_map;
-
-/*
- * The vvar mapping contains data for a specific time namespace, so when a task
- * changes namespace we must unmap its vvar data for the old namespace.
- * Subsequent faults will map in data for the new namespace.
- *
- * For more details see timens_setup_vdso_data().
- */
-int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
-{
-	struct mm_struct *mm = task->mm;
-	struct vm_area_struct *vma;
-	VMA_ITERATOR(vmi, mm, 0);
-
-	mmap_read_lock(mm);
-
-	for_each_vma(vmi, vma) {
-		if (vma_is_special_mapping(vma, &rv_vvar_map))
-			zap_vma_pages(vma);
-	}
-
-	mmap_read_unlock(mm);
-	return 0;
-}
-#endif
-
-static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
-			     struct vm_area_struct *vma, struct vm_fault *vmf)
-{
-	struct page *timens_page = find_timens_vvar_page(vma);
-	unsigned long pfn;
-
-	switch (vmf->pgoff) {
-	case VVAR_DATA_PAGE_OFFSET:
-		if (timens_page)
-			pfn = page_to_pfn(timens_page);
-		else
-			pfn = sym_to_pfn(vdso_data);
-		break;
-#ifdef CONFIG_TIME_NS
-	case VVAR_TIMENS_PAGE_OFFSET:
-		/*
-		 * If a task belongs to a time namespace then a namespace
-		 * specific VVAR is mapped with the VVAR_DATA_PAGE_OFFSET and
-		 * the real VVAR page is mapped with the VVAR_TIMENS_PAGE_OFFSET
-		 * offset.
-		 * See also the comment near timens_setup_vdso_data().
-		 */
-		if (!timens_page)
-			return VM_FAULT_SIGBUS;
-		pfn = sym_to_pfn(vdso_data);
-		break;
-#endif /* CONFIG_TIME_NS */
-	default:
-		return VM_FAULT_SIGBUS;
-	}
-
-	return vmf_insert_pfn(vma, vmf->address, pfn);
-}
-
-static const struct vm_special_mapping rv_vvar_map = {
-	.name   = "[vvar]",
-	.fault = vvar_fault,
-};
-
 static struct vm_special_mapping rv_vdso_map __ro_after_init = {
 	.name   = "[vdso]",
 	.mremap = vdso_mremap,
@@ -196,7 +115,7 @@ static int __setup_additional_pages(struct mm_struct *mm,
 	unsigned long vdso_base, vdso_text_len, vdso_mapping_len;
 	void *ret;
 
-	BUILD_BUG_ON(VVAR_NR_PAGES != __VVAR_PAGES);
+	BUILD_BUG_ON(VDSO_NR_PAGES != __VDSO_PAGES);
 
 	vdso_text_len = vdso_info->vdso_pages << PAGE_SHIFT;
 	/* Be sure to map the data page */
@@ -208,8 +127,7 @@ static int __setup_additional_pages(struct mm_struct *mm,
 		goto up_fail;
 	}
 
-	ret = _install_special_mapping(mm, vdso_base, VVAR_SIZE,
-		(VM_READ | VM_MAYREAD | VM_PFNMAP), &rv_vvar_map);
+	ret = vdso_install_vvar_mapping(mm, vdso_base);
 	if (IS_ERR(ret))
 		goto up_fail;
 
diff --git a/arch/riscv/kernel/vdso/hwprobe.c b/arch/riscv/kernel/vdso/hwprobe.c
index a158c029344f60c022e7565757ff44df7e3d89e5..2ddeba6c68dda09b0249117fd06a5d249f3b0abd 100644
--- a/arch/riscv/kernel/vdso/hwprobe.c
+++ b/arch/riscv/kernel/vdso/hwprobe.c
@@ -16,8 +16,7 @@ static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
 				 size_t cpusetsize, unsigned long *cpus,
 				 unsigned int flags)
 {
-	const struct vdso_data *vd = __arch_get_vdso_data();
-	const struct arch_vdso_time_data *avd = &vd->arch_data;
+	const struct vdso_arch_data *avd = &vdso_u_arch_data;
 	bool all_cpus = !cpusetsize && !cpus;
 	struct riscv_hwprobe *p = pairs;
 	struct riscv_hwprobe *end = pairs + pair_count;
@@ -51,8 +50,7 @@ static int riscv_vdso_get_cpus(struct riscv_hwprobe *pairs, size_t pair_count,
 			       size_t cpusetsize, unsigned long *cpus,
 			       unsigned int flags)
 {
-	const struct vdso_data *vd = __arch_get_vdso_data();
-	const struct arch_vdso_time_data *avd = &vd->arch_data;
+	const struct vdso_arch_data *avd = &vdso_u_arch_data;
 	struct riscv_hwprobe *p = pairs;
 	struct riscv_hwprobe *end = pairs + pair_count;
 	unsigned char *c = (unsigned char *)cpus;
diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index cbe2a179331d2511a8b4a26c06383e46131661b1..8e86965a8aae4d7c5a36d0f26026cd1c8680b339 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -4,15 +4,14 @@
  */
 #include <asm/page.h>
 #include <asm/vdso.h>
+#include <vdso/datapage.h>
 
 OUTPUT_ARCH(riscv)
 
 SECTIONS
 {
-	PROVIDE(_vdso_data = . - __VVAR_PAGES * PAGE_SIZE);
-#ifdef CONFIG_TIME_NS
-	PROVIDE(_timens_data = _vdso_data + PAGE_SIZE);
-#endif
+	VDSO_VVAR_SYMS
+
 	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text

-- 
2.48.1


