Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CE6876526
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 14:25:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KDPO3FHj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Trn392fG5z3w69
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Mar 2024 00:25:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KDPO3FHj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Trmt21fJ8z3vXK
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Mar 2024 00:17:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709903834; x=1741439834;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Exf/ex05wg/ZdHrQtagsjpQZFoomRp7dCTSrSntMNmc=;
  b=KDPO3FHjpzgry90cCUoO13BtX9V3p1XKSg60ftRsJwYjOehbdEnl+sGh
   wrE/hzy2y+Et8Tlntrz0+2P6jzKnQFPB4nFxoS9NpHzyU2ftrqJGNOaXe
   utGP9SAta9ZwIwTZn0O9EzgviLbUzQFF9lya7R1KmTLaZLYq6LSyClTRk
   0ISRGxS7lA6okEj+LVgQSsQRqSKvy0mjiWyKYwZwR90lXaUoft4a6iOoL
   6eszbRN4to18Jb1J5O6yRyCen6nXu7s/Z4JhNuk/e2Ye6IHIq7tCZOnq7
   xO8v4MnAyjx/UB1VNYRmqrj3DSJOERyjzUvIpc02qMd11MKPatInq78fN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="15342540"
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15342540"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 05:16:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,109,1708416000"; 
   d="scan'208";a="15161409"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO ahunter-VirtualBox.home\044ger.corp.intel.com) ([10.249.46.63])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 05:16:02 -0800
From: Adrian Hunter <adrian.hunter@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 06/19] vdso: Add vdso_data::max_cycles
Date: Fri,  8 Mar 2024 15:14:59 +0200
Message-Id: <20240308131512.44324-7-adrian.hunter@intel.com>
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

Add vdso_data::max_cycles in preparation to use it to detect potential
multiplication overflow.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Adrian Hunter <adrian.hunter@intel.com>
---
 include/vdso/datapage.h | 4 ++++
 kernel/time/vsyscall.c  | 6 ++++++
 2 files changed, 10 insertions(+)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index 5d5c0b8efff2..6c3d67d6b758 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -67,6 +67,7 @@ struct vdso_timestamp {
  * @seq:		timebase sequence counter
  * @clock_mode:		clock mode
  * @cycle_last:		timebase at clocksource init
+ * @max_cycles:		maximum cycles which won't overflow 64bit multiplication
  * @mask:		clocksource mask
  * @mult:		clocksource multiplier
  * @shift:		clocksource shift
@@ -98,6 +99,9 @@ struct vdso_data {
 
 	s32			clock_mode;
 	u64			cycle_last;
+#ifdef CONFIG_GENERIC_VDSO_OVERFLOW_PROTECT
+	u64			max_cycles;
+#endif
 	u64			mask;
 	u32			mult;
 	u32			shift;
diff --git a/kernel/time/vsyscall.c b/kernel/time/vsyscall.c
index f0d5062d9cbc..9193d6133e5d 100644
--- a/kernel/time/vsyscall.c
+++ b/kernel/time/vsyscall.c
@@ -22,10 +22,16 @@ static inline void update_vdso_data(struct vdso_data *vdata,
 	u64 nsec, sec;
 
 	vdata[CS_HRES_COARSE].cycle_last	= tk->tkr_mono.cycle_last;
+#ifdef CONFIG_GENERIC_VDSO_OVERFLOW_PROTECT
+	vdata[CS_HRES_COARSE].max_cycles	= tk->tkr_mono.clock->max_cycles;
+#endif
 	vdata[CS_HRES_COARSE].mask		= tk->tkr_mono.mask;
 	vdata[CS_HRES_COARSE].mult		= tk->tkr_mono.mult;
 	vdata[CS_HRES_COARSE].shift		= tk->tkr_mono.shift;
 	vdata[CS_RAW].cycle_last		= tk->tkr_raw.cycle_last;
+#ifdef CONFIG_GENERIC_VDSO_OVERFLOW_PROTECT
+	vdata[CS_RAW].max_cycles		= tk->tkr_raw.clock->max_cycles;
+#endif
 	vdata[CS_RAW].mask			= tk->tkr_raw.mask;
 	vdata[CS_RAW].mult			= tk->tkr_raw.mult;
 	vdata[CS_RAW].shift			= tk->tkr_raw.shift;
-- 
2.34.1

