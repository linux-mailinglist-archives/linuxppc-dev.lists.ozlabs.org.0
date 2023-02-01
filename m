Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F25685FE4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 07:45:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6C8v1wTpz3f7V
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 17:45:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JwCu/A9I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6C1s2Cjyz3cdS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 17:39:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JwCu/A9I;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4P6C1s1mW7z4xyj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 17:39:13 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4P6C1s1jdzz4xys; Wed,  1 Feb 2023 17:39:13 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JwCu/A9I;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4P6C1r6Wvsz4xyj
	for <linuxppc-dev@ozlabs.org>; Wed,  1 Feb 2023 17:39:12 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3116Wjrf026417;
	Wed, 1 Feb 2023 06:39:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=y3JyE/ljorhE+CyyIGMX0cM54uIomDXd1zy4tiS5wuM=;
 b=JwCu/A9IGhkfw51RX2We2GBKKPM//FXOLSIJ6CCKR9b3Rq/6lxtcfignI+46UBfvJ0YO
 6XjOAarPzFSfkVFDk3evSzYmidn0vbAfkwAam/llh/gxOa2jnctHLhAH3yxaVdzYotwV
 gN+ISGV3QdbwKC7kDx0Ubvj/TIvY3KJtiOEWUiGOvEVjyibkg/s2dT5Pb2w5KssYu5WL
 OWbgdJLBBvZWSGoBDeT4/uw0zCm870RFfojbMAw4Es9TTYioPHoCBBSiLe/M3dlSHJjr
 zqeHJBpG1iRP84ri1huIqxuZVohz3dcSC0wqPJpx9p4O2XD8aeVscFeNJcluDU5Q3H4R 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfjwdg4s9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 06:39:05 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3116aTwB003997;
	Wed, 1 Feb 2023 06:39:05 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfjwdg4rd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 06:39:05 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30VEGXlP013445;
	Wed, 1 Feb 2023 06:39:02 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ncvtycd84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 06:39:02 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3116cxbO44958020
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 06:38:59 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61FAD2004B;
	Wed,  1 Feb 2023 06:38:59 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4CD1F2004F;
	Wed,  1 Feb 2023 06:38:57 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.109.52])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Feb 2023 06:38:57 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v8 7/8] crash: forward memory_notify args to arch crash hotplug handler
Date: Wed,  1 Feb 2023 12:08:40 +0530
Message-Id: <20230201063841.965316-8-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201063841.965316-1-sourabhjain@linux.ibm.com>
References: <20230201063841.965316-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: F5eB6k2ymfWmUNExIuhzjYS8ePdUzkti
X-Proofpoint-ORIG-GUID: 5wntXt5cg04OnEd7nNn7BSk6Ih_0o-u0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_02,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010056
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

The way memory hot remove is handled on PowerPC, it is hard to update
the elfcorehdr without memory_notify args.

On PowePC memblock data structure is used to prepare elfcorehdr for kdump.
Since the notifier used for memory hotplug crash handler get initiated
before the memblock data structure update happens (as depicted below),
the newly prepared elfcorehdr still holds the old memory regions. So if
the system crash with obsolete elfcorehdr, makedumpfile failed to collect
vmcore.

Sequence of actions done on PowerPC to serve the memory hot remove:

 Initiate memory hot remove
          |
          v
 offline pages
          |
          v
 initiate memory notify call chain
 for MEM_OFFLINE event.
 (same is used for crash update)
          |
          v
 prepare new elfcorehdr for kdump using
 memblock data structure
          |
          v
 update memblock data structure

How passing memory_notify to arch crash hotplug handler will help?

memory_notify holds the start PFN and page count, with that base address
and size of hot unplugged memory can calculated and same can be use to
avoid hot unplugged memory region to get added in the elfcorehdr.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/include/asm/kexec.h |  2 +-
 arch/powerpc/kexec/core_64.c     |  3 ++-
 arch/x86/include/asm/kexec.h     |  3 ++-
 arch/x86/kernel/crash.c          |  4 +++-
 include/linux/kexec.h            |  6 +++++-
 kernel/crash_core.c              | 14 +++++++-------
 6 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index c2b8debc11a61..f49eec264e545 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -108,7 +108,7 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges);
 int machine_kexec_post_load(struct kimage *image);
 #define machine_kexec_post_load machine_kexec_post_load
 
-void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_action);
+void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_action, void *arg);
 #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
 
 #endif
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 5fdc9fe4e7fe0..27a360120bc55 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -620,11 +620,12 @@ int update_cpus_node(void *fdt)
  * arch_crash_hotplug_handler() - Handle hotplug kexec segements changes FDT, elfcorehdr
  * @image: the active struct kimage
  * @hp_action: the hot un/plug action being handled
