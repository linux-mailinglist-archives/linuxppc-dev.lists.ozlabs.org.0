Return-Path: <linuxppc-dev+bounces-4184-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7989F3263
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 15:11:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBhgW5HJZz305c;
	Tue, 17 Dec 2024 01:11:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734358263;
	cv=none; b=OldsIn/CCJrqNFU/kFKMA9llxPSnsE2g+a4knQ2F6U7DiOGEwh/8PDBjGZDWjmYkWO0aEL1pz0o3u/nWb/HQl+JXiFmc+PRA7DWsghNRMPJzPf/bSdZp8eyZHhziyt+ePFKHtX3nM928YyqQo7pmrK1k+f1mSj8a/3stz5TKTlTeBdyZmBX45LL6yOHq6lcEclFnOXZ+BZYK21WcJut8rzfxu913lrxuHX7Fm/wgWyF2P5rP2lR7fhMLczuMcp6j9CRDmb0nDiP21IYnVajcZX0irRVPQmGxFVsJYwIuLuFaWh42joEO9vW0p6ScGSxV8U65tHytP/BWR1LA10MK5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734358263; c=relaxed/relaxed;
	bh=FB3tkcrkSCAxQ2neDhf1PZI0DiqtQhl58DAttp35/wM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zlp4F8vhp6la0cr9YvoKIwnvB3tQg0q5nkT4Y9s06hDWgHaqH7HiNaxxV3tzp2gtNuxbY/9lHghp8Mtmb6gFdLZvtbo5q0CqynMldbHDDgz3wLdP/YBQhyc/AajNZOujv/P1FNrdaKLAnmDlQj8sstSvR1M7rZSy8jhF+BZcHC+mZlsc9H5JYTzAlGgyueJ/XEdkKKgO0nA8RGwyJeBWqN8o41pQWHS11PwSISfXzszvHxIZuKTkf+bbrKDJJMOoF0WWupdOJwGeqHOauOZrdfFQbvctd3beDpEm2FNWzEXWag6NuLW/Gf3JGr+RTLPCKIIgq4DV1uL8tPKLolLPCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RpaXh5Vy; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=OYCPZOqT; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=RpaXh5Vy;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=OYCPZOqT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBhgS6wpFz302D
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 01:11:00 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734358258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FB3tkcrkSCAxQ2neDhf1PZI0DiqtQhl58DAttp35/wM=;
	b=RpaXh5VyoUplmQ3aQcNuoge9O682Pz79b506PFNwkQdEvq4tApKLjJDQDMdJL7uW20tIPb
	81USegn3WOM3np5Hy+ODfsc6SfJwy54DqbVlqHS5+GGq8e9u2NWg4ll09V+0h5GvUsctti
	rHS6hF0hzhwGpY0qUVh3ly17jbNrgY2F5nD3TGB9z3fbhRKSYXHdzt0CD6p3U1hJUFs1A+
	4ZwIezIaPe7KitP9zXcVpHbwnFT0rUyBj7EY8MASDGZL0BUoW2fFoIoTels8Sy0BT9Hclm
	ATdppIHN3qV9kqAxIWfC1u6fCsKDsrQ5/TtalmsIdGFVMAF6m1Pm0bZU6oyaRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734358258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FB3tkcrkSCAxQ2neDhf1PZI0DiqtQhl58DAttp35/wM=;
	b=OYCPZOqTWgcqvUFaIiXZbrSKkv4pblTBns2X6wwko3qdByLLkKf2S09gyKdndt1Tp0q1J4
	n9YU7hhY31vPyDBw==
