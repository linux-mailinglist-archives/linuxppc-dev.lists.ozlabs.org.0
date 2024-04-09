Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C96589D279
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 08:30:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZrTINxAu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDGL56LvPz3vZs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 16:30:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZrTINxAu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.9; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDGG46dFnz3vcG
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 16:27:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712644030; x=1744180030;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YBgFeEcKNu6z1EOuKIDtV8ucxUi4txUooaEev8PsP28=;
  b=ZrTINxAu9xNU70uQozUOVSYO29RmfVNyRIPpzc01hQsgI7p74ZsWXzoF
   z/qdcXtd0CL6XY0zGg4rT3bV+saCS9FpHVYZiQrTVxpaePFkm6Y3UZFrd
   oPOl/YznBgotJUiy80+ZOl2MZIX6ZDxPOnignCj8pAD6UFtteZM3p+C/f
   YjItRMQuDre/Kaz1JHENoKX9HV1bLmweEywv/BIQzquda23OQfYDDSR08
   lj7Omx/2cbFoADH5NOJGxjWz+QTTB3k7jiVEXxnmkp67qjTsUHctaBReo
   eQWtgTOsTsLhQS9tbs/oWluTTxuHAEaiwwNMEhyTL7RuUZBVSxHjib0J4
   A==;
X-CSE-ConnectionGUID: RtrpdgfMRQWXQESgbm6CIQ==
X-CSE-MsgGUID: 8nX1dabST5mLeb2blLMrwQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="30436615"
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="30436615"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 23:27:05 -0700
X-CSE-ConnectionGUID: i4DhQ/5wQ5+lYrCrL9n3Kg==
X-CSE-MsgGUID: HlKELBhTQnaCEeG1ZpmSMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,188,1708416000"; 
   d="scan'208";a="51129094"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO ahunter-VirtualBox.home\044ger.corp.intel.com) ([10.249.37.26])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 23:26:57 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] vdso: Fix powerpc build U64_MAX undeclared error
Date: Tue,  9 Apr 2024 09:26:39 +0300
Message-Id: <20240409062639.3393-1-adrian.hunter@intel.com>
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

U64_MAX is not in include/vdso/limits.h, although that isn't noticed on x86
because x86 includes include/linux/limits.h indirectly. However powerpc
is more selective, resulting in the following build error:

  In file included from <command-line>:
  lib/vdso/gettimeofday.c: In function 'vdso_calc_ns':
  lib/vdso/gettimeofday.c:11:33: error: 'U64_MAX' undeclared
     11 | # define VDSO_DELTA_MASK(vd)    U64_MAX
        |                                 ^~~~~~~

Use ULLONG_MAX instead which will work just as well and is in
include/vdso/limits.h.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Closes: https://lore.kernel.org/all/20240409124905.6816db37@canb.auug.org.au/
Fixes: c8e3a8b6f2e6 ("vdso: Consolidate vdso_calc_delta()")
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 lib/vdso/gettimeofday.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 9c3a8d2440c9..899850bd6f0b 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -8,7 +8,7 @@
 #ifndef vdso_calc_ns
 
 #ifdef VDSO_DELTA_NOMASK
-# define VDSO_DELTA_MASK(vd)	U64_MAX
+# define VDSO_DELTA_MASK(vd)	ULLONG_MAX
 #else
 # define VDSO_DELTA_MASK(vd)	(vd->mask)
 #endif
-- 
2.34.1

