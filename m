Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D15E729851
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 13:43:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QczkD1ZrZz3fgY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 21:43:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FzKHP4N3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FzKHP4N3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QczfV2bnBz3dtF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 21:40:34 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 359BHmBp026437;
	Fri, 9 Jun 2023 11:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=TLplbZByux4RI5tnLOD2SW6FIOETTXiVND3ct/pqUuI=;
 b=FzKHP4N3I6t2zJcficpWbdx+EF0TD3gheroF1h6QwGV9VgjOvl0folOjasqnQRlFer4U
 wL2zWllfRTisxr4w0nXpFcCpf6ukDheh0r8lqo/s/bXGulTHnz5JkJhJrg3mlP230tEN
 ezKRR2Djk3yCbips8OPhKZAUCya2M3gBS6OGjSpwTURJbap3v9Z1wybeuIrnvQXJuDMj
 L+fLSL6M6zc5bNWi9iugT8wVwyROt0tuZuLIu+3eg1EWCDN36oi7OML5Mm2lbJ6/M06O
 I0KTe+2U9X4F8bGL2oqbscy+0WWRjN2XFfENL3scW5vlYfEpvOAhVOHoi4aBMM1WoJQZ Nw== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r43308eat-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 11:40:30 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3597lw8o029933;
	Fri, 9 Jun 2023 11:40:28 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3r2a77hc6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 11:40:27 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 359BeOYo42205474
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Jun 2023 11:40:24 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 088B02004D;
	Fri,  9 Jun 2023 11:40:24 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1973820040;
	Fri,  9 Jun 2023 11:40:22 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.70.150])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 Jun 2023 11:40:21 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 03/10] powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show processor config information
Date: Fri,  9 Jun 2023 17:09:54 +0530
Message-Id: <20230609114001.169235-4-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230609114001.169235-1-kjain@linux.ibm.com>
References: <20230609114001.169235-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oOQFH1ir17zwy68F3ahxDsi2G91eoRUP
X-Proofpoint-ORIG-GUID: oOQFH1ir17zwy68F3ahxDsi2G91eoRUP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_08,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306090097
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
Cc: disgoel@linux.ibm.com, kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The hcall H_GET_PERF_COUNTER_INFO with counter request value as
PROCESSOR_CONFIG(0X90), can be used to get the system
processor configuration information. To expose the system
processor config information, patch adds sysfs file called
"processor_config" to the "/sys/devices/hv_gpci/interface/"
of hv_gpci pmu driver.

Add macro for PROCESSOR_CONFIG counter request value in hv-gpci.h file.
Also add a new function called "sysinfo_device_attr_create",
which will create and add required device attribute to the
interface_attrs array.

The processor_config sysfs file is only available for power10
and above platforms. Add a new macro called
INTERFACE_PROCESSOR_CONFIG_ATTR, which points to the index of
NULL placefolder, for processor_config attribute in the interface_attrs
array. Also add macro INTERFACE_NULL_ATTR which points to index of NULL
attribute in interface_attrs array.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/hv-gpci.c | 110 +++++++++++++++++++++++++++++++++---
 arch/powerpc/perf/hv-gpci.h |   5 +-
 2 files changed, 107 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
index bca24725699e..c9fe74373e5f 100644
--- a/arch/powerpc/perf/hv-gpci.c
+++ b/arch/powerpc/perf/hv-gpci.c
@@ -237,6 +237,72 @@ static ssize_t processor_bus_topology_show(struct device *dev, struct device_att
 	return ret;
 }
 
+static ssize_t processor_config_show(struct device *dev, struct device_attribute *attr,
+					char *buf)
+{
+	struct hv_gpci_request_buffer *arg;
+	unsigned long ret;
+	size_t n = 0;
+
+	arg = (void *)get_cpu_var(hv_gpci_reqb);
+	memset(arg, 0, HGPCI_REQ_BUFFER_SIZE);
+
+	/*
+	 * Pass the counter request value 0x90 corresponds to request
+	 * type 'Processor_config', to retrieve
+	 * the system processor information.
+	 * starting_index value implies the starting hardware
+	 * processor index.
+	 */
+	ret = systeminfo_gpci_request(PROCESSOR_CONFIG, 0, 0, buf, &n, arg);
+
+	if (!ret)
+		return n;
+
+	if (ret != H_PARAMETER)
+		goto out;
+
+	/*
+	 * ret value as 'H_PARAMETER' corresponds to 'GEN_BUF_TOO_SMALL', which
+	 * implies that buffer can't accommodate all information, and a partial buffer
+	 * returned. To handle that, we need to take subsequent requests
+	 * with next starting index to retrieve additional (missing) data.
+	 * Below loop do subsequent hcalls with next starting index and add it
+	 * to buffer util we get all the information.
+	 */
+	while (ret == H_PARAMETER) {
+		int returned_values = be16_to_cpu(arg->params.returned_values);
+		int elementsize = be16_to_cpu(arg->params.cv_element_size);
+		int last_element = (returned_values - 1) * elementsize;
+
+		/*
+		 * Since the starting index is part of counter_value
+		 * buffer elements, use the starting index value in the last
+		 * element and add 1 to subsequent hcalls.
+		 */
+		u32 starting_index = arg->bytes[last_element + 3] +
+				(arg->bytes[last_element + 2] << 8) +
+				(arg->bytes[last_element + 1] << 16) +
+				(arg->bytes[last_element] << 24) + 1;
+
+		memset(arg, 0, HGPCI_REQ_BUFFER_SIZE);
+
+		ret = systeminfo_gpci_request(PROCESSOR_CONFIG, starting_index, 0, buf, &n, arg);
+
+		if (!ret)
+			return n;
+
+		if (ret != H_PARAMETER)
+			goto out;
+	}
+
+	return n;
+
+out:
+	put_cpu_var(hv_gpci_reqb);
+	return ret;
+}
+
 static DEVICE_ATTR_RO(kernel_version);
 static DEVICE_ATTR_RO(cpumask);
 
