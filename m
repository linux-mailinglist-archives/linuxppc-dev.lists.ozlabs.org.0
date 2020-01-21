Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F5A143B0D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 11:31:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4824bJ4C7DzDqQQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 21:31:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=anju@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4824JP3Q5mzDqS2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 21:19:01 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00LAIqTm111526
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 05:18:58 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xmg38v980-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 05:18:55 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <anju@linux.vnet.ibm.com>;
 Tue, 21 Jan 2020 10:17:42 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 21 Jan 2020 10:17:39 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 00LAHcBV30343432
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jan 2020 10:17:38 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBD3BA4069;
 Tue, 21 Jan 2020 10:17:38 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 630F7A405B;
 Tue, 21 Jan 2020 10:17:37 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.62.176])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jan 2020 10:17:37 +0000 (GMT)
From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2 3/5] powerpc/perf: Add an interface sub-folder to imc pmu
Date: Tue, 21 Jan 2020 15:47:26 +0530
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200121101728.14858-1-anju@linux.vnet.ibm.com>
References: <20200121101728.14858-1-anju@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20012110-4275-0000-0000-000003998C21
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20012110-4276-0000-0000-000038AD9412
Message-Id: <20200121101728.14858-4-anju@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-21_02:2020-01-21,
 2020-01-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=1 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-1910280000
 definitions=main-2001210088
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
Cc: nasastry@in.ibm.com, maddy@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Madhavan Srinivasan <maddy@linux.ibm.com>

Patch adds an interface attribute folder to imc pmu.
This is intended to include pmu intreface capabilities
which will be useful to userspace likes selftest
testcases. Patch adds a "glob_lck" file to notify to
userspace of global lock mechanism added to imc devices
like core, thread and trace.

"glob_lck" will be used by selftest file to execute
interface test for the global lock mechanism.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 arch/powerpc/include/asm/imc-pmu.h | 11 ++++++-----
 arch/powerpc/perf/imc-pmu.c        | 19 +++++++++++++++++++
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/imc-pmu.h b/arch/powerpc/include/asm/imc-pmu.h
index 4da4fcba0684..1b2c33c30e7c 100644
--- a/arch/powerpc/include/asm/imc-pmu.h
+++ b/arch/powerpc/include/asm/imc-pmu.h
@@ -87,8 +87,9 @@ struct trace_imc_data {
 /* Event attribute array index */
 #define IMC_FORMAT_ATTR		0
 #define IMC_EVENT_ATTR		1
-#define IMC_CPUMASK_ATTR	2
-#define IMC_NULL_ATTR		3
+#define IMC_INTERFACE_ATTR	2
+#define IMC_CPUMASK_ATTR	3
+#define IMC_NULL_ATTR		4
 
 /* PMU Format attribute macros */
 #define IMC_EVENT_OFFSET_MASK	0xffffffffULL
@@ -114,10 +115,10 @@ struct imc_pmu {
 	/*
 	 * Attribute groups for the PMU. Slot 0 used for
 	 * format attribute, slot 1 used for cpusmask attribute,
-	 * slot 2 used for event attribute. Slot 3 keep as
-	 * NULL.
+	 * slot 2 used for event attribute. Slot 3 used for interface
+	 * attribute and Slot 4 is NULL.
 	 */
-	const struct attribute_group *attr_groups[4];
+	const struct attribute_group *attr_groups[5];
 	u32 counter_mem_size;
 	int domain;
 	/*
diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index 2e220f199530..3f49664f29f1 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -54,6 +54,24 @@ static struct imc_pmu_ref imc_global_refc = {
 	.refc = 0,
 };
 
+static ssize_t glob_lck_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	return sprintf(buf, "%d\n", 1);
+}
+
+static DEVICE_ATTR_RO(glob_lck);
+
+static struct attribute *imc_interface_attrs[] = {
+	&dev_attr_glob_lck.attr,
+	NULL,
+};
+
+static struct attribute_group imc_interface_group = {
+	.name = "interface",
+	.attrs = imc_interface_attrs,
+};
+
 static struct imc_pmu *imc_event_to_pmu(struct perf_event *event)
 {
 	return container_of(event->pmu, struct imc_pmu, pmu);
@@ -1462,6 +1480,7 @@ static int update_pmu_ops(struct imc_pmu *pmu)
 	pmu->pmu.attr_groups = pmu->attr_groups;
 	pmu->pmu.capabilities = PERF_PMU_CAP_NO_EXCLUDE;
 	pmu->attr_groups[IMC_FORMAT_ATTR] = &imc_format_group;
+	pmu->attr_groups[IMC_INTERFACE_ATTR] = &imc_interface_group;
 
 	switch (pmu->domain) {
 	case IMC_DOMAIN_NEST:
-- 
2.20.1

