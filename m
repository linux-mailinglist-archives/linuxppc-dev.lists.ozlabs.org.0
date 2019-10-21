Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 00487DECE3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2019 14:56:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xc803ZWTzDqkJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2019 23:56:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="aS6EjAE9"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xc4z2q4tzDqcl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 23:53:20 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46xc4k44kjz9ty3t;
 Mon, 21 Oct 2019 14:53:10 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=aS6EjAE9; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 6ZVJamkS0aWP; Mon, 21 Oct 2019 14:53:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46xc4k1xXlz9ty3r;
 Mon, 21 Oct 2019 14:53:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1571662390; bh=NS3fIgt9eM9gij1zoDxWm/Cklbvi4c+NE6KLmeDBgUk=;
 h=From:Subject:To:Cc:Date:From;
 b=aS6EjAE9rbp3ewgrWFiaIeglqXDJv303fDkImFABBOs+rWqm5Gk78DrHbx9EOQwfw
 Yr9SkU38njoOxnkB7ihU3kFSROD82VstWrI7fF1WIi5sygsBk8p017NjASfyPG7rFt
 k50h0QX/WT8NCEdtVCmClxNQkz1xC+lkCN6PIsP4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 150B38B8F5;
 Mon, 21 Oct 2019 14:53:15 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Dwy631cL-nS8; Mon, 21 Oct 2019 14:53:14 +0200 (CEST)
Received: from po16098vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8582C8B8E0;
 Mon, 21 Oct 2019 14:53:14 +0200 (CEST)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 36E8D68DEC; Mon, 21 Oct 2019 12:53:14 +0000 (UTC)
Message-Id: <8ce3582f7f7da9ff0286ced857e5aa2e5ae6746e.1571662378.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH] powerpc/32: Switch VDSO to C implementation.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 vincenzo.frascino@arm.com, tglx@linutronix.de, luto@kernel.org
Date: Mon, 21 Oct 2019 12:53:14 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a tentative to switch powerpc/32 vdso to generic C implementation.
It will likely not work on 64 bits or even build properly at the moment.

powerpc is a bit special for VDSO as well as system calls in the
way that it requires setting CR SO bit which cannot be done in C.
Therefore, entry/exit and fallback needs to be performed in ASM.

To allow that, C fallbacks just return -1 and the ASM entry point
performs the system call when the C function returns -1.

The performance is rather disappoiting. That's most likely all
calculation in the C implementation are based on 64 bits math and
converted to 32 bits at the very end. I guess C implementation should
use 32 bits math like the assembly VDSO does as of today.

With current powerpc/32 ASM VDSO:

gettimeofday:    vdso: 750 nsec/call
clock-getres-realtime:    vdso: 382 nsec/call
clock-gettime-realtime:    vdso: 928 nsec/call
clock-getres-monotonic:    vdso: 382 nsec/call
clock-gettime-monotonic:    vdso: 1033 nsec/call

Once switched to C implementation:

gettimeofday:    vdso: 1533 nsec/call
clock-getres-realtime:    vdso: 853 nsec/call
clock-gettime-realtime:    vdso: 1570 nsec/call
clock-getres-monotonic:    vdso: 835 nsec/call
clock-gettime-monotonic:    vdso: 1605 nsec/call
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/Kconfig                         |   2 +
 arch/powerpc/include/asm/vdso/gettimeofday.h |  81 ++++++++
 arch/powerpc/include/asm/vdso/vsyscall.h     |  27 +++
 arch/powerpc/include/asm/vdso_datapage.h     |  16 +-
 arch/powerpc/kernel/asm-offsets.c            |  26 +--
 arch/powerpc/kernel/time.c                   |  90 +--------
 arch/powerpc/kernel/vdso.c                   |  19 +-
 arch/powerpc/kernel/vdso32/Makefile          |  19 +-
 arch/powerpc/kernel/vdso32/gettimeofday.S    | 270 ++++++---------------------
 arch/powerpc/kernel/vdso32/vgettimeofday.c   |  32 ++++
 10 files changed, 233 insertions(+), 349 deletions(-)
 create mode 100644 arch/powerpc/include/asm/vdso/gettimeofday.h
 create mode 100644 arch/powerpc/include/asm/vdso/vsyscall.h
 create mode 100644 arch/powerpc/kernel/vdso32/vgettimeofday.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 3e56c9c2f16e..a363c5186b82 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -168,6 +168,7 @@ config PPC
 	select GENERIC_STRNCPY_FROM_USER
 	select GENERIC_STRNLEN_USER
 	select GENERIC_TIME_VSYSCALL
+	select GENERIC_GETTIMEOFDAY
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
 	select HAVE_ARCH_JUMP_LABEL
@@ -197,6 +198,7 @@ config PPC
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER
 	select HAVE_GCC_PLUGINS			if GCC_VERSION >= 50200   # plugin support on gcc <= 5.1 is buggy on PPC