@@ -258,6 +324,11 @@ static struct attribute *interface_attrs[] = {
 	 * attribute, set in init function if applicable.
 	 */
 	NULL,
+	/*
+	 * This NULL is a placeholder for the processor_config
+	 * attribute, set in init function if applicable.
+	 */
+	NULL,
 	NULL,
 };
 
@@ -463,21 +534,46 @@ static int hv_gpci_cpu_hotplug_init(void)
 			  ppc_hv_gpci_cpu_offline);
 }
 
-static void add_sysinfo_interface_files(void)
+static void sysinfo_device_attr_create(int sysinfo_interface_group_index)
 {
-	struct device_attribute *attr = kzalloc(sizeof(*attr), GFP_KERNEL);
+	struct device_attribute *attr;
 
+	if (sysinfo_interface_group_index < INTERFACE_PROCESSOR_BUS_TOPOLOGY_ATTR ||
+			sysinfo_interface_group_index >= INTERFACE_NULL_ATTR) {
+		pr_info("Wrong interface group index for system information\n");
+		return;
+	}
+
+	attr = kzalloc(sizeof(*attr), GFP_KERNEL);
 	if (!attr) {
-		pr_info("Memory allocation failed for processor_bug_topology interface file\n");
+		pr_info("Mem allocation failed, sysinfo index:%d\n", sysinfo_interface_group_index);
 		return;
 	}
 
-	/* Add processor_bus_topology attribute in the interface_attrs attribute array */
 	sysfs_attr_init(&attr->attr);
-	attr->attr.name = "processor_bug_topology";
+
+	switch (sysinfo_interface_group_index) {
+	case INTERFACE_PROCESSOR_BUS_TOPOLOGY_ATTR:
+		attr->attr.name = "processor_bug_topology";
+		attr->show = processor_bus_topology_show;
+	break;
+	case INTERFACE_PROCESSOR_CONFIG_ATTR:
+		attr->attr.name = "processor_config";
+		attr->show = processor_config_show;
+	break;
+	}
+
 	attr->attr.mode = 0444;
-	attr->show = processor_bus_topology_show;
-	interface_attrs[INTERFACE_PROCESSOR_BUS_TOPOLOGY_ATTR] = &attr->attr;
+	interface_attrs[sysinfo_interface_group_index] = &attr->attr;
+}
+
+static void add_sysinfo_interface_files(void)
+{
+	/* Add processor_bus_topology attribute in the interface_attrs attribute array */
+	sysinfo_device_attr_create(INTERFACE_PROCESSOR_BUS_TOPOLOGY_ATTR);
+
+	/* Add processor_config attribute in the interface_attrs attribute array */
+	sysinfo_device_attr_create(INTERFACE_PROCESSOR_CONFIG_ATTR);
 }
 
 static int hv_gpci_init(void)
diff --git a/arch/powerpc/perf/hv-gpci.h b/arch/powerpc/perf/hv-gpci.h
index ff76bc010823..0d324a7c684b 100644
--- a/arch/powerpc/perf/hv-gpci.h
+++ b/arch/powerpc/perf/hv-gpci.h
@@ -24,10 +24,13 @@ enum {
 };
 
 /* Counter request value to retrieve system information */
-#define PROCESSOR_BUS_TOPOLOGY 0XD0
+#define PROCESSOR_BUS_TOPOLOGY	0XD0
+#define PROCESSOR_CONFIG	0X90
 
 /* Interface attribute array index to store system information */
 #define INTERFACE_PROCESSOR_BUS_TOPOLOGY_ATTR	6
+#define INTERFACE_PROCESSOR_CONFIG_ATTR		7
+#define INTERFACE_NULL_ATTR			8
 
 #define REQUEST_FILE "../hv-gpci-requests.h"
 #define NAME_LOWER hv_gpci
-- 
2.35.3

