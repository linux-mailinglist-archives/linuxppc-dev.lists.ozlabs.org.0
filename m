Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 06889631756
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 00:30:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFmwp5qRzz3dvW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 10:30:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eXvdNAif;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFmpp28HHz3cLm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 10:25:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eXvdNAif;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4NFmpp1jtzz4x1V
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 10:25:38 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4NFmpp1g7hz4xN3; Mon, 21 Nov 2022 10:25:38 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eXvdNAif;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4NFmpn5mk7z4x1V
	for <linuxppc-dev@ozlabs.org>; Mon, 21 Nov 2022 10:25:37 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AKIbpLG004933;
	Sun, 20 Nov 2022 23:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=00JsxcYrCR8NexFZck5bPMHVN/KHJxwaPkhGEU869go=;
 b=eXvdNAifpdF2uWlzuOF3xjtRpoNR6UvDhXrd9wKPV81/ZaArX4uTIiPcffckiUqqgtWw
 HTAerbMpvf+ApvBVi3L4rcD2ZPsOjfARwwtKrFRjYnaeZtGRxm/VAboVMUG9nKgvxHyH
 ZZif3SALT7v8xUlakYTKRFofWEQJUMITcY1RPslAQgUrckNonnhjKwIT2aqU3HmpvbbP
 fwKV98XJObEjcslQb8naJi2x7Yj1INnpX9RVMW8Ygv47dB6twd8Gzq5Nq6g18KRLGYXo
 lCTKY4iYG+cGR1W3aD2phnggyAmXoRp6UBNg1hwyp0TD+Kbt7gxZ3nTsCmiyR2QGAFgg bA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ky9311rp4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Nov 2022 23:25:29 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AKNPSCf001647;
	Sun, 20 Nov 2022 23:25:28 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3ky9311rnu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Nov 2022 23:25:28 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AKNKf0n027240;
	Sun, 20 Nov 2022 23:25:27 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3kxps8st0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Nov 2022 23:25:26 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AKNPOM77275082
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Nov 2022 23:25:24 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8A2ADAE04D;
	Sun, 20 Nov 2022 23:25:24 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94B4AAE055;
	Sun, 20 Nov 2022 23:25:22 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.9.248])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sun, 20 Nov 2022 23:25:22 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 5/6] crash: forward memory_notify args to arch crash hotplug handler
Date: Mon, 21 Nov 2022 04:55:07 +0530
Message-Id: <20221120232508.327554-6-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221120232508.327554-1-sourabhjain@linux.ibm.com>
References: <20221120232508.327554-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: L0p7wLGIek_ssokIIbOBVeiJAeZemtCw
X-Proofpoint-ORIG-GUID: dR7gkw__hWFauXz6PSIkpUtZv6u8BCVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-20_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211200194
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
Cc: mahesh@linux.vnet.ibm.com, eric.devolder@oracle.com, kexec@lists.infradead.org, bhe@redhat.com, hbathini@linux.ibm.com
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
 arch/x86/include/asm/kexec.h     |  2 +-
 arch/x86/kernel/crash.c          |  3 ++-
 include/linux/kexec.h            |  3 ++-
 kernel/crash_core.c              | 16 +++++++---------
 6 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index a4c0a035cb407..f32126a22f6ed 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -109,7 +109,7 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges);
 int machine_kexec_post_load(struct kimage *image);
 #define machine_kexec_post_load machine_kexec_post_load
 
-void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_action);
+void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_action, void *arg);
 #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
 
 #endif
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 3dea1ce6b469c..6803d7e352a96 100644
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
index d72d347bd1d3b..e105a6b8a51b6 100644
--- a/arch/x86/include/asm/kexec.h
+++ b/arch/x86/include/asm/kexec.h
@@ -213,7 +213,7 @@ extern crash_vmclear_fn __rcu *crash_vmclear_loaded_vmcss;
 extern void kdump_nmi_shootdown_cpus(void);
 
 void arch_crash_handle_hotplug_event(struct kimage *image,
-				    unsigned int hp_action);
+				     unsigned int hp_action, void *arg);
 #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
 
 #ifdef CONFIG_HOTPLUG_CPU
diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index 2687acf28977f..428121560c3cd 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -457,13 +457,14 @@ int crash_load_segments(struct kimage *image)
  * arch_crash_handle_hotplug_event() - Handle hotplug elfcorehdr changes
  * @image: the active struct kimage
  * @hp_action: the hot un/plug action being handled
+ * @arg: struct memory_notify data handler
  *
  * To accurately reflect hot un/plug changes, the new elfcorehdr
  * is prepared in a kernel buffer, and then it is written on top
  * of the existing/old elfcorehdr.
  */
 void arch_crash_handle_hotplug_event(struct kimage *image,
-				    unsigned int hp_action)
+				     unsigned int hp_action, void *arg)
 {
 	unsigned long mem, memsz;
 	unsigned long elfsz = 0;
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index e2dbbcbf37dcc..43b668484264b 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -537,7 +537,8 @@ static inline void arch_unmap_crash_pages(void *ptr)
 
 #ifndef arch_crash_handle_hotplug_event
 static inline void arch_crash_handle_hotplug_event(struct kimage *image,
-						  unsigned int hp_action)
+						   unsigned int hp_action,
+						   void *arg)
 {
 }
 #endif
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index f6cccdcadc9f3..3132466b5e429 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -641,7 +641,7 @@ subsys_initcall(crash_save_vmcoreinfo_init);
  * list of segments it checks (since the elfcorehdr changes and thus
  * would require an update to purgatory itself to update the digest).
  */
-static void handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
+static void handle_hotplug_event(unsigned int hp_action, unsigned int cpu, void *arg)
 {
 	/* Obtain lock while changing crash information */
 	if (kexec_trylock()) {
@@ -704,7 +704,7 @@ static void handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
 					cpu : KEXEC_CRASH_HP_INVALID_CPU;
 
 			/* Now invoke arch-specific update handler */
-			arch_crash_handle_hotplug_event(image, hp_action);
+			arch_crash_handle_hotplug_event(image, hp_action, arg);
 
 			/* No longer handling a hotplug event */
 			image->hotplug_event = false;
@@ -719,17 +719,15 @@ static void handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
 	}
 }
 
-static int crash_memhp_notifier(struct notifier_block *nb, unsigned long val, void *v)
+static int crash_memhp_notifier(struct notifier_block *nb, unsigned long val, void *arg)
 {
 	switch (val) {
 	case MEM_ONLINE:
-		handle_hotplug_event(KEXEC_CRASH_HP_ADD_MEMORY,
-			KEXEC_CRASH_HP_INVALID_CPU);
+		handle_hotplug_event(KEXEC_CRASH_HP_ADD_MEMORY, 0, arg);
 		break;
 
 	case MEM_OFFLINE:
-		handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_MEMORY,
-			KEXEC_CRASH_HP_INVALID_CPU);
+		handle_hotplug_event(KEXEC_CRASH_HP_REMOVE_MEMORY, 0, arg);
 		break;
 	}
 	return NOTIFY_OK;
@@ -742,13 +740,13 @@ static struct notifier_block crash_memhp_nb = {
 
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
2.38.1

