Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 224776B69F8
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Mar 2023 19:17:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZSgn6fl3z3f52
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 05:17:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WFaQRw+M;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PZSYl4tHpz3c8h
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 05:12:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WFaQRw+M;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4PZSYl4KSfz4xDh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 05:12:27 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4PZSYl4Gsfz4xDk; Mon, 13 Mar 2023 05:12:27 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WFaQRw+M;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4PZSYl1JFjz4xDh
	for <linuxppc-dev@ozlabs.org>; Mon, 13 Mar 2023 05:12:26 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32CH0soQ002159;
	Sun, 12 Mar 2023 18:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=XpzERC+4k8YKlTy5xIbVV2odgMH+5ZqL+pn6F52Uw2Y=;
 b=WFaQRw+MwGL8whq11DyiMVwDFOwACbpOAVzkGSwEGL3l2YW+X0QojYfdIFa+8NNuZluc
 KVBFdLp8OpEFKRk2+DtVYEWtFm2lB21ChPsy+CXaqJW/jRMCF+0pPr09+OhD8nYWufe1
 WLQSO89TC69PW0nky1X1EHBTep2xfcKbDf/iapkDglaWUNyjV40EL+PXGPyBEVsfKacG
 cWdLouRMY5K047astTrs46+2+90bKU2akd6ZZ1IqAjPQvBvCwQwvp/eJpMB8t6ttS/X9
 AEWixx7azXq/jMn2qyvZKYBJOCyr8TyxohdLuQfDYhC7fylhUAnMk7UuWiTXTmFqOMz5 Mw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p93ak83gu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Mar 2023 18:12:17 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32CI5Z85019026;
	Sun, 12 Mar 2023 18:12:17 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p93ak83gf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Mar 2023 18:12:17 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32CA5hPR000962;
	Sun, 12 Mar 2023 18:12:15 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3p8h96j6e5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Mar 2023 18:12:15 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32CICBOx328218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 12 Mar 2023 18:12:12 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D6DA120040;
	Sun, 12 Mar 2023 18:12:11 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A519020043;
	Sun, 12 Mar 2023 18:12:09 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.41.125])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 12 Mar 2023 18:12:09 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v9 5/6] crash: forward memory_notify args to arch crash hotplug handler
Date: Sun, 12 Mar 2023 23:41:53 +0530
Message-Id: <20230312181154.278900-6-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230312181154.278900-1-sourabhjain@linux.ibm.com>
References: <20230312181154.278900-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KXe_PkQCbWRGhmpGR4yE2i_tLwlaVhlJ
X-Proofpoint-GUID: ZjAdMq697X50loBB8SDjtCtXUQ_slVLw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-12_04,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303120157
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
Cc: eric.devolder@oracle.com, bhe@redhat.com, mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org, ldufour@linux.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On PowePC memblock regions are used to prepare elfcorehdr which
describes the memory regions of the running kernel to the kdump kernel.
Since the notifier used for the memory hotplug crash handler gets
initiated before the update of the memblock region happens (as depicted
below) for the memory remove case, the newly prepared elfcorehdr still
holds the old memory regions. If the elfcorehdr is prepared with stale
memblock regions then the newly prepared elfcorehdr will still be
holding stale memory regions. And dump collection with stale elfcorehdr
will lead to dump collection failure or incomplete dump collection.

The sequence of actions done on PowerPC when an LMB memory hot removed:

 Initiate memory hot remove
          |
          v
 offline pages
          |
          v
 initiate memory notify call
 chain for MEM_OFFLINE event.  <---> Prepare new elfcorehdr and update
                                     the kdump kernel image.
          |
          v
 update memblock regions

Such challenges only exist for memory remove case. For the memory add
case the memory regions are updated first and then memory notify calls
the arch crash hotplug handler to update the elfcorehdr.

This patch passes additional information about the hot removed LMB to
the arch crash hotplug handler in the form of memory_notify object.

How passing memory_notify to arch crash hotplug handler will help?

memory_notify holds the start PFN and page count of the hot removed
memory. With that base address and the size of the hot removed memory
can be calculated and same can be used to avoid adding hot removed
memory region to get added in the elfcorehdr.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/include/asm/kexec.h |  2 +-
 arch/powerpc/kexec/core_64.c     |  3 ++-
 arch/x86/include/asm/kexec.h     |  2 +-
 arch/x86/kernel/crash.c          |  3 ++-
 include/linux/kexec.h            |  2 +-
 kernel/crash_core.c              | 14 +++++++-------
 6 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 826671bd8ff97..92f7a03c4af46 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -106,7 +106,7 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges);
 int machine_kexec_post_load(struct kimage *image);
 #define machine_kexec_post_load machine_kexec_post_load
 #if defined(CONFIG_CRASH_HOTPLUG)
