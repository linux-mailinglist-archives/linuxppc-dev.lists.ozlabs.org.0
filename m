Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE87954676E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 15:38:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LKMVF6L7lz3bx5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 23:38:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PQtipTDW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PQtipTDW;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LKMTY2yV3z3bkC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 23:37:36 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25ADIiE8023542;
	Fri, 10 Jun 2022 13:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Nv5m7qgMnFXTupaZo4Jf0rCTifEw0xb/z1HHR1ZsH8M=;
 b=PQtipTDWscTREqnhXSrVaokUDRoo3NnESee5aKmg1QkEx3ALWRNDNBgkRnEzHHj+R2+5
 Kq6KoUoQocieC5nCnl/lEuLW/L/IV20WS84+XplG4IOZRF6PSLGNlWlS/bME6oIf53yz
 M6Y7ovMi0/3u5a21WWIn7C6ClWdCy0I8EMFUzLdKOXas2kKPCK5Pt+zW8HAG/g1eUpzb
 wQYd5bpA9GRIS8qz3KbMH1pcp0qCOEZI1lMalNiqiPQ0Bn1nCJTP1dEqFQ1Bz6UU2Hsd
 pwk8uhgrhHmZL0cAQKBdORoCKsPT13KxenZ2QePffZM3BkAettHoUlEjnw8FwQwDK9Un DA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gm6qurb7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:35:17 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25ADSZL0002894;
	Fri, 10 Jun 2022 13:35:15 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma01fra.de.ibm.com with ESMTP id 3gfy19ehx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jun 2022 13:35:15 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25ADZC0l19595772
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jun 2022 13:35:12 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0A7824C044;
	Fri, 10 Jun 2022 13:35:12 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D82684C040;
	Fri, 10 Jun 2022 13:35:08 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.72.99])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 10 Jun 2022 13:35:08 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, vaibhav@linux.ibm.com
Subject: [PATCH] powerpc/papr_scm: Fix nvdimm event mappings
Date: Fri, 10 Jun 2022 19:04:31 +0530
Message-Id: <20220610133431.410514-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: P68vYUAe1FpUp9F8kHx2nIevoGAt7mdU
X-Proofpoint-ORIG-GUID: P68vYUAe1FpUp9F8kHx2nIevoGAt7mdU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-10_06,2022-06-09_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206100056
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
Cc: nvdimm@lists.linux.dev, atrajeev@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, maddy@linux.ibm.com, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, dan.j.williams@intel.com, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support")
adds performance monitoring support for papr-scm nvdimm devices via
perf interface. It also adds one array in papr_scm_priv
structure called "nvdimm_events_map", to dynamically save the stat_id
for events specified in nvdimm driver code "nd_perf.c".

Right now the mapping is done based on the result of 
H_SCM_PERFORMANCE_STATS hcall, when all the stats are
requested. Currently there is an assumption, that a
certain stat will always be found at a specific offset
in the stat buffer. The assumption may not be true or
documented as part of PAPR documentation. Fixing it,
by adding a static mapping for nvdimm events to
corresponding stat-id, and removing the map from
papr_scm_priv structure.

