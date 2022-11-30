Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2379E63E571
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:29:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMwQh0GMXz3fDq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:29:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=CQKSwij2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=31ekhywykdnwqc8lhaemmejc.amkjglsvnna-bctjgqrq.mxj89q.mpe@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=CQKSwij2;
	dkim-atps=neutral
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMw0R0F7gz3bfm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:10:15 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id n4-20020a17090a2fc400b002132adb9485so232106pjm.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=grdSlJzFo0VwdV8xgzvuVpRwKnA9GO3Mob4PH+ot8/0=;
        b=CQKSwij2dM5sxTN5vEM9Pg0UGQR7vXxLholFOCIYMDxZ1/3rA7vH+RqFmN1n0beWlD
         7+BAU4/MoU1Z2zohEeDLQA2mrNFcLMI1vaNT8JUT+3n3Smxr3wpQu7rVUMeYIUjzYrKM
         QQRXU+fmSvdsXsp/lH1ncccopWZ+njKFlSsnkmBo5RgV0L2uInmLnHD4wZGB2dqPvFNW
         AFZHsbz5az7ZAwj41de9s/UvOppce1LN8jHb5JWdYWBnJ4FReLvafLy5jclWK6UngF05
         cPIBeGpzAB3DL/mtUhAd3V5apiG8/mbBEcTlCsb8iWOJpXlQdaq+hFXcxIhaHoaH5jmv
         rjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=grdSlJzFo0VwdV8xgzvuVpRwKnA9GO3Mob4PH+ot8/0=;
        b=UJcduBT4TZrwFL1rz4pmTTfgqyTlUKtBT+80DuZc1BA+ZyzlUOaq5GTH+EFavV+/C9
         tFrmg9IDzOzzx9vt0mRTMurrOLhEJWGrsVSrzkZCi6OjiTfowX1eN3HKzd6SV3miJe3a
         nIPFaGVJb7V+YsHvxniG1EqdySn6WZokmqG3fMxwQUuHOzNAomXcb+69o5aRoCWczeln
         4MlJVCzWLX9oBJlrjalsJ303pFLw11bKS+Z7KV5FOr5tA+ycGO5WtvV+f36eWMr7I9Lz
         4NJpbaHSPqMAP1YBh/m5Mm+UXsWFNERm9nxuFchuit3dleYap9LG0dKsYKQla8Vh+FHP
         5+7w==
X-Gm-Message-State: ANoB5pln3onc7WIbtb3XLVa8HCjgWfRPhbR9QxTVVcsjk7O2/CaiVtWD
	ONfT34F77M7FWC2qIhkzyK8biiVxdQ0=
X-Google-Smtp-Source: AA0mqf5utOkOs36wj8G4rTpG0ELlL4JMVDy82zEmZIH7sIXiucVOps+Q5AZsFyLWVU+C/qKz+GIkdE+8/9Y=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a62:648a:0:b0:572:76dd:3756 with SMTP id
 y132-20020a62648a000000b0057276dd3756mr45058073pfb.9.1669849813287; Wed, 30
 Nov 2022 15:10:13 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:05 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-22-seanjc@google.com>
Subject: [PATCH v2 21/50] KVM: MIPS: Hardcode callbacks to hardware
 virtualization extensions
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
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
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, Kai Huang <kai.huang@intel.com>, linux-riscv@lists.infradead.org, kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org, Chao Gao <chao.gao@intel.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Yuan Yao <yuan.yao@intel.com>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Alexandru Elisei <alexandru.elisei@arm.com>, linux-arm-kernel@lists.infradead.org, Isaku Yamahata <isaku.yamahata@intel.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that KVM no longer supports trap-and-emulate (see commit 45c7e8af4a5e
"MIPS: Remove KVM_TE support"), hardcode the MIPS callbacks to the
virtualization callbacks.

Harcoding the callbacks eliminates the technically-unnecessary check on
non-NULL kvm_mips_callbacks in kvm_arch_init().  MIPS has never supported
multiple in-tree modules, i.e. barring an out-of-tree module, where
copying and renaming kvm.ko counts as "out-of-tree", KVM could never
encounter a non-NULL set of callbacks during module init.

The callback check is also subtly broken, as it is not thread safe,
i.e. if there were multiple modules, loading both concurrently would
create a race between checking and setting kvm_mips_callbacks.

