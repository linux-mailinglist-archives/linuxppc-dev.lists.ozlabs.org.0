Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CBE166B1DE
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jan 2023 16:09:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nvz8x1BnXz3fGP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 02:09:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QD51deLv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nvz0p5VgYz3cdK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 02:02:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QD51deLv;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Nvz0p561Dz4xyY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 02:02:50 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Nvz0p52bbz4xyZ; Mon, 16 Jan 2023 02:02:50 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QD51deLv;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Nvz0p1xLJz4xyY
	for <linuxppc-dev@ozlabs.org>; Mon, 16 Jan 2023 02:02:50 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30F8sanb010325;
	Sun, 15 Jan 2023 15:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=+gyol6r/Pst1LI5bqBQ3D306STNukPlm5VfxYpz8VCU=;
 b=QD51deLvqsqrU8yiwi30GkN8h2BKK5Wlh5krw6SYjmU9Lp4ph4fT0YPI/VM9GkgT3mrf
 QRluOkI8FkMDpm+7O27x4tWTuIwczfptyVzGpk6nCHpamd7ElCR1qBqQfRVKvOgIk9lg
 Z1Hlm1X2TxDI2WycefHBdQg1UCF28AH3hnYPbz5pa/FpZcVoMrNoucVlZn2hbBy2JyfT
 2lNAmIo7z08QmCmvvBcUg4HgF4KGUFB4G6LsXQuGgy6b4JdpIjFsVt9RxNdMjtmToNv6
 Y1WjYa1kX1SNWsS2m5X1sShafgYcbiRLm/7EE5jeTbr16G2FFGyP9Zsh6ilLFub6+j5Z Kw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n4ed247vw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jan 2023 15:02:41 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30FErD2i011090;
	Sun, 15 Jan 2023 15:02:41 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3n4ed247vb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jan 2023 15:02:41 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30F4hIpr016922;
	Sun, 15 Jan 2023 15:02:39 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3n3m1690rq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jan 2023 15:02:39 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30FF2Z0D43778422
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Jan 2023 15:02:35 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B4FA22004B;
	Sun, 15 Jan 2023 15:02:35 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC83520040;
	Sun, 15 Jan 2023 15:02:32 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.71.156])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 15 Jan 2023 15:02:32 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v7 7/8] crash: forward memory_notify args to arch crash hotplug handler
Date: Sun, 15 Jan 2023 20:32:05 +0530
Message-Id: <20230115150206.431528-8-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115150206.431528-1-sourabhjain@linux.ibm.com>
References: <20230115150206.431528-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MLXIohyfD6YRK73JzvtjTaqvtzh-TZMw
X-Proofpoint-ORIG-GUID: UHpbtf49rFnYu7elqn-csslKc_AupG1Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-15_09,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 mlxlogscore=999 impostorscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301150112
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
index e7cd4fd2becf5..743056f0bedf2 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -107,7 +107,7 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges);
 int machine_kexec_post_load(struct kimage *image);
 #define machine_kexec_post_load machine_kexec_post_load
 
-void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_action);
+void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_action, void *arg);
 #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
 
 #endif
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 7748b633c20fa..1f807b29db93f 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -575,11 +575,12 @@ int update_cpus_node(void *fdt)
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
index 0026c5ad828d7..6bdfefebdd27c 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -466,12 +466,14 @@ int crash_load_segments(struct kimage *image)
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
 	unsigned long mem, memsz;
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index ea8ff85b0b436..f640d3c30f41c 100644
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
 
 #ifndef crash_hotplug_cpu_support
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index bdf8c363a90aa..735f2022593fa 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -645,7 +645,7 @@ subsys_initcall(crash_save_vmcoreinfo_init);
  * list of segments it checks (since the elfcorehdr changes and thus
  * would require an update to purgatory itself to update the digest).
  */
-static void handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
+static void handle_hotplug_event(unsigned int hp_action, unsigned int cpu, void *arg)
 {
 	/* Obtain lock while changing crash information */
 	if (kexec_trylock()) {
@@ -707,7 +707,7 @@ static void handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
 					cpu : KEXEC_CRASH_HP_INVALID_CPU;
 
 			/* Now invoke arch-specific update handler */
-			arch_crash_handle_hotplug_event(image, hp_action);
+			arch_crash_handle_hotplug_event(image, hp_action, arg);
 
 			/* No longer handling a hotplug event */
 			image->hotplug_event = false;
@@ -722,17 +722,17 @@ static void handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
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
@@ -745,13 +745,13 @@ static struct notifier_block crash_memhp_nb = {
 
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
2.39.0

