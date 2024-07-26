Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D6293DC63
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:20:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=u3Ac4aAW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW4zF4QL6z3fR2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:20:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=u3Ac4aAW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3gdekzgykdfmdzv84x19916z.x97638fiaax-yzg63ded.9k6vwd.9c1@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4N95dRtz3dVb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:54:01 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1fc53227f21so12116345ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038040; x=1722642840; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=kjY6k542G0oo6Yjo2zUiSEPku2YJftlYNe05DeRMCZs=;
        b=u3Ac4aAWZ+3mq5gC0u5QsUhvqKig1Q/An+iLNBU25n15gF+TaruoW9qSgGkgKDonOO
         08wDfUDqHMpPgmwcS1jzJz8B4l6M9x+Ve/+1ayuhDD/X/Tjld9sAblluKG0I/L6Gbdpr
         vphYmluKjSPkl1BKgKK4R8KsTwKbkhImT3uvsQ4XiVe2ubQWp8bV5mKK9GkO362885SX
         2KnspsCSZBPsldyEacsiqTCUAGuDreVAyOly/N59AodgPV/8F8fHrc5Upwam1YNPsPF4
         Uv3GGRt8Zyj85tLrGa+sxXfyQCfR9KrUYK/jadofBHYaVwTF8+xAgI7c164Je0VF9zXJ
         Cxdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038040; x=1722642840;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kjY6k542G0oo6Yjo2zUiSEPku2YJftlYNe05DeRMCZs=;
        b=NlJdkBb6JiN0ckEHF1CNlT5smH0rREOOUM2ym1Z2FRddOd/q46t4/ZZ0yEocZ2R+SG
         7iAY11mHWHWNRqwVDESjc8/RFPIuqO4ncisr55raF3DxOIXwMiqGKgYOHfLQdzjt50yj
         NnfZ8iuKftFLBEHX22AkOZqQT09IUDEJNmimDx/4FMc9gj50rvmDGwBGDhTPuPhJPovN
         84mry5vdE3hAdorSCCBrBetKgXL3sVVJmO9TNgrl7TKGzYoQrZn8Uk8hXlaRZNOuRvCE
         LWKtit5PmPazGyUbXZxYPlNqaQ1WZzMSGIXx+yrqlGS+V46f1FtwAYcYeUvl0p+SUd9L
         eGNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTdvKZE8zaKEa3D+JVwspU235d7IyBxobywUrLSas2Tr64J5PjKWSjragjLAxmfLXUHLK3nttW+dOF76JJjpwSznoRM7uUzVeUeRy9VA==
X-Gm-Message-State: AOJu0YzneoJLtmyiSmcdC/H0nTFrwpqrU9TNeuZddM2EyLsq0IRrpSLI
	uKaF8sM2GFBnUCwdDhbuRPaCa3gw+nUKNI4btXOMgYJeelTHMA2FMlWnDJphVaa+kQxBhZfWnYH
	POg==
X-Google-Smtp-Source: AGHT+IHzv0Ay1s7/D5RlCraUOAPppGpx+9DOe5Wc2TnAqa2oJae5LaRq2mY8TBHhwH7zU/okRdoTzatzS5o=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f60c:b0:1f8:6c64:3575 with SMTP id
 d9443c01a7336-1ff046dcdffmr290425ad.0.1722038040140; Fri, 26 Jul 2024
 16:54:00 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:49 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-41-seanjc@google.com>
Subject: [PATCH v12 40/84] KVM: x86/mmu: Add helper to "finish" handling a
 guest page fault
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
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
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, loongarch@lists.linux.dev, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a helper to finish/complete the handling of a guest page, e.g. to
mark the pages accessed and put any held references.  In the near
future, this will allow improving the logic without having to copy+paste
changes into all page fault paths.  And in the less near future, will
allow sharing the "finish" API across all architectures.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c         | 12 +++++++++---
 arch/x86/kvm/mmu/paging_tmpl.h |  2 +-
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index e76f64f55c4a..1cdd67707461 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4311,6 +4311,12 @@ static u8 kvm_max_private_mapping_level(struct kvm *kvm, kvm_pfn_t pfn,
 	return req_max_level;
 }
 
+static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
+				      struct kvm_page_fault *fault, int r)
+{
+	kvm_release_pfn_clean(fault->pfn);
+}
+
 static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
 				       struct kvm_page_fault *fault)
 {
@@ -4476,7 +4482,7 @@ static int kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
 	 * mmu_lock is acquired.
 	 */
 	if (mmu_invalidate_retry_gfn_unsafe(vcpu->kvm, fault->mmu_seq, fault->gfn)) {
-		kvm_release_pfn_clean(fault->pfn);
+		kvm_mmu_finish_page_fault(vcpu, fault, RET_PF_RETRY);
 		return RET_PF_RETRY;
 	}
 
@@ -4552,8 +4558,8 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	r = direct_map(vcpu, fault);
 
 out_unlock:
+	kvm_mmu_finish_page_fault(vcpu, fault, r);
 	write_unlock(&vcpu->kvm->mmu_lock);
-	kvm_release_pfn_clean(fault->pfn);
 	return r;
 }
 
@@ -4641,8 +4647,8 @@ static int kvm_tdp_mmu_page_fault(struct kvm_vcpu *vcpu,
 	r = kvm_tdp_mmu_map(vcpu, fault);
 
 out_unlock:
+	kvm_mmu_finish_page_fault(vcpu, fault, r);
 	read_unlock(&vcpu->kvm->mmu_lock);
-	kvm_release_pfn_clean(fault->pfn);
 	return r;
 }
 #endif
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index e1c2f098d9d5..b6897916c76b 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -835,8 +835,8 @@ static int FNAME(page_fault)(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
 	r = FNAME(fetch)(vcpu, fault, &walker);
 
 out_unlock:
+	kvm_mmu_finish_page_fault(vcpu, fault, r);
 	write_unlock(&vcpu->kvm->mmu_lock);
-	kvm_release_pfn_clean(fault->pfn);
 	return r;
 }
 
-- 
2.46.0.rc1.232.g9752f9e123-goog

