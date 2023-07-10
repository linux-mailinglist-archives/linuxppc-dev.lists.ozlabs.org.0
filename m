Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 153D774D1BA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 11:36:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KiXthLH+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QzzQt71Fzz3cKs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 19:36:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KiXthLH+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QzzFP0R0sz3btZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 19:28:08 +1000 (AEST)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36A9FNAU020241;
	Mon, 10 Jul 2023 09:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=NAUHLA1EcZvpBRvcUgwiHS0gMYNaOKvxHO8HaKwpMio=;
 b=KiXthLH+5dforeSxpqIcDakbyYQhey/JVN08Y+T96qiOWF/PgPzSsE4+6GnctChdBfBR
 rrpQdEwtcd7KZQrY9Z/GbUSSnpUkA5KsxsK+VsEkRvtEocuoum3wwg3X5q5/lULIUQ2t
 JTBoxNgBQv7+MwrbBUQITfPp/jxj72YdSKYGNJJ5JQR5EeUh+rjkoMOru7pCsQhy++1r
 P202GlzcH6uYWYj3RYaMi5B2f/K+GNjlmg1zo2FXoz68RTI07hS5pVkpKn4Ohq+SNpTm
 UZ6vDv4MG+k2qOsD12V6IYaE2FRl3PgaBiHJA+spvG5ePIaxbxJEsdIgLRC3AIAvO1Cf Tw== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rrev2gwmr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jul 2023 09:28:03 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36A82F4r003429;
	Mon, 10 Jul 2023 09:28:02 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3rpye50ubc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jul 2023 09:28:01 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36A9RwrS20906706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Jul 2023 09:27:58 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 595552004D;
	Mon, 10 Jul 2023 09:27:58 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3580F20043;
	Mon, 10 Jul 2023 09:27:56 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.85.154])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Jul 2023 09:27:55 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 09/10] powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show affinity domain via partition information
Date: Mon, 10 Jul 2023 14:57:16 +0530
Message-Id: <20230710092717.55317-10-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230710092717.55317-1-kjain@linux.ibm.com>
References: <20230710092717.55317-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: mJb7uugBOMkJQRVmWbZpCJwhLP3Doqg8
X-Proofpoint-GUID: mJb7uugBOMkJQRVmWbZpCJwhLP3Doqg8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_07,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 priorityscore=1501 bulkscore=0 spamscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307100082
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The hcall H_GET_PERF_COUNTER_INFO with counter request value as
AFFINITY_DOMAIN_INFORMATION_BY_PARTITION(0XB1), can be used to get
the system affinity domain via partition information. To expose the system
affinity domain via partition information, patch adds sysfs file called
"affinity_domain_via_partition" to the "/sys/devices/hv_gpci/interface/"
of hv_gpci pmu driver.

Add new entry for AFFINITY_DOMAIN_VIA_PAR in sysinfo_counter_request
array, which points to the counter request value
"affinity_domain_via_partition" in hv-gpci.c file. Also add a
new function called "affinity_domain_via_partition_result_parse" to parse
the hcall result and store it in output buffer.

The affinity_domain_via_partition sysfs file is only available for power10
and above platforms. Add a macro called
INTERFACE_AFFINITY_DOMAIN_VIA_PAR_ATTR, which points to the index of NULL
placeholder, for affinity_domain_via_partition attribute in
interface_attrs array. Also updated the value of INTERFACE_NULL_ATTR
macro in hv-gpci.c file.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/hv-gpci.c | 160 +++++++++++++++++++++++++++++++++++-
 1 file changed, 159 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
