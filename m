Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 891A772985A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 13:47:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qczp32BVbz3fdy
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 21:47:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ix8ca0F3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ix8ca0F3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qczfj33xCz3fF9
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 21:40:45 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 359BBdpb026347;
	Fri, 9 Jun 2023 11:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=KjAPXvtY/d4aTrrV1cfMp1J5+mTFPPlYs9Bk4mn+MSg=;
 b=ix8ca0F3LOWTrldXtj0bQqJrdMwt3dWGKu6vGifU93tryMrTKJCglkTOMu2Nf/NqDksd
 Q9NQkv+pzzi9R2GrJK73BBU9lFgrO1xBIrgaHtBckcpO4Y2ck0yVzktytbiar6gJyukj
 DEwxwwZNeZ7SBkoLdzjK1rqiV5dOcyej6NBiax+wp4E8Zfa8bRqpx4n/+MSToquR+mkh
 rWW1tApQcxr6EbkBjSp2ZUVDSKt0lWlnMDni18bJ65a548MIQ4IGl9Dqbwl65WGZjVYV
 eyNyT9y8FU8F1ZWMS97gw0FYuj+urAn0wdZ6VgguAMd227ENpPvSvZcGM8QYMGVUHAeH SA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r42q6h62a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 11:40:41 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 359BK03N002012;
	Fri, 9 Jun 2023 11:40:38 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3r2a77hc6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 11:40:38 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 359BeZbD11862772
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Jun 2023 11:40:35 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 216CF20043;
	Fri,  9 Jun 2023 11:40:35 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11EEC20040;
	Fri,  9 Jun 2023 11:40:33 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.70.150])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 Jun 2023 11:40:32 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 07/10] powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show affinity domain via domain information
Date: Fri,  9 Jun 2023 17:09:58 +0530
Message-Id: <20230609114001.169235-8-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230609114001.169235-1-kjain@linux.ibm.com>
References: <20230609114001.169235-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IkkOc0T3ZnIOJBweTYO4wueTJ8nDv3v7
X-Proofpoint-ORIG-GUID: IkkOc0T3ZnIOJBweTYO4wueTJ8nDv3v7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_08,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 adultscore=0 mlxscore=0 lowpriorityscore=0
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
AFFINITY_DOMAIN_INFORMATION_BY_DOMAIN(0XB0), can be used to get
the system affinity domain via domain information. To expose the system
affinity domain via domain information, patch adds sysfs file called
"affinity_domain_via_domain" to the "/sys/devices/hv_gpci/interface/"
of hv_gpci pmu driver.

Add macro for AFFINITY_DOMAIN_VIA_DOM, which points to the counter
request value for "affinity_domain_via_domain" in hv-gpci.h file.

The affinity_domain_via_domain sysfs file is only available for power10
and above platforms. Add a macro called
INTERFACE_AFFINITY_DOMAIN_VIA_DOM_ATTR, which points to the index of NULL
placeholder, for affinity_domain_via_domain attribute in interface_attrs
array. Also updated the value of INTERFACE_NULL_ATTR macro in hv-gpci.h
file.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/hv-gpci.c | 77 +++++++++++++++++++++++++++++++++++++
 arch/powerpc/perf/hv-gpci.h |  4 +-
 2 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
index cac726f06221..b18f6f2d15b0 100644
--- a/arch/powerpc/perf/hv-gpci.c
+++ b/arch/powerpc/perf/hv-gpci.c
@@ -372,6 +372,71 @@ static ssize_t affinity_domain_via_virtual_processor_show(struct device *dev,
 	return ret;
 }
 
+static ssize_t affinity_domain_via_domain_show(struct device *dev, struct device_attribute *attr,
+						char *buf)
+{
+	struct hv_gpci_request_buffer *arg;
+	unsigned long ret;
+	size_t n = 0;
+
+	arg = (void *)get_cpu_var(hv_gpci_reqb);
+	memset(arg, 0, HGPCI_REQ_BUFFER_SIZE);
+
+	/*
+	 * Pass the counter request 0xB0 corresponds to request
+	 * type 'Affinity_domain_information_by_domain',
+	 * to retrieve the system affinity domain information.
+	 * starting_index value refers to the starting hardware
+	 * processor index.
+	 */
+	ret = systeminfo_gpci_request(AFFINITY_DOMAIN_VIA_DOM, 0, 0, buf, &n, arg);
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
+		 * Since the starting index value is part of counter_value
+		 * buffer elements, use the starting index value in the last
+		 * element and add 1 to make subsequent hcalls.
+		 */
+		u32 starting_index = arg->bytes[last_element + 1] +
+			(arg->bytes[last_element] << 8) + 1;
+
+		memset(arg, 0, HGPCI_REQ_BUFFER_SIZE);
+
+		ret = systeminfo_gpci_request(AFFINITY_DOMAIN_VIA_DOM,
+					starting_index, 0, buf, &n, arg);
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
 
@@ -403,6 +468,11 @@ static struct attribute *interface_attrs[] = {
 	 * attribute, set in init function if applicable.
 	 */
 	NULL,
+	/*
+	 * This NULL is a placeholder for the affinity_domain_via_domain
+	 * attribute, set in init function if applicable.
+	 */
+	NULL,
 	NULL,
 };
 
@@ -639,6 +709,10 @@ static void sysinfo_device_attr_create(int sysinfo_interface_group_index)
 		attr->attr.name = "affinity_domain_via_virtual_processor";
 		attr->show = affinity_domain_via_virtual_processor_show;
 	break;
+	case INTERFACE_AFFINITY_DOMAIN_VIA_DOM_ATTR:
+		attr->attr.name = "affinity_domain_via_domain";
+		attr->show = affinity_domain_via_domain_show;
+	break;
 	}
 
 	attr->attr.mode = 0444;
@@ -658,6 +732,9 @@ static void add_sysinfo_interface_files(void)
 	 * interface_attrs attribute array
 	 */
 	sysinfo_device_attr_create(INTERFACE_AFFINITY_DOMAIN_VIA_VP_ATTR);
+
+	/* Add affinity_domain_via_domain attribute in the interface_attrs attribute array */
+	sysinfo_device_attr_create(INTERFACE_AFFINITY_DOMAIN_VIA_DOM_ATTR);
 }
 
 static int hv_gpci_init(void)
diff --git a/arch/powerpc/perf/hv-gpci.h b/arch/powerpc/perf/hv-gpci.h
index c88599fbcaa5..f01c4716ac33 100644
--- a/arch/powerpc/perf/hv-gpci.h
+++ b/arch/powerpc/perf/hv-gpci.h
@@ -27,12 +27,14 @@ enum {
 #define PROCESSOR_BUS_TOPOLOGY	0XD0
 #define PROCESSOR_CONFIG	0X90
 #define AFFINITY_DOMAIN_VIA_VP	0xA0 /* affinity domain via virtual processor */
+#define AFFINITY_DOMAIN_VIA_DOM	0xB0 /* affinity domain via domain */
 
 /* Interface attribute array index to store system information */
 #define INTERFACE_PROCESSOR_BUS_TOPOLOGY_ATTR	6
 #define INTERFACE_PROCESSOR_CONFIG_ATTR		7
 #define INTERFACE_AFFINITY_DOMAIN_VIA_VP_ATTR	8
-#define INTERFACE_NULL_ATTR			9
+#define INTERFACE_AFFINITY_DOMAIN_VIA_DOM_ATTR	9
+#define INTERFACE_NULL_ATTR			10
 
 #define REQUEST_FILE "../hv-gpci-requests.h"
 #define NAME_LOWER hv_gpci
-- 
2.35.3

