Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8D6672200
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 16:48:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxqtZ1kRjz3fJF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jan 2023 02:48:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C3Rpi2Tj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.55.52.93; helo=mga11.intel.com; envelope-from=andrzej.hajda@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C3Rpi2Tj;
	dkim-atps=neutral
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nxqpg1mCfz3fCq
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jan 2023 02:45:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674056731; x=1705592731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5UIRHWiv1nZeLK1bOeYIY8HLBo0tEoLtywnXrKNCGWQ=;
  b=C3Rpi2TjCKzsSBJYxOLBwXrOybnXCWjfGq8L5dvQq8XBAUx2ptKyko7B
   8ehOYrLniJSZjRqRfvkvx6A15RdHmx8f0yItH0Y0mHDwmH+DX5x5EdyLd
   5c6PeY/Zgb5ZNzvZBt7+Grxe96t2/qhTFXn/gme1Rd/1/D8jKrOATF5hs
   4Nqsscek2yCncrR4Y2uVkMcJiDIxGZ/bRs+7RnEXlxRIyhd9pNcfjTC34
   8YALgXwokbyaUUDIfGv3M6PQZdnY/wzLaEKTBvdb6XxgUVWuxR/YSlVZk
   0S3TS7o7L5kxrbeG0jJl/bSWk+oS6qk+Nxdw0uCXsxNAz2SWxPRK+VHS3
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="322701326"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="322701326"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 07:45:30 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="661759330"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="661759330"
Received: from lab-ah.igk.intel.com ([10.102.42.211])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 07:45:25 -0800
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
Subject: [PATCH v5 4/7] llist: simplify __llist_del_all
Date: Wed, 18 Jan 2023 16:44:47 +0100
Message-Id: <20230118154450.73842-4-andrzej.hajda@intel.com>
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

llist_del_all uses xchg, let's use __xchg here.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 include/linux/llist.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/linux/llist.h b/include/linux/llist.h
index 85bda2d02d65be..4dc1d185ea98ab 100644
--- a/include/linux/llist.h
+++ b/include/linux/llist.h
@@ -50,6 +50,7 @@
 
 #include <linux/atomic.h>
 #include <linux/container_of.h>
+#include <linux/non-atomic/xchg.h>
 #include <linux/stddef.h>
 #include <linux/types.h>
 
@@ -241,10 +242,7 @@ static inline struct llist_node *llist_del_all(struct llist_head *head)
 
 static inline struct llist_node *__llist_del_all(struct llist_head *head)
 {
-	struct llist_node *first = head->first;
-
-	head->first = NULL;
-	return first;
+	return __xchg(&head->first, NULL);
 }
 
 extern struct llist_node *llist_del_first(struct llist_head *head);
-- 
2.34.1

