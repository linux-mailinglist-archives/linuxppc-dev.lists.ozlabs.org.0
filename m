Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5760C218315
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 11:03:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1tdj4PV6zDr7g
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 19:03:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1tYX68fFzDqQJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 19:00:16 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0688YW2p081171
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 8 Jul 2020 05:00:14 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 324y2xsvpt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jul 2020 05:00:14 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0688sBfF021763
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 8 Jul 2020 09:00:10 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 322hd7vbmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jul 2020 09:00:10 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 068908fE12517886
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jul 2020 09:00:08 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DAB4E52077;
 Wed,  8 Jul 2020 09:00:06 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.77.206.155])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2DF3252071;
 Wed,  8 Jul 2020 09:00:05 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v4 2/2] powerpc/hv-24x7: Add sysfs files inside hv-24x7 device
 to show cpumask
Date: Wed,  8 Jul 2020 14:29:55 +0530
Message-Id: <20200708085955.655686-3-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200708085955.655686-1-kjain@linux.ibm.com>
References: <20200708085955.655686-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_04:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 cotscore=-2147483648 spamscore=0
 clxscore=1015 impostorscore=0 adultscore=0 mlxscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007080061
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
Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 .../sysfs-bus-event_source-devices-hv_24x7    |  7 ++++
 arch/powerpc/perf/hv-24x7.c                   | 33 ++++++++++++++++++-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7 b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
index e8698afcd952..ee89d0e94602 100644
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
index 93b4700dcf8c..3f769bb2d06a 100644
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
 
@@ -1684,7 +1706,7 @@ static int hv_24x7_cpu_hotplug_init(void)
 
 static int hv_24x7_init(void)
 {
-	int r;
+	int r, i = -1;
 	unsigned long hret;
 	struct hv_perf_caps caps;
 
@@ -1731,6 +1753,15 @@ static int hv_24x7_init(void)
 	if (r)
 		return r;
 
+	/*
+	 * Cpu hotplug init is successful, add the
+	 * cpumask file as part of pmu attr group and
+	 * assign it to very first NULL location.
+	 */
+	while (attr_groups[++i])
+		/* nothing */;
+	attr_groups[i] = &cpumask_attr_group;
+
 	r = perf_pmu_register(&h_24x7_pmu, h_24x7_pmu.name, -1);
 	if (r)
 		return r;
-- 
2.26.2

