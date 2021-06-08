Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7895139F5E2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 14:00:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzphK2MfCz3c9k
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 22:00:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H/UAmOnM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=H/UAmOnM; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzpgD5JVrz3bw0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 21:59:04 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 158AfJ2c146051; Tue, 8 Jun 2021 07:58:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XCPWIlcuW+eZt6Pm/wLYShbfM7kukTOYYlv6qhGtj6Y=;
 b=H/UAmOnMLqIoOdA7qIOn1ZLfDf4hWj4u8vOnCo0yvufRRISQv7k7UEAeGRAqa6vB3yT4
 hpMZSjFmzEw3j2/mBp5K/qkVWIehh0r/Gzq1+niiRadXLZ6L+4BrOiGMu+JJp0VFti9Q
 AatUw3EFyMP9Al6FfqDkYlQZXRnAj22ToPkC2xX/MjQFqv68PDpwWJky5uD0XrUqlMaY
 ZcMtkrybgnOffBWwU1ckSPnSPxocsxTHwLWVVWAnGsX7xYP2OHxkD4Xw3p/yNK1mT1vN
 kQ7W7xfhs5tmzSG6dIIZF+YthxpBcvmhLMeX7oXRk2/SzErOSC60s7FOsPtySNWzvmzM SQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 392712stj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 07:58:41 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 158BvPB9004947;
 Tue, 8 Jun 2021 11:58:39 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03fra.de.ibm.com with ESMTP id 3900w8ru1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Jun 2021 11:58:39 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 158BwaEt30146852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Jun 2021 11:58:36 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 660584C044;
 Tue,  8 Jun 2021 11:58:36 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8D72B4C040;
 Tue,  8 Jun 2021 11:58:27 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.43.72])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  8 Jun 2021 11:58:27 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, nvdimm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, peterz@infradead.org
Subject: [PATCH 3/4] powerpc/papr_scm: Add perf interface support
Date: Tue,  8 Jun 2021 17:26:59 +0530
Message-Id: <20210608115700.85933-4-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210608115700.85933-1-kjain@linux.ibm.com>
References: <20210608115700.85933-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MsFPk-SXGkZKOt38m7Iu_FpX8g4KAW0w
X-Proofpoint-ORIG-GUID: MsFPk-SXGkZKOt38m7Iu_FpX8g4KAW0w
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-08_05:2021-06-04,
 2021-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106080051
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
Cc: santosh@fossix.org, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 aneesh.kumar@linux.ibm.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
 vaibhav@linux.ibm.com, dan.j.williams@intel.com, ira.weiny@intel.com,
 tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Performance monitoring support for papr-scm nvdimm devices
via perf interface is added which includes addition of pmu
functions like add/del/read/event_init for nvdimm_pmu struture.

A new parameter 'priv' in added to the pdev_archdata structure to save
nvdimm_pmu device pointer, to handle the unregistering of pmu device.

papr_scm_pmu_register function populates the nvdimm_pmu structure
with events, cpumask, attribute groups along with event handling
functions. Finally the populated nvdimm_pmu structure is passed to
register the pmu device.
Event handling functions internally uses hcall to get events and
counter data.

Result in power9 machine with 2 nvdimm device:

Ex: List all event by perf list

command:# perf list nmem

  nmem0/cchrhcnt/                                    [Kernel PMU event]
  nmem0/cchwhcnt/                                    [Kernel PMU event]
  nmem0/critrscu/                                    [Kernel PMU event]
  nmem0/ctlresct/                                    [Kernel PMU event]
  nmem0/ctlrestm/                                    [Kernel PMU event]
  nmem0/fastwcnt/                                    [Kernel PMU event]
  nmem0/hostlcnt/                                    [Kernel PMU event]
  nmem0/hostldur/                                    [Kernel PMU event]
  nmem0/hostscnt/                                    [Kernel PMU event]
  nmem0/hostsdur/                                    [Kernel PMU event]
  nmem0/medrcnt/                                     [Kernel PMU event]
  nmem0/medrdur/                                     [Kernel PMU event]
  nmem0/medwcnt/                                     [Kernel PMU event]
  nmem0/medwdur/                                     [Kernel PMU event]
  nmem0/memlife/                                     [Kernel PMU event]
  nmem0/noopstat/                                    [Kernel PMU event]
  nmem0/ponsecs/                                     [Kernel PMU event]
  nmem1/cchrhcnt/                                    [Kernel PMU event]
  nmem1/cchwhcnt/                                    [Kernel PMU event]
  nmem1/critrscu/                                    [Kernel PMU event]
  ...
  nmem1/noopstat/                                    [Kernel PMU event]
  nmem1/ponsecs/                                     [Kernel PMU event]

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/include/asm/device.h         |   5 +
 arch/powerpc/platforms/pseries/papr_scm.c | 365 ++++++++++++++++++++++
 2 files changed, 370 insertions(+)

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
index ef26fe40efb0..92632b4a4a60 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -18,6 +18,8 @@
 #include <asm/plpar_wrappers.h>
 #include <asm/papr_pdsm.h>
 #include <asm/mce.h>
