Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B3E4A2AF3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 02:21:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlxP92Bdsz3cNW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jan 2022 12:21:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fL6JEH/n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fL6JEH/n; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JlxNR65f2z2xsc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jan 2022 12:20:55 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20SNaJOB031271; 
 Sat, 29 Jan 2022 01:20:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=3+J2khe6fL3ipWZCf5nWzLuM25JOIBCXmd7KCy/rs7c=;
 b=fL6JEH/ntxLlkfXb9HCUWoZNVdEgb2cdGcdgYa3AOhHpJ7M697RqkQ/thbD1ynKJAkNL
 7uH1pccOj8HYCny7lqvWSYhLEPAPpalbzMf8Fxu9yS0NLrB0nh28lY53JpFCeRUllzmA
 sYglpiD+5DWVjwPy24/wtZAijeLbtK6L4eNPxn7/zKl4p78b358kAalwFZNESKMvakkj
 CdNx9c/Qr5u74Y3f6j70krrLkT9RHPtMazPpaqoBGUFqTkMfDQ9lqIN4CCtsS5UeiK+3
 eI+sZr3PQ/cSb0UTYMNZ60ti6/X/oEj0gODryc5wGT3hvglZApJElp5cGG0rh1Cq0wrg rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dvgqjdcj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jan 2022 01:20:50 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20T12Ixp001347;
 Sat, 29 Jan 2022 01:20:50 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dvgqjdchs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jan 2022 01:20:50 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20T1H47K013692;
 Sat, 29 Jan 2022 01:20:49 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 3dr9jdv475-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 29 Jan 2022 01:20:49 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20T1Kj5W27918720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Jan 2022 01:20:45 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F50228058;
 Sat, 29 Jan 2022 01:20:45 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BFF128059;
 Sat, 29 Jan 2022 01:20:44 +0000 (GMT)
Received: from sig-9-77-130-163.ibm.com (unknown [9.77.130.163])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 29 Jan 2022 01:20:44 +0000 (GMT)
Message-ID: <55dc807fe7f2c8989d267c70b50c5af5c0b22f00.camel@linux.ibm.com>
Subject: [PATCH 2/3] powerpc/pseries/vas: Add VAS migration handler
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Fri, 28 Jan 2022 17:20:42 -0800
In-Reply-To: <3ac406c37f4aa17e742325b5a86e073fd944428b.camel@linux.ibm.com>
References: <3ac406c37f4aa17e742325b5a86e073fd944428b.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: POk2xXARr_3bz10kzmOQQc4Pm22KIJxd
X-Proofpoint-ORIG-GUID: FqCL6ngYLbG7wlu2WEHcfUvS0p7vyZ5A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_08,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201290003
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
in-active and reopened after migration with this handler.
During the migration, the user space receives paste instruction
failure if it issues copy/paste on these in-active windows.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/mobility.c |  5 ++
 arch/powerpc/platforms/pseries/vas.c      | 86 +++++++++++++++++++++++
 arch/powerpc/platforms/pseries/vas.h      |  6 ++
 3 files changed, 97 insertions(+)

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
index e4797fc73553..b53e3fe02971 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -873,6 +873,92 @@ static struct notifier_block pseries_vas_nb = {
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
+		rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES,
+					      vcaps->feat,
+					      (u64)virt_to_phys(hv_caps));
+		if (!rc) {
+			new_creds = be16_to_cpu(hv_caps->target_lpar_creds);
+			/*
+			 * Should not happen. But incase print messages, close
+			 * all windows in the list during suspend and reopen
+			 * windows based on new lpar_creds on the destination
+			 * system.
+			 */
+			if (lpar_creds != new_creds) {
+				pr_err("state(%d): lpar creds: %d HV lpar creds: %d\n",
+					action, lpar_creds, new_creds);
+				pr_err("Used creds: %d, Active creds: %d\n",
+					atomic_read(&caps->used_creds),
+					vcaps->num_wins - vcaps->close_wins);
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
+			rc = reconfig_close_windows(vcaps, vcaps->num_wins,
+							true);
+			break;
+		case VAS_RESUME:
+			atomic_set(&caps->target_creds, new_creds);
+			rc = reconfig_open_windows(vcaps, new_creds, true);
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
+	kfree(hv_caps);
+	return rc;
+}
+
 static int __init pseries_vas_init(void)
 {
 	struct hv_vas_cop_feat_caps *hv_cop_caps;
diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
index 4cf1d0ef66a5..36dd140af01b 100644
--- a/arch/powerpc/platforms/pseries/vas.h
+++ b/arch/powerpc/platforms/pseries/vas.h
@@ -27,6 +27,11 @@
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
@@ -127,4 +132,5 @@ struct pseries_vas_window {
 int sysfs_add_vas_caps(struct vas_cop_feat_caps *caps);
 int vas_reconfig_capabilties(u8 type);
 int __init sysfs_pseries_vas_init(struct vas_all_caps *vas_caps);
+int vas_migration_handler(int action);
 #endif /* _VAS_H */
-- 
2.27.0


