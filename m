Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ACD4C2D28
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 08:16:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46j8Cv4nyvzDqPC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 16:16:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tyreld@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46j87c5t3gzDqFK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Oct 2019 16:12:28 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9167jZs098569; Tue, 1 Oct 2019 02:12:24 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vbyjetpf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 02:12:23 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x9169Anm102362;
 Tue, 1 Oct 2019 02:12:23 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vbyjetpeb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 02:12:23 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x916A3r5010960;
 Tue, 1 Oct 2019 06:12:22 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 2v9y570wrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 06:12:22 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x916CLfs53281156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Oct 2019 06:12:21 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3828112063;
 Tue,  1 Oct 2019 06:12:21 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C550112061;
 Tue,  1 Oct 2019 06:12:21 +0000 (GMT)
Received: from ltcalpine2-lp18.aus.stglabs.ibm.com (unknown [9.40.195.201])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  1 Oct 2019 06:12:21 +0000 (GMT)
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: mpe@ellerman.id.au, bhelgaas@google.com
Subject: [RFC PATCH 3/9] powerpc/pseries: fix drc-info mappings of logical
 cpus to drc-index
Date: Tue,  1 Oct 2019 01:12:08 -0500
Message-Id: <1569910334-5972-4-git-send-email-tyreld@linux.ibm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569910334-5972-1-git-send-email-tyreld@linux.ibm.com>
References: <1569910334-5972-1-git-send-email-tyreld@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-01_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910010060
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
Cc: nathanl@linux.ibm.com, linux-pci@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Tyrel Datwyler <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are a couple subtle errors in the mapping between cpu-ids and a
cpus associated drc-index when using the new ibm,drc-info property.

The first is we while drc-info may have been a supported firmware
feature at boot it is possible we have migrated to a CEC with older
firmware that doesn't support the ibm,drc-info property. In that case
the device tree would have been updated after migration to remove the
ibm,drc-info property and replace it with the older style ibm,drc-*
properties for types, indexes, names, and power-domains.

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

