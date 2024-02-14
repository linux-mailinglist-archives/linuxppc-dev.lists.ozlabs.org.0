Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E8368544E2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 10:18:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dJNNbZmw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZXgb0vrhz3dJ0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 20:18:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dJNNbZmw;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TZXfn5My3z3bcP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 20:18:09 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TZXfg2P1yz4wcr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 20:18:03 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TZXfg2LHnz4wcl; Wed, 14 Feb 2024 20:18:03 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dJNNbZmw;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TZXff5T10z4wcr
	for <linuxppc-dev@ozlabs.org>; Wed, 14 Feb 2024 20:18:02 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41E9HvS9002004;
	Wed, 14 Feb 2024 09:17:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=W949xyMV5bUxjUsCd4YkZZVEfjeN2IFZTXP2ssQa1ZE=;
 b=dJNNbZmw9/OCih6lU4mUdl5GBVT3XwFOljf7wC3gxo1cixa0oLGZg8qcDXyyIQB4sKKt
 H4FQNMrQBVgT+57RR7GXW+hXBueq1GvsWmU6bflq4rwCknzl03tCvCUdnPnbklcEeYgz
 QoHKgThKuBVueZjrm5oBvdaDU+ybQHvtBoSc25zsHZHlF1BGcXdfZi7arp3gaI9Z4rr9
 /sPd1lSOoY9agfRfNG/g3u4C0avRSfS5VOSrSbMHDdg9A21FdxaKsA2jBrLbAGTWzbgc
 sy0ZC5upLRFbaC9AJutLyFeYtq5HI+uEaCNpQ0xoJbL2iNwWFq3ogdoKHdwOPKKE+5pM bQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w8trt000t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 09:17:57 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41E9Hu3B001985;
	Wed, 14 Feb 2024 09:17:56 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w8trt000k-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 09:17:56 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41E9161m032605;
	Wed, 14 Feb 2024 09:16:43 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6kftn6qp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Feb 2024 09:16:42 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41E9GcUB40239442
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Feb 2024 09:16:40 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0F50B2004D;
	Wed, 14 Feb 2024 09:16:38 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE53E20043;
	Wed, 14 Feb 2024 09:16:36 +0000 (GMT)
Received: from jupiter.in.ibm.com (unknown [9.109.248.226])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 Feb 2024 09:16:36 +0000 (GMT)
From: Mahesh Salgaonkar <mahesh@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Subject: [PATCH v3] powerpc: Avoid nmi_enter/nmi_exit in real mode interrupt.
Date: Wed, 14 Feb 2024 14:46:35 +0530
Message-ID: <20240214091636.1520864-1-mahesh@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xDfwJtsRlISB53YbXRyRH_M5keu4BWcN
X-Proofpoint-ORIG-GUID: PpPlSYTLdoMW-EvlUsya6PuaiKg0mCfq
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-14_02,2024-02-12_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=993 bulkscore=0
 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402140072
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
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
Changes in v3:
- Address comments from Christophe Leroy to avoid using #ifdefs in the
  code
- v2 at https://lore.kernel.org/linuxppc-dev/20240205053647.1763446-1-mahesh@linux.ibm.com/

Changes in v2:
- Rebase to upstream master
- Use jump_labels, if CONFIG_JUMP_LABEL is enabled, to avoid redoing the
  embed first chunk test at each interrupt entry.
- v1 is at https://lore.kernel.org/linuxppc-dev/164578465828.74956.6065296024817333750.stgit@jupiter/
---
 arch/powerpc/include/asm/interrupt.h | 10 ++++++++++
 arch/powerpc/include/asm/percpu.h    | 10 ++++++++++
 arch/powerpc/kernel/setup_64.c       |  4 ++++
 3 files changed, 24 insertions(+)

diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
index a4196ab1d0167..0b96464ff0339 100644
--- a/arch/powerpc/include/asm/interrupt.h
+++ b/arch/powerpc/include/asm/interrupt.h
@@ -336,6 +336,14 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
 	if (IS_ENABLED(CONFIG_KASAN))
 		return;
 
+	/*
+	 * Likewise, do not use it in real mode if percpu first chunk is not
+	 * embedded. With CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there
+	 * are chances where percpu allocation can come from vmalloc area.
+	 */
+	if (IS_ENABLED(CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK) && !is_embed_first_chunk)
+		return;
+
 	/* Otherwise, it should be safe to call it */
 	nmi_enter();
 }
@@ -351,6 +359,8 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
 		// no nmi_exit for a pseries hash guest taking a real mode exception
 	} else if (IS_ENABLED(CONFIG_KASAN)) {
 		// no nmi_exit for KASAN in real mode
+	} else if (IS_ENABLED(CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK) && !is_embed_first_chunk) {
+		// no nmi_exit if percpu first chunk is not embedded
 	} else {
 		nmi_exit();
 	}
diff --git a/arch/powerpc/include/asm/percpu.h b/arch/powerpc/include/asm/percpu.h
index 8e5b7d0b851c6..d1fdf25897dc1 100644
--- a/arch/powerpc/include/asm/percpu.h
+++ b/arch/powerpc/include/asm/percpu.h
@@ -15,6 +15,16 @@
 #endif /* CONFIG_SMP */
 #endif /* __powerpc64__ */
 
+#ifdef CONFIG_PPC64
+#include <linux/jump_label.h>
+DECLARE_STATIC_KEY_FALSE(__percpu_embed_first_chunk);
+
+#define is_embed_first_chunk	\
+		(static_key_enabled(&__percpu_embed_first_chunk.key))
+#else
+#define is_embed_first_chunk	(true)
+#endif /* CONFIG_PPC64 */
+
 #include <asm-generic/percpu.h>
 
 #include <asm/paca.h>
diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
index 2f19d5e944852..cbd3b4c82316c 100644
--- a/arch/powerpc/kernel/setup_64.c
+++ b/arch/powerpc/kernel/setup_64.c
@@ -834,6 +834,7 @@ static __init int pcpu_cpu_to_node(int cpu)
 
 unsigned long __per_cpu_offset[NR_CPUS] __read_mostly;
 EXPORT_SYMBOL(__per_cpu_offset);
+DEFINE_STATIC_KEY_FALSE(__percpu_embed_first_chunk);
 
 void __init setup_per_cpu_areas(void)
 {
@@ -869,6 +870,9 @@ void __init setup_per_cpu_areas(void)
 			pr_warn("PERCPU: %s allocator failed (%d), "
 				"falling back to page size\n",
 				pcpu_fc_names[pcpu_chosen_fc], rc);
+		else {
+			static_key_enable(&__percpu_embed_first_chunk.key);
+		}
 	}
 
 	if (rc < 0)
-- 
2.43.0

