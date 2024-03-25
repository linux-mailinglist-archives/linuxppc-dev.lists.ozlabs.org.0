Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B22C8891A4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 07:45:36 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ga1gA8BA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V33NG0z0Jz3vnP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 17:45:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ga1gA8BA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=adrian.hunter@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V33HN0yY8z3d3g
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 17:41:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711348880; x=1742884880;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Exf/ex05wg/ZdHrQtagsjpQZFoomRp7dCTSrSntMNmc=;
  b=ga1gA8BAKzQb7oh/Iwa+rYdXezmDf6TNDYvHNqZfQktUh0I/P7Nktcm1
   dmtHhCAywTpPtdmk+Hh6t0CfGwNK/K1BC3Ib1t3sbhkXx91NkGxayDbBX
   UYQ3vJrlng0j1BzYnIiWlaj0ySPNBmeuLPYjrqg7JV9655eb25M/+O8to
   IXbW4QApbWkLAVVMODGcmuvsWcspr0MWLbQjEN3zQdfAzPkCo6sqwfAHc
   s4FJB/AV6BZ8Yue7sz9rgN3dUwSK0hgiWLRjobw9Fa99lB6F2xMC+ZvfG
   Sk69bspV4vaANF9NUhmiaBK6zaTdAHAnOSNoPLTw7UnNwWU6xLte+XNY9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="17065189"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="17065189"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 23:41:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="38629593"
Received: from ahunter6-mobl1.ger.corp.intel.com (HELO ahunter-VirtualBox.home\044ger.corp.intel.com) ([10.251.211.155])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2024 23:41:11 -0700
From: Adrian Hunter <adrian.hunter@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH V2 06/19] vdso: Add vdso_data::max_cycles
Date: Mon, 25 Mar 2024 08:40:10 +0200
Message-Id: <20240325064023.2997-7-adrian.hunter@intel.com>
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

