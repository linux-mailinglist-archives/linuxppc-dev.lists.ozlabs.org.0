Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4CA889170
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 07:41:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VJ9cHMZl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V33HR0JYWz3dWQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 17:41:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VJ9cHMZl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V33Gh3nlqz2xmC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 17:40:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711348844; x=1742884844;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9S3xrv7Gxvyj4H9Azn1pzm7Lwa+4CbIsrUr3ufmKQOM=;
  b=VJ9cHMZl8XoAdLmsrnlDCkQ0v/88V1L/LJA8Xub0H3pMDWzCF0O2U2v7
   g7a1bK++H+KDuijNjTTiRAfvd+Us3T+lRsO9AOH3edHTCcFVcW1oRH6wT
   Z2qcLae5VbXRnqVzQUvQAczXp95ULHysIMSqSxcgsTi203vfZ5tpyw6aK
   1+NtO8r5sLIInnVUrdneERhyNBr9VmlHpU3T+N6H5c7WXjVzLPsHvCGQ6
   UYHKuSomzvVAhKDsS62Xfn/m7urEfSbaiPT+g/lmXtc6pPtmsmdpAWfTk
   92vn5OY19PjhU8tDz1ZmzKZbKnlpTehSMLHD20D+POrP8OPyRBXE6AgsC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="17065053"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="17065053"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 23:40:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="38629553"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO ahunter-VirtualBox.home\044ger.corp.intel.com) ([10.251.211.155])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 23:40:32 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH V2 00/19] timekeeping: Handle potential multiplication overflow
Date: Mon, 25 Mar 2024 08:40:04 +0200
Message-Id: <20240325064023.2997-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.34.1
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

Hi

Kernel timekeeping calculates a clock value by keeping a base value and
adding the number of nanoseconds since that time. Those nanoseconds are
calculated from the clocksource delta. Then periodically, the base value is
moved forwards (refer timekeeping_advance()) which is done by the local
timer interrupt handler. It is designed such that there will always be a
timer interrupt before the delta becomes big enough to overflow the 64-bit
multiplication used in the conversion of delta to nanoseconds (refer
timekeeping_delta_to_ns()). Obviously if timer interrupts are stopped, then
the multiplication does eventually overflow.

Timekeeping multiplication overflow results in a "time loop", typically
cycling about every 15 minutes with x86 TSC, for example starting at 10:00:

  10:00, 10:01, 10:02 ... 10:15, 10:00, 10:01, ... 10:15, 10:00, 10:01 ...

Because a VMM can deliberately stop timer interrupts for a guest, a virtual
machine can be exposed to this issue.

TDX maintains a monotonically increasing virtual TSC for a TDX guest, so
the overflow is allowing a backwards movement of timekeeping that would not
happen otherwise.

It is considered this could break security of cryptographic protocols that
rely on the timestamps for freshness / replay protection, and consequently
the kernel should prevent such a time loop.

Handle multiplication overflows by falling back to higher precision
calculation when the possibility of an overflow is detected.

Extend the facility also to VDSO, dependent on new config option
GENERIC_VDSO_OVERFLOW_PROTECT which is selected by x86 only, so other
architectures are not affected. The result is a calculation that has
similar performance as before. Most machines showed performance benefit,
except Skylake-based hardware such as Intel Kaby Lake which was seen <1%
worse.


Changes in V2:
    vdso: Consolidate vdso_calc_delta()
	Keep powerpc comment about mask
	Move ifdef out of function
    vdso: Consolidate nanoseconds calculation
	Adjusted due to changes in "vdso: Consolidate vdso_calc_delta()"


Adrian Hunter (19):
      vdso: Consolidate vdso_calc_delta()
      vdso: Consolidate nanoseconds calculation
      vdso: Add CONFIG_GENERIC_VDSO_OVERFLOW_PROTECT
      math64: Tidy mul_u64_u32_shr()
      vdso: math64: Provide mul_u64_u32_add_u64_shr()
      vdso: Add vdso_data::max_cycles
      vdso: Make delta calculation overflow safe
      x86/vdso: Make delta calculation overflow safe
      timekeeping: Move timekeeping helper functions
      timekeeping: Rename fast_tk_get_delta_ns() to __timekeeping_get_ns()
      timekeeping: Tidy timekeeping_cycles_to_ns() slightly
      timekeeping: Reuse timekeeping_cycles_to_ns()
      timekeeping: Refactor timekeeping helpers
      timekeeping: Consolidate timekeeping helpers
      timekeeping: Fold in timekeeping_delta_to_ns()
      timekeeping: Prepare timekeeping_cycles_to_ns() for overflow safety
      timekeeping: Make delta calculation overflow safe
      timekeeping: Let timekeeping_cycles_to_ns() handle both under and overflow
      clocksource: Make watchdog and suspend-timing multiplication overflow safe

 arch/powerpc/include/asm/vdso/gettimeofday.h |  26 +++----
 arch/s390/include/asm/vdso/gettimeofday.h    |   7 +-
 arch/x86/Kconfig                             |   1 +
 arch/x86/include/asm/vdso/gettimeofday.h     |  42 +++++++----
 include/linux/math64.h                       |   8 +-
 include/vdso/datapage.h                      |   4 +
 include/vdso/math64.h                        |  38 ++++++++++
 kernel/time/clocksource.c                    |  42 +++++------
 kernel/time/timekeeping.c                    | 106 ++++++++++++++-------------
 kernel/time/vsyscall.c                       |   6 ++
 lib/vdso/Kconfig                             |   7 ++
 lib/vdso/gettimeofday.c                      |  55 +++++++++-----
 12 files changed, 208 insertions(+), 134 deletions(-)


Regards
Adrian
