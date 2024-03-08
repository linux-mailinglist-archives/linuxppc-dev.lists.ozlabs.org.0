Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12403876548
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 14:28:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VZToW02V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Trn6Q5bhDz3wHn
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 00:27:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VZToW02V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrmtH4cyqz3vZ6
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Mar 2024 00:17:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709903848; x=1741439848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jf0Ify4PqkXxXfo1lgCW0RH1p8hV+xM9o246fKxlK4k=;
  b=VZToW02VJjP4aVAIOE3yOnvaHCy+urr8FUlylwH6G9fbMygOOErmdIW5
   Q+EffwzHh5TbM3+WbaTIP/wqdbM01t1zYjVDsmpnv1KzCIeZNcLafWPM3
   WQ0vAV73O9kjSekpJtVO7WKm3KVEoNapM//IBjQdQ4Y9tAfOlKMvyWyi3
   tNN5L125+fo9hKBt1QZI433sPpBTNNo3H1jDjpU7+AEpaKBMYnEVYKDzL
   JzdhhqtB5Q/JCGHlC3a+IDwjfpAn2q5lKpplC30Zfunx+dHrdguNaN1lI
   KdeVeyexL9RpF2/r5qqxV8YWV4UHcCPIFiUdu+kaqy35fDHlqUhPWjsFr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15342602"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15342602"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 05:16:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15161463"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO ahunter-VirtualBox.home\044ger.corp.intel.com) ([10.249.46.63])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 05:16:16 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 08/19] x86/vdso: Make delta calculation overflow safe
Date: Fri,  8 Mar 2024 15:15:01 +0200
Message-Id: <20240308131512.44324-9-adrian.hunter@intel.com>
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

Kernel timekeeping is designed to keep the change in cycles (since the last
timer interrupt) below max_cycles, which prevents multiplication overflow
when converting cycles to nanoseconds. However, if timer interrupts stop,
the calculation will eventually overflow.

Add protection against that. Select GENERIC_VDSO_OVERFLOW_PROTECT so that
max_cycles is made available in the VDSO data page. Check against
max_cycles, falling back to a slower higher precision calculation. Take
advantage of the opportunity to move masking and negative motion check
into the slow path.

The result is a calculation that has similar performance as before. Newer
machines showed performance benefit, whereas older Skylake-based hardware
such as Intel Kaby Lake was seen <1% worse.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 arch/x86/Kconfig                         |  1 +
 arch/x86/include/asm/vdso/gettimeofday.h | 29 +++++++++++++++++-------
 2 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 720b96388191..200f80a36593 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -168,6 +168,7 @@ config X86
 	select GENERIC_TIME_VSYSCALL
 	select GENERIC_GETTIMEOFDAY
 	select GENERIC_VDSO_TIME_NS
+	select GENERIC_VDSO_OVERFLOW_PROTECT
 	select GUP_GET_PXX_LOW_HIGH		if X86_PAE
 	select HARDIRQS_SW_RESEND
 	select HARDLOCKUP_CHECK_TIMESTAMP	if X86_64
diff --git a/arch/x86/include/asm/vdso/gettimeofday.h b/arch/x86/include/asm/vdso/gettimeofday.h
index 5727dedd3549..0ef36190abe6 100644
--- a/arch/x86/include/asm/vdso/gettimeofday.h
+++ b/arch/x86/include/asm/vdso/gettimeofday.h
@@ -319,18 +319,31 @@ static inline bool arch_vdso_cycles_ok(u64 cycles)
  */
 static __always_inline u64 vdso_calc_ns(const struct vdso_data *vd, u64 cycles, u64 base)
 {
+	u64 delta = cycles - vd->cycle_last;
+
 	/*
+	 * Negative motion and deltas which can cause multiplication
+	 * overflow require special treatment. This check covers both as
+	 * negative motion is guaranteed to be greater than @vd::max_cycles
+	 * due to unsigned comparison.
+	 *
 	 * Due to the MSB/Sign-bit being used as invalid marker (see
-	 * arch_vdso_cycles_valid() above), the effective mask is S64_MAX.
+	 * arch_vdso_cycles_valid() above), the effective mask is S64_MAX,
+	 * but that case is also unlikely and will also take the unlikely path
+	 * here.
 	 */
-	u64 delta = (cycles - vd->cycle_last) & S64_MAX;
+	if (unlikely(delta > vd->max_cycles)) {
+		/*
+		 * Due to the above mentioned TSC wobbles, filter out
+		 * negative motion.  Per the above masking, the effective
+		 * sign bit is now bit 62.
+		 */
+		if (delta & (1ULL << 62))
+			return base >> vd->shift;
 
-	/*
-	 * Due to the above mentioned TSC wobbles, filter out negative motion.
-	 * Per the above masking, the effective sign bit is now bit 62.
-	 */
-	if (unlikely(delta & (1ULL << 62)))
-		return base >> vd->shift;
+		/* Handle multiplication overflow gracefully */
+		return mul_u64_u32_add_u64_shr(delta & S64_MAX, vd->mult, base, vd->shift);
+	}
 
 	return ((delta * vd->mult) + base) >> vd->shift;
 }
-- 
2.34.1

