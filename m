Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA2A758DA8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 08:19:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pQsNxauZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R5Qf016F8z3cXm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 16:19:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pQsNxauZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R5QWG3yWFz3bjK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 16:14:02 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36J67YsX014695;
	Wed, 19 Jul 2023 06:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4sl2b5iAmXanGtWdgZo6horJnhw3N0QMCI9wFyVMvVw=;
 b=pQsNxauZqPOAyfWl4P1RDz8SQaS4QojO2cS9hyPo/ItX8soPU+VHi9W5mPF1p6vW04Bu
 hODUtNx3mZmx/3LU3fT4PgcRZkLGNs+khXb/8uiyUSLX5A+BSNaZsAu5ZboPYgvrTod2
 9OnTAOepTAi6JZWi7xY+2y7BQ61Rd3GXBK0bfUqkD51zhql/XI40uGNVclOrIUgLsOaL
 uxLxqmF5nUC0R6lnVriqWicWLJvHPVAfGqSTrnWyzrU+/gmMM+8sHLnXmKDwO+WaLO1k
 7OBahXwxATt7XOgrMPUNhI8gVvo5x0uusxMUsJG0GkjkIbMR0sTkuWfjDKTNXt+605pj Zg== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rx6hccd4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jul 2023 06:13:56 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36J5KR11004179;
	Wed, 19 Jul 2023 06:13:55 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rv8g110cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jul 2023 06:13:55 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36J6Dq3024380142
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Jul 2023 06:13:52 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B73720040;
	Wed, 19 Jul 2023 06:13:52 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE25320043;
	Wed, 19 Jul 2023 06:13:45 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.119.126])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Jul 2023 06:13:45 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v3 07/10] powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show affinity domain via domain information
Date: Wed, 19 Jul 2023 11:42:28 +0530
Message-Id: <20230719061231.631410-8-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230719061231.631410-1-kjain@linux.ibm.com>
References: <20230719061231.631410-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9k3ih43wJJpfAO08dFj0SYoZL-w3fqlI
X-Proofpoint-ORIG-GUID: 9k3ih43wJJpfAO08dFj0SYoZL-w3fqlI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_02,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 mlxscore=0 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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
AFFINITY_DOMAIN_INFORMATION_BY_DOMAIN(0XB0), can be used to get
the system affinity domain via domain information. To expose the system
affinity domain via domain information, patch adds sysfs file called
"affinity_domain_via_domain" to the "/sys/devices/hv_gpci/interface/"
of hv_gpci pmu driver.

Add new entry for AFFINITY_DOMAIN_VIA_DOM in sysinfo_counter_request
array, which points to the counter request value
"affinity_domain_via_domain" in hv-gpci.c file.

The affinity_domain_via_domain sysfs file is only available for power10
and above platforms. Add a macro called
INTERFACE_AFFINITY_DOMAIN_VIA_DOM_ATTR, which points to the index of NULL
placeholder, for affinity_domain_via_domain attribute in interface_attrs
array. Also updated the value of INTERFACE_NULL_ATTR macro in hv-gpci.c
file.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/hv-gpci.c | 80 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
index 68502cb18262..326b758df7c8 100644
--- a/arch/powerpc/perf/hv-gpci.c
+++ b/arch/powerpc/perf/hv-gpci.c
@@ -106,19 +106,22 @@ static ssize_t cpumask_show(struct device *dev,
 #define INTERFACE_PROCESSOR_BUS_TOPOLOGY_ATTR	6
 #define INTERFACE_PROCESSOR_CONFIG_ATTR		7
 #define INTERFACE_AFFINITY_DOMAIN_VIA_VP_ATTR	8
-#define INTERFACE_NULL_ATTR			9
+#define INTERFACE_AFFINITY_DOMAIN_VIA_DOM_ATTR	9
+#define INTERFACE_NULL_ATTR			10
 
 /* Counter request value to retrieve system information */
 enum {
 	PROCESSOR_BUS_TOPOLOGY,
 	PROCESSOR_CONFIG,
 	AFFINITY_DOMAIN_VIA_VP, /* affinity domain via virtual processor */
+	AFFINITY_DOMAIN_VIA_DOM, /* affinity domain via domain */
 };
 
 static int sysinfo_counter_request[] = {
 	[PROCESSOR_BUS_TOPOLOGY] = 0xD0,
 	[PROCESSOR_CONFIG] = 0x90,
 	[AFFINITY_DOMAIN_VIA_VP] = 0xA0,
+	[AFFINITY_DOMAIN_VIA_DOM] = 0xB0,
 };
 
 static DEFINE_PER_CPU(char, hv_gpci_reqb[HGPCI_REQ_BUFFER_SIZE]) __aligned(sizeof(uint64_t));
@@ -389,6 +392,72 @@ static ssize_t affinity_domain_via_virtual_processor_show(struct device *dev,
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
+	ret = systeminfo_gpci_request(sysinfo_counter_request[AFFINITY_DOMAIN_VIA_DOM],
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
+		ret = systeminfo_gpci_request(sysinfo_counter_request[AFFINITY_DOMAIN_VIA_DOM],
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
 
@@ -420,6 +489,11 @@ static struct attribute *interface_attrs[] = {
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
 
@@ -677,6 +751,10 @@ static struct device_attribute *sysinfo_device_attr_create(int
 			attr->attr.name = "affinity_domain_via_virtual_processor";
 			attr->show = affinity_domain_via_virtual_processor_show;
 		break;
+		case INTERFACE_AFFINITY_DOMAIN_VIA_DOM_ATTR:
+			attr->attr.name = "affinity_domain_via_domain";
+			attr->show = affinity_domain_via_domain_show;
+		break;
 		}
 	} else
 		pr_devel("hcall failed, with error: 0x%lx\n", ret);
-- 
2.39.3