Given that out-of-tree shenanigans are not the kernel's responsibility,
hardcode the callbacks to simplify the code.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/include/asm/kvm_host.h |  2 +-
 arch/mips/kvm/Makefile           |  2 +-
 arch/mips/kvm/callback.c         | 14 --------------
 arch/mips/kvm/mips.c             |  9 ++-------
 arch/mips/kvm/vz.c               |  7 ++++---
 5 files changed, 8 insertions(+), 26 deletions(-)
 delete mode 100644 arch/mips/kvm/callback.c

diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 28f0ba97db71..2803c9c21ef9 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -758,7 +758,7 @@ struct kvm_mips_callbacks {
 	void (*vcpu_reenter)(struct kvm_vcpu *vcpu);
 };
 extern struct kvm_mips_callbacks *kvm_mips_callbacks;
-int kvm_mips_emulation_init(struct kvm_mips_callbacks **install_callbacks);
+int kvm_mips_emulation_init(void);
 
 /* Debug: dump vcpu state */
 int kvm_arch_vcpu_dump_regs(struct kvm_vcpu *vcpu);
diff --git a/arch/mips/kvm/Makefile b/arch/mips/kvm/Makefile
index 21ff75bcdbc4..805aeea2166e 100644
--- a/arch/mips/kvm/Makefile
+++ b/arch/mips/kvm/Makefile
@@ -17,4 +17,4 @@ kvm-$(CONFIG_CPU_LOONGSON64) += loongson_ipi.o
 
 kvm-y		+= vz.o
 obj-$(CONFIG_KVM)	+= kvm.o
-obj-y			+= callback.o tlb.o
+obj-y			+= tlb.o
diff --git a/arch/mips/kvm/callback.c b/arch/mips/kvm/callback.c
deleted file mode 100644
index d88aa2173fb0..000000000000
--- a/arch/mips/kvm/callback.c
+++ /dev/null
@@ -1,14 +0,0 @@
-/*
- * This file is subject to the terms and conditions of the GNU General Public
- * License.  See the file "COPYING" in the main directory of this archive
- * for more details.
- *
- * Copyright (C) 2012  MIPS Technologies, Inc.  All rights reserved.
- * Authors: Yann Le Du <ledu@kymasys.com>
- */
-
-#include <linux/export.h>
-#include <linux/kvm_host.h>
-
-struct kvm_mips_callbacks *kvm_mips_callbacks;
-EXPORT_SYMBOL_GPL(kvm_mips_callbacks);
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index af29490d9740..f0a6c245d1ff 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -1012,17 +1012,12 @@ long kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 
 int kvm_arch_init(void *opaque)
 {
-	if (kvm_mips_callbacks) {
-		kvm_err("kvm: module already exists\n");
-		return -EEXIST;
-	}
-
-	return kvm_mips_emulation_init(&kvm_mips_callbacks);
+	return kvm_mips_emulation_init();
 }
 
 void kvm_arch_exit(void)
 {
-	kvm_mips_callbacks = NULL;
+
 }
 
 int kvm_arch_vcpu_ioctl_get_sregs(struct kvm_vcpu *vcpu,
diff --git a/arch/mips/kvm/vz.c b/arch/mips/kvm/vz.c
index c706f5890a05..dafab003ea0d 100644
--- a/arch/mips/kvm/vz.c
+++ b/arch/mips/kvm/vz.c
@@ -3304,7 +3304,10 @@ static struct kvm_mips_callbacks kvm_vz_callbacks = {
 	.vcpu_reenter = kvm_vz_vcpu_reenter,
 };
 
-int kvm_mips_emulation_init(struct kvm_mips_callbacks **install_callbacks)
+/* FIXME: Get rid of the callbacks now that trap-and-emulate is gone. */
+struct kvm_mips_callbacks *kvm_mips_callbacks = &kvm_vz_callbacks;
+
+int kvm_mips_emulation_init(void)
 {
 	if (!cpu_has_vz)
 		return -ENODEV;
@@ -3318,7 +3321,5 @@ int kvm_mips_emulation_init(struct kvm_mips_callbacks **install_callbacks)
 		return -ENODEV;
 
 	pr_info("Starting KVM with MIPS VZ extensions\n");
-
-	*install_callbacks = &kvm_vz_callbacks;
 	return 0;
 }
-- 
2.38.1.584.g0f3c55d4c2-goog

