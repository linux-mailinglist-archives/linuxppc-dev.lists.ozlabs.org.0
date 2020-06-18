Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DFB1FF206
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 14:37:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nhKp2RghzDqJL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 22:37:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nh626hv8zDqFp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 22:27:35 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05IC2k4Q125501; Thu, 18 Jun 2020 08:27:30 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31r6g13ar0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 08:27:30 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05IBxnfb003596;
 Thu, 18 Jun 2020 12:27:28 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 31quax92hj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 12:27:28 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05ICROaK61735184
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jun 2020 12:27:24 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1882AA4055;
 Thu, 18 Jun 2020 12:27:24 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78C57A4040;
 Thu, 18 Jun 2020 12:27:22 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.79.212.206])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Jun 2020 12:27:22 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 2/2] powerpc/hv-24x7: Add sysfs files inside hv-24x7 device to
 show cpumask
Date: Thu, 18 Jun 2020 17:57:13 +0530
Message-Id: <20200618122713.9030-3-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200618122713.9030-1-kjain@linux.ibm.com>
References: <20200618122713.9030-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-18_11:2020-06-18,
 2020-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 bulkscore=0 cotscore=-2147483648
 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006180089
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
Cc: nathanl@linux.ibm.com, kjain@linux.ibm.com, suka@us.ibm.com,
 maddy@linux.vnet.ibm.com, anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch here adds a cpumask attr to hv_24x7 pmu along with ABI documentation.

command:# cat /sys/devices/hv_24x7/cpumask
0

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../sysfs-bus-event_source-devices-hv_24x7    |  6 ++++
 arch/powerpc/perf/hv-24x7.c                   | 31 ++++++++++++++++++-
 2 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7 b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
index e8698afcd952..281e7b367733 100644
--- a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
+++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
@@ -43,6 +43,12 @@ Description:	read only
 		This sysfs interface exposes the number of cores per chip
 		present in the system.
 
+What:		/sys/devices/hv_24x7/cpumask
+Date:		June 2020
+Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
+Description:	read only
+		This sysfs file exposes cpumask.
+
 What:		/sys/bus/event_source/devices/hv_24x7/event_descs/<event-name>
 Date:		February 2014
 Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index fdc4ae155d60..03d870a9fc36 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -448,6 +448,12 @@ static ssize_t device_show_string(struct device *dev,
 	return sprintf(buf, "%s\n", (char *)d->var);
 }
 
+static ssize_t cpumask_get_attr(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	return cpumap_print_to_pagebuf(true, buf, &hv_24x7_cpumask);
+}
+
 static ssize_t sockets_show(struct device *dev,
 			    struct device_attribute *attr, char *buf)
 {
@@ -1116,6 +1122,17 @@ static DEVICE_ATTR_RO(sockets);
 static DEVICE_ATTR_RO(chipspersocket);
 static DEVICE_ATTR_RO(coresperchip);
 
+static DEVICE_ATTR(cpumask, S_IRUGO, cpumask_get_attr, NULL);
+
+static struct attribute *cpumask_attrs[] = {
+	&dev_attr_cpumask.attr,
+	NULL,
+};
+
+static struct attribute_group cpumask_attr_group = {
+	.attrs = cpumask_attrs,
+};
+
 static struct bin_attribute *if_bin_attrs[] = {
 	&bin_attr_catalog,
 	NULL,
@@ -1143,6 +1160,11 @@ static const struct attribute_group *attr_groups[] = {
 	&event_desc_group,
 	&event_long_desc_group,
 	&if_group,
+	/*
+	 * This NULL is a placeholder for the cpumask attr which will update
+	 * onlyif cpuhotplug registration is successful
+	 */
+	NULL,
 	NULL,
 };
 
@@ -1727,8 +1749,15 @@ static int hv_24x7_init(void)
 
 	/* init cpuhotplug */
 	r = hv_24x7_cpu_hotplug_init();
-	if (r)
+	if (r) {
 		pr_err("hv_24x7: CPU hotplug init failed\n");
+	} else {
+		/*
+		 * Cpu hotplug init is successful, add the
+		 * cpumask file as part of pmu attr group
+		 */
+		attr_groups[5] = &cpumask_attr_group;
+	}
 
 	r = perf_pmu_register(&h_24x7_pmu, h_24x7_pmu.name, -1);
 	if (r)
-- 
2.18.2

