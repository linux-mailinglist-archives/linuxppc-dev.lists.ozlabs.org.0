Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0931D5EA5A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 19:22:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f7Fl2v5jzDqCK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 03:22:03 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f6sZ1x3DzDqQv
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 03:04:34 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x63H2RKR067030
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 3 Jul 2019 13:04:32 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tgxn14j03-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 13:04:31 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Wed, 3 Jul 2019 18:04:30 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 3 Jul 2019 18:04:29 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x63H4RYu30539854
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jul 2019 17:04:27 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68C15AE059;
 Wed,  3 Jul 2019 17:04:27 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2140AE056;
 Wed,  3 Jul 2019 17:04:25 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.84.138])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  3 Jul 2019 17:04:25 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 8/9] powerpc/pseries: Protect against hogging the cpu while
 setting up the stats
Date: Wed,  3 Jul 2019 22:34:01 +0530
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1562171646.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1562171646.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19070317-0008-0000-0000-000002F9829C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070317-0009-0000-0000-00002266D1B2
Message-Id: <3d91bc5ea948b388bbc1886c7b739e55e020c8cf.1562171646.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-03_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907030207
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
 arch/powerpc/include/asm/lppaca.h      |  2 +-
 arch/powerpc/platforms/pseries/lpar.c  | 29 ++++++++++++++++++--------
 arch/powerpc/platforms/pseries/setup.c |  2 +-
 3 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm/lppaca.h
index f60257c9766d..3b4b305796ae 100644
--- a/arch/powerpc/include/asm/lppaca.h
+++ b/arch/powerpc/include/asm/lppaca.h
@@ -188,7 +188,7 @@ extern rwlock_t dtl_access_lock;
 extern void (*dtl_consumer)(struct dtl_entry *entry, u64 index);
 
 extern void register_dtl_buffer(int cpu);
-extern void alloc_dtl_buffers(void);
+extern void alloc_dtl_buffers(unsigned long *time_limit);
 extern long hcall_vphn(unsigned long cpu, u64 flags, __be32 *associativity);
 
 #endif /* CONFIG_PPC_BOOK3S */
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 951a3d755190..4bee9b4fc876 100644
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
 
@@ -154,7 +159,7 @@ static int vcpudispatch_stats_freq = 50;
 static __be32 *vcpu_associativity, *pcpu_associativity;
 
 
-static void free_dtl_buffers(void)
+static void free_dtl_buffers(unsigned long *time_limit)
 {
 #ifndef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
 	int cpu;
@@ -169,6 +174,11 @@ static void free_dtl_buffers(void)
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
@@ -428,7 +438,7 @@ static void reset_global_dtl_mask(void)
 		lppaca_of(cpu).dtl_enable_mask = dtl_mask;
 }
 
-static int dtl_worker_enable(void)
+static int dtl_worker_enable(unsigned long *time_limit)
 {
 	int rc = 0, state;
 
@@ -440,13 +450,13 @@ static int dtl_worker_enable(void)
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
 		write_unlock(&dtl_access_lock);
 		rc = -EINVAL;
@@ -458,10 +468,10 @@ static int dtl_worker_enable(void)
 	return rc;
 }
 
-static void dtl_worker_disable(void)
+static void dtl_worker_disable(unsigned long *time_limit)
 {
 	cpuhp_remove_state(dtl_worker_state);
-	free_dtl_buffers();
+	free_dtl_buffers(time_limit);
 	reset_global_dtl_mask();
 	write_unlock(&dtl_access_lock);
 }
@@ -469,6 +479,7 @@ static void dtl_worker_disable(void)
 static ssize_t vcpudispatch_stats_write(struct file *file, const char __user *p,
 		size_t count, loff_t *ppos)
 {
+	unsigned long time_limit = jiffies + HZ;
 	struct vcpu_dispatch_data *disp;
 	int rc, cmd, cpu;
 	char buf[16];
@@ -503,13 +514,13 @@ static ssize_t vcpudispatch_stats_write(struct file *file, const char __user *p,
 			disp->last_disp_cpu = -1;
 		}
 
-		rc = dtl_worker_enable();
+		rc = dtl_worker_enable(&time_limit);
 		if (rc) {
 			destroy_cpu_associativity();
 			goto out;
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
2.22.0

