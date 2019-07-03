Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2300B5EA31
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 19:13:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f73k24TNzDqBZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 03:13:22 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f6sR3tlvzDqQk
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 03:04:27 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x63H2Q5T179530
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 3 Jul 2019 13:04:22 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tgxvqbqy3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 13:04:22 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Wed, 3 Jul 2019 18:04:20 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 3 Jul 2019 18:04:19 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x63H4HRm38470004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jul 2019 17:04:17 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 984C7AE05D;
 Wed,  3 Jul 2019 17:04:17 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22325AE053;
 Wed,  3 Jul 2019 17:04:16 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.84.138])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  3 Jul 2019 17:04:15 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 3/9] powerpc/pseries: Factor out DTL buffer allocation and
 registration routines
Date: Wed,  3 Jul 2019 22:33:56 +0530
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1562171646.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1562171646.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19070317-0028-0000-0000-000003800C6D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070317-0029-0000-0000-000024404C42
Message-Id: <1d890db69bfedd376e86e29584138818705e7c8c.1562171646.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-03_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
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

Introduce new helpers for DTL buffer allocation and registration and
have the existing code use those.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/lppaca.h      |  3 ++
 arch/powerpc/platforms/pseries/lpar.c  | 66 +++++++++++++++++++-------
 arch/powerpc/platforms/pseries/setup.c | 34 +------------
 3 files changed, 53 insertions(+), 50 deletions(-)

diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm/lppaca.h
index 9837bb2b3e69..060697768287 100644
--- a/arch/powerpc/include/asm/lppaca.h
+++ b/arch/powerpc/include/asm/lppaca.h
@@ -162,6 +162,9 @@ extern struct kmem_cache *dtl_cache;
  */
 extern void (*dtl_consumer)(struct dtl_entry *entry, u64 index);
 
+extern void register_dtl_buffer(int cpu);
+extern void alloc_dtl_buffers(void);
+
 #endif /* CONFIG_PPC_BOOK3S */
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_LPPACA_H */
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 96c4677cf8ab..8c5377fe9985 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -52,13 +52,58 @@ EXPORT_SYMBOL(plpar_hcall);
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
@@ -99,22 +144,7 @@ void vpa_init(int cpu)
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
index a643e45d0544..e4d75b958593 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -273,46 +273,16 @@ struct kmem_cache *dtl_cache;
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
2.22.0

