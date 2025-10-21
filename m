Return-Path: <linuxppc-dev+bounces-13121-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5F0BF7B63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 18:37:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crdHG2q7Qz304H;
	Wed, 22 Oct 2025 03:36:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::449"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761064618;
	cv=none; b=fIIVTsxOafF2nuqcJhw+In9oxgDY7Qgly0H0l2NjrKGn9oGJr8zuv+4w8hRJQJtrtomqO7wb4SUk4mbg3Cpsqu9nhRwlpFu6A1T2D4+/OELsjpf8Xgt8j0ZAjdMj09qDT7hfCAYtR/dbLuuSeG0YUv/07EHYx7Q6N6ln1wFcH6SctV+uyRE7+h/7MIYkItrppWXQITcqRnTnmeHbHTb52hvKnNSL5RsMUq5AP4Ssarcbu53rkMfv/sbeDkp2vtI9tdmiMmlNPxoss3wbPUJt60KwQWlXsXw/G+6jLw2tQzWV3bKBuFHR571CoT3B5/HYGtPDmKiKbw/ww4r5sFdAMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761064618; c=relaxed/relaxed;
	bh=z/IdadGFev8EMGQWIIqEHXt78w+GzasFDdOM6t/N/dU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bObfDasuNUPd+pAiZbg8o75cXSrdFaAxdyD1USAL7nCChcnU0QzpYXCdZUzFijuHKwovAvSrZMbL6pK4CzcyTtXmA2Xn0WY4Ba/+dgy/27meBrCk4tEER06ElddSI5QftA0ah8b4vCJb+/EiwJ39T5pRzwY2l7sXC809pqlT1rdtSDRpWc7sOpptoaX5g4uuS/8sb3quP1WEOrE4fYkUaVocm6kzCssB3bos7+Q14Ay+MnhGVkYoKpyOd+5I+AnVbouJiO4kQBb6RPGiyvoD2qKsQtPY/QfIgrK1Ww8FBqvU9QmONpA4BH5wKGVRqic5Qyc09JVY4S2GqBKgsVT1rw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=HkJ19FBm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3pbb3aaykdeaugcpleiqqing.eqonkpwzrre-fgxnkuvu.q1ncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=HkJ19FBm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::449; helo=mail-pf1-x449.google.com; envelope-from=3pbb3aaykdeaugcpleiqqing.eqonkpwzrre-fgxnkuvu.q1ncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crdHD681Sz2yqf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 03:36:56 +1100 (AEDT)
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-7810e5a22f3so11992047b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 09:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761064613; x=1761669413; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z/IdadGFev8EMGQWIIqEHXt78w+GzasFDdOM6t/N/dU=;
        b=HkJ19FBmtQI7m8MLyH8CjgE+nt90d7glC225D9HOsZu8pvmNX58H6pnX2gVfsEFw5q
         wB44BoyG+P+SHCNKBNleh/t968FtifOVvloRpnHEkBk/yowlymf10CzHDK7UnBtWq1Ly
         FZKCymp2z6o6Vt/+RAjL/d1po3GYusanzHWmZ0p9hVACqO/1C2nMoDpvLEufsme6st3u
         RjjxsQYUGt6mWdEIIe6SRsQ93GftgYs2NRNAPJ0XmiYybiD0w+OaEOc1jJ9w89lfnZAc
         09gr43rRpnyEmV8JeBm+1e7Z8ZqkgrluqFnOf6ccPE5iBAMBUMT2bJeZXF2OzBhvhb1j
         OZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761064613; x=1761669413;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z/IdadGFev8EMGQWIIqEHXt78w+GzasFDdOM6t/N/dU=;
        b=iBQ0nGhky2nNdsIe3TXMwFz+1EppfxGWFDcJh3f+IEwvQDgoC7xWTFS/RYpiT03ZPT
         0m4bzL/O/kOStHN6wBay/qHWMCnvF7hBDOMtNc0cN9YkcmDi/nJ6s0zzLUjtKdbbeOMm
         SzN57tPtxbSQfvnyq2ioVtx5RgT0W6g98k7EcLIMrQGTWgMytgbU8qM95H3wmEOWYXd0
         Ktc0M5xzYgMCFWr0DesU808CiAl2FXNh/M52QW0dyY0T7GY9qMAlseL7IQAUy49JmI3n
         qPI+2boP9HUlBZ2UD2+FNexKT+1MX2FWJKmAw8bZ0H/0KdEkqsFJavQhXHZ6JszoQ+pu
         juLA==
