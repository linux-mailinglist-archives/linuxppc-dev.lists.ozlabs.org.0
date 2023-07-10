Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A158174D182
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 11:32:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sg0OMZCV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QzzLt3wKdz3c4P
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 19:32:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sg0OMZCV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QzzFC0lXwz3btJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 19:27:58 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36A9GeAA022488;
	Mon, 10 Jul 2023 09:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=F8h5FNWhwjT6fljhjNeX3HFJRMijn6FwCAUU1wLR+EQ=;
 b=Sg0OMZCVvnvkpr/gVtjffCY+OiSv8rmd+DyZ/VXHpC0+sTjTC64WAXSDxO1rNl1veXkW
 UwpTNPmfI/DQBSV6xZmjc2MRRfU44PzImamqXGXmQwv0oDWVDmg1FC/WWG+/R35ifQMA
 lBL1MRgNoetMVh9aLB3HtVLa12yXyszHbPm0kPnUqNDe/eDt7uUU9lN3KzY40GSQmiT5
 yyRgZU46SeFkqCQPVR4vgrIbRNXQ7dssYOVC2N2VVda27XruVxy74hUYCekpDuriH4Ez
 0ibG4sPKVhae5Cp+4auhDKgXLKjcwSS4drUYCz4yThgVhWdIeDsJlPLW7K47V8PKA8Zi jQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rrf7dg7rs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jul 2023 09:27:53 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36A4oQFj031029;
	Mon, 10 Jul 2023 09:27:52 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3rpye59525-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Jul 2023 09:27:51 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36A9RmwT59376086
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Jul 2023 09:27:48 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 648902004B;
	Mon, 10 Jul 2023 09:27:48 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4EECE20040;
	Mon, 10 Jul 2023 09:27:46 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.85.154])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Jul 2023 09:27:46 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 05/10] powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show affinity domain via virtual processor information
Date: Mon, 10 Jul 2023 14:57:12 +0530
Message-Id: <20230710092717.55317-6-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230710092717.55317-1-kjain@linux.ibm.com>
References: <20230710092717.55317-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: boJT3p8K0BJ8YJNKRqUrHDLn8j7hdWhC
X-Proofpoint-ORIG-GUID: boJT3p8K0BJ8YJNKRqUrHDLn8j7hdWhC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-10_07,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307100082
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
2.31.1

