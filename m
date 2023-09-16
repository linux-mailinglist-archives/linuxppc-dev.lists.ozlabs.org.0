Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C94847A2C1D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 02:33:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=RhabVyVi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnX8V56rvz3dTJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 10:32:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=RhabVyVi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3wvcezqykdis7tp2yrv33v0t.r310x29c44r-sta0x787.3e0pq7.36v@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnX6k1nLZz3cD1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 10:31:26 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59b50b45481so34126537b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 17:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824283; x=1695429083; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=CcWcgzjI/Sjr3SKdjnMS4CWAtaq/GpOs1NzqJV8HV48=;
        b=RhabVyVitdOCur/aIyJvrhtvvz/kUONH/Qkgbts14E2NUbrrC0jxVXbdpOOzP1wEye
         O1hK6qgqVivUzH64CLL4Ak87YsXWjmLHq4lqDv1phQt34SK6/liaMxLKgDZL+cYTu2UJ
         xd/Dcdgxo/VD34GkX+nfMyFTnbmg5CjafGrCJe1IiTaRdWQC4U1NkkO5kwpPiEU1Ywls
         kFiUZGqt1umYLA04mxZqhqlXTPSdDY4DQeq4DqbPvW8DAGXWOCZ0+JaN3Wz67CYM6eD7
         N9DkuyX68MXkNBnHlMTdX3rYjaEXXUse+e8dzkp6VAOPp++A7HX/5kl0tkGfl7EI3PaY
         fTFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824283; x=1695429083;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcWcgzjI/Sjr3SKdjnMS4CWAtaq/GpOs1NzqJV8HV48=;
        b=LH00ctfDCenUUJe58yYiqqHUbMNplhiqBUIrCVSJFujlCCqpwOmVJFAD5UBbnnJRvT
         yOcI2OybDkDjMroQ/0S8TiqGWxWAQ4E4LGqD3Pdq1APCp8FKdgMrHbGgRpTYaRpWIc1P
         IO9vP++SmjkvOROyw2wGDB0nnJ54gqzK3saV55f5e7BqJZK603MdEYI98s3FQp4W6pQm
         09gkeTD3N+DqW+Hm/nlUqxEUJNSAE6x0FiqeCgQ9oKqq758dLMjY1pk750R+Iij9otva
         lArw2vD5GzCKcystVFNKufqPshSf3EDCgHYTfa1bAm6p27mRPlw3QxOeXcOHPSlTeKIf
         PPwQ==
X-Gm-Message-State: AOJu0YxAM0JJPtXTL0DHK71G0FR6JiqoVmYcz1yVPbyBY8iuffST5oy8
	hC57pN2RPEuc1Jk2lOrOLiWRAsVQm5c=
X-Google-Smtp-Source: AGHT+IEjplB8N3p+oR/7zKlMcxL9iCUBmO4vshw551ibG3RHlQehJcUKg5dHZyrgSIjo7xUVmV5xBYFOkj8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:b612:0:b0:565:9bee:22e0 with SMTP id
 u18-20020a81b612000000b005659bee22e0mr85362ywh.0.1694824282871; Fri, 15 Sep
 2023 17:31:22 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:30:53 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-2-seanjc@google.com>
Subject: [PATCH 01/26] vfio: Wrap KVM helpers with CONFIG_KVM instead of CONFIG_HAVE_KVM
From: Sean Christopherson <seanjc@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Alex Williamson <alex.williamson@redhat.com>, Andy Lutomirski <luto@kernel.org>
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org, Venkatesh Srinivas <venkateshs@chromium.org>, Anish Ghulati <aghulati@google.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Andrew Thornton <andrewth@google.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Wrap the helpers for getting references to KVM instances with a check on
CONFIG_KVM being enabled, not on CONFIG_HAVE_KVM being defined.  PPC does
NOT select HAVE_KVM, despite obviously supporting KVM, and guarding code
to get references to KVM based on whether or not the architecture supports
KVM is nonsensical.

Drop the guard around linux/kvm_host.h entirely, conditionally including a
generic headers is completely unnecessary.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/vfio/vfio.h      | 2 +-
 drivers/vfio/vfio_main.c | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio.h b/drivers/vfio/vfio.h
index 307e3f29b527..c26d1ad68105 100644
--- a/drivers/vfio/vfio.h
+++ b/drivers/vfio/vfio.h
@@ -434,7 +434,7 @@ static inline void vfio_virqfd_exit(void)
 }
 #endif
 
-#ifdef CONFIG_HAVE_KVM
+#if IS_ENABLED(CONFIG_KVM)
 void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm);
 void vfio_device_put_kvm(struct vfio_device *device);
 #else
diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 40732e8ed4c6..80e39f7a6d8f 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -16,9 +16,7 @@
 #include <linux/fs.h>
 #include <linux/idr.h>
 #include <linux/iommu.h>
-#ifdef CONFIG_HAVE_KVM
 #include <linux/kvm_host.h>
-#endif
 #include <linux/list.h>
 #include <linux/miscdevice.h>
 #include <linux/module.h>
@@ -383,7 +381,7 @@ void vfio_unregister_group_dev(struct vfio_device *device)
 }
 EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
 
-#ifdef CONFIG_HAVE_KVM
+#if IS_ENABLED(CONFIG_KVM)
 void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
 {
 	void (*pfn)(struct kvm *kvm);
-- 
2.42.0.459.ge4e396fd5e-goog

