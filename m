Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FFC654217
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Dec 2022 14:45:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NdBR2708xz3fJk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Dec 2022 00:45:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dnRQbvgK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=andrzej.hajda@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dnRQbvgK;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nd7rS6ZFYz3bVZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Dec 2022 22:49:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671709753; x=1703245753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tIRocWwFeyLnkMyWNI6V183GDJq3vxxO+e0RyrK1iBA=;
  b=dnRQbvgKFGhPswUk8vFkjePyZPKIVjSmtsVioD7FCUk26tE9tj0FC2al
   YC28XUfKFU64LaQThPC0EoGptZwVdCbTVxTTZgoaCMHRrBVaFJq9W26kP
   3xti6CpH2FSPNfSB3y/b5WMqCYCU07p7ZkqXraHIxZg7czoKodKVbFmPS
   zscAJVF+3fjgH51fnPwTnDgkW9J5WM7vadm+7f8x6ZuZ867zJN84jO2px
   +XFWiTNJowo1YqrDYfvS6A6M7zZjlOyIlKTkcvmzDCSjH6D/XqAMll3Bg
   jk/8p95GEznm0fyG1iy5+knk4J0rP+hFQDYc50iq24hUegZBGnsaOS7mV
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="318804939"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="318804939"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:49:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="629504949"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="629504949"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:49:06 -0800
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
Subject: [PATCH 18/19] linux/include: add non-atomic version of xchg
Date: Thu, 22 Dec 2022 12:46:34 +0100
Message-Id: <20221222114635.1251934-19-andrzej.hajda@intel.com>
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

The pattern of setting variable with new value and returning old
one is very common in kernel. Usually atomicity of the operation
is not required, so xchg seems to be suboptimal and confusing in
such cases.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
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

