Return-Path: <linuxppc-dev+bounces-11263-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A85D6B3478C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 18:36:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9byc6SC7z3cgM;
	Tue, 26 Aug 2025 02:36:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756139768;
	cv=none; b=WlWJKgAlXZsw4d2gC35cPBXM8iIpQKwl+lHPJUIdpy/QCiXMZxpW/s3yI8EVC8+xsyKWBQJ981Kuo76Yx2bzXTiqE+g81T+D5OzuyRo386rryCtu6cqvT2LiYsDbtEK2BmjKKOvngyFdkBBbKU+XpUU7uLQBKXExohDUqXyh7CTNKcnOsKW1mYLUJQd+SltWzsEMQMZPwrE0RYVO/rvbWzmO24lXpVSP9IEGrDxO+mDlvzJD5gbtQWQ/o0E8bprRqOcgDK4ABT6GVCoPGs3qUWDF6953C9pPIYokNZubreXOIMgdFMKL4Ig0Mnjw2OrJvIxbAkt93zJCzbUt/9ewvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756139768; c=relaxed/relaxed;
	bh=2WyGocCgHBIIkkkxcd3AEqFZiqE4Qc8dTTZQnUK0iu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eXZnoTMF+8Hfhm48jyxNRtr+TNbDC+8vWOVWyMns6a02fqKv0uo0Kuvws+AJne/mBd5spHefaMX0Eg/CHECEol8FiqlwPHO4wFkSDbZz1LTeK/PxVa7bt+zk0QtTWb1TRH0KBZ2Tn4E26gkuO+RZeeBlMOjmR8SJjRMCMOrqBpj2CdWVf7c+l+E56TfqUCprBVucnpNUXzPLIRcQsLbpxN6TncVDrskaMAVeXmliPhVk+olI7cGh/imBa7kHVgand15pXAflBdX99rAuDYgsgiSGpHu2ZtRdJUfN1ckvRyYEa4ckvtVA2LFMehBHheN2HBoynRT1uxUXe8xhCGynxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CPZlKZyT; dkim-atps=neutral; spf=none (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CPZlKZyT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.13; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9byZ1xy8z3cYb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 02:36:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756139766; x=1787675766;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=WzmZWMms4bv8taptRv7sWNE6UwWdfM4GmVI+cXRz004=;
  b=CPZlKZyTI5mX4enDxCXfYJi8USezyD61K2v/EYO3OwqMtTx4JoLnMUS8
   JIrTkIMqmuDp9DavzV61W0N+DqtfowvqLAeHLWtq4Nioa+/ap0J1/yQ4+
   r5PVwDSehsyf70gtTO2UX5yEpnIO5uUoynH6UoiRJKV7OY4yewqXc2lwa
   58Me55X+ZKdUQcKhZH4UnSzoWL4cFjsSWM0yo9Olpk1pNhifHxz84y7DZ
   q3nzXbycvAE+zxwUmtLNExbFe2mY0EIYJr8t5rpxk4X90/xLcNHyft3bs
   x9vScilfhsiiaLeepowWZjFE6UKCCBNjj73DtXR8SBJnWSUApsOO6FVln
   w==;
X-CSE-ConnectionGUID: rFj2qNSMQg+Sd+BsDMuZHw==
X-CSE-MsgGUID: 9tgkT0SnQYCeZxCXeWMNuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11533"; a="69459539"
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="69459539"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2025 09:35:55 -0700
X-CSE-ConnectionGUID: wGy2mzdEQBu6ep/2AqbnXQ==
X-CSE-MsgGUID: NAapVdSxTk+ZacKhIWFZ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="169241086"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 25 Aug 2025 09:35:48 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id E1D6697; Mon, 25 Aug 2025 18:35:46 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Helge Deller <deller@gmx.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Thomas Fourier <fourier.thomas@gmail.com>,
	linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-block@vger.kernel.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Ian Molton <spyro@f2s.com>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Denis Efremov <efremov@linux.com>,
	Jens Axboe <axboe@kernel.dk>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 3/3] floppy: Sort headers alphabetically
Date: Mon, 25 Aug 2025 18:32:57 +0200
Message-ID: <20250825163545.39303-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
References: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Sorting headers alphabetically helps locating duplicates, and makes it
easier to figure out where to insert new headers.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/block/floppy.c | 54 +++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index d769a223fcc8..61d62019a38d 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -163,35 +163,35 @@
 
 /* do print messages for unexpected interrupts */
 static int print_unex = 1;
-#include <linux/module.h>
-#include <linux/sched.h>
-#include <linux/fs.h>
-#include <linux/kernel.h>
-#include <linux/timer.h>
-#include <linux/workqueue.h>
-#include <linux/fdreg.h>
-#include <linux/fd.h>
-#include <linux/hdreg.h>
-#include <linux/errno.h>
-#include <linux/slab.h>
-#include <linux/mm.h>
-#include <linux/bio.h>
-#include <linux/string.h>
-#include <linux/jiffies.h>
-#include <linux/fcntl.h>
-#include <linux/delay.h>
-#include <linux/mc146818rtc.h>	/* CMOS defines */
-#include <linux/ioport.h>
-#include <linux/interrupt.h>
-#include <linux/init.h>
-#include <linux/major.h>
-#include <linux/platform_device.h>
-#include <linux/mod_devicetable.h>
-#include <linux/mutex.h>
-#include <linux/io.h>
-#include <linux/uaccess.h>
 #include <linux/async.h>
+#include <linux/bio.h>
 #include <linux/compat.h>
+#include <linux/delay.h>
+#include <linux/errno.h>
+#include <linux/fcntl.h>
+#include <linux/fd.h>
+#include <linux/fdreg.h>
+#include <linux/fs.h>
+#include <linux/hdreg.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/major.h>
+#include <linux/mc146818rtc.h>	/* CMOS defines */
+#include <linux/mm.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/sched.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/timer.h>
+#include <linux/uaccess.h>
+#include <linux/workqueue.h>
 
 /*
  * PS/2 floppies have much slower step rates than regular floppies.
-- 
2.50.1


