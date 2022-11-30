Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA8563E5B7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 00:47:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMwq36V5Xz3gKg
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 10:47:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hivL5TC6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=36ukhywykdpelxtgcvzhhzex.vhfebgnqiiv-wxoeblml.hsetul.hkz@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hivL5TC6;
	dkim-atps=neutral
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMw0s0Q3Dz3bjv
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 10:10:37 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id z10-20020a170902ccca00b001898329db72so13113610ple.21
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 15:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Vo4Z77dzNvKrehTzYt4K2iI8Cmx6h54XHztU8GehcL8=;
        b=hivL5TC6LdtOW2OmuNQou4Gy4U4tXiu2+6M2wfmsMZujN2ItoQgS8dZtbchvpp7Sy7
         gQP8KJQ85CZqnMEDc6KXPFPpNulQ0aQGew3NpHF0ryb6ACX+mCcZQj6XUPxiNhI1xHp0
         rD08FH6W6Tc9mMBWGEmLcFaU5I8qQn9La/dT9kb2EVRIeOnNi6kCex/5Q2SGr2bRQoGy
         G1EteOn3rd3vULZF1PgE4auaSNRlpUDh4ixH2iWSNr973dhsYVWWF6gRbX3Yo5SuVqh0
         qNdORoE9jtDj45oUX7KBmjx++vi1W+JogYW4rHwuh1tKXtb0Sz6z/D5a80vr3bmmUG42
         8e0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vo4Z77dzNvKrehTzYt4K2iI8Cmx6h54XHztU8GehcL8=;
        b=FUXejJIYI5SVNIYTrnk/vSnO5ATK0i+a93azR0CYjPELgKT56FEhovWOsZY2xvZmnf
         v3ewD8Y5W+EFOyQRLpAxWRZUPoRfAhqTLTdvkEgS0kJsbw7PVhu9dhsL9IIu1XRmRQk1
         h2CJzVQD6ip0eiyEulUIgJ3SvfpYHeBHSu4P3cWymNu6pWkSKRYsgo92hLGBzor3v28u
         35ObsYvz97czi3ihrtsXsvrwrr3VOiAiHMi2PoBbhuOXg0zNr+4cuZJwLILKjYvy4u6E
         VZHVsTHT2F3xcOlcmwFR4Rnq73allImg6VfJ4/A7f4/BxAEeeeakqU2ZGhKtrP2Kga5D
         sKrA==
X-Gm-Message-State: ANoB5pk6quQsZMuvuelMmRuHbGDTLo/k1HnEOH1aDiusgr61OxtYqHxy
	hcuFjpaLFPOZVVhX3rBbgWQlqQ8NfqU=
X-Google-Smtp-Source: AA0mqf57HeX+xXTuMleSA1eLy2x+uTa7n6xyJaGs3rJOB3hWgy2t3owM2xuaTXoQ+YAD0k4pCSHrJ5hlSv0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:f89:b0:219:5b3b:2b9f with SMTP id
 ft9-20020a17090b0f8900b002195b3b2b9fmr848562pjb.2.1669849834864; Wed, 30 Nov
 2022 15:10:34 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:17 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-34-seanjc@google.com>
Subject: [PATCH v2 33/50] KVM: x86: Use KBUILD_MODNAME to specify vendor
 module name
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

Use KBUILD_MODNAME to specify the vendor module name instead of manually
writing out the name to make it a bit more obvious that the name isn't
completely arbitrary.  A future patch will also use KBUILD_MODNAME to
define pr_fmt, at which point using KBUILD_MODNAME for kvm_x86_ops.name
further reinforces the intended usage of kvm_x86_ops.name.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/svm.c | 2 +-
 arch/x86/kvm/vmx/vmx.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index d9a54590591d..a875cf7b2942 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -4695,7 +4695,7 @@ static int svm_vm_init(struct kvm *kvm)
 }
 
 static struct kvm_x86_ops svm_x86_ops __initdata = {
-	.name = "kvm_amd",
+	.name = KBUILD_MODNAME,
 
 	.hardware_unsetup = svm_hardware_unsetup,
 	.hardware_enable = svm_hardware_enable,
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index b6f08a0a1435..229a9cf485f0 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -8102,7 +8102,7 @@ static void vmx_vm_destroy(struct kvm *kvm)
 }
 
 static struct kvm_x86_ops vmx_x86_ops __initdata = {
-	.name = "kvm_intel",
+	.name = KBUILD_MODNAME,
 
 	.hardware_unsetup = vmx_hardware_unsetup,
 
-- 
2.38.1.584.g0f3c55d4c2-goog

