Return-Path: <linuxppc-dev+bounces-4995-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9B3A09542
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 16:25:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV56M3Rb9z3cWd;
	Sat, 11 Jan 2025 02:24:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736522651;
	cv=none; b=Zt7nvCUr1MlZlSYONOYRV3Elm1VU6tOieBzsooUMHDVcizLs+FQZAdKcEeAHWhiWvNHAiJuLmX6MKByzv9xuI9OdnFN+34SjCan5qRu+UClnK6Z/y4euHvUpGA/NnyW4lvzDUCqcysgR4V1s3AlkECt6F/JakYpFWKSvkmKwezg13UrOuXQTnsSbxRQZAtJAGAA/GUs2r1+KQQFL3/NmOGsk4vmSxj3F+5cptEyGxHne8nAZmWxdOP0RZqxixIsp7jhvy7zNKeYXTHZYxXsi2s+yf8z1PMtPdx0Nl/PXClzJ3Um1ij/aSkcNTo4nanRCBVrMEjPJ8FtNlH4l3RhHmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736522651; c=relaxed/relaxed;
	bh=D1piXW3sHE42TNgAJ6byri77KbUrjv62y2UKxXamt4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f1XGDwMWVZLY/dhV5CeYSu734LoNU6hRcOJVANg67M6HalpZXkbFSlbSe3O1w086gDswBgm3FSM1P1w3v4WSGoGl6F6fuvmP8zII7CaYKiXLf5BU2zaf1j4t5qlX5tNzDr5rtLAjgMGiylDGIaPPABD6rae2uy7vpQJcqsncutSxJ4qcpgyo3lp+f9yYJghQG4bl5SMtTMrCR4Hcz9mex9eMe1p6I/ML01TtEz7lz5c/zeq2nee9i37JioGKzg13UfSuKapvXZzE2Po6Yh5Q0QjMB2EBlCwjd9WaDADTW7hC/75HDpi/00OXawfvJ0Eizj5+vruv0HP9CFG4dlo5tg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GtTDzSF4; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ZRP08OYL; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GtTDzSF4;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ZRP08OYL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV56J3YBJz3cZm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 02:24:08 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1736522638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D1piXW3sHE42TNgAJ6byri77KbUrjv62y2UKxXamt4g=;
	b=GtTDzSF4b4dKjSFNhO4d8S8ESgZ/DaWVepEVXMQeP+XLvUp2t5KDzDARV/pQSz7QPA0GmE
	nw/Ix5KawSLOlMkbOLyHqXsTtABAVro/WSQBhRtKUt2oL62Q7LaSm4IjuMQK0IhGmE/EJb
	eyi7P46RzI0gQXNL2LjQ4GkWZYHgtqMUlM59hW5vuaQfaymqe//4LK89my9Va/TgWs+7zO
	VMFeDTbc/r8y2/rJ6pce0fms79foneyvGtlAdWMQw0oQNebCJx020CJY58IdYT2cRFtSE9
	TtnJBri1mqjvcbS1HZJqSHKmf8eiZIXd5LAsxYLQ9Fp8fpqSH7FjD/YrTpbGow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1736522638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D1piXW3sHE42TNgAJ6byri77KbUrjv62y2UKxXamt4g=;
	b=ZRP08OYLPTJ07IsHumm/88t7XPWGZFcySGgrPPS2Bj8INJ1VrSUhnFdaOobL2ZpiwZYvCy
	htyzI9xfPMzGw8AQ==
