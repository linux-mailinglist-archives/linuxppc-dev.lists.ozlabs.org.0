Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC41641B59
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 06:49:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NvXZ0tn3zDqyk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 14:49:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NvSD0CKrzDqvt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 14:45:15 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5C4ftS6031234
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:45:12 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2t2rnb41ax-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:45:12 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <nathanl@linux.ibm.com>;
 Wed, 12 Jun 2019 05:45:12 +0100
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 12 Jun 2019 05:45:11 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5C4jAWG7012714
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 04:45:10 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DB8CCBE053
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 04:45:09 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E63FBE054
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 04:45:09 +0000 (GMT)
Received: from localhost (unknown [9.85.194.175])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 04:45:09 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc/pseries/mobility: rebuild cacheinfo hierarchy
 post-migration
Date: Tue, 11 Jun 2019 23:45:06 -0500
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190612044506.16392-1-nathanl@linux.ibm.com>
References: <20190612044506.16392-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061204-0036-0000-0000-00000AC9EC19
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011249; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01216747; UDB=6.00639776; IPR=6.00997847; 
 MB=3.00027272; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-12 04:45:11
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061204-0037-0000-0000-00004C31A130
Message-Id: <20190612044506.16392-4-nathanl@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-12_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906120031
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It's common for the platform to replace the cache device nodes after a
migration. Since the cacheinfo code is never informed about this, it
never drops its references to the source system's cache nodes, causing
it to wind up in an inconsistent state resulting in warnings and oopses
as soon as CPU online/offline occurs after the migration, e.g.

cache for /cpus/l3-cache@3113(Unified) refers to cache for /cpus/l2-cache@200d(Unified)
WARNING: CPU: 15 PID: 86 at arch/powerpc/kernel/cacheinfo.c:176 release_cache+0x1bc/0x1d0
[...]
NIP [c00000000002d9bc] release_cache+0x1bc/0x1d0
LR [c00000000002d9b8] release_cache+0x1b8/0x1d0
Call Trace:
[c0000001fc99fa70] [c00000000002d9b8] release_cache+0x1b8/0x1d0 (unreliable)
[c0000001fc99fb10] [c00000000002ebf4] cacheinfo_cpu_offline+0x1c4/0x2c0
[c0000001fc99fbe0] [c00000000002ae58] unregister_cpu_online+0x1b8/0x260
[c0000001fc99fc40] [c000000000165a64] cpuhp_invoke_callback+0x114/0xf40
[c0000001fc99fcd0] [c000000000167450] cpuhp_thread_fun+0x270/0x310
[c0000001fc99fd40] [c0000000001a8bb8] smpboot_thread_fn+0x2c8/0x390
[c0000001fc99fdb0] [c0000000001a1cd8] kthread+0x1b8/0x1c0
[c0000001fc99fe20] [c00000000000c2d4] ret_from_kernel_thread+0x5c/0x68

Using device tree notifiers won't work since we want to rebuild the
hierarchy only after all the removals and additions have occurred and
the device tree is in a consistent state. Call cacheinfo_teardown()
before processing device tree updates, and rebuild the hierarchy
afterward.

Fixes: 410bccf97881 ("powerpc/pseries: Partition migration in the kernel")
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/mobility.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index edc1ec408589..b8c8096907d4 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -23,6 +23,7 @@
 #include <asm/machdep.h>
 #include <asm/rtas.h>
 #include "pseries.h"
+#include "../../kernel/cacheinfo.h"
 
 static struct kobject *mobility_kobj;
 
@@ -345,11 +346,20 @@ void post_mobility_fixup(void)
 	 */
 	cpus_read_lock();
 
+	/*
+	 * It's common for the destination firmware to replace cache
+	 * nodes.  Release all of the cacheinfo hierarchy's references
+	 * before updating the device tree.
+	 */
+	cacheinfo_teardown();
+
 	rc = pseries_devicetree_update(MIGRATION_SCOPE);
 	if (rc)
 		printk(KERN_ERR "Post-mobility device tree update "
 			"failed: %d\n", rc);
 
+	cacheinfo_rebuild();
+
 	cpus_read_unlock();
 
 	/* Possibly switch to a new RFI flush type */
-- 
2.20.1

