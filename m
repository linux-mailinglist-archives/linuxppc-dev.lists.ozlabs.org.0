Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9918288919D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 07:44:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cxlt0tyT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V33MT2htmz3vlG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 17:44:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cxlt0tyT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V33HC6wKmz3dXG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 17:41:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711348872; x=1742884872;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LAWkJDgSOoQXttIOaNX5OjXrKNZqw1gNI6g5JMXltWY=;
  b=cxlt0tyTGmvdjofo44v24BMYM+Of5ekMC9DkDBMZkzbe/kIgn0ASWQoy
   7+UnueDzJKUs/cuM4KZWOflk97FRArh6UE6JwIyNt8OSDSyULgH8KR3W1
   Ag3H7A8BM3LIIpf+hiQQHejdjha/aGGUpmxnrdSWfByDNliCtlxD7AnSM
   GHos/SKHUTdUUV1Fw6MCbIh9VVPAY+d4Ku3ZKRWWBnliQTkmE6CFxmLxX
   d8vVZngWjRObGeoqjASBsT6qlEEdZ39jv0cYglM5VmUENVXBncS8wWRnL
   f/XGAABhUZqmbnQhf5+GTpZPmo5snHXIuc8zIJj1FnGF5zu75Tnt2YTc7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="17065162"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="17065162"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 23:41:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="38629590"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO ahunter-VirtualBox.home\044ger.corp.intel.com) ([10.251.211.155])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 23:41:05 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH V2 05/19] vdso: math64: Provide mul_u64_u32_add_u64_shr()
Date: Mon, 25 Mar 2024 08:40:09 +0200
Message-Id: <20240325064023.2997-6-adrian.hunter@intel.com>
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

Provide mul_u64_u32_add_u64_shr() which is a calculation that will be used
by timekeeping and VDSO.

Place #include <vdso/math64.h> after #include <asm/div64.h> to allow
architecture-specific overrides, at least for the kernel.

Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 include/linux/math64.h |  2 +-
 include/vdso/math64.h  | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/include/linux/math64.h b/include/linux/math64.h
index fd13622b2056..d34def7f9a8c 100644
--- a/include/linux/math64.h
+++ b/include/linux/math64.h
@@ -4,8 +4,8 @@
 
 #include <linux/types.h>
 #include <linux/math.h>
-#include <vdso/math64.h>
 #include <asm/div64.h>
+#include <vdso/math64.h>
 
 #if BITS_PER_LONG == 64
 
diff --git a/include/vdso/math64.h b/include/vdso/math64.h
index 7da703ee5561..22ae212f8b28 100644
--- a/include/vdso/math64.h
+++ b/include/vdso/math64.h
@@ -21,4 +21,42 @@ __iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
 	return ret;
 }
 
+#if defined(CONFIG_ARCH_SUPPORTS_INT128) && defined(__SIZEOF_INT128__)
+
+#ifndef mul_u64_u32_add_u64_shr
+static __always_inline u64 mul_u64_u32_add_u64_shr(u64 a, u32 mul, u64 b, unsigned int shift)
+{
+	return (u64)((((unsigned __int128)a * mul) + b) >> shift);
+}
+#endif /* mul_u64_u32_add_u64_shr */
+
+#else
+
+#ifndef mul_u64_u32_add_u64_shr
+#ifndef mul_u32_u32
+static inline u64 mul_u32_u32(u32 a, u32 b)
+{
+	return (u64)a * b;
+}
+#define mul_u32_u32 mul_u32_u32
+#endif
+static __always_inline u64 mul_u64_u32_add_u64_shr(u64 a, u32 mul, u64 b, unsigned int shift)
+{
+	u32 ah = a >> 32, al = a;
+	bool ovf;
+	u64 ret;
+
+	ovf = __builtin_add_overflow(mul_u32_u32(al, mul), b, &ret);
+	ret >>= shift;
+	if (ovf && shift)
+		ret += 1ULL << (64 - shift);
+	if (ah)
+		ret += mul_u32_u32(ah, mul) << (32 - shift);
+
+	return ret;
+}
+#endif /* mul_u64_u32_add_u64_shr */
+
+#endif
+
 #endif /* __VDSO_MATH64_H */
-- 
2.34.1

