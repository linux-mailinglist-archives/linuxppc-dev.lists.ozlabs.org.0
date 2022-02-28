Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4974C7F98
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 01:46:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6z8R5HTRz3c1T
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 11:46:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H+IkCb6S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=H+IkCb6S; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6xyT6d6Nz30QD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Mar 2022 10:52:49 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21SNcxjV028765
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 23:52:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : date : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=0IM8dHEGzWc9lgOoqozgNI9g1cicM5wadZmaSXE2X9c=;
 b=H+IkCb6SPIR2bDgHQg2nbXjM5hO82a92ei5vd42T3JRGv95rpbJZTgKwhh5P7p1ft4IL
 KCPO7S6teAPn4yoHL/IxqggqUHCwPxyxo7L3euvEtd35SMVkjp+fMEchXApXXLAEvd7m
 +CQXZVCy3Dwce/yJXemEOfJ9IoYhz3iQnqZv6hpWB1F6mxyzA8JHkiRspESL41jq2NaP
 B6j/mXVHcs4k2bjvKHzScBfKF9lDdYbBiJZsjCHx8liTjHLY7P9wCqcf9g1+th5yqV7k
 aZKwSd4GU34DhGmRlWNhp6V3L87keNOhb/dT7i944L38nI+Fi2YJ082OG6dXGaumfAvG 8A== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eh7109gck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 23:52:45 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21SNXf7D009411
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 23:52:43 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3efbu99wet-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 23:52:43 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21SNqeiX46465286
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 23:52:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2AF8AE055
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 23:52:40 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4ED08AE056
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 23:52:39 +0000 (GMT)
Received: from [9.85.59.158] (unknown [9.85.59.158])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 23:52:38 +0000 (GMT)
Message-ID: <4d9e898a7057a784d65c5bacc1760ed88c60d584.camel@linux.vnet.ibm.com>
Subject: [PATCH] powerpc: declare unmodified attribute_group usages const
From: IBM IMAP <rmclure@linux.vnet.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Date: Tue, 01 Mar 2022 10:52:36 +1100
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gIslQQM-lDd75x4iliQlPhO7HsgtEsAg
X-Proofpoint-ORIG-GUID: gIslQQM-lDd75x4iliQlPhO7HsgtEsAg
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_10,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0
 priorityscore=1501 clxscore=1011 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202280119
X-Mailman-Approved-At: Tue, 01 Mar 2022 11:45:18 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From ec1a16a15a86c6224cc0129ab3c2ae9f69f2c7c5 Mon Sep 17 00:00:00 2001
From: Rohan McLure <rmclure@linux.ibm.com>
Date: Mon, 28 Feb 2022 10:19:19 +1100
Subject: [PATCH] powerpc: declare unmodified attribute_group usages
const
To: linuxppc-dev@lists.ozlabs.org

Inspired by (bd75b4ef4977: Constify static attribute_group structs),
accepted by linux-next, reported:
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220210202805.7750-4-rikard.falkeborn@gmail.com/

Nearly all singletons of type struct attribute_group are never
modified, and so
are candidates for being const. Declare them as const.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/powerpc/perf/generic-compat-pmu.c      | 4 ++--
 arch/powerpc/perf/hv-24x7.c                 | 6 +++---
 arch/powerpc/perf/hv-gpci.c                 | 8 ++++----
 arch/powerpc/perf/imc-pmu.c                 | 6 +++---
 arch/powerpc/perf/isa207-common.c           | 2 +-
 arch/powerpc/perf/power10-pmu.c             | 6 +++---
 arch/powerpc/perf/power7-pmu.c              | 4 ++--
 arch/powerpc/perf/power8-pmu.c              | 4 ++--
 arch/powerpc/perf/power9-pmu.c              | 6 +++---
 arch/powerpc/platforms/cell/cbe_thermal.c   | 4 ++--
 arch/powerpc/platforms/powernv/opal-core.c  | 2 +-
 arch/powerpc/platforms/powernv/opal-dump.c  | 2 +-
 arch/powerpc/platforms/powernv/opal-flash.c | 2 +-
 arch/powerpc/platforms/pseries/papr_scm.c   | 2 +-
 arch/powerpc/platforms/pseries/power.c      | 2 +-
 15 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/perf/generic-compat-pmu.c
b/arch/powerpc/perf/generic-compat-pmu.c
index b6e25f75109d..f3db88aee4dd 100644
--- a/arch/powerpc/perf/generic-compat-pmu.c
+++ b/arch/powerpc/perf/generic-compat-pmu.c
@@ -130,7 +130,7 @@ static struct attribute
*generic_compat_events_attr[] = {
 	NULL
 };
 
