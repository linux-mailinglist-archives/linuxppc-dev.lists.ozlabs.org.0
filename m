Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4BA858DEC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Feb 2024 09:18:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IfZmhqDH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TcMB726XFz3vcr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Feb 2024 19:18:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IfZmhqDH;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TcM7m5LBxz2yk5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Feb 2024 19:16:04 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TcM7m4tQHz4wcb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Feb 2024 19:16:04 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TcM7m4r59z4wyh; Sat, 17 Feb 2024 19:16:04 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IfZmhqDH;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TcM7m1kVNz4wcb
	for <linuxppc-dev@ozlabs.org>; Sat, 17 Feb 2024 19:16:04 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41H80lfd032081;
	Sat, 17 Feb 2024 08:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=uB4tCOhm8LejtS3NxunLwoceKL93JVBI2y62HREPt4w=;
 b=IfZmhqDHKKP2RLxLbc/+Zsqasw5Fzk1SbNr1atIyBGG9rZR6i53N30hbDZaFecLaUCow
 46YgyMCMoqxpmATZkBk2LwInLJHaVfL0V4TBmsDxzF94RoAdbE9pBUP9aX9T3Dbcmu81
 U0ciVr8I8DQDVdEe43RlRsc9AwJ+nkNVr/PgF82UqB1SkTSdY/2RIR0bRc3DjXmSFoWI
 /1pbZaMeQCvh+KRz1I9Rg48qchMBHMqBr2iuTdGqwoQWdNtXAHtOXQ9S1ag6/WmXGjVg
 S3Sp0hY+/+p7AzXPewQ+ZA5xou6BSTISXyX7+fC73a4mVmt7xxffFnSrBBPNI1jVbF/v JA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3warju8cpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 08:15:42 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41H8D78K023746;
	Sat, 17 Feb 2024 08:15:41 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3warju8cp1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 08:15:41 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41H6EpmH032600;
	Sat, 17 Feb 2024 08:15:41 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3w6kfu90u5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 17 Feb 2024 08:15:40 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41H8FZk543712902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 17 Feb 2024 08:15:37 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6251520043;
	Sat, 17 Feb 2024 08:15:35 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 979902004F;
	Sat, 17 Feb 2024 08:15:23 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.61.135.227])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 17 Feb 2024 08:15:23 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v16 2/5] crash: add a new kexec flag for hotplug support
Date: Sat, 17 Feb 2024 13:44:49 +0530
Message-ID: <20240217081452.164571-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240217081452.164571-1-sourabhjain@linux.ibm.com>
References: <20240217081452.164571-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: X_Et6AGbKUOe8aVPw0ALMh57wFrLeMr4
X-Proofpoint-GUID: 5zwFHjrrT5GGokxwIAlerSmtt6VGu8JQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-17_04,2024-02-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 adultscore=0 mlxlogscore=999 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxscore=0 bulkscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402170064
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

Commit a72bbec70da2 ("crash: hotplug support for kexec_load()")
introduced a new kexec flag, `KEXEC_UPDATE_ELFCOREHDR`. Kexec tool uses
this flag to indicate to the kernel that it is safe to modify the
elfcorehdr of the kdump image loaded using the kexec_load system call.

However, it is possible that architectures may need to update kexec
segments other then elfcorehdr. For example, FDT (Flatten Device Tree)
on PowerPC. Introducing a new kexec flag for every new kexec segment
may not be a good solution. Hence, a generic kexec flag bit,
`KEXEC_CRASH_HOTPLUG_SUPPORT`, is introduced to share the CPU/Memory
hotplug support intent between the kexec tool and the kernel for the
kexec_load system call.

Now, if the kexec tool sends KEXEC_CRASH_HOTPLUG_SUPPORT kexec flag to
the kernel, it indicates to the kernel that all the required kexec
segment is skipped from SHA calculation and it is safe to update kdump
image loaded using the kexec_load syscall.

While loading the kdump image using the kexec_load syscall, the
@update_elfcorehdr member of struct kimage is set if the kexec tool
sends the KEXEC_UPDATE_ELFCOREHDR kexec flag. This member is later used
to determine whether it is safe to update elfcorehdr on hotplug events.
However, with the introduction of the KEXEC_CRASH_HOTPLUG_SUPPORT kexec
flag, the kexec tool could mark all the required kexec segments on an
architecture as safe to update. So rename the @update_elfcorehdr to
@hotplug_support. If @hotplug_support is set, the kernel can safely
update all the required kexec segments of the kdump image during
CPU/Memory hotplug events.