+	select HAVE_GENERIC_VDSO
 	select HAVE_HW_BREAKPOINT		if PERF_EVENTS && (PPC_BOOK3S || PPC_8xx)
 	select HAVE_IDE
 	select HAVE_IOREMAP_PROT
diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
new file mode 100644
index 000000000000..6de875cf4b75
--- /dev/null
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -0,0 +1,81 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018 ARM Limited
+ */
+#ifndef __ASM_VDSO_GETTIMEOFDAY_H
+#define __ASM_VDSO_GETTIMEOFDAY_H
+
+#ifndef __ASSEMBLY__
+
+#include <asm/time.h>
+#include <asm/unistd.h>
+#include <uapi/linux/time.h>
+
+#define __VDSO_USE_SYSCALL		ULLONG_MAX
+
+#define VDSO_HAS_CLOCK_GETRES		1
+
+#define VDSO_HAS_TIME			1
+
+#define VDSO_HAS_32BIT_FALLBACK		1
+
+static __always_inline
+int gettimeofday_fallback(struct __kernel_old_timeval *_tv,
+			  struct timezone *_tz)
+{
+	return -1;
+}
+
+static __always_inline
+long clock_gettime_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
+{
+	return -1;
+}
+
+static __always_inline
+int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
+{
+	return -1;
+}
+
+static __always_inline
+int clock_getres32_fallback(clockid_t clock, struct old_timespec32 *res)
+{
+	return -1;
+}
+
+static __always_inline
+int clock_gettime32_fallback(clockid_t clock, struct old_timespec32 *res)
+{
+	return -1;
+}
+
+static __always_inline u64 __arch_get_hw_counter(s32 clock_mode)
+{
+	/*
+	 * clock_mode == 0 implies that vDSO are enabled otherwise
+	 * fallback on syscall.
+	 */
+	if (clock_mode)
+		return __VDSO_USE_SYSCALL;
+
+	return get_tb();
+}
+
+static __always_inline
+const struct vdso_data *__arch_get_vdso_data(void)
+{
+	void *ptr;
+
+	asm volatile(
+		"	bcl	20, 31, .+4;\n"
+		"	mflr	%0;\n"
+		"	addi	%0, %0, __kernel_datapage_offset - (.-4);\n"
+		: "=b"(ptr) : : "lr");
+
+	return ptr + *(unsigned long *)ptr;
+}
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* __ASM_VDSO_GETTIMEOFDAY_H */
diff --git a/arch/powerpc/include/asm/vdso/vsyscall.h b/arch/powerpc/include/asm/vdso/vsyscall.h
new file mode 100644
index 000000000000..d12c2298cbb8
--- /dev/null
+++ b/arch/powerpc/include/asm/vdso/vsyscall.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_VDSO_VSYSCALL_H
+#define __ASM_VDSO_VSYSCALL_H
+
+#ifndef __ASSEMBLY__
+
+#include <linux/timekeeper_internal.h>
+#include <asm/vdso_datapage.h>
+
+extern struct vdso_arch_data *vdso_arch_data;
+
+/*
+ * Update the vDSO data page to keep in sync with kernel timekeeping.
+ */
+static __always_inline
+struct vdso_data *__powerpc_get_k_vdso_data(void)
+{
+	return vdso_arch_data->data;
+}
+#define __arch_get_k_vdso_data __powerpc_get_k_vdso_data
+
+/* The asm-generic header needs to be included after the definitions above */
+#include <asm-generic/vdso/vsyscall.h>
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* __ASM_VDSO_VSYSCALL_H */
diff --git a/arch/powerpc/include/asm/vdso_datapage.h b/arch/powerpc/include/asm/vdso_datapage.h
index c61d59ed3b45..f9b50bc50989 100644
--- a/arch/powerpc/include/asm/vdso_datapage.h
+++ b/arch/powerpc/include/asm/vdso_datapage.h
@@ -36,6 +36,7 @@
 
 #include <linux/unistd.h>
 #include <linux/time.h>
+#include <vdso/datapage.h>
 
 #define SYSCALL_MAP_SIZE      ((NR_syscalls + 31) / 32)
 
