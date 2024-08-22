Return-Path: <linuxppc-dev+bounces-292-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1841295AB34
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 04:50:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wq7490HFzz2y92;
	Thu, 22 Aug 2024 12:50:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i7Z8O3vX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wq74850hrz2xnK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 12:50:48 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47LFs0Rk005478;
	Thu, 22 Aug 2024 02:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=pp1; bh=
	OSMPiRP3YW0tbZeyz6d49/DNUD3aF5U2LAEp2Ng0tbw=; b=i7Z8O3vXsXBTIrIA
	4Cme/usUU9xFsmCqV0hYNllXK356UcXvdQO6ILUyLGrquYUCT3Fqb/Zioy5S+SxZ
	Ml+nNJnJ6Iekk81yDrYkoLWQgifLn9Q5o95arEXE7zgbYWu0OyTytwGPbUsefWww
	rKOncJ88GjqJDjDVp3Zh2MEdSNWr0N0fJ4JRVfsP1R7yD0VzT4UO6JZjBBLDoP+q
	mzifLAnUhsNflafF0CSfWQc4YzyQGEGkkNzqclSGyBXbd5tq+fn4PSl/RV6PSzw5
	a1GXhvHIu/X4b6LBgQWPkI4PgsmmC6Em1xygE+hBztOuNgza6drQ5KqYML6vdyUI
	dDqkaQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 412mb5wq49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 02:50:44 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47M2oiZo022495;
	Thu, 22 Aug 2024 02:50:44 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 412mb5wq47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 02:50:44 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47M0NWL9013103;
	Thu, 22 Aug 2024 02:50:43 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 41366uax1r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 02:50:43 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47M2obOp33686152
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Aug 2024 02:50:39 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 290E45806A;
	Thu, 22 Aug 2024 02:50:37 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B8F15805A;
	Thu, 22 Aug 2024 02:50:36 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.89.84])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 Aug 2024 02:50:36 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, tyreld@linux.ibm.com,
        brking@linux.ibm.com, hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH v3 2/3] powerpc/pseries/dlpar: Remove device tree node for DLPAR IO remove
Date: Wed, 21 Aug 2024 19:50:27 -0700
Message-ID: <20240822025028.938332-2-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20240822025028.938332-1-haren@linux.ibm.com>
References: <20240822025028.938332-1-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: Psqmfr28pjRAYYivI1uP0euI6S5E7DmI
X-Proofpoint-GUID: f6sGxaqSoMLJLCRP8Oih3DUxv52GNgK1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_17,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=999 phishscore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2407110000
 definitions=main-2408220017

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
---
 arch/powerpc/include/asm/rtas.h        |  1 +
 arch/powerpc/platforms/pseries/dlpar.c | 88 +++++++++++++++++++++++++-
 2 files changed, 88 insertions(+), 1 deletion(-)

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
index 9873b916b237..1b49b47c4a4f 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -330,6 +330,87 @@ int dlpar_unisolate_drc(u32 drc_index)
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
+	u32 drc_index;
+	int rc;
+
+	if (phpe->id_type != PSERIES_HP_ELOG_ID_DRC_INDEX)
+		return -EINVAL;
+
+	drc_index = be32_to_cpu(phpe->_drc_u.drc_index);
+
+	lock_device_hotplug();
+
+	switch (phpe->action) {
+	case PSERIES_HP_ELOG_ACTION_REMOVE:
+		rc = dlpar_hp_dt_remove(drc_index);
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
@@ -344,6 +425,9 @@ int handle_dlpar_errorlog(struct pseries_hp_errorlog *hp_elog)
 	case PSERIES_HP_ELOG_RESOURCE_PMEM:
 		rc = dlpar_hp_pmem(hp_elog);
 		break;
+	case PSERIES_HP_ELOG_RESOURCE_DT:
+		rc = dlpar_hp_dt(hp_elog);
+		break;
 
 	default:
 		pr_warn_ratelimited("Invalid resource (%d) specified\n",
@@ -396,6 +480,8 @@ static int dlpar_parse_resource(char **cmd, struct pseries_hp_errorlog *hp_elog)
 		hp_elog->resource = PSERIES_HP_ELOG_RESOURCE_MEM;
 	} else if (sysfs_streq(arg, "cpu")) {
 		hp_elog->resource = PSERIES_HP_ELOG_RESOURCE_CPU;
+	} else if (sysfs_streq(arg, "dt")) {
+		hp_elog->resource = PSERIES_HP_ELOG_RESOURCE_DT;
 	} else {
 		pr_err("Invalid resource specified.\n");
 		return -EINVAL;
@@ -537,7 +623,7 @@ static ssize_t dlpar_store(const struct class *class, const struct class_attribu
 static ssize_t dlpar_show(const struct class *class, const struct class_attribute *attr,
 			  char *buf)
 {
-	return sprintf(buf, "%s\n", "memory,cpu");
+	return sprintf(buf, "%s\n", "memory,cpu,dt");
 }
 
 static CLASS_ATTR_RW(dlpar);
-- 
2.43.5


