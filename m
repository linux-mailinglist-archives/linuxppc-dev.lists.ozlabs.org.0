Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E60F5984
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Nov 2019 22:16:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 478tPP4s0xzF7qf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 08:16:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 478tHX53NbzF7nl
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 08:11:36 +1100 (AEDT)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MOzGc-1iGzm719gK-00PNQ7; Fri, 08 Nov 2019 22:11:03 +0100
From: Arnd Bergmann <arnd@arndb.de>
To: y2038@lists.linaro.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 07/23] y2038: vdso: powerpc: avoid timespec references
Date: Fri,  8 Nov 2019 22:07:27 +0100
Message-Id: <20191108210824.1534248-7-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20191108210236.1296047-1-arnd@arndb.de>
References: <20191108210236.1296047-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lx86RfWyo1UtJmp56v0swjpp1ZWdSL3mM/CF24wl/EwN3VfO2KR
 j/eJXK26jFhg4VDBKMZnBKXvjJlTnXuhBv4X0pvatFTBWnn4TEN4bPDkd7iYKgHePuxM/tb
 wUwHYFsQXBh0x5JEX0SRRQIXE1SdA3wsE47PhksU0OV5C8D0xBjkRrcfg736jm6VFDtgqS3
 3QIN7Q4EkUAp7uOhcSRpA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Rd/L+EZnQb0=:UjleirH8JG1dR2gQl/Q6DR
 GOM0RkhxTsPJjHfHyivo5x41Frwviz6le8FWEzShs/U2Ro/kGU+xvA8mN+yEU2nIEEg3jDcY/
 c5h2VbhNuKgzzRJJUwUjUx3xltr2qfbQCpGK7KjkXPlTPds/XqqiFPxHnE+0r2c4qOVP4jmP7
 WwanXtBSlBsEbvLuHq8Hoovn74Ocz54mpPGVpF4Kq66XuWBuCPJMVaJfo7ULJ3i1xOxSnVX3v
 KbHID6hOzNJieoF2OZkYkhdL7kvpEbwBXAVDQDHMNK5nyYpRmp/6rXp97HYGcm3lAjdfRCmNd
 iKGTvwcgR4BD4R7NrJ6uq3V9Wl4TJDo6ouEcPv8QnnHZLfgpJ5WWvXodkkxf3pMabfvOAgDec
 hretNvCjx1E6sWSljXS7Cj/BykZTI6OSLvwDL/rfsF/8+0erJYRNFa1pg6wc/RszUhPdC3lIh
 9f5iUfY64HtC4d8ZCP0MxCzKpwq795IWhcW6UEBQzjdDTLq3VMaaLFICBwOGbomGeJtZbUB5f
 tszDN2uLLaHuc7KmVnlZC+JphbuaI3r6M3ZogEpLcC9QVcrNNl1EeYnGmVYJW032U0WA1p2Np
 rocuQR0wc8PQeKTGBifdtFBaiuxb+d6uBmhy1Th7HAYjo6pZWfCE4aBLPsalPKfJ5uyVZRN8S
 FAvLzEts8YFMQ3VgVsAaPV4leRizzFM6abySu+NXDp3N1KTAV8ZfC8EITaj4b/mkrjDQgEx/1
 dAh6pR9cY1nbX1nEUtalVPv1n/UJvNxsa5HD7vPIR+IHSA/ecLTsBh0LKbNi1cFjZhj0Rjk6P
 ELCJpRpIXQirHw4bXiw+aIz4FGoVHiIv9GQmp4Ylbo0pplVtQPv/7WOUkeGuCEPqzY/Z9IQcw
 ywdKmC+WhY23VmlASp5Q==
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As a preparation to stop using 'struct timespec' in the kernel,
change the powerpc vdso implementation:

- split up the vdso data definition to have equivalent members
   for seconds and nanoseconds instead of an xtime structure

- use timespec64 as an intermediate for the xtime update

- change the asm-offsets definition to be based the appropriate
  fixed-length types

This is only a temporary fix for changing the types, in order
to actually support a 64-bit safe vdso32 version of clock_gettime(),
the entire powerpc vdso should be replaced with the generic
lib/vdso/ implementation. If that happens first, this patch
becomes obsolete.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/powerpc/include/asm/vdso_datapage.h  |  6 ++++--
 arch/powerpc/kernel/asm-offsets.c         | 14 +++++---------
 arch/powerpc/kernel/time.c                |  5 +++--
 arch/powerpc/kernel/vdso32/gettimeofday.S |  6 ++----
 arch/powerpc/kernel/vdso64/gettimeofday.S |  8 ++++----
 5 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso_datapage.h b/arch/powerpc/include/asm/vdso_datapage.h
