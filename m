Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9064552E7FD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 10:48:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L4L3637p6z3bt4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 May 2022 18:48:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aZjezkrD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aZjezkrD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L4L1m1K3Cz3dQb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 May 2022 18:46:51 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24K8i9Nb038354;
 Fri, 20 May 2022 08:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=2UM2F/tBEu7oRCsSMclhmBlUPqAMJ13a5X/w3r4lp28=;
 b=aZjezkrDYW+3XXt1FBBhu2WLX4S6wutAYQLEl3UL2F70GQQoVw82t2sj2eSr/9Va3IIW
 Sx7EP+gMC0CRrYWl3Kp7FYgOsLMcILglNZ6IckoFlPwHgo+xqKC2Kd3XyBW5AjE0hjJD
 9nZtgdsJYozgEqKvIsAWHObZY0U1ceGX5DRJU0TLOXQVg6QgVauXBH2tWHzjglOO8QEX
 ORCk3qx43Bz7o+n3Q/gAhBUfciTSfviHE0FOxoV4C+TTW3fzENDz9NUoVS2Ye2gWUW99
 VPmFUkdAZmfhVVU174C4dyq3SKgI4RAaIcTDvebucHdqz/xxKuwkYH6Fm6wuppxYhYtM VQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g67r500xg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 08:46:44 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24K8k8ck005401;
 Fri, 20 May 2022 08:46:43 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g67r500x4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 08:46:43 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24K8bAqD023408;
 Fri, 20 May 2022 08:46:41 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3g2428xx68-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 20 May 2022 08:46:41 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 24K8Wf4B48955736
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 20 May 2022 08:32:41 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49ECF4203F;
 Fri, 20 May 2022 08:46:38 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4ED9F42041;
 Fri, 20 May 2022 08:46:32 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.31.125])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 20 May 2022 08:46:31 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, mpe@ellerman.id.au
Subject: [PATCH V3 1/2] powerpc/perf: Add support for caps under sysfs in
 powerpc
Date: Fri, 20 May 2022 14:16:29 +0530
Message-Id: <20220520084630.15181-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FIj2d82alGAnAUKL9JXC8K4ELby-80yY
X-Proofpoint-ORIG-GUID: 4pdTL-g2eeAb54R5fdM46a0HoXgAWECu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-20_03,2022-05-19_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 impostorscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205200061
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
Cc: irogers@google.com, maddy@linux.vnet.ibm.com, rnsastry@linux.ibm.com,
 kjain@linux.ibm.com, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, disgoel@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add caps support under "/sys/bus/event_source/devices/<pmu>/"
for powerpc. This directory can be used to expose some of the
specific features that powerpc PMU supports to the user.
Example: pmu_name. The name of PMU registered will depend on
platform, say power9 or power10 or it could be Generic Compat
PMU.

Currently the only way to know which is the registered
PMU is from the dmesg logs. But clearing the dmesg will make it
difficult to know exact PMU backend used. And even extracting
from dmesg will be complicated, as we need  to parse the dmesg
logs and add filters for pmu name. Whereas by exposing it via
caps will make it easy as we just need to directly read it from
the sysfs.

Add a caps directory to /sys/bus/event_source/devices/cpu/
for power8, power9, power10 and generic compat PMU in respective
PMU driver code. Update the pmu_name file under caps folder
in core-book3s using "attr_update".

The information exposed currently:
 - pmu_name : Underlying PMU name from the driver

Example result with power9 pmu:

 # ls /sys/bus/event_source/devices/cpu/caps
pmu_name

 # cat /sys/bus/event_source/devices/cpu/caps/pmu_name
POWER9

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
Changelog:
 v2 -> v3:
 Removed the newline in sysfs_emit.

 v1 -> v2:
 Move the show function as generic in core-book3s
 and update show function using sysfs_emit and ppmu->name
 Added Documention for this ABI in patch 2.
 Notes: The caps directory is implemented in PMU for other
 architectures already. Reference commit for x86:
 commit b00233b53065 ("perf/x86: Export some PMU attributes in caps/ directory")

 arch/powerpc/perf/core-book3s.c        | 31 ++++++++++++++++++++++++++
 arch/powerpc/perf/generic-compat-pmu.c | 10 +++++++++
 arch/powerpc/perf/power10-pmu.c        | 10 +++++++++
 arch/powerpc/perf/power8-pmu.c         | 10 +++++++++
 arch/powerpc/perf/power9-pmu.c         | 10 +++++++++
 5 files changed, 71 insertions(+)

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index b5b42cf0a703..80237fd07010 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2488,6 +2488,33 @@ static int power_pmu_prepare_cpu(unsigned int cpu)
 	return 0;
 }
 
