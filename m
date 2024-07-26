Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D2693DCA9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:40:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Cq/Nub/J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW5Pc6VZKz3dWr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:40:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Cq/Nub/J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3ujekzgykdi09vr40tx55x2v.t532z4be66t-uvc2z9a9.5g2rs9.58x@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4PK5Glvz3dKF
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:55:01 +1000 (AEST)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-7a267d9e7b0so1260372a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038100; x=1722642900; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=EmsAuvL8HQXwYqsGGesvXxhYre2Gu8OeDMQE+hBNppI=;
        b=Cq/Nub/J7Bg7ke2NpAwwFNOW1W+ZeowhjcrKhJG2d6macC/83KHDyXN/KHKtp0Qs6/
         SUrLV5ij0hN2Firnh2IovNxRKDVSUlJ3JKZIsBEYM4XYLyKXFczMByPHKHO9MhgHKkMH
         1zrkK4+FsbTqVXFXtPK0Z4iqQ3/4umCVi/52uBj7R/W6TL6XW3cJYU2CbawkC4BTTkHV
         dfg02Ur+HIj6oXcPGwSszawq4I+hfMKGUZw38BXzoByEZq1o+GyeH3BR6VmNqQjwFKct
         KbGtqx4hqQhQ0h+sKI2rMttyFR1Sq7Q6jtPpnVTmat77idIbVrfBHf9T4aZaq1C/k18S
         +KOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038100; x=1722642900;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmsAuvL8HQXwYqsGGesvXxhYre2Gu8OeDMQE+hBNppI=;
        b=tfxXRn7a+D0hrsZLeKm0xn0+f+OIveX41S3iCNYWfJVdEcp9EAX7ddNVpo6vvauwev
         ypuyCQC3McBKaROUmk9JX1SP9y3KRFo629yUiuP6U1BLl+HzOmnBNe3T/INgnxRWCZH/
         Lg4zr8lkZLSNzB4TPo1f4pCTjsfl4SBj4awZQJq7UAjUIRrXl4w/Uqb8GF1gJcXf7M9f
         zSmiBDcjonoIVLHYz4RkLcNNdMjTJXkxV2euZVDlO95oZjz7zCDggMT+q577bQIKXWhy
         nLEyDAH5BMx3ohtwINCR4dDe7Hdq0SMvq0TABMDEKSHiW+3vvnrnGt45fKM7DEXckEGQ
         +8dQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfzvgADiEEiV1SCuBJ7C+yWGgoV6B08HMGak1sjFKiNIvtw9kO5pKrnfYKWxW2UP4ow6EkANOUt/1znAtTrSVyjFuKUE0+TTwL0z9/Hw==
X-Gm-Message-State: AOJu0YyxMkwHL/32gPoqz22KZ/zwMyOxBiajbyDibIkYUDxa9i+An/My
	vJBZeKz/pYCUgFvChyqiGeDx9Rdz7ioxJyPVh3gsNdIIfx9kLxz5zuHiSGPBAm/ZsFV0Hsp4yUN
	QjQ==
X-Google-Smtp-Source: AGHT+IFixvL6M1c2YXLcj1uim9WdRxJ+9f/3q289x5sMH5Ueo8TBf7rPuOmHjx69h4l0El/Ee2ditwF800M=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:fca:b0:72b:5113:ec05 with SMTP id
 41be03b00d2f7-7ac8e39fc8dmr2096a12.5.1722038098497; Fri, 26 Jul 2024 16:54:58
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:52:17 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-69-seanjc@google.com>
Subject: [PATCH v12 68/84] KVM: MIPS: Mark "struct page" pfns dirty only in
 "slow" page fault path
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

Mark pages/folios dirty only the slow page fault path, i.e. only when
mmu_lock is held and the operation is mmu_notifier-protected, as marking a
page/folio dirty after it has been written back can make some filesystems
unhappy (backing KVM guests will such filesystem files is uncommon, and
the race is minuscule, hence the lack of complaints).

See the link below for details.

Link: https://lore.kernel.org/all/cover.1683044162.git.lstoakes@gmail.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mmu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index c17157e700c0..4da9ce4eb54d 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -514,7 +514,6 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 		set_pte(ptep, pte_mkdirty(*ptep));
 		pfn = pte_pfn(*ptep);
 		mark_page_dirty(kvm, gfn);
-		kvm_set_pfn_dirty(pfn);
 	}
 
 	if (out_entry)
@@ -628,7 +627,6 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 		if (write_fault) {
 			prot_bits |= __WRITEABLE;
 			mark_page_dirty(kvm, gfn);
-			kvm_set_pfn_dirty(pfn);
 		}
 	}
 	entry = pfn_pte(pfn, __pgprot(prot_bits));
@@ -642,6 +640,9 @@ static int kvm_mips_map_page(struct kvm_vcpu *vcpu, unsigned long gpa,
 	if (out_buddy)
 		*out_buddy = *ptep_buddy(ptep);
 
+	if (writeable)
+		kvm_set_pfn_dirty(pfn);
+
 	spin_unlock(&kvm->mmu_lock);
 	kvm_release_pfn_clean(pfn);
 	kvm_set_pfn_accessed(pfn);
-- 
2.46.0.rc1.232.g9752f9e123-goog

