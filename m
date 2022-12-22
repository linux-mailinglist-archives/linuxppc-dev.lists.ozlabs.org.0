Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1328654212
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Dec 2022 14:43:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NdBN05ds9z3fQN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Dec 2022 00:43:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k1qe+xtp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=andrzej.hajda@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=k1qe+xtp;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nd7r82Q2Fz3bVK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Dec 2022 22:48:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671709736; x=1703245736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WISTUsk2o+/CiLC/dmDma5HABMnb/JSTbRj0TToQGYg=;
  b=k1qe+xtp55ll9Bsz6YDMLi+ewMw7vQdnRO76pl0eMn+ZLcmqr+cckxaq
   bifNIDJc4QUC2IMy3tI7YV769sDydvgOCjA21SMSGkAd6kV/xeadQgn1h
   zDzPuVDQgMh5Lb5nR/a55MplD59ZqC62eRtZ1Ig/PHn95Ywgriogoyok9
   OsF2KfgUEB0c2wPA2gOSxK0CLHLMWnZhoJmNNk2rAF/pyfeLFU97YmIZW
   AeCgQpN18uFuQV78Pp2nTKZl6h2YIlayGe1uT7xSA4r1ZoQDE9c/RR5tK
   XvM5DM0qYhZ6rosL0OdQY/bE9R/H2/RamZEXpiUW0Pb323Szm0rfu9zuU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="318804857"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="318804857"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:48:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="629504874"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="629504874"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:48:48 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 15/19] arch/sh: rename internal name __xchg to __arch_xchg
Date: Thu, 22 Dec 2022 12:46:31 +0100
Message-Id: <20221222114635.1251934-16-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222114635.1251934-1-andrzej.hajda@intel.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 23 Dec 2022 00:29:21 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__xchg will be used for non-atomic xchg macro.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 arch/sh/include/asm/cmpxchg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sh/include/asm/cmpxchg.h b/arch/sh/include/asm/cmpxchg.h
index 0ed9b3f4a57796..288f6f38d98fb4 100644
--- a/arch/sh/include/asm/cmpxchg.h
+++ b/arch/sh/include/asm/cmpxchg.h
@@ -22,7 +22,7 @@
 
 extern void __xchg_called_with_bad_pointer(void);
 
-#define __xchg(ptr, x, size)				\
+#define __arch_xchg(ptr, x, size)				\
 ({							\
 	unsigned long __xchg__res;			\
 	volatile void *__xchg_ptr = (ptr);		\
@@ -46,7 +46,7 @@ extern void __xchg_called_with_bad_pointer(void);
 })
 
 #define arch_xchg(ptr,x)	\
-	((__typeof__(*(ptr)))__xchg((ptr),(unsigned long)(x), sizeof(*(ptr))))
+	((__typeof__(*(ptr)))__arch_xchg((ptr),(unsigned long)(x), sizeof(*(ptr))))
 
 /* This function doesn't exist, so you'll get a linker error
  * if something tries to do an invalid cmpxchg(). */
-- 
2.34.1