Date: Fri, 10 Jan 2025 16:23:51 +0100
Subject: [PATCH v2 12/18] s390/vdso: Switch to generic storage
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
Message-Id: <20250110-vdso-store-rng-v2-12-350c9179bbf1@linutronix.de>
References: <20250110-vdso-store-rng-v2-0-350c9179bbf1@linutronix.de>
In-Reply-To: <20250110-vdso-store-rng-v2-0-350c9179bbf1@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736522629; l=12301;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=vp+uhIivPPkSnLcsZtZW6jifZuFnu7mQSXAqMiwZw58=;
 b=5EVLQQ1NKPkV7tvYdwrCKPFiQgj2toVOZ9hzxFXfPOaH2CU9Zoba9Ohvyo0x4Fvt0YEdkmwMq
 bMIMi4//d1hCiph3rKYl7xl+7oe7GSMO53NaBG8wlmuHRf3RVtInIDM
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
Acked-by: Heiko Carstens <hca@linux.ibm.com>
---
 arch/s390/Kconfig                         |  1 +
 arch/s390/include/asm/vdso.h              |  4 +-
 arch/s390/include/asm/vdso/getrandom.h    | 12 ----
 arch/s390/include/asm/vdso/gettimeofday.h | 15 +----
 arch/s390/include/asm/vdso/vsyscall.h     | 20 -------
 arch/s390/kernel/time.c                   |  6 +-
 arch/s390/kernel/vdso.c                   | 97 ++-----------------------------
 arch/s390/kernel/vdso32/vdso32.lds.S      |  7 +--
 arch/s390/kernel/vdso64/vdso64.lds.S      |  8 +--
 9 files changed, 17 insertions(+), 153 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 0077969170e8b4ca4c99e87ec75f6ea94f3e8e00..6472eb4c210f378eaa61ddff04a6abc2f4aa2940 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -158,6 +158,7 @@ config S390
 	select GENERIC_PTDUMP
 	select GENERIC_SMP_IDLE_THREAD
 	select GENERIC_TIME_VSYSCALL
+	select GENERIC_VDSO_DATA_STORE
 	select GENERIC_VDSO_TIME_NS
 	select GENERIC_IOREMAP if PCI
 	select HAVE_ALIGNED_STRUCT_PAGE
diff --git a/arch/s390/include/asm/vdso.h b/arch/s390/include/asm/vdso.h
index 92c73e4d97a93a90cb640d44fca9856f93e0be14..420a073fdde5db92cfe84bb1f17a549f333f94e0 100644
--- a/arch/s390/include/asm/vdso.h
+++ b/arch/s390/include/asm/vdso.h
@@ -6,13 +6,11 @@
 
 #ifndef __ASSEMBLY__
 
-extern struct vdso_data *vdso_data;
-
 int vdso_getcpu_init(void);
 
 #endif /* __ASSEMBLY__ */
 
-#define __VVAR_PAGES	2
+#define __VDSO_PAGES	4
 
 #define VDSO_VERSION_STRING	LINUX_2.6.29
 
diff --git a/arch/s390/include/asm/vdso/getrandom.h b/arch/s390/include/asm/vdso/getrandom.h
index 36355af7160bee4f04f5177cfa21283699bee006..f8713ce39bb2f2081c3bb5a42eddccc3cddc40c8 100644
--- a/arch/s390/include/asm/vdso/getrandom.h
+++ b/arch/s390/include/asm/vdso/getrandom.h
@@ -23,18 +23,6 @@ static __always_inline ssize_t getrandom_syscall(void *buffer, size_t len, unsig
 	return syscall3(__NR_getrandom, (long)buffer, (long)len, (long)flags);
 }
 
-static __always_inline const struct vdso_rng_data *__arch_get_vdso_rng_data(void)
-{
-	/*
-	 * The RNG data is in the real VVAR data page, but if a task belongs to a time namespace
-	 * then VVAR_DATA_PAGE_OFFSET points to the namespace-specific VVAR page and VVAR_TIMENS_
-	 * PAGE_OFFSET points to the real VVAR page.
-	 */
-	if (IS_ENABLED(CONFIG_TIME_NS) && _vdso_data->clock_mode == VDSO_CLOCKMODE_TIMENS)
-		return (void *)&_vdso_rng_data + VVAR_TIMENS_PAGE_OFFSET * PAGE_SIZE;
-	return &_vdso_rng_data;
-}
-
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __ASM_VDSO_GETRANDOM_H */
diff --git a/arch/s390/include/asm/vdso/gettimeofday.h b/arch/s390/include/asm/vdso/gettimeofday.h
index 7937765ccfa5b222931591cc5388827e5f75d1b5..fb4564308e9d77a40f8d5059503519e9f5961f14 100644
--- a/arch/s390/include/asm/vdso/gettimeofday.h
+++ b/arch/s390/include/asm/vdso/gettimeofday.h
@@ -14,12 +14,7 @@
 #include <linux/compiler.h>
 
 