@@ -91,18 +92,9 @@ struct vdso_data {
 /*
  * And here is the simpler 32 bits version
  */
-struct vdso_data {
-	__u64 tb_orig_stamp;		/* Timebase at boot		0x30 */
+struct vdso_arch_data {
+	struct vdso_data data[CS_BASES];
 	__u64 tb_ticks_per_sec;		/* Timebase tics / sec		0x38 */
-	__u64 tb_to_xs;			/* Inverse of TB to 2^20	0x40 */
-	__u64 stamp_xsec;		/*				0x48 */
-	__u32 tb_update_count;		/* Timebase atomicity ctr	0x50 */
-	__u32 tz_minuteswest;		/* Minutes west of Greenwich	0x58 */
-	__u32 tz_dsttime;		/* Type of dst correction	0x5C */
-	__s32 wtom_clock_sec;			/* Wall to monotonic clock */
-	__s32 wtom_clock_nsec;
-	struct timespec stamp_xtime;	/* xtime as at tb_orig_stamp */
-	__u32 stamp_sec_fraction;	/* fractional seconds of stamp_xtime */
    	__u32 syscall_map_32[SYSCALL_MAP_SIZE]; /* map of syscalls */
 	__u32 dcache_block_size;	/* L1 d-cache block size     */
 	__u32 icache_block_size;	/* L1 i-cache block size     */
@@ -112,7 +104,7 @@ struct vdso_data {
 
 #endif /* CONFIG_PPC64 */
 
-extern struct vdso_data *vdso_data;
+extern struct vdso_arch_data *vdso_arch_data;
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 484f54dab247..88ec3acde094 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -376,21 +376,12 @@ int main(void)
 #endif /* ! CONFIG_PPC64 */
 
 	/* datapage offsets for use by vdso */
-	OFFSET(CFG_TB_ORIG_STAMP, vdso_data, tb_orig_stamp);
-	OFFSET(CFG_TB_TICKS_PER_SEC, vdso_data, tb_ticks_per_sec);
-	OFFSET(CFG_TB_TO_XS, vdso_data, tb_to_xs);
-	OFFSET(CFG_TB_UPDATE_COUNT, vdso_data, tb_update_count);
-	OFFSET(CFG_TZ_MINUTEWEST, vdso_data, tz_minuteswest);
-	OFFSET(CFG_TZ_DSTTIME, vdso_data, tz_dsttime);
-	OFFSET(CFG_SYSCALL_MAP32, vdso_data, syscall_map_32);
-	OFFSET(WTOM_CLOCK_SEC, vdso_data, wtom_clock_sec);
-	OFFSET(WTOM_CLOCK_NSEC, vdso_data, wtom_clock_nsec);
-	OFFSET(STAMP_XTIME, vdso_data, stamp_xtime);
-	OFFSET(STAMP_SEC_FRAC, vdso_data, stamp_sec_fraction);
-	OFFSET(CFG_ICACHE_BLOCKSZ, vdso_data, icache_block_size);
-	OFFSET(CFG_DCACHE_BLOCKSZ, vdso_data, dcache_block_size);
-	OFFSET(CFG_ICACHE_LOGBLOCKSZ, vdso_data, icache_log_block_size);
-	OFFSET(CFG_DCACHE_LOGBLOCKSZ, vdso_data, dcache_log_block_size);
+	OFFSET(CFG_TB_TICKS_PER_SEC, vdso_arch_data, tb_ticks_per_sec);
+	OFFSET(CFG_SYSCALL_MAP32, vdso_arch_data, syscall_map_32);
+	OFFSET(CFG_ICACHE_BLOCKSZ, vdso_arch_data, icache_block_size);
+	OFFSET(CFG_DCACHE_BLOCKSZ, vdso_arch_data, dcache_block_size);
+	OFFSET(CFG_ICACHE_LOGBLOCKSZ, vdso_arch_data, icache_log_block_size);
+	OFFSET(CFG_DCACHE_LOGBLOCKSZ, vdso_arch_data, dcache_log_block_size);
 #ifdef CONFIG_PPC64
 	OFFSET(CFG_SYSCALL_MAP64, vdso_data, syscall_map_64);
 	OFFSET(TVAL64_TV_SEC, timeval, tv_sec);
@@ -401,11 +392,6 @@ int main(void)
 	OFFSET(TSPC64_TV_NSEC, timespec, tv_nsec);
 	OFFSET(TSPC32_TV_SEC, old_timespec32, tv_sec);
 	OFFSET(TSPC32_TV_NSEC, old_timespec32, tv_nsec);
-#else
-	OFFSET(TVAL32_TV_SEC, timeval, tv_sec);
-	OFFSET(TVAL32_TV_USEC, timeval, tv_usec);
-	OFFSET(TSPC32_TV_SEC, timespec, tv_sec);
-	OFFSET(TSPC32_TV_NSEC, timespec, tv_nsec);
 #endif
 	/* timeval/timezone offsets for use by vdso */
 	OFFSET(TZONE_TZ_MINWEST, timezone, tz_minuteswest);
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 694522308cd5..57bdaf08bafc 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -882,93 +882,6 @@ static notrace u64 timebase_read(struct clocksource *cs)
 	return (u64)get_tb();
 }
 
-
-void update_vsyscall(struct timekeeper *tk)
-{
-	struct timespec xt;
-	struct clocksource *clock = tk->tkr_mono.clock;
-	u32 mult = tk->tkr_mono.mult;
-	u32 shift = tk->tkr_mono.shift;
-	u64 cycle_last = tk->tkr_mono.cycle_last;
-	u64 new_tb_to_xs, new_stamp_xsec;
-	u64 frac_sec;
-
-	if (clock != &clocksource_timebase)
-		return;
-
-	xt.tv_sec = tk->xtime_sec;
-	xt.tv_nsec = (long)(tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift);
-
-	/* Make userspace gettimeofday spin until we're done. */
-	++vdso_data->tb_update_count;
-	smp_mb();
-
-	/*
-	 * This computes ((2^20 / 1e9) * mult) >> shift as a
-	 * 0.64 fixed-point fraction.
-	 * The computation in the else clause below won't overflow
-	 * (as long as the timebase frequency is >= 1.049 MHz)
-	 * but loses precision because we lose the low bits of the constant
-	 * in the shift.  Note that 19342813113834067 ~= 2^(20+64) / 1e9.
-	 * For a shift of 24 the error is about 0.5e-9, or about 0.5ns
-	 * over a second.  (Shift values are usually 22, 23 or 24.)
-	 * For high frequency clocks such as the 512MHz timebase clock
-	 * on POWER[6789], the mult value is small (e.g. 32768000)
-	 * and so we can shift the constant by 16 initially
-	 * (295147905179 ~= 2^(20+64-16) / 1e9) and then do the
-	 * remaining shifts after the multiplication, which gives a
-	 * more accurate result (e.g. with mult = 32768000, shift = 24,
-	 * the error is only about 1.2e-12, or 0.7ns over 10 minutes).
-	 */
-	if (mult <= 62500000 && clock->shift >= 16)
-		new_tb_to_xs = ((u64) mult * 295147905179ULL) >> (clock->shift - 16);
-	else
-		new_tb_to_xs = (u64) mult * (19342813113834067ULL >> clock->shift);
-
-	/*
-	 * Compute the fractional second in units of 2^-32 seconds.
-	 * The fractional second is tk->tkr_mono.xtime_nsec >> tk->tkr_mono.shift
-	 * in nanoseconds, so multiplying that by 2^32 / 1e9 gives
-	 * it in units of 2^-32 seconds.
-	 * We assume shift <= 32 because clocks_calc_mult_shift()
-	 * generates shift values in the range 0 - 32.
-	 */
-	frac_sec = tk->tkr_mono.xtime_nsec << (32 - shift);
-	do_div(frac_sec, NSEC_PER_SEC);
-
-	/*
-	 * Work out new stamp_xsec value for any legacy users of systemcfg.
-	 * stamp_xsec is in units of 2^-20 seconds.
-	 */
-	new_stamp_xsec = frac_sec >> 12;
-	new_stamp_xsec += tk->xtime_sec * XSEC_PER_SEC;
-
-	/*
-	 * tb_update_count is used to allow the userspace gettimeofday code
-	 * to assure itself that it sees a consistent view of the tb_to_xs and
-	 * stamp_xsec variables.  It reads the tb_update_count, then reads
-	 * tb_to_xs and stamp_xsec and then reads tb_update_count again.  If
-	 * the two values of tb_update_count match and are even then the
-	 * tb_to_xs and stamp_xsec values are consistent.  If not, then it
-	 * loops back and reads them again until this criteria is met.
-	 */
-	vdso_data->tb_orig_stamp = cycle_last;
-	vdso_data->stamp_xsec = new_stamp_xsec;
-	vdso_data->tb_to_xs = new_tb_to_xs;
-	vdso_data->wtom_clock_sec = tk->wall_to_monotonic.tv_sec;
-	vdso_data->wtom_clock_nsec = tk->wall_to_monotonic.tv_nsec;
-	vdso_data->stamp_xtime = xt;
-	vdso_data->stamp_sec_fraction = frac_sec;
-	smp_wmb();
-	++(vdso_data->tb_update_count);
-}
-
-void update_vsyscall_tz(void)
-{
-	vdso_data->tz_minuteswest = sys_tz.tz_minuteswest;
-	vdso_data->tz_dsttime = sys_tz.tz_dsttime;
-}
-
 static void __init clocksource_init(void)
 {
 	struct clocksource *clock;
@@ -1138,8 +1051,7 @@ void __init time_init(void)
 		sys_tz.tz_dsttime = 0;
 	}
 
-	vdso_data->tb_update_count = 0;
-	vdso_data->tb_ticks_per_sec = tb_ticks_per_sec;
+	vdso_arch_data->tb_ticks_per_sec = tb_ticks_per_sec;
 
 	/* initialise and enable the large decrementer (if we have one) */
 	set_decrementer_max();
diff --git a/arch/powerpc/kernel/vdso.c b/arch/powerpc/kernel/vdso.c
index eae9ddaecbcf..d1e4f3a3a781 100644
--- a/arch/powerpc/kernel/vdso.c
+++ b/arch/powerpc/kernel/vdso.c
@@ -17,6 +17,7 @@
 #include <linux/elf.h>
 #include <linux/security.h>
 #include <linux/memblock.h>
+#include <vdso/datapage.h>
 
 #include <asm/pgtable.h>
 #include <asm/processor.h>
@@ -71,10 +72,10 @@ static int vdso_ready;
  * with it, it will become dynamically allocated
  */
 static union {
-	struct vdso_data	data;
+	struct vdso_arch_data	arch_data;
 	u8			page[PAGE_SIZE];
 } vdso_data_store __page_aligned_data;
-struct vdso_data *vdso_data = &vdso_data_store.data;
+struct vdso_arch_data *vdso_arch_data = &vdso_data_store.arch_data;
 
 /* Format of the patch table */
 struct vdso_patch_def
@@ -661,7 +662,7 @@ static void __init vdso_setup_syscall_map(void)
 				0x80000000UL >> (i & 0x1f);
 #else /* CONFIG_PPC64 */
 		if (sys_call_table[i] != sys_ni_syscall)
-			vdso_data->syscall_map_32[i >> 5] |=
+			vdso_arch_data->syscall_map_32[i >> 5] |=
 				0x80000000UL >> (i & 0x1f);
 #endif /* CONFIG_PPC64 */
 	}
@@ -729,10 +730,10 @@ static int __init vdso_init(void)
 	vdso64_pages = (&vdso64_end - &vdso64_start) >> PAGE_SHIFT;
 	DBG("vdso64_kbase: %p, 0x%x pages\n", vdso64_kbase, vdso64_pages);
 #else
-	vdso_data->dcache_block_size = L1_CACHE_BYTES;
-	vdso_data->dcache_log_block_size = L1_CACHE_SHIFT;
-	vdso_data->icache_block_size = L1_CACHE_BYTES;
-	vdso_data->icache_log_block_size = L1_CACHE_SHIFT;
+	vdso_arch_data->dcache_block_size = L1_CACHE_BYTES;
+	vdso_arch_data->dcache_log_block_size = L1_CACHE_SHIFT;
+	vdso_arch_data->icache_block_size = L1_CACHE_BYTES;
+	vdso_arch_data->icache_log_block_size = L1_CACHE_SHIFT;
 #endif /* CONFIG_PPC64 */
 
 
@@ -775,7 +776,7 @@ static int __init vdso_init(void)
 		get_page(pg);
 		vdso32_pagelist[i] = pg;
 	}
-	vdso32_pagelist[i++] = virt_to_page(vdso_data);
+	vdso32_pagelist[i++] = virt_to_page(vdso_arch_data);
 	vdso32_pagelist[i] = NULL;
 #endif
 
@@ -792,7 +793,7 @@ static int __init vdso_init(void)
 	vdso64_pagelist[i] = NULL;
 #endif /* CONFIG_PPC64 */
 
-	get_page(virt_to_page(vdso_data));
+	get_page(virt_to_page(vdso_arch_data));
 
 	smp_wmb();
 	vdso_ready = 1;
diff --git a/arch/powerpc/kernel/vdso32/Makefile b/arch/powerpc/kernel/vdso32/Makefile
index 06f54d947057..09edcd1a2dc7 100644
--- a/arch/powerpc/kernel/vdso32/Makefile
+++ b/arch/powerpc/kernel/vdso32/Makefile
@@ -2,10 +2,17 @@
 
 # List of files in the vdso, has to be asm only for now
 
+ARCH_REL_TYPE_ABS := R_PPC_JUMP_SLOT|R_PPC_GLOB_DAT|R_PPC_ADDR32|R_PPC_ADDR24|R_PPC_ADDR16|R_PPC_ADDR16_LO|R_PPC_ADDR16_HI|R_PPC_ADDR16_HA|R_PPC_ADDR14|R_PPC_ADDR14_BRTAKEN|R_PPC_ADDR14_BRNTAKEN
+include $(srctree)/lib/vdso/Makefile
+
 obj-vdso32-$(CONFIG_PPC64) = getcpu.o
 obj-vdso32 = sigtramp.o gettimeofday.o datapage.o cacheflush.o note.o \
 		$(obj-vdso32-y)
 
+ifneq ($(c-gettimeofday-y),)
+  CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
+endif
+
 # Build rules
 
 ifdef CROSS32_COMPILE
@@ -38,8 +45,8 @@ CPPFLAGS_vdso32.lds += -P -C -Upowerpc
 $(obj)/vdso32_wrapper.o : $(obj)/vdso32.so
 
 # link rule for the .so file, .lds has to be first
-$(obj)/vdso32.so.dbg: $(src)/vdso32.lds $(obj-vdso32) FORCE
-	$(call if_changed,vdso32ld)
+$(obj)/vdso32.so.dbg: $(src)/vdso32.lds $(obj-vdso32) $(obj)/vgettimeofday.o FORCE
+	$(call if_changed,vdso32ld_and_check)
 
 # strip rule for the .so file
 $(obj)/%.so: OBJCOPYFLAGS := -S
@@ -49,12 +56,16 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
 # assembly rules for the .S files
 $(obj-vdso32): %.o: %.S FORCE
 	$(call if_changed_dep,vdso32as)
+$(obj)/vgettimeofday.o: %.o: %.c FORCE
+	$(call if_changed_dep,vdso32cc)
 
 # actual build commands
-quiet_cmd_vdso32ld = VDSO32L $@
-      cmd_vdso32ld = $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^)
+quiet_cmd_vdso32ld_and_check = VDSO32L $@
+      cmd_vdso32ld_and_check = $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@ -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) ; $(cmd_vdso_check)
 quiet_cmd_vdso32as = VDSO32A $@
       cmd_vdso32as = $(VDSOCC) $(a_flags) $(CC32FLAGS) -c -o $@ $<
