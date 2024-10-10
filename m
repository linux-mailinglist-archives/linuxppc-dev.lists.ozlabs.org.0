Return-Path: <linuxppc-dev+bounces-1923-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0B0997E14
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:02:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKV2Mp2z3bmQ;
	Thu, 10 Oct 2024 18:02:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543726;
	cv=none; b=JdY9WkDWD7o6Nfg5/cm7Cd5l0sJRkYqKeRLM42sVYKDTa3VrWoAdxkYNVXtmtdJwywnLyWN12kPYrP2GqGk80lLaCAflp31ftN7bcgAQWpdtm5vkpym7ZMBGcbFx8mZ2LR9YgXtYmcag/E2X+PR7v2cuW6L+6ofwbCwT0UZEvW2n756FE2k0zGQ4xhdhUCCB7lzVNve0IB9XwTB+fCY/PqOTOvNvtw/M1MGjEPrVJFNslNzbFUHADG+82hE5I6kQamenA2CoLZ7Peb6jOZYstXFVvP7v8w8Yg528cenaI+7U3yR6NWUUHzKmmTM+dfjjutZBucM07PI2cPJvRqVTXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543726; c=relaxed/relaxed;
	bh=5QoykicB/pAh/WSOb4eQdzQd/jzD7GA4wfDL7Av/TrM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XZbsbN//NEGwBXCbqnTIXfF2j6RX3InwfjNLtKAo57SC1vfQEhMFYP7LFZz0GOR4FRKD0jQrKOK1jhI3g4qZCDJt9kWEiG8b1XSAYQQFqneKEhpE5fH4VhvvGAdaIV5nuRntmUeeYfX1pOqbnCBVntaZr5pJkpUaX9ITiYOYOdg39kf0Dnh9+Jq1ekOuPKOMHNeeAK9oA/aSBgS/YnDDbSab+b0sCUz4uI5PXWeSZqgj218WJDcu8l8ZRv8wspEUa7u/+FLuApPcj6uh02JrKNOYoUX7Ng+Y5bHy6FQENHDOPS6Jhk8g9bVjskiwARzWb+L4s8q2C77P+eGOPRvNng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=e32aOafG; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6gwIvm56; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=e32aOafG;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=6gwIvm56;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKS0Bs4z3blk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:03 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5QoykicB/pAh/WSOb4eQdzQd/jzD7GA4wfDL7Av/TrM=;
	b=e32aOafGUV3qPSxsHc4MOlWHOoSRuy5MHPaiiwdxyEOSqgalKHpV/FLREKAfQCD77ciEcs
	Z+KA3qGl6+HcWMbQ75CkMzw8UbcBNfSIM6dwEBLdT4bROdXcYWdDhXvNyNGfSY/zRZdXWj
	IiProyjwiEn3puxTn2AWPvedH7UixukhMQZ4cWltOozutek2oCr9fVZj3xOILlVqeOXDAs
	E3gXbcYVSkWe00jC37UHlOkVl0sJ6j7acVEmMbaA9qkR21EAeN13Le7bdqnH5j6LOZQAR7
	v4frwzYEWuYMAgNJI2pUrRGFctvbZf5ag4iiP4FugdrwjlSE4fscFvmN1yvIdg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543720;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5QoykicB/pAh/WSOb4eQdzQd/jzD7GA4wfDL7Av/TrM=;
	b=6gwIvm56W4mNkn7pBVAqXHfHG8aDH4nd00hqpNp+F1fYGlS9aSGOpC93tvM+BvqDr+cCy8
	vhgScBZxsp5KEmCw==
Date: Thu, 10 Oct 2024 09:01:03 +0200
Subject: [PATCH 01/28] csky/vdso: Remove gettimeofday() and friends from
 VDSO
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-1-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=11287;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=VBaW+/YvBX8BFv0BvuAYwZnGx2U3ax0iqj0xx1funhA=;
 b=QubHXxNzWnFKJVh0Vbyda7ltPGIY+C0zBzJ5tqLCuCQGnBgIgvER4juNzOrKeY/sU6Z+NDqA+
 oohYqkPWX5oCv+MC7Y4LsGo5ore38WDrbqgQmjkVDa+Qw9AiWsDSUYl
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The time-related VDSO functionality was introduced in 2021 in
commit 87f3248cdb9a ("csky: Reconstruct VDSO framework") and
commit 0d3b051adbb7 ("csky: Add VDSO with GENERIC_GETTIMEOFDAY, GENERIC_TIME_VSYSCALL, HAVE_GENERIC_VDSO").

However the corresponding aux-vector entry AT_SYSINFO_EHDR was never
wired up, making these functions impossible to test or use.

