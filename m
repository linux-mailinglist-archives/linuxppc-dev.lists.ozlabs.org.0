Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE2F218312
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 11:02:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1tbm0pk1zDr6K
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 19:02:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1tYX1HqlzDqP1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 19:00:15 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06882H7V180675; Wed, 8 Jul 2020 05:00:09 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3257fsp940-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 05:00:09 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0688xrIS030367;
 Wed, 8 Jul 2020 09:00:07 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 322hd7vc7c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 09:00:07 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 068904mC64422084
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jul 2020 09:00:05 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D458F52069;
 Wed,  8 Jul 2020 09:00:04 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.77.206.155])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 05A5B52067;
 Wed,  8 Jul 2020 09:00:02 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v4 1/2] powerpc/perf/hv-24x7: Add cpu hotplug support
Date: Wed,  8 Jul 2020 14:29:54 +0530
Message-Id: <20200708085955.655686-2-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200708085955.655686-1-kjain@linux.ibm.com>
References: <20200708085955.655686-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_04:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 cotscore=-2147483648
 phishscore=0 clxscore=1015 spamscore=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2007080053
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

