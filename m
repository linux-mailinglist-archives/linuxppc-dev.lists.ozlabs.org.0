Return-Path: <linuxppc-dev+bounces-70-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A392C950FA2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2024 00:20:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OgEVVjda;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wk5SR33cLz2xXW;
	Wed, 14 Aug 2024 08:20:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OgEVVjda;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wk4nF4Dntz2yGL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 07:50:25 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47DLVYmK012513;
	Tue, 13 Aug 2024 21:50:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=pp1; bh=yx+clOaw23PgtpcN5rmdb1RPsc
	RB7/4WXZPuwo2Vjy4=; b=OgEVVjdao7+aoH4XavBNJ6UaniPqfhAKh1fB6YHqLu
	xKBi9arxbEfa7qFk4y6YFl3EK7LVFhRDjtasAbpSlXypFYPnh18SOP3C6p7WHWjU
	4Svi2fGXMynuuWcbXFACrbXBEHgl/xqYd5DSiGyMIfvL4flyHzkoxiQ2Xc/A+xMk
	4ZSvtkea0xCrfz5eeFogycDNlEn8r5x9QNXK6mtLxr7+3W7KrdAMgupej0u/3Zol
	mUTq1vWYh+NBHkSn4x+vRENhfXa/BLPDnN78gcFmQGyT3fz849RFO8VZCPQLmjf0
	SNY8ht9nZqggPonj1h4Ed7Te3oiesSnklt+pn3HNGLGA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 410fft021r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 21:50:18 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47DLoHX8017485;
	Tue, 13 Aug 2024 21:50:17 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 410fft021q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 21:50:17 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 47DJxMIK029668;
	Tue, 13 Aug 2024 21:50:17 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 40xmrmdqv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 Aug 2024 21:50:17 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47DLoBh026870286
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 Aug 2024 21:50:13 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 416C158065;
	Tue, 13 Aug 2024 21:50:09 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5335858059;
	Tue, 13 Aug 2024 21:50:08 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.0.230])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 Aug 2024 21:50:08 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, tyreld@linux.ibm.com,
        brking@linux.ibm.com, hbabu@us.ibm.com,
        Haren Myneni <haren@linux.ibm.com>,
        Scott Cheloha <cheloha@linux.ibm.com>
Subject: [PATCH 1/2] powerpc/pseries/dlpar: Remove device tree node for DLPAR IO remove
Date: Tue, 13 Aug 2024 14:50:01 -0700
Message-ID: <20240813215002.64030-1-haren@linux.ibm.com>
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
X-Proofpoint-GUID: UOcYBWotC9e9GNIfS7cffg0rCdSbtprW
X-Proofpoint-ORIG-GUID: sKJ4GHtl4ijT4IcBZfpu5CSPSIxKE3XS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-13_11,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 clxscore=1011
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408130153

For the DLPAR IO REMOVE, the corresponding device tree nodes and
properties have to be removed from the device tree after disable
the device. In the current implementation, the user space (drmgr
tool) remove the device tree nodes by updating /proc/ppc64/ofdt
which needs /dev/mem. But /dev/mem access is restricted under
system lockdown is enabled.

This patch extends the /sys/kernel/dlpar interface and provides
‘dt remove index <drc_index>’ to the user space so that drmgr
tool can remove the corresponding device tree nodes based on DRC
index from the device tree.

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h        |  1 +
 arch/powerpc/platforms/pseries/dlpar.c | 87 +++++++++++++++++++++++++-
 2 files changed, 87 insertions(+), 1 deletion(-)

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
index 47f8eabd1bee..993fd3e8f6ea 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -330,6 +330,86 @@ int dlpar_unisolate_drc(u32 drc_index)
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
+	pr_info("%s: %pOF\n", __func__, node);
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
+	 * TODO Search for sub-nodes that haven't been properly detached yet.
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
@@ -361,6 +441,9 @@ int handle_dlpar_errorlog(struct pseries_hp_errorlog *hp_elog)
 	case PSERIES_HP_ELOG_RESOURCE_PMEM:
 		rc = dlpar_hp_pmem(hp_elog);
 		break;
+	case PSERIES_HP_ELOG_RESOURCE_DT:
+		rc = dlpar_hp_dt(hp_elog);
+		break;
 
 	default:
 		pr_warn_ratelimited("Invalid resource (%d) specified\n",
@@ -413,6 +496,8 @@ static int dlpar_parse_resource(char **cmd, struct pseries_hp_errorlog *hp_elog)
 		hp_elog->resource = PSERIES_HP_ELOG_RESOURCE_MEM;
 	} else if (sysfs_streq(arg, "cpu")) {
 		hp_elog->resource = PSERIES_HP_ELOG_RESOURCE_CPU;
+	} else if (sysfs_streq(arg, "dt")) {
+		hp_elog->resource = PSERIES_HP_ELOG_RESOURCE_DT;
 	} else {
 		pr_err("Invalid resource specified.\n");
 		return -EINVAL;
@@ -554,7 +639,7 @@ static ssize_t dlpar_store(const struct class *class, const struct class_attribu
 static ssize_t dlpar_show(const struct class *class, const struct class_attribute *attr,
 			  char *buf)
 {
-	return sprintf(buf, "%s\n", "memory,cpu");
+	return sprintf(buf, "%s\n", "memory,cpu,dt");
 }
 
 static CLASS_ATTR_RW(dlpar);
-- 
2.43.5