index 326b758df7c8..f2fff166290b 100644
--- a/arch/powerpc/perf/hv-gpci.c
+++ b/arch/powerpc/perf/hv-gpci.c
@@ -107,7 +107,8 @@ static ssize_t cpumask_show(struct device *dev,
 #define INTERFACE_PROCESSOR_CONFIG_ATTR		7
 #define INTERFACE_AFFINITY_DOMAIN_VIA_VP_ATTR	8
 #define INTERFACE_AFFINITY_DOMAIN_VIA_DOM_ATTR	9
-#define INTERFACE_NULL_ATTR			10
+#define INTERFACE_AFFINITY_DOMAIN_VIA_PAR_ATTR	10
+#define INTERFACE_NULL_ATTR			11
 
 /* Counter request value to retrieve system information */
 enum {
@@ -115,6 +116,7 @@ enum {
 	PROCESSOR_CONFIG,
 	AFFINITY_DOMAIN_VIA_VP, /* affinity domain via virtual processor */
 	AFFINITY_DOMAIN_VIA_DOM, /* affinity domain via domain */
+	AFFINITY_DOMAIN_VIA_PAR, /* affinity domain via partition */
 };
 
 static int sysinfo_counter_request[] = {
@@ -122,6 +124,7 @@ static int sysinfo_counter_request[] = {
 	[PROCESSOR_CONFIG] = 0x90,
 	[AFFINITY_DOMAIN_VIA_VP] = 0xA0,
 	[AFFINITY_DOMAIN_VIA_DOM] = 0xB0,
+	[AFFINITY_DOMAIN_VIA_PAR] = 0xB1,
 };
 
 static DEFINE_PER_CPU(char, hv_gpci_reqb[HGPCI_REQ_BUFFER_SIZE]) __aligned(sizeof(uint64_t));
@@ -458,6 +461,152 @@ static ssize_t affinity_domain_via_domain_show(struct device *dev, struct device
 	return ret;
 }
 
+static void affinity_domain_via_partition_result_parse(int returned_values,
+			int element_size, char *buf, size_t *last_element,
+			size_t *n, struct hv_gpci_request_buffer *arg)
+{
+	size_t i = 0, j = 0;
+	size_t k, l, m;
+	uint16_t total_affinity_domain_ele, size_of_each_affinity_domain_ele;
+
+	/*
+	 * hcall H_GET_PERF_COUNTER_INFO populates the 'returned_values'
+	 * to show the total number of counter_value array elements
+	 * returned via hcall.
+	 * Unlike other request types, the data structure returned by this
+	 * request is variable-size. For this counter request type,
+	 * hcall populates 'cv_element_size' corresponds to minimum size of
+	 * the structure returned i.e; the size of the structure with no domain
+	 * information. Below loop go through all counter_value array
+	 * to determine the number and size of each domain array element and
+	 * add it to the output buffer.
+	 */
+	while (i < returned_values) {
+		k = j;
+		for (; k < j + element_size; k++)
+			*n += sprintf(buf + *n,  "%02x", (u8)arg->bytes[k]);
+		*n += sprintf(buf + *n,  "\n");
+
+		total_affinity_domain_ele = (u8)arg->bytes[k - 2] << 8 | (u8)arg->bytes[k - 3];
+		size_of_each_affinity_domain_ele = (u8)arg->bytes[k] << 8 | (u8)arg->bytes[k - 1];
+
+		for (l = 0; l < total_affinity_domain_ele; l++) {
+			for (m = 0; m < size_of_each_affinity_domain_ele; m++) {
+				*n += sprintf(buf + *n,  "%02x", (u8)arg->bytes[k]);
+				k++;
+			}
+			*n += sprintf(buf + *n,  "\n");
+		}
+
+		*n += sprintf(buf + *n,  "\n");
+		i++;
+		j = k;
+	}
+
+	*last_element = k;
+}
+
+static ssize_t affinity_domain_via_partition_show(struct device *dev, struct device_attribute *attr,
+							char *buf)
+{
+	struct hv_gpci_request_buffer *arg;
+	unsigned long ret;
+	size_t n = 0;
+	size_t last_element = 0;
+	u32 starting_index;
+
+	arg = (void *)get_cpu_var(hv_gpci_reqb);
+	memset(arg, 0, HGPCI_REQ_BUFFER_SIZE);
+
+	/*
+	 * Pass the counter request value 0xB1 corresponds to counter request
+	 * type 'Affinity_domain_information_by_partition',
+	 * to retrieve the system affinity domain by partition information.
+	 * starting_index value refers to the starting hardware
+	 * processor index.
+	 */
+	arg->params.counter_request = cpu_to_be32(sysinfo_counter_request[AFFINITY_DOMAIN_VIA_PAR]);
+	arg->params.starting_index = cpu_to_be32(0);
+
+	ret = plpar_hcall_norets(H_GET_PERF_COUNTER_INFO,
+			virt_to_phys(arg), HGPCI_REQ_BUFFER_SIZE);
+
+	if (!ret)
+		goto parse_result;
+
+	/*
+	 * ret value as 'H_PARAMETER' implies that the current buffer size
+	 * can't accommodate all the information, and a partial buffer
+	 * returned. To handle that, we need to make subsequent requests
+	 * with next starting index to retrieve additional (missing) data.
+	 * Below loop do subsequent hcalls with next starting index and add it
+	 * to buffer util we get all the information.
+	 */
+	while (ret == H_PARAMETER) {
+		affinity_domain_via_partition_result_parse(
+			be16_to_cpu(arg->params.returned_values) - 1,
+			be16_to_cpu(arg->params.cv_element_size), buf,
+			&last_element, &n, arg);
+
+		if (n >= PAGE_SIZE) {
+			put_cpu_var(hv_gpci_reqb);
+			pr_debug("System information exceeds PAGE_SIZE\n");
+			return -EFBIG;
+		}
+
+		/*
+		 * Since the starting index value is part of counter_value
+		 * buffer elements, use the starting_index value in the last
+		 * element and add 1 to make subsequent hcalls.
+		 */
+		starting_index = (u8)arg->bytes[last_element] << 8 |
+				(u8)arg->bytes[last_element + 1];
+
+		memset(arg, 0, HGPCI_REQ_BUFFER_SIZE);
+		arg->params.counter_request = cpu_to_be32(
+				sysinfo_counter_request[AFFINITY_DOMAIN_VIA_PAR]);
+		arg->params.starting_index = cpu_to_be32(starting_index);
+
+		ret = plpar_hcall_norets(H_GET_PERF_COUNTER_INFO,
+				virt_to_phys(arg), HGPCI_REQ_BUFFER_SIZE);
+
+		if (ret && (ret != H_PARAMETER))
+			goto out;
+	}
+
+parse_result:
+	affinity_domain_via_partition_result_parse(
+		be16_to_cpu(arg->params.returned_values),
+		be16_to_cpu(arg->params.cv_element_size),
+		buf, &last_element, &n, arg);
+
+	put_cpu_var(hv_gpci_reqb);
+	return n;
+
+out:
+	put_cpu_var(hv_gpci_reqb);
+
+	/*
+	 * ret value as 'H_PARAMETER' corresponds to 'GEN_BUF_TOO_SMALL',
+	 * which means that the current buffer size cannot accommodate
+	 * all the information and a partial buffer returned.
+	 * hcall fails incase of ret value other than H_SUCCESS or H_PARAMETER.
+	 *
+	 * ret value as H_AUTHORITY implies that partition is not permitted to retrieve
+	 * performance information, and required to set
+	 * "Enable Performance Information Collection" option.
+	 */
+	if (ret == H_AUTHORITY)
+		return -EPERM;
+
+	/*
+	 * hcall can fail with other possible ret value like H_PRIVILEGE/H_HARDWARE
+	 * because of invalid buffer-length/address or due to some hardware
+	 * error.
+	 */
+	return -EIO;
+}
+
 static DEVICE_ATTR_RO(kernel_version);
 static DEVICE_ATTR_RO(cpumask);
 
@@ -494,6 +643,11 @@ static struct attribute *interface_attrs[] = {
 	 * attribute, set in init function if applicable.
 	 */
 	NULL,
+	/*
+	 * This NULL is a placeholder for the affinity_domain_via_partition
+	 * attribute, set in init function if applicable.
+	 */
+	NULL,
 	NULL,
 };
 
@@ -755,6 +909,10 @@ static struct device_attribute *sysinfo_device_attr_create(int
 			attr->attr.name = "affinity_domain_via_domain";
 			attr->show = affinity_domain_via_domain_show;
 		break;
+		case INTERFACE_AFFINITY_DOMAIN_VIA_PAR_ATTR:
+			attr->attr.name = "affinity_domain_via_partition";
+			attr->show = affinity_domain_via_partition_show;
+		break;
 		}
 	} else
 		pr_devel("hcall failed, with error: 0x%lx\n", ret);
-- 
2.31.1

