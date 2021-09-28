Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A47D41B740
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 21:12:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJq0418Gyz3cGR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Sep 2021 05:12:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=dkim header.b=jtxYO/r2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=alien8.de (client-ip=2a01:4f8:190:11c2::b:1457;
 helo=mail.skyhub.de; envelope-from=bp@alien8.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256
 header.s=dkim header.b=jtxYO/r2; dkim-atps=neutral
Received: from mail.skyhub.de (mail.skyhub.de [IPv6:2a01:4f8:190:11c2::b:1457])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJpxH6XrFz2yMy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Sep 2021 05:10:27 +1000 (AEST)
Received: from zn.tnic (p200300ec2f13b20078349fd04295260b.dip0.t-ipconnect.de
 [IPv6:2003:ec:2f13:b200:7834:9fd0:4295:260b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.skyhub.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id D3CBA1EC0752;
 Tue, 28 Sep 2021 21:10:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=dkim;
 t=1632856221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tI5EKQyiJ5raj9g6K0LwQyKzz9oZ1IWFygzYqGLLXlI=;
 b=jtxYO/r269DfmnwCak/7lSzy7BxpGJEwUtOgQ1mfz1IJsyIbDJZwKE1zPG7z0Qr+qwkov1
 699yIvchf1BPahMru19zZ+k+cLw1QtutQLg0TfBisiMooan1gV7VAIrqrF6Adoj3KyA2OU
 Wz9Rnc6x8btJ/HpB/iZkiCjypBwqRNY=
From: Borislav Petkov <bp@alien8.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 3/8] x86/sev: Add an x86 version of cc_platform_has()
Date: Tue, 28 Sep 2021 21:10:04 +0200
Message-Id: <20210928191009.32551-4-bp@alien8.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210928191009.32551-1-bp@alien8.de>
References: <20210928191009.32551-1-bp@alien8.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: "Kuppuswamy, Sathyanarayanan" <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-s390@vger.kernel.org, Andi Kleen <ak@linux.intel.com>,
 Baoquan He <bhe@redhat.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Dave Young <dyoung@redhat.com>, Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 "Kirill A. Shutemov" <kirill@shutemov.name>, kexec@lists.infradead.org,
 iommu@lists.linux-foundation.org, Daniel Vetter <daniel@ffwll.ch>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Tom Lendacky <thomas.lendacky@amd.com>

Introduce an x86 version of the cc_platform_has() function. This will be
used to replace vendor specific calls like sme_active(), sev_active(),
etc.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Borislav Petkov <bp@suse.de>
---
 arch/x86/Kconfig                   |  1 +
 arch/x86/include/asm/mem_encrypt.h |  1 +
 arch/x86/kernel/Makefile           |  6 +++
 arch/x86/kernel/cc_platform.c      | 69 ++++++++++++++++++++++++++++++
 arch/x86/mm/mem_encrypt.c          |  1 +
 5 files changed, 78 insertions(+)
 create mode 100644 arch/x86/kernel/cc_platform.c

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index ab83c22d274e..9f190ec4f953 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1518,6 +1518,7 @@ config AMD_MEM_ENCRYPT
 	select ARCH_HAS_FORCE_DMA_UNENCRYPTED
 	select INSTRUCTION_DECODER
 	select ARCH_HAS_RESTRICTED_VIRTIO_MEMORY_ACCESS
+	select ARCH_HAS_CC_PLATFORM
 	help
 	  Say yes to enable support for the encryption of system memory.
 	  This requires an AMD processor that supports Secure Memory
diff --git a/arch/x86/include/asm/mem_encrypt.h b/arch/x86/include/asm/mem_encrypt.h
index 9c80c68d75b5..3fb9f5ebefa4 100644
--- a/arch/x86/include/asm/mem_encrypt.h
+++ b/arch/x86/include/asm/mem_encrypt.h
@@ -13,6 +13,7 @@
 #ifndef __ASSEMBLY__
 
 #include <linux/init.h>
+#include <linux/cc_platform.h>
 
 #include <asm/bootparam.h>
 
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 8f4e8fa6ed75..2ff3e600f426 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -21,6 +21,7 @@ CFLAGS_REMOVE_ftrace.o = -pg
 CFLAGS_REMOVE_early_printk.o = -pg
 CFLAGS_REMOVE_head64.o = -pg
 CFLAGS_REMOVE_sev.o = -pg
+CFLAGS_REMOVE_cc_platform.o = -pg
 endif
 
 KASAN_SANITIZE_head$(BITS).o				:= n
@@ -29,6 +30,7 @@ KASAN_SANITIZE_dumpstack_$(BITS).o			:= n
 KASAN_SANITIZE_stacktrace.o				:= n
 KASAN_SANITIZE_paravirt.o				:= n
 KASAN_SANITIZE_sev.o					:= n
+KASAN_SANITIZE_cc_platform.o				:= n
 
 # With some compiler versions the generated code results in boot hangs, caused
 # by several compilation units. To be safe, disable all instrumentation.
@@ -47,6 +49,7 @@ endif
 KCOV_INSTRUMENT		:= n
 
 CFLAGS_head$(BITS).o	+= -fno-stack-protector
+CFLAGS_cc_platform.o	+= -fno-stack-protector
 
 CFLAGS_irq.o := -I $(srctree)/$(src)/../include/asm/trace
 
@@ -147,6 +150,9 @@ obj-$(CONFIG_UNWINDER_FRAME_POINTER)	+= unwind_frame.o
 obj-$(CONFIG_UNWINDER_GUESS)		+= unwind_guess.o
 
 obj-$(CONFIG_AMD_MEM_ENCRYPT)		+= sev.o
+
+obj-$(CONFIG_ARCH_HAS_CC_PLATFORM)	+= cc_platform.o
+
 ###
 # 64 bit specific files
 ifeq ($(CONFIG_X86_64),y)
diff --git a/arch/x86/kernel/cc_platform.c b/arch/x86/kernel/cc_platform.c
new file mode 100644
index 000000000000..03bb2f343ddb
--- /dev/null
+++ b/arch/x86/kernel/cc_platform.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Confidential Computing Platform Capability checks
+ *
+ * Copyright (C) 2021 Advanced Micro Devices, Inc.
+ *
+ * Author: Tom Lendacky <thomas.lendacky@amd.com>
+ */
+
+#include <linux/export.h>
+#include <linux/cc_platform.h>
+#include <linux/mem_encrypt.h>
+
+#include <asm/processor.h>
+
+static bool __maybe_unused intel_cc_platform_has(enum cc_attr attr)
+{
+#ifdef CONFIG_INTEL_TDX_GUEST
+	return false;
+#else
+	return false;
+#endif
+}
+
+/*
+ * SME and SEV are very similar but they are not the same, so there are
+ * times that the kernel will need to distinguish between SME and SEV. The
+ * cc_platform_has() function is used for this.  When a distinction isn't
+ * needed, the CC_ATTR_MEM_ENCRYPT attribute can be used.
+ *
+ * The trampoline code is a good example for this requirement.  Before
+ * paging is activated, SME will access all memory as decrypted, but SEV
+ * will access all memory as encrypted.  So, when APs are being brought
+ * up under SME the trampoline area cannot be encrypted, whereas under SEV
+ * the trampoline area must be encrypted.
+ */
+static bool amd_cc_platform_has(enum cc_attr attr)
+{
+#ifdef CONFIG_AMD_MEM_ENCRYPT
+	switch (attr) {
+	case CC_ATTR_MEM_ENCRYPT:
+		return sme_me_mask;
+
+	case CC_ATTR_HOST_MEM_ENCRYPT:
+		return sme_me_mask && !(sev_status & MSR_AMD64_SEV_ENABLED);
+
+	case CC_ATTR_GUEST_MEM_ENCRYPT:
+		return sev_status & MSR_AMD64_SEV_ENABLED;
+
+	case CC_ATTR_GUEST_STATE_ENCRYPT:
+		return sev_status & MSR_AMD64_SEV_ES_ENABLED;
+
+	default:
+		return false;
+	}
+#else
+	return false;
+#endif
+}
+
+
+bool cc_platform_has(enum cc_attr attr)
+{
+	if (sme_me_mask)
+		return amd_cc_platform_has(attr);
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(cc_platform_has);
diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
index ff08dc463634..e29b1418d00c 100644
--- a/arch/x86/mm/mem_encrypt.c
+++ b/arch/x86/mm/mem_encrypt.c
@@ -20,6 +20,7 @@
 #include <linux/bitops.h>
 #include <linux/dma-mapping.h>
 #include <linux/virtio_config.h>
+#include <linux/cc_platform.h>
 
 #include <asm/tlbflush.h>
 #include <asm/fixmap.h>
-- 
2.29.2

