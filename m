Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FDA147C7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 11:49:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yHyS1vwdzDqCD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 19:49:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yHrW3CrkzDqKg
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2019 19:44:27 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x469hJx4001992
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 6 May 2019 05:44:24 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sah6tkjm8-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2019 05:44:23 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Mon, 6 May 2019 10:44:21 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 6 May 2019 10:44:19 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x469iI2w53608458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 May 2019 09:44:18 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2020842041;
 Mon,  6 May 2019 09:44:18 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4E7E4204C;
 Mon,  6 May 2019 09:44:15 +0000 (GMT)
Received: from naverao1-tp.in.ibm.com (unknown [9.199.155.34])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 May 2019 09:44:15 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Lynch <nathanl@linux.ibm.com>, Mingming Cao <mingming.cao@ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: [RFC PATCH 3/6] powerpc/pseries: Factor out DTL buffer allocation and
 registration routines
Date: Mon,  6 May 2019 15:13:46 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1557134488.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1557134488.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19050609-0028-0000-0000-0000036AC517
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050609-0029-0000-0000-0000242A392D
Message-Id: <80938a151a3060e0038f7c436572a8cebfe830dc.1557134488.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905060085
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce new helpers for DTL buffer allocation and registration and
have the existing code use those.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/plpar_wrappers.h |  2 +
 arch/powerpc/platforms/pseries/lpar.c     | 66 ++++++++++++++++-------
 arch/powerpc/platforms/pseries/setup.c    | 34 +-----------
 3 files changed, 52 insertions(+), 50 deletions(-)

diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index cff5a411e595..d08feb1bc2bd 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -88,6 +88,8 @@ static inline long register_dtl(unsigned long cpu, unsigned long vpa)
 	return vpa_call(H_VPA_REG_DTL, cpu, vpa);
 }
 
+extern void register_dtl_buffer(int cpu);
+extern void alloc_dtl_buffers(void);
 extern void vpa_init(int cpu);
 
 static inline long plpar_pte_enter(unsigned long flags,
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 23f2ac6793b7..3375ca8cefb5 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -65,13 +65,58 @@ EXPORT_SYMBOL(plpar_hcall);
 EXPORT_SYMBOL(plpar_hcall9);
 EXPORT_SYMBOL(plpar_hcall_norets);
 
+void alloc_dtl_buffers(void)
+{
+	int cpu;
+	struct paca_struct *pp;
+	struct dtl_entry *dtl;
+
+	for_each_possible_cpu(cpu) {
+		pp = paca_ptrs[cpu];
+		dtl = kmem_cache_alloc(dtl_cache, GFP_KERNEL);
+		if (!dtl) {
+			pr_warn("Failed to allocate dispatch trace log for cpu %d\n",
+				cpu);
+			pr_warn("Stolen time statistics will be unreliable\n");
+			break;
+		}
+
+		pp->dtl_ridx = 0;
+		pp->dispatch_log = dtl;
+		pp->dispatch_log_end = dtl + N_DISPATCH_LOG;
+		pp->dtl_curr = dtl;
+	}
+}
+
+void register_dtl_buffer(int cpu)
+{
+	long ret;
+	struct paca_struct *pp;
+	struct dtl_entry *dtl;
+	int hwcpu = get_hard_smp_processor_id(cpu);
+
+	pp = paca_ptrs[cpu];
+	dtl = pp->dispatch_log;
+	if (dtl) {
+		pp->dtl_ridx = 0;
+		pp->dtl_curr = dtl;
+		lppaca_of(cpu).dtl_idx = 0;
+
+		/* hypervisor reads buffer length from this field */
+		dtl->enqueue_to_dispatch_time = cpu_to_be32(DISPATCH_LOG_BYTES);
+		ret = register_dtl(hwcpu, __pa(dtl));
+		if (ret)
+			pr_err("WARNING: DTL registration of cpu %d (hw %d) "
+			       "failed with %ld\n", cpu, hwcpu, ret);
+		lppaca_of(cpu).dtl_enable_mask = DTL_LOG_PREEMPT;
+	}
+}
+
 void vpa_init(int cpu)
 {
 	int hwcpu = get_hard_smp_processor_id(cpu);
 	unsigned long addr;
 	long ret;
-	struct paca_struct *pp;
-	struct dtl_entry *dtl;
 
 	/*
 	 * The spec says it "may be problematic" if CPU x registers the VPA of
@@ -112,22 +157,7 @@ void vpa_init(int cpu)
 	/*
 	 * Register dispatch trace log, if one has been allocated.
 	 */
-	pp = paca_ptrs[cpu];
-	dtl = pp->dispatch_log;
-	if (dtl) {
-		pp->dtl_ridx = 0;
-		pp->dtl_curr = dtl;
-		lppaca_of(cpu).dtl_idx = 0;
-
-		/* hypervisor reads buffer length from this field */
-		dtl->enqueue_to_dispatch_time = cpu_to_be32(DISPATCH_LOG_BYTES);
-		ret = register_dtl(hwcpu, __pa(dtl));
-		if (ret)
-			pr_err("WARNING: DTL registration of cpu %d (hw %d) "
-			       "failed with %ld\n", smp_processor_id(),
-			       hwcpu, ret);
-		lppaca_of(cpu).dtl_enable_mask = DTL_LOG_PREEMPT;
-	}
+	register_dtl_buffer(cpu);
 }
 
 #ifdef CONFIG_PPC_BOOK3S_64
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index fabaefff8399..b6995e5cc5c9 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -277,46 +277,16 @@ struct kmem_cache *dtl_cache;
  */
 static int alloc_dispatch_logs(void)
 {
-	int cpu, ret;
-	struct paca_struct *pp;
-	struct dtl_entry *dtl;
-
 	if (!firmware_has_feature(FW_FEATURE_SPLPAR))
 		return 0;
 
 	if (!dtl_cache)
 		return 0;
 
-	for_each_possible_cpu(cpu) {
-		pp = paca_ptrs[cpu];
-		dtl = kmem_cache_alloc(dtl_cache, GFP_KERNEL);
-		if (!dtl) {
-			pr_warn("Failed to allocate dispatch trace log for cpu %d\n",
-				cpu);
-			pr_warn("Stolen time statistics will be unreliable\n");
-			break;
-		}
-
-		pp->dtl_ridx = 0;
-		pp->dispatch_log = dtl;
-		pp->dispatch_log_end = dtl + N_DISPATCH_LOG;
-		pp->dtl_curr = dtl;
-	}
+	alloc_dtl_buffers();
 
 	/* Register the DTL for the current (boot) cpu */
-	dtl = get_paca()->dispatch_log;
-	get_paca()->dtl_ridx = 0;
-	get_paca()->dtl_curr = dtl;
-	get_paca()->lppaca_ptr->dtl_idx = 0;
-
-	/* hypervisor reads buffer length from this field */
-	dtl->enqueue_to_dispatch_time = cpu_to_be32(DISPATCH_LOG_BYTES);
-	ret = register_dtl(hard_smp_processor_id(), __pa(dtl));
-	if (ret)
-		pr_err("WARNING: DTL registration of cpu %d (hw %d) failed "
-		       "with %d\n", smp_processor_id(),
-		       hard_smp_processor_id(), ret);
-	get_paca()->lppaca_ptr->dtl_enable_mask = DTL_LOG_PREEMPT;
+	register_dtl_buffer(smp_processor_id());
 
 	return 0;
 }
-- 
2.21.0