-void arch_crash_handle_hotplug_event(struct kimage *image);
+void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
 #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
 #endif
 #endif
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 35de0aa0fe375..863d9261908cd 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -582,8 +582,9 @@ int update_cpus_node(void *fdt)
  * arch_crash_hotplug_handler() - Handle crash CPU/Memory hotplug events to update the
  *                                necessary kexec segments based on the hotplug event.
  * @image: the active struct kimage
+ * @arg: struct memory_notify data handler for memory hotplug and NULL for CPU hotplug
  */
-void arch_crash_handle_hotplug_event(struct kimage *image)
+void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 {
 	void *fdt;
 	int fdt_index;
diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
index 1bc852ce347d4..70c3b23b468b6 100644
--- a/arch/x86/include/asm/kexec.h
+++ b/arch/x86/include/asm/kexec.h
@@ -213,7 +213,7 @@ extern crash_vmclear_fn __rcu *crash_vmclear_loaded_vmcss;
 extern void kdump_nmi_shootdown_cpus(void);
 
 #ifdef CONFIG_CRASH_HOTPLUG
-void arch_crash_handle_hotplug_event(struct kimage *image);
+void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
 #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
 
 #ifdef CONFIG_HOTPLUG_CPU
diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index 8f7b0b7fba909..a57c05b43c740 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -445,11 +445,12 @@ int crash_load_segments(struct kimage *image)
 /**
  * arch_crash_handle_hotplug_event() - Handle hotplug elfcorehdr changes
  * @image: the active struct kimage
+ * @arg: struct memory_notify data handler for memory hotplug and NULL for CPU hotplug
  *
  * The new elfcorehdr is prepared in a kernel buffer, and then it is
  * written on top of the existing/old elfcorehdr.
  */
-void arch_crash_handle_hotplug_event(struct kimage *image)
+void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 {
 	void *elfbuf = NULL, *old_elfcorehdr;
 	unsigned long nr_mem_ranges;
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 0ac41f48de0b1..69765e6a92d0d 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -506,7 +506,7 @@ static inline void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages) {
 #endif
 
 #ifndef arch_crash_handle_hotplug_event
-static inline void arch_crash_handle_hotplug_event(struct kimage *image) { }
+static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
 #endif
 
 #ifndef crash_hotplug_cpu_support
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index d5cd0f67e8567..e3c2e791aed87 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -718,7 +718,7 @@ subsys_initcall(crash_save_vmcoreinfo_init);
  * list of segments it checks (since the elfcorehdr changes and thus
  * would require an update to purgatory itself to update the digest).
  */
-static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
+static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu, void *arg)
 {
 	/* Obtain lock while changing crash information */
 	if (kexec_trylock()) {
@@ -769,7 +769,7 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
 			image->hp_action = hp_action;
 
 			/* Now invoke arch-specific update handler */
-			arch_crash_handle_hotplug_event(image);
+			arch_crash_handle_hotplug_event(image, arg);
 
 			/* No longer handling a hotplug event */
 			image->hp_action = KEXEC_CRASH_HP_NONE;
@@ -785,17 +785,17 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
 	}
 }
 
-static int crash_memhp_notifier(struct notifier_block *nb, unsigned long val, void *v)
+static int crash_memhp_notifier(struct notifier_block *nb, unsigned long val, void *arg)
 {
 	switch (val) {
 	case MEM_ONLINE:
 		crash_handle_hotplug_event(KEXEC_CRASH_HP_ADD_MEMORY,
-			KEXEC_CRASH_HP_INVALID_CPU);
+			KEXEC_CRASH_HP_INVALID_CPU, arg);
 		break;
 
 	case MEM_OFFLINE:
 		crash_handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_MEMORY,
-			KEXEC_CRASH_HP_INVALID_CPU);
+			KEXEC_CRASH_HP_INVALID_CPU, arg);
 		break;
 	}
 	return NOTIFY_OK;
@@ -808,13 +808,13 @@ static struct notifier_block crash_memhp_nb = {
 
 static int crash_cpuhp_online(unsigned int cpu)
 {
-	crash_handle_hotplug_event(KEXEC_CRASH_HP_ADD_CPU, cpu);
+	crash_handle_hotplug_event(KEXEC_CRASH_HP_ADD_CPU, cpu, NULL);
 	return 0;
 }
 
 static int crash_cpuhp_offline(unsigned int cpu)
 {
-	crash_handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_CPU, cpu);
+	crash_handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_CPU, cpu, NULL);
 	return 0;
 }
 
-- 
2.39.1