Date: Mon, 16 Dec 2024 15:10:07 +0100
Subject: [PATCH 11/17] MIPS: vdso: Switch to generic storage implementation
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
Message-Id: <20241216-vdso-store-rng-v1-11-f7aed1bdb3b2@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
In-Reply-To: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
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
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734358247; l=9616;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=z32AnpnpxfV6B6T2JH4m9YqiJZxSBbsTaJncfC2i9Lk=;
 b=ZkN3Zfzn87dYQnlxtAjAYeqH4canqy0S/sKwRpAB3CcHUPystHUa84UwRHybYukx3qi4nFPnb
 FQqlAbR5CrlDsr2sHR1XcYy5AhYyIWU8U8YB3Iy2zc6R65xBHNQAjEl
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
 arch/mips/Kconfig                         |  1 +
 arch/mips/include/asm/vdso/gettimeofday.h |  9 +++---
 arch/mips/include/asm/vdso/vdso.h         | 19 ++++++-------
 arch/mips/include/asm/vdso/vsyscall.h     | 14 ++-------
 arch/mips/kernel/vdso.c                   | 47 ++++++++++++-------------------
 arch/mips/vdso/vdso.lds.S                 |  5 +++-
 6 files changed, 38 insertions(+), 57 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 467b10f4361aeb7aad0121f334eaa5d23351010c..94fae59589ae80d590ac250b52ba30e9dd6eda32 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -49,6 +49,7 @@ config MIPS
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_IDLE_POLL_SETUP
 	select GENERIC_TIME_VSYSCALL
+	select GENERIC_VDSO_DATA_STORE
 	select GUP_GET_PXX_LOW_HIGH if CPU_MIPS32 && PHYS_ADDR_T_64BIT
 	select HAS_IOPORT if !NO_IOPORT_MAP || ISA
 	select HAVE_ARCH_COMPILER_H
diff --git a/arch/mips/include/asm/vdso/gettimeofday.h b/arch/mips/include/asm/vdso/gettimeofday.h
index 44a45f3fa4b01026e39efb7f8f51051ec464340c..18220bc823f7fac5b70cfbc4c876c91e752fafaa 100644
--- a/arch/mips/include/asm/vdso/gettimeofday.h
+++ b/arch/mips/include/asm/vdso/gettimeofday.h
@@ -167,7 +167,7 @@ static __always_inline u64 read_r4k_count(void)
 
 #ifdef CONFIG_CLKSRC_MIPS_GIC
 
-static __always_inline u64 read_gic_count(const struct vdso_data *data)
+static __always_inline u64 read_gic_count(const struct vdso_time_data *data)
 {
 	void __iomem *gic = get_gic(data);
 	u32 hi, hi2, lo;
@@ -184,7 +184,7 @@ static __always_inline u64 read_gic_count(const struct vdso_data *data)
 #endif
 
 static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
-						 const struct vdso_data *vd)
+						 const struct vdso_time_data *vd)
 {
 #ifdef CONFIG_CSRC_R4K
 	if (clock_mode == VDSO_CLOCKMODE_R4K)
@@ -209,10 +209,11 @@ static inline bool mips_vdso_hres_capable(void)
 }
 #define __arch_vdso_hres_capable mips_vdso_hres_capable
 
-static __always_inline const struct vdso_data *__arch_get_vdso_data(void)
+static __always_inline const struct vdso_time_data *__mips_get_vdso_u_time_data(void)
 {
-	return get_vdso_data();
+	return get_vdso_time_data();
 }
+#define __arch_get_vdso_u_time_data __mips_get_vdso_u_time_data
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/arch/mips/include/asm/vdso/vdso.h b/arch/mips/include/asm/vdso/vdso.h
index 6cd88191fefa9ce6d8323dd70d45aa9a198ac9d0..acd0efcd3d93ef7e71107302a40d24b4b51aae99 100644
--- a/arch/mips/include/asm/vdso/vdso.h
+++ b/arch/mips/include/asm/vdso/vdso.h
@@ -5,16 +5,18 @@
  */
 
 #include <asm/sgidefs.h>
+#include <vdso/page.h>
+
+#define __VDSO_PAGES 4
 
 #ifndef __ASSEMBLY__
 
 #include <asm/asm.h>
-#include <asm/page.h>
 #include <asm/vdso.h>
 
