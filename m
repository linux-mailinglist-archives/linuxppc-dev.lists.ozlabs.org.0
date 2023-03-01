Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FEE6A781C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:55:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRrhz2SYsz3fdb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:55:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H9dN0DdP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H9dN0DdP;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRrJc3cSJz3cMl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:38:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677713888; x=1709249888;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=xD5rPq6P/jQ6w9PLq/j9I8SmnPmQHq2Xa5HGzEHRX2c=;
  b=H9dN0DdPlGPgjv9W6E5XkYvuSf9wgjzCKt1/miR8HymrguGkh7guhEKi
   NXCeNuWk3jpta1vZHEwRjfOjK3NmFInAmtcEV4TimgtzweyTJj3GtJUHn
   YBl1Qaym+yrQiIzuMRKzfJBYMDvV8aQS/SwoXheKzumi1MyYwWmmT/k8U
   Fasw19aNh+Qw5gNgGj0fz/ogW8+XxVB033tVmtCjJw/SdehksdxIQLoOQ
   1pS7DJqw/ricGb5Tj45B4Z9mpuZ7XfxCxGE2M32+IzVCj0LCSw4cvJsJ6
   wNmZb0FHssG12EB+wmcqmTBn81yDiC7wifMoK+014R+5IPZvt6+0C+KRl
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420818780"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="420818780"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:37:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738826857"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738826857"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 15:37:59 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Len Brown <len.brown@intel.com>
Subject: [PATCH v7 18/24] init/main: Delay initialization of the lockup detector after smp_init()
Date: Wed,  1 Mar 2023 15:47:47 -0800
Message-Id: <20230301234753.28582-19-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230301234753.28582-1-ricardo.neri-calderon@linux.intel.com>
References: <20230301234753.28582-1-ricardo.neri-calderon@linux.intel.com>
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>, Andi Kleen <ak@linux.intel.com>, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Ricardo Neri <ricardo.neri@intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Certain implementations of the hardlockup detector require support for
Inter-Processor Interrupt shorthands. On x86, support for these can only
be determined after all the possible CPUs have booted once (in smp_init()).
Other architectures may not need such check.

lockup_detector_init() only performs the initializations of data structures
of the lockup detector. Hence, there are no dependencies on smp_init().

Cc: Andi Kleen <ak@linux.intel.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephane Eranian <eranian@google.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Reviewed-by: Tony Luck <tony.luck@intel.com>
Acked-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v6:
 * None

Changes since v5:
 * Introduced this patch

Changes since v4:
 * N/A

Changes since v3:
 * N/A

Changes since v2:
 * N/A

Changes since v1:
 * N/A
---
 init/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/init/main.c b/init/main.c
index 4425d1783d5c..d0642a49e2e8 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1620,9 +1620,11 @@ static noinline void __init kernel_init_freeable(void)
 
 	rcu_init_tasks_generic();
 	do_pre_smp_initcalls();
-	lockup_detector_init();
 
 	smp_init();
+
+	lockup_detector_init();
+
 	sched_init_smp();
 
 	padata_init();
-- 
2.25.1

