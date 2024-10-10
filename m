Return-Path: <linuxppc-dev+bounces-2053-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5692599906E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:32:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdX60Kbzz3cRt;
	Fri, 11 Oct 2024 05:27:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584838;
	cv=none; b=oFQiBNuFxGoknUvJlUL7m6DSb63AQfKfPjtCJbAij7dwidaI7tz3VyygFS+L6LewhK7NQ0bAoFeQNd0V4HrrCFQn5BouZLw6vUo9OJZGR/1yznsMtteariONATSnmGA8DUYM+u/RgTEsw7aBXBrNjqCqRwZgpBkafVYulVJbv24enkoN1fLA9rEMjtrpxG4EOOjqfplEzp/M1KPnkfyVCtu6V8A+TFZsejwxH+Z4hCIcMVfX9j4xaNLmdTh2E4gvPMNGQJqi27lhcTgIVr+TtpT+K+vWkHiTgy5qZHKLZ4tFS1n0w3YZTBv+rN2I6edjJrWhmae+nZMosrP6Srj9Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584838; c=relaxed/relaxed;
	bh=9LTMkDJZxM2S5Qh4t0DfHllWvhtFq1rJ9EqXHTYHy/A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WWzNx0WW6PzqT78TESLAZlOWlfDqO9PvmIth7CQrc0/zqglG6+rWTOEGdsI7Twif82TR2ykgDsx3RwXOU4b8Zg89LUAMMe1Di2RIht6inb2EqLII9R350GRhQbSDZccXl7QIBvsxUGNK1vFbtaGfZqmy1OsR6Sds5R6xU8ooIkJURI+ZuW1aNbtkEvPDWTwPx86HFSCdBAqz4nMnO8wLpfCh/jZC8dDuBI+xGBXGtLV/fILObBoOsx+sm6DmNodc9q1BJzctKN4h9Br7nBTeYyMko36NzPLq3yFlHXqs6hMmj2DigoZgqedJUvfrB4OKfWo06mwvSsb9dDcOXZnVtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=f/VKOZLi; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3gxwizwykdbwk62fb48gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=f/VKOZLi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3gxwizwykdbwk62fb48gg8d6.4gedafmphh4-56ndaklk.grd23k.gj8@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdX513ZSz3cRF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:17 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-71e019ab268so1589831b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584835; x=1729189635; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9LTMkDJZxM2S5Qh4t0DfHllWvhtFq1rJ9EqXHTYHy/A=;
        b=f/VKOZLiGjLqt2QI2gj9PoQoMuA4bvpC3BHXeUxOuWnFJeba1372Zclxi6bheQoAMx
         no7NnqG0C6WGl99gFAlG54xke4R0WwTO/Gzwg4wHSJ/FLOi+wthoScju05wvww4uVGNm
         EpBuZxP/6SV2y5DT3GI/BYB3yG5aOc9w3WtaIuKn8FgP70g3Ku9g7vSTmNIxez22WTjZ
         +YBtOy0CU6Hhy17zrzx1jkQ1u/m1ja5kcljkEAn472+FFMGuXJDN9fKwZTTqg6iv82Dz
         JvHNinOR4kWLRlCwtBDLwQ/usdlIcuyaFc7zG8tdliCIAHujLYj4K2BjkVy3QCxG7dOr
         CFDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584835; x=1729189635;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9LTMkDJZxM2S5Qh4t0DfHllWvhtFq1rJ9EqXHTYHy/A=;
        b=k16pSwfAszOlUKUNZA8wTt3BjV+jvCDmemS3SZ8CuewL2iuyH8gcDg68TgE7C3NNRL
         X7Yti3y+s/V6uJbddI2narPrCv+2wcVnEHoAW38nFzVSUXA4gC9C7uJDeAzrcYZz78Eb
         rz9O9EetPEzmK3NRHvnyTC1shN65yA5ExqYGedwfQxd2Y2ZxN7q7+7Gm2xQ9vlrylGyS
         2+t0IlqI4a5H/33H28T5gxzQJUwORDycjLWjR5hYWx0bPt1eTgDYVpOAnZ3V7GVivSLF
         dVuqBqqy6PZTwyKsW4DTSYrbIIrH1caIUQd61JIOA0/BCh4EK6YWDziqo5GhM+XNuSVA
         Quiw==
