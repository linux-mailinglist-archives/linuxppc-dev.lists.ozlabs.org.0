Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 866D1282236
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Oct 2020 09:56:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C3K1h3YFZzDqdr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Oct 2020 17:56:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kgavMm0I; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C3Jtg3Zc4zDqN6
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Oct 2020 17:50:19 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0937X8rl132517; Sat, 3 Oct 2020 03:50:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+r0YKl9SEcIxiGoe2pm3FnXLoSC9ycrtXmw4GMM/53s=;
 b=kgavMm0Iz9pawkAUfYXt4BNNTzDAdOzGd0AES+oQ7r+TAlqJ1rjxtvVd65tv8zzbhap3
 fwF1FqalJyyFOsN4hdEQ6MSUCbXxS23HP/eE5sxqfvqjq6egoDe3pWNUa+2Xgx2sv54s
 vZ3Z7EWB/vgLEWABAm3hLRY3Vqll6L2fuhJPCtCG0cc/M+N9T6WiwWWyKh2rbaY+2mdy
 VLSgZCfxBjXDxB17lCGkR/Icp2fHYz+JNdpuLf2HyvK/pANxiVmvJJWtr5DEeHqxy6F2
 vq/mUIcrRwFkXOyX7uD7LHMV49YGygO1AOo/KvmhM620rPlZhPuiux/MxqvmCICC5WwM 4Q== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33xmy4raee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 03 Oct 2020 03:50:15 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0937WTJY001293;
 Sat, 3 Oct 2020 07:50:12 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 33xgjh06st-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 03 Oct 2020 07:50:12 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0937oAeU29426058
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 3 Oct 2020 07:50:10 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7714F4C04A;
 Sat,  3 Oct 2020 07:50:10 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1E8F4C04E;
 Sat,  3 Oct 2020 07:50:08 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.50.127])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat,  3 Oct 2020 07:50:08 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/5] powerpc/perf/hv-gpci: Add cpu hotplug support
Date: Sat,  3 Oct 2020 13:19:42 +0530
Message-Id: <20201003074943.338618-4-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201003074943.338618-1-kjain@linux.ibm.com>
References: <20201003074943.338618-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-03_04:2020-10-02,
 2020-10-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010030065
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
Cc: kjain@linux.ibm.com, suka@us.ibm.com, maddy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch here adds cpu hotplug functions to hv_gpci pmu.
A new cpuhp_state "CPUHP_AP_PERF_POWERPC_HV_GPCI_ONLINE" enum
is added.

The online callback function updates the cpumask only if its
empty. As the primary intention of adding hotplug support
is to designate a CPU to make HCALL to collect the
counter data.

The offline function test and clear corresponding cpu in a cpumask
and update cpumask to any other active cpu.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/hv-gpci.c | 46 +++++++++++++++++++++++++++++++++++++
 include/linux/cpuhotplug.h  |  1 +
 2 files changed, 47 insertions(+)

diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
index 6884d16ec19b..b9dc407c3159 100644
--- a/arch/powerpc/perf/hv-gpci.c
+++ b/arch/powerpc/perf/hv-gpci.c
@@ -48,6 +48,8 @@ EVENT_DEFINE_RANGE_FORMAT(length, config1, 24, 31);
 /* u32, byte offset */
 EVENT_DEFINE_RANGE_FORMAT(offset, config1, 32, 63);
 
+static cpumask_t hv_gpci_cpumask;
+
 static struct attribute *format_attrs[] = {
 	&format_attr_request.attr,
 	&format_attr_starting_index.attr,
@@ -275,6 +277,45 @@ static struct pmu h_gpci_pmu = {
 	.capabilities = PERF_PMU_CAP_NO_EXCLUDE,
 };
 
+static int ppc_hv_gpci_cpu_online(unsigned int cpu)
+{
+	if (cpumask_empty(&hv_gpci_cpumask))
+		cpumask_set_cpu(cpu, &hv_gpci_cpumask);
+
+	return 0;
+}
+
+static int ppc_hv_gpci_cpu_offline(unsigned int cpu)
+{
+	int target;
+
+	/* Check if exiting cpu is used for collecting gpci events */
+	if (!cpumask_test_and_clear_cpu(cpu, &hv_gpci_cpumask))
+		return 0;
+
+	/* Find a new cpu to collect gpci events */
+	target = cpumask_last(cpu_active_mask);
+
+	if (target < 0 || target >= nr_cpu_ids) {
+		pr_err("hv_gpci: CPU hotplug init failed\n");
+		return -1;
+	}
+
+	/* Migrate gpci events to the new target */
+	cpumask_set_cpu(target, &hv_gpci_cpumask);
+	perf_pmu_migrate_context(&h_gpci_pmu, cpu, target);
+
+	return 0;
+}
+
+static int hv_gpci_cpu_hotplug_init(void)
+{
+	return cpuhp_setup_state(CPUHP_AP_PERF_POWERPC_HV_GPCI_ONLINE,
+			  "perf/powerpc/hv_gcpi:online",
+			  ppc_hv_gpci_cpu_online,
+			  ppc_hv_gpci_cpu_offline);
+}
+
 static int hv_gpci_init(void)
 {
 	int r;
@@ -295,6 +336,11 @@ static int hv_gpci_init(void)
 		return -ENODEV;
 	}
 
+	/* init cpuhotplug */
+	r = hv_gpci_cpu_hotplug_init();
+	if (r)
+		return r;
+
 	/* sampling not supported */
 	h_gpci_pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
 
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index bf9181cef444..b79d3d4b06e8 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -182,6 +182,7 @@ enum cpuhp_state {
 	CPUHP_AP_PERF_POWERPC_THREAD_IMC_ONLINE,
 	CPUHP_AP_PERF_POWERPC_TRACE_IMC_ONLINE,
 	CPUHP_AP_PERF_POWERPC_HV_24x7_ONLINE,
+	CPUHP_AP_PERF_POWERPC_HV_GPCI_ONLINE,
 	CPUHP_AP_WATCHDOG_ONLINE,
 	CPUHP_AP_WORKQUEUE_ONLINE,
 	CPUHP_AP_RCUTREE_ONLINE,
-- 
2.26.2

