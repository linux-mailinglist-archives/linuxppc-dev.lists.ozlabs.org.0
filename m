Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91819767CD5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 09:38:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UEOU4hIh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RCbwZ3XV9z3dHn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 17:38:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UEOU4hIh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RCbs13nrmz3cRd
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jul 2023 17:35:49 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36T7Vd3h002899;
	Sat, 29 Jul 2023 07:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lwwBgQuDYZpc32iqdJ5vsmUCoFWugm6cdc3BZhEyaBI=;
 b=UEOU4hIhu+G+QczdXXjuVs3q57LS+t43+fgDhOiPmog4ZhYcRu+/RoDYjPpJc3w0/eUS
 9v41pn4hjohehViK3c78mkBpe6F3znoMWUpfEows8SZXfJTNAArnR2PMrWkS1lzSoCuq
 bc1f8WaJFuWaAf0gBm0WCfVmPq+ZH7atajgqB5Y3DwrESaYaUDhPQXqqzSkbDV4U1eoQ
 JEtY9+0F/jZN1N5HVFfRvJegPgnXWqYAbSIde8vdYXwPNTS7otDV1mDvJZZQUvi0gEKO
 DXyFyPttU6pm9ivDQkGHY+aEsXW9Ka5J/UIviYai6Odbc3eOSQCVgNOW+72FUowm1vkV OA== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s4xf085x3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jul 2023 07:35:43 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36T6AJuM002379;
	Sat, 29 Jul 2023 07:35:41 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s0unkcbu2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jul 2023 07:35:41 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36T7ZcPh60490124
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 29 Jul 2023 07:35:38 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 422E120043;
	Sat, 29 Jul 2023 07:35:38 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C28C20040;
	Sat, 29 Jul 2023 07:35:36 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.171.60.192])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 29 Jul 2023 07:35:35 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v4 09/10] powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show affinity domain via partition information
Date: Sat, 29 Jul 2023 13:04:54 +0530
Message-Id: <20230729073455.7918-10-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230729073455.7918-1-kjain@linux.ibm.com>
References: <20230729073455.7918-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Qfc2I3r_L27rVq9uEq5bBbP5lMu57Zdm
X-Proofpoint-GUID: Qfc2I3r_L27rVq9uEq5bBbP5lMu57Zdm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 spamscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 phishscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307290068
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

Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
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

