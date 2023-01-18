Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 783FA6721F5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 16:47:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxqrN2gLwz3fCS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 02:47:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kRzthRqp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=andrzej.hajda@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kRzthRqp;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxqpS5Zpcz3cfP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 02:45:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674056721; x=1705592721;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Z8X5newU9XL5BwcTC700iSbaht4sEux85LO6OUO0+Oc=;
  b=kRzthRqpaSUCB9rLpii3U1Tz8nmImHWHhiPazVlNMZzfgFHAJ0gpx1GJ
   kd/vB2z4CJN4EJcVPwTfwty2eZz7T4JWUKlZa/2V3R4qnM5zXXLTR+dnF
   7Sn3QZn4GdLlCqkUx4+hnF7j09F01wsPEHKaYlJqLu27FKldBSWwkEI9Q
   TaV4elDY8KeZs90ooUkuiAHc8Gdz6PE0aZ1TbuS2tka8Y9XSUAWS4x/B9
   eFn+i39vke+FzD04LmBD6kVu1F4+Tm0HbYzZpiXlGylpAHcO0phLZwdqF
   L8XRg+jGXIqxIwcOYtUI/3R1VIasW56MXEc4gZHAW4GyIR9YAxLLoWvsN
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="322701232"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="322701232"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 07:45:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="661759280"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="661759280"
Received: from lab-ah.igk.intel.com ([10.102.42.211])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 07:45:14 -0800
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
Subject: [PATCH v5 2/7] linux/include: add non-atomic version of xchg
Date: Wed, 18 Jan 2023 16:44:45 +0100
Message-Id: <20230118154450.73842-2-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230118154450.73842-1-andrzej.hajda@intel.com>
References: <20230118153529.57695-1-andrzej.hajda@intel.com>
 <20230118154450.73842-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
Cc: Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Andrew Morton <akpm@linux-foundation.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pattern of setting variable with new value and returning old
one is very common in kernel. Usually atomicity of the operation
is not required, so xchg seems to be suboptimal and confusing in
such cases.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/non-atomic/xchg.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 include/linux/non-atomic/xchg.h

diff --git a/include/linux/non-atomic/xchg.h b/include/linux/non-atomic/xchg.h
new file mode 100644
index 00000000000000..f7fa5dd746f37d
--- /dev/null
+++ b/include/linux/non-atomic/xchg.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_NON_ATOMIC_XCHG_H
+#define _LINUX_NON_ATOMIC_XCHG_H
+
+/**
+ * __xchg - set variable pointed by @ptr to @val, return old value
+ * @ptr: pointer to affected variable
+ * @val: value to be written
+ *
+ * This is non-atomic variant of xchg.
+ */
+#define __xchg(ptr, val) ({		\
+	__auto_type __ptr = ptr;	\
+	__auto_type __t = *__ptr;	\
+	*__ptr = (val);			\
+	__t;				\
+})
+
+#endif
-- 
2.34.1