X-Forwarded-Encrypted: i=1; AJvYcCWfJEB3i8aWMdPskaf+R1IQSbWeznxkuRNCYuM/C6iiA9WTBBlrCQ7R8OCtXLYYK1Pqaf5EZZhDSYbmFFM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw5fqGUJg05MoHQs+ibex1jbXiFWz0dJ56+Fq6P+fyOMQCI9cMj
	o/W9Gzmfoqna7ouPBqeaQ2ST/iW7dbJcNcp6RzC7vgrWeDd54TC8qUTLJj5lflid7uBCpkBxC+n
	bYqMsFA==
X-Google-Smtp-Source: AGHT+IES6ELYoVnXS8by0geR6jOr+Qyair+TP7lX0bGCC8OGD3dU25vj5A6KyxRj4XG+s9p6uoHaw2v+jQs=
X-Received: from pjbnk17.prod.google.com ([2002:a17:90b:1951:b0:32e:ca6a:7ca9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d0b:b0:32b:7220:8536
 with SMTP id adf61e73a8af0-334a856d5bbmr22480858637.16.1761064613440; Tue, 21
 Oct 2025 09:36:53 -0700 (PDT)
Date: Tue, 21 Oct 2025 09:36:52 -0700
In-Reply-To: <aPcG3LMA0qX5H5YI@yzhao56-desk.sh.intel.com>
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
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-5-seanjc@google.com>
 <aPcG3LMA0qX5H5YI@yzhao56-desk.sh.intel.com>
Message-ID: <aPe2pDYSpVFxDRWv@google.com>
Subject: Re: [PATCH v3 04/25] KVM: x86/mmu: Add dedicated API to map
 guest_memfd pfn into TDP MMU
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 21, 2025, Yan Zhao wrote:
> On Thu, Oct 16, 2025 at 05:32:22PM -0700, Sean Christopherson wrote:
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index 18d69d48bc55..ba5cca825a7f 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -5014,6 +5014,65 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> >  	return min(range->size, end - range->gpa);
> >  }
> >  
> > +int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
> > +{
> > +	struct kvm_page_fault fault = {
> > +		.addr = gfn_to_gpa(gfn),
> > +		.error_code = PFERR_GUEST_FINAL_MASK | PFERR_PRIVATE_ACCESS,
> > +		.prefetch = true,
> > +		.is_tdp = true,
> > +		.nx_huge_page_workaround_enabled = is_nx_huge_page_enabled(vcpu->kvm),
> > +
> > +		.max_level = PG_LEVEL_4K,
> > +		.req_level = PG_LEVEL_4K,
> > +		.goal_level = PG_LEVEL_4K,
> > +		.is_private = true,
> > +
> > +		.gfn = gfn,
> > +		.slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn),
> > +		.pfn = pfn,
> > +		.map_writable = true,
> > +	};
> > +	struct kvm *kvm = vcpu->kvm;
> > +	int r;
> > +
> > +	lockdep_assert_held(&kvm->slots_lock);
> Do we need to assert that filemap_invalidate_lock() is held as well?

Hrm, a lockdep assertion would be nice to have, but it's obviously not strictly
necessary, and I'm not sure it's worth the cost.  To safely assert, KVM would need
to first assert that the file refcount is elevated, e.g. to guard against
guest_memfd _really_ screwing up and not grabbing a reference to the underlying
file.

E.g. it'd have to be something like this:

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 94d7f32a03b6..5d46b2ac0292 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5014,6 +5014,18 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
        return min(range->size, end - range->gpa);
 }
 
+static void kvm_assert_gmem_invalidate_lock_held(struct kvm_memory_slot *slot)
+{
+#ifdef CONFIG_PROVE_LOCKING
+       if (WARN_ON_ONCE(!kvm_slot_has_gmem(slot)) ||
+           WARN_ON_ONCE(!slot->gmem.file) ||
+           WARN_ON_ONCE(!file_count(slot->gmem.file)))
+               return;
+
+       lockdep_assert_held(file_inode(&slot->gmem.file)->i_mapping->invalidate_lock));
+#endif
+}
+
 int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
 {
        struct kvm_page_fault fault = {
@@ -5038,6 +5050,8 @@ int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
 
        lockdep_assert_held(&kvm->slots_lock);
 
+       kvm_assert_gmem_invalidate_lock_held(fault.slot);
+
        if (KVM_BUG_ON(!tdp_mmu_enabled, kvm))
                return -EIO;
--

Which I suppose isn't that terrible?

