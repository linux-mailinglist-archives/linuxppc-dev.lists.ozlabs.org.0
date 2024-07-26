Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D5C93DCA3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:39:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vMxdRjLU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW5N46nLpz3dX8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:39:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=vMxdRjLU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3tjekzgykdik5rn0wpt11tyr.p1zyv07a22p-qr8yv565.1cyno5.14t@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4PD2vmnz3fS0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:54:56 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-665a6dd38c8so7226487b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038094; x=1722642894; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=r/0kdPmZ+ClWir3sWShoQK9y6l+vrSl7wHPcCrpa8dU=;
        b=vMxdRjLUuXk+tZ2zvznptJFT/vNRhpH0yV53N8j0UJ8Hzmvr/mXzi6mUmYV8UfHB/F
         Wx/eV2h8tftyuGJgickx977SNsd3bngZid26E5niC+rWYeoaTeimRRw5ciEhy9fP3QuJ
         iaad7g3i2EHG6agGRjyGCxXjnfnp58tNOhypRatS8b9WZXTvjv38RfYbUHLZZga296/G
         dsRls4rMn46+0jZdOOGG3+M7VFu/BcRiCo55t1iq5jNQ75IU/ZiMfFxPi0oQ5uB5txdR
         +WtsCKtI8FZOXKf+z4S4je1oiRhANT+hLOmt+Xo7rPYAVWgLkgZX/MyGj05ekgJPVWWm
         bCDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038094; x=1722642894;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r/0kdPmZ+ClWir3sWShoQK9y6l+vrSl7wHPcCrpa8dU=;
        b=RFT73QXzYpPb6anGTMFJmd3M78ZEhHpht8hxNlBZnRIsUf3Nu7pFD8sN6IGxTN4WNr
         Svg3NMRehvnumjettXKdVUVBjQzii5aNbNCzLgwFPklGdri7KCciUVyrAor/Ld2W0LY6
         8OioKk+TfcZ9caKZ0syT49Qd7jjJoBHGf4jc9XzVq8lO8qbgZMDdzWm/KTkFLBrCTsWN
         A9pOSeryXQo/Oq2MOLAQA/5vm7HRl/lMLcAycbk+eQr3AZQeB3pewjh3JwLE0coBUdyb
         OSCeljwdeR4kL/KRZvWlHIr++z+GYm/Ij2iR6pIMNq9mPCy+fmn9dMcXija38wXvVcy5
         +bXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrhE7S4+VAx5xyj2Z2M82E61etRQq7Wz6Ip6d0rjrtEBmmJOtcY4bcBErNgqQoakqL76fOIznhveHCE53fJdyHbKW8CCVibV8+iGGStw==
X-Gm-Message-State: AOJu0Yz2CjnZPvvepIGJctVgQphNzz8VdZElbrVwcOdcXu93E1OkjKEt
	FilLiBFWDeUld/q6xWxkOzbHJZFV8d1URZFqeUBSwYzTtNINROw06IReq5mZsV39P2V1t+KZA8F
	A7g==
X-Google-Smtp-Source: AGHT+IFfaCc2nH86ghdgf4dpmC6KBZ4LBEB5Lf4TmkgG+fOYVVXJfjBbiJJRrvW3lQJXVsfLzyeGSOH6WxY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:830:b0:61b:e103:804d with SMTP id
 00721157ae682-67a004a2a4amr37847b3.0.1722038094439; Fri, 26 Jul 2024 16:54:54
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:15 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-67-seanjc@google.com>
Subject: [PATCH v12 66/84] KVM: LoongArch: Mark "struct page" pfn accessed
 before dropping mmu_lock
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

Mark pages accessed before dropping mmu_lock when faulting in guest memory
so that LoongArch can convert to kvm_release_faultin_page() without
tripping its lockdep assertion on mmu_lock being held.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/loongarch/kvm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 52b5c16cf250..230cafa178d7 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -902,13 +902,13 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 
 	if (writeable)
 		kvm_set_pfn_dirty(pfn);
+	kvm_release_pfn_clean(pfn);
 
 	spin_unlock(&kvm->mmu_lock);
 
 	if (prot_bits & _PAGE_DIRTY)
 		mark_page_dirty_in_slot(kvm, memslot, gfn);
 
-	kvm_release_pfn_clean(pfn);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
 	return err;
-- 
2.46.0.rc1.232.g9752f9e123-goog

