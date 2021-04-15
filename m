Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D05B360AF1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 15:46:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLgcY2Trwz3c0Q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 23:46:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.100; helo=mga07.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLgcD2Fd8z3019
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 23:46:35 +1000 (AEST)
IronPort-SDR: AY/fKWKkjtUjDiKGevrBub64Bx+Y0/Rrvc8B5M1u3hcr0nC2/6lwAqtJ8Ltxb9T2eJJkceRtvv
 dxPE+AinRSTw==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="258813387"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="258813387"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 06:46:29 -0700
IronPort-SDR: u2uZssqTys+8Gc4MtRXWS7kFK+8hKU90Pe/y4BI/aYbQOIul2Lkm5tWXKENxWglWuAvrl5Irgk
 1wDi7SFV+afA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="461619424"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga001.jf.intel.com with ESMTP; 15 Apr 2021 06:46:27 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 0899B12A; Thu, 15 Apr 2021 16:46:43 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] powerpc/papr_scm: Properly handle UUID types and API
Date: Thu, 15 Apr 2021 16:46:37 +0300
Message-Id: <20210415134637.17770-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: Oliver O'Halloran <oohall@gmail.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Parse to and export from UUID own type, before dereferencing.
This also fixes wrong comment (Little Endian UUID is something else)
and should fix Sparse warnings about assigning strict types to POD.

Fixes: 43001c52b603 ("powerpc/papr_scm: Use ibm,unit-guid as the iset cookie")
Fixes: 259a948c4ba1 ("powerpc/pseries/scm: Use a specific endian format for storing uuid from the device tree")
Cc: Oliver O'Halloran <oohall@gmail.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
Not tested
 arch/powerpc/platforms/pseries/papr_scm.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index ae6f5d80d5ce..4366e1902890 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -1085,8 +1085,9 @@ static int papr_scm_probe(struct platform_device *pdev)
 	u32 drc_index, metadata_size;
 	u64 blocks, block_size;
 	struct papr_scm_priv *p;
+	u8 uuid_raw[UUID_SIZE];
 	const char *uuid_str;
-	u64 uuid[2];
+	uuid_t uuid;
 	int rc;
 
 	/* check we have all the required DT properties */
@@ -1129,16 +1130,18 @@ static int papr_scm_probe(struct platform_device *pdev)
 	p->hcall_flush_required = of_property_read_bool(dn, "ibm,hcall-flush-required");
 
 	/* We just need to ensure that set cookies are unique across */
-	uuid_parse(uuid_str, (uuid_t *) uuid);
+	uuid_parse(uuid_str, &uuid);
+
 	/*
 	 * cookie1 and cookie2 are not really little endian
-	 * we store a little endian representation of the
+	 * we store a raw buffer representation of the
 	 * uuid str so that we can compare this with the label
 	 * area cookie irrespective of the endian config with which
 	 * the kernel is built.
 	 */
-	p->nd_set.cookie1 = cpu_to_le64(uuid[0]);
-	p->nd_set.cookie2 = cpu_to_le64(uuid[1]);
+	export_uuid(uuid_raw, &uuid);
+	p->nd_set.cookie1 = get_unaligned_le64(&uuid_raw[0]);
+	p->nd_set.cookie2 = get_unaligned_le64(&uuid_raw[8]);
 
 	/* might be zero */
 	p->metadata_size = metadata_size;
-- 
2.30.2

