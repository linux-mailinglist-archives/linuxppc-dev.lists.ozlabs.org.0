Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 393604C4793
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 15:33:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4sj02fhSz3cjn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Feb 2022 01:33:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k60z/rTK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=k60z/rTK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4sdx42Vmz3bNg
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Feb 2022 01:31:17 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21PE6p45033151; 
 Fri, 25 Feb 2022 14:31:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JemyLK2wfsbFAv7bCm2qTicnwBldrH9JePZ3G1+WTjI=;
 b=k60z/rTKEWe4Xx1RpZ0hU2RFfgHc6BaZWN433WwSbgm2JYPqDjqceFQ9bF3nnDBCs3tY
 aAwPPLj21k8PKY/LOKoOmQxqtnNHwa719lo75KZl9XLA6NYWqwhnBTGFfQNOXqFp9Kdv
 q1U0fW8iF71ROaRYvEYLtByGMcxLWuSmeWFDQVu3nvcaom8Yxb8r7JrB7iiduPnK9p5u
 N6Oj/OKuIlrhx4+jmVaOVEV0psOjYImzfFQ0Uuhii2bpWCdck6T78nwLfCPFBwZQrcPX
 Ff0UH2+pkQjHYORNvuXn3ghg0/7je0ua8jHp85w4zqCENkb2MBxiOPoFJGZye9ToUbV3 xg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eewpn5nj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 14:31:05 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21PESx0f023200;
 Fri, 25 Feb 2022 14:31:03 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3ear69sav2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 14:31:02 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 21PEUxkC47644996
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 14:30:59 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B58C4C046;
 Fri, 25 Feb 2022 14:30:59 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1FD884C044;
 Fri, 25 Feb 2022 14:30:55 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown
 [9.43.81.177]) by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 25 Feb 2022 14:30:54 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, peterz@infradead.org,
 dan.j.williams@intel.com, ira.weiny@intel.com, vishal.l.verma@intel.com
Subject: [PATCH v7 3/4] powerpc/papr_scm: Add perf interface support
Date: Fri, 25 Feb 2022 20:00:23 +0530
Message-Id: <20220225143024.47947-4-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220225143024.47947-1-kjain@linux.ibm.com>
References: <20220225143024.47947-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: euNWP3FD49ZrgByC2VteFK4vtG-GAi0B
X-Proofpoint-ORIG-GUID: euNWP3FD49ZrgByC2VteFK4vtG-GAi0B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_08,2022-02-25_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 clxscore=1015 mlxscore=0 adultscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202250084
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

Performance monitoring support for papr-scm nvdimm devices
via perf interface is added which includes addition of pmu
functions like add/del/read/event_init for nvdimm_pmu struture.

A new parameter 'priv' in added to the pdev_archdata structure to save
nvdimm_pmu device pointer, to handle the unregistering of pmu device.

papr_scm_pmu_register function populates the nvdimm_pmu structure
with name, capabilities, cpumask along with event handling
functions. Finally the populated nvdimm_pmu structure is passed to
register the pmu device. Event handling functions internally uses
hcall to get events and counter data.

Result in power9 machine with 2 nvdimm device:

Ex: List all event by perf list

command:# perf list nmem

  nmem0/cache_rh_cnt/                                [Kernel PMU event]
  nmem0/cache_wh_cnt/                                [Kernel PMU event]
  nmem0/cri_res_util/                                [Kernel PMU event]
  nmem0/ctl_res_cnt/                                 [Kernel PMU event]
  nmem0/ctl_res_tm/                                  [Kernel PMU event]
  nmem0/fast_w_cnt/                                  [Kernel PMU event]
  nmem0/host_l_cnt/                                  [Kernel PMU event]
  nmem0/host_l_dur/                                  [Kernel PMU event]
  nmem0/host_s_cnt/                                  [Kernel PMU event]
  nmem0/host_s_dur/                                  [Kernel PMU event]
  nmem0/med_r_cnt/                                   [Kernel PMU event]
  nmem0/med_r_dur/                                   [Kernel PMU event]
  nmem0/med_w_cnt/                                   [Kernel PMU event]
  nmem0/med_w_dur/                                   [Kernel PMU event]
  nmem0/mem_life/                                    [Kernel PMU event]
  nmem0/poweron_secs/                                [Kernel PMU event]
  ...
  nmem1/mem_life/                                    [Kernel PMU event]
  nmem1/poweron_secs/                                [Kernel PMU event]


Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
[Add numa_map_to_online_node function call to get online node id]
Reported-by: Nageswara R Sastry <rnsastry@linux.ibm.com>
---
Changelog:
Resend v6 -> v7
- Add function call to numa_map_to_online_node function inorder to
  get online numa node. As the node id returned by function dev_to_node
  can be offline in some scenarios and create issue in hotplug code.

- Add Acked-by, Tested-by and Reported-by tags from Peter Zijlstra
  and Nageswara R Sastry.

 arch/powerpc/include/asm/device.h         |   5 +
 arch/powerpc/platforms/pseries/papr_scm.c | 225 ++++++++++++++++++++++
 2 files changed, 230 insertions(+)

