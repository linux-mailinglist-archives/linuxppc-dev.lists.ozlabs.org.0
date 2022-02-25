Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 727F04C4236
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 11:25:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K4mBJ4vQkz3bbb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Feb 2022 21:25:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M8kOL5Vb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K4m9Z1ZPkz3bPD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 21:24:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=M8kOL5Vb; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4K4m9Y3676z4xZq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Feb 2022 21:24:49 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4K4m9Y301Mz4xcZ; Fri, 25 Feb 2022 21:24:49 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=M8kOL5Vb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4K4m9X5Bp7z4xZq
 for <linuxppc-dev@ozlabs.org>; Fri, 25 Feb 2022 21:24:48 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21PAI4Cw025633
 for <linuxppc-dev@ozlabs.org>; Fri, 25 Feb 2022 10:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : from : to : cc
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=OGwUZiLJz+XSnTN7I3qtDVsDF3JvgZdjKoTot4jJ6AE=;
 b=M8kOL5VbfXgjtbIrO7uV+gVRL3FV2PnEpJZSKV+GG68vUzeW05+Y2n3T0Ol64mzsw5EB
 s8d7PNxqsZUIwkQIuWJv9d1HNrN9xAZVD4MPoQ9VMvJKRMNUq09yCNzMN9MxoIdP2u0+
 N1/ddgUQqhzsDgAc9OKjw3UZf+OYO8+cYvGqzDSdSSUrXrNx3GsHEuPndNapN/d6cke+
 xumN1wUa2VFWrGzCwAn3O9qtzTJ3MttS3J/ZBphrGme0TpZ7+FG/ZJKLpzpR9zHILjkA
 iQrOR1SG+9gEGWxctyJE1UBN4bD1Ct+A7ZxZk4sw4xZZMd0PR8/U3yuQFuoKwH3LhFoe Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3edx1xmjc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 25 Feb 2022 10:24:45 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21PAOjYa001634
 for <linuxppc-dev@ozlabs.org>; Fri, 25 Feb 2022 10:24:45 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3edx1xmjbe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 10:24:44 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21PAJ4up003603;
 Fri, 25 Feb 2022 10:24:42 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3eaqtk5hv3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Feb 2022 10:24:42 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21PAOdRP47186320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Feb 2022 10:24:39 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 51F95AE055;
 Fri, 25 Feb 2022 10:24:39 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36318AE051;
 Fri, 25 Feb 2022 10:24:38 +0000 (GMT)
Received: from [192.168.0.48] (unknown [9.43.0.45])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 25 Feb 2022 10:24:37 +0000 (GMT)
Subject: [PATCH] powerpc: Avoid nmi_enter/nmi_exit in real mode interrupt.
From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Fri, 25 Feb 2022 15:54:37 +0530
Message-ID: <164578465828.74956.6065296024817333750.stgit@jupiter>
User-Agent: StGit/0.23
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BaCY1uG1Spk21YgY_03XDAkPpIYSeRdC
X-Proofpoint-GUID: 71_kx0ijddiWgGGyInhRVijZ8iWK-1lR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-25_06,2022-02-25_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 mlxlogscore=999
 bulkscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202250053
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

nmi_enter()/nmi_exit() touches per cpu variables which can lead to kernel
crash when invoked during real mode interrupt handling (e.g. early HMI/MCE
interrupt handler) if percpu allocation comes from vmalloc area.

Early HMI/MCE handlers are called through DEFINE_INTERRUPT_HANDLER_NMI()
wrapper which invokes nmi_enter/nmi_exit calls. We don't see any issue when
percpu allocation is from the embedded first chunk. However with
CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there are chances where percpu
allocation can come from the vmalloc area.

With kernel command line "percpu_alloc=page" we can force percpu allocation
to come from vmalloc area and can see kernel crash in machine_check_early:

[    1.215714] NIP [c000000000e49eb4] rcu_nmi_enter+0x24/0x110
[    1.215717] LR [c0000000000461a0] machine_check_early+0xf0/0x2c0
[    1.215719] --- interrupt: 200
[    1.215720] [c000000fffd73180] [0000000000000000] 0x0 (unreliable)
[    1.215722] [c000000fffd731b0] [0000000000000000] 0x0
[    1.215724] [c000000fffd73210] [c000000000008364] machine_check_early_common+0x134/0x1f8

Fix this by avoiding use of nmi_enter()/nmi_exit() in real mode if percpu
first chunk is not embedded.

Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
---
 arch/powerpc/include/asm/interrupt.h |   15 +++++++++++++++
 arch/powerpc/include/asm/percpu.h    |    2 ++
 arch/powerpc/kernel/setup_64.c       |    3 +++
 3 files changed, 20 insertions(+)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index fc28f46d2f9dc..8c5b3a7ca2ab6 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -327,6 +327,16 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 	}
 #endif
 
+	/*
+	 * Do not use nmi_enter() in real mode if percpu first chunk is
+	 * not embedded. With CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled
+	 * there are chances where percpu allocation can come from vmalloc
+	 * area.
+	 */
+	if (IS_ENABLED(CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK) &&
+	    !(mfmsr() & MSR_DR) && !__percpu_embed_first_chunk)
+		return;
+
 	/*
 	 * Do not use nmi_enter() for pseries hash guest taking a real-mode
 	 * NMI because not everything it touches is within the RMA limit.
@@ -339,6 +349,10 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 
 static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
 {
+	if (IS_ENABLED(CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK) &&
+	    !(mfmsr() & MSR_DR) && !__percpu_embed_first_chunk)
+		goto skip_nmi_exit;
+
 	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) ||
 			!firmware_has_feature(FW_FEATURE_LPAR) ||
 			radix_enabled() || (mfmsr() & MSR_DR))
@@ -349,6 +363,7 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 	 * new work to do (must use irq_work for that).
 	 */
 
+skip_nmi_exit:
 #ifdef CONFIG_PPC64
 #ifdef CONFIG_PPC_BOOK3S
 	if (arch_irq_disabled_regs(regs)) {
diff --git a/arch/powerpc/include/asm/percpu.h b/arch/powerpc/include/asm/percpu.h
index 8e5b7d0b851c6..45c08f5b0b4e9 100644
--- a/arch/powerpc/include/asm/percpu.h
+++ b/arch/powerpc/include/asm/percpu.h
@@ -12,6 +12,8 @@
 
 #define __my_cpu_offset local_paca->data_offset
 
+extern bool __percpu_embed_first_chunk;
+
 #endif /* CONFIG_SMP */
 #endif /* __powerpc64__ */
 
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index be8577ac93971..39dbf2fb23d61 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -786,6 +786,7 @@ static __init int pcpu_cpu_to_node(int cpu)
 
 unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
 EXPORT_SYMBOL(__per_cpu_offset);
+bool __percpu_embed_first_chunk;
 
 void __init setup_per_cpu_areas(void)
 {
@@ -821,6 +822,8 @@ void __init setup_per_cpu_areas(void)
 			pr_warn("PERCPU: %s allocator failed (%d), "
 				"falling back to page size\n",
 				pcpu_fc_names[pcpu_chosen_fc], rc);
+		else
+			__percpu_embed_first_chunk = true;
 	}
 
 	if (rc < 0)


