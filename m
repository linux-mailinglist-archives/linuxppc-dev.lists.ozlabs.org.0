Return-Path: <linuxppc-dev+bounces-293-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB89195AB35
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 04:51:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wq74D2Hfqz2yF7;
	Thu, 22 Aug 2024 12:50:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GE8F2U7N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wq74C3pxrz2xnK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 12:50:51 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47LFSxkN014036;
	Thu, 22 Aug 2024 02:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=pp1; bh=
	TBimPYgGbSZpomKEfBsF+WDyVIHQLllRE5j6782zmPU=; b=GE8F2U7NMg6jbnzS
	v+P6k2lqPqUqPe5t7OVN1nrFqRq9DC3R3Rkqr17nHljxGo21oMzHk6UFhGjQe6ew
	cY+ZPglKyjvQD1R/aHPnfLFNHixmlLY4yP8TEA1+cypCmw3SZ98Ak47eBo1Rf3Te
	Wx9vhdap4bdEERkwD5UtxWnh4lRsF/Um/GEcfNqny2HWYBvc0FQku+C3QrviiFPL
	dQlzW++uH7d00i132TtPkcMVOfj7Uo44kVPEtnG5FRVpyr+p2pZFVE84QExHCyC4
	8YXYC9mc/egCx+cmPCx3HaLat1Vq7eikdW6tQsf716nIv4Hc5XNcMvvEWSiDismI
	4Um4jA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 412mcyn0j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 02:50:44 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 47M2ohoB012445;
	Thu, 22 Aug 2024 02:50:43 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 412mcyn0j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 02:50:43 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 47M1KBHt014181;
	Thu, 22 Aug 2024 02:50:43 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4137pn2kmn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 02:50:43 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47M2odWI13041956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Aug 2024 02:50:40 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 321F658056;
	Thu, 22 Aug 2024 02:50:39 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 664025803F;
	Thu, 22 Aug 2024 02:50:38 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.89.84])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 Aug 2024 02:50:38 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, tyreld@linux.ibm.com,
        brking@linux.ibm.com, hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH v3 3/3] powerpc/pseries/dlpar: Add device tree nodes for DLPAR IO add
Date: Wed, 21 Aug 2024 19:50:28 -0700
Message-ID: <20240822025028.938332-3-haren@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 1za-TZwqHCjrDBFT_HCNyGrDp0-r9bSo
X-Proofpoint-GUID: yDtMb5JQKOZ-M9xWOd8kJRqqkP6Xv62u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-21_17,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408220017

In the powerpc-pseries specific implementation, the IO hotplug
event is handled in the user space (drmgr tool). For the DLPAR
IO ADD, the corresponding device tree nodes and properties will
be added to the device tree after the device enable. The user
space (drmgr tool) uses configure_connector RTAS call with the
DRC index to retrieve the device nodes and updates the device
tree by writing to /proc/ppc64/ofdt. Under system lockdown,
/dev/mem access to allocate buffers for configure_connector RTAS
call is restricted which means the user space can not issue this
RTAS call and also can not access to /proc/ppc64/ofdt. The
pseries implementation need user interaction to power-on and add
device to the slot during the ADD event handling. So adds
complexity if the complete hotplug ADD event handling moved to
the kernel.

To overcome /dev/mem access restriction, this patch extends the
/sys/kernel/dlpar interface and provides ‘dt add index <drc_index>’
to the user space. The drmgr tool uses this interface to update
the device tree whenever the device is added. This interface
retrieves device tree nodes for the corresponding DRC index using
the configure_connector RTAS call and adds new device nodes /
properties to the device tree.

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/dlpar.c | 130 +++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 1b49b47c4a4f..6f0bc3ddbf85 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -23,6 +23,7 @@
 #include <linux/uaccess.h>
 #include <asm/rtas.h>
 #include <asm/rtas-work-area.h>
+#include <asm/prom.h>
 
 static struct workqueue_struct *pseries_hp_wq;
 
@@ -264,6 +265,20 @@ int dlpar_detach_node(struct device_node *dn)
 
 	return 0;
 }
