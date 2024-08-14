Return-Path: <linuxppc-dev+bounces-76-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F08D9512B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2024 04:50:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ROEzEnYc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WkCRJ0vfhz2yMJ;
	Wed, 14 Aug 2024 12:50:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ROEzEnYc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WkCRH4jL2z2xg3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 12:50:19 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47E11AsX027164
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 02:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=pp1; bh=
	cT9bAuyQhj64lwPsANzh3It+9SS/uyRNAg/fy9grIyk=; b=ROEzEnYc8DFG2X8L
	k3i7FG9f5U4Dgwe1GlO0HO7aXR53x6zlUZB0b3kRS0KIfRK71QH7YaPlCxz78rbi
	vCxfC9DYaWk2txCaJlLcIub4qcrJvIBXI3rJ8gr8j/MC2vAxHfeR+0LeTkm+jCKj
	0FLgerhBGqnTPASy+vbpK6YMI8pn/ekJEh3qQG/a5kL/6kv22vQiKXG3luS+S7BZ
	Bdg8QGqbShuXKZb6piBLr0ZYTBuIx/GwjkHaNudmq6dQ6ADuxrbXpfm9lGWP/kw8
	NYNGrr3GhQCC49jVV+KWmTfBLL6MhzYxGJ+AxRzETI+bK7FhKi7PXhTpZtbcXV0K
	5Qjsrg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 410jj3gc06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 02:50:17 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 47E1Y2W5010095
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 02:50:16 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40xjx0q8hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2024 02:50:16 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 47E2oAbQ19857986
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Aug 2024 02:50:12 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 20BE95884E;
	Wed, 14 Aug 2024 02:50:10 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 984AB5882A;
	Wed, 14 Aug 2024 02:49:59 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.0.230])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 Aug 2024 02:49:59 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: hbabu@us.ibm.com, Haren Myneni <haren@linux.ibm.com>
Subject: [PATCH 2/2] powerpc/pseries/dlpar: Add device tree nodes for DLPAR IO add
Date: Tue, 13 Aug 2024 19:49:54 -0700
Message-ID: <20240814024954.85764-2-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20240814024954.85764-1-haren@linux.ibm.com>
References: <20240814024954.85764-1-haren@linux.ibm.com>
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
X-Proofpoint-GUID: jfC1RGSreosY7hBYg-mnFQQrSxrUH_jN
X-Proofpoint-ORIG-GUID: jfC1RGSreosY7hBYg-mnFQQrSxrUH_jN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_01,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140014

For the DLPAR IO ADD, the corresponding device tree nodes and
properties will be added to the device tree after enable the
device. The user space (drmgr tool) uses configure_connector
RTAS call with the DRC index to retrieve the corresponding
device nodes but this RTAS call needs /dev/mem access. Also
updates the device tree by writing to /proc/ppc64/ofdt.
Under system lockdown, /dev/mem access is restricted which means
the user space can not issue configure_connector RTAS call and
also can not access to /proc/ppc64/ofdt.

This patch extends the /sys/kernel/dlpar interface and provides
‘dt add index <drc_index>’ to the user space. The drmgr tool uses
this interface to update the device tree whenever the device is
added. This interface retrieves device tree nodes for the
corresponding DRC index using configure_connector RTAS call and
adds new device nodes / properties to the device tree.

Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/dlpar.c | 134 +++++++++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 993fd3e8f6ea..fb34d5859da8 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -23,6 +23,7 @@
 #include <linux/uaccess.h>
 #include <asm/rtas.h>
 #include <asm/rtas-work-area.h>
+#include <asm/prom.h>
 
 static struct workqueue_struct *pseries_hp_wq;
 
@@ -264,6 +265,22 @@ int dlpar_detach_node(struct device_node *dn)
 
 	return 0;
 }
+static int dlpar_changeset_attach_cc_nodes(struct of_changeset *ocs,
+					struct device_node *dn)
+{
+	int rc;
+
+	pr_info("%s: %pOF\n", __func__, dn);
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
@@ -330,6 +347,120 @@ int dlpar_unisolate_drc(u32 drc_index)
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
+	pr_info("%s: %pOF\n", __func__, np);
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
@@ -396,6 +527,9 @@ static int dlpar_hp_dt(struct pseries_hp_errorlog *phpe)
 	lock_device_hotplug();
 
 	switch (phpe->action) {
+	case PSERIES_HP_ELOG_ACTION_ADD:
+		rc = dlpar_hp_dt_add(phpe->_drc_u.drc_index);
+		break;
 	case PSERIES_HP_ELOG_ACTION_REMOVE:
 		rc = dlpar_hp_dt_remove(phpe->_drc_u.drc_index);
 		break;
-- 
2.43.5


