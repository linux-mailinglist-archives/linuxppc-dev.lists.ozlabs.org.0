Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1374D0BD5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 00:15:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KCDns5rDzz30gg
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 10:15:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HVS+jnp0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=HVS+jnp0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KCDn65cw1z30FC
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 10:14:33 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227MGY87006304
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Mar 2022 23:14:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=5hOY5sA3bLjhTPXzS3MbE7/se/y/+iuEbozy5XT2aJk=;
 b=HVS+jnp0Usn0aDgnkYzotDeFg/346uJM0599hSHNRMgQvBLvR5IfmuLzJUFtnGoDCkEb
 afg/oQbv8bHOcF53j5bvY4cKD7+5zKb5jTfMjyzyryAK4CwITM+8JDVTV4b734Opj6tu
 LNKs66SG9PIE5sen76ixRZQqah5pk5g/HXYSPN/6SFFp+CjB7EaM4mrfORQcyiskqeRe
 lZdbycqDp+7hITMZ1MA1u8VeipY2gCzYV3VNmT5m31X8kYDi5DumqFXMq4g8o1QXPYma
 zHPQrp2Wan52s3SII4a6Hmx061FAxdj8l86O6azl2pz07fv4e3NsXhxZpZpnAN09s+Ne hw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3engn5pjsh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Mar 2022 23:14:31 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 227Mw7OP027431
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 7 Mar 2022 23:14:28 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 3enpk2rcy0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Mar 2022 23:14:28 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 227NEPbB54985018
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Mar 2022 23:14:25 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3E8011C04C;
 Mon,  7 Mar 2022 23:14:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E38C11C04A;
 Mon,  7 Mar 2022 23:14:23 +0000 (GMT)
Received: from rml-thinkpad.ibmuc.com (unknown [9.84.170.250])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  7 Mar 2022 23:14:23 +0000 (GMT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3] powerpc: declare unmodified attribute_group usages const
Date: Tue,  8 Mar 2022 10:14:14 +1100
Message-Id: <20220307231414.86560-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: yaE4LSf5_n1th5oeJB4V6Jhk7dwzBM2h
X-Proofpoint-GUID: yaE4LSf5_n1th5oeJB4V6Jhk7dwzBM2h
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-07_12,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 mlxlogscore=973 adultscore=0 mlxscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070118
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
Cc: Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Inspired by (bd75b4ef4977: Constify static attribute_group structs),
accepted by linux-next, reported:
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220210202805.7750-4-rikard.falkeborn@gmail.com/

Nearly all singletons of type struct attribute_group are never
modified, and so
are candidates for being const. Declare them as const.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/powerpc/include/asm/spu.h              | 4 ++--
 arch/powerpc/perf/generic-compat-pmu.c      | 4 ++--
 arch/powerpc/perf/hv-24x7.c                 | 6 +++---
 arch/powerpc/perf/hv-gpci.c                 | 8 ++++----
 arch/powerpc/perf/imc-pmu.c                 | 6 +++---
 arch/powerpc/perf/isa207-common.c           | 2 +-
 arch/powerpc/perf/power10-pmu.c             | 6 +++---
 arch/powerpc/perf/power7-pmu.c              | 4 ++--
 arch/powerpc/perf/power8-pmu.c              | 4 ++--
 arch/powerpc/perf/power9-pmu.c              | 6 +++---
 arch/powerpc/platforms/cell/cbe_thermal.c   | 2 +-
 arch/powerpc/platforms/cell/spu_base.c      | 4 ++--
 arch/powerpc/platforms/powernv/opal-core.c  | 2 +-
 arch/powerpc/platforms/powernv/opal-dump.c  | 2 +-
 arch/powerpc/platforms/powernv/opal-flash.c | 2 +-
 arch/powerpc/platforms/pseries/papr_scm.c   | 2 +-
 arch/powerpc/platforms/pseries/power.c      | 2 +-
 17 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/include/asm/spu.h b/arch/powerpc/include/asm/spu.h
index 8a2d11ba0dae..96ad4510c895 100644
--- a/arch/powerpc/include/asm/spu.h
+++ b/arch/powerpc/include/asm/spu.h
@@ -249,8 +249,8 @@ void unregister_spu_syscalls(struct spufs_calls *calls);
 int spu_add_dev_attr(struct device_attribute *attr);
 void spu_remove_dev_attr(struct device_attribute *attr);
 
