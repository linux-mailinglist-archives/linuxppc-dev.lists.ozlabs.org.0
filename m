Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1AE74D17A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 11:29:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ha613Eob;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QzzGv3tkRz3bw4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 19:29:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ha613Eob;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QzzF10dsdz30fs
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 19:27:48 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36A9Gvmh014036;
	Mon, 10 Jul 2023 09:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=E8jQwV0XLWYuAmjuhZ5SEiv2073DwNQraq5nrcLiMxA=;
 b=ha613EobFNkES3Mn/apFKWzLUZq0CuOeztKCQMMZz6QRF4nNhjTBibT8R7U3vvlQMpIJ
 J06pJ1YMjLb+V2szpdlwE/FC5RfwaWE8IlQ8lHhWZG857n3p8/HZ4H4g9XjujXl8zoSr
 TCsWT4s9oumHJXrTUsoLyeArJIlqYH6swUt5qGpC6ost6zy95SbVHCENNHb3hMinl984
 pyM2/CKLng3x6Baqca/A9/xphG6Ttq6OalQrEwyqmeAvsndy7fuSSigkcZrOyNn+wALG
 xJNfAxCWy0JjXpqG6JIKzAo6kM6dOZQmHRWB0c+PbT13JdJLDINfqxgJywDngWne5Jgk yQ== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rrf7hr76v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jul 2023 09:27:43 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36A9IYkf018867;
	Mon, 10 Jul 2023 09:27:41 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3rpye50u99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jul 2023 09:27:41 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36A9RcJJ49545706
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Jul 2023 09:27:38 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1AD4920043;
	Mon, 10 Jul 2023 09:27:38 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D6A0C20040;
	Mon, 10 Jul 2023 09:27:35 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.85.154])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Jul 2023 09:27:35 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 01/10] powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show processor bus topology information
Date: Mon, 10 Jul 2023 14:57:08 +0530
Message-Id: <20230710092717.55317-2-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230710092717.55317-1-kjain@linux.ibm.com>
References: <20230710092717.55317-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Ju94v5oWmD1jevc5phsUN3PZEyYmfP8g
X-Proofpoint-GUID: Ju94v5oWmD1jevc5phsUN3PZEyYmfP8g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_07,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
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
PROCESSOR_BUS_TOPOLOGY(0XD0), can be used to get the system
topology information. To expose the system topology information,
patch adds sysfs file called "processor_bus_topology" to the
"/sys/devices/hv_gpci/interface/" of hv_gpci pmu driver.

Add macro for PROCESSOR_BUS_TOPOLOGY counter request value
in hv-gpci.c file. Also add a new function called
"systeminfo_gpci_request", to make the H_GET_PERF_COUNTER_INFO hcall
with added macro and populates the output buffer.

The processor_bus_topology sysfs file is only available for power10
and above platforms. Add a new function called
"add_sysinfo_interface_files", which will add processor_bus_topology
attribute in the interface_attrs array, only for power10 and
above platforms.
Also add macro INTERFACE_PROCESSOR_BUS_TOPOLOGY_ATTR in hv-gpci.c
file, which points to the index of NULL placefolder, for
processor_bus_topology attribute.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/hv-gpci.c | 184 +++++++++++++++++++++++++++++++++++-
 1 file changed, 182 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
index 7ff8ff3509f5..225f148f75fd 100644
--- a/arch/powerpc/perf/hv-gpci.c
+++ b/arch/powerpc/perf/hv-gpci.c
@@ -102,6 +102,141 @@ static ssize_t cpumask_show(struct device *dev,
 	return cpumap_print_to_pagebuf(true, buf, &hv_gpci_cpumask);
 }
 
