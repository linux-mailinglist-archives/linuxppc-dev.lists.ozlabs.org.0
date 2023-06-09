Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD6B729854
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 13:45:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qczm819CRz3fjx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 21:45:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=izH6/nkF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=izH6/nkF;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qczfc2ZcGz3f91
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 21:40:40 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 359BcsKq003850;
	Fri, 9 Jun 2023 11:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3lb8rLN/ExPlAQNQM9tOtCMnSExjWaPJZGYIOqFKvqE=;
 b=izH6/nkF+3P33b9wUvd5Iw2B4d4Qk45uVaf4J6U6sy+3/8ytyhIKXjy8Zk1mfD46Bixw
 JWUosdukD7ee73Ra7RPQbMC57NVK4a3C93mDw8lTjKFwJYLMoLsZ239o804dUuQdAZT7
 N5Q8OoTHz8EgGjJl0E6JQLijJvHav04NqJjdz+JEk0wyk1I5/F93Bbc1VJlV7n8FrCyZ
 1ey8w+M/7STws/hcddzZNQLEw1qBd3MZh5+tA3Se3ke71SwXKCfyK4Ur0NISUbfMhaTj
 xLF9SlxdsOPpYI7FlpAj0LHEoIT4K7QsMM9nFyAENjIrxuisCmOigWjgqBjhjjVQ9OqW Hg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r42mh139r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 11:40:34 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3599SOkZ021810;
	Fri, 9 Jun 2023 11:40:33 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3r2a769x3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 11:40:33 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 359BeTe817236558
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Jun 2023 11:40:29 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4FE82004D;
	Fri,  9 Jun 2023 11:40:29 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6751820043;
	Fri,  9 Jun 2023 11:40:27 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.70.150])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 Jun 2023 11:40:27 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 05/10] powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show affinity domain via virtual processor information
Date: Fri,  9 Jun 2023 17:09:56 +0530
Message-Id: <20230609114001.169235-6-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230609114001.169235-1-kjain@linux.ibm.com>
References: <20230609114001.169235-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QOCJNLpGlKXHkWwiMGFVz38iGGw5ivM-
X-Proofpoint-ORIG-GUID: QOCJNLpGlKXHkWwiMGFVz38iGGw5ivM-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_08,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 malwarescore=0 mlxlogscore=974 bulkscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306090097
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
AFFINITY_DOMAIN_INFORMATION_BY_VIRTUAL_PROCESSOR(0XA0), can be used to get
the system affinity domain via virtual processor information. To expose
the system affinity domain via virtual processor information, patch adds
sysfs file called "affinity_domain_via_virtual_processor" to the
"/sys/devices/hv_gpci/interface/" of hv_gpci pmu driver.

Add macro for AFFINITY_DOMAIN_VIA_VP, which points to counter request value
for "affinity_domain_via_virtual_processor" in hv-gpci.h file.

The affinity_domain_via_virtual_processor sysfs file is only available for
power10 and above platforms. Add a macro called
INTERFACE_AFFINITY_DOMAIN_VIA_VP_ATTR, which points to the index of NULL
placeholder, for affinity_domain_via_virtual_processor attribute in
interface_attrs array. Also updated the value of INTERFACE_NULL_ATTR macro
in hv-gpci.h file.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/hv-gpci.c | 84 +++++++++++++++++++++++++++++++++++++
 arch/powerpc/perf/hv-gpci.h |  4 +-
 2 files changed, 87 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
index c9fe74373e5f..cac726f06221 100644
--- a/arch/powerpc/perf/hv-gpci.c
+++ b/arch/powerpc/perf/hv-gpci.c
@@ -303,6 +303,75 @@ static ssize_t processor_config_show(struct device *dev, struct device_attribute
 	return ret;
 }
 
