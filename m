Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C12512B19
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 07:50:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kpl8S5dyYz3bbV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 15:50:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TrUQxzQs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TrUQxzQs; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kpl7n3VJXz2xB1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 15:49:56 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23S5htit003813;
 Thu, 28 Apr 2022 05:49:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=qDVugLhDKnV6m7SGpgPwo2IccV+j/KeQl84ZooXdK7I=;
 b=TrUQxzQsKF+srUB1YWrWIwz+0y67tO9+AZj0gW2HLtaLxBd+OLqGp8XRLaflAZjpc53b
 fGAKznrltsPRsiIxX1V3dkbTeU8y1mzpqkPKa8VKF6i5MKW+FugVr+2zB4DKALEA+LNX
 AJokhIzQ79pA7030QSzPHhoSl7FDsIXKuKWTU49X4gRCWL9Z0vfEi4keNZaRd1bKURuz
 OdNZmqAKq6M8LFSSDnhx2QZ86acYeaAHPOf6I74CxHEZLewBujWItMQFzwZ5IYUBWk2G
 qbckMBfdhPiBnhwIhju7RosxNy9OgDuczN3Ft7Eys668ruhGSEmxIV/Div+ri6HHU9IK Xw== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqn1gr2rj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 05:49:48 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23S5mvIG013502;
 Thu, 28 Apr 2022 05:49:47 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03fra.de.ibm.com with ESMTP id 3fm938wghg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 05:49:46 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 23S5acCR36372878
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 05:36:38 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B96E44C050;
 Thu, 28 Apr 2022 05:49:43 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D8CE4C044;
 Thu, 28 Apr 2022 05:49:41 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.163.4.60])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 28 Apr 2022 05:49:41 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/perf: Add support for caps under sysfs in powerpc
Date: Thu, 28 Apr 2022 11:19:37 +0530
Message-Id: <20220428054937.28006-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: m10RJWys3R3q-A3tAQ8NdbKyZuq3CcOl
X-Proofpoint-ORIG-GUID: m10RJWys3R3q-A3tAQ8NdbKyZuq3CcOl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-27_04,2022-04-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204280033
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
Cc: kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
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
for power8, power9, power10 and generic compat PMU.

The information exposed currently:
 - pmu_name : Underlying PMU name from the driver

Example result with power9 pmu:

 # ls /sys/bus/event_source/devices/cpu/caps
pmu_name

 # cat /sys/bus/event_source/devices/cpu/caps/pmu_name
power9

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/perf/generic-compat-pmu.c | 20 ++++++++++++++++++++
 arch/powerpc/perf/power10-pmu.c        | 20 ++++++++++++++++++++
 arch/powerpc/perf/power8-pmu.c         | 20 ++++++++++++++++++++
 arch/powerpc/perf/power9-pmu.c         | 20 ++++++++++++++++++++
 4 files changed, 80 insertions(+)

diff --git a/arch/powerpc/perf/generic-compat-pmu.c b/arch/powerpc/perf/generic-compat-pmu.c
index f3db88aee4dd..7b5fe2d89007 100644
--- a/arch/powerpc/perf/generic-compat-pmu.c
+++ b/arch/powerpc/perf/generic-compat-pmu.c
@@ -151,9 +151,29 @@ static const struct attribute_group generic_compat_pmu_format_group = {
 	.attrs = generic_compat_pmu_format_attr,
 };
 
+static ssize_t pmu_name_show(struct device *cdev,
+		struct device_attribute *attr,
+		char *buf)
+{
+	return snprintf(buf, PAGE_SIZE, "generic_compat_pmu");
+}
+
+static DEVICE_ATTR_RO(pmu_name);
+
+static struct attribute *generic_compat_pmu_caps_attrs[] = {
+	&dev_attr_pmu_name.attr,
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
index d3398100a60f..a622ff783719 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -258,6 +258,25 @@ static const struct attribute_group power10_pmu_format_group = {
 	.attrs = power10_pmu_format_attr,
 };
 
+static ssize_t pmu_name_show(struct device *cdev,
+		struct device_attribute *attr,
+		char *buf)
+{
+	return snprintf(buf, PAGE_SIZE, "power10");
+}
+
+static DEVICE_ATTR_RO(pmu_name);
+
+static struct attribute *power10_pmu_caps_attrs[] = {
+	&dev_attr_pmu_name.attr,
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
@@ -267,6 +286,7 @@ static const struct attribute_group *power10_pmu_attr_groups_dd1[] = {
 static const struct attribute_group *power10_pmu_attr_groups[] = {
 	&power10_pmu_format_group,
 	&power10_pmu_events_group,
+	&power10_pmu_caps_group,
 	NULL,
 };
 
diff --git a/arch/powerpc/perf/power8-pmu.c b/arch/powerpc/perf/power8-pmu.c
index e37b1e714d2b..fbcd2bfa05ba 100644
--- a/arch/powerpc/perf/power8-pmu.c
+++ b/arch/powerpc/perf/power8-pmu.c
@@ -187,9 +187,29 @@ static const struct attribute_group power8_pmu_events_group = {
 	.attrs = power8_events_attr,
 };
 
+static ssize_t pmu_name_show(struct device *cdev,
+		struct device_attribute *attr,
+		char *buf)
+{
+	return snprintf(buf, PAGE_SIZE, "power8");
+}
+
+static DEVICE_ATTR_RO(pmu_name);
+
+static struct attribute *power8_pmu_caps_attrs[] = {
+	&dev_attr_pmu_name.attr,
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
index c9eb5232e68b..11f290b6287f 100644
--- a/arch/powerpc/perf/power9-pmu.c
+++ b/arch/powerpc/perf/power9-pmu.c
@@ -258,9 +258,29 @@ static const struct attribute_group power9_pmu_format_group = {
 	.attrs = power9_pmu_format_attr,
 };
 
+static ssize_t pmu_name_show(struct device *cdev,
+		struct device_attribute *attr,
+		char *buf)
+{
+	return snprintf(buf, PAGE_SIZE, "power9");
+}
+
+static DEVICE_ATTR_RO(pmu_name);
+
+static struct attribute *power9_pmu_caps_attrs[] = {
+	&dev_attr_pmu_name.attr,
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
2.31.1

