Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4355F73F2
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 07:31:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkH3R1TSTz3dsD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 16:31:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OAgXsdXj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OAgXsdXj;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkH2S4q7Fz303D
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 16:30:23 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2974hYlX018653;
	Fri, 7 Oct 2022 05:30:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=P4NcFBQd/K4I/pDF6ApgfBwOwExrfKtVayd/US3w+7M=;
 b=OAgXsdXjOG2vLwrijSD/S98SKUHMrsGXAL0uD5EZYVG3ijKzm8XE7ACwAVtXgLZmBQD/
 WRbRLoBpX9ODRzdyIwg5v88KkZuvIDvrIy7fTEW4spjbu17yuSZsTz5bsTVof1LlbD3B
 FlftMPN9WpR7J79QTM0D7f6jYhXK/HJvHtUmGhq9R2INIK1Gx+qBljVcrhLhy3IlWhsI
 Jl1E/blH4D6CLwl9A24amgxBHB/48hJJ3HpoAhwCzt+7jud+3D8JZCoTpTsGHI210XCv
 uDrwnmt5CPovMjbq2glAWFoL6a+Dt/lTruIBeSyN+gik6W+wzRoFdm/j6Bdatowvbp0Q Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k2dbb14gv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Oct 2022 05:30:14 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2974xYsb009494;
	Fri, 7 Oct 2022 05:30:14 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k2dbb14ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Oct 2022 05:30:14 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2975LnXv004183;
	Fri, 7 Oct 2022 05:30:13 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
	by ppma02dal.us.ibm.com with ESMTP id 3k28d2a0ux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Oct 2022 05:30:13 +0000
Received: from smtpav04.dal12v.mail.ibm.com ([9.208.128.131])
	by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2975UCrn1311416
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Oct 2022 05:30:12 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E8775805A;
	Fri,  7 Oct 2022 05:30:11 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0D5058056;
	Fri,  7 Oct 2022 05:30:09 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.36.35])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Oct 2022 05:30:09 +0000 (GMT)
Message-ID: <efa9c16e4a78dda4567a16f13dabfd73cb4674a2.camel@linux.ibm.com>
Subject: [PATCH] powerpc/pseries: Use lparcfg to reconfig VAS windows for
 DLPAR CPU
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, nathanl@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Date: Thu, 06 Oct 2022 22:29:59 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kqlGdEGEiKXTFKbyfRCmuUrmuYsHSgaJ
X-Proofpoint-ORIG-GUID: 4LM88W7Yup2VZUSWJCqvTdXMJkexG-P3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_05,2022-10-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210070030
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


The hypervisor assigns VAS (Virtual Accelerator Switchboard)
windows depends on cores configured in LPAR. The kernel uses
OF reconfig notifier to reconfig VAS windows for DLPAR CPU event.
In the case of shared CPU mode partition, the hypervisor assigns
VAS windows depends on CPU entitled capacity, not based on vcpus.
When the user changes CPU entitled capacity for the partition,
drmgr uses /proc/ppc64/lparcfg interface to notify the kernel.

This patch adds the following changes to update VAS resources
for shared mode:
- Call vas reconfig windows from lparcfg_write()
- Ignore reconfig changes in the VAS notifier

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lparcfg.c | 15 ++++++++
 arch/powerpc/platforms/pseries/vas.c     | 44 ++++++++++++++++--------
 arch/powerpc/platforms/pseries/vas.h     |  5 +++
 3 files changed, 50 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index 507dc0b5987d..23f9c96e9abc 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -35,6 +35,7 @@
 #include <asm/drmem.h>
 
 #include "pseries.h"
