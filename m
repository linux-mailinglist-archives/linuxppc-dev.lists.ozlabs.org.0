Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C26561FF1E7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 14:33:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nhFH6VDgzDrGp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 22:33:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nh5y07J8zDqHH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 22:27:33 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05IC2FPE027011; Thu, 18 Jun 2020 08:27:27 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31r589nsp5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 08:27:27 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05IBxnfZ003596;
 Thu, 18 Jun 2020 12:27:25 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 31quax92hd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Jun 2020 12:27:25 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05ICRMKw64094208
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Jun 2020 12:27:22 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04D08A4053;
 Thu, 18 Jun 2020 12:27:22 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BB4DA4040;
 Thu, 18 Jun 2020 12:27:20 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.79.212.206])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 18 Jun 2020 12:27:20 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 1/2] powerpc/perf/hv-24x7: Add cpu hotplug support
Date: Thu, 18 Jun 2020 17:57:12 +0530
Message-Id: <20200618122713.9030-2-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200618122713.9030-1-kjain@linux.ibm.com>
References: <20200618122713.9030-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-18_11:2020-06-18,
 2020-06-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 cotscore=-2147483648 mlxscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=999 malwarescore=0 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006180089
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
Cc: nathanl@linux.ibm.com, kjain@linux.ibm.com, suka@us.ibm.com,
 maddy@linux.vnet.ibm.com, anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch here adds cpu hotplug functions to hv_24x7 pmu.
A new cpuhp_state "CPUHP_AP_PERF_POWERPC_HV_24x7_ONLINE" enum
is added.

The online function update the cpumask only if its NULL.
As the primary intention for adding hotplug support
is to desiginate a CPU to make HCALL to collect the
count data.

The offline function test and clear corresponding cpu in a cpumask
and update cpumask to any other active cpu.

With this patchset, perf tool side does not need "-C <cpu>"
to be added.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/hv-24x7.c | 45 +++++++++++++++++++++++++++++++++++++
 include/linux/cpuhotplug.h  |  1 +
 2 files changed, 46 insertions(+)

diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index db213eb7cb02..fdc4ae155d60 100644
--- a/arch/powerpc/perf/hv-24x7.c
+++ b/arch/powerpc/perf/hv-24x7.c
@@ -31,6 +31,8 @@ static int interface_version;
 /* Whether we have to aggregate result data for some domains. */
 static bool aggregate_result_elements;
 
+static cpumask_t hv_24x7_cpumask;
+
 static bool domain_is_valid(unsigned domain)
 {
 	switch (domain) {
@@ -1641,6 +1643,44 @@ static struct pmu h_24x7_pmu = {
 	.capabilities = PERF_PMU_CAP_NO_EXCLUDE,
 };
 
+static int ppc_hv_24x7_cpu_online(unsigned int cpu)
+{
+	/* Make this CPU the designated target for counter collection */
+	if (cpumask_empty(&hv_24x7_cpumask))
+		cpumask_set_cpu(cpu, &hv_24x7_cpumask);
+
+	return 0;
+}
+
+static int ppc_hv_24x7_cpu_offline(unsigned int cpu)
+{
+	int target = -1;
+
+	/* Check if exiting cpu is used for collecting 24x7 events */
+	if (!cpumask_test_and_clear_cpu(cpu, &hv_24x7_cpumask))
+		return 0;
+
+	/* Find a new cpu to collect 24x7 events */
+	target = cpumask_any_but(cpu_active_mask, cpu);
+
+	if (target < 0 || target >= nr_cpu_ids)
+		return -1;
+
+	/* Migrate 24x7 events to the new target */
+	cpumask_set_cpu(target, &hv_24x7_cpumask);
+	perf_pmu_migrate_context(&h_24x7_pmu, cpu, target);
+
+	return 0;
+}
+
+static int hv_24x7_cpu_hotplug_init(void)
+{
+	return cpuhp_setup_state(CPUHP_AP_PERF_POWERPC_HV_24x7_ONLINE,
+			  "perf/powerpc/hv_24x7:online",
+			  ppc_hv_24x7_cpu_online,
+			  ppc_hv_24x7_cpu_offline);
+}
+
 static int hv_24x7_init(void)
 {
 	int r;
@@ -1685,6 +1725,11 @@ static int hv_24x7_init(void)
 	if (r)
 		return r;
 
+	/* init cpuhotplug */
+	r = hv_24x7_cpu_hotplug_init();
+	if (r)
+		pr_err("hv_24x7: CPU hotplug init failed\n");
+
 	r = perf_pmu_register(&h_24x7_pmu, h_24x7_pmu.name, -1);
 	if (r)
 		return r;
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 8377afef8806..16ed8f6f8774 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -180,6 +180,7 @@ enum cpuhp_state {
 	CPUHP_AP_PERF_POWERPC_CORE_IMC_ONLINE,
 	CPUHP_AP_PERF_POWERPC_THREAD_IMC_ONLINE,
 	CPUHP_AP_PERF_POWERPC_TRACE_IMC_ONLINE,
+	CPUHP_AP_PERF_POWERPC_HV_24x7_ONLINE,
 	CPUHP_AP_WATCHDOG_ONLINE,
 	CPUHP_AP_WORKQUEUE_ONLINE,
 	CPUHP_AP_RCUTREE_ONLINE,
-- 
2.18.2