+quiet_cmd_vdso32cc = VDSO32A $@
+      cmd_vdso32cc = $(VDSOCC) $(c_flags) $(CC32FLAGS) -c -o $@ $<
 
 # install commands for the unstripped file
 quiet_cmd_vdso_install = INSTALL $@
diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
index becd9f8767ed..6f2671101248 100644
--- a/arch/powerpc/kernel/vdso32/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
@@ -12,15 +12,6 @@
 #include <asm/asm-offsets.h>
 #include <asm/unistd.h>
 
-/* Offset for the low 32-bit part of a field of long type */
-#ifdef CONFIG_PPC64
-#define LOPART	4
-#define TSPEC_TV_SEC	TSPC64_TV_SEC+LOPART
-#else
-#define LOPART	0
-#define TSPEC_TV_SEC	TSPC32_TV_SEC
-#endif
-
 	.text
 /*
  * Exact prototype of gettimeofday
@@ -30,31 +21,25 @@
  */
 V_FUNCTION_BEGIN(__kernel_gettimeofday)
   .cfi_startproc
-	mflr	r12
-  .cfi_register lr,r12
-
-	mr	r10,r3			/* r10 saves tv */
-	mr	r11,r4			/* r11 saves tz */
-	bl	__get_datapage@local	/* get data page */
-	mr	r9, r3			/* datapage ptr in r9 */
-	cmplwi	r10,0			/* check if tv is NULL */
-	beq	3f
-	lis	r7,1000000@ha		/* load up USEC_PER_SEC */
-	addi	r7,r7,1000000@l		/* so we get microseconds in r4 */
-	bl	__do_get_tspec@local	/* get sec/usec from tb & kernel */
-	stw	r3,TVAL32_TV_SEC(r10)
-	stw	r4,TVAL32_TV_USEC(r10)
-
-3:	cmplwi	r11,0			/* check if tz is NULL */
-	beq	1f
-	lwz	r4,CFG_TZ_MINUTEWEST(r9)/* fill tz */
-	lwz	r5,CFG_TZ_DSTTIME(r9)
-	stw	r4,TZONE_TZ_MINWEST(r11)
-	stw	r5,TZONE_TZ_DSTTIME(r11)
-
-1:	mtlr	r12
+	mflr	r0
+	stwu	r1, -16(r1)
+	stw	r0, 20(r1)
+	stw	r3, 8(r1)
+	stw	r4, 12(r1)
+	bl	__c_kernel_gettimeofday
+	cmpwi	r3, 0
+	lwz	r0, 20(r1)
+	mtlr	r0
+	bne	99f
+	addi	r1, r1, 16
 	crclr	cr0*4+so
