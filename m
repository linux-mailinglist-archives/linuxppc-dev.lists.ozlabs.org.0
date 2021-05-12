Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8742237C824
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 18:40:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgLBY47L9z3c1G
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 02:40:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nZfkJPas;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nZfkJPas; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgL9101nqz2yY8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 02:39:16 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14CGY5Ba135620; Wed, 12 May 2021 12:38:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=T+KhFfnvFVroFE95hsoWAUBOhZqzvLnqblYgTmEb6YI=;
 b=nZfkJPaslevI4l4Cuhdnu6XK+7AQfjrNhlRaqzhJo2sChyRMdvvvI0v5jQLPkmbm+C9M
 DYZ8xqX6pksE1IUlO6magid+D5M5j+P6xScNBPUhNkA1ZOGZOB0K7ENSwO0QlqjACS5w
 ZCcRZuBAfW/bTA0//PqHJUL0MKBcr/0+xEhVSohQ8ToqT06QvYCZur3P0FnB63UdGR/O
 VGif1FDphkRwZ8DGh6u/86SZcnQk2b1WPRbbqEOEIEKHVLeSeFiju+o1nUxUAQxJ0LfM
 fxQ218fRaNEGCRcCL+89uVT4yXbHBJvkwlRCOzYSba83ctYKLi5jgL3UluCbweTaEn+/ XQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38ghs4ssra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 May 2021 12:38:56 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14CGX4iW002332;
 Wed, 12 May 2021 16:38:55 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 38dj98aa9b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 May 2021 16:38:55 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14CGcqfn29163886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 May 2021 16:38:52 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D671AE0F6;
 Wed, 12 May 2021 16:38:52 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A87AAAE0F8;
 Wed, 12 May 2021 16:38:48 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.40.5])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 May 2021 16:38:48 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org, linux-kernel@vger.kernel.org
Subject: [RFC 2/4] powerpc/papr_scm: Add perf interface support
Date: Wed, 12 May 2021 22:08:22 +0530
Message-Id: <20210512163824.255370-3-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210512163824.255370-1-kjain@linux.ibm.com>
References: <20210512163824.255370-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: c1fph7JagbjyZzNEDv0fTuY2Sgja4_0w
X-Proofpoint-ORIG-GUID: c1fph7JagbjyZzNEDv0fTuY2Sgja4_0w
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-12_07:2021-05-12,
 2021-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105120105
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
Cc: santosh@fossix.org, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 aneesh.kumar@linux.ibm.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
 vaibhav@linux.ibm.com, dan.j.williams@intel.com, ira.weiny@intel.com,
 tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch adds support for performance monitoring of papr
nvdimm devices via perf interface. It adds callbacks functions
like add/del/read/event_init for nvdimm_pmu structure.

Patch adds a new parameter 'priv' in pdev_archdata structure to save
nvdimm_pmu device pointer, to handle the unregistering of pmu device.

papr_scm_pmu_register function populates the nvdimm_pmu structure
with events, attribute groups along with event handling functions.
Event handling functions internally uses hcall to get events and
counter data. Finally the populated nvdimm_pmu structure is passed
to register the pmu device.

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
 arch/powerpc/platforms/pseries/papr_scm.c | 284 +++++++++++++++++++++-
 2 files changed, 288 insertions(+), 1 deletion(-)

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
index ef26fe40efb0..997d379094d0 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -18,6 +18,8 @@
 #include <asm/plpar_wrappers.h>
 #include <asm/papr_pdsm.h>
 #include <asm/mce.h>
+#include <linux/perf_event.h>
+#include <linux/ctype.h>
 
 #define BIND_ANY_ADDR (~0ul)
 
