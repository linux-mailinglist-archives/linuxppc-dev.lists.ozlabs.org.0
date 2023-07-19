Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D342758DAB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 08:21:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j/bSbrVc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5Qgv14Kbz2ytq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 16:21:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j/bSbrVc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5QWc40Wzz30QJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 16:14:20 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36J63KVc025165;
	Wed, 19 Jul 2023 06:14:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=42q8tcMI7JhA4TKVAQZB3m5I5GoF85rzYlCmlazI2Us=;
 b=j/bSbrVcFb15tpqdvF6LsLJAOqUrcnzG6ijOCNXg7LTWeW5PG5y+7EpvX6fEjqRKn7LO
 fKrsBQkHbC+DA+jgjPmzJ1iCLnT6/yauxRZmIhhHJOSD8sE53aKarYw/C+rasDmXaw8u
 DW1SkhFwNXkclDFmGuGEJ+Bgl5u3dsJ6Wsa7etOj5Jb9UdNxONWVxNx5rR/gMKyuWmty
 pxHuvQGp0tdXKc7YmgOOqBjejcudzAeIGpma24AWCkT7dmJg9C1LtmL3rAquU1qjZJEx
 zPivNcvM3lAI+2+VJ28PxRP4sOVfETkb5W0qVx5IxI3vTS5RWT4kKB/qMUwsjPg+905J xg== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rxa7hrjvc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jul 2023 06:14:12 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36J4Fxpv003362;
	Wed, 19 Jul 2023 06:14:12 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3rv65xga34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jul 2023 06:14:12 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36J6E9gc41681598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Jul 2023 06:14:09 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 050AD2004B;
	Wed, 19 Jul 2023 06:14:09 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CAF0820040;
	Wed, 19 Jul 2023 06:14:01 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.119.126])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Jul 2023 06:14:01 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3 09/10] powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show affinity domain via partition information
Date: Wed, 19 Jul 2023 11:42:30 +0530
Message-Id: <20230719061231.631410-10-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230719061231.631410-1-kjain@linux.ibm.com>
References: <20230719061231.631410-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tcngsPwTF56rS1ImHLMqxC9jtCIzF-hL
X-Proofpoint-ORIG-GUID: tcngsPwTF56rS1ImHLMqxC9jtCIzF-hL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_02,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307190056
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, rdunlap@infradead.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
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
2.39.3