-	li	r3,0
+	blr
+99:
+	lwz	r3, 8(r1)
+	lwz	r4, 12(r1)
+	addi	r1, r1, 16
+	li	r0, __NR_gettimeofday
+	sc
 	blr
   .cfi_endproc
 V_FUNCTION_END(__kernel_gettimeofday)
@@ -67,75 +52,24 @@ V_FUNCTION_END(__kernel_gettimeofday)
  */
 V_FUNCTION_BEGIN(__kernel_clock_gettime)
   .cfi_startproc
-	/* Check for supported clock IDs */
-	cmpli	cr0,r3,CLOCK_REALTIME
-	cmpli	cr1,r3,CLOCK_MONOTONIC
-	cror	cr0*4+eq,cr0*4+eq,cr1*4+eq
-	bne	cr0,99f
-
-	mflr	r12			/* r12 saves lr */
-  .cfi_register lr,r12
-	mr	r11,r4			/* r11 saves tp */
-	bl	__get_datapage@local	/* get data page */
-	mr	r9,r3			/* datapage ptr in r9 */
-	lis	r7,NSEC_PER_SEC@h	/* want nanoseconds */
-	ori	r7,r7,NSEC_PER_SEC@l
-50:	bl	__do_get_tspec@local	/* get sec/nsec from tb & kernel */
-	bne	cr1,80f			/* not monotonic -> all done */
-
-	/*
-	 * CLOCK_MONOTONIC
-	 */
-
-	/* now we must fixup using wall to monotonic. We need to snapshot
-	 * that value and do the counter trick again. Fortunately, we still
-	 * have the counter value in r8 that was returned by __do_get_xsec.
-	 * At this point, r3,r4 contain our sec/nsec values, r5 and r6
-	 * can be used, r7 contains NSEC_PER_SEC.
-	 */
-
-	lwz	r5,(WTOM_CLOCK_SEC+LOPART)(r9)
-	lwz	r6,WTOM_CLOCK_NSEC(r9)
-
-	/* We now have our offset in r5,r6. We create a fake dependency
-	 * on that value and re-check the counter
-	 */
-	or	r0,r6,r5
-	xor	r0,r0,r0
-	add	r9,r9,r0
-	lwz	r0,(CFG_TB_UPDATE_COUNT+LOPART)(r9)
-        cmpl    cr0,r8,r0		/* check if updated */
-	bne-	50b
-
-	/* Calculate and store result. Note that this mimics the C code,
-	 * which may cause funny results if nsec goes negative... is that
-	 * possible at all ?
-	 */
-	add	r3,r3,r5
-	add	r4,r4,r6
-	cmpw	cr0,r4,r7
-	cmpwi	cr1,r4,0
-	blt	1f
-	subf	r4,r7,r4
-	addi	r3,r3,1
-1:	bge	cr1,80f
-	addi	r3,r3,-1
-	add	r4,r4,r7
-
-80:	stw	r3,TSPC32_TV_SEC(r11)
-	stw	r4,TSPC32_TV_NSEC(r11)
-
-	mtlr	r12
+	mflr	r0
+	stwu	r1, -16(r1)
+	stw	r0, 20(r1)
+	stw	r3, 8(r1)
+	stw	r4, 12(r1)
+	bl	__c_kernel_clock_gettime
+	cmpwi	r3, 0
+	lwz	r0, 20(r1)
+	mtlr	r0
+	bne	99f
+	addi	r1, r1, 16
 	crclr	cr0*4+so
