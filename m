Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECA0282246
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Oct 2020 09:58:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C3K3l499pzDqdj
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Oct 2020 17:58:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SXHgCZ+m; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C3JvC2xfRzDqQN
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Oct 2020 17:50:47 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0937XEdT065428; Sat, 3 Oct 2020 03:50:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NoY2V7Ah4SmvkglaVZ2WHgb7n2Cpj+x2IQqTL51wrFI=;
 b=SXHgCZ+mpA5BfkumNzQMHgTIgecqWjTaxxMS93rZ6Ogt5vz+6gJWuw0T2FRHkwGJ7mJm
 dpSdogwspJEz7qXpZbgYxvDlhlUjIyAXp0R+a8iaHIaCimsa2sgxKDVDfRQxXC/IF8RN
 SR/+HILg5NcL4VFxhzWijitJx/RMH4VaGGaaxGxJGVFsNrUv9yQC95R9B7hDLxqK5vD7
 2R5ftu9gE/hIJo2kAU4cnhbXCDFH2F9TbR/nnJBx22JEzsDX2oNWlugHkb+sFdKA8Qst
 DjduV+PjZbj/zW2vOhBbAVGzuSTAULLlL2FyHAcgXAnel5I0gcatflFKhqWiA0B2Eq1W cA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33xk7w270a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 03 Oct 2020 03:50:43 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0937Xf99014166;
 Sat, 3 Oct 2020 07:50:40 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 33xgx886e9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 03 Oct 2020 07:50:40 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0937ocFj34013580
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 3 Oct 2020 07:50:38 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87D814C06D;
 Sat,  3 Oct 2020 07:50:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6036A4C050;
 Sat,  3 Oct 2020 07:50:36 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.50.127])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat,  3 Oct 2020 07:50:36 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/5] powerpc/hv-gpci: Add sysfs files inside hv-gpci device to
 show cpumask
Date: Sat,  3 Oct 2020 13:19:43 +0530
Message-Id: <20201003074943.338618-5-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201003074943.338618-1-kjain@linux.ibm.com>
References: <20201003074943.338618-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-03_03:2020-10-02,
 2020-10-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 mlxscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2010030063
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
Cc: kjain@linux.ibm.com, suka@us.ibm.com, maddy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch here adds a cpumask attr to hv_gpci pmu along with ABI documentation.

Primary use to expose the cpumask is for the perf tool which has the
capability to parse the driver sysfs folder and understand the
cpumask file. Having cpumask file will reduce the number of perf command
line parameters (will avoid "-C" option in the perf tool
command line). It can also notify the user which is
the current cpu used to retrieve the counter data.

command:# cat /sys/devices/hv_gpci/cpumask
0

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../sysfs-bus-event_source-devices-hv_gpci     |  7 +++++++
 arch/powerpc/perf/hv-gpci.c                    | 18 ++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci
index b68a28a712d5..7162c5d675fe 100644
--- a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci
+++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci
@@ -72,3 +72,10 @@ Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
 Description:
 		A number indicating the latest version of the gpci interface
 		that the kernel is aware of.
+
+What:		/sys/devices/hv_gpci/cpumask
+Date:		October 2020
+Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
+Description:	read only
+		This sysfs file exposes the cpumask which is designated to make
+		HCALLs to retrieve hv-gpci pmu event counter data.
diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
index b9dc407c3159..159dca8d5d65 100644
--- a/arch/powerpc/perf/hv-gpci.c
+++ b/arch/powerpc/perf/hv-gpci.c
@@ -96,7 +96,15 @@ static ssize_t kernel_version_show(struct device *dev,
 	return sprintf(page, "0x%x\n", COUNTER_INFO_VERSION_CURRENT);
 }
 
+static ssize_t cpumask_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	return cpumap_print_to_pagebuf(true, buf, &hv_gpci_cpumask);
+}
+
 static DEVICE_ATTR_RO(kernel_version);
+static DEVICE_ATTR_RO(cpumask);
+
 HV_CAPS_ATTR(version, "0x%x\n");
 HV_CAPS_ATTR(ga, "%d\n");
 HV_CAPS_ATTR(expanded, "%d\n");
@@ -113,6 +121,15 @@ static struct attribute *interface_attrs[] = {
 	NULL,
 };
 
+static struct attribute *cpumask_attrs[] = {
+	&dev_attr_cpumask.attr,
+	NULL,
+};
+
+static struct attribute_group cpumask_attr_group = {
+	.attrs = cpumask_attrs,
+};
+
 static struct attribute_group interface_group = {
 	.name = "interface",
 	.attrs = interface_attrs,
@@ -122,6 +139,7 @@ static const struct attribute_group *attr_groups[] = {
 	&format_group,
 	&event_group,
 	&interface_group,
+	&cpumask_attr_group,
 	NULL,
 };
 
-- 
2.26.2

