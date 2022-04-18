Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF83504E15
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 11:00:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KhgrK4M5Mz3bXD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Apr 2022 19:00:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=X+dc62My;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbhat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=X+dc62My; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Khgqf0kgkz2xSN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Apr 2022 18:59:57 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23I8aJha026680; 
 Mon, 18 Apr 2022 08:59:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=52CwmVijshxv1LdNsgXLaoCdAvAXSvAqZmScIf8Wpn4=;
 b=X+dc62MyLm6Zyp9A436tn9cJGWF5wDis1KGeDPDUOew/Gy1AVeSu99me8XKRoXay8uPF
 aB7I++mBM93tzpLOG5u8JEmCfaSE99rtkMMlBAzAYQDQRR34VC59jeG+hpovPJjZKK8K
 pE9r3GPBfmhN88FvhpumOOMe9FZF4U1W+WuB5vzkSOQeLNpQ/PP6aZdhktEhP/vhxNpZ
 pY7vSD6DMp4tJiiSuqYk+h7cso+cOULTQNyswmkVz3s+hXDSTysJWvseGbRIFiu1Ld8H
 qmuAy/KHwGBaCkVIOnTZHmFZIGW8kGd5E1oG0rpnZZZtPCTteDH6AHfMccZ4D1LQMbmA 3Q== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ffpdxdkg2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 08:59:45 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23I8wnM4008703;
 Mon, 18 Apr 2022 08:59:43 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 3ffne8t03h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 Apr 2022 08:59:43 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23I8xe4W27066850
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 Apr 2022 08:59:40 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0389C5204F;
 Mon, 18 Apr 2022 08:59:40 +0000 (GMT)
Received: from lep8c.aus.stglabs.ibm.com (unknown [9.40.192.207])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D4BE05204E;
 Mon, 18 Apr 2022 08:59:38 +0000 (GMT)
Subject: [PATCH v3] tests/nvdimm/ndtest: Simulate nvdimm health,
 DSC and smart-inject
From: Shivaprasad G Bhat <sbhat@linux.ibm.com>
To: nvdimm@lists.linux.dev
Date: Mon, 18 Apr 2022 03:59:38 -0500
Message-ID: <165027233876.3035289.4353747702027907365.stgit@lep8c.aus.stglabs.ibm.com>
User-Agent: StGit/1.1+40.g1b20
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: LGBvn_YfmMP9kq9rvHRS4VfuY6mQCcTw
X-Proofpoint-GUID: LGBvn_YfmMP9kq9rvHRS4VfuY6mQCcTw
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-18_02,2022-04-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0
 mlxlogscore=741 malwarescore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204180051
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
Cc: sbhat@linux.ibm.com, ira.weiny@intel.com, aneesh.kumar@linux.ibm.com,
 vaibhav@linux.ibm.com, dan.j.williams@intel.com, linuxppc-dev@lists.ozlabs.org
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
Since v2:
Link: https://patchwork.kernel.org/project/linux-nvdimm/patch/163454437514.431245.15482985237822269917.stgit@lep8c.aus.stglabs.ibm.com/
* Made it like v1 which had the patches based on the moved header files.
  So, this patch depends on the patch moving the header files posted at -
  https://patchwork.kernel.org/project/linux-nvdimm/patch/165025666388.2927278.9540058958498766114.stgit@lep8c.aus.stglabs.ibm.com/

Since v1:
Link: https://patchwork.kernel.org/project/linux-nvdimm/list/?series=521767
* Removed the dependency on a header movement patch
 tools/testing/nvdimm/test/ndtest.c |  146 ++++++++++++++++++++++++++++++++++++
 tools/testing/nvdimm/test/ndtest.h |    7 ++
 2 files changed, 153 insertions(+)

diff --git a/tools/testing/nvdimm/test/ndtest.c b/tools/testing/nvdimm/test/ndtest.c
index 5eb946a02c95..b07cbdd1952d 100644
--- a/tools/testing/nvdimm/test/ndtest.c
+++ b/tools/testing/nvdimm/test/ndtest.c
@@ -50,6 +50,10 @@ static struct ndtest_dimm dimm_group1[] = {
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
@@ -57,6 +61,10 @@ static struct ndtest_dimm dimm_group1[] = {
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
@@ -64,6 +72,10 @@ static struct ndtest_dimm dimm_group1[] = {
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
@@ -71,6 +83,10 @@ static struct ndtest_dimm dimm_group1[] = {
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
@@ -237,6 +253,103 @@ static int ndtest_get_config_size(struct ndtest_dimm *dimm, unsigned int buf_len
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
@@ -266,6 +379,9 @@ static int ndtest_ctl(struct nvdimm_bus_descriptor *nd_desc,
 	case ND_CMD_SET_CONFIG_DATA:
 		*cmd_rc = ndtest_config_set(dimm, buf_len, buf);
 		break;
+	case ND_CMD_CALL:
+		*cmd_rc = ndtest_dimm_cmd_call(dimm, buf_len, buf);
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -482,6 +598,8 @@ static void put_dimms(void *data)
 
 	for (i = 0; i < p->config->dimm_count; i++)
 		if (p->config->dimms[i].dev) {
+			if (p->config->dimms[i].notify_handle)
+				sysfs_put(p->config->dimms[i].notify_handle);
 			device_unregister(p->config->dimms[i].dev);
 			p->config->dimms[i].dev = NULL;
 		}
@@ -694,6 +812,16 @@ static ssize_t flags_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(flags);
 
+#define PAPR_PMEM_DIMM_CMD_MASK	 ((1U << PAPR_PDSM_HEALTH) | (1U << PAPR_PDSM_SMART_INJECT))
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
@@ -705,6 +833,7 @@ static struct attribute *ndtest_nvdimm_attributes[] = {
 	&dev_attr_format.attr,
 	&dev_attr_format1.attr,
 	&dev_attr_flags.attr,
+	&dev_attr_dsm_mask.attr,
 	NULL,
 };
 
@@ -724,6 +853,7 @@ static int ndtest_dimm_register(struct ndtest_priv *priv,
 {
 	struct device *dev = &priv->pdev.dev;
 	unsigned long dimm_flags = dimm->flags;
+	struct kernfs_node *papr_kernfs;
 
 	if (dimm->num_formats > 1)
 		set_bit(NDD_LABELING, &dimm_flags);
@@ -748,6 +878,20 @@ static int ndtest_dimm_register(struct ndtest_priv *priv,
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
 
@@ -819,6 +963,8 @@ static int ndtest_bus_register(struct ndtest_priv *p)
 	p->bus_desc.provider_name = NULL;
 	p->bus_desc.attr_groups = ndtest_attribute_groups;
 
+	set_bit(NVDIMM_FAMILY_PAPR, &p->bus_desc.dimm_family_mask);
+
 	p->bus = nvdimm_bus_register(&p->pdev.dev, &p->bus_desc);
 	if (!p->bus) {
 		dev_err(&p->pdev.dev, "Error creating nvdimm bus %pOF\n", p->dn);
diff --git a/tools/testing/nvdimm/test/ndtest.h b/tools/testing/nvdimm/test/ndtest.h
index 8f27ad6f7319..e18b3b006fa2 100644
--- a/tools/testing/nvdimm/test/ndtest.h
+++ b/tools/testing/nvdimm/test/ndtest.h
@@ -49,6 +49,13 @@ struct ndtest_dimm {
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