The VDSO itself is kept as it also provides rt_sigreturn which is
exposed differently to userspace.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/csky/Kconfig                         |   4 --
 arch/csky/include/asm/vdso/clocksource.h  |   9 ---
 arch/csky/include/asm/vdso/gettimeofday.h | 114 ------------------------------
 arch/csky/include/asm/vdso/processor.h    |  12 ----
 arch/csky/include/asm/vdso/vsyscall.h     |  22 ------
 arch/csky/kernel/vdso.c                   |  24 +------
 arch/csky/kernel/vdso/Makefile            |   1 -
 arch/csky/kernel/vdso/vdso.lds.S          |   4 --
 arch/csky/kernel/vdso/vgettimeofday.c     |  30 --------
 9 files changed, 2 insertions(+), 218 deletions(-)

diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index 5479707eb5d10df1e083c9c7c547c266b64f4232..acc431c331b08eca0c853e96ead44478d99257dd 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -64,9 +64,6 @@ config CSKY
 	select GENERIC_IRQ_MULTI_HANDLER
 	select GENERIC_SCHED_CLOCK
 	select GENERIC_SMP_IDLE_THREAD
-	select GENERIC_TIME_VSYSCALL
-	select GENERIC_VDSO_32
-	select GENERIC_GETTIMEOFDAY
 	select GX6605S_TIMER if CPU_CK610
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_AUDITSYSCALL
@@ -80,7 +77,6 @@ config CSKY
 	select HAVE_DEBUG_KMEMLEAK
 	select HAVE_DYNAMIC_FTRACE
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS
-	select HAVE_GENERIC_VDSO
 	select HAVE_FUNCTION_TRACER
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_ERROR_INJECTION
diff --git a/arch/csky/include/asm/vdso/clocksource.h b/arch/csky/include/asm/vdso/clocksource.h
deleted file mode 100644
index dfca7b4724b798ea0e0f05ea7559a4570f8fa5f7..0000000000000000000000000000000000000000
--- a/arch/csky/include/asm/vdso/clocksource.h
+++ /dev/null
@@ -1,9 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef __ASM_VDSO_CSKY_CLOCKSOURCE_H
-#define __ASM_VDSO_CSKY_CLOCKSOURCE_H
-
-#define VDSO_ARCH_CLOCKMODES	\
-	VDSO_CLOCKMODE_ARCHTIMER
-
-#endif /* __ASM_VDSO_CSKY_CLOCKSOURCE_H */
diff --git a/arch/csky/include/asm/vdso/gettimeofday.h b/arch/csky/include/asm/vdso/gettimeofday.h
deleted file mode 100644
index 6c4f1446944f94dc3f02a193260998231edea566..0000000000000000000000000000000000000000
--- a/arch/csky/include/asm/vdso/gettimeofday.h
+++ /dev/null
@@ -1,114 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef __ASM_VDSO_CSKY_GETTIMEOFDAY_H
-#define __ASM_VDSO_CSKY_GETTIMEOFDAY_H
-
-#ifndef __ASSEMBLY__
-
-#include <asm/barrier.h>
-#include <asm/unistd.h>
-#include <abi/regdef.h>
-#include <uapi/linux/time.h>
-
-#define VDSO_HAS_CLOCK_GETRES	1
-
-static __always_inline
-int gettimeofday_fallback(struct __kernel_old_timeval *_tv,
-			  struct timezone *_tz)
-{
-	register struct __kernel_old_timeval *tv asm("a0") = _tv;
-	register struct timezone *tz asm("a1") = _tz;
-	register long ret asm("a0");
-	register long nr asm(syscallid) = __NR_gettimeofday;
-
-	asm volatile ("trap 0\n"
-		      : "=r" (ret)
-		      : "r"(tv), "r"(tz), "r"(nr)
-		      : "memory");
-
-	return ret;
-}
-
-static __always_inline
-long clock_gettime_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
-{
-	register clockid_t clkid asm("a0") = _clkid;
-	register struct __kernel_timespec *ts asm("a1") = _ts;
-	register long ret asm("a0");
-	register long nr asm(syscallid) = __NR_clock_gettime64;
-
-	asm volatile ("trap 0\n"
-		      : "=r" (ret)
-		      : "r"(clkid), "r"(ts), "r"(nr)
-		      : "memory");
-
-	return ret;
-}
-
-static __always_inline
-long clock_gettime32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
-{
-	register clockid_t clkid asm("a0") = _clkid;
-	register struct old_timespec32 *ts asm("a1") = _ts;
-	register long ret asm("a0");
-	register long nr asm(syscallid) = __NR_clock_gettime;
-
-	asm volatile ("trap 0\n"
-		      : "=r" (ret)
-		      : "r"(clkid), "r"(ts), "r"(nr)
-		      : "memory");
-
-	return ret;
-}
-
-static __always_inline
-int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
-{
-	register clockid_t clkid asm("a0") = _clkid;
-	register struct __kernel_timespec *ts asm("a1") = _ts;
-	register long ret asm("a0");
-	register long nr asm(syscallid) = __NR_clock_getres_time64;
-
-	asm volatile ("trap 0\n"
-		      : "=r" (ret)
-		      : "r"(clkid), "r"(ts), "r"(nr)
-		      : "memory");
-
-	return ret;
-}
-
-static __always_inline
-int clock_getres32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
-{
-	register clockid_t clkid asm("a0") = _clkid;
-	register struct old_timespec32 *ts asm("a1") = _ts;
-	register long ret asm("a0");
-	register long nr asm(syscallid) = __NR_clock_getres;
-
-	asm volatile ("trap 0\n"
-		      : "=r" (ret)
-		      : "r"(clkid), "r"(ts), "r"(nr)
-		      : "memory");
-
-	return ret;
-}
-
-uint64_t csky_pmu_read_cc(void);
-static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
-						 const struct vdso_data *vd)
-{
-#ifdef CONFIG_CSKY_PMU_V1
-	return csky_pmu_read_cc();
-#else
-	return 0;
-#endif
-}
-
-static __always_inline const struct vdso_data *__arch_get_vdso_data(void)
-{
-	return _vdso_data;
-}
-
-#endif /* !__ASSEMBLY__ */
-
-#endif /* __ASM_VDSO_CSKY_GETTIMEOFDAY_H */
diff --git a/arch/csky/include/asm/vdso/processor.h b/arch/csky/include/asm/vdso/processor.h
deleted file mode 100644
index 39a6b561d0cc846cfb39a962c17e46104ae04807..0000000000000000000000000000000000000000
--- a/arch/csky/include/asm/vdso/processor.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-
-#ifndef __ASM_VDSO_CSKY_PROCESSOR_H
-#define __ASM_VDSO_CSKY_PROCESSOR_H
-
-#ifndef __ASSEMBLY__
-
-#define cpu_relax()	barrier()
-
-#endif /* __ASSEMBLY__ */
-
-#endif /* __ASM_VDSO_CSKY_PROCESSOR_H */
diff --git a/arch/csky/include/asm/vdso/vsyscall.h b/arch/csky/include/asm/vdso/vsyscall.h
deleted file mode 100644
index c276211a7c4d56c48c0330e309c6e5a5c5c09dc9..0000000000000000000000000000000000000000
--- a/arch/csky/include/asm/vdso/vsyscall.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-
-#ifndef __ASM_VDSO_CSKY_VSYSCALL_H
-#define __ASM_VDSO_CSKY_VSYSCALL_H
-
-#ifndef __ASSEMBLY__
-
-#include <vdso/datapage.h>
-
-extern struct vdso_data *vdso_data;
-
-static __always_inline struct vdso_data *__csky_get_k_vdso_data(void)
-{
-	return vdso_data;
-}
-#define __arch_get_k_vdso_data __csky_get_k_vdso_data
-
-#include <asm-generic/vdso/vsyscall.h>
-
-#endif /* !__ASSEMBLY__ */
-
-#endif /* __ASM_VDSO_CSKY_VSYSCALL_H */
diff --git a/arch/csky/kernel/vdso.c b/arch/csky/kernel/vdso.c
index 5c9ef63c29f1d92570dbeba1249f04c267c5ff49..92ab8ac6a5960e30b660530ae9b10137d5872369 100644
--- a/arch/csky/kernel/vdso.c
+++ b/arch/csky/kernel/vdso.c
@@ -8,23 +8,19 @@
 #include <linux/slab.h>
 
 #include <asm/page.h>