-int spu_add_dev_attr_group(struct attribute_group *attrs);
-void spu_remove_dev_attr_group(struct attribute_group *attrs);
+int spu_add_dev_attr_group(const struct attribute_group *attrs);
+void spu_remove_dev_attr_group(const struct attribute_group *attrs);
 
 extern void notify_spus_active(void);
 extern void do_notify_spus_active(void);
diff --git a/arch/powerpc/perf/generic-compat-pmu.c b/arch/powerpc/perf/generic-compat-pmu.c
index b6e25f75109d..f3db88aee4dd 100644
--- a/arch/powerpc/perf/generic-compat-pmu.c
+++ b/arch/powerpc/perf/generic-compat-pmu.c
@@ -130,7 +130,7 @@ static struct attribute *generic_compat_events_attr[] = {
 	NULL
 };
 
-static struct attribute_group generic_compat_pmu_events_group = {
+static const struct attribute_group generic_compat_pmu_events_group = {
 	.name = "events",
 	.attrs = generic_compat_events_attr,
 };
@@ -146,7 +146,7 @@ static struct attribute *generic_compat_pmu_format_attr[] = {
 	NULL,
 };
 
-static struct attribute_group generic_compat_pmu_format_group = {
+static const struct attribute_group generic_compat_pmu_format_group = {
 	.name = "format",
 	.attrs = generic_compat_pmu_format_attr,
 };
diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index 1e8aa934e37e..12c1777187fc 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -204,7 +204,7 @@ static struct attribute *format_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group format_group = {
+static const struct attribute_group format_group = {
 	.name = "format",
 	.attrs = format_attrs,
 };
@@ -1148,7 +1148,7 @@ static struct attribute *cpumask_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group cpumask_attr_group = {
+static const struct attribute_group cpumask_attr_group = {
 	.attrs = cpumask_attrs,
 };
 
@@ -1162,7 +1162,7 @@ static struct attribute *if_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group if_group = {
+static const struct attribute_group if_group = {
 	.name = "interface",
 	.bin_attrs = if_bin_attrs,
 	.attrs = if_attrs,
diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
index c756228a081f..5eb60ed5b5e8 100644
--- a/arch/powerpc/perf/hv-gpci.c
+++ b/arch/powerpc/perf/hv-gpci.c
@@ -65,12 +65,12 @@ static struct attribute *format_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group format_group = {
+static const struct attribute_group format_group = {
 	.name = "format",
 	.attrs = format_attrs,
 };
 
-static struct attribute_group event_group = {
+static const struct attribute_group event_group = {
 	.name  = "events",
 	.attrs = hv_gpci_event_attrs,
 };
@@ -126,11 +126,11 @@ static struct attribute *cpumask_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group cpumask_attr_group = {
+static const struct attribute_group cpumask_attr_group = {
 	.attrs = cpumask_attrs,
 };
 
-static struct attribute_group interface_group = {
+static const struct attribute_group interface_group = {
 	.name = "interface",
 	.attrs = interface_attrs,
 };
diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index e7583fbcc8fa..526d4b767534 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -71,7 +71,7 @@ static struct attribute *imc_format_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group imc_format_group = {
+static const struct attribute_group imc_format_group = {
 	.name = "format",
 	.attrs = imc_format_attrs,
 };
@@ -90,7 +90,7 @@ static struct attribute *trace_imc_format_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group trace_imc_format_group = {
+static const struct attribute_group trace_imc_format_group = {
 .name = "format",
 .attrs = trace_imc_format_attrs,
 };
@@ -125,7 +125,7 @@ static struct attribute *imc_pmu_cpumask_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group imc_pmu_cpumask_attr_group = {
+static const struct attribute_group imc_pmu_cpumask_attr_group = {
 	.attrs = imc_pmu_cpumask_attrs,
 };
 
diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
index 4037ea652522..a74d382ecbb7 100644
--- a/arch/powerpc/perf/isa207-common.c
+++ b/arch/powerpc/perf/isa207-common.c
@@ -37,7 +37,7 @@ static struct attribute *isa207_pmu_format_attr[] = {
 	NULL,
 };
 
-struct attribute_group isa207_pmu_format_group = {
+const struct attribute_group isa207_pmu_format_group = {
 	.name = "format",
 	.attrs = isa207_pmu_format_attr,
 };
diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index 0975ad0b42c4..d3398100a60f 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -200,12 +200,12 @@ static struct attribute *power10_events_attr[] = {
 	NULL
 };
 
-static struct attribute_group power10_pmu_events_group_dd1 = {
+static const struct attribute_group power10_pmu_events_group_dd1 = {
 	.name = "events",
 	.attrs = power10_events_attr_dd1,
 };
 
-static struct attribute_group power10_pmu_events_group = {
+static const struct attribute_group power10_pmu_events_group = {
 	.name = "events",
 	.attrs = power10_events_attr,
 };
@@ -253,7 +253,7 @@ static struct attribute *power10_pmu_format_attr[] = {
 	NULL,
 };
 
-static struct attribute_group power10_pmu_format_group = {
+static const struct attribute_group power10_pmu_format_group = {
 	.name = "format",
 	.attrs = power10_pmu_format_attr,
 };
diff --git a/arch/powerpc/perf/power7-pmu.c b/arch/powerpc/perf/power7-pmu.c
index 99b5ba314ea7..a74211410b8d 100644
--- a/arch/powerpc/perf/power7-pmu.c
+++ b/arch/powerpc/perf/power7-pmu.c
@@ -405,7 +405,7 @@ static struct attribute *power7_events_attr[] = {
 	NULL
 };
 
-static struct attribute_group power7_pmu_events_group = {
+static const struct attribute_group power7_pmu_events_group = {
 	.name = "events",
 	.attrs = power7_events_attr,
 };
@@ -417,7 +417,7 @@ static struct attribute *power7_pmu_format_attr[] = {
 	NULL,
 };
 
-static struct attribute_group power7_pmu_format_group = {
+static const struct attribute_group power7_pmu_format_group = {
 	.name = "format",
 	.attrs = power7_pmu_format_attr,
 };
diff --git a/arch/powerpc/perf/power8-pmu.c b/arch/powerpc/perf/power8-pmu.c
index f21194b5604a..e37b1e714d2b 100644
--- a/arch/powerpc/perf/power8-pmu.c
+++ b/arch/powerpc/perf/power8-pmu.c
@@ -92,7 +92,7 @@ enum {
  */
 
 /* PowerISA v2.07 format attribute structure*/
-extern struct attribute_group isa207_pmu_format_group;
+extern const struct attribute_group isa207_pmu_format_group;
 
 /* Table of alternatives, sorted by column 0 */
 static const unsigned int event_alternatives[][MAX_ALT] = {
@@ -182,7 +182,7 @@ static struct attribute *power8_events_attr[] = {
 	NULL
 };
 
-static struct attribute_group power8_pmu_events_group = {
+static const struct attribute_group power8_pmu_events_group = {
 	.name = "events",
 	.attrs = power8_events_attr,
 };
diff --git a/arch/powerpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-pmu.c
index 4b7c17e36100..c9eb5232e68b 100644
--- a/arch/powerpc/perf/power9-pmu.c
+++ b/arch/powerpc/perf/power9-pmu.c
@@ -96,7 +96,7 @@ extern u64 PERF_REG_EXTENDED_MASK;
 #define PVR_POWER9_CUMULUS		0x00002000
 
 /* PowerISA v2.07 format attribute structure*/
-extern struct attribute_group isa207_pmu_format_group;
+extern const struct attribute_group isa207_pmu_format_group;
 
 int p9_dd21_bl_ev[] = {
 	PM_MRK_ST_DONE_L2,
@@ -217,7 +217,7 @@ static struct attribute *power9_events_attr[] = {
 	NULL
 };
 
-static struct attribute_group power9_pmu_events_group = {
+static const struct attribute_group power9_pmu_events_group = {
 	.name = "events",
 	.attrs = power9_events_attr,
 };
@@ -253,7 +253,7 @@ static struct attribute *power9_pmu_format_attr[] = {
 	NULL,
 };
 
-static struct attribute_group power9_pmu_format_group = {
+static const struct attribute_group power9_pmu_format_group = {
 	.name = "format",
 	.attrs = power9_pmu_format_attr,
 };
diff --git a/arch/powerpc/platforms/cell/cbe_thermal.c b/arch/powerpc/platforms/cell/cbe_thermal.c
index 2ece77f49bc3..abb5e527b4db 100644
--- a/arch/powerpc/platforms/cell/cbe_thermal.c
+++ b/arch/powerpc/platforms/cell/cbe_thermal.c
@@ -255,7 +255,7 @@ static struct attribute *spu_attributes[] = {
 	NULL,
 };
 
-static struct attribute_group spu_attribute_group = {
+static const struct attribute_group spu_attribute_group = {
 	.name	= "thermal",
 	.attrs	= spu_attributes,
 };
diff --git a/arch/powerpc/platforms/cell/spu_base.c b/arch/powerpc/platforms/cell/spu_base.c
index 83cea9e7ee72..2eecba3345c3 100644
--- a/arch/powerpc/platforms/cell/spu_base.c
+++ b/arch/powerpc/platforms/cell/spu_base.c
@@ -490,7 +490,7 @@ int spu_add_dev_attr(struct device_attribute *attr)
 }
 EXPORT_SYMBOL_GPL(spu_add_dev_attr);
 
-int spu_add_dev_attr_group(struct attribute_group *attrs)
+int spu_add_dev_attr_group(const struct attribute_group *attrs)
 {
 	struct spu *spu;
 	int rc = 0;
@@ -529,7 +529,7 @@ void spu_remove_dev_attr(struct device_attribute *attr)
 }
 EXPORT_SYMBOL_GPL(spu_remove_dev_attr);
 
-void spu_remove_dev_attr_group(struct attribute_group *attrs)
+void spu_remove_dev_attr_group(const struct attribute_group *attrs)
 {
 	struct spu *spu;
 
diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
index 0331f1973f0e..b97bc179f65a 100644
--- a/arch/powerpc/platforms/powernv/opal-core.c
+++ b/arch/powerpc/platforms/powernv/opal-core.c
@@ -603,7 +603,7 @@ static struct bin_attribute *mpipl_bin_attr[] = {
 
 };
 
-static struct attribute_group mpipl_group = {
+static const struct attribute_group mpipl_group = {
 	.attrs = mpipl_attr,
 	.bin_attrs =  mpipl_bin_attr,
 };
diff --git a/arch/powerpc/platforms/powernv/opal-dump.c b/arch/powerpc/platforms/powernv/opal-dump.c
index 410ed5b9de29..16c5860f1372 100644
--- a/arch/powerpc/platforms/powernv/opal-dump.c
+++ b/arch/powerpc/platforms/powernv/opal-dump.c
@@ -150,7 +150,7 @@ static struct attribute *initiate_attrs[] = {
 	NULL,
 };
 
-static struct attribute_group initiate_attr_group = {
+static const struct attribute_group initiate_attr_group = {
 	.attrs = initiate_attrs,
 };
 
diff --git a/arch/powerpc/platforms/powernv/opal-flash.c b/arch/powerpc/platforms/powernv/opal-flash.c
index 7e7d38b17420..18481a8c52fa 100644
--- a/arch/powerpc/platforms/powernv/opal-flash.c
+++ b/arch/powerpc/platforms/powernv/opal-flash.c
@@ -512,7 +512,7 @@ static struct attribute *image_op_attrs[] = {
 	NULL	/* need to NULL terminate the list of attributes */
 };
 
-static struct attribute_group image_op_attr_group = {
+static const struct attribute_group image_op_attr_group = {
 	.attrs = image_op_attrs,
 };
 
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
index 20aafd387840..1238b94b3cc1 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -1039,7 +1039,7 @@ static struct attribute *papr_nd_attributes[] = {
 	NULL,
 };
 
-static struct attribute_group papr_nd_attribute_group = {
+static const struct attribute_group papr_nd_attribute_group = {
 	.name = "papr",
 	.is_visible = papr_nd_attribute_visible,
 	.attrs = papr_nd_attributes,
diff --git a/arch/powerpc/platforms/pseries/power.c b/arch/powerpc/platforms/pseries/power.c
index ee343ec6ab94..3676cb297767 100644
--- a/arch/powerpc/platforms/pseries/power.c
+++ b/arch/powerpc/platforms/pseries/power.c
@@ -51,7 +51,7 @@ static struct attribute *g[] = {
         NULL,
 };
 
-static struct attribute_group attr_group = {
+static const struct attribute_group attr_group = {
         .attrs = g,
 };
 
-- 
2.35.1

