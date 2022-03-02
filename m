Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BE04C9FE7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 09:52:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7nv62bJtz3bx5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 19:52:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f1nLRpq7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=f1nLRpq7; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7ntL6dNvz3bVZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 19:52:10 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2228kh4K030980; 
 Wed, 2 Mar 2022 08:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=0mvYTpU6wDJmi82+eeSexaDxuRmxER5XrF+FCTSfHeQ=;
 b=f1nLRpq7oEElMpp+BqxCwn8tVwExrvDkDij/lGDTG58TyqS6+QABq9ziBK5qlYcj5FIJ
 /7xa/QgQGj1KbnUbu351EPHfRIgDX+2P9qiaMDAgATYBQD8r8gwaMwxPSPILcWDqZQpS
 ar88CrWbZb755ZRxxneURjHEU963CF1bpPpx97sMn2qFHw6rCvI//q/wfGuSerckSj2+
 KZqKkOGf8QG8Y59l8PgRHijnAN7//CHS7lpAo+uV2/bN/fRiq8Vy2GLKIvBK4n4G7CmK
 WAkg5eUtZKQpFD0KKyGTGDbhJx+SZNrkGWRvrKQu2HRgHZGdVrKcE6H/lcdvyZGHdPQi wA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej5cc839g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 08:52:04 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2228ki99031004;
 Wed, 2 Mar 2022 08:52:04 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ej5cc8399-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 08:52:04 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2228T0Uv008430;
 Wed, 2 Mar 2022 08:52:03 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 3eftrrmvyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Mar 2022 08:52:03 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2228q0sK36307312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Mar 2022 08:52:01 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E4AA028058;
 Wed,  2 Mar 2022 08:52:00 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD39A28059;
 Wed,  2 Mar 2022 08:51:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.108.14])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  2 Mar 2022 08:51:59 +0000 (GMT)
Message-ID: <05e45ff4f8babd2490ccb7ae923884f4aa21a7e5.camel@linux.ibm.com>
Subject: [PATCH v4 3/3] powerpc/pseries/vas: Add VAS migration handler
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Wed, 02 Mar 2022 00:51:58 -0800
In-Reply-To: <2dcfeecddcacbb8b1248364905c2e37695f2b996.camel@linux.ibm.com>
References: <aab2eda3cb5b209e07cf50760649834f1d93fede.camel@linux.ibm.com>
 <2dcfeecddcacbb8b1248364905c2e37695f2b996.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: szNJV5jKVqDDAnzALaQbSyR25-fta8Ml
X-Proofpoint-GUID: VysUI4ILtMqu5gfj520TeitVFtzig2Do
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-02_01,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 bulkscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203020034
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

[Update: Included the build fix reported by kernel test robot <lkp@intel.com>]

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
 arch/powerpc/platforms/pseries/vas.h      | 14 ++++
 3 files changed, 116 insertions(+), 1 deletion(-)

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
index 4ddb1001a0aa..34177881e998 100644
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
@@ -132,4 +137,13 @@ struct pseries_vas_window {
 int sysfs_add_vas_caps(struct vas_cop_feat_caps *caps);
 int vas_reconfig_capabilties(u8 type);
 int __init sysfs_pseries_vas_init(struct vas_all_caps *vas_caps);
+
+#ifdef CONFIG_PPC_VAS
+int vas_migration_handler(int action);
+#else
+static inline int vas_migration_handler(int action)
+{
+	return 0;
+}
+#endif
 #endif /* _VAS_H */
-- 
2.27.0