-static __always_inline const struct vdso_data *__arch_get_vdso_data(void)
-{
-	return _vdso_data;
-}
-
-static inline u64 __arch_get_hw_counter(s32 clock_mode, const struct vdso_data *vd)
+static inline u64 __arch_get_hw_counter(s32 clock_mode, const struct vdso_time_data *vd)
 {
 	u64 adj, now;
 
@@ -49,12 +44,4 @@ long clock_getres_fallback(clockid_t clkid, struct __kernel_timespec *ts)
 	return syscall2(__NR_clock_getres, (long)clkid, (long)ts);
 }
 
-#ifdef CONFIG_TIME_NS
-static __always_inline
-const struct vdso_data *__arch_get_timens_vdso_data(const struct vdso_data *vd)
-{
-	return _timens_data;
-}
-#endif
-
 #endif
diff --git a/arch/s390/include/asm/vdso/vsyscall.h b/arch/s390/include/asm/vdso/vsyscall.h
index 3eb576ecd3bd998daf9372a52befa8b76d52f2bf..d346ebe513015e767405452cd69495ae497c91ee 100644
--- a/arch/s390/include/asm/vdso/vsyscall.h
+++ b/arch/s390/include/asm/vdso/vsyscall.h
@@ -2,32 +2,12 @@
 #ifndef __ASM_VDSO_VSYSCALL_H
 #define __ASM_VDSO_VSYSCALL_H
 
-#define __VDSO_RND_DATA_OFFSET	768
-
 #ifndef __ASSEMBLY__
 
 #include <linux/hrtimer.h>
 #include <vdso/datapage.h>
 #include <asm/vdso.h>
 
-enum vvar_pages {
-	VVAR_DATA_PAGE_OFFSET,
-	VVAR_TIMENS_PAGE_OFFSET,
-	VVAR_NR_PAGES
-};
-
-static __always_inline struct vdso_data *__s390_get_k_vdso_data(void)
-{
-	return vdso_data;
-}
-#define __arch_get_k_vdso_data __s390_get_k_vdso_data
-
-static __always_inline struct vdso_rng_data *__s390_get_k_vdso_rnd_data(void)
-{
-	return (void *)vdso_data + __VDSO_RND_DATA_OFFSET;
-}
-#define __arch_get_k_vdso_rng_data __s390_get_k_vdso_rnd_data
-
 /* The asm-generic header needs to be included after the definitions above */
 #include <asm-generic/vdso/vsyscall.h>
 
diff --git a/arch/s390/kernel/time.c b/arch/s390/kernel/time.c
index 34a65c141ea076ba97b3238f1f36f077b15961df..a227621652ad682532cb2cc763f6cfe4368fe3d3 100644
--- a/arch/s390/kernel/time.c
+++ b/arch/s390/kernel/time.c
@@ -84,7 +84,7 @@ void __init time_early_init(void)
 	/* Initialize TOD steering parameters */
 	tod_steering_end = tod_clock_base.tod;
 	for (cs = 0; cs < CS_BASES; cs++)
-		vdso_data[cs].arch_data.tod_steering_end = tod_steering_end;
+		vdso_k_time_data[cs].arch_data.tod_steering_end = tod_steering_end;
 
 	if (!test_facility(28))
 		return;
@@ -390,8 +390,8 @@ static void clock_sync_global(long delta)
 		      tod_steering_delta);
 	tod_steering_end = now + (abs(tod_steering_delta) << 15);
 	for (cs = 0; cs < CS_BASES; cs++) {
-		vdso_data[cs].arch_data.tod_steering_end = tod_steering_end;
-		vdso_data[cs].arch_data.tod_steering_delta = tod_steering_delta;
+		vdso_k_time_data[cs].arch_data.tod_steering_end = tod_steering_end;
+		vdso_k_time_data[cs].arch_data.tod_steering_delta = tod_steering_delta;
 	}
 
 	/* Update LPAR offset. */
