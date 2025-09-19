Return-Path: <linuxppc-dev+bounces-12403-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7848B877A4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 02:33:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSYQ71k2cz30T8;
	Fri, 19 Sep 2025 10:33:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::64a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758241999;
	cv=none; b=mtMq/MVk33sPZz60PVHFFGWF7NAuScX9yl8wMJMv7LQgKj3QxRM7QxWZGKHJWd8zSmeqPQcWDVNxXNL1V+1s3R2Cl75dBiVjxeIaBNcyhQcud/FnLAIORQtOV+RpT1LILwTFYESzr3IxmHMpJtcm3hm6mwoC9YRGY0/OvjAAhIZ+8kF2JRYqh/kIzsUEHzviUG+ARL/SDotuJBbTT/4Q9nkewtenJ/LeClMKt/5q+kD2e75V+2vI9cWlT4GT/KYJCt3pPzYhSPGbLTvHbwRH3wE4yAy2DWEhxXxX8I35L9eEnttJBB19EShiuUM8BQvrN2WqKh7/V/oyzMBGyeRzkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758241999; c=relaxed/relaxed;
	bh=tMuCCcykP7UyXODG1nuaeEehr/fAveTIKF4KZJ2JmiU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=laIAXwVH563/8rZps34OVGd0xOeQxuLC9C3Y7VH6q/50ptUwxejALwGGN9L3r3vCsGZAJy7Tc5IODyE3WscglsMI9uhTtngPH8Cop3cWsO9VZsAgz2jWE5cmMTtOCWT2bfa/r7NZky9FNLYFAII4JnR5UxE99FBDHkkNLyfY4QbPU0tRfgZwAMrsjoNY46Jg2AFBM2e9Q8vqaGC2oZ5gZImNhAW4JZbyZTALdZRA8cniv64JhOe1VNuZQ9y6m2dd4qXuZbmmw8DlVPSqTH1vQ6FX9REih8iVMOoXW3tWMGsVZsPy3jifL/gfjMOxQeY/sNObzbi9MSn0v6PvaB9W1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=15z1wUsH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3zktmaaykdjuh3zc815dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=15z1wUsH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3zktmaaykdjuh3zc815dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSYQ63MfWz30Kg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 10:33:18 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-269880a7bd9so15070595ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 17:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758241996; x=1758846796; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=tMuCCcykP7UyXODG1nuaeEehr/fAveTIKF4KZJ2JmiU=;
        b=15z1wUsHVqmaJ1gYRv/gOmyTeD8Us/AG8JISrwZe/djXo8ZJ3MCiIzsu6TpbWabDb2
         HtT67284ZyIS3XgTlNAiy7NbDVpKZDXd3212fHqhI8AGEk/c4FNvUhbRY2E8yYkGpv85
         rDzbDwa+e4ojWWi5u6+u7/EfvJg+1U0JjKgBuQFaYRl3xl3q2Qh8BYjyFFW3KSQ78GDt
         wSWiYtyhswqutBPf/9j7Wlv5KMNrcmQNBX1vHawyzjud8EFuaRnBwNMzRNkr5MFN8aI3
         SjMGzJOjzQelxbweSkLyTdTcmzCsb0Eax3cXBUbeROe1ANUC5ySWTFBPm3yig2xxeiIo
         rEFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758241996; x=1758846796;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMuCCcykP7UyXODG1nuaeEehr/fAveTIKF4KZJ2JmiU=;
        b=KbEtfstU7b2EYs4x/w2gS9diU1JjUxLh7RQK0tftXc4SnvIXMbvn1ju7EmmCjJU4SI
         lJgEUEeDe7TpVSrXY5yklNuJy7HFqtCvsGfHJVnPTjQhOdGq86ve7xK+bMFxqku9Q6Dp
         Bx2DLuA5L8GMosR7v19G6VGrtpNZGiSpHgxEv2TMbjh87VtiNxg7LZllAoeggkRkxk52
         DlnAF6Oxc3eMAxeI1R2IVAobhqfHyZySIN069MjP1eIAglXRpu1bIy3suKFMCVrsbccq
         ZNk74jerT1+mhK3Htboq4CIiZckJwEpCv+xK43biwei3mZgcq+1YyECu3HuNuGkV3Gr3
         2pXA==
X-Gm-Message-State: AOJu0Yw/zbcET6HHWYT555H+QDVpgsEXoLJUeVmiCSKD7ccyNp8PB2Au
	5svRVwo4Qt7OvjqW5rgHkqKCouQBc96dlzA4uepx4Bw8rP2q6DuWKuv3oDpdS5ZGqL041XQD3Gt
	T/DyDLQ==
