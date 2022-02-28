Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C73C4C641D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 08:53:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6Xgy597sz3btl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 18:53:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hAwzSkcd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hAwzSkcd; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6Xfv6Zxbz3bk9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 18:52:55 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21S7hOec024655; 
 Mon, 28 Feb 2022 07:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=dokKMTHNwvTpBKYNcK0AwP2WHYP3vWkiph8bDPYrb6w=;
 b=hAwzSkcdsLCEOuIuGXZupPg0W06m4a7UA7HjLLelO9F23SshWO4QGWTdWwbptq9DA/za
 zQfcZtlf6quAHpWK7y3XbTR3XBKvjsgZC9/Vhtz+GG4CZdTOkXG7ZG/M5k2ONcp6JEiw
 QbDNUVzVm6fxiGCJXmQNAVBlUxsOiMjI8JZDC0OUDtkZ3/A7HAhST8Vy3infgukxhZ4S
 a2lccfDPOFf04TqJkRSx6pmdvzTMPCIlEWSO4kMcbybtTN5/f4Xp822YQlnY8BclIuKs
 quKNEpO6Hdmn5I2Ii1YgkpR7NTG6IV6Bg/xtGh5R19VHgjIq1Khrmt7T2ucHYX7kWOaS AQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egt8n8670-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:52:51 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21S7poCl010289;
 Mon, 28 Feb 2022 07:52:51 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egt8n866n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:52:51 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21S7lKsV027614;
 Mon, 28 Feb 2022 07:52:50 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 3efbu9t0as-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:52:50 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21S7qk8j49545498
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 07:52:46 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C5937AC05B;
 Mon, 28 Feb 2022 07:52:46 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE600AC05E;
 Mon, 28 Feb 2022 07:52:45 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.161.44])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 28 Feb 2022 07:52:45 +0000 (GMT)
Message-ID: <2dcfeecddcacbb8b1248364905c2e37695f2b996.camel@linux.ibm.com>
Subject: [PATCH v4 3/3] powerpc/pseries/vas: Add VAS migration handler
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Sun, 27 Feb 2022 23:52:43 -0800
In-Reply-To: <aab2eda3cb5b209e07cf50760649834f1d93fede.camel@linux.ibm.com>
References: <aab2eda3cb5b209e07cf50760649834f1d93fede.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: S6MS1AbS9gxXperHeb-8HPKW-vUEiJga
X-Proofpoint-ORIG-GUID: FF8coj9JLofRwBcLFeS1xABMnoCKl6bs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 clxscore=1015 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202280043
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


Since the VAS windows belong to the VAS hardware resource, the
hypervisor expects the partition to close them on source partition
and reopen them after the partition migrated on the destination
machine.

This handler is called before pseries_suspend() to close these
windows and again invoked after migration. All active windows
for both default and QoS types will be closed and mark them
inactive and reopened after migration with this handler.
During the migration, the user space receives paste instruction
failure if it issues copy/paste on these inactive windows.

The current migration implementation does not freeze the user
space and applications can continue to open VAS windows while
migration is in progress. So when the migration_in_progress flag
is set, VAS open window API returns -EBUSY.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/mobility.c |  5 ++
 arch/powerpc/platforms/pseries/vas.c      | 98 ++++++++++++++++++++++-
 arch/powerpc/platforms/pseries/vas.h      |  6 ++
 3 files changed, 108 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 85033f392c78..70004243e25e 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -26,6 +26,7 @@
 #include <asm/machdep.h>
 #include <asm/rtas.h>
 #include "pseries.h"
+#include "vas.h"	/* vas_migration_handler() */
 #include "../../kernel/cacheinfo.h"
 
 static struct kobject *mobility_kobj;
@@ -669,12 +670,16 @@ static int pseries_migrate_partition(u64 handle)
 	if (ret)
 		return ret;
 
+	vas_migration_handler(VAS_SUSPEND);
+
 	ret = pseries_suspend(handle);
 	if (ret == 0)
 		post_mobility_fixup();
 	else
 		pseries_cancel_migration(handle, ret);
 
+	vas_migration_handler(VAS_RESUME);
+
 	return ret;
 }
 
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index fbcf311da0ec..1f59d78c77a1 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -30,6 +30,7 @@ static struct hv_vas_cop_feat_caps hv_cop_caps;
 
 static struct vas_caps vascaps[VAS_MAX_FEAT_TYPE];
 static DEFINE_MUTEX(vas_pseries_mutex);
