Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F28487A2C52
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 02:33:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=x9N95uGF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnX9T5kK2z3dXl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 10:33:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=x9N95uGF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2001:4860:4864:20::4a; helo=mail-oa1-x4a.google.com; envelope-from=3xpcezqykdi09vr40tx55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x4a.google.com (mail-oa1-x4a.google.com [IPv6:2001:4860:4864:20::4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnX6m22tCz3c01
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 10:31:28 +1000 (AEST)
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-1c8f953e111so4425819fac.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 17:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824284; x=1695429084; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=NdOAPx70WjWtTXOKtIxgwEtN+XJRELer/ruyZoFwPzQ=;
        b=x9N95uGFLdw3ZU28zRK/B7EWmfSHg+Du3H9kDUaKfKnqvhwH9ypKcbuOam74dF21FG
         kKETJjYfndM8gF7OJPsR4j8VrU0PHBLVD7u/jJFt8jckGj0KSmpvqhQydzBTUsl7N4sM
         m8mtdfI6k/6dzFCNFyjRiSMW+kvpMN96h8QsruVEZs1nApsXgfHk3yHj071AexgDJlB4
         xu+tAdOkTdEA+EA4MuKKQRalAks7hS1cr8t1pVfZeyjEJKE+qeCE5+rCEWsatb2HF/rS
         NhVfNcvqsn+EWPlvl6CwtlprRFRYzgPy3nvxO761JU+10P6uDbmFRPXFNULtKucoJfRc
         JpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824284; x=1695429084;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NdOAPx70WjWtTXOKtIxgwEtN+XJRELer/ruyZoFwPzQ=;
        b=Q74Dhx3sZVrc+T0le5InG6KF1oQKp+mwauHIwoMXMPt5XjCh8wsxXxyihAkjyb/hX5
         vl2p3A8uq00HQtcc0w5Xpu2UJeX8QrXAykEQRtMVjId1gLargTD5dS/s2y/Dftkwicz0
         id9rYs9f71ABrYoLIL5D5y5zaKGWt9KZ7J8pdeaarzxL9f0oDRVb4jBEBCsdl0wJyL5m
         Elmebdyo9eWzSJmDp0fBE+iqPhkylpua9WIlxRhYs5E11t6d/3NuKXHwKXcKwivjD8e5
         lWIptr+pDBt6Ucuziq1B0fOw/TKNthkagyQh+q5ykOVL5HNI5+ahvlyexghp8NS3qFYn
         53Dw==
X-Gm-Message-State: AOJu0Yzs2awm8eJ1DIAb62icAdxP+lIJM5p6JmYhzhsEJbvKtNtThhd5
	t5+P4XkZf5OP+FizrEW/jzhTbi2nzNY=
X-Google-Smtp-Source: AGHT+IFjfayrLbVmI/uUcITF7riix4t2p7LQSznFwYgaB2xPw0hEc6MrZUjOPPPKeYuL02E3L+TxPOZWHW4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6870:b7ad:b0:1d6:4da3:ae2d with SMTP id
 ed45-20020a056870b7ad00b001d64da3ae2dmr1068876oab.7.1694824284654; Fri, 15
 Sep 2023 17:31:24 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:30:54 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-3-seanjc@google.com>
Subject: [PATCH 02/26] vfio: Move KVM get/put helpers to colocate it with
 other KVM related code
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

Move the definitions of vfio_device_get_kvm_safe() and vfio_device_put_kvm()
down in vfio_main.c to colocate them with other KVM-specific functions,
e.g. to allow wrapping them all with a single CONFIG_KVM check.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/vfio/vfio_main.c | 104 +++++++++++++++++++--------------------
 1 file changed, 52 insertions(+), 52 deletions(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 80e39f7a6d8f..6368eed7b7b2 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -381,58 +381,6 @@ void vfio_unregister_group_dev(struct vfio_device *device)
 }
 EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
 
-#if IS_ENABLED(CONFIG_KVM)
-void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
-{
-	void (*pfn)(struct kvm *kvm);
-	bool (*fn)(struct kvm *kvm);
-	bool ret;
-
-	lockdep_assert_held(&device->dev_set->lock);
-
-	if (!kvm)
-		return;
-
-	pfn = symbol_get(kvm_put_kvm);
-	if (WARN_ON(!pfn))
-		return;
-
-	fn = symbol_get(kvm_get_kvm_safe);
-	if (WARN_ON(!fn)) {
-		symbol_put(kvm_put_kvm);
-		return;
-	}
-
-	ret = fn(kvm);
-	symbol_put(kvm_get_kvm_safe);
-	if (!ret) {
-		symbol_put(kvm_put_kvm);
-		return;
-	}
-
-	device->put_kvm = pfn;
-	device->kvm = kvm;
-}
-
-void vfio_device_put_kvm(struct vfio_device *device)
-{
-	lockdep_assert_held(&device->dev_set->lock);
-
-	if (!device->kvm)
-		return;
-
-	if (WARN_ON(!device->put_kvm))
-		goto clear;
-
-	device->put_kvm(device->kvm);
-	device->put_kvm = NULL;
-	symbol_put(kvm_put_kvm);
-
-clear:
-	device->kvm = NULL;
-}
-#endif
-
 /* true if the vfio_device has open_device() called but not close_device() */
 static bool vfio_assert_device_open(struct vfio_device *device)
 {
@@ -1354,6 +1302,58 @@ bool vfio_file_enforced_coherent(struct file *file)
 }
 EXPORT_SYMBOL_GPL(vfio_file_enforced_coherent);
 
+#if IS_ENABLED(CONFIG_KVM)
+void vfio_device_get_kvm_safe(struct vfio_device *device, struct kvm *kvm)
+{
+	void (*pfn)(struct kvm *kvm);
+	bool (*fn)(struct kvm *kvm);
+	bool ret;
+
+	lockdep_assert_held(&device->dev_set->lock);
+
+	if (!kvm)
+		return;
+
+	pfn = symbol_get(kvm_put_kvm);
+	if (WARN_ON(!pfn))
+		return;
+
+	fn = symbol_get(kvm_get_kvm_safe);
+	if (WARN_ON(!fn)) {
+		symbol_put(kvm_put_kvm);
+		return;
+	}
+
+	ret = fn(kvm);
+	symbol_put(kvm_get_kvm_safe);
+	if (!ret) {
+		symbol_put(kvm_put_kvm);
+		return;
+	}
+
+	device->put_kvm = pfn;
+	device->kvm = kvm;
+}
+
+void vfio_device_put_kvm(struct vfio_device *device)
+{
+	lockdep_assert_held(&device->dev_set->lock);
+
+	if (!device->kvm)
+		return;
+
+	if (WARN_ON(!device->put_kvm))
+		goto clear;
+
+	device->put_kvm(device->kvm);
+	device->put_kvm = NULL;
+	symbol_put(kvm_put_kvm);
+
+clear:
+	device->kvm = NULL;
+}
+#endif
+
 static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
 {
 	struct vfio_device_file *df = file->private_data;
-- 
2.42.0.459.ge4e396fd5e-goog

