Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEBD4BCA97
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Feb 2022 21:08:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K1KPB2lsSz3df0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Feb 2022 07:07:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WFPrfy4Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WFPrfy4Z; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K1KNT60J3z2xDD
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Feb 2022 07:07:21 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21JJGXiH008677; 
 Sat, 19 Feb 2022 20:07:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=Q3iu6ioARpi6yO69OlTUKsSVxtkoakKaMvHnW4yH2es=;
 b=WFPrfy4ZW9eQj993ijZ9j9bWEil087FsyYPNitNDyE2cCF9cZRZxmVScsJOzxqcuBCAm
 rp7yJf/FnwnLMTXGZ7whaH1CmJb2CsjVmJBYKcHT1jmLHP9j51OfsFNP8J3OyViZnl7K
 Ia9PVBT9+3Q5Yz/WVo2byX5THgzEEOiog4b/C97tUeSDVNgw5zroJuvjpfltHT5p34Si
 AuYhcW1wLvzTCOKLB1x+YXgubjh2WLxrDq2XXR1jev7frh87sHjifQJ2fb1qDqDzlCgX
 rtLYeZ1Aw5+1wa6DkAwuK98rNEya0GnDLiPKzrSkodSbKYYi7Zg6RK9cx45TbCEZqUOn iQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eb6jk8pkn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:07:18 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21JK2UNX003498;
 Sat, 19 Feb 2022 20:07:17 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eb6jk8pjy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:07:17 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21JK4cYA023759;
 Sat, 19 Feb 2022 20:07:16 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 3ear68x5kt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 19 Feb 2022 20:07:16 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21JK7Dcr30867862
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 19 Feb 2022 20:07:13 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7ED062806A;
 Sat, 19 Feb 2022 20:07:13 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C154928066;
 Sat, 19 Feb 2022 20:07:12 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 19 Feb 2022 20:07:12 +0000 (GMT)
Message-ID: <2769e401eaa7bfc165c5e468c35d4e7bf4f6b62e.camel@linux.ibm.com>
Subject: [PATCH v3 3/4] powerpc/pseries/vas: Add VAS migration handler
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Sat, 19 Feb 2022 12:06:23 -0800
In-Reply-To: <4a23d5ec655fd00da97b0b0b46174a3a3894bfb0.camel@linux.ibm.com>
References: <4a23d5ec655fd00da97b0b0b46174a3a3894bfb0.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YcisvRwWQOmnzUhjzkDhR09tfPrmU5tC
X-Proofpoint-ORIG-GUID: Z0GrbCBnhuQLRdHVZm_MMva35h3OKqJY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-19_04,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 clxscore=1015 mlxlogscore=999
 malwarescore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202190130
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
index fbcf311da0ec..df22827969db 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -869,6 +869,92 @@ static struct notifier_block pseries_vas_nb = {
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