-	li	r3,0
 	blr
-
-	/*
-	 * syscall fallback
-	 */
 99:
-	li	r0,__NR_clock_gettime
-  .cfi_restore lr
+	lwz	r3, 8(r1)
+	lwz	r4, 12(r1)
+	addi	r1, r1, 16
+	li	r0, __NR_clock_gettime
 	sc
 	blr
   .cfi_endproc
@@ -150,27 +84,24 @@ V_FUNCTION_END(__kernel_clock_gettime)
  */
 V_FUNCTION_BEGIN(__kernel_clock_getres)
   .cfi_startproc
-	/* Check for supported clock IDs */
-	cmpwi	cr0,r3,CLOCK_REALTIME
-	cmpwi	cr1,r3,CLOCK_MONOTONIC
-	cror	cr0*4+eq,cr0*4+eq,cr1*4+eq
-	bne	cr0,99f
-
-	li	r3,0
-	cmpli	cr0,r4,0
+	mflr	r0
+	stwu	r1, -16(r1)
+	stw	r0, 20(r1)
+	stw	r3, 8(r1)
+	stw	r4, 12(r1)
+	bl	__c_kernel_clock_getres
+	cmpwi	r3, 0
+	lwz	r0, 20(r1)
+	mtlr	r0
+	bne	99f
+	addi	r1, r1, 16
 	crclr	cr0*4+so
