Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC5889FBAC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 17:34:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UZy8W1TI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VF6M12YZCz3d2g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 01:34:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UZy8W1TI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=198.175.65.16; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Thu, 11 Apr 2024 01:33:42 AEST
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VF6LG02Tfz30PD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 01:33:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712763222; x=1744299222;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dEgjPQZVrrL7vqI7IKViUp1qmoIOfEl5s9dyPS1YBmo=;
  b=UZy8W1TIuGLxhKLVl8JqRulReowS8eHyJ6DxQwkcid4JX9JftDChv5Hq
   5jceigS6/ht3cfjvr1m9csxqT+yF8iJSdaWNXN3RDzBd6oEbtPJ3Y5L2s
   aglH47wJlJzTGfETjli/cWwmfY2kVrMNEH4bbhMFiPGMBuEqZNwiBLXYB
   VHkDWsrM8JENV8n3VOvdXiCKT4MVHE2YcGMYfmsuMDBS6ciyhQXt+KMJX
   TH4+HTEABIvXtlTyE56YdPseG5lSorLfWaEDUhnotDr1SNgPFoW3j3/J9
   GIkCbvX4JT5BKgTSjDeJFK+3JWyBMeu4otY/VEWy6VvmjGqPWWPccOvii
   w==;
X-CSE-ConnectionGUID: qk6dnzy2RGKKcCf1kwZGpg==
X-CSE-MsgGUID: sFmg1dXeShKTd2gosAN3RQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8260350"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8260350"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 08:32:32 -0700
X-CSE-ConnectionGUID: m+bpUFx2Q5yIztOqKC/y2g==
X-CSE-MsgGUID: eZS9QWdnQA+wEYN3JBJnXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="51568789"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO ahunter-VirtualBox.home\044ger.corp.intel.com) ([10.251.214.234])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2024 08:32:25 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] bug: Fix no-return-statement warning with !CONFIG_BUG
Date: Wed, 10 Apr 2024 18:32:12 +0300
Message-Id: <20240410153212.127477-1-adrian.hunter@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, John Stultz <jstultz@google.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Naresh Kamboju <naresh.kamboju@linaro.org>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, Anna-Maria Behnsen <anna-maria@linutronix.de>, Stephen Boyd <sboyd@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

BUG() does not return, and arch implementations of BUG() use unreachable()
or other non-returning code. However with !CONFIG_BUG, the default
implementation is often used instead, and that does not do that. x86 always
uses its own implementation, but powerpc with !CONFIG_BUG gives a build
error:

  kernel/time/timekeeping.c: In function ‘timekeeping_debug_get_ns’:
  kernel/time/timekeeping.c:286:1: error: no return statement in function
  returning non-void [-Werror=return-type]

Add unreachable() to default !CONFIG_BUG BUG() implementation.

Fixes: e8e9d21a5df6 ("timekeeping: Refactor timekeeping helpers")
Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
Closes: https://lore.kernel.org/all/CA+G9fYvjdZCW=7ZGxS6A_3bysjQ56YF7S-+PNLQ_8a4DKh1Bhg@mail.gmail.com/
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 include/asm-generic/bug.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/bug.h b/include/asm-generic/bug.h
index 6e794420bd39..b7de3a4eade1 100644
--- a/include/asm-generic/bug.h
+++ b/include/asm-generic/bug.h
@@ -156,7 +156,10 @@ extern __printf(1, 2) void __warn_printk(const char *fmt, ...);
 
 #else /* !CONFIG_BUG */
 #ifndef HAVE_ARCH_BUG
-#define BUG() do {} while (1)
+#define BUG() do {		\
+	do {} while (1);	\
+	unreachable();		\
+} while (0)
 #endif
 
 #ifndef HAVE_ARCH_BUG_ON
-- 
2.34.1

