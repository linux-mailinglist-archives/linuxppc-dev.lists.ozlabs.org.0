Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBEA47FC10
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 12:00:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JMvp625Q2z3bWk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Dec 2021 22:00:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UBR96HOF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UBR96HOF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JMvnP4R3lz2x9T
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Dec 2021 21:59:37 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BR9BjVi017410; 
 Mon, 27 Dec 2021 10:59:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=M4vyWnZTevfr+j9xbdYCjSvZQyyzXBjhKEGqEbiw9lI=;
 b=UBR96HOFyNbGizNNM7O+OVsfHYeVLWhFe31mUjFDGyVrAFX0Oya4irnkD1t5udjotyBT
 /eratAHE+IGY9JvEYDA3PGlfv3FLnBHKbrVRf+3zTYC3wEV1DuvJaP+BIbSrVJPbGQcx
 1pUHYfZ31jIkXG947cC5jj8/WWdjeUboInIRmh1/nbqA67UFQQHdnQGfpAy+TBXCXO4g
 s6C0LbY32WgbrEWISYpo/clV8Cryj4lVKEk1f9xXoP6SYOEozx1MdVDwpxlurYBnPdO9
 4PCdbujWqOVcQNJ4MOzemJGGy88/RdBz5HxgUH2l2hfHu0HVNaP+ZnIciUNRrQzfmOsO 3g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d7amx9ku0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 10:59:31 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BRAgww2032196;
 Mon, 27 Dec 2021 10:59:31 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3d7amx9ktn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 10:59:30 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BRAkPnM009421;
 Mon, 27 Dec 2021 10:59:30 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04dal.us.ibm.com with ESMTP id 3d5tx9e0y4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Dec 2021 10:59:30 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BRAxQLs28311940
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Dec 2021 10:59:26 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E93AAE05C;
 Mon, 27 Dec 2021 10:59:26 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED206AE05F;
 Mon, 27 Dec 2021 10:59:24 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.90.83])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 27 Dec 2021 10:59:24 +0000 (GMT)
Message-ID: <340462fe25b26377130b3204eca20e71ff0d80b0.camel@linux.ibm.com>
Subject: [RFC PATCH 2/3] powerpc/pseries/vas: Add VAS suspend/resume notifier
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Mon, 27 Dec 2021 02:59:22 -0800
In-Reply-To: <af4574e7553a632884a2f00fcb96bd82fa063fe9.camel@linux.ibm.com>
References: <af4574e7553a632884a2f00fcb96bd82fa063fe9.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XrX8rt-bvI6hvfI-qxS2MxNv6y6wHsf2
X-Proofpoint-GUID: YdKFje3EHX76mrmsyK49VO4RzYKq2_h9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-27_02,2021-12-24_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112270052
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


Since VAS windows belong to the VAS hardware resource, the
hypervisor expects the partition to close them on source partition
and reopen them after the partition migrated on the destination
machine.

This suspend/resume notifier invokes suspend operation before
and resume operation after migration. All active windows for
both default and QoS types will be closed during suspend and
reopen them during resume. During migration, the user space
should expect paste instruction failure if issues copy/paste
on these active windows.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas.c | 97 +++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index b9d1c0bac624..d2d7202a4f4e 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -16,6 +16,7 @@
 #include <asm/machdep.h>
 #include <asm/hvcall.h>
 #include <asm/plpar_wrappers.h>
+#include <asm/pseries-suspend.h>
 #include <asm/vas.h>
 #include "vas.h"
 
@@ -845,6 +846,98 @@ static struct notifier_block pseries_vas_nb = {
 	.notifier_call = pseries_vas_notifier,
 };
 
+/*
+ * For LPM, all windows have to be closed on the source partition
+ * before migration and reopen them on the destination partition
+ * after migration. So closing windows during suspend and
+ * reopen them during resume.
+ */
+static int vas_migrate_windows(bool suspend)
+{
+	struct hv_vas_cop_feat_caps *hv_caps;
+	struct vas_cop_feat_caps *caps;
+	int lpar_creds, new_creds = 0;
+	struct vas_caps *vcaps;
+	int i, rc = 0;
+
+	hv_caps = kmalloc(sizeof(*hv_caps), GFP_KERNEL);
+	if (!hv_caps)
+		return -ENOMEM;
+
+	mutex_lock(&vas_pseries_mutex);
+
+	for (i = 0; i < VAS_MAX_FEAT_TYPE; i++) {
+		vcaps = &vascaps[i];
+		caps = &vcaps->caps;
+		lpar_creds = atomic_read(&caps->target_creds);
+
+		rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES, vcaps->feat,
+									(u64)virt_to_phys(hv_caps));
+		if (!rc) {
+			new_creds = be16_to_cpu(hv_caps->target_lpar_creds);
+			/*
+			 * Should not happen. But incase print messages, close all
+			 * windows in the list during suspend and reopen windows
+			 * based on new lpar_creds on the destination system.
+			 */
+			if (lpar_creds != new_creds) {
+				pr_err("%s: lpar creds: %d HV lpar creds: %d\n",
+						suspend ? "Suspend" : "Resume", lpar_creds,
+						new_creds);
+				pr_err("Used creds: %d, Active creds: %d\n",
+						atomic_read(&caps->used_creds),
+						vcaps->num_wins - vcaps->close_wins);
+			}
+		} else {
+			pr_err("%s: Get VAS capabilities failed with %d\n",
+					suspend ? "Suspend" : "Resume", rc);
+			/*
+			 * We can not stop migration with the current lpm
+			 * implementation. So continue closing all windows in the
+			 * list (during suspend) and return without opending windows
+			 * (during resume) if VAS capabilities HCALL failed.
+			 */
+			if (!suspend)
+				goto out;
+		}
+
+		if (suspend)
+			rc = reconfig_close_windows(vcaps, vcaps->num_wins, true);
+		else {
+			atomic_set(&caps->target_creds, new_creds);
+			rc = reconfig_open_windows(vcaps, new_creds, true);
+		}
+
+		/*
+		 * Ignore errors during suspend and return for resume.
+		 */
+		if (rc && !suspend)
+			goto out;
+	}
+
+out:
+	mutex_unlock(&vas_pseries_mutex);
+	kfree(hv_caps);
+	return rc;
+}
+
+static int vas_migration_handler(struct notifier_block *nb,
+								 unsigned long action, void *data)
+{
+	if (action == PSERIES_RESUMING)
+		return vas_migrate_windows(false);
+	else
+		return vas_migrate_windows(true);
+
+}
+
+static struct pseries_suspend_handler vas_suspend_handler = {
+	.notifier_block = {
+		.notifier_call = vas_migration_handler,
+	},
+};
+
+
 static int __init pseries_vas_init(void)
 {
 	struct hv_vas_cop_feat_caps *hv_cop_caps;
@@ -901,8 +994,10 @@ static int __init pseries_vas_init(void)
 	}
 
 	/* Processors can be added/removed only on LPAR */
-	if (copypaste_feat && firmware_has_feature(FW_FEATURE_LPAR))
+	if (copypaste_feat && firmware_has_feature(FW_FEATURE_LPAR)) {
 		of_reconfig_notifier_register(&pseries_vas_nb);
+		pseries_register_suspend_handler(&vas_suspend_handler);
+	}
 
 	pr_info("GZIP feature is available\n");
 
-- 
2.27.0