-	beqlr
-	lis	r5,CLOCK_REALTIME_RES@h
-	ori	r5,r5,CLOCK_REALTIME_RES@l
-	stw	r3,TSPC32_TV_SEC(r4)
-	stw	r5,TSPC32_TV_NSEC(r4)
 	blr
-
-	/*
-	 * syscall fallback
-	 */
 99:
-	li	r0,__NR_clock_getres
+	lwz	r3, 8(r1)
+	lwz	r4, 12(r1)
+	addi	r1, r1, 16
+	li	r0, __NR_clock_getres
 	sc
 	blr
   .cfi_endproc
@@ -185,105 +116,14 @@ V_FUNCTION_END(__kernel_clock_getres)
  */
 V_FUNCTION_BEGIN(__kernel_time)
   .cfi_startproc
-	mflr	r12
-  .cfi_register lr,r12
-
-	mr	r11,r3			/* r11 holds t */
-	bl	__get_datapage@local
-	mr	r9, r3			/* datapage ptr in r9 */
-
-	lwz	r3,STAMP_XTIME+TSPEC_TV_SEC(r9)
-
-	cmplwi	r11,0			/* check if t is NULL */
-	beq	2f
-	stw	r3,0(r11)		/* store result at *t */
-2:	mtlr	r12
+	mflr	r0
+	stwu	r1, -16(r1)
+	stw	r0, 20(r1)
+	bl	__c_kernel_time
+	lwz	r0, 20(r1)
 	crclr	cr0*4+so
