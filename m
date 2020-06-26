Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FF620AFBD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 12:32:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tY9C6ynVzDqdb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 20:32:15 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tY5B0256zDqb1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 20:28:45 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05QA28dR118795; Fri, 26 Jun 2020 06:28:40 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31vts1n2w6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 06:28:40 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05QAKO7j007445;
 Fri, 26 Jun 2020 10:28:38 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 31uusk1dbk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Jun 2020 10:28:38 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 05QASZmI55116218
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Jun 2020 10:28:35 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D705A4069;
 Fri, 26 Jun 2020 10:28:35 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E14EA4067;
 Fri, 26 Jun 2020 10:28:33 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.40.11])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 26 Jun 2020 10:28:32 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 2/2] powerpc/hv-24x7: Add sysfs files inside hv-24x7 device
 to show cpumask
Date: Fri, 26 Jun 2020 15:58:24 +0530
Message-Id: <20200626102824.270923-3-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200626102824.270923-1-kjain@linux.ibm.com>
References: <20200626102824.270923-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-26_05:2020-06-26,
 2020-06-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 cotscore=-2147483648
 adultscore=0 mlxscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006260069
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
Cc: nathanl@linux.ibm.com, ego@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com,
 kjain@linux.ibm.com, suka@us.ibm.com, anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch here adds a cpumask attr to hv_24x7 pmu along with ABI documentation.

Primary use to expose the cpumask is for the perf tool which has the
capability to parse the driver sysfs folder and understand the
cpumask file. Having cpumask file will reduce the number of perf command
line parameters (will avoid "-C" option in the perf tool
command line). It can also notify the user which is
the current cpu used to retrieve the counter data.

command:# cat /sys/devices/hv_24x7/cpumask
0

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../sysfs-bus-event_source-devices-hv_24x7    |  7 ++++
 arch/powerpc/perf/hv-24x7.c                   | 36 +++++++++++++++++--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7 b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
index e8698afcd952..f9dd3755b049 100644
--- a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
+++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
@@ -43,6 +43,13 @@ Description:	read only
 		This sysfs interface exposes the number of cores per chip
 		present in the system.
 
+What:		/sys/devices/hv_24x7/cpumask
+Date:		June 2020
+Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
+Description:	read only
+		This sysfs file exposes the cpumask which is designated to make
+		HCALLs to retrieve hv-24x7 pmu event counter data.
+
 What:		/sys/bus/event_source/devices/hv_24x7/event_descs/<event-name>
 Date:		February 2014
 Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index ce4739e2b407..3c699612d29f 100644
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
 
@@ -1683,7 +1705,7 @@ static int hv_24x7_cpu_hotplug_init(void)
 
 static int hv_24x7_init(void)
 {
-	int r;
+	int r, i = -1;
 	unsigned long hret;
 	struct hv_perf_caps caps;
 
@@ -1727,8 +1749,18 @@ static int hv_24x7_init(void)
 
 	/* init cpuhotplug */
 	r = hv_24x7_cpu_hotplug_init();
-	if (r)
+	if (r) {
 		pr_err("hv_24x7: CPU hotplug init failed\n");
+	} else {
+		/*
+		 * Cpu hotplug init is successful, add the
+		 * cpumask file as part of pmu attr group and
+		 * assign it to very first NULL location.
+		 */
+		while (attr_groups[++i])
+			/* nothing */;
+		attr_groups[i] = &cpumask_attr_group;
+	}
 
 	r = perf_pmu_register(&h_24x7_pmu, h_24x7_pmu.name, -1);
 	if (r)
-- 
2.18.2