+static bool migration_in_progress;
 
 static long hcall_return_busy_check(long rc)
 {
@@ -356,7 +357,10 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 	 * same fault IRQ is not freed by the OS before.
 	 */
 	mutex_lock(&vas_pseries_mutex);
-	rc = allocate_setup_window(txwin, (u64 *)&domain[0],
+	if (migration_in_progress)
+		rc = -EBUSY;
+	else
+		rc = allocate_setup_window(txwin, (u64 *)&domain[0],
 				   cop_feat_caps->win_type);
 	mutex_unlock(&vas_pseries_mutex);
 	if (rc)
@@ -869,6 +873,98 @@ static struct notifier_block pseries_vas_nb = {
 	.notifier_call = pseries_vas_notifier,
 };
 
+/*
+ * For LPM, all windows have to be closed on the source partition
+ * before migration and reopen them on the destination partition
+ * after migration. So closing windows during suspend and
+ * reopen them during resume.
+ */
+int vas_migration_handler(int action)
+{
+	struct vas_cop_feat_caps *caps;
+	int old_nr_creds, new_nr_creds = 0;
+	struct vas_caps *vcaps;
+	int i, rc = 0;
+
+	/*
+	 * NX-GZIP is not enabled. Nothing to do for migration.
+	 */
+	if (!copypaste_feat)
+		return rc;
+
+	mutex_lock(&vas_pseries_mutex);
+
+	if (action == VAS_SUSPEND)
+		migration_in_progress = true;
+	else
+		migration_in_progress = false;
+
+	for (i = 0; i < VAS_MAX_FEAT_TYPE; i++) {
+		vcaps = &vascaps[i];
+		caps = &vcaps->caps;
+		old_nr_creds = atomic_read(&caps->nr_total_credits);
+
+		rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES,
+					      vcaps->feat,
+					      (u64)virt_to_phys(&hv_cop_caps));
+		if (!rc) {
+			new_nr_creds = be16_to_cpu(hv_cop_caps.target_lpar_creds);
+			/*
+			 * Should not happen. But incase print messages, close
+			 * all windows in the list during suspend and reopen
+			 * windows based on new lpar_creds on the destination
+			 * system.
+			 */
+			if (old_nr_creds != new_nr_creds) {
+				pr_err("Target credits mismatch with the hypervisor\n");
+				pr_err("state(%d): lpar creds: %d HV lpar creds: %d\n",
+					action, old_nr_creds, new_nr_creds);
+				pr_err("Used creds: %d, Active creds: %d\n",
+					atomic_read(&caps->nr_used_credits),
+					vcaps->nr_open_windows - vcaps->nr_close_wins);
+			}
+		} else {
+			pr_err("state(%d): Get VAS capabilities failed with %d\n",
+				action, rc);
+			/*
+			 * We can not stop migration with the current lpm
+			 * implementation. So continue closing all windows in
+			 * the list (during suspend) and return without
+			 * opening windows (during resume) if VAS capabilities
+			 * HCALL failed.
+			 */
+			if (action == VAS_RESUME)
+				goto out;
+		}
+
+		switch (action) {
+		case VAS_SUSPEND:
+			rc = reconfig_close_windows(vcaps, vcaps->nr_open_windows,
+							true);
+			break;
+		case VAS_RESUME:
+			atomic_set(&caps->nr_total_credits, new_nr_creds);
+			rc = reconfig_open_windows(vcaps, new_nr_creds, true);
+			break;
+		default:
+			/* should not happen */
+			pr_err("Invalid migration action %d\n", action);
+			rc = -EINVAL;
+			goto out;
+		}
+
+		/*
+		 * Ignore errors during suspend and return for resume.
+		 */
+		if (rc && (action == VAS_RESUME))
+			goto out;
+	}
+
+out:
+	mutex_unlock(&vas_pseries_mutex);
+	return rc;
+}
+
 static int __init pseries_vas_init(void)
 {
 	struct hv_vas_all_caps *hv_caps;
diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
index 4ddb1001a0aa..f7568d8c6ab0 100644
--- a/arch/powerpc/platforms/pseries/vas.h
+++ b/arch/powerpc/platforms/pseries/vas.h
@@ -33,6 +33,11 @@
 #define VAS_GZIP_QOS_CAPABILITIES	0x56516F73477A6970
 #define VAS_GZIP_DEFAULT_CAPABILITIES	0x56446566477A6970
 
+enum vas_migrate_action {
+	VAS_SUSPEND,
+	VAS_RESUME,
+};
+
 /*
  * Co-processor feature - GZIP QoS windows or GZIP default windows
  */
@@ -132,4 +137,5 @@ struct pseries_vas_window {
 int sysfs_add_vas_caps(struct vas_cop_feat_caps *caps);
 int vas_reconfig_capabilties(u8 type);
 int __init sysfs_pseries_vas_init(struct vas_all_caps *vas_caps);
+int vas_migration_handler(int action);
 #endif /* _VAS_H */
-- 
2.27.0


