Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E18454639D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2019 18:06:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45QQSw0xKxzDrZC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2019 02:06:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45QQ0F5JyTzDrfw
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2019 01:44:45 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5EFhH6l058976
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 11:44:42 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t4dw8spwh-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2019 11:44:42 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Fri, 14 Jun 2019 16:44:40 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 14 Jun 2019 16:44:37 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5EFiSaO37749162
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Jun 2019 15:44:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D2F611C050;
 Fri, 14 Jun 2019 15:44:36 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B280111C04A;
 Fri, 14 Jun 2019 15:44:34 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.70.176])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 14 Jun 2019 15:44:34 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 8/9] powerpc/pseries: Protect against hogging the cpu while
 setting up the stats
Date: Fri, 14 Jun 2019 21:14:06 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1560526066.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1560526066.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19061415-0012-0000-0000-000003292D26
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061415-0013-0000-0000-000021623E2A
Message-Id: <5ae62e552d81305afccd87cf9a56e8ce94e82840.1560526066.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-14_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906140130
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mingming Cao <mingming.cao@ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When enabling or disabling the vcpu dispatch statistics, we do a lot of
work including allocating/deallocating memory across all possible cpus
for the DTL buffer. In order to guard against hogging the cpu for too
long, track the time we're taking and yield the processor if necessary.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/plpar_wrappers.h |  2 +-
 arch/powerpc/platforms/pseries/lpar.c     | 29 ++++++++++++++++-------
 arch/powerpc/platforms/pseries/setup.c    |  2 +-
 3 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index 5f72f1fa4f81..5e5faabd7ba2 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -110,7 +110,7 @@ static inline long register_dtl(unsigned long cpu, unsigned long vpa)
 extern bool register_dtl_buffer_access(bool global);
 extern void unregister_dtl_buffer_access(bool global);
 extern void register_dtl_buffer(int cpu);
-extern void alloc_dtl_buffers(void);
+extern void alloc_dtl_buffers(unsigned long *time_limit);
 extern void vpa_init(int cpu);
 
 static inline long plpar_pte_enter(unsigned long flags,
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 200a96c8626a..318b08ada086 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -62,7 +62,7 @@ static u8 dtl_mask = DTL_LOG_PREEMPT;
 static u8 dtl_mask;
 #endif
 
-void alloc_dtl_buffers(void)
+void alloc_dtl_buffers(unsigned long *time_limit)
 {
 	int cpu;
 	struct paca_struct *pp;
@@ -86,6 +86,11 @@ void alloc_dtl_buffers(void)
 		pp->dispatch_log = dtl;
 		pp->dispatch_log_end = dtl + N_DISPATCH_LOG;
 		pp->dtl_curr = dtl;
+
+		if (time_limit && time_after(jiffies, *time_limit)) {
+			cond_resched();
+			*time_limit = jiffies + HZ;
+		}
 	}
 }
 
@@ -157,7 +162,7 @@ static int vcpudispatch_stats_freq = 50;
 static __be32 *vcpu_associativity, *pcpu_associativity;
 
 
-static void free_dtl_buffers(void)
+static void free_dtl_buffers(unsigned long *time_limit)
 {
 #ifndef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
 	int cpu;
@@ -172,6 +177,11 @@ static void free_dtl_buffers(void)
 		pp->dispatch_log = 0;
 		pp->dispatch_log_end = 0;
 		pp->dtl_curr = 0;
+
+		if (time_limit && time_after(jiffies, *time_limit)) {
+			cond_resched();
+			*time_limit = jiffies + HZ;
+		}
 	}
 #endif
 }
@@ -464,7 +474,7 @@ static void reset_global_dtl_mask(void)
 		lppaca_of(cpu).dtl_enable_mask = dtl_mask;
 }
 
-static int dtl_worker_enable(void)
+static int dtl_worker_enable(unsigned long *time_limit)
 {
 	int rc = 0, state;
 
@@ -483,13 +493,13 @@ static int dtl_worker_enable(void)
 	set_global_dtl_mask(DTL_LOG_ALL);
 
 	/* Setup dtl buffers and register those */
-	alloc_dtl_buffers();
+	alloc_dtl_buffers(time_limit);
 
 	state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "powerpc/dtl:online",
 					dtl_worker_online, dtl_worker_offline);
 	if (state < 0) {
 		pr_err("vcpudispatch_stats: unable to setup workqueue for DTL processing\n");
-		free_dtl_buffers();
+		free_dtl_buffers(time_limit);
 		reset_global_dtl_mask();
 		unregister_dtl_buffer_access(1);
 		rc = -EINVAL;
@@ -503,14 +513,14 @@ static int dtl_worker_enable(void)
 	return rc;
 }
 
-static void dtl_worker_disable(void)
+static void dtl_worker_disable(unsigned long *time_limit)
 {
 	mutex_lock(&dtl_worker_mutex);
 	dtl_worker_refctr--;
 	if (!dtl_worker_refctr) {
 		cpuhp_remove_state(dtl_worker_state);
 		dtl_worker_state = 0;
-		free_dtl_buffers();
+		free_dtl_buffers(time_limit);
 		reset_global_dtl_mask();
 		unregister_dtl_buffer_access(1);
 	}
@@ -520,6 +530,7 @@ static void dtl_worker_disable(void)
 static ssize_t vcpudispatch_stats_write(struct file *file, const char __user *p,
 		size_t count, loff_t *ppos)
 {
+	unsigned long time_limit = jiffies + HZ;
 	struct vcpu_dispatch_data *disp;
 	int rc, cmd, cpu;
 	char buf[16];
@@ -552,13 +563,13 @@ static ssize_t vcpudispatch_stats_write(struct file *file, const char __user *p,
 			disp->last_disp_cpu = -1;
 		}
 
-		rc = dtl_worker_enable();
+		rc = dtl_worker_enable(&time_limit);
 		if (rc) {
 			destroy_cpu_associativity();
 			return rc;
 		}
 	} else {
-		dtl_worker_disable();
+		dtl_worker_disable(&time_limit);
 		destroy_cpu_associativity();
 	}
 
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index e4d75b958593..76fd6de90581 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -279,7 +279,7 @@ static int alloc_dispatch_logs(void)
 	if (!dtl_cache)
 		return 0;
 
-	alloc_dtl_buffers();
+	alloc_dtl_buffers(0);
 
 	/* Register the DTL for the current (boot) cpu */
 	register_dtl_buffer(smp_processor_id());
-- 
2.21.0

