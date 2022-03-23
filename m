Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA2A4E56D6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 17:47:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNvRG20gwz30Qx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 03:47:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R206v4B1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=R206v4B1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNvQ13GN0z305j
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Mar 2022 03:46:33 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22NGcY8N000638; 
 Wed, 23 Mar 2022 16:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=nQUDxAWdnBxieEOrgt6Rjodl6BsNlSgJ11dryF09ZFU=;
 b=R206v4B1YR+CMIlxy+9iNJyPUWmQjekM/3AjQ0j17iOnRBPvju+CU8zBSMOWvCf3njVj
 Lvp4h9Z3OSQ+9/4FfxnxvzuMr4KX3hXuSSrb4GBi8L4le6Ou3dS4AKyCEEodDVNv8o01
 d7DeLQ+rnoW0PhgzO0tFKgU/Emqsop4Qeiz4GMOdAvoi1hYMIkjVDkXzIkZV1HZu/RRo
 gA6A4k4XGJ+lJX1VWs34Wim3Mmv+9WUWsr2vsljH11NWiPivk6uGLjIm0nczRKr0l0Xf
 9O5uM7Nlk4x84m7tIXa+RkdpjpITftTxECc6nKGtegYX8AtyaEKv0VXElnm37VIVquWJ tQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f000yu6hx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 16:46:20 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22NGjBlM031956;
 Wed, 23 Mar 2022 16:46:18 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3ew6ej12h6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 16:46:18 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22NGkFDt49480104
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 16:46:15 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AC9E4C050;
 Wed, 23 Mar 2022 16:46:15 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9D1F4C040;
 Wed, 23 Mar 2022 16:46:10 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.30.161]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 23 Mar 2022 16:46:10 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, peterz@infradead.org,
 dan.j.williams@intel.com, ira.weiny@intel.com, vishal.l.verma@intel.com
Subject: [v2 PATCH 2/2] powerpc/papr_scm: Fix build failure when
Date: Wed, 23 Mar 2022 22:15:50 +0530
Message-Id: <20220323164550.109768-2-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220323164550.109768-1-kjain@linux.ibm.com>
References: <20220323164550.109768-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xIEXUz4LB4lpWrkHGvS1F04dXex9Hqmk
X-Proofpoint-GUID: xIEXUz4LB4lpWrkHGvS1F04dXex9Hqmk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-23_07,2022-03-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203230087
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
Cc: santosh@fossix.org, maddy@linux.ibm.com, rnsastry@linux.ibm.com,
 aneesh.kumar@linux.ibm.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
 vaibhav@linux.ibm.com, tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The following build failure occurs when CONFIG_PERF_EVENTS is not set
as generic pmu functions are not visible in that scenario.

arch/powerpc/platforms/pseries/papr_scm.c:372:35: error: ‘struct perf_event’ has no member named ‘attr’
         p->nvdimm_events_map[event->attr.config],
                                   ^~
In file included from ./include/linux/list.h:5,
                 from ./include/linux/kobject.h:19,
                 from ./include/linux/of.h:17,
                 from arch/powerpc/platforms/pseries/papr_scm.c:5:
arch/powerpc/platforms/pseries/papr_scm.c: In function ‘papr_scm_pmu_event_init’:
arch/powerpc/platforms/pseries/papr_scm.c:389:49: error: ‘struct perf_event’ has no member named ‘pmu’
  struct nvdimm_pmu *nd_pmu = to_nvdimm_pmu(event->pmu);
                                                 ^~
./include/linux/container_of.h:18:26: note: in definition of macro ‘container_of’
  void *__mptr = (void *)(ptr);     \
                          ^~~
arch/powerpc/platforms/pseries/papr_scm.c:389:30: note: in expansion of macro ‘to_nvdimm_pmu’
  struct nvdimm_pmu *nd_pmu = to_nvdimm_pmu(event->pmu);
                              ^~~~~~~~~~~~~
In file included from ./include/linux/bits.h:22,
                 from ./include/linux/bitops.h:6,
                 from ./include/linux/of.h:15,
                 from arch/powerpc/platforms/pseries/papr_scm.c:5:

Fix the build issue by adding check for CONFIG_PERF_EVENTS config option
and also add stub function for papr_scm_pmu_register to handle
the CONFIG_PERF_EVENTS=n case. Also move the position of macro
"to_nvdimm_pmu" inorder to merge it in CONFIG_PERF_EVENTS=y block.

Fixes: 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support") (Commit id
based on libnvdimm-for-next tree)
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/papr_scm.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

---
Changelog:
v1 -> v2
- Rebase and tested the fix patch changes on top of libnvdimm-for-next branch

- Add stub function for papr_scm_pmu_register function to handle
  the CONFIG_PERF_EVENTS=n case.

- Move the position of macro "to_nvdimm_pmu" inorder to merge it in CONFIG_PERF_EVENTS=y
  block.

- The initial part of arch/powerpc/platforms/pseries/papr_scm.c could be moved to a
  headerfile, will work on this in the follow up patchset.
---
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 4dd513d7c029..9dba9e71fde9 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -69,8 +69,6 @@
 #define PAPR_SCM_PERF_STATS_EYECATCHER __stringify(SCMSTATS)
 #define PAPR_SCM_PERF_STATS_VERSION 0x1
 
-#define to_nvdimm_pmu(_pmu)	container_of(_pmu, struct nvdimm_pmu, pmu)
-
 /* Struct holding a single performance metric */
 struct papr_scm_perf_stat {
 	u8 stat_id[8];
@@ -346,6 +344,9 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
 	return 0;
 }
 
+#ifdef CONFIG_PERF_EVENTS
+#define to_nvdimm_pmu(_pmu)	container_of(_pmu, struct nvdimm_pmu, pmu)
+
 static int papr_scm_pmu_get_value(struct perf_event *event, struct device *dev, u64 *count)
 {
 	struct papr_scm_perf_stat *stat;
@@ -558,6 +559,10 @@ static void papr_scm_pmu_register(struct papr_scm_priv *p)
 	dev_info(&p->pdev->dev, "nvdimm pmu didn't register rc=%d\n", rc);
 }
 
+#else
+static void papr_scm_pmu_register(struct papr_scm_priv *p) { }
+#endif
+
 /*
  * Issue hcall to retrieve dimm health info and populate papr_scm_priv with the
  * health information.
-- 
2.31.1