index c61d59ed3b45..a115970a6809 100644
--- a/arch/powerpc/include/asm/vdso_datapage.h
+++ b/arch/powerpc/include/asm/vdso_datapage.h
@@ -81,7 +81,8 @@ struct vdso_data {
 	__u32 stamp_sec_fraction;		/* fractional seconds of stamp_xtime */
 	__s32 wtom_clock_nsec;			/* Wall to monotonic clock nsec */
 	__s64 wtom_clock_sec;			/* Wall to monotonic clock sec */
-	struct timespec stamp_xtime;		/* xtime as at tb_orig_stamp */
+	__s64 stamp_xtime_sec;			/* xtime secs as at tb_orig_stamp */
+	__s64 stamp_xtime_nsec;			/* xtime nsecs as at tb_orig_stamp */
    	__u32 syscall_map_64[SYSCALL_MAP_SIZE]; /* map of syscalls  */
    	__u32 syscall_map_32[SYSCALL_MAP_SIZE]; /* map of syscalls */
 };
@@ -101,7 +102,8 @@ struct vdso_data {
 	__u32 tz_dsttime;		/* Type of dst correction	0x5C */
 	__s32 wtom_clock_sec;			/* Wall to monotonic clock */
 	__s32 wtom_clock_nsec;
-	struct timespec stamp_xtime;	/* xtime as at tb_orig_stamp */
+	__s32 stamp_xtime_sec;		/* xtime seconds as at tb_orig_stamp */
+	__s32 stamp_xtime_nsec;		/* xtime nsecs as at tb_orig_stamp */
 	__u32 stamp_sec_fraction;	/* fractional seconds of stamp_xtime */
    	__u32 syscall_map_32[SYSCALL_MAP_SIZE]; /* map of syscalls */
 	__u32 dcache_block_size;	/* L1 d-cache block size     */
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 827f4c354e13..f22bd6d1fe93 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -385,7 +385,8 @@ int main(void)
 	OFFSET(CFG_SYSCALL_MAP32, vdso_data, syscall_map_32);
 	OFFSET(WTOM_CLOCK_SEC, vdso_data, wtom_clock_sec);
 	OFFSET(WTOM_CLOCK_NSEC, vdso_data, wtom_clock_nsec);
-	OFFSET(STAMP_XTIME, vdso_data, stamp_xtime);
+	OFFSET(STAMP_XTIME_SEC, vdso_data, stamp_xtime_sec);
+	OFFSET(STAMP_XTIME_NSEC, vdso_data, stamp_xtime_nsec);
 	OFFSET(STAMP_SEC_FRAC, vdso_data, stamp_sec_fraction);
 	OFFSET(CFG_ICACHE_BLOCKSZ, vdso_data, icache_block_size);
 	OFFSET(CFG_DCACHE_BLOCKSZ, vdso_data, dcache_block_size);
@@ -395,18 +396,13 @@ int main(void)
 	OFFSET(CFG_SYSCALL_MAP64, vdso_data, syscall_map_64);
 	OFFSET(TVAL64_TV_SEC, __kernel_old_timeval, tv_sec);
 	OFFSET(TVAL64_TV_USEC, __kernel_old_timeval, tv_usec);
+#endif
+	OFFSET(TSPC64_TV_SEC, __kernel_timespec, tv_sec);
+	OFFSET(TSPC64_TV_NSEC, __kernel_timespec, tv_nsec);
 	OFFSET(TVAL32_TV_SEC, old_timeval32, tv_sec);
 	OFFSET(TVAL32_TV_USEC, old_timeval32, tv_usec);
-	OFFSET(TSPC64_TV_SEC, timespec, tv_sec);
-	OFFSET(TSPC64_TV_NSEC, timespec, tv_nsec);
 	OFFSET(TSPC32_TV_SEC, old_timespec32, tv_sec);
 	OFFSET(TSPC32_TV_NSEC, old_timespec32, tv_nsec);
-#else
-	OFFSET(TVAL32_TV_SEC, __kernel_old_timeval, tv_sec);
-	OFFSET(TVAL32_TV_USEC, __kernel_old_timeval, tv_usec);
-	OFFSET(TSPC32_TV_SEC, timespec, tv_sec);
-	OFFSET(TSPC32_TV_NSEC, timespec, tv_nsec);
-#endif
 	/* timeval/timezone offsets for use by vdso */
 	OFFSET(TZONE_TZ_MINWEST, timezone, tz_minuteswest);
 	OFFSET(TZONE_TZ_DSTTIME, timezone, tz_dsttime);
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 694522308cd5..1fad5a04d083 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -885,7 +885,7 @@ static notrace u64 timebase_read(struct clocksource *cs)
 
 void update_vsyscall(struct timekeeper *tk)
 {
-	struct timespec xt;
+	struct timespec64 xt;
 	struct clocksource *clock = tk->tkr_mono.clock;
 	u32 mult = tk->tkr_mono.mult;
 	u32 shift = tk->tkr_mono.shift;
@@ -957,7 +957,8 @@ void update_vsyscall(struct timekeeper *tk)
 	vdso_data->tb_to_xs = new_tb_to_xs;
 	vdso_data->wtom_clock_sec = tk->wall_to_monotonic.tv_sec;
 	vdso_data->wtom_clock_nsec = tk->wall_to_monotonic.tv_nsec;
-	vdso_data->stamp_xtime = xt;
+	vdso_data->stamp_xtime_sec = xt.sec;
+	vdso_data->stamp_xtime_nsec = xt.nsec;
 	vdso_data->stamp_sec_fraction = frac_sec;
 	smp_wmb();
 	++(vdso_data->tb_update_count);
diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
index 4327665ad86f..37ba4c3d965b 100644
--- a/arch/powerpc/kernel/vdso32/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
@@ -15,10 +15,8 @@
 /* Offset for the low 32-bit part of a field of long type */
 #if defined(CONFIG_PPC64) && defined(CONFIG_CPU_BIG_ENDIAN)
 #define LOPART	4
-#define TSPEC_TV_SEC	TSPC64_TV_SEC+LOPART
 #else
 #define LOPART	0
-#define TSPEC_TV_SEC	TSPC32_TV_SEC
 #endif
 
 	.text
@@ -192,7 +190,7 @@ V_FUNCTION_BEGIN(__kernel_time)
 	bl	__get_datapage@local
 	mr	r9, r3			/* datapage ptr in r9 */
 
-	lwz	r3,STAMP_XTIME+TSPEC_TV_SEC(r9)
+	lwz	r3,STAMP_XTIME_SEC+LOWPART(r9)
 
 	cmplwi	r11,0			/* check if t is NULL */
 	beq	2f
@@ -268,7 +266,7 @@ __do_get_tspec:
 	 * as a 32.32 fixed-point number in r3 and r4.
 	 * Load & add the xtime stamp.
 	 */
-	lwz	r5,STAMP_XTIME+TSPEC_TV_SEC(r9)
+	lwz	r5,STAMP_XTIME_SEC+LOWPART(r9)
 	lwz	r6,STAMP_SEC_FRAC(r9)
 	addc	r4,r4,r6
 	adde	r3,r3,r5
diff --git a/arch/powerpc/kernel/vdso64/gettimeofday.S b/arch/powerpc/kernel/vdso64/gettimeofday.S
index 07bfe33fe874..1f24e411af80 100644
--- a/arch/powerpc/kernel/vdso64/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso64/gettimeofday.S
@@ -116,8 +116,8 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
 	 * CLOCK_REALTIME_COARSE, below values are needed for MONOTONIC_COARSE
 	 * too
 	 */
-	ld      r4,STAMP_XTIME+TSPC64_TV_SEC(r3)
-	ld      r5,STAMP_XTIME+TSPC64_TV_NSEC(r3)
+	ld      r4,STAMP_XTIME_SEC(r3)
+	ld      r5,STAMP_XTIME_NSEC(r3)
 	bne     cr6,75f
 
 	/* CLOCK_MONOTONIC_COARSE */
@@ -220,7 +220,7 @@ V_FUNCTION_BEGIN(__kernel_time)
 	mr	r11,r3			/* r11 holds t */
 	bl	V_LOCAL_FUNC(__get_datapage)
 
-	ld	r4,STAMP_XTIME+TSPC64_TV_SEC(r3)
+	ld	r4,STAMP_XTIME_SEC(r3)
 
 	cmpldi	r11,0			/* check if t is NULL */
 	beq	2f
@@ -265,7 +265,7 @@ V_FUNCTION_BEGIN(__do_get_tspec)
 	mulhdu	r6,r6,r5		/* in units of 2^-32 seconds */
 
 	/* Add stamp since epoch */
-	ld	r4,STAMP_XTIME+TSPC64_TV_SEC(r3)
+	ld	r4,STAMP_XTIME_SEC(r3)
 	lwz	r5,STAMP_SEC_FRAC(r3)
 	or	r0,r4,r5
 	or	r0,r0,r6
-- 
2.20.0

