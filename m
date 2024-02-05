Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5674884936F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 06:37:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YyRlgrFH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TSwBb1nZ9z3cJ0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 16:37:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YyRlgrFH;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TSw9p4Mrlz2ykx
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 16:37:02 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TSw9p2mrrz4wcb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 16:37:02 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TSw9p2b4bz4wyb; Mon,  5 Feb 2024 16:37:02 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YyRlgrFH;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TSw9n4hRgz4wcb
	for <linuxppc-dev@ozlabs.org>; Mon,  5 Feb 2024 16:37:01 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41550clX009520;
	Mon, 5 Feb 2024 05:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=0rbWvOWdC5n48OMCsNGxL3+si6IAxW3m3CbrTHYZzO0=;
 b=YyRlgrFHQY9d8DhtL2fd9CiiytQLsMpHz1yeqcG5gJ0kdIKFQxcqSihDOSH98KmasOFS
 CZoxUOGBQClplatfkEH9wzt28a1A01rGaINSX6TleEin2Z3+DCiY+/3yprPRKqnNeYq9
 xlAbF8bTkvIUShAIyF9ABCeXXMJmxIBMY0S2I6UG7o6c32pWGpS4+AGGHk+6D3FuPFJt
 k0Bvntoo99eZYbUodyD0Sl0tF1Zpon1/HacijTa4vQ4w8vsUMB5J/mYwWlMccl8U2SHk
 Lf7F2hAcClvasnx51m21FwS2Y2R1WCbKwOyEokGAyKZUf2J5aLlRbe1QLNlSPpuchGwp eA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w2rtj0utb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 05:36:56 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4155WC73022830;
	Mon, 5 Feb 2024 05:36:55 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w2rtj0ut2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 05:36:55 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41539tRg008770;
	Mon, 5 Feb 2024 05:36:55 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w206y6q0q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 Feb 2024 05:36:55 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4155aotR24707752
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Feb 2024 05:36:50 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9365620040;
	Mon,  5 Feb 2024 05:36:50 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B51320043;
	Mon,  5 Feb 2024 05:36:49 +0000 (GMT)
Received: from jupiter.in.ibm.com (unknown [9.109.248.226])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 Feb 2024 05:36:48 +0000 (GMT)
From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
To: = linuxppc-dev <linuxppc-dev@ozlabs.org>
Subject: [PATCH v2] powerpc: Avoid nmi_enter/nmi_exit in real mode interrupt.
Date: Mon,  5 Feb 2024 11:06:47 +0530
Message-ID: <20240205053647.1763446-1-mahesh@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9EjY-Bg70uctm5XWNpXUw1ZpQyTunPw2
X-Proofpoint-GUID: 1xT9cjMe3l1_8Yz-UZ3vk3584GRdK-Ew
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-05_01,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=895 spamscore=0 clxscore=1011 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402050039
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
Cc: "= Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, = Ganesh Goudar <ganeshgr@linux.ibm.com>, = Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
Changes in v2:
- Rebase to upstream master
- Use jump_labels, if CONFIG_JUMP_LABEL is enabled, to avoid redoing the
  test at each interrupt entry.
- v1 is at https://lore.kernel.org/linuxppc-dev/164578465828.74956.6065296024817333750.stgit@jupiter/
---
 arch/powerpc/include/asm/interrupt.h | 14 ++++++++++++++
 arch/powerpc/include/asm/percpu.h    | 11 +++++++++++
 arch/powerpc/kernel/setup_64.c       | 12 ++++++++++++
 3 files changed, 37 insertions(+)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index a4196ab1d0167..3b4e17c23d9a9 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -336,6 +336,16 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 	if (IS_ENABLED(CONFIG_KASAN))
 		return;
 
+	/*
+	 * Likewise, do not use it in real mode if percpu first chunk is not
+	 * embedded. With CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there
+	 * are chances where percpu allocation can come from vmalloc area.
+	 */
+#ifdef CONFIG_PPC64
+	if (IS_ENABLED(CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK) && !is_embed_first_chunk)
+		return;
+#endif
+
 	/* Otherwise, it should be safe to call it */
 	nmi_enter();
 }
@@ -351,6 +361,10 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 		// no nmi_exit for a pseries hash guest taking a real mode exception
 	} else if (IS_ENABLED(CONFIG_KASAN)) {
 		// no nmi_exit for KASAN in real mode
+#ifdef CONFIG_PPC64
+	} else if (IS_ENABLED(CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK) && !is_embed_first_chunk) {
+		// no nmi_exit if percpu first chunk is not embedded
+#endif
 	} else {
 		nmi_exit();
 	}
diff --git a/arch/powerpc/include/asm/percpu.h b/arch/powerpc/include/asm/percpu.h
index 8e5b7d0b851c6..6b4dce4e78d5f 100644
--- a/arch/powerpc/include/asm/percpu.h
+++ b/arch/powerpc/include/asm/percpu.h
@@ -12,6 +12,17 @@
 
 #define __my_cpu_offset local_paca->data_offset
 
+#ifdef CONFIG_JUMP_LABEL
+DECLARE_STATIC_KEY_FALSE(__percpu_embed_first_chunk);
+
+#define is_embed_first_chunk	\
+		(static_key_enabled(&__percpu_embed_first_chunk.key))
+
+#else /* !CONFIG_JUMP_LABEL */
+extern bool __percpu_embed_first_chunk;
+#define is_embed_first_chunk	__percpu_embed_first_chunk
+
+#endif /* CONFIG_JUMP_LABEL */
 #endif /* CONFIG_SMP */
 #endif /* __powerpc64__ */
 
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 2f19d5e944852..674b6e1bebe9a 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -834,6 +834,11 @@ static __init int pcpu_cpu_to_node(int cpu)
 
 unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
 EXPORT_SYMBOL(__per_cpu_offset);
+#ifdef CONFIG_JUMP_LABEL
+DEFINE_STATIC_KEY_FALSE(__percpu_embed_first_chunk);
+#else
+bool __percpu_embed_first_chunk;
+#endif
 
 void __init setup_per_cpu_areas(void)
 {
@@ -869,6 +874,13 @@ void __init setup_per_cpu_areas(void)
 			pr_warn("PERCPU: %s allocator failed (%d), "
 				"falling back to page size\n",
 				pcpu_fc_names[pcpu_chosen_fc], rc);
+		else {
+#ifdef CONFIG_JUMP_LABEL
+			static_key_enable(&__percpu_embed_first_chunk.key);
+#else
+			__percpu_embed_first_chunk = true;
+#endif
+		}
 	}
 
 	if (rc < 0)
-- 
2.43.0

