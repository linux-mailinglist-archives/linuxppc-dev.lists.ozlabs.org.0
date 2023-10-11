Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 173FF7C494F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 07:41:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B5Uif5nB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S51q96RXNz3vm5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 16:41:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B5Uif5nB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S51kQ0dRLz3c3x
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 16:37:33 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39B5HNii008185
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Tr7LVkV+WwaxVEEAVMLa7D9oxFJBjJZY5SzgXnMdNjs=;
 b=B5Uif5nB0GhP5/ahzRRT950F2s82/D/oXEWi7vzx+oEzPTRDSEHIqgO/TzjyWt/dCF4y
 nKJ6MVxESju31cBzSkX3JqOuZBjKN58H/V0vTO0dsu5WcVqtDvUh6KFipfGxckiRNM3u
 xbXbMQsMOxXDZ8mgECbudyEXjAYiW56XyudNPOC83c1mIjeeBRJWRE1SOqd6G9wGdJ/m
 3az7GhoAA6KjvAh4SpnD4Zgtd2/d5q59MD1XB9WngcMB9CQ7VBcXGcgRMg5L2AI7w3jE
 ORBG2vB6YMMroAKv0blcPY0Kv+YA+ZTJKlzk0+8WcmXuXJGJQzo9Og+T9u7oXI5E050M lA== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tnne2gfxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:31 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39B4h1AT028201
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:30 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkj1y63ug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:29 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39B5bSxn45613808
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:28 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBDAC20040
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:27 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11AE62004D
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:27 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 05:37:27 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8054C60634;
	Wed, 11 Oct 2023 16:37:24 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 04/12] powerpc: Use NULL instead of 0 for null pointers
Date: Wed, 11 Oct 2023 16:37:03 +1100
Message-ID: <20231011053711.93427-5-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011053711.93427-1-bgray@linux.ibm.com>
References: <20231011053711.93427-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UA3U9t_pR8rOH36GeOm3UcAvXMgWAV5n
X-Proofpoint-GUID: UA3U9t_pR8rOH36GeOm3UcAvXMgWAV5n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-11_03,2023-10-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 clxscore=1015 priorityscore=1501 phishscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310110050
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sparse reports several uses of 0 for pointer arguments and comparisons.
Replace with NULL to better convey the intent. Remove entirely if a
comparison to follow the kernel style of implicit boolean conversions.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/kernel/setup_64.c        | 2 +-
 arch/powerpc/kvm/book3s_xive_native.c | 2 +-
 arch/powerpc/net/bpf_jit_comp.c       | 8 ++++----
 arch/powerpc/perf/imc-pmu.c           | 2 +-
 arch/powerpc/platforms/4xx/soc.c      | 2 +-
 arch/powerpc/platforms/pseries/lpar.c | 8 ++++----
 6 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 246201d0d879..2f19d5e94485 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -364,7 +364,7 @@ void __init early_setup(unsigned long dt_ptr)
 	 */
 	initialise_paca(&boot_paca, 0);
 	fixup_boot_paca(&boot_paca);
-	WARN_ON(local_paca != 0);
+	WARN_ON(local_paca);
 	setup_paca(&boot_paca); /* install the paca into registers */
 
 	/* -------- printk is now safe to use ------- */
diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
index 712ab91ced39..6e2ebbd8aaac 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -567,7 +567,7 @@ static int kvmppc_xive_native_set_queue_config(struct kvmppc_xive *xive,
 	u8 priority;
 	struct kvm_ppc_xive_eq kvm_eq;
 	int rc;
-	__be32 *qaddr = 0;
+	__be32 *qaddr = NULL;
 	struct page *page;
 	struct xive_q *q;
 	gfn_t gfn;
diff --git a/arch/powerpc/net/bpf_jit_comp.c b/arch/powerpc/net/bpf_jit_comp.c
index 37043dfc1add..316cadf442b2 100644
--- a/arch/powerpc/net/bpf_jit_comp.c
+++ b/arch/powerpc/net/bpf_jit_comp.c
@@ -119,7 +119,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	cgctx.stack_size = round_up(fp->aux->stack_depth, 16);
 
 	/* Scouting faux-generate pass 0 */
-	if (bpf_jit_build_body(fp, 0, &cgctx, addrs, 0, false)) {
+	if (bpf_jit_build_body(fp, NULL, &cgctx, addrs, 0, false)) {
 		/* We hit something illegal or unsupported. */
 		fp = org_fp;
 		goto out_addrs;
@@ -134,7 +134,7 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	 */
 	if (cgctx.seen & SEEN_TAILCALL || !is_offset_in_branch_range((long)cgctx.idx * 4)) {
 		cgctx.idx = 0;
-		if (bpf_jit_build_body(fp, 0, &cgctx, addrs, 0, false)) {
+		if (bpf_jit_build_body(fp, NULL, &cgctx, addrs, 0, false)) {
 			fp = org_fp;
 			goto out_addrs;
 		}
@@ -146,9 +146,9 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_prog *fp)
 	 * update ctgtx.idx as it pretends to output instructions, then we can
 	 * calculate total size from idx.
 	 */
-	bpf_jit_build_prologue(0, &cgctx);
+	bpf_jit_build_prologue(NULL, &cgctx);
 	addrs[fp->len] = cgctx.idx * 4;
-	bpf_jit_build_epilogue(0, &cgctx);
+	bpf_jit_build_epilogue(NULL, &cgctx);
 
 	fixup_len = fp->aux->num_exentries * BPF_FIXUP_LEN * 4;
 	extable_len = fp->aux->num_exentries * sizeof(struct exception_table_entry);
diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index 9d229ef7f86e..eba2baabccb0 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -544,7 +544,7 @@ static int nest_imc_event_init(struct perf_event *event)
 			break;
 		}
 		pcni++;
-	} while (pcni->vbase != 0);
+	} while (pcni->vbase);
 
 	if (!flag)
 		return -ENODEV;
diff --git a/arch/powerpc/platforms/4xx/soc.c b/arch/powerpc/platforms/4xx/soc.c
index b2d940437a66..5412e6b21e10 100644
--- a/arch/powerpc/platforms/4xx/soc.c
+++ b/arch/powerpc/platforms/4xx/soc.c
@@ -112,7 +112,7 @@ static int __init ppc4xx_l2c_probe(void)
 	}
 
 	/* Install error handler */
-	if (request_irq(irq, l2c_error_handler, 0, "L2C", 0) < 0) {
+	if (request_irq(irq, l2c_error_handler, 0, "L2C", NULL) < 0) {
 		printk(KERN_ERR "Cannot install L2C error handler"
 		       ", cache is not enabled\n");
 		of_node_put(np);
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index f2cb62148f36..b4e86b7ea584 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -192,9 +192,9 @@ static void free_dtl_buffers(unsigned long *time_limit)
 			continue;
 		kmem_cache_free(dtl_cache, pp->dispatch_log);
 		pp->dtl_ridx = 0;
-		pp->dispatch_log = 0;
-		pp->dispatch_log_end = 0;
-		pp->dtl_curr = 0;
+		pp->dispatch_log = NULL;
+		pp->dispatch_log_end = NULL;
+		pp->dtl_curr = NULL;
 
 		if (time_limit && time_after(jiffies, *time_limit)) {
 			cond_resched();
@@ -223,7 +223,7 @@ static void destroy_cpu_associativity(void)
 {
 	kfree(vcpu_associativity);
 	kfree(pcpu_associativity);
-	vcpu_associativity = pcpu_associativity = 0;
+	vcpu_associativity = pcpu_associativity = NULL;
 }
 
 static __be32 *__get_cpu_associativity(int cpu, __be32 *cpu_assoc, int flag)
-- 
2.39.2