-#include <vdso/datapage.h>
 
 extern char vdso_start[], vdso_end[];
 
 static unsigned int vdso_pages;
 static struct page **vdso_pagelist;
 
-static union vdso_data_store vdso_data_store __page_aligned_data;
-struct vdso_data *vdso_data = vdso_data_store.data;
-
 static int __init vdso_init(void)
 {
 	unsigned int i;
 
 	vdso_pages = (vdso_end - vdso_start) >> PAGE_SHIFT;
 	vdso_pagelist =
-		kcalloc(vdso_pages + 1, sizeof(struct page *), GFP_KERNEL);
+		kcalloc(vdso_pages, sizeof(struct page *), GFP_KERNEL);
 	if (unlikely(vdso_pagelist == NULL)) {
 		pr_err("vdso: pagelist allocation failed\n");
 		return -ENOMEM;
@@ -36,7 +32,6 @@ static int __init vdso_init(void)
 		pg = virt_to_page(vdso_start + (i << PAGE_SHIFT));
 		vdso_pagelist[i] = pg;
 	}
-	vdso_pagelist[i] = virt_to_page(vdso_data);
 
 	return 0;
 }
@@ -52,11 +47,8 @@ int arch_setup_additional_pages(struct linux_binprm *bprm,
 	static struct vm_special_mapping vdso_mapping = {
 		.name = "[vdso]",
 	};
-	static struct vm_special_mapping vvar_mapping = {
-		.name = "[vvar]",
-	};
 
-	vdso_len = (vdso_pages + 1) << PAGE_SHIFT;
+	vdso_len = vdso_pages << PAGE_SHIFT;
 
 	mmap_write_lock(mm);
 	vdso_base = get_unmapped_area(NULL, 0, vdso_len, 0, 0);
@@ -85,15 +77,6 @@ int arch_setup_additional_pages(struct linux_binprm *bprm,
 	}
 
 	vdso_base += (vdso_pages << PAGE_SHIFT);
-	vvar_mapping.pages = &vdso_pagelist[vdso_pages];
-	vma = _install_special_mapping(mm, vdso_base, PAGE_SIZE,
-		(VM_READ | VM_MAYREAD), &vvar_mapping);
-
-	if (IS_ERR(vma)) {
-		ret = PTR_ERR(vma);
-		mm->context.vdso = NULL;
-		goto end;
-	}
 	ret = 0;
 end:
 	mmap_write_unlock(mm);
@@ -104,8 +87,5 @@ const char *arch_vma_name(struct vm_area_struct *vma)
 {
 	if (vma->vm_mm && (vma->vm_start == (long)vma->vm_mm->context.vdso))
 		return "[vdso]";
-	if (vma->vm_mm && (vma->vm_start ==
-			   (long)vma->vm_mm->context.vdso + PAGE_SIZE))
-		return "[vdso_data]";
 	return NULL;
 }
diff --git a/arch/csky/kernel/vdso/Makefile b/arch/csky/kernel/vdso/Makefile
index bc2261f5a8d4393d96c6b459730b0e37ce20ad4e..069ef0b17fe5235918a6aa13aa120857bbbf3faf 100644
--- a/arch/csky/kernel/vdso/Makefile
+++ b/arch/csky/kernel/vdso/Makefile
@@ -5,7 +5,6 @@ include $(srctree)/lib/vdso/Makefile
 
 # Symbols present in the vdso
 vdso-syms  += rt_sigreturn
-vdso-syms  += vgettimeofday
 
 # Files to link into the vdso
 obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
diff --git a/arch/csky/kernel/vdso/vdso.lds.S b/arch/csky/kernel/vdso/vdso.lds.S
index 590a6c79fff7d78dc22be83cc9fec113a2ff3bd5..8d226252d4394e4e2aed1cb7444b329c75eca386 100644
--- a/arch/csky/kernel/vdso/vdso.lds.S
+++ b/arch/csky/kernel/vdso/vdso.lds.S
@@ -49,10 +49,6 @@ VERSION
 	LINUX_5.10 {
 	global:
 		__vdso_rt_sigreturn;
-		__vdso_clock_gettime;
-		__vdso_clock_gettime64;
-		__vdso_gettimeofday;
-		__vdso_clock_getres;
 	local: *;
 	};
 }
diff --git a/arch/csky/kernel/vdso/vgettimeofday.c b/arch/csky/kernel/vdso/vgettimeofday.c
deleted file mode 100644
index 55af30e8375288a52ac96d938feb496adc9cd7c6..0000000000000000000000000000000000000000
--- a/arch/csky/kernel/vdso/vgettimeofday.c
+++ /dev/null
@@ -1,30 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-
-#include <linux/time.h>
-#include <linux/types.h>
-#include <vdso/gettime.h>
-
-extern
-int __vdso_clock_gettime(clockid_t clock,
-			 struct old_timespec32 *ts)
-{
-	return __cvdso_clock_gettime32(clock, ts);
-}
-
-int __vdso_clock_gettime64(clockid_t clock,
-			   struct __kernel_timespec *ts)
-{
-	return __cvdso_clock_gettime(clock, ts);
-}
-
-int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
-			struct timezone *tz)
-{
-	return __cvdso_gettimeofday(tv, tz);
-}
-
-int __vdso_clock_getres(clockid_t clock_id,
-			struct old_timespec32 *res)
-{
-	return __cvdso_clock_getres_time32(clock_id, res);
-}

-- 
2.47.0