+static int dlpar_changeset_attach_cc_nodes(struct of_changeset *ocs,
+					struct device_node *dn)
+{
+	int rc;
+
+	rc = of_changeset_attach_node(ocs, dn);
+
+	if (!rc && dn->child)
+		rc = dlpar_changeset_attach_cc_nodes(ocs, dn->child);
+	if (!rc && dn->sibling)
+		rc = dlpar_changeset_attach_cc_nodes(ocs, dn->sibling);
+
+	return rc;
+}
 
 #define DR_ENTITY_SENSE		9003
 #define DR_ENTITY_PRESENT	1
@@ -330,6 +345,118 @@ int dlpar_unisolate_drc(u32 drc_index)
 	return 0;
 }
 
+static struct device_node *
+get_device_node_with_drc_index(u32 index)
+{
+	struct device_node *np = NULL;
+	u32 node_index;
+	int rc;
+
+	for_each_node_with_property(np, "ibm,my-drc-index") {
+		rc = of_property_read_u32(np, "ibm,my-drc-index",
+					     &node_index);
+		if (rc) {
+			pr_err("%s: %pOF: of_property_read_u32 %s: %d\n",
+			       __func__, np, "ibm,my-drc-index", rc);
+			of_node_put(np);
+			return NULL;
+		}
+
+		if (index == node_index)
+			break;
+	}
+
+	return np;
+}
+
+static struct device_node *
+get_device_node_with_drc_info(u32 index)
+{
+	struct device_node *np = NULL;
+	struct of_drc_info drc;
+	struct property *info;
+	const __be32 *value;
+	u32 node_index;
+	int i, j, count;
+
+	for_each_node_with_property(np, "ibm,drc-info") {
+		info = of_find_property(np, "ibm,drc-info", NULL);
+		if (info == NULL) {
+			/* XXX can this happen? */
+			of_node_put(np);
+			return NULL;
+		}
+		value = of_prop_next_u32(info, NULL, &count);
+		if (value == NULL)
+			continue;
+		value++;
+		for (i = 0; i < count; i++) {
+			if (of_read_drc_info_cell(&info, &value, &drc))
+				break;
+			if (index > drc.last_drc_index)
+				continue;
+			node_index = drc.drc_index_start;
+			for (j = 0; j < drc.num_sequential_elems; j++) {
+				if (index == node_index)
+					return np;
+				node_index += drc.sequential_inc;
+			}
+		}
+	}
+
+	return NULL;
+}
+
+static int dlpar_hp_dt_add(u32 index)
+{
+	struct device_node *np, *nodes;
+	struct of_changeset ocs;
+	int rc;
+
+	/*
+	 * Do not add device node(s) if already exists in the
+	 * device tree.
+	 */
+	np = get_device_node_with_drc_index(index);
+	if (np) {
+		pr_err("%s: Adding device node for index (%d), but "
+				"already exists in the device tree\n",
+				__func__, index);
+		rc = -EINVAL;
+		goto out;
+	}
+
+	np = get_device_node_with_drc_info(index);
+
+	if (!np)
+		return -EIO;
+
+	/* Next, configure the connector. */
+	nodes = dlpar_configure_connector(cpu_to_be32(index), np);
+	if (!nodes) {
+		rc = -EIO;
+		goto out;
+	}
+
+	/*
+	 * Add the new nodes from dlpar_configure_connector() onto
+	 * the device-tree.
+	 */
+	of_changeset_init(&ocs);
+	rc = dlpar_changeset_attach_cc_nodes(&ocs, nodes);
+
+	if (!rc)
+		rc = of_changeset_apply(&ocs);
+	else
+		dlpar_free_cc_nodes(nodes);
+
+	of_changeset_destroy(&ocs);
+
+out:
+	of_node_put(np);
+	return rc;
+}
+
 static int changeset_detach_node_recursive(struct of_changeset *ocs,
 					struct device_node *node)
 {
@@ -397,6 +524,9 @@ static int dlpar_hp_dt(struct pseries_hp_errorlog *phpe)
 	lock_device_hotplug();
 
 	switch (phpe->action) {
+	case PSERIES_HP_ELOG_ACTION_ADD:
+		rc = dlpar_hp_dt_add(drc_index);
+		break;
 	case PSERIES_HP_ELOG_ACTION_REMOVE:
 		rc = dlpar_hp_dt_remove(drc_index);
 		break;
-- 
2.43.5