+static ssize_t pmu_name_show(struct device *cdev,
+		struct device_attribute *attr,
+		char *buf)
+{
+	if (ppmu)
+		return sysfs_emit(buf, "%s", ppmu->name);
+
+	return 0;
+}
+
+static DEVICE_ATTR_RO(pmu_name);
+
+static struct attribute *pmu_caps_attrs[] = {
+	&dev_attr_pmu_name.attr,
+	NULL
+};
+
+static const struct attribute_group pmu_caps_group = {
+	.name  = "caps",
+	.attrs = pmu_caps_attrs,
+};
+
+static const struct attribute_group *pmu_caps_groups[] = {
+	&pmu_caps_group,
+	NULL,
+};
+
 int __init register_power_pmu(struct power_pmu *pmu)
 {
 	if (ppmu)
@@ -2498,6 +2525,10 @@ int __init register_power_pmu(struct power_pmu *pmu)
 		pmu->name);
 
 	power_pmu.attr_groups = ppmu->attr_groups;
+
+	if (ppmu->flags & PPMU_ARCH_207S)
+		power_pmu.attr_update = pmu_caps_groups;
+
 	power_pmu.capabilities |= (ppmu->capabilities & PERF_PMU_CAP_EXTENDED_REGS);
 
 #ifdef MSR_HV
diff --git a/arch/powerpc/perf/generic-compat-pmu.c b/arch/powerpc/perf/generic-compat-pmu.c
index f3db88aee4dd..817c69863038 100644
--- a/arch/powerpc/perf/generic-compat-pmu.c
+++ b/arch/powerpc/perf/generic-compat-pmu.c
@@ -151,9 +151,19 @@ static const struct attribute_group generic_compat_pmu_format_group = {
 	.attrs = generic_compat_pmu_format_attr,
 };
 
+static struct attribute *generic_compat_pmu_caps_attrs[] = {
+	NULL
+};
+
+static struct attribute_group generic_compat_pmu_caps_group = {
+	.name  = "caps",
+	.attrs = generic_compat_pmu_caps_attrs,
+};
+
 static const struct attribute_group *generic_compat_pmu_attr_groups[] = {
 	&generic_compat_pmu_format_group,
 	&generic_compat_pmu_events_group,
+	&generic_compat_pmu_caps_group,
 	NULL,
 };
 
diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index c6d51e7093cf..d1adcd9f52e2 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -258,6 +258,15 @@ static const struct attribute_group power10_pmu_format_group = {
 	.attrs = power10_pmu_format_attr,
 };
 
+static struct attribute *power10_pmu_caps_attrs[] = {
+	NULL
+};
+
+static struct attribute_group power10_pmu_caps_group = {
+	.name  = "caps",
+	.attrs = power10_pmu_caps_attrs,
+};
+
 static const struct attribute_group *power10_pmu_attr_groups_dd1[] = {
 	&power10_pmu_format_group,
 	&power10_pmu_events_group_dd1,
@@ -267,6 +276,7 @@ static const struct attribute_group *power10_pmu_attr_groups_dd1[] = {
 static const struct attribute_group *power10_pmu_attr_groups[] = {
 	&power10_pmu_format_group,
 	&power10_pmu_events_group,
+	&power10_pmu_caps_group,
 	NULL,
 };
 
diff --git a/arch/powerpc/perf/power8-pmu.c b/arch/powerpc/perf/power8-pmu.c
index e37b1e714d2b..2518f5375d4a 100644
--- a/arch/powerpc/perf/power8-pmu.c
+++ b/arch/powerpc/perf/power8-pmu.c
@@ -187,9 +187,19 @@ static const struct attribute_group power8_pmu_events_group = {
 	.attrs = power8_events_attr,
 };
 
+static struct attribute *power8_pmu_caps_attrs[] = {
+	NULL
+};
+
+static struct attribute_group power8_pmu_caps_group = {
+	.name  = "caps",
+	.attrs = power8_pmu_caps_attrs,
+};
+
 static const struct attribute_group *power8_pmu_attr_groups[] = {
 	&isa207_pmu_format_group,
 	&power8_pmu_events_group,
+	&power8_pmu_caps_group,
 	NULL,
 };
 
diff --git a/arch/powerpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-pmu.c
index c393e837648e..5c654ce1a417 100644
--- a/arch/powerpc/perf/power9-pmu.c
+++ b/arch/powerpc/perf/power9-pmu.c
@@ -258,9 +258,19 @@ static const struct attribute_group power9_pmu_format_group = {
 	.attrs = power9_pmu_format_attr,
 };
 
+static struct attribute *power9_pmu_caps_attrs[] = {
+	NULL
+};
+
+static struct attribute_group power9_pmu_caps_group = {
+	.name  = "caps",
+	.attrs = power9_pmu_caps_attrs,
+};
+
 static const struct attribute_group *power9_pmu_attr_groups[] = {
 	&power9_pmu_format_group,
 	&power9_pmu_events_group,
+	&power9_pmu_caps_group,
 	NULL,
 };
 
-- 
2.35.1

