Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A6693DC75
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:22:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=hPrmuEwH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW50n3LLCz2ypm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:22:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=hPrmuEwH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3hdekzgykdfch3zc815dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4NG1kwxz3dLc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:54:06 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6698f11853aso5969277b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038044; x=1722642844; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=66tkjZePX8REZ4BHWwuGWSSOzSubgrfSmhtIFHX3PRM=;
        b=hPrmuEwHWSgZpyzQPhTZe7c87FTfOIpNKn1rp8umSsiupRdcy2/yobNnytIrhKY8rd
         aWJcaIJRQb/bAwMbK4kAJYwPfozoaRAIidc7LudoefDWDE8rn8zKPvoV8qVA6J8QUhBZ
         xNwNYdE0IYVxfaDOr6JAEzEcd1yiEx34KNot5xWUtEbQvQHhulOOf0jZIm+fNQzJrdPJ
         kX0ECTylC7m+y16Itx3HQa/L0eC5zfs6dl9uF58K5lSIQTPxAF9y5qmEMZELY/VeR496
         RhenL0aMgzdyxj/TS+/OasyISOufoN+TniRbmiaULPI9AbAqtcRHNLC7kXc49kOWpny7
         jV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038044; x=1722642844;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66tkjZePX8REZ4BHWwuGWSSOzSubgrfSmhtIFHX3PRM=;
        b=oVQ6nFgKrGC2AGEoNfsYy43mTU2/Tnd4C+GarPpIa7Gw9nDmbrPzl+ng+X0m8rep1a
         b1M0Y+J75KVcWIpP/vkB2WEqceYknVg9mM5YwuiG32O/7oHpP/gzPVeS2O4Ty0+pxSEu
         /41a2sTzlv1ljB60l2iUUHTXfW0IP4KHCIZhTPhPXs+kiz2Iwgo+TsDtClCpuOl5yBq+
         f+BkQTyjs6KIuOL8qNJTRuORIRKhV5OXQkq+iiD/+nBAwmdZYbviaYvNzxH2ZkQt/o3Z
         pq9YLiKH/YbJ1kq4+y4nC86RW+S6n5PTNkHA4DqSFduyFcKwOUzYpevSRQdSAKsSC69g
         Hkew==
X-Forwarded-Encrypted: i=1; AJvYcCWe/YtBk/kn7FItevyE4uy7jHwGcahtUIEM5WCKBirbe6EGVHEN9R6dMD0n4ZCKjUtuBmpDaqZd9dNIuYa1hZSyeUNkk2k6uTCukj+l9g==
X-Gm-Message-State: AOJu0Yyo0K6c0z8XHoa/+MAjd2ZOAkTC9a/SmioRkvOBWT18eUieff6L
	TyOYxKHdxzc0oiJZhTy0oT5ejNwl7r/WqfcdsOpnguMu6qD3pOypMmRg911HX44dsY1kASu7gYn
	a6A==
X-Google-Smtp-Source: AGHT+IEXCHhy0parcxZWaUKhAkA9z5ds6aScUvbMwsWWyatCr0tT87bBO0XasR4cX5mU+wgB/x+9BeJQnC8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:f92:b0:673:b39a:92f2 with SMTP id
 00721157ae682-67a0a7fd778mr244297b3.7.1722038044118; Fri, 26 Jul 2024
 16:54:04 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:51 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-43-seanjc@google.com>
Subject: [PATCH v12 42/84] KVM: Move declarations of memslot accessors up in kvm_host.h
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

Move the memslot lookup helpers further up in kvm_host.h so that they can
be used by inlined "to pfn" wrappers.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 5a572cef4adc..ef0277b77375 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1153,6 +1153,10 @@ static inline bool kvm_memslot_iter_is_valid(struct kvm_memslot_iter *iter, gfn_
 	     kvm_memslot_iter_is_valid(iter, end);			\
 	     kvm_memslot_iter_next(iter))
 
+struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn);
+struct kvm_memslots *kvm_vcpu_memslots(struct kvm_vcpu *vcpu);
+struct kvm_memory_slot *kvm_vcpu_gfn_to_memslot(struct kvm_vcpu *vcpu, gfn_t gfn);
+
 /*
  * KVM_SET_USER_MEMORY_REGION ioctl allows the following operations:
  * - create a new memory slot
@@ -1290,15 +1294,13 @@ int kvm_gfn_to_hva_cache_init(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 })
 
 int kvm_clear_guest(struct kvm *kvm, gpa_t gpa, unsigned long len);
-struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn);
 bool kvm_is_visible_gfn(struct kvm *kvm, gfn_t gfn);
 bool kvm_vcpu_is_visible_gfn(struct kvm_vcpu *vcpu, gfn_t gfn);
 unsigned long kvm_host_page_size(struct kvm_vcpu *vcpu, gfn_t gfn);
 void mark_page_dirty_in_slot(struct kvm *kvm, const struct kvm_memory_slot *memslot, gfn_t gfn);
 void mark_page_dirty(struct kvm *kvm, gfn_t gfn);
 
-struct kvm_memslots *kvm_vcpu_memslots(struct kvm_vcpu *vcpu);
-struct kvm_memory_slot *kvm_vcpu_gfn_to_memslot(struct kvm_vcpu *vcpu, gfn_t gfn);
+
 kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn);
 
 int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gpa_t gpa, struct kvm_host_map *map,
-- 
2.46.0.rc1.232.g9752f9e123-goog

