Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 505DBF6E1A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 06:28:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BKCb5xC2zF1R6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 16:28:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BK4X0xblzDrgx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 16:22:03 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xAB5Hnlo041546; Mon, 11 Nov 2019 00:21:55 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w717p8d3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Nov 2019 00:21:55 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id xAB5Ifcg043247;
 Mon, 11 Nov 2019 00:21:54 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w717p8d3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Nov 2019 00:21:54 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAB5K6Sg012852;
 Mon, 11 Nov 2019 05:21:54 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 2w5n35prx5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Nov 2019 05:21:54 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAB5Lr1m30212498
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Nov 2019 05:21:53 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 275AC28058;
 Mon, 11 Nov 2019 05:21:53 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 804F528059;
 Mon, 11 Nov 2019 05:21:52 +0000 (GMT)
Received: from ltcalpine2-lp18.aus.stglabs.ibm.com (unknown [9.40.195.201])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 11 Nov 2019 05:21:52 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 7/9] PCI: rpaphp: Annotate and correctly byte swap DRC
 properties
Date: Sun, 10 Nov 2019 23:21:35 -0600
Message-Id: <1573449697-5448-9-git-send-email-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573449697-5448-1-git-send-email-tyreld@linux.ibm.com>
References: <1573449697-5448-1-git-send-email-tyreld@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-10_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911110051
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
Cc: nathanl@linux.ibm.com, Tyrel Datwyler <tyreld@linux.ibm.com>,
 tlfalcon@linux.ibm.com, linux-pci@vger.kernel.org, bhelgaas@google.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The device tree is in big endian format and any properties directly
retrieved using OF helpers that don't explicitly byte swap should
be annotated. In particular there are several places where we grab
the opaque property value for the old ibm,drc-* properties and the
ibm,my-drc-index property.

Fix this for better static checking by annotating values we know to
explicitly big endian, and byte swap where appropriate.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 drivers/pci/hotplug/rpaphp_core.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
index 75d5771..129534c 100644
--- a/drivers/pci/hotplug/rpaphp_core.c
+++ b/drivers/pci/hotplug/rpaphp_core.c
@@ -154,11 +154,11 @@ static enum pci_bus_speed get_max_bus_speed(struct slot *slot)
 	return speed;
 }
 
-static int get_children_props(struct device_node *dn, const int **drc_indexes,
-		const int **drc_names, const int **drc_types,
-		const int **drc_power_domains)
+static int get_children_props(struct device_node *dn, const __be32 **drc_indexes,
+			      const __be32 **drc_names, const __be32 **drc_types,
+			      const __be32 **drc_power_domains)
 {
-	const int *indexes, *names, *types, *domains;
+	const __be32 *indexes, *names, *types, *domains;
 
 	indexes = of_get_property(dn, "ibm,drc-indexes", NULL);
 	names = of_get_property(dn, "ibm,drc-names", NULL);
@@ -194,8 +194,8 @@ static int rpaphp_check_drc_props_v1(struct device_node *dn, char *drc_name,
 				char *drc_type, unsigned int my_index)
 {
 	char *name_tmp, *type_tmp;
-	const int *indexes, *names;
-	const int *types, *domains;
+	const __be32 *indexes, *names;
+	const __be32 *types, *domains;
 	int i, rc;
 
 	rc = get_children_props(dn->parent, &indexes, &names, &types, &domains);
@@ -208,7 +208,7 @@ static int rpaphp_check_drc_props_v1(struct device_node *dn, char *drc_name,
 
 	/* Iterate through parent properties, looking for my-drc-index */
 	for (i = 0; i < be32_to_cpu(indexes[0]); i++) {
-		if ((unsigned int) indexes[i + 1] == my_index)
+		if (be32_to_cpu(indexes[i + 1]) == my_index)
 			break;
 
 		name_tmp += (strlen(name_tmp) + 1);
@@ -267,7 +267,7 @@ static int rpaphp_check_drc_props_v2(struct device_node *dn, char *drc_name,
 int rpaphp_check_drc_props(struct device_node *dn, char *drc_name,
 			char *drc_type)
 {
-	const unsigned int *my_index;
+	const __be32 *my_index;
 
 	my_index = of_get_property(dn, "ibm,my-drc-index", NULL);
 	if (!my_index) {
@@ -277,10 +277,10 @@ int rpaphp_check_drc_props(struct device_node *dn, char *drc_name,
 
 	if (of_find_property(dn->parent, "ibm,drc-info", NULL))
 		return rpaphp_check_drc_props_v2(dn, drc_name, drc_type,
-						*my_index);
+						be32_to_cpu(*my_index));
 	else
 		return rpaphp_check_drc_props_v1(dn, drc_name, drc_type,
-						*my_index);
+						be32_to_cpu(*my_index));
 }
 EXPORT_SYMBOL_GPL(rpaphp_check_drc_props);
 
@@ -311,10 +311,11 @@ static int is_php_type(char *drc_type)
  * for built-in pci slots (even when the built-in slots are
  * dlparable.)
  */
-static int is_php_dn(struct device_node *dn, const int **indexes,
-		const int **names, const int **types, const int **power_domains)
+static int is_php_dn(struct device_node *dn, const __be32 **indexes,
+		     const __be32 **names, const __be32 **types,
+		     const __be32 **power_domains)
 {
-	const int *drc_types;
+	const __be32 *drc_types;
 	int rc;
 
 	rc = get_children_props(dn, indexes, names, &drc_types, power_domains);
@@ -374,7 +375,7 @@ static int rpaphp_drc_add_slot(struct device_node *dn)
 	struct slot *slot;
 	int retval = 0;
 	int i;
-	const int *indexes, *names, *types, *power_domains;
+	const __be32 *indexes, *names, *types, *power_domains;
 	char *name, *type;
 
 	/* If this is not a hotplug slot, return without doing anything. */
-- 
2.7.4