diff --git a/arch/powerpc/include/asm/device.h b/arch/powerpc/include/asm/device.h
index 219559d65864..47ed639f3b8f 100644
--- a/arch/powerpc/include/asm/device.h
+++ b/arch/powerpc/include/asm/device.h
@@ -48,6 +48,11 @@ struct dev_archdata {
 
 struct pdev_archdata {
 	u64 dma_mask;
+	/*
+	 * Pointer to nvdimm_pmu structure, to handle the unregistering
+	 * of pmu device
+	 */
+	void *priv;
 };
 
 #endif /* _ASM_POWERPC_DEVICE_H */
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index f48e87ac89c9..4dd513d7c029 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -19,6 +19,7 @@
 #include <asm/papr_pdsm.h>
 #include <asm/mce.h>
 #include <asm/unaligned.h>
+#include <linux/perf_event.h>
 
 #define BIND_ANY_ADDR (~0ul)
 
@@ -68,6 +69,8 @@
 #define PAPR_SCM_PERF_STATS_EYECATCHER __stringify(SCMSTATS)
 #define PAPR_SCM_PERF_STATS_VERSION 0x1
 
+#define to_nvdimm_pmu(_pmu)	container_of(_pmu, struct nvdimm_pmu, pmu)
+
 /* Struct holding a single performance metric */
 struct papr_scm_perf_stat {
 	u8 stat_id[8];
@@ -120,6 +123,9 @@ struct papr_scm_priv {
 
 	/* length of the stat buffer as expected by phyp */
 	size_t stat_buffer_len;
+
+	 /* array to have event_code and stat_id mappings */
+	char **nvdimm_events_map;
 };
 
 static int papr_scm_pmem_flush(struct nd_region *nd_region,
@@ -340,6 +346,218 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
 	return 0;
 }
 
+static int papr_scm_pmu_get_value(struct perf_event *event, struct device *dev, u64 *count)
+{
+	struct papr_scm_perf_stat *stat;
+	struct papr_scm_perf_stats *stats;
+	struct papr_scm_priv *p = (struct papr_scm_priv *)dev->driver_data;
+	int rc, size;
+
+	/* Allocate request buffer enough to hold single performance stat */
+	size = sizeof(struct papr_scm_perf_stats) +
+		sizeof(struct papr_scm_perf_stat);
+
+	if (!p || !p->nvdimm_events_map)
+		return -EINVAL;
+
+	stats = kzalloc(size, GFP_KERNEL);
+	if (!stats)
+		return -ENOMEM;
+
+	stat = &stats->scm_statistic[0];
+	memcpy(&stat->stat_id,
+	       p->nvdimm_events_map[event->attr.config],
+		sizeof(stat->stat_id));
+	stat->stat_val = 0;
+
+	rc = drc_pmem_query_stats(p, stats, 1);
+	if (rc < 0) {
+		kfree(stats);
+		return rc;
+	}
+
+	*count = be64_to_cpu(stat->stat_val);
+	kfree(stats);
+	return 0;
+}
+
+static int papr_scm_pmu_event_init(struct perf_event *event)
+{
+	struct nvdimm_pmu *nd_pmu = to_nvdimm_pmu(event->pmu);
+	struct papr_scm_priv *p;
+
+	if (!nd_pmu)
+		return -EINVAL;
+
+	/* test the event attr type for PMU enumeration */
+	if (event->attr.type != event->pmu->type)
+		return -ENOENT;
+
+	/* it does not support event sampling mode */
+	if (is_sampling_event(event))
+		return -EOPNOTSUPP;
+
+	/* no branch sampling */
+	if (has_branch_stack(event))
+		return -EOPNOTSUPP;
+
+	p = (struct papr_scm_priv *)nd_pmu->dev->driver_data;
+	if (!p)
+		return -EINVAL;
+
+	/* Invalid eventcode */
+	if (event->attr.config == 0 || event->attr.config > 16)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int papr_scm_pmu_add(struct perf_event *event, int flags)
+{
+	u64 count;
+	int rc;
+	struct nvdimm_pmu *nd_pmu = to_nvdimm_pmu(event->pmu);
+
+	if (!nd_pmu)
+		return -EINVAL;
+
+	if (flags & PERF_EF_START) {
+		rc = papr_scm_pmu_get_value(event, nd_pmu->dev, &count);
+		if (rc)
+			return rc;
+
+		local64_set(&event->hw.prev_count, count);
+	}
+
+	return 0;
+}
+
+static void papr_scm_pmu_read(struct perf_event *event)
+{
+	u64 prev, now;
+	int rc;
+	struct nvdimm_pmu *nd_pmu = to_nvdimm_pmu(event->pmu);
+
+	if (!nd_pmu)
+		return;
+
+	rc = papr_scm_pmu_get_value(event, nd_pmu->dev, &now);
+	if (rc)
+		return;
+
+	prev = local64_xchg(&event->hw.prev_count, now);
+	local64_add(now - prev, &event->count);
+}
+
+static void papr_scm_pmu_del(struct perf_event *event, int flags)
+{
+	papr_scm_pmu_read(event);
+}
+
+static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu *nd_pmu)
+{
+	struct papr_scm_perf_stat *stat;
+	struct papr_scm_perf_stats *stats;
+	char *statid;
+	int index, rc, count;
+	u32 available_events;
+
+	if (!p->stat_buffer_len)
+		return -ENOENT;
+
+	available_events = (p->stat_buffer_len  - sizeof(struct papr_scm_perf_stats))
+			/ sizeof(struct papr_scm_perf_stat);
+
+	/* Allocate the buffer for phyp where stats are written */
+	stats = kzalloc(p->stat_buffer_len, GFP_KERNEL);
+	if (!stats) {
+		rc = -ENOMEM;
+		return rc;
+	}
+
+	/* Allocate memory to nvdimm_event_map */
+	p->nvdimm_events_map = kcalloc(available_events, sizeof(char *), GFP_KERNEL);
+	if (!p->nvdimm_events_map) {
+		rc = -ENOMEM;
+		goto out_stats;
+	}
+
+	/* Called to get list of events supported */
+	rc = drc_pmem_query_stats(p, stats, 0);
+	if (rc)
+		goto out_nvdimm_events_map;
+
+	for (index = 0, stat = stats->scm_statistic, count = 0;
+		     index < available_events; index++, ++stat) {
+		statid = kzalloc(strlen(stat->stat_id) + 1, GFP_KERNEL);
+		if (!statid) {
+			rc = -ENOMEM;
+			goto out_nvdimm_events_map;
+		}
+
+		strcpy(statid, stat->stat_id);
+		p->nvdimm_events_map[count] = statid;
+		count++;
+	}
+	p->nvdimm_events_map[count] = NULL;
+	kfree(stats);
+	return 0;
+
+out_nvdimm_events_map:
+	kfree(p->nvdimm_events_map);
+out_stats:
+	kfree(stats);
+	return rc;
+}
+
+static void papr_scm_pmu_register(struct papr_scm_priv *p)
+{
+	struct nvdimm_pmu *nd_pmu;
+	int rc, nodeid;
+
+	nd_pmu = kzalloc(sizeof(*nd_pmu), GFP_KERNEL);
+	if (!nd_pmu) {
+		rc = -ENOMEM;
+		goto pmu_err_print;
+	}
+
+	rc = papr_scm_pmu_check_events(p, nd_pmu);
+	if (rc)
+		goto pmu_check_events_err;
+
+	nd_pmu->pmu.task_ctx_nr = perf_invalid_context;
+	nd_pmu->pmu.name = nvdimm_name(p->nvdimm);
+	nd_pmu->pmu.event_init = papr_scm_pmu_event_init;
+	nd_pmu->pmu.read = papr_scm_pmu_read;
+	nd_pmu->pmu.add = papr_scm_pmu_add;
+	nd_pmu->pmu.del = papr_scm_pmu_del;
+
+	nd_pmu->pmu.capabilities = PERF_PMU_CAP_NO_INTERRUPT |
+				PERF_PMU_CAP_NO_EXCLUDE;
+
+	/*updating the cpumask variable */
+	nodeid = numa_map_to_online_node(dev_to_node(&p->pdev->dev));
+	nd_pmu->arch_cpumask = *cpumask_of_node(nodeid);
+
+	rc = register_nvdimm_pmu(nd_pmu, p->pdev);
+	if (rc)
+		goto pmu_register_err;
+
+	/*
+	 * Set archdata.priv value to nvdimm_pmu structure, to handle the
+	 * unregistering of pmu device.
+	 */
+	p->pdev->archdata.priv = nd_pmu;
+	return;
+
+pmu_register_err:
+	kfree(p->nvdimm_events_map);
+pmu_check_events_err:
+	kfree(nd_pmu);
+pmu_err_print:
+	dev_info(&p->pdev->dev, "nvdimm pmu didn't register rc=%d\n", rc);
+}
+
 /*
  * Issue hcall to retrieve dimm health info and populate papr_scm_priv with the
  * health information.
@@ -1236,6 +1454,7 @@ static int papr_scm_probe(struct platform_device *pdev)
 		goto err2;
 
 	platform_set_drvdata(pdev, p);
+	papr_scm_pmu_register(p);
 
 	return 0;
 
@@ -1254,6 +1473,12 @@ static int papr_scm_remove(struct platform_device *pdev)
 
 	nvdimm_bus_unregister(p->bus);
 	drc_pmem_unbind(p);
+
+	if (pdev->archdata.priv)
+		unregister_nvdimm_pmu(pdev->archdata.priv);
+
+	pdev->archdata.priv = NULL;
+	kfree(p->nvdimm_events_map);
 	kfree(p->bus_desc.provider_name);
 	kfree(p);
 
-- 
2.31.1