Introduce an architecture-specific function to process kexec flags for
determining hotplug support. Set the @hotplug_support member of struct
kimage for both kexec_load and kexec_file_load system calls. This
simplifies kernel checks to identify hotplug support for the currently
loaded kdump image by just examining the value of @hotplug_support.

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
 arch/x86/include/asm/kexec.h | 11 ++---------
 arch/x86/kernel/crash.c      | 28 +++++++++++++++++-----------
 drivers/base/cpu.c           |  2 +-
 drivers/base/memory.c        |  2 +-
 include/linux/kexec.h        | 27 +++++++++++++++++----------
 include/uapi/linux/kexec.h   |  1 +
 kernel/crash_core.c          | 11 ++++-------
 kernel/kexec.c               |  4 ++--
 kernel/kexec_file.c          |  5 +++++
 9 files changed, 50 insertions(+), 41 deletions(-)

diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
index 9bb6607e864e..8be622e82ba8 100644
--- a/arch/x86/include/asm/kexec.h
+++ b/arch/x86/include/asm/kexec.h
@@ -211,15 +211,8 @@ extern void kdump_nmi_shootdown_cpus(void);
 void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
 #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
 
-#ifdef CONFIG_HOTPLUG_CPU
-int arch_crash_hotplug_cpu_support(void);
-#define crash_hotplug_cpu_support arch_crash_hotplug_cpu_support
-#endif
-
-#ifdef CONFIG_MEMORY_HOTPLUG
-int arch_crash_hotplug_memory_support(void);
-#define crash_hotplug_memory_support arch_crash_hotplug_memory_support
-#endif
+int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags);
+#define arch_crash_hotplug_support arch_crash_hotplug_support
 
 unsigned int arch_crash_get_elfcorehdr_size(void);
 #define crash_get_elfcorehdr_size arch_crash_get_elfcorehdr_size
diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index 44744e9c68ec..7072aaee2ea0 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -398,20 +398,26 @@ int crash_load_segments(struct kimage *image)
 #undef pr_fmt
 #define pr_fmt(fmt) "crash hp: " fmt
 
-/* These functions provide the value for the sysfs crash_hotplug nodes */
-#ifdef CONFIG_HOTPLUG_CPU
-int arch_crash_hotplug_cpu_support(void)
+int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags)
 {
-	return crash_check_update_elfcorehdr();
-}
-#endif
 
-#ifdef CONFIG_MEMORY_HOTPLUG
-int arch_crash_hotplug_memory_support(void)
-{
-	return crash_check_update_elfcorehdr();
-}
+#ifdef CONFIG_KEXEC_FILE
+	if (image->file_mode)
+		return 1;
 #endif
+	/*
+	 * Initially, crash hotplug support for kexec_load was added
+	 * with the KEXEC_UPDATE_ELFCOREHDR flag. Later, this
+	 * functionality was expanded to accommodate multiple kexec
+	 * segment updates, leading to the introduction of the
+	 * KEXEC_CRASH_HOTPLUG_SUPPORT kexec flag bit. Consequently,
+	 * when the kexec tool sends either of these flags, it indicates
+	 * that the required kexec segment (elfcorehdr) is excluded from
+	 * the SHA calculation.
+	 */
+	return (kexec_flags & KEXEC_UPDATE_ELFCOREHDR ||
+		kexec_flags & KEXEC_CRASH_HOTPLUG_SUPPORT);
+}
 
 unsigned int arch_crash_get_elfcorehdr_size(void)
 {
diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 47de0f140ba6..24eb52607151 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -306,7 +306,7 @@ static ssize_t crash_hotplug_show(struct device *dev,
 				     struct device_attribute *attr,
 				     char *buf)
 {
-	return sysfs_emit(buf, "%d\n", crash_hotplug_cpu_support());
+	return sysfs_emit(buf, "%d\n", crash_check_hotplug_support());
 }
 static DEVICE_ATTR_ADMIN_RO(crash_hotplug);
 #endif
diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 14f964a7719b..b80be8193970 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -514,7 +514,7 @@ static DEVICE_ATTR_RW(auto_online_blocks);
 static ssize_t crash_hotplug_show(struct device *dev,
 				       struct device_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d\n", crash_hotplug_memory_support());
+	return sysfs_emit(buf, "%d\n", crash_check_hotplug_support());
 }
 static DEVICE_ATTR_RO(crash_hotplug);
 #endif
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 802052d9c64b..175152b99cb7 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -317,8 +317,10 @@ struct kimage {
 	/* If set, we are using file mode kexec syscall */
 	unsigned int file_mode:1;
 #ifdef CONFIG_CRASH_HOTPLUG
-	/* If set, allow changes to elfcorehdr of kexec_load'd image */
-	unsigned int update_elfcorehdr:1;
+	/* If set, it is safe to update kexec segments that are
+	 * excluded from SHA calculation.
+	 */
+	unsigned int hotplug_support:1;
 #endif
 
 #ifdef ARCH_HAS_KIMAGE_ARCH
@@ -396,9 +398,10 @@ bool kexec_load_permitted(int kexec_image_type);
 
 /* List of defined/legal kexec flags */
 #ifndef CONFIG_KEXEC_JUMP
-#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_UPDATE_ELFCOREHDR)
+#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_UPDATE_ELFCOREHDR | KEXEC_CRASH_HOTPLUG_SUPPORT)
 #else
-#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_PRESERVE_CONTEXT | KEXEC_UPDATE_ELFCOREHDR)
+#define KEXEC_FLAGS    (KEXEC_ON_CRASH | KEXEC_PRESERVE_CONTEXT | KEXEC_UPDATE_ELFCOREHDR | \
+			KEXEC_CRASH_HOTPLUG_SUPPORT)
 #endif
 
 /* List of defined/legal kexec file flags */
@@ -486,14 +489,18 @@ static inline void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages) {
 static inline void arch_crash_handle_hotplug_event(struct kimage *image, void *arg) { }
 #endif
 
-int crash_check_update_elfcorehdr(void);
+int crash_check_hotplug_support(void);
 
-#ifndef crash_hotplug_cpu_support
-static inline int crash_hotplug_cpu_support(void) { return 0; }
-#endif
+#ifndef arch_crash_hotplug_support
+static inline int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags)
+{
 
-#ifndef crash_hotplug_memory_support
-static inline int crash_hotplug_memory_support(void) { return 0; }
+#ifdef CONFIG_KEXEC_FILE
+	if (image->file_mode)
+		return 1;
+#endif
+	return kexec_flags & KEXEC_CRASH_HOTPLUG_SUPPORT;
+}
 #endif
 
 #ifndef crash_get_elfcorehdr_size
diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
index c17bb096ea68..5ae1741ea8ea 100644
--- a/include/uapi/linux/kexec.h
+++ b/include/uapi/linux/kexec.h
@@ -13,6 +13,7 @@
 #define KEXEC_ON_CRASH		0x00000001
 #define KEXEC_PRESERVE_CONTEXT	0x00000002
 #define KEXEC_UPDATE_ELFCOREHDR	0x00000004
+#define KEXEC_CRASH_HOTPLUG_SUPPORT 0x00000008
 #define KEXEC_ARCH_MASK		0xffff0000
 
 /*
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index b692ec5955de..3142884a5a5b 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -886,7 +886,7 @@ static DEFINE_MUTEX(__crash_hotplug_lock);
  * It reflects the kernel's ability/permission to update the crash
  * elfcorehdr directly.
  */
-int crash_check_update_elfcorehdr(void)
+int crash_check_hotplug_support(void)
 {
 	int rc = 0;
 
@@ -898,10 +898,7 @@ int crash_check_update_elfcorehdr(void)
 		return 0;
 	}
 	if (kexec_crash_image) {
-		if (kexec_crash_image->file_mode)
-			rc = 1;
-		else
-			rc = kexec_crash_image->update_elfcorehdr;
+		rc = kexec_crash_image->hotplug_support;
 	}
 	/* Release lock now that update complete */
 	kexec_unlock();
@@ -942,8 +939,8 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
 
 	image = kexec_crash_image;
 
-	/* Check that updating elfcorehdr is permitted */
-	if (!(image->file_mode || image->update_elfcorehdr))
+	/* Check that kexec segments update is permitted */
+	if (!image->hotplug_support)
 		goto out;
 
 	if (hp_action == KEXEC_CRASH_HP_ADD_CPU ||
diff --git a/kernel/kexec.c b/kernel/kexec.c
index 8f35a5a42af8..9dc5b7ed5b73 100644
--- a/kernel/kexec.c
+++ b/kernel/kexec.c
@@ -130,8 +130,8 @@ static int do_kexec_load(unsigned long entry, unsigned long nr_segments,
 		image->preserve_context = 1;
 
 #ifdef CONFIG_CRASH_HOTPLUG
-	if (flags & KEXEC_UPDATE_ELFCOREHDR)
-		image->update_elfcorehdr = 1;
+	if ((flags & KEXEC_ON_CRASH) && arch_crash_hotplug_support(image, flags))
+		image->hotplug_support = 1;
 #endif
 
 	ret = machine_kexec_prepare(image);
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index bef2f6f2571b..4dddf9264a69 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -373,6 +373,11 @@ SYSCALL_DEFINE5(kexec_file_load, int, kernel_fd, int, initrd_fd,
 	if (ret)
 		goto out;
 
+#ifdef CONFIG_CRASH_HOTPLUG
+	if ((flags & KEXEC_FILE_ON_CRASH) && arch_crash_hotplug_support(image, flags))
+		image->hotplug_support = 1;
+#endif
+
 	ret = machine_kexec_prepare(image);
 	if (ret)
 		goto out;
-- 
2.43.0

