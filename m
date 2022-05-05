Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DEC51CDAA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 02:11:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvWFY2Pslz3fFs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:11:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MgDXPTK3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=MgDXPTK3; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvVzQ5RShz3cB7
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 09:59:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651795154; x=1683331154;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=Nult8sm5xsB/xmikf6OohjRwLwTEdiOtEi3jvHsqyXk=;
 b=MgDXPTK3UYW2j6npkuB9oICy4jtf3t+u3KvdDtyrpf8F98RPIDsQeQrL
 Od6m3uYCwliQ7e9CLPQ43zp7VqbnSzb1g3hhpzsNW9OniPycoZuk/hYEl
 zomYGgR6NbHodmSHghQ8ieCNMYPdTeCeT7tQUm9Zd7MPyeoJN4bSKuskQ
 FE/eJIP/CV7wu869/1ypjf6+iQl9JR+i7ZzJqdCa0DJPx8DEOSar305P7
 s4dDwK5+dbRi8S+rwH57dEvx9Xpve/RZ/tHNK6xEyfavGg3LfNa94zPyh
 Avz8pk6v8R8NuTG5QPOb8qaFIfsCvdgHqo3i03OB79DmFOuRZq2pC3OFy w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268437329"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268437329"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 16:57:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="694914415"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 16:57:52 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org
Subject: [PATCH v6 20/29] init/main: Delay initialization of the lockup
 detector after smp_init()
Date: Thu,  5 May 2022 16:59:59 -0700
Message-Id: <20220506000008.30892-21-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 Andi Kleen <ak@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 Joerg Roedel <joro@8bytes.org>, Ricardo Neri <ricardo.neri@intel.com>,
 Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Tony Luck <tony.luck@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Certain implementations of the hardlockup detector require support for
Inter-Processor Interrupt shorthands. On x86, support for these can only
be determined after all the possible CPUs have booted once (in
smp_init()). Other architectures may not need such check.

lockup_detector_init() only performs the initializations of data
structures of the lockup detector. Hence, there are no dependencies on
smp_init().

Cc: Andi Kleen <ak@linux.intel.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephane Eranian <eranian@google.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
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
index 98182c3c2c4b..62c52c9e4c2b 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1600,9 +1600,11 @@ static noinline void __init kernel_init_freeable(void)
 
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
2.17.1

