Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B806A77D7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:42:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRrPT6Pjmz3f4t
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:42:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TUujS3yU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TUujS3yU;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRrJY093nz3c9K
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:38:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677713885; x=1709249885;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=K9unSxI1ETIAj+1EQ34Lma1zVNuCMXNt2Vl73pS93As=;
  b=TUujS3yUhSfD7Chvm02pO0rCpM8nxfn41zHwxf/TEG1Fp6n46eql8Ezl
   zJmcxzKfqpYhWjoDU7H7ud6GZZ+sBHVmJAnbnZqGHISY54ISPuyqIPBGE
   UPWireq888+y5uj5ekDxZ5F8pvABoBSw2ydnujHNvM8jqtr7vArrK1C3k
   qfiMqRQCLNC/+4KJn5pYoq+RDcLx7hzTKJ3qU0l3l875aG3DENM4TdVGS
   Qssnj8DZn72gNj3H7vd70ZVogLIf6OYHdnCTHKCetlK7kxU2PpwmOFiUt
   sMDgYLIbJ7kt4QGnHg7h8Eli3myEi5YQlNcqudj2MHFiYbVQifa2WX8et
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420818696"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="420818696"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:37:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738826802"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738826802"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 15:37:56 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Len Brown <len.brown@intel.com>
Subject: [PATCH v7 05/24] x86/apic/vector: Skip cleanup for the NMI vector
Date: Wed,  1 Mar 2023 15:47:34 -0800
Message-Id: <20230301234753.28582-6-ricardo.neri-calderon@linux.intel.com>
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>, Andi Kleen <ak@linux.intel.com>, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Ricardo Neri <ricardo.neri@intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The NMI vector is fixed. No cleanup is needed after updating affinity.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>

---
Changes since v6:
 * Introduced this patch.

Changes since v5:
 * N/A

Changes since v4:
 * N/A

Changes since v3:
 * N/A

Changes since v2:
 * N/A

Changes since v1:
 * N/A
---
 arch/x86/kernel/apic/vector.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/kernel/apic/vector.c b/arch/x86/kernel/apic/vector.c
index a4cf041427cb..3045823ecc1b 100644
--- a/arch/x86/kernel/apic/vector.c
+++ b/arch/x86/kernel/apic/vector.c
@@ -1050,6 +1050,10 @@ void send_cleanup_vector(struct irq_cfg *cfg)
 {
 	struct apic_chip_data *apicd;
 
+	/* NMI has a fixed vector. No vector management required. */
+	if (cfg->delivery_mode == APIC_DELIVERY_MODE_NMI)
+		return;
+
 	apicd = container_of(cfg, struct apic_chip_data, hw_irq_cfg);
 	if (apicd->move_in_progress)
 		__send_cleanup_vector(apicd);
-- 
2.25.1

