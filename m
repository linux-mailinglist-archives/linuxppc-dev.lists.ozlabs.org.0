Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DECA5898A5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Aug 2022 09:50:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lz19V2w3cz3bhF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Aug 2022 17:50:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QbAycX6Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QbAycX6Q;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lz18l6FCtz2xHJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Aug 2022 17:49:42 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2747LZ6Y005660;
	Thu, 4 Aug 2022 07:49:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=tCwC+z82W5CEqJnaeSzQZp6mnJqH0moyIs0xYhqK2bU=;
 b=QbAycX6Q+Jf8o6xdmqnF0OmKmN6tX8sQ0Wp02qSJEckK1edCu1QFxaZF42RpRNv7Y5HL
 gtjqQ3Yblp8pPrYSvWDltw4OB4SsiLhy1WLr4ZZbNFD5Ml8SVL6E+mLU/RTm7u9DTdCx
 QQHN/osiNoYJCFQRyB4myULhYUMxJguq480f0M2WOnqS+WWsRMnrNhKjVE1e95eM6u0R
 NL2OedlTr354/SPI7eFVlw8S4B7o8RKyyGXniggY22UAWY105q/fVoF9OSGiImOf1+ta
 RKS/961JS6mFGYDlJ+l8jUqwvoriZj/zzFoy4Af1gqJPhZYRhMHLVbCGNKx0uTVDrxSA bw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hr9nerpba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Aug 2022 07:49:16 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2747MOdR010231;
	Thu, 4 Aug 2022 07:49:15 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03ams.nl.ibm.com with ESMTP id 3hmv98wv2g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Aug 2022 07:49:14 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2747nBRa27525588
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Aug 2022 07:49:12 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4FA752051;
	Thu,  4 Aug 2022 07:49:11 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.116.183])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 74AB05204E;
	Thu,  4 Aug 2022 07:49:08 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, vaibhav@linux.ibm.com
Subject: [PATCH v3] powerpc/papr_scm: Fix nvdimm event mappings
Date: Thu,  4 Aug 2022 13:18:52 +0530
Message-Id: <20220804074852.55157-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kogVuFbgXj3UssrlxGLGJPOykfJyF5q4
X-Proofpoint-ORIG-GUID: kogVuFbgXj3UssrlxGLGJPOykfJyF5q4
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-04_01,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 clxscore=1011 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2208040030
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
Cc: nvdimm@lists.linux.dev, atrajeev@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, maddy@linux.ibm.com, aneesh.kumar@linux.ibm.com, dan.j.williams@intel.com, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support")
added performance monitoring support for papr-scm nvdimm devices via
perf interface. Commit also added an array in papr_scm_priv
structure called "nvdimm_events_map", which got filled based on the
result of H_SCM_PERFORMANCE_STATS hcall.

Currently there is an assumption that the order of events in the
stats buffer, returned by the hypervisor is same. And order also
happens to matches with the events specified in nvdimm driver code.
But this assumption is not documented in Power Architecture
Platform Requirements (PAPR) document. Although the order
of events happens to be same on current generation od system, but
it might not be true in future generation systems. Fix the issue, by
adding a static mapping for nvdimm events to corresponding stat-id,
and removing the dynamic map from papr_scm_priv structure. Also
remove the function papr_scm_pmu_check_events from papr_scm.c file,
as we no longer need to copy stat-ids dynamically.

Fixes: 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support")
Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 88 +++++++----------------
 1 file changed, 27 insertions(+), 61 deletions(-)

---
Changelog:
v2 -> v3
- Remove function papr_scm_pmu_check_events() and replace the
  event checks in papr_scm_pmu_register() function with p->stat_buffer_len
  as suggested by Vaibhav Jain
  Link to the patch v2: https://lore.kernel.org/all/20220711034605.212683-1-kjain@linux.ibm.com/

v1 -> v2
- To avoid accidental reordering, explicitly defined index for all
  the events. Also added valid config check in papr_scm_pmu_event_init
  function as suggested by Michael Ellerman.
- Did minor commit message changes and remove initialization of
  rc variable as suggested by Michael Ellerman  
- Link to the patch v1: https://patchwork.kernel.org/project/linux-nvdimm/patch/20220610133431.410514-1-kjain@linux.ibm.com/
---

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 82cae08976bc..16bac4e0d7a2 100644
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
 
@@ -458,56 +478,6 @@ static void papr_scm_pmu_del(struct perf_event *event, int flags)
 	papr_scm_pmu_read(event);
 }
 
-static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu *nd_pmu)
-{
-	struct papr_scm_perf_stat *stat;
-	struct papr_scm_perf_stats *stats;
-	u32 available_events;
-	int index, rc = 0;
-
-	if (!p->stat_buffer_len)
-		return -ENOENT;
-
-	available_events = (p->stat_buffer_len  - sizeof(struct papr_scm_perf_stats))
-			/ sizeof(struct papr_scm_perf_stat);
-	if (available_events == 0)
-		return -EOPNOTSUPP;
-
-	/* Allocate the buffer for phyp where stats are written */
-	stats = kzalloc(p->stat_buffer_len, GFP_KERNEL);
-	if (!stats) {
-		rc = -ENOMEM;
-		return rc;
-	}
-
-	/* Called to get list of events supported */
-	rc = drc_pmem_query_stats(p, stats, 0);
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
-
-	/* Copy all stat_ids to event map */
-	for (index = 0, stat = stats->scm_statistic;
-	     index < available_events; index++, ++stat) {
-		memcpy(&p->nvdimm_events_map[index * sizeof(stat->stat_id)],
-		       &stat->stat_id, sizeof(stat->stat_id));
-	}
-out:
-	kfree(stats);
-	return rc;
-}
-
 static void papr_scm_pmu_register(struct papr_scm_priv *p)
 {
 	struct nvdimm_pmu *nd_pmu;
@@ -519,8 +489,7 @@ static void papr_scm_pmu_register(struct papr_scm_priv *p)
 		goto pmu_err_print;
 	}
 
-	rc = papr_scm_pmu_check_events(p, nd_pmu);
-	if (rc)
+	if (!p->stat_buffer_len)
 		goto pmu_check_events_err;
 
 	nd_pmu->pmu.task_ctx_nr = perf_invalid_context;
@@ -539,7 +508,7 @@ static void papr_scm_pmu_register(struct papr_scm_priv *p)
 
 	rc = register_nvdimm_pmu(nd_pmu, p->pdev);
 	if (rc)
-		goto pmu_register_err;
+		goto pmu_check_events_err;
 
 	/*
 	 * Set archdata.priv value to nvdimm_pmu structure, to handle the
@@ -548,8 +517,6 @@ static void papr_scm_pmu_register(struct papr_scm_priv *p)
 	p->pdev->archdata.priv = nd_pmu;
 	return;
 
-pmu_register_err:
-	kfree(p->nvdimm_events_map);
 pmu_check_events_err:
 	kfree(nd_pmu);
 pmu_err_print:
@@ -1560,7 +1527,6 @@ static int papr_scm_remove(struct platform_device *pdev)
 		unregister_nvdimm_pmu(pdev->archdata.priv);
 
 	pdev->archdata.priv = NULL;
-	kfree(p->nvdimm_events_map);
 	kfree(p->bus_desc.provider_name);
 	kfree(p);
 
-- 
2.27.0