-static inline unsigned long get_vdso_base(void)
+static inline const struct vdso_time_data *get_vdso_time_data(void)
 {
-	unsigned long addr;
+	const struct vdso_time_data *addr;
 
 	/*
 	 * We can't use cpu_has_mips_r6 since it needs the cpu_data[]
@@ -27,7 +29,7 @@ static inline unsigned long get_vdso_base(void)
 	 * We can't use addiupc because there is no label-label
 	 * support for the addiupc reloc
 	 */
-	__asm__("lapc	%0, _start			\n"
+	__asm__("lapc	%0, vdso_u_time_data		\n"
 		: "=r" (addr) : :);
 #else
 	/*
@@ -46,7 +48,7 @@ static inline unsigned long get_vdso_base(void)
 	"	.set noreorder				\n"
 	"	bal	1f				\n"
 	"	 nop					\n"
-	"	.word	_start - .			\n"
+	"	.word	vdso_u_time_data - .		\n"
 	"1:	lw	%0, 0($31)			\n"
 	"	" STR(PTR_ADDU) " %0, $31, %0		\n"
 	"	.set pop				\n"
@@ -58,14 +60,9 @@ static inline unsigned long get_vdso_base(void)
 	return addr;
 }
 
-static inline const struct vdso_data *get_vdso_data(void)
-{
-	return (const struct vdso_data *)(get_vdso_base() - PAGE_SIZE);
-}
-
 #ifdef CONFIG_CLKSRC_MIPS_GIC
 
-static inline void __iomem *get_gic(const struct vdso_data *data)
+static inline void __iomem *get_gic(const struct vdso_time_data *data)
 {
 	return (void __iomem *)((unsigned long)data & PAGE_MASK) - PAGE_SIZE;
 }
diff --git a/arch/mips/include/asm/vdso/vsyscall.h b/arch/mips/include/asm/vdso/vsyscall.h
index a4582870aaea49ac288d62ec4fa1338a98621918..2b1debb62dee07bb49ab64f755ff9120d512458a 100644
--- a/arch/mips/include/asm/vdso/vsyscall.h
+++ b/arch/mips/include/asm/vdso/vsyscall.h
@@ -2,22 +2,12 @@
 #ifndef __ASM_VDSO_VSYSCALL_H
 #define __ASM_VDSO_VSYSCALL_H
 
+#include <asm/page.h>
+
 #ifndef __ASSEMBLY__
 
 #include <vdso/datapage.h>
 
-extern struct vdso_data *vdso_data;
-
-/*
- * Update the vDSO data page to keep in sync with kernel timekeeping.
- */
-static __always_inline
-struct vdso_data *__mips_get_k_vdso_data(void)
-{
-	return vdso_data;
-}
-#define __arch_get_k_vdso_data __mips_get_k_vdso_data
-
 /* The asm-generic header needs to be included after the definitions above */
 #include <asm-generic/vdso/vsyscall.h>
 
diff --git a/arch/mips/kernel/vdso.c b/arch/mips/kernel/vdso.c
index 4c8e3c0aa210476d7b8cb349b99e9a5a453aa7ce..470bf52970c9fc17b275e4e051378f8f08ebf986 100644
--- a/arch/mips/kernel/vdso.c
+++ b/arch/mips/kernel/vdso.c
@@ -14,6 +14,7 @@
 #include <linux/random.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/vdso_datastore.h>
 
 #include <asm/abi.h>
 #include <asm/mips-cps.h>
@@ -22,20 +23,7 @@
 #include <vdso/helpers.h>
 #include <vdso/vsyscall.h>
 
-/* Kernel-provided data used by the VDSO. */
-static union vdso_data_store mips_vdso_data __page_aligned_data;
-struct vdso_data *vdso_data = mips_vdso_data.data;
-
-/*
- * Mapping for the VDSO data/GIC pages. The real pages are mapped manually, as
- * what we map and where within the area they are mapped is determined at
- * runtime.
- */
-static struct page *no_pages[] = { NULL };
-static struct vm_special_mapping vdso_vvar_mapping = {
-	.name = "[vvar]",
-	.pages = no_pages,
-};
+static_assert(VDSO_NR_PAGES == __VDSO_PAGES);
 
 static void __init init_vdso_image(struct mips_vdso_image *image)
 {
@@ -89,7 +77,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 {
 	struct mips_vdso_image *image = current->thread.abi->vdso;
 	struct mm_struct *mm = current->mm;
-	unsigned long gic_size, vvar_size, size, base, data_addr, vdso_addr, gic_pfn, gic_base;
+	unsigned long gic_size, size, base, data_addr, vdso_addr, gic_pfn, gic_base;
 	struct vm_area_struct *vma;
 	int ret;
 
@@ -117,8 +105,7 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	 * the counter registers at the start.
 	 */
 	gic_size = mips_gic_present() ? PAGE_SIZE : 0;
-	vvar_size = gic_size + PAGE_SIZE;
-	size = vvar_size + image->size;
+	size = gic_size + VDSO_NR_PAGES * PAGE_SIZE + image->size;
 
 	/*
 	 * Find a region that's large enough for us to perform the
@@ -141,15 +128,13 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	 */
 	if (cpu_has_dc_aliases) {
 		base = __ALIGN_MASK(base, shm_align_mask);
-		base += ((unsigned long)vdso_data - gic_size) & shm_align_mask;
+		base += ((unsigned long)vdso_k_time_data - gic_size) & shm_align_mask;
 	}
 
 	data_addr = base + gic_size;
-	vdso_addr = data_addr + PAGE_SIZE;
+	vdso_addr = data_addr + VDSO_NR_PAGES * PAGE_SIZE;
 
-	vma = _install_special_mapping(mm, base, vvar_size,
-				       VM_READ | VM_MAYREAD,
-				       &vdso_vvar_mapping);
+	vma = vdso_install_vvar_mapping(mm, data_addr);
 	if (IS_ERR(vma)) {
 		ret = PTR_ERR(vma);
 		goto out;
@@ -159,6 +144,17 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 	if (gic_size) {
 		gic_base = (unsigned long)mips_gic_base + MIPS_GIC_USER_OFS;
 		gic_pfn = PFN_DOWN(__pa(gic_base));
+		static const struct vm_special_mapping gic_mapping = {
+			.name	= "[gic]",
+			.pages	= (struct page **) { NULL },
+		};
+
+		vma = _install_special_mapping(mm, base, gic_size, VM_READ | VM_MAYREAD,
+					       &gic_mapping);
+		if (IS_ERR(vma)) {
+			ret = PTR_ERR(vma);
+			goto out;
+		}
 
 		ret = io_remap_pfn_range(vma, base, gic_pfn, gic_size,
 					 pgprot_noncached(vma->vm_page_prot));
@@ -166,13 +162,6 @@ int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
 			goto out;
 	}
 
-	/* Map data page. */
-	ret = remap_pfn_range(vma, data_addr,
-			      virt_to_phys(vdso_data) >> PAGE_SHIFT,
-			      PAGE_SIZE, vma->vm_page_prot);
-	if (ret)
-		goto out;
-
 	/* Map VDSO image. */
 	vma = _install_special_mapping(mm, vdso_addr, image->size,
 				       VM_READ | VM_EXEC |
diff --git a/arch/mips/vdso/vdso.lds.S b/arch/mips/vdso/vdso.lds.S
index 836465e3bcb8a15cb3f0f96d852d2b252c9d5e2a..c8bbe56d89cb095da21ac1f56d9999914defc305 100644
--- a/arch/mips/vdso/vdso.lds.S
+++ b/arch/mips/vdso/vdso.lds.S
@@ -5,6 +5,8 @@
  */
 
 #include <asm/sgidefs.h>
+#include <asm/vdso/vdso.h>
+#include <vdso/datapage.h>
 
 #if _MIPS_SIM == _MIPS_SIM_ABI64
 OUTPUT_FORMAT("elf64-tradlittlemips", "elf64-tradbigmips", "elf64-tradlittlemips")
@@ -18,7 +20,8 @@ OUTPUT_ARCH(mips)
 
 SECTIONS
 {
-	PROVIDE(_start = .);
+	VDSO_VVAR_SYMS
+
 	. = SIZEOF_HEADERS;
 
 	/*

-- 
2.47.1