Fixes: 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support")
Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 59 ++++++++++-------------
 1 file changed, 25 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 181b855b3050..5434c654a797 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -124,9 +124,6 @@ struct papr_scm_priv {
 
 	/* The bits which needs to be overridden */
 	u64 health_bitmap_inject_mask;
-
-	/* array to have event_code and stat_id mappings */
-	u8 *nvdimm_events_map;
 };
 
 static int papr_scm_pmem_flush(struct nd_region *nd_region,
@@ -350,6 +347,26 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
 #ifdef CONFIG_PERF_EVENTS
 #define to_nvdimm_pmu(_pmu)	container_of(_pmu, struct nvdimm_pmu, pmu)
 
+static const char * const nvdimm_events_map[] = {
+	"N/A",
+	"CtlResCt",
+	"CtlResTm",
+	"PonSecs ",
+	"MemLife ",
+	"CritRscU",
+	"HostLCnt",
+	"HostSCnt",
+	"HostSDur",
+	"HostLDur",
+	"MedRCnt ",
+	"MedWCnt ",
+	"MedRDur ",
+	"MedWDur ",
+	"CchRHCnt",
+	"CchWHCnt",
+	"FastWCnt",
+};
+
 static int papr_scm_pmu_get_value(struct perf_event *event, struct device *dev, u64 *count)
 {
 	struct papr_scm_perf_stat *stat;
@@ -361,7 +378,7 @@ static int papr_scm_pmu_get_value(struct perf_event *event, struct device *dev,
 	size = sizeof(struct papr_scm_perf_stats) +
 		sizeof(struct papr_scm_perf_stat);
 
-	if (!p || !p->nvdimm_events_map)
+	if (!p)
 		return -EINVAL;
 
 	stats = kzalloc(size, GFP_KERNEL);
@@ -370,7 +387,7 @@ static int papr_scm_pmu_get_value(struct perf_event *event, struct device *dev,
 
 	stat = &stats->scm_statistic[0];
 	memcpy(&stat->stat_id,
-	       &p->nvdimm_events_map[event->attr.config * sizeof(stat->stat_id)],
+	       nvdimm_events_map[event->attr.config],
 		sizeof(stat->stat_id));
 	stat->stat_val = 0;
 
@@ -460,10 +477,9 @@ static void papr_scm_pmu_del(struct perf_event *event, int flags)
 
 static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu *nd_pmu)
 {
-	struct papr_scm_perf_stat *stat;
 	struct papr_scm_perf_stats *stats;
 	u32 available_events;
-	int index, rc = 0;
+	int rc = 0;
 
 	available_events = (p->stat_buffer_len  - sizeof(struct papr_scm_perf_stats))
 			/ sizeof(struct papr_scm_perf_stat);
@@ -473,34 +489,12 @@ static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu
 	/* Allocate the buffer for phyp where stats are written */
 	stats = kzalloc(p->stat_buffer_len, GFP_KERNEL);
 	if (!stats) {
-		rc = -ENOMEM;
-		return rc;
+		return -ENOMEM;
 	}
 
 	/* Called to get list of events supported */
 	rc = drc_pmem_query_stats(p, stats, 0);
-	if (rc)
-		goto out;
 
-	/*
-	 * Allocate memory and populate nvdimm_event_map.
-	 * Allocate an extra element for NULL entry
-	 */
-	p->nvdimm_events_map = kcalloc(available_events + 1,
-				       sizeof(stat->stat_id),
-				       GFP_KERNEL);
-	if (!p->nvdimm_events_map) {
-		rc = -ENOMEM;
-		goto out;
-	}
-
-	/* Copy all stat_ids to event map */
-	for (index = 0, stat = stats->scm_statistic;
-	     index < available_events; index++, ++stat) {
-		memcpy(&p->nvdimm_events_map[index * sizeof(stat->stat_id)],
-		       &stat->stat_id, sizeof(stat->stat_id));
-	}
-out:
 	kfree(stats);
 	return rc;
 }
@@ -536,7 +530,7 @@ static void papr_scm_pmu_register(struct papr_scm_priv *p)
 
 	rc = register_nvdimm_pmu(nd_pmu, p->pdev);
 	if (rc)
-		goto pmu_register_err;
+		goto pmu_check_events_err;
 
 	/*
 	 * Set archdata.priv value to nvdimm_pmu structure, to handle the
@@ -545,8 +539,6 @@ static void papr_scm_pmu_register(struct papr_scm_priv *p)
 	p->pdev->archdata.priv = nd_pmu;
 	return;
 
-pmu_register_err:
-	kfree(p->nvdimm_events_map);
 pmu_check_events_err:
 	kfree(nd_pmu);
 pmu_err_print:
@@ -1557,7 +1549,6 @@ static int papr_scm_remove(struct platform_device *pdev)
 		unregister_nvdimm_pmu(pdev->archdata.priv);
 
 	pdev->archdata.priv = NULL;
-	kfree(p->nvdimm_events_map);
 	kfree(p->bus_desc.provider_name);
 	kfree(p);
 
-- 
2.31.1

