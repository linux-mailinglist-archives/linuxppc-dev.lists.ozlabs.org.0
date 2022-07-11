Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEDD56D386
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 05:47:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lh8w32d6Lz3c7h
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Jul 2022 13:47:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UB7vUG4B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UB7vUG4B;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lh8vM1BBbz2yJ5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Jul 2022 13:46:38 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26B239oo022799;
	Mon, 11 Jul 2022 03:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=lbnQ8tqSl6pnPEc8bY+nklDKgjDgzlxSpb44T/eMyHw=;
 b=UB7vUG4BfitMPqt49WBEAVwDA9BzyXF0lZLFIqSUNEipm+Om82kIBvYUwFnE5U70/4LQ
 xvzAR3LRqNtovIAKcRcI5J88fgxFt3mUgk0BvQJXZJiElg3D5tUxJRRi8IkgHCC9SzXa
 2zdNCTd45GTynKIPlklxx5QHQkwBd+4TIaEanT+f4eiU+89EWh5AzlDp6o5LUFFOgjAN
 mJfB2jDXxjX+UbJZWte9DMEsk7kj8BHCdK7FRMScptzU3A5GE3tec2437E2rExYZS6GQ
 CON/2wVSAlZrcLnxks4Kf4szlMAz+M+9Z48cdCBQ1AeDL/VbcvUoDuHB88E3Zk5M+QvS 7Q== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h7ygdjr7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 03:46:23 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26B3KBmn018377;
	Mon, 11 Jul 2022 03:46:21 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3h71a8j3a8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Jul 2022 03:46:20 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26B3kRAv25559492
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Jul 2022 03:46:27 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 81B60A4053;
	Mon, 11 Jul 2022 03:46:17 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49E8EA4040;
	Mon, 11 Jul 2022 03:46:14 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.105.173])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 11 Jul 2022 03:46:14 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, vaibhav@linux.ibm.com
Subject: [PATCH v2] powerpc/papr_scm: Fix nvdimm event mappings
Date: Mon, 11 Jul 2022 09:16:05 +0530
Message-Id: <20220711034605.212683-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OcbqPDvKQuQ2EvjgPEz-RSgMAszZy71K
X-Proofpoint-ORIG-GUID: OcbqPDvKQuQ2EvjgPEz-RSgMAszZy71K
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-10_18,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207110013
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
added performance monitoring support for papr-scm nvdimm devices via
perf interface. Commit also added an array in papr_scm_priv
structure called "nvdimm_events_map", which got filled based on the
result of H_SCM_PERFORMANCE_STATS hcall. 

Currently there is an assumption that the order of events in the
stats buffer, returned by the hypervisor is same. And that order also
matches with the events specified in nvdimm driver code. 
But this assumption is not documented anywhere in Power Architecture
Platform Requirements (PAPR) document. Although the order
of events happens to be same on current systems, but it might
not be true in future generation systems. Fix the issue, by
adding a static mapping for nvdimm events to corresponding stat-id,
and removing the dynamic map from papr_scm_priv structure.

Fixes: 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support")
Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 62 ++++++++++-------------
 1 file changed, 28 insertions(+), 34 deletions(-)

---
Changelog:
v1 -> v2
- To avoid accidental reordering, explicitly defined index for all
  the events. Also added valid config check in papr_scm_pmu_event_init
  function as suggested by Michael Ellerman.
- Did minor commit message changes and remove initialization of
  rc variable as suggested by Michael Ellerman  
- Link to the patch v1: https://patchwork.kernel.org/project/linux-nvdimm/patch/20220610133431.410514-1-kjain@linux.ibm.com/
---
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 82cae08976bc..139e243c3f49 100644
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
@@ -350,6 +347,25 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
 #ifdef CONFIG_PERF_EVENTS
 #define to_nvdimm_pmu(_pmu)	container_of(_pmu, struct nvdimm_pmu, pmu)
 
+static const char * const nvdimm_events_map[] = {
+	[1] = "CtlResCt",
+	[2] = "CtlResTm",
+	[3] = "PonSecs ",
+	[4] = "MemLife ",
+	[5] = "CritRscU",
+	[6] = "HostLCnt",
+	[7] = "HostSCnt",
+	[8] = "HostSDur",
+	[9] = "HostLDur",
+	[10] = "MedRCnt ",
+	[11] = "MedWCnt ",
+	[12] = "MedRDur ",
+	[13] = "MedWDur ",
+	[14] = "CchRHCnt",
+	[15] = "CchWHCnt",
+	[16] = "FastWCnt",
+};
+
 static int papr_scm_pmu_get_value(struct perf_event *event, struct device *dev, u64 *count)
 {
 	struct papr_scm_perf_stat *stat;
@@ -357,11 +373,15 @@ static int papr_scm_pmu_get_value(struct perf_event *event, struct device *dev,
 	struct papr_scm_priv *p = (struct papr_scm_priv *)dev->driver_data;
 	int rc, size;
 
+	/* Invalid eventcode */
+	if (event->attr.config == 0 || event->attr.config >= ARRAY_SIZE(nvdimm_events_map))
+		return -EINVAL;
+
 	/* Allocate request buffer enough to hold single performance stat */
 	size = sizeof(struct papr_scm_perf_stats) +
 		sizeof(struct papr_scm_perf_stat);
 
-	if (!p || !p->nvdimm_events_map)
+	if (!p)
 		return -EINVAL;
 
 	stats = kzalloc(size, GFP_KERNEL);
@@ -370,7 +390,7 @@ static int papr_scm_pmu_get_value(struct perf_event *event, struct device *dev,
 
 	stat = &stats->scm_statistic[0];
 	memcpy(&stat->stat_id,
-	       &p->nvdimm_events_map[event->attr.config * sizeof(stat->stat_id)],
+	       nvdimm_events_map[event->attr.config],
 		sizeof(stat->stat_id));
 	stat->stat_val = 0;
 
@@ -460,10 +480,9 @@ static void papr_scm_pmu_del(struct perf_event *event, int flags)
 
 static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu *nd_pmu)
 {
-	struct papr_scm_perf_stat *stat;
 	struct papr_scm_perf_stats *stats;
 	u32 available_events;
-	int index, rc = 0;
+	int rc;
 
 	if (!p->stat_buffer_len)
 		return -ENOENT;
@@ -476,34 +495,12 @@ static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu
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
-
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
@@ -539,7 +536,7 @@ static void papr_scm_pmu_register(struct papr_scm_priv *p)
 
 	rc = register_nvdimm_pmu(nd_pmu, p->pdev);
 	if (rc)
-		goto pmu_register_err;
+		goto pmu_check_events_err;
 
 	/*
 	 * Set archdata.priv value to nvdimm_pmu structure, to handle the
@@ -548,8 +545,6 @@ static void papr_scm_pmu_register(struct papr_scm_priv *p)
 	p->pdev->archdata.priv = nd_pmu;
 	return;
 
-pmu_register_err:
-	kfree(p->nvdimm_events_map);
 pmu_check_events_err:
 	kfree(nd_pmu);
 pmu_err_print:
@@ -1560,7 +1555,6 @@ static int papr_scm_remove(struct platform_device *pdev)
 		unregister_nvdimm_pmu(pdev->archdata.priv);
 
 	pdev->archdata.priv = NULL;
-	kfree(p->nvdimm_events_map);
 	kfree(p->bus_desc.provider_name);
 	kfree(p);
 
-- 
2.31.1

