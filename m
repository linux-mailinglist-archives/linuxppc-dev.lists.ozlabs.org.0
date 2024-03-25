Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE87889188
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 07:42:46 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kQoHWF1j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V33K03g5Fz3vdR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 17:42:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kQoHWF1j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V33Gt2N1sz3cVd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 17:40:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711348854; x=1742884854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yWOijviXmOaJVq1Hs5fWW3GVEDdadkoX8Z1Ik5RcbIA=;
  b=kQoHWF1jrnokm3pEnkb610an8A+4fnJMegIaopu6SsvMhbyt+yNqEN7r
   gVRwEw68S9Pm4WK1SdtX8WSgHzJooLfWh2BOPwIcA+tHTQZ6RsKv8vZcr
   L6pT3VUlrozTImhADMLKFxY8YL07gspPSsxxV/5xWrIEMeMSOBDgXPS+F
   JqoTXGlSGrMMihc4ix1REp6p3a7ehnhSis0baRIrn06w8nZSsvqi+25eo
   M99qigc9hSlHvDdFq1TmHDRsWbfj8RZrP2tGrfsF3HF/ecKHAke0Orx7q
   0Fe1u58Eih2+yZ6qIFNxBXuUfJolZ5H64OunI3V8n/HBHeGbvU0HLaaKg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="17065106"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="17065106"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 23:40:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="38629571"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO ahunter-VirtualBox.home\044ger.corp.intel.com) ([10.251.211.155])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 23:40:45 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH V2 02/19] vdso: Consolidate nanoseconds calculation
Date: Mon, 25 Mar 2024 08:40:06 +0200
Message-Id: <20240325064023.2997-3-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240325064023.2997-1-adrian.hunter@intel.com>
References: <20240325064023.2997-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki, Business Identity Code: 0357606 - 4, Domiciled in Helsinki
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, John Stultz <jstultz@google.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Consolidate nanoseconds calculation to simplify and reduce code
duplication.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---


Changes in V2:
	Adjusted due to changes in "vdso: Consolidate vdso_calc_delta()"


 arch/x86/include/asm/vdso/gettimeofday.h | 17 +++++----
 lib/vdso/gettimeofday.c                  | 45 +++++++++++-------------
 2 files changed, 28 insertions(+), 34 deletions(-)

diff --git a/arch/x86/include/asm/vdso/gettimeofday.h b/arch/x86/include/asm/vdso/gettimeofday.h
index 8e048ca980df..5727dedd3549 100644
--- a/arch/x86/include/asm/vdso/gettimeofday.h
+++ b/arch/x86/include/asm/vdso/gettimeofday.h
@@ -300,7 +300,7 @@ static inline bool arch_vdso_cycles_ok(u64 cycles)
 #define vdso_cycles_ok arch_vdso_cycles_ok
 
 /*
- * x86 specific delta calculation.
+ * x86 specific calculation of nanoseconds for the current cycle count
  *
  * The regular implementation assumes that clocksource reads are globally
  * monotonic. The TSC can be slightly off across sockets which can cause
@@ -308,8 +308,8 @@ static inline bool arch_vdso_cycles_ok(u64 cycles)
  * jump.
  *
  * Therefore it needs to be verified that @cycles are greater than
- * @last. If not then use @last, which is the base time of the current
- * conversion period.
+ * @vd->cycles_last. If not then use @vd->cycles_last, which is the base
+ * time of the current conversion period.
  *
  * This variant also uses a custom mask because while the clocksource mask of
  * all the VDSO capable clocksources on x86 is U64_MAX, the above code uses
@@ -317,25 +317,24 @@ static inline bool arch_vdso_cycles_ok(u64 cycles)
  * declares everything with the MSB/Sign-bit set as invalid. Therefore the
  * effective mask is S64_MAX.
  */
-static __always_inline
-u64 vdso_calc_delta(u64 cycles, u64 last, u64 mask, u32 mult)
+static __always_inline u64 vdso_calc_ns(const struct vdso_data *vd, u64 cycles, u64 base)
 {
 	/*
 	 * Due to the MSB/Sign-bit being used as invalid marker (see
 	 * arch_vdso_cycles_valid() above), the effective mask is S64_MAX.
 	 */
-	u64 delta = (cycles - last) & S64_MAX;
+	u64 delta = (cycles - vd->cycle_last) & S64_MAX;
 
 	/*
 	 * Due to the above mentioned TSC wobbles, filter out negative motion.
 	 * Per the above masking, the effective sign bit is now bit 62.
 	 */
 	if (unlikely(delta & (1ULL << 62)))
-		return 0;
+		return base >> vd->shift;
 
-	return delta * mult;
+	return ((delta * vd->mult) + base) >> vd->shift;
 }