+#include <linux/perf_event.h>
+#include <linux/ctype.h>
 
 #define BIND_ANY_ADDR (~0ul)
 
@@ -67,6 +69,8 @@
 #define PAPR_SCM_PERF_STATS_EYECATCHER __stringify(SCMSTATS)
 #define PAPR_SCM_PERF_STATS_VERSION 0x1
 
+#define to_nvdimm_pmu(_pmu)	container_of(_pmu, struct nvdimm_pmu, pmu)
+
 /* Struct holding a single performance metric */
 struct papr_scm_perf_stat {
 	u8 stat_id[8];
@@ -116,6 +120,12 @@ struct papr_scm_priv {
 
 	/* length of the stat buffer as expected by phyp */
 	size_t stat_buffer_len;
+
+	 /* array to have event_code and stat_id mappings */
+	char **nvdimm_events_map;
+
+	/* count of supported events */
+	u32 total_events;
 };
 
 static int papr_scm_pmem_flush(struct nd_region *nd_region,
@@ -329,6 +339,354 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
 	return 0;
 }
 
+PMU_FORMAT_ATTR(event, "config:0-4");
+
+static struct attribute *nvdimm_pmu_format_attr[] = {
+	&format_attr_event.attr,
+	NULL,
+};
+
+static struct attribute_group nvdimm_pmu_format_group = {
+	.name = "format",
+	.attrs = nvdimm_pmu_format_attr,
+};
+
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
+	       p->nvdimm_events_map[event->attr.config - 1],
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
+	if (event->attr.config == 0 || event->attr.config > p->total_events)
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
+static ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
+				  char *buf)
+{
+	struct perf_pmu_events_attr *d;
+
+	d = container_of(attr, struct perf_pmu_events_attr, attr);
+
+	return sysfs_emit(buf, "%s\n", (char *)d->event_str);
+}
+
+static char *strtolower(char *updated_name)
+{
+	int i = 0;
+
+	while (updated_name[i]) {
+		if (isupper(updated_name[i]))
+			updated_name[i] = tolower(updated_name[i]);
+		i++;
+	}
+	updated_name[i] = '\0';
+	return strim(updated_name);
+}
+
+/* device_str_attr_create : Populate event "name" and string "str" in attribute */
+static struct attribute *device_str_attr_create_(char *name, char *str)
+{
+	struct perf_pmu_events_attr *attr;
+
+	attr = kzalloc(sizeof(*attr), GFP_KERNEL);
+
+	if (!attr)
+		return NULL;
+
+	sysfs_attr_init(&attr->attr.attr);
+	attr->event_str = str;
+	attr->attr.attr.name = strtolower(name);
+	attr->attr.attr.mode = 0444;
+	attr->attr.show = device_show_string;
+
+	return &attr->attr.attr;
+}
+
+static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu *nd_pmu)
+{
+	struct papr_scm_perf_stat *stat;
+	struct papr_scm_perf_stats *stats, *single_stats;
+	int index, size, rc, count;
+	u32 available_events;
+	struct attribute **events;
+	char *eventcode, *eventname, *statid;
+	struct attribute_group *nvdimm_pmu_events_group;
+
+	if (!p->stat_buffer_len)
+		return -ENOENT;
+
+	available_events = (p->stat_buffer_len  - sizeof(struct papr_scm_perf_stats))
+			/ sizeof(struct papr_scm_perf_stat);
+
+	/* Allocate memory for events attribute group */
+	nvdimm_pmu_events_group = kzalloc(sizeof(*nvdimm_pmu_events_group), GFP_KERNEL);
+	if (!nvdimm_pmu_events_group)
+		return -ENOMEM;
+
+	/* Allocate the buffer for phyp where stats are written */
+	stats = kzalloc(p->stat_buffer_len, GFP_KERNEL);
+	if (!stats) {
+		rc = -ENOMEM;
+		goto out_nvdimm_pmu_events_group;
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
+	/* Allocate buffer to hold single performance stat */
+	size = sizeof(struct papr_scm_perf_stats) + sizeof(struct papr_scm_perf_stat);
+
+	single_stats = kzalloc(size, GFP_KERNEL);
+	if (!single_stats) {
+		rc = -ENOMEM;
+		goto out_nvdimm_events_map;
+	}
+
+	events = kzalloc(available_events * sizeof(struct attribute *), GFP_KERNEL);
+	if (!events) {
+		rc = -ENOMEM;
+		goto out_single_stats;
+	}
+
+	for (index = 0, stat = stats->scm_statistic, count = 0;
+		     index < available_events; index++, ++stat) {
+
+		single_stats->scm_statistic[0] = *stat;
+		rc = drc_pmem_query_stats(p, single_stats, 1);
+
+		if (rc < 0) {
+			pr_info("Event not supported %s for device %s\n",
+				stat->stat_id, nvdimm_name(p->nvdimm));
+		} else {
+			eventcode = kasprintf(GFP_KERNEL, "event=0x%x", count + 1);
+			eventname = kzalloc(strlen(stat->stat_id) + 1, GFP_KERNEL);
+			statid = kzalloc(strlen(stat->stat_id) + 1, GFP_KERNEL);
+
+			if (!eventname || !statid || !eventcode)
+				goto out;
+
+			strcpy(eventname, stat->stat_id);
+			events[count] = device_str_attr_create_(eventname,
+								eventcode);
+			if (!events[count])
+				goto out;
+
+			strcpy(statid, stat->stat_id);
+			p->nvdimm_events_map[count] = statid;
+			count++;
+			continue;
+out:
+			kfree(eventcode);
+			kfree(eventname);
+			kfree(statid);
+		}
+	}
+
+	if (!count)
+		goto out_events;
+
+	events[count] = NULL;
+	p->nvdimm_events_map[count] = NULL;
+	p->total_events = count;
+
+	nvdimm_pmu_events_group->name = "events";
+	nvdimm_pmu_events_group->attrs = events;
+
+	/* Fill attribute groups for the nvdimm pmu device */
+	nd_pmu->attr_groups[NVDIMM_PMU_FORMAT_ATTR] = &nvdimm_pmu_format_group;
+	nd_pmu->attr_groups[NVDIMM_PMU_EVENT_ATTR] = nvdimm_pmu_events_group;
+	nd_pmu->attr_groups[NVDIMM_PMU_NULL_ATTR] = NULL;
+
+	kfree(single_stats);
+	kfree(stats);
+	return 0;
+
+out_events:
+	kfree(events);
+out_single_stats:
+	kfree(single_stats);
+out_nvdimm_events_map:
+	kfree(p->nvdimm_events_map);
+out_stats:
+	kfree(stats);
+out_nvdimm_pmu_events_group:
+	kfree(nvdimm_pmu_events_group);
+	return rc;
+}
+
+/* Function to free the attr_groups which are dynamically allocated */
+static void papr_scm_pmu_mem_free(struct nvdimm_pmu *nd_pmu)
+{
+	if (nd_pmu) {
+		if (nd_pmu->attr_groups[NVDIMM_PMU_EVENT_ATTR])
+			kfree(nd_pmu->attr_groups[NVDIMM_PMU_EVENT_ATTR]->attrs);
+		kfree(nd_pmu->attr_groups[NVDIMM_PMU_EVENT_ATTR]);
+	}
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
+	nd_pmu->name = nvdimm_name(p->nvdimm);
+	nd_pmu->event_init = papr_scm_pmu_event_init;
+	nd_pmu->read = papr_scm_pmu_read;
+	nd_pmu->add = papr_scm_pmu_add;
+	nd_pmu->del = papr_scm_pmu_del;
+
+	/*updating the cpumask variable */
+	nodeid = dev_to_node(&p->pdev->dev);
+	nd_pmu->arch_cpumask = *cpumask_of_node(nodeid);
+
+	/* cpumask should not be NULL */
+	WARN_ON_ONCE(cpumask_empty(&nd_pmu->arch_cpumask));
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
+	papr_scm_pmu_mem_free(nd_pmu);
+	kfree(p->nvdimm_events_map);
+pmu_check_events_err:
+	kfree(nd_pmu);
+pmu_err_print:
+	dev_info(&p->pdev->dev, "nvdimm pmu didn't register rc=%d\n", rc);
+}
+
+static void papr_scm_pmu_uninit(struct nvdimm_pmu *nd_pmu)
+{
+	unregister_nvdimm_pmu(nd_pmu);
+	papr_scm_pmu_mem_free(nd_pmu);
+	kfree(nd_pmu);
+}
+
 /*
  * Issue hcall to retrieve dimm health info and populate papr_scm_priv with the
  * health information.
@@ -1177,6 +1535,7 @@ static int papr_scm_probe(struct platform_device *pdev)
 		goto err2;
 
 	platform_set_drvdata(pdev, p);
+	papr_scm_pmu_register(p);
 
 	return 0;
 
@@ -1195,6 +1554,12 @@ static int papr_scm_remove(struct platform_device *pdev)
 
 	nvdimm_bus_unregister(p->bus);
 	drc_pmem_unbind(p);
+
+	if (pdev->archdata.priv)
+		papr_scm_pmu_uninit(pdev->archdata.priv);
+
+	pdev->archdata.priv = NULL;
+	kfree(p->nvdimm_events_map);
 	kfree(p->bus_desc.provider_name);
 	kfree(p);
 
-- 
2.27.0