X-Google-Smtp-Source: AGHT+IFzlv5dXL7dtF1e+eMqZ1ge+J+8LQ3uyWOVWDPWtrQZD4mZKX7IbeJApn+FgKkV2SAzI1W4lLt65x4=
X-Received: from pjbok3.prod.google.com ([2002:a17:90b:1d43:b0:330:8b1f:c4e7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:bd87:b0:250:5ff5:3f4b
 with SMTP id d9443c01a7336-269ba467e97mr13530515ad.15.1758241996301; Thu, 18
 Sep 2025 17:33:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 18 Sep 2025 17:32:59 -0700
In-Reply-To: <20250919003303.1355064-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0
References: <20250919003303.1355064-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.470.ga7dc726c21-goog
Message-ID: <20250919003303.1355064-2-seanjc@google.com>
Subject: [PATCH v2 1/5] KVM: s390/vfio-ap: Use kvm_is_gpa_in_memslot() instead
 of open coded equivalent
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Tony Krowiak <akrowiak@linux.ibm.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>, 
	Harald Freudenberger <freude@linux.ibm.com>, Holger Dengler <dengler@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Use kvm_is_gpa_in_memslot() to check the validity of the notification
indicator byte address instead of open coding equivalent logic in the VFIO
AP driver.

Opportunistically use a dedicated wrapper that exists and is exported
expressly for the VFIO AP module.  kvm_is_gpa_in_memslot() is generally
unsuitable for use outside of KVM; other drivers typically shouldn't rely
on KVM's memslots, and using the API requires kvm->srcu (or slots_lock) to
be held for the entire duration of the usage, e.g. to avoid TOCTOU bugs.
handle_pqap() is a bit of a special case, as it's explicitly invoked from
KVM with kvm->srcu already held, and the VFIO AP driver is in many ways an
extension of KVM that happens to live in a separate module.

Providing a dedicated API for the VFIO AP driver will allow restricting
the vast majority of generic KVM's exports to KVM submodules (e.g. to x86's
kvm-{amd,intel}.ko vendor mdoules).

No functional change intended.

Acked-by: Anthony Krowiak <akrowiak@linux.ibm.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/include/asm/kvm_host.h  | 2 ++
 arch/s390/kvm/priv.c              | 8 ++++++++
 drivers/s390/crypto/vfio_ap_ops.c | 2 +-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
index f870d09515cc..ee25eeda12fd 100644
--- a/arch/s390/include/asm/kvm_host.h
+++ b/arch/s390/include/asm/kvm_host.h
@@ -722,6 +722,8 @@ extern int kvm_s390_enter_exit_sie(struct kvm_s390_sie_block *scb,
 extern int kvm_s390_gisc_register(struct kvm *kvm, u32 gisc);
 extern int kvm_s390_gisc_unregister(struct kvm *kvm, u32 gisc);
 
+bool kvm_s390_is_gpa_in_memslot(struct kvm *kvm, gpa_t gpa);
+
 static inline void kvm_arch_free_memslot(struct kvm *kvm,
 					 struct kvm_memory_slot *slot) {}
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
diff --git a/arch/s390/kvm/priv.c b/arch/s390/kvm/priv.c
index 9253c70897a8..9a71b6e00948 100644
--- a/arch/s390/kvm/priv.c
+++ b/arch/s390/kvm/priv.c
@@ -605,6 +605,14 @@ static int handle_io_inst(struct kvm_vcpu *vcpu)
 	}
 }
 
+#if IS_ENABLED(CONFIG_VFIO_AP)
+bool kvm_s390_is_gpa_in_memslot(struct kvm *kvm, gpa_t gpa)
+{
+	return kvm_is_gpa_in_memslot(kvm, gpa);
+}
+EXPORT_SYMBOL_FOR_MODULES(kvm_s390_is_gpa_in_memslot, "vfio_ap");
+#endif
+
 /*
  * handle_pqap: Handling pqap interception
  * @vcpu: the vcpu having issue the pqap instruction
diff --git a/drivers/s390/crypto/vfio_ap_ops.c b/drivers/s390/crypto/vfio_ap_ops.c
index 766557547f83..eb5ff49f6fe7 100644
--- a/drivers/s390/crypto/vfio_ap_ops.c
+++ b/drivers/s390/crypto/vfio_ap_ops.c
@@ -354,7 +354,7 @@ static int vfio_ap_validate_nib(struct kvm_vcpu *vcpu, dma_addr_t *nib)
 
 	if (!*nib)
 		return -EINVAL;
-	if (kvm_is_error_hva(gfn_to_hva(vcpu->kvm, *nib >> PAGE_SHIFT)))
+	if (!kvm_s390_is_gpa_in_memslot(vcpu->kvm, *nib))
 		return -EINVAL;
 
 	return 0;
-- 
2.51.0.470.ga7dc726c21-goog


