Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39C7682AC85
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 11:53:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oR2nl9tE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T9hNm5P6cz3cRs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 21:53:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oR2nl9tE;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T9hMw41vlz30gC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jan 2024 21:53:00 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4T9hMq02TTz4wcc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jan 2024 21:52:55 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4T9hMp74GMz4wdC; Thu, 11 Jan 2024 21:52:54 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oR2nl9tE;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4T9hMp42zyz4wcc
	for <linuxppc-dev@ozlabs.org>; Thu, 11 Jan 2024 21:52:54 +1100 (AEDT)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40BApaq9018038;
	Thu, 11 Jan 2024 10:52:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=lsv68kKTUx/o5MygjBFB10MoOMwJTet+UBhNH34WYPc=;
 b=oR2nl9tErfaebCwY1w6Q1yovbpPm7rkAtclIwx5YZfaMgOjjqof9hrTmtesb4UDmiYz4
 eUMWboYR9GpkovZ/a/4xwlJq0F/oISgGxfw6iptK9FRtowbL6KZGmIiOm05jgwE3jP6p
 9jHV0tpU9nuicpXHKzvVimgBnlaHXlZ2iPX7nMwp6/pbz14yue0du3ebBKvnIYYzgpdX
 jd9J4kVREQdui1z1E+lM+a95JY6KPMt+x0m4EpqeXRohYRJnu3eim75oUp623yhLQroi
 GR9JYu0NQz76yFSOaRG900O9Nb4qe64K9jnl+5RHNOgG+DcTpINfHiK0UbLZ6C+SHm3g ug== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vjektrg71-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 10:52:13 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40BAp7h5017305;
	Thu, 11 Jan 2024 10:52:12 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vjektrg6n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 10:52:12 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40B8sVUg004400;
	Thu, 11 Jan 2024 10:52:11 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vfjpm2tdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 10:52:11 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40BAq8MD21037654
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 11 Jan 2024 10:52:08 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0FD0E2005A;
	Thu, 11 Jan 2024 10:52:08 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B79CC2004E;
	Thu, 11 Jan 2024 10:52:03 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.79.182.66])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 11 Jan 2024 10:52:03 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v15 2/5] crash: add a new kexec flag for hotplug support
Date: Thu, 11 Jan 2024 16:21:35 +0530
Message-ID: <20240111105138.251366-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240111105138.251366-1-sourabhjain@linux.ibm.com>
References: <20240111105138.251366-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: l9zN4I-v4P89AR2Ens-iMwHYtHCYuCOB
X-Proofpoint-ORIG-GUID: Najd7dpkQzSLtOObP_M7d9VFtFJjbB8M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-11_05,2024-01-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 mlxscore=0 clxscore=1011 suspectscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401110088
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
 arch/x86/include/asm/kexec.h |  3 +++
 arch/x86/kernel/crash.c      | 18 +++++++-----------
 drivers/base/cpu.c           |  2 +-
 drivers/base/memory.c        |  2 +-
 include/linux/kexec.h        | 25 +++++++++++++++----------
 include/uapi/linux/kexec.h   |  1 +
 kernel/crash_core.c          | 11 ++++-------
 kernel/kexec.c               |  4 ++--
 kernel/kexec_file.c          |  5 +++++
 9 files changed, 39 insertions(+), 32 deletions(-)

diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
index 9bb6607e864e..e791129fdf6c 100644
--- a/arch/x86/include/asm/kexec.h
+++ b/arch/x86/include/asm/kexec.h
@@ -211,6 +211,9 @@ extern void kdump_nmi_shootdown_cpus(void);
 void arch_crash_handle_hotplug_event(struct kimage *image, void *arg);
 #define arch_crash_handle_hotplug_event arch_crash_handle_hotplug_event
 
+int arch_crash_hotplug_support(struct kimage *image, unsigned long kexec_flags);
+#define arch_crash_hotplug_support arch_crash_hotplug_support
+
 #ifdef CONFIG_HOTPLUG_CPU
 int arch_crash_hotplug_cpu_support(void);
 #define crash_hotplug_cpu_support arch_crash_hotplug_cpu_support
diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index 44744e9c68ec..293b54bff706 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -398,20 +398,16 @@ int crash_load_segments(struct kimage *image)
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
+	return (kexec_flags & KEXEC_UPDATE_ELFCOREHDR ||
+		kexec_flags & KEXEC_CRASH_HOTPLUG_SUPPORT);
+}
 
 unsigned int arch_crash_get_elfcorehdr_size(void)
 {
diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 548491de818e..2f411ddfbd8b 100644
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
index 8a13babd826c..e70ab1d3428e 100644
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
index 802052d9c64b..7880d74dc5c4 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -317,8 +317,8 @@ struct kimage {
 	/* If set, we are using file mode kexec syscall */
 	unsigned int file_mode:1;
 #ifdef CONFIG_CRASH_HOTPLUG
-	/* If set, allow changes to elfcorehdr of kexec_load'd image */
-	unsigned int update_elfcorehdr:1;
+	/* If set, allow changes to kexec segments of kexec_load'd image */
+	unsigned int hotplug_support:1;
 #endif
 
 #ifdef ARCH_HAS_KIMAGE_ARCH
@@ -396,9 +396,10 @@ bool kexec_load_permitted(int kexec_image_type);
 
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
@@ -486,14 +487,18 @@ static inline void arch_kexec_pre_free_pages(void *vaddr, unsigned int pages) {
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
index ab1c8e79759d..111548ad03e9 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -876,7 +876,7 @@ DEFINE_MUTEX(__crash_hotplug_lock);
  * It reflects the kernel's ability/permission to update the crash
  * elfcorehdr directly.
  */
-int crash_check_update_elfcorehdr(void)
+int crash_check_hotplug_support(void)
 {
 	int rc = 0;
 
@@ -888,10 +888,7 @@ int crash_check_update_elfcorehdr(void)
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
@@ -932,8 +929,8 @@ static void crash_handle_hotplug_event(unsigned int hp_action, unsigned int cpu,
 
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
2.41.0

