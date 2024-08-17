Return-Path: <linuxppc-dev+bounces-152-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F21D955545
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2024 05:56:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Cqtb0bab;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wm4mN0sG5z2yp9;
	Sat, 17 Aug 2024 13:56:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Cqtb0bab;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wm4mM4pTpz2xyB
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2024 13:56:35 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47H3rGM4031875;
	Sat, 17 Aug 2024 03:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=pp1; bh=E9o/BvDRU832rMDCxRkDqet5K/
	3nGty2mgLNiryQUqk=; b=Cqtb0babMddCU/jjizpBFYOf/2ovEPgi0mBjGRD6rL
	p4lu68VLpOKb1b55EzmmoducQA3bOaXEdKpPzeZg5obrq3GGWUwfbWbRAPzrEE3d
	euT8nZ6GNGlzIJbe1Fch3SOxwNytxB0C1gWp+Q+TpzCOVnPaE5Meje9SHzFtxh3S
	Z+v9SE0pqkFB8RlAw9C6k6WGUuEZ0YcG6ix168JK4GWQEGDMfbq2ZNxlPPZtmktO
	gmQ+NAR/6X3pZYX13LDWEWiZxV60obdQPCeZbWb/Wms/iZn3GII8nrt/bXXk7bJa
	BQcabW2aACsqnJDWM/1GVcFOOcM97yjZqkqE6zvtBooQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 412mbfg055-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Aug 2024 03:56:30 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47H3uTle003919;
	Sat, 17 Aug 2024 03:56:29 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 412mbfg051-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Aug 2024 03:56:29 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 47H3JP8U018207;
	Sat, 17 Aug 2024 03:54:11 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40xkhq6rap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Aug 2024 03:54:11 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47H3s5AE23266010
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 17 Aug 2024 03:54:07 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 63D175805B;
	Sat, 17 Aug 2024 03:54:05 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79BF358058;
	Sat, 17 Aug 2024 03:54:04 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.75.9])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 17 Aug 2024 03:54:04 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, tyreld@linux.ibm.com,
        brking@linux.ibm.com, hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH v2 1/2] powerpc/pseries/dlpar: Remove device tree node for DLPAR IO remove
Date: Fri, 16 Aug 2024 20:54:00 -0700
Message-ID: <20240817035401.125833-1-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lIkHSrs6LIHNOWpCbV1iyysZKfi5tfqo
X-Proofpoint-ORIG-GUID: wNpAblJqvRJLRk0ImYNBHRqr8JKse3W_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-16_18,2024-08-16_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 bulkscore=0 mlxlogscore=999 adultscore=0 malwarescore=0
 phishscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408170022

In the powerpc-pseries specific implementation, the IO hotplug
event is handled in the user space (drmgr tool). But update the
device tree and /dev/mem access to allocate buffers for some
RTAS calls are restricted when the kernel lockdown feature is
enabled. For the DLPAR IO REMOVE, the corresponding device tree
nodes and properties have to be removed from the device tree
after the device disable. The user space removes the device tree
nodes by updating /proc/ppc64/ofdt which is not allowed  under
system lockdown is enabled. This restriction can be resolved
by moving the complete IO hotplug handling in the kernel. But
the pseries implementation need user interaction to power off
and to remove device from the slot during hotplug event handling.

To overcome the /proc/ppc64/ofdt restriction, this patch extends
the /sys/kernel/dlpar interface and provides
‘dt remove index <drc_index>’ to the user space so that drmgr
tool can remove the corresponding device tree nodes based on DRC
index from the device tree.

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>

v2:
- Remove pr_info() and TODO comments
- Update more information in the commit logs
---
 arch/powerpc/include/asm/rtas.h        |  1 +
 arch/powerpc/platforms/pseries/dlpar.c | 85 +++++++++++++++++++++++++-
 2 files changed, 85 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 065ffd1b2f8a..04406162fc5a 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -397,6 +397,7 @@ inline uint16_t pseries_errorlog_length(struct pseries_errorlog *sect)
 #define PSERIES_HP_ELOG_RESOURCE_SLOT	3
 #define PSERIES_HP_ELOG_RESOURCE_PHB	4
 #define PSERIES_HP_ELOG_RESOURCE_PMEM   6