+static ssize_t affinity_domain_via_virtual_processor_show(struct device *dev,
+			struct device_attribute *attr, char *buf)
+{
+	struct hv_gpci_request_buffer *arg;
+	unsigned long ret;
+	size_t n = 0;
+
+	arg = (void *)get_cpu_var(hv_gpci_reqb);
+	memset(arg, 0, HGPCI_REQ_BUFFER_SIZE);
+
+	/*
+	 * Pass the counter request 0xA0 corresponds to request
+	 * type 'Affinity_domain_information_by_virutal_processor',
+	 * to retrieve the system affinity domain information.
+	 * starting_index value refers to the starting hardware
+	 * processor index.
+	 */
+	ret = systeminfo_gpci_request(AFFINITY_DOMAIN_VIA_VP, 0, 0, buf, &n, arg);
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
+	 * with next secondary index to retrieve additional (missing) data.
+	 * Below loop do subsequent hcalls with next secondary index and add it
+	 * to buffer util we get all the information.
+	 */
+	while (ret == H_PARAMETER) {
+		int returned_values = be16_to_cpu(arg->params.returned_values);
+		int elementsize = be16_to_cpu(arg->params.cv_element_size);
+		int last_element = (returned_values - 1) * elementsize;
+
+		/*
+		 * Since the starting index and secondary index type is part of the
+		 * counter_value buffer elements, use the starting index value in the
+		 * last array element as subsequent starting index, and use secondary index
+		 * value in the last array element plus 1 as subsequent secondary index.
+		 * For counter request '0xA0', starting index points to partition id
+		 * and secondary index points to corresponding virtual processor index.
+		 */
+		u32 starting_index = arg->bytes[last_element + 1] + (arg->bytes[last_element] << 8);
+		u16 secondary_index = arg->bytes[last_element + 3] +
+				(arg->bytes[last_element + 2] << 8) + 1;
+
+		memset(arg, 0, HGPCI_REQ_BUFFER_SIZE);
+
+		ret = systeminfo_gpci_request(AFFINITY_DOMAIN_VIA_VP, starting_index,
+					secondary_index, buf, &n, arg);
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
 
@@ -329,6 +398,11 @@ static struct attribute *interface_attrs[] = {
 	 * attribute, set in init function if applicable.
 	 */
 	NULL,
+	/*
+	 * This NULL is a placeholder for the affinity_domain_via_virtual_processor
+	 * attribute, set in init function if applicable.
+	 */
+	NULL,
 	NULL,
 };
 
@@ -561,6 +635,10 @@ static void sysinfo_device_attr_create(int sysinfo_interface_group_index)
 		attr->attr.name = "processor_config";
 		attr->show = processor_config_show;
 	break;
+	case INTERFACE_AFFINITY_DOMAIN_VIA_VP_ATTR:
+		attr->attr.name = "affinity_domain_via_virtual_processor";
+		attr->show = affinity_domain_via_virtual_processor_show;
+	break;
 	}
 
 	attr->attr.mode = 0444;
@@ -574,6 +652,12 @@ static void add_sysinfo_interface_files(void)
 
 	/* Add processor_config attribute in the interface_attrs attribute array */
 	sysinfo_device_attr_create(INTERFACE_PROCESSOR_CONFIG_ATTR);
+
+	/*
+	 * Add affinity_domain_via_virtual_processor attribute in the
+	 * interface_attrs attribute array
+	 */
+	sysinfo_device_attr_create(INTERFACE_AFFINITY_DOMAIN_VIA_VP_ATTR);
 }
 
 static int hv_gpci_init(void)
diff --git a/arch/powerpc/perf/hv-gpci.h b/arch/powerpc/perf/hv-gpci.h
index 0d324a7c684b..c88599fbcaa5 100644
--- a/arch/powerpc/perf/hv-gpci.h
+++ b/arch/powerpc/perf/hv-gpci.h
@@ -26,11 +26,13 @@ enum {
 /* Counter request value to retrieve system information */
 #define PROCESSOR_BUS_TOPOLOGY	0XD0
 #define PROCESSOR_CONFIG	0X90
+#define AFFINITY_DOMAIN_VIA_VP	0xA0 /* affinity domain via virtual processor */
 
 /* Interface attribute array index to store system information */
 #define INTERFACE_PROCESSOR_BUS_TOPOLOGY_ATTR	6
 #define INTERFACE_PROCESSOR_CONFIG_ATTR		7
-#define INTERFACE_NULL_ATTR			8
+#define INTERFACE_AFFINITY_DOMAIN_VIA_VP_ATTR	8
+#define INTERFACE_NULL_ATTR			9
 
 #define REQUEST_FILE "../hv-gpci-requests.h"
 #define NAME_LOWER hv_gpci
-- 
2.35.3

