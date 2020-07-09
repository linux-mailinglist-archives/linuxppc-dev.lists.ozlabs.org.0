Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 833922197CC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 07:21:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2Pfm4C9SzDqx5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 15:21:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2Pbg38nQzDqY3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 15:18:55 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06951xcT091216; Thu, 9 Jul 2020 01:18:51 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 325uqv1m9p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 01:18:50 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0695F53B025262;
 Thu, 9 Jul 2020 05:18:48 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04ams.nl.ibm.com with ESMTP id 325u41030m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 05:18:48 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0695Ijd339780486
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 05:18:45 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0E0BA4062;
 Thu,  9 Jul 2020 05:18:45 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F4BEA405F;
 Thu,  9 Jul 2020 05:18:44 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.79.221.181])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jul 2020 05:18:43 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 1/2] powerpc/perf/hv-24x7: Add cpu hotplug support
Date: Thu,  9 Jul 2020 10:48:35 +0530
Message-Id: <20200709051836.723765-2-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200709051836.723765-1-kjain@linux.ibm.com>
References: <20200709051836.723765-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-09_01:2020-07-08,
 2020-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007090034
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
Cc: nathanl@linux.ibm.com, ego@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com,
 kjain@linux.ibm.com, suka@us.ibm.com, anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch here adds cpu hotplug functions to hv_24x7 pmu.
A new cpuhp_state "CPUHP_AP_PERF_POWERPC_HV_24x7_ONLINE" enum
is added.

The online callback function updates the cpumask only if its
empty. As the primary intention of adding hotplug support
is to designate a CPU to make HCALL to collect the
counter data.

The offline function test and clear corresponding cpu in a cpumask
and update cpumask to any other active cpu.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 arch/powerpc/perf/hv-24x7.c | 46 +++++++++++++++++++++++++++++++++++++
 include/linux/cpuhotplug.h  |  1 +
 2 files changed, 47 insertions(+)

diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
index db213eb7cb02..93b4700dcf8c 100644
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
@@ -1641,6 +1643,45 @@ static struct pmu h_24x7_pmu = {
 	.capabilities = PERF_PMU_CAP_NO_EXCLUDE,
 };
 
+static int ppc_hv_24x7_cpu_online(unsigned int cpu)
+{
+	if (cpumask_empty(&hv_24x7_cpumask))
+		cpumask_set_cpu(cpu, &hv_24x7_cpumask);
+
+	return 0;
+}
+
+static int ppc_hv_24x7_cpu_offline(unsigned int cpu)
+{
+	int target;
+
+	/* Check if exiting cpu is used for collecting 24x7 events */
+	if (!cpumask_test_and_clear_cpu(cpu, &hv_24x7_cpumask))
+		return 0;
+
+	/* Find a new cpu to collect 24x7 events */
+	target = cpumask_last(cpu_active_mask);
+
+	if (target < 0 || target >= nr_cpu_ids) {
+		pr_err("hv_24x7: CPU hotplug init failed\n");
+		return -1;
+	}
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
@@ -1685,6 +1726,11 @@ static int hv_24x7_init(void)
 	if (r)
 		return r;
 
+	/* init cpuhotplug */
+	r = hv_24x7_cpu_hotplug_init();
+	if (r)
+		return r;
+
 	r = perf_pmu_register(&h_24x7_pmu, h_24x7_pmu.name, -1);
 	if (r)
 		return r;
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 191772d4a4d7..a2710e654b64 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -181,6 +181,7 @@ enum cpuhp_state {
 	CPUHP_AP_PERF_POWERPC_CORE_IMC_ONLINE,
 	CPUHP_AP_PERF_POWERPC_THREAD_IMC_ONLINE,
 	CPUHP_AP_PERF_POWERPC_TRACE_IMC_ONLINE,
+	CPUHP_AP_PERF_POWERPC_HV_24x7_ONLINE,
 	CPUHP_AP_WATCHDOG_ONLINE,
 	CPUHP_AP_WORKQUEUE_ONLINE,
 	CPUHP_AP_RCUTREE_ONLINE,
-- 
2.26.2

