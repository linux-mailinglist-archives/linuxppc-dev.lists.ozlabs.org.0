Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B22802B57
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 06:35:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hQFeN/mc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkC766ydyz3cLl
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Dec 2023 16:35:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hQFeN/mc;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkC5H36CYz30gH
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Dec 2023 16:33:55 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SkC5D3dHkz4xj7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Dec 2023 16:33:52 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SkC5D3YDpz4xjN; Mon,  4 Dec 2023 16:33:52 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hQFeN/mc;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SkC5D18qCz4xj7
	for <linuxppc-dev@ozlabs.org>; Mon,  4 Dec 2023 16:33:52 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B42S9kX020247;
	Mon, 4 Dec 2023 05:33:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=VEXj9O5D5jJrFYj0aClnCK51ZbUYD+SO5EgLxc9ORsc=;
 b=hQFeN/mcdaTi1xGF7sWaTu5rxiJyV+gO8jSG7CiK9uiIX+V3c9PUUcS0mcYdC1+vJTya
 y31X5auVL+4SbihANMb6uStLXmgdZryPlqCAsFZTjVxjCVn6fFnXGHgKQ9ORCeM8lr8x
 TMcVMvhsmX5CcZB3xC/g4TC4Ht/3W5fjT5gnDJpAR+JZUpKO9dM/sc55zgvLTvXXyH46
 /zQIU67psjXl37GAymcQ1HblzsO15+h4K1Cbfii3J4ZQQYu0ixTyyQE4Eh4Q4RnIbvLJ
 KsfqOA3jTpp53HrKuyfI6KaTrdmr17e+ACPc0/uvu90V85EYKa0uMCSmSuXWTTRjwZty eg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3us142av84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 05:33:14 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B44i7uO019549;
	Mon, 4 Dec 2023 05:33:14 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3us142av7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 05:33:14 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3B44neo7019461;
	Mon, 4 Dec 2023 05:33:12 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3urewt6g3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 05:33:12 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3B45X9tk20644554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Dec 2023 05:33:09 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 786AD20043;
	Mon,  4 Dec 2023 05:33:09 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5AE2620040;
	Mon,  4 Dec 2023 05:33:04 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.c4p-in.ibmmobiledemo.com (unknown [9.43.24.184])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 Dec 2023 05:33:04 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v13 1/6] crash: forward memory_notify arg to arch crash hotplug handler
Date: Mon,  4 Dec 2023 11:02:48 +0530
Message-ID: <20231204053253.25305-2-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231204053253.25305-1-sourabhjain@linux.ibm.com>
References: <20231204053253.25305-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6IiUOwniGi2DcEsfYWPVu0i5FISy1G23
X-Proofpoint-GUID: 9dR6rrsb3Pbz00T0Btl_ZM8ENlsUbwhR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_03,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2312040039
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, Eric DeVolder <eric.devolder@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Valentin Schneider <vschneid@redhat.com>, Baoquan He <bhe@redhat.com>, x86@kernel.org, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the event of memory hotplug or online/offline events, the crash
memory hotplug notifier `crash_memhp_notifier()` receives a
`memory_notify` object but doesn't forward that object to the
generic and architecture-specific crash hotplug handler.

The `memory_notify` object contains the starting PFN (Page Frame Number)
and the number of pages in the hot-removed memory. This information is
necessary for architectures like PowerPC to update/recreate the kdump
image, specifically `elfcorehdr`.

So update the function signature of `crash_handle_hotplug_event()` and
`arch_crash_handle_hotplug_event()` to accept the `memory_notify` object
as an argument from crash memory hotplug notifier.

Since no such object is available in the case of CPU hotplug event, the
crash CPU hotplug notifier `crash_cpuhp_online()` passes NULL to the
crash hotplug handler.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Akhil Raj <lf32.dev@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan He <bhe@redhat.com>
Cc: Borislav Petkov (AMD) <bp@alien8.de>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Eric DeVolder <eric.devolder@oracle.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Laurent Dufour <laurent.dufour@fr.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Mimi Zohar <zohar@linux.ibm.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: kexec@lists.infradead.org
Cc: x86@kernel.org
---
 arch/x86/include/asm/kexec.h |  2 +-
 arch/x86/kernel/crash.c      |  3 ++-
 include/linux/kexec.h        |  2 +-
 kernel/crash_core.c          | 14 +++++++-------
 4 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
index c9f6a6c5de3c..9bb6607e864e 100644
--- a/arch/x86/include/asm/kexec.h
+++ b/arch/x86/include/asm/kexec.h
@@ -208,7 +208,7 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image);
 extern void kdump_nmi_shootdown_cpus(void);
 
 #ifdef CONFIG_CRASH_HOTPLUG
-void arch_crash_handle_hotplug_event(struct kimage *image);
+void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
 #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
 
 #ifdef CONFIG_HOTPLUG_CPU
diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index c92d88680dbf..0d7b2657beb6 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -428,10 +428,11 @@ unsigned int arch_crash_get_elfcorehdr_size(void)
 /**
  * arch_crash_handle_hotplug_event() - Handle hotplug elfcorehdr changes
  * @image: a pointer to kexec_crash_image
+ * @arg: struct memory_notify handler for memory hotplug case and NULL for CPU hotplug case.
  *
  * Prepare the new elfcorehdr and replace the existing elfcorehdr.
  */
-void arch_crash_handle_hotplug_event(struct kimage *image)
+void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 {
 	void *elfbuf = NULL, *old_elfcorehdr;
 	unsigned long nr_mem_ranges;
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 8227455192b7..ee28c09a7fb0 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -483,7 +483,7 @@ static inline void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages) {
 #endif
 
 #ifndef arch_crash_handle_hotplug_event
-static inline void arch_crash_handle_hotplug_event(struct kimage *image) { }
+static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
 #endif
 
 int crash_check_update_elfcorehdr(void);
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index efe87d501c8c..b9190265fe52 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -935,7 +935,7 @@ int crash_check_update_elfcorehdr(void)
  * list of segments it checks (since the elfcorehdr changes and thus
  * would require an update to purgatory itself to update the digest).
  */
-static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
+static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu, void *arg)
 {
 	struct kimage *image;
 
@@ -997,7 +997,7 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
 	image->hp_action = hp_action;
 
 	/* Now invoke arch-specific update handler */
-	arch_crash_handle_hotplug_event(image);
+	arch_crash_handle_hotplug_event(image, arg);
 
 	/* No longer handling a hotplug event */
 	image->hp_action = KEXEC_CRASH_HP_NONE;
@@ -1013,17 +1013,17 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu)
 	crash_hotplug_unlock();
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
@@ -1036,13 +1036,13 @@ static struct notifier_block crash_memhp_nb = {
 
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
2.41.0