+ * @arg: struct memory_notify data handler
  *
  * To accurately reflect CPU hot un/plug changes, the FDT must be updated with the
  * new list of CPUs.
  */
-void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_action)
+void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_action, void *arg)
 {
 	void *fdt;
 
diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
index ec33a592a2ddd..171edb8167a12 100644
--- a/arch/x86/include/asm/kexec.h
+++ b/arch/x86/include/asm/kexec.h
@@ -213,7 +213,8 @@ extern crash_vmclear_fn __rcu *crash_vmclear_loaded_vmcss;
 extern void kdump_nmi_shootdown_cpus(void);
 
 #ifdef CONFIG_CRASH_HOTPLUG
-void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_action);
+void arch_crash_handle_hotplug_event(struct kimage *image,
+				     unsigned int hp_action, void *arg);
 #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
 
 #ifdef CONFIG_HOTPLUG_CPU
diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index c0b5afad37565..bbe8e3cd0c61d 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -464,12 +464,14 @@ int crash_load_segments(struct kimage *image)
  * arch_crash_handle_hotplug_event() - Handle hotplug elfcorehdr changes
  * @image: the active struct kimage
  * @hp_action: the hot un/plug action being handled
+ * @arg: struct memory_notify data handler
  *
  * To accurately reflect hot un/plug changes, the new elfcorehdr
  * is prepared in a kernel buffer, and then it is written on top
  * of the existing/old elfcorehdr.
  */
-void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_action)
+void arch_crash_handle_hotplug_event(struct kimage *image,
+				     unsigned int hp_action, void *arg)
 {
 	void *elfbuf = NULL, *old_elfcorehdr;
 	unsigned long nr_mem_ranges;
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 5461a4ad50e2a..fe33f6aeed843 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -509,7 +509,11 @@ static inline void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages) {
 #endif
 
 #ifndef arch_crash_handle_hotplug_event
-static inline void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_action) { }
+static inline void arch_crash_handle_hotplug_event(struct kimage *image,
+						   unsigned int hp_action,
+						   void *arg)
+{
+}
 #endif
 
 #else /* !CONFIG_KEXEC_CORE */
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 3aede7187c8b4..f19978dcb1e65 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -727,7 +727,7 @@ subsys_initcall(crash_save_vmcoreinfo_init);
  * list of segments it checks (since the elfcorehdr changes and thus
  * would require an update to purgatory itself to update the digest).
  */
-static void handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
+static void handle_hotplug_event(unsigned int hp_action, unsigned int cpu, void *arg)
 {
 	/* Obtain lock while changing crash information */
 	if (kexec_trylock()) {
@@ -789,7 +789,7 @@ static void handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
 					cpu : KEXEC_CRASH_HP_INVALID_CPU;
 
 			/* Now invoke arch-specific update handler */
-			arch_crash_handle_hotplug_event(image, hp_action);
+			arch_crash_handle_hotplug_event(image, hp_action, arg);
 
 			/* No longer handling a hotplug event */
 			image->hotplug_event = false;
@@ -804,17 +804,17 @@ static void handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
 	}
 }
 
-static int crash_memhp_notifier(struct notifier_block *nb, unsigned long val, void *v)
+static int crash_memhp_notifier(struct notifier_block *nb, unsigned long val, void *arg)
 {
 	switch (val) {
 	case MEM_ONLINE:
 		handle_hotplug_event(KEXEC_CRASH_HP_ADD_MEMORY,
-			KEXEC_CRASH_HP_INVALID_CPU);
+			KEXEC_CRASH_HP_INVALID_CPU, arg);
 		break;
 
 	case MEM_OFFLINE:
 		handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_MEMORY,
-			KEXEC_CRASH_HP_INVALID_CPU);
+			KEXEC_CRASH_HP_INVALID_CPU, arg);
 		break;
 	}
 	return NOTIFY_OK;
@@ -827,13 +827,13 @@ static struct notifier_block crash_memhp_nb = {
 
 static int crash_cpuhp_online(unsigned int cpu)
 {
-	handle_hotplug_event(KEXEC_CRASH_HP_ADD_CPU, cpu);
+	handle_hotplug_event(KEXEC_CRASH_HP_ADD_CPU, cpu, NULL);
 	return 0;
 }
 
 static int crash_cpuhp_offline(unsigned int cpu)
 {
-	handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_CPU, cpu);
+	handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_CPU, cpu, NULL);
 	return 0;
 }
 
-- 
2.39.1