+#define PSERIES_HP_ELOG_RESOURCE_DT	7
 
 #define PSERIES_HP_ELOG_ACTION_ADD	1
 #define PSERIES_HP_ELOG_ACTION_REMOVE	2
diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 47f8eabd1bee..59f2a8961946 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -330,6 +330,84 @@ int dlpar_unisolate_drc(u32 drc_index)
 	return 0;
 }
 
+static int changeset_detach_node_recursive(struct of_changeset *ocs,
+					struct device_node *node)
+{
+	struct device_node *child;
+	int rc;
+
+	for_each_child_of_node(node, child) {
+		rc = changeset_detach_node_recursive(ocs, child);
+		if (rc) {
+			of_node_put(child);
+			return rc;
+		}
+	}
+
+	return of_changeset_detach_node(ocs, node);
+}
+
+static int dlpar_hp_dt_remove(u32 drc_index)
+{
+	struct device_node *np;
+	struct of_changeset ocs;
+	u32 index;
+	int rc = 0;
+
+	/*
+	 * Prune all nodes with a matching index.
+	 */
+	of_changeset_init(&ocs);
+
+	for_each_node_with_property(np, "ibm,my-drc-index") {
+		rc = of_property_read_u32(np, "ibm,my-drc-index", &index);
+		if (rc) {
+			pr_err("%s: %pOF: of_property_read_u32 %s: %d\n",
+				__func__, np, "ibm,my-drc-index", rc);
+			of_node_put(np);
+			goto out;
+		}
+
+		if (index == drc_index) {
+			rc = changeset_detach_node_recursive(&ocs, np);
+			if (rc) {
+				of_node_put(np);
+				goto out;
+			}
+		}
+	}
+
+	rc = of_changeset_apply(&ocs);
+
+out:
+	of_changeset_destroy(&ocs);
+	return rc;
+}
+
+static int dlpar_hp_dt(struct pseries_hp_errorlog *phpe)
+{
+	int rc;
+
+	if (phpe->id_type != PSERIES_HP_ELOG_ID_DRC_INDEX)
+		return -EINVAL;
+
+	lock_device_hotplug();
+
+	switch (phpe->action) {
+	case PSERIES_HP_ELOG_ACTION_REMOVE:
+		rc = dlpar_hp_dt_remove(phpe->_drc_u.drc_index);
+		break;
+	default:
+		pr_err("Invalid action (%d) specified\n", phpe->action);
+		rc = -EINVAL;
+		break;
+	}
+
+	unlock_device_hotplug();
+
+	return rc;
+}
+
 int handle_dlpar_errorlog(struct pseries_hp_errorlog *hp_elog)
 {
 	int rc;
@@ -361,6 +439,9 @@ int handle_dlpar_errorlog(struct pseries_hp_errorlog *hp_elog)
 	case PSERIES_HP_ELOG_RESOURCE_PMEM:
 		rc = dlpar_hp_pmem(hp_elog);
 		break;
+	case PSERIES_HP_ELOG_RESOURCE_DT:
+		rc = dlpar_hp_dt(hp_elog);
+		break;
 
 	default:
 		pr_warn_ratelimited("Invalid resource (%d) specified\n",
@@ -413,6 +494,8 @@ static int dlpar_parse_resource(char **cmd, struct pseries_hp_errorlog *hp_elog)
 		hp_elog->resource = PSERIES_HP_ELOG_RESOURCE_MEM;
 	} else if (sysfs_streq(arg, "cpu")) {
 		hp_elog->resource = PSERIES_HP_ELOG_RESOURCE_CPU;
+	} else if (sysfs_streq(arg, "dt")) {
+		hp_elog->resource = PSERIES_HP_ELOG_RESOURCE_DT;
 	} else {
 		pr_err("Invalid resource specified.\n");
 		return -EINVAL;
@@ -554,7 +637,7 @@ static ssize_t dlpar_store(const struct class *class, const struct class_attribu
 static ssize_t dlpar_show(const struct class *class, const struct class_attribute *attr,
 			  char *buf)
 {
-	return sprintf(buf, "%s\n", "memory,cpu");
+	return sprintf(buf, "%s\n", "memory,cpu,dt");
 }
 
 static CLASS_ATTR_RW(dlpar);
-- 
2.43.5


