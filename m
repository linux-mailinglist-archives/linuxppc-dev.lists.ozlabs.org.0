Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 146A680C34C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 09:33:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e+cWcfiw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SpZl43lPwz30YS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Dec 2023 19:33:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e+cWcfiw;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SpZkF0Nhmz30Dw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Dec 2023 19:32:37 +1100 (AEDT)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4SpZk81xXBz4x2W
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Dec 2023 19:32:32 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SpZk81skdz4xGR; Mon, 11 Dec 2023 19:32:32 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e+cWcfiw;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4SpZk76ZXYz4x2W
	for <linuxppc-dev@ozlabs.org>; Mon, 11 Dec 2023 19:32:31 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3BB8Jq1Q019019;
	Mon, 11 Dec 2023 08:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ClCyGkV69ChTqANGLzx7kHrqlqNQly9NJ7SHdk9MgaI=;
 b=e+cWcfiwSPWI2fs6WGuBnpzKAz5kg8ZoWJxB78sHHBJ1/DusC9A1qodPIBcnc/Y/ViZS
 5dz56BMJcMyTTv4QL2JK2o9WU82/q8GjV+S+l7gbG6GoofEPj7jiRijrqcPoGn4fotf4
 kjIOhUErahuLwZQNlLHG1Tl8AYdYo+iey8E1XEI2nHBn9kSz4qvGyUxWDVbR3PWgJy5m
 Uh2COciffIGWrK16mIGCAonEo6g2JhLzhWqXpOCLw8ULdx+CnQGFDETjiCwXSg0mSB/C
 7yYwuv+qKYVA6E8IFkKXynB8dAuoCSStP/QvmKYNrKHOedU+5kc8BxWqdwQCkt3qusyI Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uwwj9jpf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 08:31:54 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3BB8JwMl020273;
	Mon, 11 Dec 2023 08:31:53 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uwwj9jpea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 08:31:53 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3BB7v4jW012588;
	Mon, 11 Dec 2023 08:31:52 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uw3jng3cx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 08:31:52 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3BB8VmHX18088522
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 Dec 2023 08:31:48 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D0832004B;
	Mon, 11 Dec 2023 08:31:48 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F9D520043;
	Mon, 11 Dec 2023 08:31:37 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.c4p-in.ibmmobiledemo.com (unknown [9.177.92.36])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 11 Dec 2023 08:31:36 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v14 2/6] crash: make CPU and Memory hotplug support reporting flexible
Date: Mon, 11 Dec 2023 14:00:52 +0530
Message-ID: <20231211083056.340404-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231211083056.340404-1-sourabhjain@linux.ibm.com>
References: <20231211083056.340404-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mKXxonGtjeOtaIQEwGyuHeNVRkeU5kx6
X-Proofpoint-ORIG-GUID: MP-8xmKRXBdsqp4_NPijZceTCT_rDq2o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-11_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312110071
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
Cc: David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, Mimi Zohar <zohar@linux.ibm.com>, Eric DeVolder <eric.devolder@oracle.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Valentin Schneider <vschneid@redhat.com>, Baoquan He <bhe@redhat.com>, x86@kernel.org, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Laurent Dufour <laurent.dufour@fr.ibm.com>, Dave Young <dyoung@redhat.com>, Vivek Goyal <vgoyal@redhat.com>, Naveen N Rao <naveen@kernel.org>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Akhil Raj <lf32.dev@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Architectures' specific functions `arch_crash_hotplug_cpu_support()` and
`arch_crash_hotplug_memory_support()` advertise the kernel's capability
to update the kdump image on CPU and Memory hotplug events to userspace
via the sysfs interface. These architecture-specific functions need to
access various attributes of the `kexec_crash_image` object to determine
whether the kernel can update the kdump image and advertise this
information to userspace accordingly.

As the architecture-specific code is not exposed to the APIs required to
acquire the lock for accessing the `kexec_crash_image` object, it calls
a generic function, `crash_check_update_elfcorehdr()`, to determine
whether the kernel can update the kdump image or not.

The lack of access to the `kexec_crash_image` object in
architecture-specific code restricts architectures from performing
additional architecture-specific checks required to determine if the
kdump image is updatable or not. For instance, on PowerPC, the kernel
can update the kdump image only if both the elfcorehdr and FDT are
marked as updatable for the `kexec_load` system call.

So define two generic functions, `crash_hotplug_cpu_support()` and
`crash_hotplug_memory_support()`, which are called when userspace
attempts to read the crash CPU and Memory hotplug support via the sysfs
interface. These functions take the necessary locks needed to access the
`kexec_crash_image` object and then forward it to the
architecture-specific handler to do the rest.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Akhil Raj <lf32.dev@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
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
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: kexec@lists.infradead.org
Cc: x86@kernel.org
---
 arch/x86/include/asm/kexec.h |  8 ++++----
 arch/x86/kernel/crash.c      | 20 +++++++++++++++-----
 include/linux/kexec.h        | 13 +++++++------
 kernel/crash_core.c          | 23 +++++++++++++++++------
 4 files changed, 43 insertions(+), 21 deletions(-)

diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
index 9bb6607e864e..5c88d27b086d 100644
--- a/arch/x86/include/asm/kexec.h
+++ b/arch/x86/include/asm/kexec.h
@@ -212,13 +212,13 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
 #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
 
 #ifdef CONFIG_HOTPLUG_CPU
-int arch_crash_hotplug_cpu_support(void);
-#define crash_hotplug_cpu_support arch_crash_hotplug_cpu_support
+int arch_crash_hotplug_cpu_support(struct kimage *image);
+#define arch_crash_hotplug_cpu_support arch_crash_hotplug_cpu_support
 #endif
 
 #ifdef CONFIG_MEMORY_HOTPLUG
-int arch_crash_hotplug_memory_support(void);
-#define crash_hotplug_memory_support arch_crash_hotplug_memory_support
+int arch_crash_hotplug_memory_support(struct kimage *image);
+#define arch_crash_hotplug_memory_support arch_crash_hotplug_memory_support
 #endif
 
 unsigned int arch_crash_get_elfcorehdr_size(void);
diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index 0d7b2657beb6..ad5941665589 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -398,18 +398,28 @@ int crash_load_segments(struct kimage *image)
 #undef pr_fmt
 #define pr_fmt(fmt) "crash hp: " fmt
 
-/* These functions provide the value for the sysfs crash_hotplug nodes */
+#if defined(CONFIG_HOTPLUG_CPU) || defined(CONFIG_MEMORY_HOTPLUG)
+static int crash_hotplug_support(struct kimage *image)
+{
+	if (image->file_mode)
+		return 1;
+
+	return image->update_elfcorehdr;
+}
+#endif
+
 #ifdef CONFIG_HOTPLUG_CPU
-int arch_crash_hotplug_cpu_support(void)
+/* These functions provide the value for the sysfs crash_hotplug nodes */
+int arch_crash_hotplug_cpu_support(struct kimage *image)
 {
-	return crash_check_update_elfcorehdr();
+	return crash_hotplug_support(image);
 }
 #endif
 
 #ifdef CONFIG_MEMORY_HOTPLUG
-int arch_crash_hotplug_memory_support(void)
+int arch_crash_hotplug_memory_support(struct kimage *image)
 {
-	return crash_check_update_elfcorehdr();
+	return crash_hotplug_support(image);
 }
 #endif
 
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index ee28c09a7fb0..0f6ea35879ee 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -486,16 +486,17 @@ static inline void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages) {
 static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
 #endif
 
-int crash_check_update_elfcorehdr(void);
-
-#ifndef crash_hotplug_cpu_support
-static inline int crash_hotplug_cpu_support(void) { return 0; }
+#ifndef arch_crash_hotplug_cpu_support
+static inline int arch_crash_hotplug_cpu_support(struct kimage *image) { return 0; }
 #endif
 
-#ifndef crash_hotplug_memory_support
-static inline int crash_hotplug_memory_support(void) { return 0; }
+#ifndef arch_crash_hotplug_memory_support
+static inline int arch_crash_hotplug_memory_support(struct kimage *image) { return 0; }
 #endif
 
+extern int crash_hotplug_cpu_support(void);
+extern int crash_hotplug_memory_support(void);
+
 #ifndef crash_get_elfcorehdr_size
 static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
 #endif
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index b9190265fe52..b621f03c1104 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -892,12 +892,14 @@ DEFINE_MUTEX(__crash_hotplug_lock);
 #define crash_hotplug_lock() mutex_lock(&__crash_hotplug_lock)
 #define crash_hotplug_unlock() mutex_unlock(&__crash_hotplug_lock)
 
+#define CPU_HOTPLUG	0
+#define MEM_HOTPLUG	1
 /*
  * This routine utilized when the crash_hotplug sysfs node is read.
  * It reflects the kernel's ability/permission to update the crash
  * elfcorehdr directly.
  */
-int crash_check_update_elfcorehdr(void)
+static int crash_hotplug_support(int hotplug)
 {
 	int rc = 0;
 
@@ -909,18 +911,27 @@ int crash_check_update_elfcorehdr(void)
 		return 0;
 	}
 	if (kexec_crash_image) {
-		if (kexec_crash_image->file_mode)
-			rc = 1;
-		else
-			rc = kexec_crash_image->update_elfcorehdr;
+		if (hotplug == CPU_HOTPLUG)
+			rc = arch_crash_hotplug_cpu_support(kexec_crash_image);
+		else if (hotplug == MEM_HOTPLUG)
+			rc = arch_crash_hotplug_memory_support(kexec_crash_image);
 	}
 	/* Release lock now that update complete */
 	kexec_unlock();
 	crash_hotplug_unlock();
-
 	return rc;
 }
 
+int crash_hotplug_cpu_support(void)
+{
+	return crash_hotplug_support(CPU_HOTPLUG);
+}
+
+int crash_hotplug_memory_support(void)
+{
+	return crash_hotplug_support(MEM_HOTPLUG);
+}
+
 /*
  * To accurately reflect hot un/plug changes of cpu and memory resources
  * (including onling and offlining of those resources), the elfcorehdr
-- 
2.41.0

