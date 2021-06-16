Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC6E3A9C59
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 15:43:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4mbb74P4z3c0P
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 23:43:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4mbG66Jjz2yWR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 23:42:50 +1000 (AEST)
IronPort-SDR: qx6dkLmyBiC6+VK/2MmnnySq6QVI6ImjhePQaQ7LGVCxwovJ8jtMSfX1LsRiBpKwKitkqdbmJF
 yqdXSGwJ8S0g==
X-IronPort-AV: E=McAfee;i="6200,9189,10016"; a="204347701"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="204347701"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 06:42:47 -0700
IronPort-SDR: uK7g48t/AZFfDrYYkqkrYqG9KQUnzeZKpeZCtbOorwtmKpYyVCP7BJ8ytRDrLmQP0fJSfvnJnV
 QWUD23WVDsbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="488188963"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2021 06:42:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id B04962AA; Wed, 16 Jun 2021 16:43:09 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/1] powerpc/papr_scm: Properly handle UUID types and API
Date: Wed, 16 Jun 2021 16:43:03 +0300
Message-Id: <20210616134303.58185-1-andriy.shevchenko@linux.intel.com>
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
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Parse to and export from UUID own type, before dereferencing.
This also fixes wrong comment (Little Endian UUID is something else)
and should eliminate the direct strict types assignments.

Fixes: 43001c52b603 ("powerpc/papr_scm: Use ibm,unit-guid as the iset cookie")
Fixes: 259a948c4ba1 ("powerpc/pseries/scm: Use a specific endian format for storing uuid from the device tree")
Cc: Oliver O'Halloran <oohall@gmail.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: added missed header (Vaibhav), updated comment (Aneesh),
    rewrite part of the commit message to avoid mentioning the Sparse
 arch/powerpc/platforms/pseries/papr_scm.c | 27 +++++++++++++++--------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index e2b69cc3beaf..b43be41e8ff7 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -18,6 +18,7 @@
 #include <asm/plpar_wrappers.h>
 #include <asm/papr_pdsm.h>
 #include <asm/mce.h>
+#include <asm/unaligned.h>
 
 #define BIND_ANY_ADDR (~0ul)
 
@@ -1101,8 +1102,9 @@ static int papr_scm_probe(struct platform_device *pdev)
 	u32 drc_index, metadata_size;
 	u64 blocks, block_size;
 	struct papr_scm_priv *p;
+	u8 uuid_raw[UUID_SIZE];
 	const char *uuid_str;
-	u64 uuid[2];
+	uuid_t uuid;
 	int rc;
 
 	/* check we have all the required DT properties */
@@ -1145,16 +1147,23 @@ static int papr_scm_probe(struct platform_device *pdev)
 	p->hcall_flush_required = of_property_read_bool(dn, "ibm,hcall-flush-required");
 
 	/* We just need to ensure that set cookies are unique across */
-	uuid_parse(uuid_str, (uuid_t *) uuid);
+	uuid_parse(uuid_str, &uuid);
+
 	/*
-	 * cookie1 and cookie2 are not really little endian
-	 * we store a little endian representation of the
-	 * uuid str so that we can compare this with the label
-	 * area cookie irrespective of the endian config with which
-	 * the kernel is built.
+	 * The cookie1 and cookie2 are not really little endian.
+	 * We store a raw buffer representation of the
+	 * uuid string so that we can compare this with the label
+	 * area cookie irrespective of the endian configuration
+	 * with which the kernel is built.
+	 *
+	 * Historically we stored the cookie in the below format.
+	 * for a uuid string 72511b67-0b3b-42fd-8d1d-5be3cae8bcaa
+	 *	cookie1 was 0xfd423b0b671b5172
+	 *	cookie2 was 0xaabce8cae35b1d8d
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

