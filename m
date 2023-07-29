Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F715767CDA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 09:40:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gVkOQldf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RCbyd21msz3dH6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 17:40:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gVkOQldf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RCbvJ5j1jz3d8D
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jul 2023 17:37:48 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36T7Vfms003017;
	Sat, 29 Jul 2023 07:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Eez4ps/egQlGxI4EQPMwQ44jJGzglimRszD7GFVOFPE=;
 b=gVkOQldfISo3WcbJ4STWXz736we9ovP6tGBFFLv24AbcggFWvqEjSj8sCjV/FKa1Xksm
 TAt17BdR9W38asRn8xNh9dW3LA5iJZq9aKtp/11hCccoGSFCifmXpfKVItWFNaPdERcH
 KSqadugzKGDzj6tZBSrbpTohCiWTlDIBvEmbGrfr5DyYFS0bCdODPfXD2YKJ+zF8RCNW
 DSnrWmLljE2E2xRfB/Ag7x2/fYYC3JKFwXCJzXHTfwyYckMsOhLqk6fHCLbezBcFkC1V
 bP0/mG1DB9ddiszniWbbtdXQ1z/x7/f9GEC6dNL3Mh0DqdCedka2jIa/F41k3LH7pB+F 1g== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s4xf085bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jul 2023 07:35:21 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36T77QeL002024;
	Sat, 29 Jul 2023 07:35:20 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s0tenvrbg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jul 2023 07:35:20 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36T7ZGi815336080
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 29 Jul 2023 07:35:16 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BB3532004E;
	Sat, 29 Jul 2023 07:35:16 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 64A7D20040;
	Sat, 29 Jul 2023 07:35:14 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.171.60.192])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 29 Jul 2023 07:35:14 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v4 01/10] powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show processor bus topology information
Date: Sat, 29 Jul 2023 13:04:46 +0530
Message-Id: <20230729073455.7918-2-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230729073455.7918-1-kjain@linux.ibm.com>
References: <20230729073455.7918-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QOREMBA5RQHskEx76Ih9xutBVDuTTW0l
X-Proofpoint-GUID: QOREMBA5RQHskEx76Ih9xutBVDuTTW0l
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

Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
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
+		attr->attr.name = "processor_bus_topology";
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
2.39.3