+#include "vas.h"	/* pseries_vas_dlpar_cpu() */
 
 /*
  * This isn't a module but we expose that to userspace
@@ -748,6 +749,20 @@ static ssize_t lparcfg_write(struct file *file, const char __user * buf,
 			return -EINVAL;
 
 		retval = update_ppp(new_entitled_ptr, NULL);
+
+		if (retval == H_SUCCESS || retval == H_CONSTRAINED) {
+			/*
+			 * The hypervisor assigns VAS resources based
+			 * on entitled capacity for shared mode.
+			 * Reconfig VAS windows based on DLPAR CPU events.
+			 * Returns success, -EIO, -EINVAL, or -ENOMEM
+			 */
+			retval = pseries_vas_dlpar_cpu();
+			if (!retval)
+				retval = count;
+
+			return retval;
+		}
 	} else if (!strcmp(kbuf, "capacity_weight")) {
 		char *endp;
 		*new_weight_ptr = (u8) simple_strtoul(tmp, &endp, 10);
diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 93f87ac126df..bf15586f2af7 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -857,6 +857,26 @@ int vas_reconfig_capabilties(u8 type, int new_nr_creds)
 	mutex_unlock(&vas_pseries_mutex);
 	return rc;
 }
+
+int pseries_vas_dlpar_cpu(void)
+{
+	int new_nr_creds, rc = 0;
+
+	rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES,
+					vascaps[VAS_GZIP_DEF_FEAT_TYPE].feat,
+					(u64)virt_to_phys(&hv_cop_caps));
+	if (!rc) {
+		new_nr_creds = be16_to_cpu(hv_cop_caps.target_lpar_creds);
+		rc = vas_reconfig_capabilties(VAS_GZIP_DEF_FEAT_TYPE,
+						new_nr_creds);
+	}
+
+	if (rc)
+		pr_err("Failed reconfig VAS capabilities with DLPAR\n");
+
+	return rc;
+}
+
 /*
  * Total number of default credits available (target_credits)
  * in LPAR depends on number of cores configured. It varies based on
@@ -871,7 +891,15 @@ static int pseries_vas_notifier(struct notifier_block *nb,
 	struct of_reconfig_data *rd = data;
 	struct device_node *dn = rd->dn;
 	const __be32 *intserv = NULL;
-	int new_nr_creds, len, rc = 0;
+	int len;
+
+	/*
+	 * For shared CPU partition, the hypervisor assigns total credits
+	 * based on entitled core capacity. So updating VAS windows will
+	 * be called from lparcfg_write().
+	 */
+	if (is_shared_processor())
+		return NOTIFY_OK;
 
 	if ((action == OF_RECONFIG_ATTACH_NODE) ||
 		(action == OF_RECONFIG_DETACH_NODE))
@@ -883,19 +911,7 @@ static int pseries_vas_notifier(struct notifier_block *nb,
 	if (!intserv)
 		return NOTIFY_OK;
 
-	rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES,
-					vascaps[VAS_GZIP_DEF_FEAT_TYPE].feat,
-					(u64)virt_to_phys(&hv_cop_caps));
-	if (!rc) {
-		new_nr_creds = be16_to_cpu(hv_cop_caps.target_lpar_creds);
-		rc = vas_reconfig_capabilties(VAS_GZIP_DEF_FEAT_TYPE,
-						new_nr_creds);
-	}
-
-	if (rc)
-		pr_err("Failed reconfig VAS capabilities with DLPAR\n");
-
-	return rc;
+	return pseries_vas_dlpar_cpu();
 }
 
 static struct notifier_block pseries_vas_nb = {
diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
index a2cb12a31c17..7115043ec488 100644
--- a/arch/powerpc/platforms/pseries/vas.h
+++ b/arch/powerpc/platforms/pseries/vas.h
@@ -141,10 +141,15 @@ int __init sysfs_pseries_vas_init(struct vas_all_caps *vas_caps);
 
 #ifdef CONFIG_PPC_VAS
 int vas_migration_handler(int action);
+int pseries_vas_dlpar_cpu(void);
 #else
 static inline int vas_migration_handler(int action)
 {
 	return 0;
 }
+static inline int pseries_vas_dlpar_cpu(void)
+{
+	return 0;
+}
 #endif
 #endif /* _VAS_H */
-- 
2.26.3