-static struct attribute_group generic_compat_pmu_events_group = {
+static const struct attribute_group generic_compat_pmu_events_group =
{
 	.name = "events",
 	.attrs = generic_compat_events_attr,
 };
@@ -146,7 +146,7 @@ static struct attribute
*generic_compat_pmu_format_attr[] = {
 	NULL,
 };
 
-static struct attribute_group generic_compat_pmu_format_group = {
+static const struct attribute_group generic_compat_pmu_format_group =
{
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
index e106909ff9c3..70981a321036 100644
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
@@ -125,7 +125,7 @@ static struct attribute *imc_pmu_cpumask_attrs[] =
{
 	NULL,
 };
 
-static struct attribute_group imc_pmu_cpumask_attr_group = {
+static const struct attribute_group imc_pmu_cpumask_attr_group = {
 	.attrs = imc_pmu_cpumask_attrs,
 };
 
diff --git a/arch/powerpc/perf/isa207-common.c
b/arch/powerpc/perf/isa207-common.c
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
diff --git a/arch/powerpc/perf/power10-pmu.c
b/arch/powerpc/perf/power10-pmu.c
index 0975ad0b42c4..d3398100a60f 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -200,12 +200,12 @@ static struct attribute *power10_events_attr[] =
{
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
@@ -253,7 +253,7 @@ static struct attribute *power10_pmu_format_attr[]
= {
 	NULL,
 };
 
-static struct attribute_group power10_pmu_format_group = {
+static const struct attribute_group power10_pmu_format_group = {
 	.name = "format",
 	.attrs = power10_pmu_format_attr,
 };
diff --git a/arch/powerpc/perf/power7-pmu.c b/arch/powerpc/perf/power7-
pmu.c
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
@@ -417,7 +417,7 @@ static struct attribute *power7_pmu_format_attr[] =
{
 	NULL,
 };
 
-static struct attribute_group power7_pmu_format_group = {
+static const struct attribute_group power7_pmu_format_group = {
 	.name = "format",
 	.attrs = power7_pmu_format_attr,
 };
diff --git a/arch/powerpc/perf/power8-pmu.c b/arch/powerpc/perf/power8-
pmu.c
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
diff --git a/arch/powerpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-
pmu.c
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
@@ -253,7 +253,7 @@ static struct attribute *power9_pmu_format_attr[] =
{
 	NULL,
 };
 
-static struct attribute_group power9_pmu_format_group = {
+static const struct attribute_group power9_pmu_format_group = {
 	.name = "format",
 	.attrs = power9_pmu_format_attr,
 };
diff --git a/arch/powerpc/platforms/cell/cbe_thermal.c
b/arch/powerpc/platforms/cell/cbe_thermal.c
index 2ece77f49bc3..ebdfe5095448 100644
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
@@ -283,7 +283,7 @@ static struct attribute *ppe_attributes[] = {
 	NULL,
 };
 
-static struct attribute_group ppe_attribute_group = {
+static const struct attribute_group ppe_attribute_group = {
 	.name	= "thermal",
 	.attrs	= ppe_attributes,
 };
diff --git a/arch/powerpc/platforms/powernv/opal-core.c
b/arch/powerpc/platforms/powernv/opal-core.c
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
diff --git a/arch/powerpc/platforms/powernv/opal-dump.c
b/arch/powerpc/platforms/powernv/opal-dump.c
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
 
diff --git a/arch/powerpc/platforms/powernv/opal-flash.c
b/arch/powerpc/platforms/powernv/opal-flash.c
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
 
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c
b/arch/powerpc/platforms/pseries/papr_scm.c
index f48e87ac89c9..9890690f9726 100644
--- a/arch/powerpc/platforms/pseries/papr_scm.c
+++ b/arch/powerpc/platforms/pseries/papr_scm.c
@@ -955,7 +955,7 @@ static struct attribute *papr_nd_attributes[] = {
 	NULL,
 };
 
-static struct attribute_group papr_nd_attribute_group = {
+static const struct attribute_group papr_nd_attribute_group = {
 	.name = "papr",
 	.is_visible = papr_nd_attribute_visible,
 	.attrs = papr_nd_attributes,
diff --git a/arch/powerpc/platforms/pseries/power.c
b/arch/powerpc/platforms/pseries/power.c
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