X-Forwarded-Encrypted: i=1; AJvYcCWDD0eq74BLYydgZF6izMef0YfQfbVqohKbkFW5x7Jx9RPmAZxhX/BGZtANHHdRbOI0lg+d3WB85hblfY0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx4h+8+nR4Whz7XIYsoT+10lgepI+K5RIJqA+F5+9SVHQcgNqCR
	rScrVzhF09ftSp29a19dqf4b/l1etrGN8eLG5CJT4uxL5T3z0b4ORXaxuLql/G4N+Slv+iE8Wjn
	cjQ==
X-Google-Smtp-Source: AGHT+IExt7obORK9hFSNzpsBdJKygVAVx/dPvrUuCl2bsyTFt9B1GPfq0Q1aHG/lNRl/yht5gsZcWFEXy1g=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:8614:b0:70d:fba:c51c with SMTP id
 d2e1a72fcca58-71e1dbd032amr6898b3a.3.1728584835380; Thu, 10 Oct 2024 11:27:15
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:10 -0700
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
Message-ID: <20241010182427.1434605-69-seanjc@google.com>
Subject: [PATCH v13 68/85] KVM: LoongArch: Use kvm_faultin_pfn() to map pfns
 into the guest
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"=?UTF-8?q?Alex=20Benn=C3=A9e?=" <alex.bennee@linaro.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, 
	Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Convert LoongArch to kvm_faultin_pfn()+kvm_release_faultin_page(), which
are new APIs to consolidate arch code and provide consistent behavior
across all KVM architectures.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/loongarch/kvm/mmu.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index 7066cafcce64..4d203294767c 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -780,6 +780,7 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_memory_slot *memslot;
 	struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
+	struct page *page;
 
 	/* Try the fast path to handle old / clean pages */
 	srcu_idx = srcu_read_lock(&kvm->srcu);
@@ -807,7 +808,7 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 	mmu_seq = kvm->mmu_invalidate_seq;
 	/*
 	 * Ensure the read of mmu_invalidate_seq isn't reordered with PTE reads in
-	 * gfn_to_pfn_prot() (which calls get_user_pages()), so that we don't
+	 * kvm_faultin_pfn() (which calls get_user_pages()), so that we don't
 	 * risk the page we get a reference to getting unmapped before we have a
 	 * chance to grab the mmu_lock without mmu_invalidate_retry() noticing.
 	 *
@@ -819,7 +820,7 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 	smp_rmb();
 
 	/* Slow path - ask KVM core whether we can access this GPA */
-	pfn = gfn_to_pfn_prot(kvm, gfn, write, &writeable);
+	pfn = kvm_faultin_pfn(vcpu, gfn, write, &writeable, &page);
 	if (is_error_noslot_pfn(pfn)) {
 		err = -EFAULT;
 		goto out;
@@ -831,10 +832,10 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 		/*
 		 * This can happen when mappings are changed asynchronously, but
 		 * also synchronously if a COW is triggered by
-		 * gfn_to_pfn_prot().
+		 * kvm_faultin_pfn().
 		 */
 		spin_unlock(&kvm->mmu_lock);
-		kvm_release_pfn_clean(pfn);
+		kvm_release_page_unused(page);
 		if (retry_no > 100) {
 			retry_no = 0;
 			schedule();
@@ -900,10 +901,7 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 		++kvm->stat.pages;
 	kvm_set_pte(ptep, new_pte);
 
-	if (writeable)
-		kvm_set_pfn_dirty(pfn);
-	kvm_release_pfn_clean(pfn);
-
+	kvm_release_faultin_page(kvm, page, false, writeable);
 	spin_unlock(&kvm->mmu_lock);
 
 	if (prot_bits & _PAGE_DIRTY)
-- 
2.47.0.rc1.288.g06298d1525-goog