@@ -116,6 +118,9 @@ struct papr_scm_priv {
 
 	/* length of the stat buffer as expected by phyp */
 	size_t stat_buffer_len;
+
+	 /* array to have event_code and stat_id mappings */
+	char **nvdimm_events_map;
 };
 
 static int papr_scm_pmem_flush(struct nd_region *nd_region,
@@ -329,6 +334,271 @@ static ssize_t drc_pmem_query_stats(struct papr_scm_priv *p,
 	return 0;
 }
 
+static struct attribute_group nvdimm_pmu_events_group = {
+	.name = "events",
+	/* .attrs is set in papr_scm_pmu_check_events function */
+};
+
+PMU_FORMAT_ATTR(event, "config:0-37");
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
+static const struct attribute_group *nvdimm_pmu_attr_groups[] = {
+	&nvdimm_pmu_format_group,
+	&nvdimm_pmu_events_group,
+	NULL,
+};
+
+static void papr_scm_pmu_get_value(struct perf_event *event, struct device *dev, u64 *count)
+{
+	struct papr_scm_perf_stat *stat;
+	struct papr_scm_perf_stats *stats;
+	struct papr_scm_priv *p = (struct papr_scm_priv *)dev->driver_data;
+	int rc, size;
+	u64 statval;
+
+	/* Allocate buffer to hold single performance stat */
+	size = sizeof(struct papr_scm_perf_stats) +
+		sizeof(struct papr_scm_perf_stat);
+
+	if (!p->nvdimm_events_map)
+		return;
+
+	stats = kzalloc(size, GFP_KERNEL);
+	if (!stats)
+		return;
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
+		return;
+	}
+
+	statval = be64_to_cpu(stat->stat_val);
+	*count = statval;
+	kfree(stats);
+}
+
+static int papr_scm_pmu_add(struct perf_event *event, int flags,  struct device *dev)
+{
+	u64 count = 0;
+
+	papr_scm_pmu_get_value(event, dev, &count);
+	local64_set(&event->hw.prev_count, count);
+	return 0;
+}
+
+static void papr_scm_pmu_read(struct perf_event *event, struct device *dev)
+{
+	u64 prev, now = 0;
+
+	papr_scm_pmu_get_value(event, dev, &now);
+	prev = local64_xchg(&event->hw.prev_count, now);
+
+	if (now - prev >= 0)
+		local64_add(now - prev, &event->count);
+}
+
+static void papr_scm_pmu_del(struct perf_event *event, int flags,  struct device *dev)
+{
+	papr_scm_pmu_read(event, dev);
+}
+
+static void nvdimm_pmu_uinit(struct nvdimm_pmu *nd_pmu)
+{
+	unregister_nvdimm_pmu(&nd_pmu->pmu);
+	kfree(nd_pmu);
+}
+
+static int papr_scm_pmu_register(struct papr_scm_priv *p)
+{
+	struct nvdimm_pmu *papr_scm_pmu;
+	int rc;
+
+	papr_scm_pmu = devm_kzalloc(&p->pdev->dev, sizeof(*papr_scm_pmu), GFP_KERNEL);
+	if (!papr_scm_pmu)
+		return -ENOMEM;
+
+	papr_scm_pmu->name = nvdimm_name(p->nvdimm);
+	papr_scm_pmu->read = papr_scm_pmu_read;
+	papr_scm_pmu->add = papr_scm_pmu_add;
+	papr_scm_pmu->del = papr_scm_pmu_del;
+	papr_scm_pmu->attr_groups = nvdimm_pmu_attr_groups;
+
+	rc = register_nvdimm_pmu(papr_scm_pmu, p->pdev);
+	if (rc)
+		goto pmu_register_err;
+
+	/*
+	 * Set archdata.priv value to nvdimm_pmu structure, to handle the
+	 * unregistering of pmu device.
+	 */
+	p->pdev->archdata.priv = papr_scm_pmu;
+	return 0;
+
+pmu_register_err:
+	kfree(papr_scm_pmu);
+	return rc;
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
+static int papr_scm_pmu_check_events(struct papr_scm_priv *p)
+{
+	struct papr_scm_perf_stat *stat;
+	struct papr_scm_perf_stats *stats, *single_stats;
+	int index, size, rc, attrs;
+	u32 total_events;
+	struct attribute **events;
+	char *eventcode, *eventname, *statid;
+
+	if (!p->stat_buffer_len)
+		return -ENOENT;
+
+	total_events = (p->stat_buffer_len  - sizeof(struct papr_scm_perf_stats))
+			/ sizeof(struct papr_scm_perf_stat);
+
+	/* Allocate the buffer for phyp where stats are written */
+	stats = kzalloc(p->stat_buffer_len, GFP_KERNEL);
+	if (!stats)
+		return -ENOMEM;
+
+	/* Allocate memory to nvdimm_event_map */
+	p->nvdimm_events_map = kcalloc(total_events, sizeof(char *), GFP_KERNEL);
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
+	events = kzalloc(total_events * sizeof(struct attribute *), GFP_KERNEL);
+	if (!events) {
+		rc = -ENOMEM;
+		goto out_single_stats;
+	}
+
+	for (index = 0, stat = stats->scm_statistic, attrs = 0;
+		     index < total_events; index++, ++stat) {
+
+		single_stats->scm_statistic[0] = *stat;
+		rc = drc_pmem_query_stats(p, single_stats, 1);
+
+		if (rc < 0) {
+			pr_info("Event not supported %s for device %s\n",
+				stat->stat_id, nvdimm_name(p->nvdimm));
+		} else {
+			eventcode = kasprintf(GFP_KERNEL, "event=0x%x", attrs + 1);
+			eventname = kzalloc(strlen(stat->stat_id) + 1, GFP_KERNEL);
+			statid = kzalloc(strlen(stat->stat_id) + 1, GFP_KERNEL);
+
+			if (!eventname || !statid || !eventcode)
+				goto out;
+
+			strcpy(eventname, stat->stat_id);
+			events[attrs] = device_str_attr_create_(eventname,
+								eventcode);
+			if (!events[attrs])
+				goto out;
+
+			strcpy(statid, stat->stat_id);
+			p->nvdimm_events_map[attrs] = statid;
+			attrs++;
+			continue;
+out:
+			kfree(eventcode);
+			kfree(eventname);
+			kfree(statid);
+		}
+	}
+	events[attrs] = NULL;
+	p->nvdimm_events_map[attrs] = NULL;
+
+	if (!attrs)
+		goto out_events;
+
+	nvdimm_pmu_events_group.attrs = events;
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
+	return rc;
+}
+
 /*
  * Issue hcall to retrieve dimm health info and populate papr_scm_priv with the
  * health information.
@@ -923,7 +1193,7 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 	struct nd_mapping_desc mapping;
 	struct nd_region_desc ndr_desc;
 	unsigned long dimm_flags;
-	int target_nid, online_nid;
+	int target_nid, online_nid, rc;
 	ssize_t stat_size;
 
 	p->bus_desc.ndctl = papr_scm_ndctl;
@@ -1015,6 +1285,15 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
 		p->stat_buffer_len = stat_size;
 		dev_dbg(&p->pdev->dev, "Max perf-stat size %lu-bytes\n",
 			p->stat_buffer_len);
+
+		rc = papr_scm_pmu_check_events(p);
+		if (rc) {
+			dev_info(&p->pdev->dev, "nvdimm pmu check events failed, rc=%d\n", rc);
+		} else {
+			rc = papr_scm_pmu_register(p);
+			if (rc)
+				dev_info(&p->pdev->dev, "nvdimm pmu didn't register rc=%d\n", rc);
+		}
 	} else {
 		dev_info(&p->pdev->dev, "Dimm performance stats unavailable\n");
 	}
@@ -1195,7 +1474,10 @@ static int papr_scm_remove(struct platform_device *pdev)
 
 	nvdimm_bus_unregister(p->bus);
 	drc_pmem_unbind(p);
+	nvdimm_pmu_uinit(pdev->archdata.priv);
+	pdev->archdata.priv = NULL;
 	kfree(p->bus_desc.provider_name);
+	kfree(p->nvdimm_events_map);
 	kfree(p);
 
 	return 0;
-- 
2.27.0

