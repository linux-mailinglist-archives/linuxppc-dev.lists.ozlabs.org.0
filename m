Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C226E4311D8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 10:07:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXqHF0vbhz3bnh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 19:07:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cBDJHXAF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=cBDJHXAF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXqGS4nkJz2xtj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 19:06:56 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19I6pUNI008104; 
 Mon, 18 Oct 2021 04:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=RVxlBGthsQnyzvTGvt55Kl4pdNXQgkdYTxFFy1exmXY=;
 b=cBDJHXAFt7u1k0/V5WJetoCrWj8YMcT2mpahN/Je7yqI39xLfz07MxwvHNTwUO15m6rA
 yp9zSK46Qwy4JR4EBBkNDoHUH6nfzD5cdZomZjVUfzci5bgqU9oP9oqBdyWXa/EIOv+E
 iRNXViLFjl7l4M8keGlkLVYhOU/X0t8FBlusCl06PQWro0zh8ZUziFGLcxVyIBOPHSPA
 m8EKqUVazHZgYHnCo6i/rQQFvtrg94E9MUTn48aZGTCuFPIhBcX6a/eBCpOnQbHOMxcn
 ok5goq3J8tz3T6cojxR+pY6RrtwVW+CBVOPiakC6n6kJb0L5++XjnIZeZYfBJ/rkQQ1v bQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3bs4199fmy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 04:06:41 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19I83msi017836;
 Mon, 18 Oct 2021 08:06:39 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3bqpc9bre6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Oct 2021 08:06:39 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19I86aFg7340590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Oct 2021 08:06:36 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8AF30A405B;
 Mon, 18 Oct 2021 08:06:36 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B8B9A4065;
 Mon, 18 Oct 2021 08:06:35 +0000 (GMT)
Received: from lep8c.aus.stglabs.ibm.com (unknown [9.40.192.207])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 18 Oct 2021 08:06:35 +0000 (GMT)
Subject: [REPOST PATCH v2] tests/nvdimm/ndtest: Simulate nvdimm health,
 DSC and smart-inject
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: nvdimm@lists.linux.dev
Date: Mon, 18 Oct 2021 03:06:34 -0500
Message-ID: <163454437514.431245.15482985237822269917.stgit@lep8c.aus.stglabs.ibm.com>
User-Agent: StGit/1.1+40.g1b20
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zRgaeeCAU-fYWYyCVyqCi4gidJVCnH-l
X-Proofpoint-ORIG-GUID: zRgaeeCAU-fYWYyCVyqCi4gidJVCnH-l
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-18_02,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110180050
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
Cc: sbhat@linux.ibm.com, aneesh.kumar@linux.ibm.com, vaibhav@linux.ibm.com,
 dan.j.williams@intel.com, linuxppc-dev@lists.ozlabs.org, ira.weiny@intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The 'papr_scm' module and 'papr' implementation in libndctl supports
PDSMs for reporting PAPR NVDIMM health, dirty-shutdown-count and
injecting smart-errors. This patch adds support for those PDSMs in
ndtest module so that PDSM specific paths in libndctl can be exercised.

Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
Changelog:
Since v1:
Link: https://patchwork.kernel.org/project/linux-nvdimm/list/?series=521767
* Removed the dependency on a header movement patch

 tools/testing/nvdimm/test/ndtest.c |  148 ++++++++++++++++++++++++++++++++++++
 tools/testing/nvdimm/test/ndtest.h |   96 +++++++++++++++++++++++
 2 files changed, 244 insertions(+)

