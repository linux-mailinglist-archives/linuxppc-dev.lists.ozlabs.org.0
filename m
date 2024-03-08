Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C6A8764F3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 14:18:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=etE9Pizk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Trmvq2TH3z3vhk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 00:18:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=etE9Pizk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrmsW3Jzhz3brL
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Mar 2024 00:16:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709903808; x=1741439808;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Iuin2TLNITc+qEDBj9pIL7Ct7NIGQ3DNopSaa0alFbU=;
  b=etE9PizkwrAfIciKUnsswgtGPsh/HleRa34zsAPmj63J3N6VCLjw0+rN
   qy2rAL3CLPH1SFQC3GQuT1ZJa4/cKuHNRl6dXPBw0gqjJect7ZTTaS3bu
   hSAlPXh0HgLq+pPv2WVd4vypa4UCJgrs9SekEIv+xun/YFRkwGZikApo/
   GoZulYXACCQ5CWxQH3iRfJZ/TYuoZrGJdOP5pisIiSpq9WV1Cg9tzsktI
   uOjt5Y6B/45+rL5+6Jfeh/4A7hv34Vv4F+O3wiV4/VNSuFl9Sl30ZkX73
   xlh/aOrVKcjhgfOG4bngshLGQgFNuFHgOOz903DPEAXYdPU16fGpOogOC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15342400"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15342400"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 05:15:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15161352"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO ahunter-VirtualBox.home\044ger.corp.intel.com) ([10.249.46.63])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 05:15:27 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 01/19] vdso: Consolidate vdso_calc_delta()
Date: Fri,  8 Mar 2024 15:14:54 +0200
Message-Id: <20240308131512.44324-2-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308131512.44324-1-adrian.hunter@intel.com>
References: <20240308131512.44324-1-adrian.hunter@intel.com>
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

Consolidate vdso_calc_delta(), in preparation for further simplification.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 17 ++---------------
 arch/s390/include/asm/vdso/gettimeofday.h    |  7 ++-----
 lib/vdso/gettimeofday.c                      |  4 ++++
 3 files changed, 8 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index f0a4cf01e85c..f4da8e18cdf3 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -14,6 +14,8 @@
 
 #define VDSO_HAS_TIME			1
 
+#define VDSO_DELTA_NOMASK		1
+
 static __always_inline int do_syscall_2(const unsigned long _r0, const unsigned long _r3,
 					const unsigned long _r4)
 {
@@ -105,21 +107,6 @@ static inline bool vdso_clocksource_ok(const struct vdso_data *vd)
 }
 #define vdso_clocksource_ok vdso_clocksource_ok
 
-/*
- * powerpc specific delta calculation.
- *
- * This variant removes the masking of the subtraction because the
- * clocksource mask of all VDSO capable clocksources on powerpc is U64_MAX
- * which would result in a pointless operation. The compiler cannot
- * optimize it away as the mask comes from the vdso data and is not compile
- * time constant.
- */
-static __always_inline u64 vdso_calc_delta(u64 cycles, u64 last, u64 mask, u32 mult)
-{
-	return (cycles - last) * mult;
-}
-#define vdso_calc_delta vdso_calc_delta
-
 #ifndef __powerpc64__
 static __always_inline u64 vdso_shift_ns(u64 ns, unsigned long shift)
 {
diff --git a/arch/s390/include/asm/vdso/gettimeofday.h b/arch/s390/include/asm/vdso/gettimeofday.h
index db84942eb78f..7937765ccfa5 100644
--- a/arch/s390/include/asm/vdso/gettimeofday.h
+++ b/arch/s390/include/asm/vdso/gettimeofday.h
@@ -6,16 +6,13 @@
 
 #define VDSO_HAS_CLOCK_GETRES 1
 
+#define VDSO_DELTA_NOMASK 1
+
 #include <asm/syscall.h>
 #include <asm/timex.h>
 #include <asm/unistd.h>
 #include <linux/compiler.h>
 
-#define vdso_calc_delta __arch_vdso_calc_delta
-static __always_inline u64 __arch_vdso_calc_delta(u64 cycles, u64 last, u64 mask, u32 mult)
-{
-	return (cycles - last) * mult;
-}
 
 static __always_inline const struct vdso_data *__arch_get_vdso_data(void)
 {
diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index ce2f69552003..042b95e8164d 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -13,7 +13,11 @@
 static __always_inline
 u64 vdso_calc_delta(u64 cycles, u64 last, u64 mask, u32 mult)
 {
+#ifdef VDSO_DELTA_NOMASK
+	return (cycles - last) * mult;
+#else
 	return ((cycles - last) & mask) * mult;
+#endif
 }
 #endif
 
-- 
2.34.1

