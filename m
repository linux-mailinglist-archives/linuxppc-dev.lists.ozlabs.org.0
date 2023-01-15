Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAEE766B1DA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Jan 2023 16:07:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nvz6j3Wrmz3fGS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jan 2023 02:07:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YLJMT+Xk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nvz0g1h47z3cFP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 02:02:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YLJMT+Xk;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Nvz0g1DM5z4xwl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jan 2023 02:02:43 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Nvz0g19fgz4xyK; Mon, 16 Jan 2023 02:02:43 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YLJMT+Xk;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Nvz0f58Chz4xwl
	for <linuxppc-dev@ozlabs.org>; Mon, 16 Jan 2023 02:02:42 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30F9tHmZ001570;
	Sun, 15 Jan 2023 15:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=t2qha38s4Y9vezBx/UmIzm/O0AJOOWRCFh0K/Ax2+Uo=;
 b=YLJMT+XkPXF8URwYfSWwwhC8xJ3iYr2ZToTp2vXgTbbIy/rCyPwcnRcLOsiVy7hwRlQV
 kdMkR7dmE/00lUgseUdu6cZ8qjF4yeCUgHf4dlTahzJfCAqW/VABbLGGG+R5DUDOE8lR
 /QGKfeXwWhBECYSsRNFLb3uEuS+oAxVVxb6krD8pohMFy14PWPJgjCkOjVpa+QZhJkMA
 ndhUlgh5SOO1XrIFEUdO83ofUnUwLrX5IPKgQAsx/NxmKTYiVj4vebqsHctXIdatXfIt
 Idqu8au+bGH8tVbLuUvRjpwB0AOxpE4mUQ0FCmgvjxL/NBcgzQoejlLMbsr5rr/t5FEg Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n4f9bke8r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jan 2023 15:02:34 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30FF0aWk035505;
	Sun, 15 Jan 2023 15:02:34 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3n4f9bke8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jan 2023 15:02:34 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30F1OOLV004686;
	Sun, 15 Jan 2023 15:02:32 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3n3m16hd33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 15 Jan 2023 15:02:31 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30FF2SFw44433912
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Jan 2023 15:02:28 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 82F6A20043;
	Sun, 15 Jan 2023 15:02:28 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A243820040;
	Sun, 15 Jan 2023 15:02:25 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.71.156])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 15 Jan 2023 15:02:25 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v7 5/8] crash: pass hotplug action type to arch crash hotplug handler
Date: Sun, 15 Jan 2023 20:32:03 +0530
Message-Id: <20230115150206.431528-6-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230115150206.431528-1-sourabhjain@linux.ibm.com>
References: <20230115150206.431528-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: D2hrQXzr7sCkl1a9ec32xyW4RCO86NXS
X-Proofpoint-GUID: vzjFFjPsFZ8ccoyhNBklxoPTxptQS9gT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-15_09,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301150112
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

On PowerPC, the crash update action for CPU and Memory hotplug events
is not the same. Since arch_crash_handle_hotplug_event is a common
crash hotplug handler for both CPU and Memory hot un/plug events,
it is hard to differentiate which hotplug event triggered the arch
crash hotplug handler and decide the crash update action accordingly.

Pass the hotplug action type to arch specific crash hotplug handler
so that corresponding crash update action can be taken based on the
hotplug action type.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/x86/include/asm/kexec.h | 2 +-
 arch/x86/kernel/crash.c      | 3 ++-
 include/linux/kexec.h        | 2 +-
 kernel/crash_core.c          | 2 +-
 4 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
index 1bc852ce347d4..ec33a592a2ddd 100644
--- a/arch/x86/include/asm/kexec.h
+++ b/arch/x86/include/asm/kexec.h
@@ -213,7 +213,7 @@ extern crash_vmclear_fn __rcu *crash_vmclear_loaded_vmcss;
 extern void kdump_nmi_shootdown_cpus(void);
 
 #ifdef CONFIG_CRASH_HOTPLUG
-void arch_crash_handle_hotplug_event(struct kimage *image);
+void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_action);
 #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
 
 #ifdef CONFIG_HOTPLUG_CPU
diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index 5186df48ce6c6..0026c5ad828d7 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -465,12 +465,13 @@ int crash_load_segments(struct kimage *image)
 /**
  * arch_crash_handle_hotplug_event() - Handle hotplug elfcorehdr changes
  * @image: the active struct kimage
+ * @hp_action: the hot un/plug action being handled
  *
  * To accurately reflect hot un/plug changes, the new elfcorehdr
  * is prepared in a kernel buffer, and then it is written on top
  * of the existing/old elfcorehdr.
  */
-void arch_crash_handle_hotplug_event(struct kimage *image)
+void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_action)
 {
 	void *elfbuf = NULL, *old_elfcorehdr;
 	unsigned long mem, memsz;
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 0b1ad1ac06e37..ea8ff85b0b436 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -509,7 +509,7 @@ static inline void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages) {
 #endif
 
 #ifndef arch_crash_handle_hotplug_event
-static inline void arch_crash_handle_hotplug_event(struct kimage *image) { }
+static inline void arch_crash_handle_hotplug_event(struct kimage *image, unsigned int hp_action) { }
 #endif
 
 #ifndef crash_hotplug_cpu_support
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 19f987b3851e8..bdf8c363a90aa 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -707,7 +707,7 @@ static void handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
 					cpu : KEXEC_CRASH_HP_INVALID_CPU;
 
 			/* Now invoke arch-specific update handler */
-			arch_crash_handle_hotplug_event(image);
+			arch_crash_handle_hotplug_event(image, hp_action);
 
 			/* No longer handling a hotplug event */
 			image->hotplug_event = false;
-- 
2.39.0