diff --git a/tools/testing/nvdimm/test/ndtest.c b/tools/testing/nvdimm/test/ndtest.c
index 6862915f1fb0c..45d42cd25e82f 100644
--- a/tools/testing/nvdimm/test/ndtest.c
+++ b/tools/testing/nvdimm/test/ndtest.c
@@ -48,6 +48,10 @@ static struct ndtest_dimm dimm_group1[] = {
 		.uuid_str = "1e5c75d2-b618-11ea-9aa3-507b9ddc0f72",
 		.physical_id = 0,
 		.num_formats = 2,
+		.flags = PAPR_PMEM_HEALTH_NON_CRITICAL,
+		.extension_flags = PDSM_DIMM_DSC_VALID | PDSM_DIMM_HEALTH_RUN_GAUGE_VALID,
+		.dimm_fuel_gauge = 95,
+		.dimm_dsc = 42,
 	},
 	{
 		.size = DIMM_SIZE,
@@ -55,6 +59,10 @@ static struct ndtest_dimm dimm_group1[] = {
 		.uuid_str = "1c4d43ac-b618-11ea-be80-507b9ddc0f72",
 		.physical_id = 1,
 		.num_formats = 2,
+		.flags = PAPR_PMEM_HEALTH_NON_CRITICAL,
+		.extension_flags = PDSM_DIMM_DSC_VALID | PDSM_DIMM_HEALTH_RUN_GAUGE_VALID,
+		.dimm_fuel_gauge = 95,
+		.dimm_dsc = 42,
 	},
 	{
 		.size = DIMM_SIZE,
@@ -62,6 +70,10 @@ static struct ndtest_dimm dimm_group1[] = {
 		.uuid_str = "a9f17ffc-b618-11ea-b36d-507b9ddc0f72",
 		.physical_id = 2,
 		.num_formats = 2,
+		.flags = PAPR_PMEM_HEALTH_NON_CRITICAL,
+		.extension_flags = PDSM_DIMM_DSC_VALID | PDSM_DIMM_HEALTH_RUN_GAUGE_VALID,
+		.dimm_fuel_gauge = 95,
+		.dimm_dsc = 42,
 	},
 	{
 		.size = DIMM_SIZE,
@@ -69,6 +81,10 @@ static struct ndtest_dimm dimm_group1[] = {
 		.uuid_str = "b6b83b22-b618-11ea-8aae-507b9ddc0f72",
 		.physical_id = 3,
 		.num_formats = 2,
+		.flags = PAPR_PMEM_HEALTH_NON_CRITICAL,
+		.extension_flags = PDSM_DIMM_DSC_VALID | PDSM_DIMM_HEALTH_RUN_GAUGE_VALID,
+		.dimm_fuel_gauge = 95,
+		.dimm_dsc = 42,
 	},
 	{
 		.size = DIMM_SIZE,
@@ -296,6 +312,103 @@ static int ndtest_get_config_size(struct ndtest_dimm *dimm, unsigned int buf_len
 	return 0;
 }
 
+static int ndtest_pdsm_health(struct ndtest_dimm *dimm,
+			union nd_pdsm_payload *payload,
+			unsigned int buf_len)
+{
+	struct nd_papr_pdsm_health *health = &payload->health;
+
+	if (buf_len < sizeof(health))
+		return -EINVAL;
+
+	health->extension_flags = 0;
+	health->dimm_unarmed = !!(dimm->flags & PAPR_PMEM_UNARMED_MASK);
+	health->dimm_bad_shutdown = !!(dimm->flags & PAPR_PMEM_BAD_SHUTDOWN_MASK);
+	health->dimm_bad_restore = !!(dimm->flags & PAPR_PMEM_BAD_RESTORE_MASK);
+	health->dimm_health = PAPR_PDSM_DIMM_HEALTHY;
+
+	if (dimm->flags & PAPR_PMEM_HEALTH_FATAL)
+		health->dimm_health = PAPR_PDSM_DIMM_FATAL;
+	else if (dimm->flags & PAPR_PMEM_HEALTH_CRITICAL)
+		health->dimm_health = PAPR_PDSM_DIMM_CRITICAL;
+	else if (dimm->flags & PAPR_PMEM_HEALTH_UNHEALTHY ||
+		 dimm->flags & PAPR_PMEM_HEALTH_NON_CRITICAL)
+		health->dimm_health = PAPR_PDSM_DIMM_UNHEALTHY;
+
+	health->extension_flags = 0;
+	if (dimm->extension_flags & PDSM_DIMM_HEALTH_RUN_GAUGE_VALID) {
+		health->dimm_fuel_gauge = dimm->dimm_fuel_gauge;
+		health->extension_flags |= PDSM_DIMM_HEALTH_RUN_GAUGE_VALID;
+	}
+	if (dimm->extension_flags & PDSM_DIMM_DSC_VALID) {
+		health->dimm_dsc = dimm->dimm_dsc;
+		health->extension_flags |= PDSM_DIMM_DSC_VALID;
+	}
+
+	return 0;
+}
+
+static void smart_notify(struct ndtest_dimm *dimm)
+{
+	struct device *bus = dimm->dev->parent;
+
+	if (!(dimm->flags & PAPR_PMEM_HEALTH_NON_CRITICAL) ||
+	    (dimm->flags & PAPR_PMEM_BAD_SHUTDOWN_MASK)) {
+		device_lock(bus);
+		/* send smart notification */
+		if (dimm->notify_handle)
+			sysfs_notify_dirent(dimm->notify_handle);
+		device_unlock(bus);
+	}
+}
+
+static int ndtest_pdsm_smart_inject(struct ndtest_dimm *dimm,
+				union nd_pdsm_payload *payload,
+				unsigned int buf_len)
+{
+	struct nd_papr_pdsm_smart_inject *inj = &payload->smart_inject;
+
+	if (buf_len < sizeof(inj))
+		return -EINVAL;
+
+	if (inj->flags & PDSM_SMART_INJECT_HEALTH_FATAL) {
+		if (inj->fatal_enable)
+			dimm->flags |= PAPR_PMEM_HEALTH_FATAL;
+		else
+			dimm->flags &= ~PAPR_PMEM_HEALTH_FATAL;
+	}
+	if (inj->flags & PDSM_SMART_INJECT_BAD_SHUTDOWN) {
+		if (inj->unsafe_shutdown_enable)
+			dimm->flags |= PAPR_PMEM_SHUTDOWN_DIRTY;
+		else
+			dimm->flags &= ~PAPR_PMEM_SHUTDOWN_DIRTY;
+	}
+	smart_notify(dimm);
+
+	return 0;
+}
+
+static int ndtest_dimm_cmd_call(struct ndtest_dimm *dimm, unsigned int buf_len,
+			   void *buf)
+{
+	struct nd_cmd_pkg *call_pkg = buf;
+	unsigned int len = call_pkg->nd_size_in + call_pkg->nd_size_out;
+	struct nd_pkg_pdsm *pdsm = (struct nd_pkg_pdsm *) call_pkg->nd_payload;
+	union nd_pdsm_payload *payload = &(pdsm->payload);
+	unsigned int func = call_pkg->nd_command;
+
+	switch (func) {
+	case PAPR_PDSM_HEALTH:
+		return ndtest_pdsm_health(dimm, payload, len);
+	case PAPR_PDSM_SMART_INJECT:
+		return ndtest_pdsm_smart_inject(dimm, payload, len);
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int ndtest_ctl(struct nvdimm_bus_descriptor *nd_desc,
 		      struct nvdimm *nvdimm, unsigned int cmd, void *buf,
 		      unsigned int buf_len, int *cmd_rc)
@@ -325,6 +438,9 @@ static int ndtest_ctl(struct nvdimm_bus_descriptor *nd_desc,
 	case ND_CMD_SET_CONFIG_DATA:
 		*cmd_rc = ndtest_config_set(dimm, buf_len, buf);
 		break;
+	case ND_CMD_CALL:
+		*cmd_rc = ndtest_dimm_cmd_call(dimm, buf_len, buf);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -614,6 +730,8 @@ static void put_dimms(void *data)
 
 	for (i = 0; i < p->config->dimm_count; i++)
 		if (p->config->dimms[i].dev) {
+			if (p->config->dimms[i].notify_handle)
+				sysfs_put(p->config->dimms[i].notify_handle);
 			device_unregister(p->config->dimms[i].dev);
 			p->config->dimms[i].dev = NULL;
 		}
@@ -826,6 +944,18 @@ static ssize_t flags_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(flags);
 
+#define PAPR_PMEM_DIMM_CMD_MASK				\
+	 ((1U << PAPR_PDSM_HEALTH)			\
+	 | (1U << PAPR_PDSM_SMART_INJECT))
+
+static ssize_t dsm_mask_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%#x\n", PAPR_PMEM_DIMM_CMD_MASK);
+}
+
+static DEVICE_ATTR_RO(dsm_mask);
+
 static struct attribute *ndtest_nvdimm_attributes[] = {
 	&dev_attr_nvdimm_show_handle.attr,
 	&dev_attr_vendor.attr,
@@ -837,6 +967,7 @@ static struct attribute *ndtest_nvdimm_attributes[] = {
 	&dev_attr_format.attr,
 	&dev_attr_format1.attr,
 	&dev_attr_flags.attr,
+	&dev_attr_dsm_mask.attr,
 	NULL,
 };
 
@@ -856,6 +987,7 @@ static int ndtest_dimm_register(struct ndtest_priv *priv,
 {
 	struct device *dev = &priv->pdev.dev;
 	unsigned long dimm_flags = dimm->flags;
+	struct kernfs_node *papr_kernfs;
 
 	if (dimm->num_formats > 1) {
 		set_bit(NDD_ALIASING, &dimm_flags);
@@ -882,6 +1014,20 @@ static int ndtest_dimm_register(struct ndtest_priv *priv,
 		return -ENOMEM;
 	}
 
+	nd_synchronize();
+
+	papr_kernfs = sysfs_get_dirent(nvdimm_kobj(dimm->nvdimm)->sd, "papr");
+	if (!papr_kernfs) {
+		pr_err("Could not initialize the notifier handle\n");
+		return 0;
+	}
+
+	dimm->notify_handle = sysfs_get_dirent(papr_kernfs, "flags");
+	sysfs_put(papr_kernfs);
+	if (!dimm->notify_handle) {
+		pr_err("Could not initialize the notifier handle\n");
+		return 0;
+	}
 	return 0;
 }
 
@@ -953,6 +1099,8 @@ static int ndtest_bus_register(struct ndtest_priv *p)
 	p->bus_desc.provider_name = NULL;
 	p->bus_desc.attr_groups = ndtest_attribute_groups;
 
+	set_bit(NVDIMM_FAMILY_PAPR, &p->bus_desc.dimm_family_mask);
+
 	p->bus = nvdimm_bus_register(&p->pdev.dev, &p->bus_desc);
 	if (!p->bus) {
 		dev_err(&p->pdev.dev, "Error creating nvdimm bus %pOF\n", p->dn);
diff --git a/tools/testing/nvdimm/test/ndtest.h b/tools/testing/nvdimm/test/ndtest.h
index 2c54c9cbb90c7..b9b3810213132 100644
--- a/tools/testing/nvdimm/test/ndtest.h
+++ b/tools/testing/nvdimm/test/ndtest.h
@@ -16,6 +16,8 @@
 #define PAPR_PMEM_HEALTH_FATAL              (1ULL << (63 - 5))
 /* SCM contents cannot persist due to current platform health status */
 #define PAPR_PMEM_HEALTH_UNHEALTHY          (1ULL << (63 - 6))
+/* SCM device is unable to persist memory contents in certain conditions */
+#define PAPR_PMEM_HEALTH_NON_CRITICAL       (1ULL << (63 - 7))
 
 /* Bits status indicators for health bitmap indicating unarmed dimm */
 #define PAPR_PMEM_UNARMED_MASK (PAPR_PMEM_UNARMED |		\
@@ -80,6 +82,13 @@ struct ndtest_dimm {
 	int id;
 	int fail_cmd_code;
 	u8 no_alias;
+
+	struct kernfs_node *notify_handle;
+
+	/* SMART Health information */
+	u32 extension_flags;
+	u16 dimm_fuel_gauge;
+	u64 dimm_dsc;
 };
 
 struct ndtest_mapping {
@@ -98,6 +107,93 @@ struct ndtest_region {
 	u8 range_index;
 };
 
+#define ND_PDSM_PAYLOAD_MAX_SIZE 184
+/*
+ * Methods to be embedded in ND_CMD_CALL request. These are sent to the kernel
+ * via 'nd_cmd_pkg.nd_command' member of the ioctl struct
+ */
+enum papr_pdsm {
+	PAPR_PDSM_MIN = 0x0,
+	PAPR_PDSM_HEALTH,
+	PAPR_PDSM_SMART_INJECT,
+	PAPR_PDSM_MAX,
+};
+
+/* Various nvdimm health indicators */
+#define PAPR_PDSM_DIMM_HEALTHY       0
+#define PAPR_PDSM_DIMM_UNHEALTHY     1
+#define PAPR_PDSM_DIMM_CRITICAL      2
+#define PAPR_PDSM_DIMM_FATAL         3
+
+/* struct nd_papr_pdsm_health.extension_flags field flags */
+
+/* Indicate that the 'dimm_fuel_gauge' field is valid */
+#define PDSM_DIMM_HEALTH_RUN_GAUGE_VALID 1
+
+/* Indicate that the 'dimm_dsc' field is valid */
+#define PDSM_DIMM_DSC_VALID 2
+
+/*
+ * Struct exchanged between kernel & ndctl in for PAPR_PDSM_HEALTH
+ * Various flags indicate the health status of the dimm.
+ */
+struct nd_papr_pdsm_health {
+	union {
+		struct {
+			__u32 extension_flags;
+			__u8 dimm_unarmed;
+			__u8 dimm_bad_shutdown;
+			__u8 dimm_bad_restore;
+			__u8 dimm_scrubbed;
+			__u8 dimm_locked;
+			__u8 dimm_encrypted;
+			__u16 dimm_health;
+
+			/* Extension flag PDSM_DIMM_HEALTH_RUN_GAUGE_VALID */
+			__u16 dimm_fuel_gauge;
+
+			/* Extension flag PDSM_DIMM_DSC_VALID */
+			__u64 dimm_dsc;
+		};
+		__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
+	};
+};
+
+/* Flags for injecting specific smart errors */
+#define PDSM_SMART_INJECT_HEALTH_FATAL		(1 << 0)
+#define PDSM_SMART_INJECT_BAD_SHUTDOWN		(1 << 1)
+
+struct nd_papr_pdsm_smart_inject {
+	union {
+		struct {
+			/* One or more of PDSM_SMART_INJECT_ */
+			__u32 flags;
+			__u8 fatal_enable;
+			__u8 unsafe_shutdown_enable;
+		};
+		__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
+	};
+};
+
+/* Maximal union that can hold all possible payload types */
+union nd_pdsm_payload {
+	struct nd_papr_pdsm_health health;
+	struct nd_papr_pdsm_smart_inject smart_inject;
+	__u8 buf[ND_PDSM_PAYLOAD_MAX_SIZE];
+} __packed;
+
+/*
+ * PDSM-header + payload expected with ND_CMD_CALL ioctl from libnvdimm
+ * Valid member of union 'payload' is identified via 'nd_cmd_pkg.nd_command'
+ * that should always precede this struct when sent to papr_scm via CMD_CALL
+ * interface.
+ */
+struct nd_pkg_pdsm {
+	__s32 cmd_status;	/* Out: Sub-cmd status returned back */
+	__u16 reserved[2];	/* Ignored and to be set as '0' */
+	union nd_pdsm_payload payload;
+} __packed;
+
 struct ndtest_config {
 	struct ndtest_dimm *dimms;
 	struct ndtest_region *regions;


