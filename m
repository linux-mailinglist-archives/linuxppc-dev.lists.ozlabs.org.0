Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECB8F6E2B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 06:38:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BKRM22JvzF39d
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 16:38:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BK4Y56QXzF3T4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 16:22:05 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xAB5HXlU171141; Mon, 11 Nov 2019 00:21:51 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w5s551q76-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Nov 2019 00:21:51 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id xAB5HZiJ171257;
 Mon, 11 Nov 2019 00:21:50 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w5s551q6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Nov 2019 00:21:50 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAB5K6oM005493;
 Mon, 11 Nov 2019 05:21:48 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 2w5n35t78t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Nov 2019 05:21:48 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAB5LmS238732234
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 Nov 2019 05:21:48 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 394702805E;
 Mon, 11 Nov 2019 05:21:48 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 849DE2805C;
 Mon, 11 Nov 2019 05:21:47 +0000 (GMT)
Received: from ltcalpine2-lp18.aus.stglabs.ibm.com (unknown [9.40.195.201])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 11 Nov 2019 05:21:47 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 2/9] powerpc/pseries: Fix drc-info mappings of logical cpus
 to drc-index
Date: Sun, 10 Nov 2019 23:21:29 -0600
Message-Id: <1573449697-5448-3-git-send-email-tyreld@linux.ibm.com>
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

There are a couple subtle errors in the mapping between cpu-ids and a
cpus associated drc-index when using the new ibm,drc-info property.

The first is that while drc-info may have been a supported firmware
feature at boot it is possible we have migrated to a CEC with older
firmware that doesn't support the ibm,drc-info property. In that case
the device tree would have been updated after migration to remove the
ibm,drc-info property and replace it with the older style ibm,drc-*
properties for types, indexes, names, and power-domains. PAPR even
goes as far as dictating that if we advertise support for drc-info
that we are capable of supporting either property type at runtime.

The second is that the first value of the ibm,drc-info property is
the int encoded count of drc-info entries. As such "value" returned
by of_prop_next_u32() is pointing at that count, and not the first
element of the first drc-info entry as is expected by the
of_read_drc_info_cell() helper.

Fix the first by ignoring DRC-INFO firmware feature and instead
testing directly for ibm,drc-info, and then falling back to the
old style ibm,drc-indexes in the case it doesn't exit.

Fix the second by incrementing value to the next element prior to
parsing drc-info entries.

Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/pseries_energy.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/pseries_energy.c b/arch/powerpc/platforms/pseries/pseries_energy.c
index a96874f..09e98d3 100644
--- a/arch/powerpc/platforms/pseries/pseries_energy.c
+++ b/arch/powerpc/platforms/pseries/pseries_energy.c
@@ -36,6 +36,7 @@ static int sysfs_entries;
 static u32 cpu_to_drc_index(int cpu)
 {
 	struct device_node *dn = NULL;
+	struct property *info;
 	int thread_index;
 	int rc = 1;
 	u32 ret = 0;
@@ -47,20 +48,18 @@ static u32 cpu_to_drc_index(int cpu)
 	/* Convert logical cpu number to core number */
 	thread_index = cpu_core_index_of_thread(cpu);
 
-	if (firmware_has_feature(FW_FEATURE_DRC_INFO)) {
-		struct property *info = NULL;
+	info = of_find_property(dn, "ibm,drc-info", NULL);
+	if (info) {
 		struct of_drc_info drc;
 		int j;
 		u32 num_set_entries;
 		const __be32 *value;
 
-		info = of_find_property(dn, "ibm,drc-info", NULL);
-		if (info == NULL)
-			goto err_of_node_put;
-
 		value = of_prop_next_u32(info, NULL, &num_set_entries);
 		if (!value)
 			goto err_of_node_put;
+		else
+			value++;
 
 		for (j = 0; j < num_set_entries; j++) {
 
@@ -110,6 +109,7 @@ static u32 cpu_to_drc_index(int cpu)
 static int drc_index_to_cpu(u32 drc_index)
 {
 	struct device_node *dn = NULL;
+	struct property *info;
 	const int *indexes;
 	int thread_index = 0, cpu = 0;
 	int rc = 1;
@@ -117,21 +117,18 @@ static int drc_index_to_cpu(u32 drc_index)
 	dn = of_find_node_by_path("/cpus");
 	if (dn == NULL)
 		goto err;
-
-	if (firmware_has_feature(FW_FEATURE_DRC_INFO)) {
-		struct property *info = NULL;
+	info = of_find_property(dn, "ibm,drc-info", NULL);
+	if (info) {
 		struct of_drc_info drc;
 		int j;
 		u32 num_set_entries;
 		const __be32 *value;
 
-		info = of_find_property(dn, "ibm,drc-info", NULL);
-		if (info == NULL)
-			goto err_of_node_put;
-
 		value = of_prop_next_u32(info, NULL, &num_set_entries);
 		if (!value)
 			goto err_of_node_put;
+		else
+			value++;
 
 		for (j = 0; j < num_set_entries; j++) {
 
-- 
2.7.4