diff --git a/arch/s390/kernel/vdso.c b/arch/s390/kernel/vdso.c
index 598b512cde012b1857c748042ceeea65b54cb92f..70c8f9ad13cde96f0f307213bacb671b818f628b 100644
--- a/arch/s390/kernel/vdso.c
+++ b/arch/s390/kernel/vdso.c
@@ -16,8 +16,8 @@
 #include <linux/mm.h>
 #include <linux/slab.h>
 #include <linux/smp.h>
-#include <linux/time_namespace.h>
 #include <linux/random.h>
+#include <linux/vdso_datastore.h>
 #include <vdso/datapage.h>
 #include <asm/vdso/vsyscall.h>
 #include <asm/alternative.h>
@@ -26,85 +26,6 @@
 extern char vdso64_start[], vdso64_end[];
 extern char vdso32_start[], vdso32_end[];
 
-static struct vm_special_mapping vvar_mapping;
-
-static union vdso_data_store vdso_data_store __page_aligned_data;
-
-struct vdso_data *vdso_data = vdso_data_store.data;
-
-#ifdef CONFIG_TIME_NS
-struct vdso_data *arch_get_vdso_data(void *vvar_page)
-{
-	return (struct vdso_data *)(vvar_page);
-}
-
-/*
- * The VVAR page layout depends on whether a task belongs to the root or
- * non-root time namespace. Whenever a task changes its namespace, the VVAR
- * page tables are cleared and then they will be re-faulted with a
- * corresponding layout.
- * See also the comment near timens_setup_vdso_data() for details.
- */
-int vdso_join_timens(struct task_struct *task, struct time_namespace *ns)
-{
-	struct mm_struct *mm = task->mm;
-	VMA_ITERATOR(vmi, mm, 0);
-	struct vm_area_struct *vma;
-
-	mmap_read_lock(mm);
-	for_each_vma(vmi, vma) {
-		if (!vma_is_special_mapping(vma, &vvar_mapping))
-			continue;
-		zap_vma_pages(vma);
-		break;
-	}
-	mmap_read_unlock(mm);
-	return 0;
-}
-#endif
-
-static vm_fault_t vvar_fault(const struct vm_special_mapping *sm,
-			     struct vm_area_struct *vma, struct vm_fault *vmf)
-{
-	struct page *timens_page = find_timens_vvar_page(vma);
-	unsigned long addr, pfn;
-	vm_fault_t err;
-
-	switch (vmf->pgoff) {
-	case VVAR_DATA_PAGE_OFFSET:
-		pfn = virt_to_pfn(vdso_data);
-		if (timens_page) {
-			/*
-			 * Fault in VVAR page too, since it will be accessed
-			 * to get clock data anyway.
-			 */
-			addr = vmf->address + VVAR_TIMENS_PAGE_OFFSET * PAGE_SIZE;
-			err = vmf_insert_pfn(vma, addr, pfn);
-			if (unlikely(err & VM_FAULT_ERROR))
-				return err;
-			pfn = page_to_pfn(timens_page);
-		}
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
-		pfn = virt_to_pfn(vdso_data);
-		break;
-#endif /* CONFIG_TIME_NS */
-	default:
-		return VM_FAULT_SIGBUS;
-	}
-	return vmf_insert_pfn(vma, vmf->address, pfn);
-}
-
 static int vdso_mremap(const struct vm_special_mapping *sm,
 		       struct vm_area_struct *vma)
 {
@@ -112,11 +33,6 @@ static int vdso_mremap(const struct vm_special_mapping *sm,
 	return 0;
 }
 
-static struct vm_special_mapping vvar_mapping = {
-	.name = "[vvar]",
-	.fault = vvar_fault,
-};
-
 static struct vm_special_mapping vdso64_mapping = {
 	.name = "[vdso]",
 	.mremap = vdso_mremap,
@@ -142,7 +58,7 @@ static int map_vdso(unsigned long addr, unsigned long vdso_mapping_len)
 	struct vm_area_struct *vma;
 	int rc;
 
-	BUILD_BUG_ON(VVAR_NR_PAGES != __VVAR_PAGES);
+	BUILD_BUG_ON(VDSO_NR_PAGES != __VDSO_PAGES);
 	if (mmap_write_lock_killable(mm))
 		return -EINTR;
 
@@ -157,14 +73,11 @@ static int map_vdso(unsigned long addr, unsigned long vdso_mapping_len)
 	rc = vvar_start;
 	if (IS_ERR_VALUE(vvar_start))
 		goto out;
-	vma = _install_special_mapping(mm, vvar_start, VVAR_NR_PAGES*PAGE_SIZE,
-				       VM_READ|VM_MAYREAD|VM_IO|VM_DONTDUMP|
-				       VM_PFNMAP,
-				       &vvar_mapping);
+	vma = vdso_install_vvar_mapping(mm, vvar_start);
 	rc = PTR_ERR(vma);
 	if (IS_ERR(vma))
 		goto out;
-	vdso_text_start = vvar_start + VVAR_NR_PAGES * PAGE_SIZE;
+	vdso_text_start = vvar_start + VDSO_NR_PAGES * PAGE_SIZE;
 	/* VM_MAYWRITE for COW so gdb can set breakpoints */
 	vma = _install_special_mapping(mm, vdso_text_start, vdso_text_len,
 				       VM_READ|VM_EXEC|
@@ -220,7 +133,7 @@ unsigned long vdso_text_size(void)
 
 unsigned long vdso_size(void)
 {
-	return vdso_text_size() + VVAR_NR_PAGES * PAGE_SIZE;
+	return vdso_text_size() + VDSO_NR_PAGES * PAGE_SIZE;
 }
 
 int arch_setup_additional_pages(struct linux_binprm *bprm, int uses_interp)
diff --git a/arch/s390/kernel/vdso32/vdso32.lds.S b/arch/s390/kernel/vdso32/vdso32.lds.S
index c916c4f73f766ebcc9328b189e46015e67393b0d..9630d58c20806b51f3a2f3b59a53409ad6d3508f 100644
--- a/arch/s390/kernel/vdso32/vdso32.lds.S
+++ b/arch/s390/kernel/vdso32/vdso32.lds.S
@@ -6,16 +6,15 @@
 
 #include <asm/page.h>
 #include <asm/vdso.h>
+#include <vdso/datapage.h>
 
 OUTPUT_FORMAT("elf32-s390", "elf32-s390", "elf32-s390")
 OUTPUT_ARCH(s390:31-bit)
 
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
diff --git a/arch/s390/kernel/vdso64/vdso64.lds.S b/arch/s390/kernel/vdso64/vdso64.lds.S
index ec42b7d9cb53094b783c6b0492962af7e5027831..e4f6551ae898881baff6d37701a9d8d9188a52cc 100644
--- a/arch/s390/kernel/vdso64/vdso64.lds.S
+++ b/arch/s390/kernel/vdso64/vdso64.lds.S
@@ -7,17 +7,15 @@
 #include <asm/vdso/vsyscall.h>
 #include <asm/page.h>
 #include <asm/vdso.h>
+#include <vdso/datapage.h>
 
 OUTPUT_FORMAT("elf64-s390", "elf64-s390", "elf64-s390")
 OUTPUT_ARCH(s390:64-bit)
 
 SECTIONS
 {
-	PROVIDE(_vdso_data = . - __VVAR_PAGES * PAGE_SIZE);
-	PROVIDE(_vdso_rng_data = _vdso_data + __VDSO_RND_DATA_OFFSET);
-#ifdef CONFIG_TIME_NS
-	PROVIDE(_timens_data = _vdso_data + PAGE_SIZE);
-#endif
+	VDSO_VVAR_SYMS
+
 	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text

-- 
2.47.1


