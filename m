Return-Path: <linuxppc-dev+bounces-4186-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BF79F3265
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 15:11:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBhgX63jFz30B8;
	Tue, 17 Dec 2024 01:11:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734358264;
	cv=none; b=VSHNqvGzhIe/E8EsZ+GymfGCjdLYBZlmhfjoNrvYcQZwlPyXr+8lXwERpDKuc09eoU3X3IZPQ45HIBb1b1tlz48Ib9hPZbLEqabOhgUKg66lGd+zO6V66zevlFr03VN/rMwlTzsrqne3t95OTMCcsdJHnV9F9jC0lOJiDu5PPePDf3YRUuCK5N6rXSXQZa8QnpFF2+bYHHPukMZinYsmYwl7vYW/0qOop90hgv2UOgNqztyKgeW3krpaQhBX2tM1kJENbPh0TaPBLciisvwd//fJaj17AStgl40QjgQft50nelS2PF9DWF7v8c+fEKLliICLsaisVzXPcdHTeuNeWg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734358264; c=relaxed/relaxed;
	bh=/bKUAKdiyE5B5TxATK+HfK7zbKC5qK2ju2DbW26tMek=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hssSEbnmbEgOv1ewnaAnj5khpDBwHWQEY/FoNveBE1V+WCVUULjKwTNXIOQr//7mYDGs73MoMUcACmIhW1iZRVNxh3E2gLh2BXAroc9a9eFWUMO/wEaCRaZZN1Evd/x9C4UPT9oSCI9066nby4ut1cQAyTNN8wTBE9u+w/7oGXOu7yD77EkP2BENkdY8jI7zYfxoh1Jk3rzSR1QK62y6W03UGThQ/fxpwWsGdyFGwxeZRCHnB+tNQpjEFlJ0pYN/LGeQd3n+Z8Q9OODxLiOO92p0VdjoZVxYjUWGT3/yx322tJxDN3pVwyCOcDY/Xu6mnZsR9fJ5wSxWfhy0h18/Kg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=AfHaF4tC; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VqRT1Haj; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=AfHaF4tC;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VqRT1Haj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBhgV1rZ9z3057
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 01:11:01 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734358256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/bKUAKdiyE5B5TxATK+HfK7zbKC5qK2ju2DbW26tMek=;
	b=AfHaF4tCN5MhcACbPT/fRQbKl1l3gTdc5zqFwLiRAD8i2r5be3MDs/siIVy4RDKog8b/ev
	fT3jAjxRIwe957Gregm3bjgwCUHbaVTsNe4l/a0Bpm71oWLfa4y2T1ygOrtQ8UDBRQIT2S
	rOvS26OZRP//ezC1mTgp0roI1AVGbvsjLpgd+vaYf6O2sQYIIceRG6g4a2lfhIFsP8VPMf
	wa6RRtxYH1flekBW1sn59wfDsdbCicO0BXIvljdtA57xgxljNF1nIwyfbLslWujk+wWPHi
	eucRLWloqKvACZsBvF0m4lLO5nQzBnsuN6cNjj9lWENtQuU+GWW2HDp8g6thvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734358256;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/bKUAKdiyE5B5TxATK+HfK7zbKC5qK2ju2DbW26tMek=;
	b=VqRT1HajGOjYV2pZarVPRCzEG0eU8cHWJ1Z4IDcp07PbAukgjdLK+5GFB9yitvSDi1myRW
	o37htclZdgm9SMDg==
Date: Mon, 16 Dec 2024 15:10:05 +0100
Subject: [PATCH 09/17] arm: vdso: Switch to generic storage implementation
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
Message-Id: <20241216-vdso-store-rng-v1-9-f7aed1bdb3b2@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734358247; l=7512;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=HrTtVqV5ORDsmewb36kOjAbXLH6dITqawQgPvcRxS3Y=;
 b=T1SrlvZt5mAo3iZC2TeSsQDkcYQbh8jiLqZIQKw6tEvI8nIawuG/Y2TTBjkqLarvKu+5FV8I7
 Fmp4PQlYtVwA5knhagwA+4iV8RlAHCDcHzNpmL7OuASFttEOEqGs5T4
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
 arch/arm/include/asm/vdso.h              |  2 ++
 arch/arm/include/asm/vdso/gettimeofday.h |  7 +------
 arch/arm/include/asm/vdso/vsyscall.h     | 12 ++---------
 arch/arm/kernel/asm-offsets.c            |  4 ----
 arch/arm/kernel/vdso.c                   | 34 +++++++-------------------------
 arch/arm/mm/Kconfig                      |  1 +
 arch/arm/vdso/vdso.lds.S                 |  4 ++--
 7 files changed, 15 insertions(+), 49 deletions(-)