+	mtlr	r0
+	addi	r1, r1, 16
 	blr
   .cfi_endproc
 V_FUNCTION_END(__kernel_time)
-
-/*
- * This is the core of clock_gettime() and gettimeofday(),
- * it returns the current time in r3 (seconds) and r4.
- * On entry, r7 gives the resolution of r4, either USEC_PER_SEC
- * or NSEC_PER_SEC, giving r4 in microseconds or nanoseconds.
- * It expects the datapage ptr in r9 and doesn't clobber it.
- * It clobbers r0, r5 and r6.
- * On return, r8 contains the counter value that can be reused.
- * This clobbers cr0 but not any other cr field.
- */
-__do_get_tspec:
-  .cfi_startproc
-	/* Check for update count & load values. We use the low
-	 * order 32 bits of the update count
-	 */
-1:	lwz	r8,(CFG_TB_UPDATE_COUNT+LOPART)(r9)
-	andi.	r0,r8,1			/* pending update ? loop */
-	bne-	1b
-	xor	r0,r8,r8		/* create dependency */
-	add	r9,r9,r0
-
-	/* Load orig stamp (offset to TB) */
-	lwz	r5,CFG_TB_ORIG_STAMP(r9)
-	lwz	r6,(CFG_TB_ORIG_STAMP+4)(r9)
-
-	/* Get a stable TB value */
-2:	MFTBU(r3)
-	MFTBL(r4)
-	MFTBU(r0)
-	cmplw	cr0,r3,r0
-	bne-	2b
-
-	/* Subtract tb orig stamp and shift left 12 bits.
-	 */
-	subfc	r4,r6,r4
-	subfe	r0,r5,r3
-	slwi	r0,r0,12
-	rlwimi.	r0,r4,12,20,31
-	slwi	r4,r4,12
-
-	/*
-	 * Load scale factor & do multiplication.
-	 * We only use the high 32 bits of the tb_to_xs value.
-	 * Even with a 1GHz timebase clock, the high 32 bits of
-	 * tb_to_xs will be at least 4 million, so the error from
-	 * ignoring the low 32 bits will be no more than 0.25ppm.
-	 * The error will just make the clock run very very slightly
-	 * slow until the next time the kernel updates the VDSO data,
-	 * at which point the clock will catch up to the kernel's value,
-	 * so there is no long-term error accumulation.
-	 */
-	lwz	r5,CFG_TB_TO_XS(r9)	/* load values */
-	mulhwu	r4,r4,r5
-	li	r3,0
-
-	beq+	4f			/* skip high part computation if 0 */
-	mulhwu	r3,r0,r5
-	mullw	r5,r0,r5
-	addc	r4,r4,r5
-	addze	r3,r3
-4:
-	/* At this point, we have seconds since the xtime stamp
-	 * as a 32.32 fixed-point number in r3 and r4.
-	 * Load & add the xtime stamp.
-	 */
-	lwz	r5,STAMP_XTIME+TSPEC_TV_SEC(r9)
-	lwz	r6,STAMP_SEC_FRAC(r9)
-	addc	r4,r4,r6
-	adde	r3,r3,r5
-
-	/* We create a fake dependency on the result in r3/r4
-	 * and re-check the counter
-	 */
-	or	r6,r4,r3
-	xor	r0,r6,r6
-	add	r9,r9,r0
-	lwz	r0,(CFG_TB_UPDATE_COUNT+LOPART)(r9)
-        cmplw	cr0,r8,r0		/* check if updated */
-	bne-	1b
-
-	mulhwu	r4,r4,r7		/* convert to micro or nanoseconds */
-
-	blr
-  .cfi_endproc
diff --git a/arch/powerpc/kernel/vdso32/vgettimeofday.c b/arch/powerpc/kernel/vdso32/vgettimeofday.c
new file mode 100644
index 000000000000..9cc39fc60b30
--- /dev/null
+++ b/arch/powerpc/kernel/vdso32/vgettimeofday.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ARM64 userspace implementations of gettimeofday() and similar.
+ *
+ * Copyright (C) 2018 ARM Limited
+ *
+ */
+#include <linux/time.h>
+#include <linux/types.h>
+
+int __c_kernel_clock_gettime(clockid_t clock,
+			   struct old_timespec32 *ts)
+{
+	return __cvdso_clock_gettime32(clock, ts);
+}
+
+int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv,
+			  struct timezone *tz)
+{
+	return __cvdso_gettimeofday(tv, tz);
+}
+
+int __c_kernel_clock_getres(clockid_t clock_id,
+			  struct old_timespec32 *res)
+{
+	return __cvdso_clock_getres_time32(clock_id, res);
+}
+
+time_t __c_kernel_time(time_t *time)
+{
+	return __cvdso_time(time);
+}
-- 
2.13.3

