Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 312C2767D00
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 09:58:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WLZtDB+t;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RCcM00gzbz3c7s
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jul 2023 17:58:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WLZtDB+t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RCcKP5r97z2ygx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jul 2023 17:56:57 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36T7cUVb000385;
	Sat, 29 Jul 2023 07:56:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=QzEourZELW4rJpn7fc91WRiILgdvOdX7QlygmsrF3xQ=;
 b=WLZtDB+tllDFXdL5n341jjfAhGHh/HV4TCX/DIvqEXs6+4AzEFUr9VGsb+qf4lnwqO5L
 YZIZ3HqSIgAmHW8O2/jgejhcM4NSbC/jj5oe6k0E56dUSqyOS2RaawEPqHgAYOP+Ez28
 2ov9PsghWHX4W4uxvfYliIB4ye8VlEREZDy/e590qkZMnRHIwwXVQrQR2Sen3ISNxA2M
 AmUwgUrtg0k8zckoGmgjr4bFoafFa8fgJo7Sp3QGw2Hk2vsuAVrw9ohE+Mz/Eb2deFKd
 uMmwLnuOEEqJmLMGXd+THocQkAdo2zRf879Lj9yQPTOgiTC8PmN+Vv35IPTYPnloTk6n xA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s4w4phh5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jul 2023 07:56:48 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36T6JBGe016569;
	Sat, 29 Jul 2023 07:35:30 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3s0v52476v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 29 Jul 2023 07:35:30 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36T7ZRuq15205030
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 29 Jul 2023 07:35:27 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9DB7320040;
	Sat, 29 Jul 2023 07:35:27 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 596E52004E;
	Sat, 29 Jul 2023 07:35:25 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.171.60.192])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 29 Jul 2023 07:35:25 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v4 05/10] powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show affinity domain via virtual processor information
Date: Sat, 29 Jul 2023 13:04:50 +0530
Message-Id: <20230729073455.7918-6-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230729073455.7918-1-kjain@linux.ibm.com>
References: <20230729073455.7918-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 95ZUGtqK2Pb6kWFPIfz2ZPu79htDY_yg
X-Proofpoint-ORIG-GUID: 95ZUGtqK2Pb6kWFPIfz2ZPu79htDY_yg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
AFFINITY_DOMAIN_INFORMATION_BY_VIRTUAL_PROCESSOR(0XA0), can be used to get
the system affinity domain via virtual processor information. To expose
the system affinity domain via virtual processor information, patch adds
sysfs file called "affinity_domain_via_virtual_processor" to the
"/sys/devices/hv_gpci/interface/" of hv_gpci pmu driver.

The affinity_domain_via_virtual_processor sysfs file is only available for
power10 and above platforms. Add a macro called
INTERFACE_AFFINITY_DOMAIN_VIA_VP_ATTR, which points to the index of NULL
placeholder, for affinity_domain_via_virtual_processor attribute in
interface_attrs array. Also updated the value of INTERFACE_NULL_ATTR macro
in hv-gpci.c file.

Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/hv-gpci.c | 86 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
index c74076d3c7a7..68502cb18262 100644
--- a/arch/powerpc/perf/hv-gpci.c
+++ b/arch/powerpc/perf/hv-gpci.c
@@ -105,17 +105,20 @@ static ssize_t cpumask_show(struct device *dev,
 /* Interface attribute array index to store system information */
 #define INTERFACE_PROCESSOR_BUS_TOPOLOGY_ATTR	6
 #define INTERFACE_PROCESSOR_CONFIG_ATTR		7
-#define INTERFACE_NULL_ATTR			8
+#define INTERFACE_AFFINITY_DOMAIN_VIA_VP_ATTR	8
+#define INTERFACE_NULL_ATTR			9
 
 /* Counter request value to retrieve system information */
 enum {
 	PROCESSOR_BUS_TOPOLOGY,
-	PROCESSOR_CONFIG
+	PROCESSOR_CONFIG,
+	AFFINITY_DOMAIN_VIA_VP, /* affinity domain via virtual processor */
 };
 
 static int sysinfo_counter_request[] = {
 	[PROCESSOR_BUS_TOPOLOGY] = 0xD0,
 	[PROCESSOR_CONFIG] = 0x90,
+	[AFFINITY_DOMAIN_VIA_VP] = 0xA0,
 };
 
 static DEFINE_PER_CPU(char, hv_gpci_reqb[HGPCI_REQ_BUFFER_SIZE]) __aligned(sizeof(uint64_t));
@@ -316,6 +319,76 @@ static ssize_t processor_config_show(struct device *dev, struct device_attribute
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
+	ret = systeminfo_gpci_request(sysinfo_counter_request[AFFINITY_DOMAIN_VIA_VP],
+			0, 0, buf, &n, arg);
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
+		ret = systeminfo_gpci_request(sysinfo_counter_request[AFFINITY_DOMAIN_VIA_VP],
+				starting_index, secondary_index, buf, &n, arg);
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
 
@@ -342,6 +415,11 @@ static struct attribute *interface_attrs[] = {
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
 
@@ -595,6 +673,10 @@ static struct device_attribute *sysinfo_device_attr_create(int
 			attr->attr.name = "processor_config";
 			attr->show = processor_config_show;
 		break;
+		case INTERFACE_AFFINITY_DOMAIN_VIA_VP_ATTR:
+			attr->attr.name = "affinity_domain_via_virtual_processor";
+			attr->show = affinity_domain_via_virtual_processor_show;
+		break;
 		}
 	} else
 		pr_devel("hcall failed, with error: 0x%lx\n", ret);
-- 
2.39.3

