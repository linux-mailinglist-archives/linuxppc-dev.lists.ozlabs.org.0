Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D54B57A2C54
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 02:34:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bUcixSgQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RnXBQ5Sd3z3dDZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Sep 2023 10:34:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=bUcixSgQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3xvcezqykdi8bxt62vz77z4x.v75416dg88v-wxe41bcb.7i4tub.7az@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RnX6n5MVqz3cSQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Sep 2023 10:31:29 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-d7e79ec07b4so3171276276.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 17:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694824286; x=1695429086; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=nWWn+h7amRZMBDw3vQNPHGAGWvxVaFdsCPW0ONMozkY=;
        b=bUcixSgQVyiDykIPRY+sKkYcg6p2VB4XWKjdKm/fUYLHwpG3+vHHCHlaxOnDIYnF9z
         q+Ux/StIW0d+w20rJfMTcLjbpJu97/ozt3wHq5Eipl8ophH6HY+exLGFnkQgvRiXADN9
         EjpqIi5KoaE3t34RYA202CPjP1xwnMVq7Euxd3uclnT6ojdfSe5Smi/Tw5ad5TJK4g5E
         V7PBq0yJeIaedk7wMPpv2lYGs2GN7196LAlzmxlHqwxcO/nUQTQosyFfptk3UKlzruSp
         0GLWDuUMgBhVUhea1bkUyYWV2N8o+gNQ22vmHtLPn4rmirGfpbIBMzcmAExxdNPvrgpj
         j8mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694824286; x=1695429086;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nWWn+h7amRZMBDw3vQNPHGAGWvxVaFdsCPW0ONMozkY=;
        b=aGLjC/ty2W3opRGScIe4Y2BMNXxtJEq/L11E+wNHUfaZREsmAoE9SaXySvMrADipOW
         FpV8TxVZX2yauWXA1oguo4GBRCy+m3kwQxvgqPlGoASs793pQ5Bzeg3mVYpxS1QynUEm
         Gq3Puw7607E+yVCk2aXnZVPz01biTud9MAEi6DeiLXU5xR6y1I/4Uep+6aGotxtiCrqI
         gLaOmux1uoL4TsOVcE2pC0lo8hUhoVKjkDEgsGCCzRHWQW+atWstCgXk1zFfp2G8IvB3
         1a5/z9hk5gS76parpz5djjNeKEWcHXNxJgtRHUGtk6/1INe5tw4R85OQuVGnqS5tjIGW
         BQUQ==
X-Gm-Message-State: AOJu0YyN211Qv+W/2+POWkuZv4KkgqFRRCJNbu+/gvkmhdTokGOZQOZr
	9fwzblbBBzkOLSH7+LJAFg8avyDwlBk=
X-Google-Smtp-Source: AGHT+IEq7PdKxRZn76T8dxJekIJKystQKt2vwlGFVVGJbIP+fTzk72beaUliTqaKSj/nh0feFGYdLVI2swc=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:98b:b0:d81:5948:970 with SMTP id
 bv11-20020a056902098b00b00d8159480970mr72987ybb.13.1694824286666; Fri, 15 Sep
 2023 17:31:26 -0700 (PDT)
Date: Fri, 15 Sep 2023 17:30:55 -0700
In-Reply-To: <20230916003118.2540661-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230916003118.2540661-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
Message-ID: <20230916003118.2540661-4-seanjc@google.com>
Subject: [PATCH 03/26] virt: Declare and define vfio_file_set_kvm() iff
 CONFIG_KVM is enabled
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

Hide vfio_file_set_kvm() and its unique helpers if KVM is not enabled,
nothing else in the kernel (or out of the kernel) should be using a
KVM specific helper.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 drivers/vfio/vfio_main.c | 2 +-
 include/linux/vfio.h     | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index 6368eed7b7b2..124cc88966a7 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1352,7 +1352,6 @@ void vfio_device_put_kvm(struct vfio_device *device)
 clear:
 	device->kvm = NULL;
 }
-#endif
 
 static void vfio_device_file_set_kvm(struct file *file, struct kvm *kvm)
 {
@@ -1388,6 +1387,7 @@ void vfio_file_set_kvm(struct file *file, struct kvm *kvm)
 		vfio_device_file_set_kvm(file, kvm);
 }
 EXPORT_SYMBOL_GPL(vfio_file_set_kvm);
+#endif
 
 /*
  * Sub-module support
diff --git a/include/linux/vfio.h b/include/linux/vfio.h
index 454e9295970c..e80955de266c 100644
--- a/include/linux/vfio.h
+++ b/include/linux/vfio.h
@@ -311,7 +311,9 @@ static inline bool vfio_file_has_dev(struct file *file, struct vfio_device *devi
 #endif
 bool vfio_file_is_valid(struct file *file);
 bool vfio_file_enforced_coherent(struct file *file);
+#if IS_ENABLED(CONFIG_KVM)
 void vfio_file_set_kvm(struct file *file, struct kvm *kvm);
+#endif
 
 #define VFIO_PIN_PAGES_MAX_ENTRIES	(PAGE_SIZE/sizeof(unsigned long))
 
-- 
2.42.0.459.ge4e396fd5e-goog

