Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C55CE170900
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 20:38:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SR0l4sN0zDqWP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 06:37:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nayna@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SQz20DBfzDqdx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 06:36:28 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01QJAFjO021620
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 14:10:24 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydcnttwme-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 14:10:23 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <nayna@linux.ibm.com>;
 Wed, 26 Feb 2020 19:10:18 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 26 Feb 2020 19:10:15 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01QJAEhm53674226
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Feb 2020 19:10:14 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0150C11C04C;
 Wed, 26 Feb 2020 19:10:14 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 71B3111C058;
 Wed, 26 Feb 2020 19:10:11 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.160.92.140])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 26 Feb 2020 19:10:11 +0000 (GMT)
From: Nayna Jain <nayna@linux.ibm.com>
To: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-efi@vger.kernel.org, linux-s390@vger.kernel.org
Subject: [PATCH] ima: add a new CONFIG for loading arch-specific policies
Date: Wed, 26 Feb 2020 14:10:07 -0500
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
x-cbid: 20022619-0008-0000-0000-00000356B53E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022619-0009-0000-0000-00004A77D515
Message-Id: <1582744207-25969-1-git-send-email-nayna@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-26_07:2020-02-26,
 2020-02-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1011
 malwarescore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002260119
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
Cc: Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org,
 zohar@linux.ibm.com, Philipp Rudo <prudo@linux.ibm.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Every time a new architecture defines the IMA architecture specific
functions - arch_ima_get_secureboot() and arch_ima_get_policy(), the IMA
include file needs to be updated. To avoid this "noise", this patch
defines a new IMA Kconfig IMA_SECURE_AND_OR_TRUSTED_BOOT option, allowing
the different architectures to select it.

Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Philipp Rudo <prudo@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Kconfig           | 2 +-
 arch/s390/Kconfig              | 1 +
 arch/x86/Kconfig               | 1 +
 include/linux/ima.h            | 3 +--
 security/integrity/ima/Kconfig | 9 +++++++++
 5 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 497b7d0b2d7e..b8ce1b995633 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -246,6 +246,7 @@ config PPC
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
 	select VIRT_TO_BUS			if !PPC64
+	select IMA_SECURE_AND_OR_TRUSTED_BOOT	if PPC_SECURE_BOOT
 	#
 	# Please keep this list sorted alphabetically.
 	#
@@ -978,7 +979,6 @@ config PPC_SECURE_BOOT
 	prompt "Enable secure boot support"
 	bool
 	depends on PPC_POWERNV
-	depends on IMA_ARCH_POLICY
 	help
 	  Systems with firmware secure boot enabled need to define security
 	  policies to extend secure boot to the OS. This config allows a user
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 8abe77536d9d..90ff3633ade6 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -195,6 +195,7 @@ config S390
 	select ARCH_HAS_FORCE_DMA_UNENCRYPTED
 	select SWIOTLB
 	select GENERIC_ALLOCATOR
+	select IMA_SECURE_AND_OR_TRUSTED_BOOT
 
 
 config SCHED_OMIT_FRAME_POINTER
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index beea77046f9b..cafa66313fe2 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -230,6 +230,7 @@ config X86
 	select VIRT_TO_BUS
 	select X86_FEATURE_NAMES		if PROC_FS
 	select PROC_PID_ARCH_STATUS		if PROC_FS
+	select IMA_SECURE_AND_OR_TRUSTED_BOOT	if EFI
 
 config INSTRUCTION_DECODER
 	def_bool y
diff --git a/include/linux/ima.h b/include/linux/ima.h
index 1659217e9b60..aefe758f4466 100644
--- a/include/linux/ima.h
+++ b/include/linux/ima.h
@@ -30,8 +30,7 @@ extern void ima_kexec_cmdline(const void *buf, int size);
 extern void ima_add_kexec_buffer(struct kimage *image);
 #endif
 
-#if (defined(CONFIG_X86) && defined(CONFIG_EFI)) || defined(CONFIG_S390) \
-	|| defined(CONFIG_PPC_SECURE_BOOT)
+#ifdef CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT
 extern bool arch_ima_get_secureboot(void);
 extern const char * const *arch_get_ima_policy(void);
 #else
diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
index 3f3ee4e2eb0d..d17972aa413a 100644
--- a/security/integrity/ima/Kconfig
+++ b/security/integrity/ima/Kconfig
@@ -327,3 +327,12 @@ config IMA_QUEUE_EARLY_BOOT_KEYS
 	depends on IMA_MEASURE_ASYMMETRIC_KEYS
 	depends on SYSTEM_TRUSTED_KEYRING
 	default y
+
+config IMA_SECURE_AND_OR_TRUSTED_BOOT
+	bool
+	depends on IMA
+	depends on IMA_ARCH_POLICY
+	default n
+	help
+	   This option is selected by architectures to enable secure and/or
+	   trusted boot based on IMA runtime policies.
-- 
2.18.1

