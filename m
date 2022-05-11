Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA560522E55
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 10:27:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kyp1n4jhVz3cHX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 18:27:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UeVza1md;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UeVza1md; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kyp103W8Lz3bdM
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 18:26:59 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24B5e91c001126;
 Wed, 11 May 2022 08:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=UnGTwYp3U43I9F1WrjgfwnJEnsMPx40zRf6UjzLZVu8=;
 b=UeVza1mdcjJlJD/4Tw6GLQn7vVwWmvfdRzW0M1QlGacFEsgUUe6zwLMg4dwbr0x9xcFA
 9IR+bS/0MCLrV42sZcniG4pjZTvrE+KtYqvbzY069vqT7HlKQXBIt67Bo9UbJXYxlCu3
 RUx0wqSoLnjmRi5wnEvyBW7fh049/CAZBWyNUdEPj8J4tu1dVytpocyRGYtrHeoJcT9d
 L8hMF0/wrgm3mDcCcTCqFLD3ei6/d/9PZZAkzyh07kp3VXbjlqr5EvN0X5w4eMPGWks2
 SA+jV/XHuKNs27YH1MOzPid3N0Ab4zE8YY1fV+QF/wfXvMkA0RNgfamRD/McYZXpgfT/ 2g== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g054jmgvk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 08:26:49 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24B8DDgU007377;
 Wed, 11 May 2022 08:26:46 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3fyrkk11xt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 May 2022 08:26:46 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24B8Qhoo50397506
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 May 2022 08:26:43 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B91004C04A;
 Wed, 11 May 2022 08:26:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61D194C040;
 Wed, 11 May 2022 08:26:39 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.43.12.38])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 11 May 2022 08:26:39 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Wed, 11 May 2022 13:56:37 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: nvdimm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 Kajol Jain <kjain@linux.ibm.com>
Subject: [PATCH v2] powerpc/papr_scm: Fix leaking nvdimm_events_map elements
Date: Wed, 11 May 2022 13:56:36 +0530
Message-Id: <20220511082637.646714-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dC0X-v-c4-5yMxyTd747dETdl24ZqFAT
X-Proofpoint-GUID: dC0X-v-c4-5yMxyTd747dETdl24ZqFAT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-11_02,2022-05-10_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205110035
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
Cc: Shivaprasad G Bhat <sbhat@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Right now 'char *' elements allocated for individual 'stat_id' in
'papr_scm_priv.nvdimm_events_map[]' during papr_scm_pmu_check_events(), get
leaked in papr_scm_remove() and papr_scm_pmu_register(),
papr_scm_pmu_check_events() error paths.

Also individual 'stat_id' arent NULL terminated 'char *' instead they are fixed
8-byte sized identifiers. However papr_scm_pmu_register() assumes it to be a
NULL terminated 'char *' and at other places it assumes it to be a
'papr_scm_perf_stat.stat_id' sized string which is 8-byes in size.

Fix this by allocating the memory for papr_scm_priv.nvdimm_events_map to also
include space for 'stat_id' entries. This is possible since number of available
events/stat_ids are known upfront. This saves some memory and one extra level of
indirection from 'nvdimm_events_map' to 'stat_id'. Also rest of the code
can continue to call 'kfree(papr_scm_priv.nvdimm_events_map)' without needing to
iterate over the array and free up individual elements.

Fixes: 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support")
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Change-log:

v2:
* Removed the typedef 'stat_id_t' which will be introduced in a later patch
  [Aneesh]
* Updated the patch description a bit
---
 arch/powerpc/platforms/pseries/papr_scm.c | 54 ++++++++++-------------
 1 file changed, 24 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 39962c905542..181b855b3050 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -125,8 +125,8 @@ struct papr_scm_priv {
 	/* The bits which needs to be overridden */
 	u64 health_bitmap_inject_mask;
 
-	 /* array to have event_code and stat_id mappings */
-	char **nvdimm_events_map;
+	/* array to have event_code and stat_id mappings */
+	u8 *nvdimm_events_map;
 };
 
 static int papr_scm_pmem_flush(struct nd_region *nd_region,
@@ -370,7 +370,7 @@ static int papr_scm_pmu_get_value(struct perf_event *event, struct device *dev,
 
 	stat = &stats->scm_statistic[0];
 	memcpy(&stat->stat_id,
-	       p->nvdimm_events_map[event->attr.config],
+	       &p->nvdimm_events_map[event->attr.config * sizeof(stat->stat_id)],
 		sizeof(stat->stat_id));
 	stat->stat_val = 0;
 
@@ -462,14 +462,13 @@ static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu
 {
 	struct papr_scm_perf_stat *stat;
 	struct papr_scm_perf_stats *stats;
-	int index, rc, count;
 	u32 available_events;
-
-	if (!p->stat_buffer_len)
-		return -ENOENT;
+	int index, rc = 0;
 
 	available_events = (p->stat_buffer_len  - sizeof(struct papr_scm_perf_stats))
 			/ sizeof(struct papr_scm_perf_stat);
+	if (available_events == 0)
+		return -EOPNOTSUPP;
 
 	/* Allocate the buffer for phyp where stats are written */
 	stats = kzalloc(p->stat_buffer_len, GFP_KERNEL);
@@ -478,35 +477,30 @@ static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu
 		return rc;
 	}
 
-	/* Allocate memory to nvdimm_event_map */
-	p->nvdimm_events_map = kcalloc(available_events, sizeof(char *), GFP_KERNEL);
-	if (!p->nvdimm_events_map) {
-		rc = -ENOMEM;
-		goto out_stats;
-	}
-
 	/* Called to get list of events supported */
 	rc = drc_pmem_query_stats(p, stats, 0);
 	if (rc)
-		goto out_nvdimm_events_map;
-
-	for (index = 0, stat = stats->scm_statistic, count = 0;
-		     index < available_events; index++, ++stat) {
-		p->nvdimm_events_map[count] = kmemdup_nul(stat->stat_id, 8, GFP_KERNEL);
-		if (!p->nvdimm_events_map[count]) {
-			rc = -ENOMEM;
-			goto out_nvdimm_events_map;
-		}
+		goto out;
 
-		count++;
+	/*
+	 * Allocate memory and populate nvdimm_event_map.
+	 * Allocate an extra element for NULL entry
+	 */
+	p->nvdimm_events_map = kcalloc(available_events + 1,
+				       sizeof(stat->stat_id),
+				       GFP_KERNEL);
+	if (!p->nvdimm_events_map) {
+		rc = -ENOMEM;
+		goto out;
 	}
-	p->nvdimm_events_map[count] = NULL;
-	kfree(stats);
-	return 0;
 
-out_nvdimm_events_map:
-	kfree(p->nvdimm_events_map);
-out_stats:
+	/* Copy all stat_ids to event map */
+	for (index = 0, stat = stats->scm_statistic;
+	     index < available_events; index++, ++stat) {
+		memcpy(&p->nvdimm_events_map[index * sizeof(stat->stat_id)],
+		       &stat->stat_id, sizeof(stat->stat_id));
+	}
+out:
 	kfree(stats);
 	return rc;
 }

base-commit: 348c71344111d7a48892e3e52264ff11956fc196
-- 
2.35.1