diff --git a/arch/arm/include/asm/vdso.h b/arch/arm/include/asm/vdso.h
index 5b85889f82eeb422400c039e8b5e8a2a6d4553b3..88364a6727ffce224edd35dd62db1693ae5fcb1c 100644
--- a/arch/arm/include/asm/vdso.h
+++ b/arch/arm/include/asm/vdso.h
@@ -4,6 +4,8 @@
 
 #ifdef __KERNEL__
 
+#define __VDSO_PAGES	4
+
 #ifndef __ASSEMBLY__
 
 struct mm_struct;
diff --git a/arch/arm/include/asm/vdso/gettimeofday.h b/arch/arm/include/asm/vdso/gettimeofday.h
index 592d3d015ca7298b3bc35871387dbb3e7f819827..1e9f81639c88cc23cae7cf267bf4674c6d6acec0 100644
--- a/arch/arm/include/asm/vdso/gettimeofday.h
+++ b/arch/arm/include/asm/vdso/gettimeofday.h
@@ -112,7 +112,7 @@ static inline bool arm_vdso_hres_capable(void)
 #define __arch_vdso_hres_capable arm_vdso_hres_capable
 
 static __always_inline u64 __arch_get_hw_counter(int clock_mode,
-						 const struct vdso_data *vd)
+						 const struct vdso_time_data *vd)
 {
 #ifdef CONFIG_ARM_ARCH_TIMER
 	u64 cycle_now;
@@ -135,11 +135,6 @@ static __always_inline u64 __arch_get_hw_counter(int clock_mode,
 #endif
 }
 
-static __always_inline const struct vdso_data *__arch_get_vdso_data(void)
-{
-	return _vdso_data;
-}
-
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __ASM_VDSO_GETTIMEOFDAY_H */
diff --git a/arch/arm/include/asm/vdso/vsyscall.h b/arch/arm/include/asm/vdso/vsyscall.h
index 705414710dcdbfa9a97c344806bd079c08368801..6fe8f7113e9e533a8b7582f71611372c8db3b11f 100644
--- a/arch/arm/include/asm/vdso/vsyscall.h
+++ b/arch/arm/include/asm/vdso/vsyscall.h
@@ -7,22 +7,14 @@
 #include <vdso/datapage.h>
 #include <asm/cacheflush.h>
 
-extern struct vdso_data *vdso_data;
 extern bool cntvct_ok;
 
 static __always_inline
-struct vdso_data *__arm_get_k_vdso_data(void)
-{
-	return vdso_data;
-}
-#define __arch_get_k_vdso_data __arm_get_k_vdso_data
-
-static __always_inline
-void __arm_sync_vdso_data(struct vdso_data *vdata)
+void __arm_sync_vdso_time_data(struct vdso_time_data *vdata)
 {
 	flush_dcache_page(virt_to_page(vdata));
 }
-#define __arch_sync_vdso_data __arm_sync_vdso_data
+#define __arch_sync_vdso_data __arm_sync_vdso_time_data
 
 /* The asm-generic header needs to be included after the definitions above */
 #include <asm-generic/vdso/vsyscall.h>
diff --git a/arch/arm/kernel/asm-offsets.c b/arch/arm/kernel/asm-offsets.c
index 4853875740d0fe61c6bbc32ddd9a16fa8d1fb530..123f4a8ef44660a39c4eff2a6e5fd86cb48fb572 100644
--- a/arch/arm/kernel/asm-offsets.c
+++ b/arch/arm/kernel/asm-offsets.c
@@ -153,10 +153,6 @@ int main(void)
   DEFINE(CACHE_WRITEBACK_ORDER, __CACHE_WRITEBACK_ORDER);
   DEFINE(CACHE_WRITEBACK_GRANULE, __CACHE_WRITEBACK_GRANULE);
   BLANK();
-#ifdef CONFIG_VDSO
-  DEFINE(VDSO_DATA_SIZE,	sizeof(union vdso_data_store));
-#endif
-  BLANK();
 #ifdef CONFIG_ARM_MPU
   DEFINE(MPU_RNG_INFO_RNGS,	offsetof(struct mpu_rgn_info, rgns));
   DEFINE(MPU_RNG_INFO_USED,	offsetof(struct mpu_rgn_info, used));
diff --git a/arch/arm/kernel/vdso.c b/arch/arm/kernel/vdso.c
index 29dd2f3c62fec64c7f290468421bfad1e739c667..325448ffbba0c29895ea5d97e60d6f51e552cb2e 100644
--- a/arch/arm/kernel/vdso.c
+++ b/arch/arm/kernel/vdso.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/cache.h>
+#include <linux/vdso_datastore.h>
 #include <linux/elf.h>
 #include <linux/err.h>
 #include <linux/kernel.h>
@@ -33,15 +34,6 @@ extern char vdso_start[], vdso_end[];
 /* Total number of pages needed for the data and text portions of the VDSO. */
 unsigned int vdso_total_pages __ro_after_init;
 
-static union vdso_data_store vdso_data_store __page_aligned_data;
-struct vdso_data *vdso_data = vdso_data_store.data;
-
-static struct page *vdso_data_page __ro_after_init;
-static const struct vm_special_mapping vdso_data_mapping = {
-	.name = "[vvar]",
-	.pages = &vdso_data_page,
-};
-
 static int vdso_mremap(const struct vm_special_mapping *sm,
 		struct vm_area_struct *new_vma)
 {
@@ -192,9 +184,6 @@ static int __init vdso_init(void)
 	if (vdso_text_pagelist == NULL)
 		return -ENOMEM;
 
-	/* Grab the VDSO data page. */
-	vdso_data_page = virt_to_page(vdso_data);
-
 	/* Grab the VDSO text pages. */
 	for (i = 0; i < text_pages; i++) {
 		struct page *page;
@@ -205,7 +194,7 @@ static int __init vdso_init(void)
 
 	vdso_text_mapping.pages = vdso_text_pagelist;
 
-	vdso_total_pages = 1; /* for the data/vvar page */
+	vdso_total_pages = VDSO_NR_PAGES; /* for the data/vvar pages */
 	vdso_total_pages += text_pages;
 
 	cntvct_ok = cntvct_functional();
@@ -216,16 +205,7 @@ static int __init vdso_init(void)
 }
 arch_initcall(vdso_init);
 
-static int install_vvar(struct mm_struct *mm, unsigned long addr)
-{
-	struct vm_area_struct *vma;
-
-	vma = _install_special_mapping(mm, addr, PAGE_SIZE,
-				       VM_READ | VM_MAYREAD,
-				       &vdso_data_mapping);
-
-	return PTR_ERR_OR_ZERO(vma);
-}
+static_assert(__VDSO_PAGES == VDSO_NR_PAGES);
 
 /* assumes mmap_lock is write-locked */
 void arm_install_vdso(struct mm_struct *mm, unsigned long addr)
@@ -238,12 +218,12 @@ void arm_install_vdso(struct mm_struct *mm, unsigned long addr)
 	if (vdso_text_pagelist == NULL)
 		return;
 
-	if (install_vvar(mm, addr))
+	if (IS_ERR(vdso_install_vvar_mapping(mm, addr)))
 		return;
 
-	/* Account for vvar page. */
-	addr += PAGE_SIZE;
-	len = (vdso_total_pages - 1) << PAGE_SHIFT;
+	/* Account for vvar pages. */
+	addr += VDSO_NR_PAGES * PAGE_SIZE;
+	len = (vdso_total_pages - VDSO_NR_PAGES) << PAGE_SHIFT;
 
 	vma = _install_special_mapping(mm, addr, len,
 		VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC,
diff --git a/arch/arm/mm/Kconfig b/arch/arm/mm/Kconfig
index 2b6f50dd547840adecbe08e684ed8f1a032cd7c2..5c1023a6d78c1b4db67b2d62b71af5a79b7e701f 100644
--- a/arch/arm/mm/Kconfig
+++ b/arch/arm/mm/Kconfig
@@ -928,6 +928,7 @@ config VDSO
 	select GENERIC_TIME_VSYSCALL
 	select GENERIC_VDSO_32
 	select GENERIC_GETTIMEOFDAY
+	select GENERIC_VDSO_DATA_STORE
 	help
 	  Place in the process address space an ELF shared object
 	  providing fast implementations of gettimeofday and
diff --git a/arch/arm/vdso/vdso.lds.S b/arch/arm/vdso/vdso.lds.S
index 9bfa0f52923c851b6b9e96d4dbb51eb3d5d0960a..7c08371f440027f9a52e9fffae530d7db05b7c43 100644
--- a/arch/arm/vdso/vdso.lds.S
+++ b/arch/arm/vdso/vdso.lds.S
@@ -11,16 +11,16 @@
  */
 
 #include <linux/const.h>
-#include <asm/asm-offsets.h>
 #include <asm/page.h>
 #include <asm/vdso.h>
+#include <vdso/datapage.h>
 
 OUTPUT_FORMAT("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
 OUTPUT_ARCH(arm)
 
 SECTIONS
 {
-	PROVIDE(_vdso_data = . - VDSO_DATA_SIZE);
+	VDSO_VVAR_SYMS
 
 	. = SIZEOF_HEADERS;
 

-- 
2.47.1