+/* Counter request value to retrieve system information */
+#define PROCESSOR_BUS_TOPOLOGY 0XD0
+
+/* Interface attribute array index to store system information */
+#define INTERFACE_PROCESSOR_BUS_TOPOLOGY_ATTR	6
+
+static DEFINE_PER_CPU(char, hv_gpci_reqb[HGPCI_REQ_BUFFER_SIZE]) __aligned(sizeof(uint64_t));
+
+static unsigned long systeminfo_gpci_request(u32 req, u32 starting_index,
+			u16 secondary_index, char *buf,
+			size_t *n, struct hv_gpci_request_buffer *arg)
+{
+	unsigned long ret;
+	size_t i, j;
+
+	arg->params.counter_request = cpu_to_be32(req);
+	arg->params.starting_index = cpu_to_be32(starting_index);
+	arg->params.secondary_index = cpu_to_be16(secondary_index);
+
+	ret = plpar_hcall_norets(H_GET_PERF_COUNTER_INFO,
+			virt_to_phys(arg), HGPCI_REQ_BUFFER_SIZE);
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
+	if (ret && (ret != H_PARAMETER))
+		return -EIO;
+
+	/*
+	 * hcall H_GET_PERF_COUNTER_INFO populates the 'returned_values'
+	 * to show the total number of counter_value array elements
+	 * returned via hcall.
+	 * hcall also populates 'cv_element_size' corresponds to individual
+	 * counter_value array element size. Below loop go through all
+	 * counter_value array elements as per their size and add it to
+	 * the output buffer.
+	 */
+	for (i = 0; i < be16_to_cpu(arg->params.returned_values); i++) {
+		j = i * be16_to_cpu(arg->params.cv_element_size);
+
+		for (; j < (i + 1) * be16_to_cpu(arg->params.cv_element_size); j++)
+			*n += sprintf(buf + *n,  "%02x", (u8)arg->bytes[j]);
+		*n += sprintf(buf + *n,  "\n");
+	}
+
+	if (*n >= PAGE_SIZE) {
+		pr_info("System information exceeds PAGE_SIZE\n");
+		return -EFBIG;
+	}
+
+	return ret;
+}
+
+static ssize_t processor_bus_topology_show(struct device *dev, struct device_attribute *attr,
+				char *buf)
+{
+	struct hv_gpci_request_buffer *arg;
+	unsigned long ret;
+	size_t n = 0;
+
+	arg = (void *)get_cpu_var(hv_gpci_reqb);
+	memset(arg, 0, HGPCI_REQ_BUFFER_SIZE);
+
+	/*
+	 * Pass the counter request value 0xD0 corresponds to request
+	 * type 'Processor_bus_topology', to retrieve
+	 * the system topology information.
+	 * starting_index value implies the starting hardware
+	 * chip id.
+	 */
+	ret = systeminfo_gpci_request(PROCESSOR_BUS_TOPOLOGY, 0, 0, buf, &n, arg);
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
+	 * returned. To handle that, we need to make subsequent requests
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
+		u32 starting_index = arg->bytes[last_element + 3] +
+				(arg->bytes[last_element + 2] << 8) +
+				(arg->bytes[last_element + 1] << 16) +
+				(arg->bytes[last_element] << 24) + 1;
+
+		memset(arg, 0, HGPCI_REQ_BUFFER_SIZE);
+
+		ret = systeminfo_gpci_request(PROCESSOR_BUS_TOPOLOGY, starting_index,
+				0, buf, &n, arg);
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
 
@@ -118,6 +253,11 @@ static struct attribute *interface_attrs[] = {
 	&hv_caps_attr_expanded.attr,
 	&hv_caps_attr_lab.attr,
 	&hv_caps_attr_collect_privileged.attr,
+	/*
+	 * This NULL is a placeholder for the processor_bus_topology
+	 * attribute, set in init function if applicable.
+	 */
+	NULL,
 	NULL,
 };
 
@@ -143,8 +283,6 @@ static const struct attribute_group *attr_groups[] = {
 	NULL,
 };
 
-static DEFINE_PER_CPU(char, hv_gpci_reqb[HGPCI_REQ_BUFFER_SIZE]) __aligned(sizeof(uint64_t));
-
 static unsigned long single_gpci_request(u32 req, u32 starting_index,
 		u16 secondary_index, u8 version_in, u32 offset, u8 length,
 		u64 *value)
@@ -325,6 +463,44 @@ static int hv_gpci_cpu_hotplug_init(void)
 			  ppc_hv_gpci_cpu_offline);
 }
 
+static void add_sysinfo_interface_files(void)
+{
+	struct device_attribute *attr = NULL;
+	unsigned long ret;
+	struct hv_gpci_request_buffer *arg;
+
+	/* Check for counter request type PROCESSOR_BUS_TOPOLOGY support */
+	arg = (void *)get_cpu_var(hv_gpci_reqb);
+	memset(arg, 0, HGPCI_REQ_BUFFER_SIZE);
+
+	arg->params.counter_request = cpu_to_be32(PROCESSOR_BUS_TOPOLOGY);
+
+	ret = plpar_hcall_norets(H_GET_PERF_COUNTER_INFO,
+			virt_to_phys(arg), HGPCI_REQ_BUFFER_SIZE);
+
+	put_cpu_var(hv_gpci_reqb);
+
+	/*
+	 * Add processor_bus_topology attribute in the interface_attrs
+	 * attribute array, only for valid return types.
+	 */
+	if (!ret || ret == H_AUTHORITY || ret == H_PARAMETER) {
+		attr = kzalloc(sizeof(*attr), GFP_KERNEL);
+
+		if (!attr) {
+			pr_info("Memory allocation failed for sysinfo interface files\n");
+			return;
+		}
+
+		sysfs_attr_init(&attr->attr);
+		attr->attr.name = "processor_bug_topology";
+		attr->attr.mode = 0444;
+		attr->show = processor_bus_topology_show;
+		interface_attrs[INTERFACE_PROCESSOR_BUS_TOPOLOGY_ATTR] = &attr->attr;
+	} else
+		pr_devel("hcall failed, with error: 0x%lx\n", ret);
+}
+
 static int hv_gpci_init(void)
 {
 	int r;
@@ -388,6 +564,10 @@ static int hv_gpci_init(void)
 	if (r)
 		return r;
 
+	/* sysinfo interface files are only available for power10 and above platforms */
+	if (PVR_VER(mfspr(SPRN_PVR)) >= PVR_POWER10)
+		add_sysinfo_interface_files();
+
 	return 0;
 }
 
-- 
2.31.1