-#define vdso_calc_delta vdso_calc_delta
+#define vdso_calc_ns vdso_calc_ns
 
 #endif /* !__ASSEMBLY__ */
 
diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index faccf12f7c03..9fa90e0794c9 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -5,23 +5,12 @@
 #include <vdso/datapage.h>
 #include <vdso/helpers.h>
 
-#ifndef vdso_calc_delta
+#ifndef vdso_calc_ns
 
 #ifdef VDSO_DELTA_NOMASK
-# define VDSO_DELTA_MASK(mask)	U64_MAX
+# define VDSO_DELTA_MASK(vd)	U64_MAX
 #else
-# define VDSO_DELTA_MASK(mask)	(mask)
-#endif
-
-/*
- * Default implementation which works for all sane clocksources. That
- * obviously excludes x86/TSC.
- */
-static __always_inline
-u64 vdso_calc_delta(u64 cycles, u64 last, u64 mask, u32 mult)
-{
-	return ((cycles - last) & VDSO_DELTA_MASK(mask)) * mult;
-}
+# define VDSO_DELTA_MASK(vd)	(vd->mask)
 #endif
 
 #ifndef vdso_shift_ns
@@ -31,6 +20,18 @@ static __always_inline u64 vdso_shift_ns(u64 ns, u32 shift)
 }
 #endif
 
+/*
+ * Default implementation which works for all sane clocksources. That
+ * obviously excludes x86/TSC.
+ */
+static __always_inline u64 vdso_calc_ns(const struct vdso_data *vd, u64 cycles, u64 base)
+{
+	u64 delta = (cycles - vd->cycle_last) & VDSO_DELTA_MASK(vd);
+
+	return vdso_shift_ns((delta * vd->mult) + base, vd->shift);
+}
+#endif /* vdso_calc_ns */
+
 #ifndef __arch_vdso_hres_capable
 static inline bool __arch_vdso_hres_capable(void)
 {
@@ -56,10 +57,10 @@ static inline bool vdso_cycles_ok(u64 cycles)
 static __always_inline int do_hres_timens(const struct vdso_data *vdns, clockid_t clk,
 					  struct __kernel_timespec *ts)
 {
-	const struct vdso_data *vd;
 	const struct timens_offset *offs = &vdns->offset[clk];
 	const struct vdso_timestamp *vdso_ts;
-	u64 cycles, last, ns;
+	const struct vdso_data *vd;
+	u64 cycles, ns;
 	u32 seq;
 	s64 sec;
 
@@ -80,10 +81,7 @@ static __always_inline int do_hres_timens(const struct vdso_data *vdns, clockid_
 		cycles = __arch_get_hw_counter(vd->clock_mode, vd);
 		if (unlikely(!vdso_cycles_ok(cycles)))
 			return -1;
-		ns = vdso_ts->nsec;
-		last = vd->cycle_last;
-		ns += vdso_calc_delta(cycles, last, vd->mask, vd->mult);
-		ns = vdso_shift_ns(ns, vd->shift);
+		ns = vdso_calc_ns(vd, cycles, vdso_ts->nsec);
 		sec = vdso_ts->sec;
 	} while (unlikely(vdso_read_retry(vd, seq)));
 
@@ -118,7 +116,7 @@ static __always_inline int do_hres(const struct vdso_data *vd, clockid_t clk,
 				   struct __kernel_timespec *ts)
 {
 	const struct vdso_timestamp *vdso_ts = &vd->basetime[clk];
-	u64 cycles, last, sec, ns;
+	u64 cycles, sec, ns;
 	u32 seq;
 
 	/* Allows to compile the high resolution parts out */
@@ -151,10 +149,7 @@ static __always_inline int do_hres(const struct vdso_data *vd, clockid_t clk,
 		cycles = __arch_get_hw_counter(vd->clock_mode, vd);
 		if (unlikely(!vdso_cycles_ok(cycles)))
 			return -1;
-		ns = vdso_ts->nsec;
-		last = vd->cycle_last;
-		ns += vdso_calc_delta(cycles, last, vd->mask, vd->mult);
-		ns = vdso_shift_ns(ns, vd->shift);
+		ns = vdso_calc_ns(vd, cycles, vdso_ts->nsec);
 		sec = vdso_ts->sec;
 	} while (unlikely(vdso_read_retry(vd, seq)));
 
-- 
2.34.1

