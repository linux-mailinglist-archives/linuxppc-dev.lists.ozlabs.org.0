Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BE57320D7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 22:20:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=EuTGS91H;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qhtvs26skz3bs0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 06:20:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=EuTGS91H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::849; helo=mail-qt1-x849.google.com; envelope-from=3o02lzaykdjyi40d926ee6b4.2ecb8dknff2-34lb8iji.epb01i.eh6@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com [IPv6:2607:f8b0:4864:20::849])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qhttz04vzz2xqp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 06:19:53 +1000 (AEST)
Received: by mail-qt1-x849.google.com with SMTP id d75a77b69052e-3f9dc388636so75071cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jun 2023 13:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686860390; x=1689452390;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3VaVpYnKKIXM0ZMJBv2BahWS6rKgSDR5ikxQlp7Qm5M=;
        b=EuTGS91HsthvX7goK5i2bE192NgKPLER56ZiTGZExzaOLyziPUNZmDI8gUA8rK2QIX
         8MUfochdPJO7GF4xOLP7zJFlDmkAYA/muE5oqze+6m55Tl/n7uJIQEYVDTdv/21OeIfd
         tCafixtcTihj8H4PvXEYhVBWXeHkRuCcAM0EU11DCi5tLjZ5lxfTTYiLlAVInteXhKvk
         LiM8fzLLcXpg6feUVq1U1NAiCiaXRpM2F6Tp24lZK3GcJUD4qzf0B176FnQwXRnLE+oK
         kvUVbwSvbxf4poeSHpupSYldz5y5dmjJAUFbd9eEIj6mEqz8I6JvZowPlSovg/ZOR+rq
         goFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686860390; x=1689452390;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3VaVpYnKKIXM0ZMJBv2BahWS6rKgSDR5ikxQlp7Qm5M=;
        b=d3ekxkDZ90lHcQS4ZFLPbHTjlB1nOmmjd09VfBQW8kWcSgRUDdbVWFvVxG290X6WMA
         or2Oz6fC8D5S5nsHL1TIZ59qfU5aAwgBBsbFkx2dWaIryJgjrW1y4Kal1aMFaQRctkQU
         LJSx2nyzY1yeYITerZ2HJ1GcLzZ6pGl4DK4oReOB1ZhZFfy+G0bV6FjQKY2IwoI6r08I
         HNmBQCMK8HhSrO1lMYD8PijJTP7kTFsPkum/NTZsgn7BSe/HeLIseHfbKxBy5mHAWEZt
         cUCeTnGyUa9sSbRzMy216sKUIKNc3C46WWxidcda9kzX35ax+mnvRntwLjb3KeTkhXX9
         CA8w==
X-Gm-Message-State: AC+VfDwKl0o2JBFjNYycr5rAt7qANjVMexkUdRjIuXcUeuBpA0fLmdVV
	9kibVanIIoPhdAyxc6PrzPclJ99vXTA=
X-Google-Smtp-Source: ACHHUZ4cQlpzVe0KczazAvYqGjGYoNkXv8UVqui26XxKS9kOBWmazT/WNj+BhRRRMGskVfw0J/AilzSk6Q0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:f7d3:b0:1b5:147f:d8d1 with SMTP id
 h19-20020a170902f7d300b001b5147fd8d1mr547182plw.3.1686850979254; Thu, 15 Jun
 2023 10:42:59 -0700 (PDT)
Date: Thu, 15 Jun 2023 10:42:57 -0700
In-Reply-To: <20230526234435.662652-2-yuzhao@google.com>
Mime-Version: 1.0
References: <20230526234435.662652-1-yuzhao@google.com> <20230526234435.662652-2-yuzhao@google.com>
Message-ID: <ZItNoeWriZgLUaon@google.com>
Subject: Re: [PATCH mm-unstable v2 01/10] mm/kvm: add mmu_notifier_ops->test_clear_young()
From: Sean Christopherson <seanjc@google.com>
To: Yu Zhao <yuzhao@google.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, x86@kernel.org, Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org, Ben Gardon <bgardon@google.com>, Chao Peng <chao.p.peng@linux.intel.com>, Will Deacon <will@kernel.org>, Gaosheng Cui <cuigaosheng1@huawei.com>, Marc Zyngier <maz@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Ingo Molnar <mingo@redhat.com>, Zenghui Yu <yuzenghui@huawei.com>, linux-trace-kernel@vger.kernel.org, linux-mm@google.com, Thomas Huth <thuth@redhat.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Steven Rostedt <rostedt@goodmis.org>, kvmarm@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Fabiano Rosas <farosas@linux.ibm.com>, Michael Larabel <michael@michaellarabel.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 26, 2023, Yu Zhao wrote:
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 0e571e973bc2..374262545f96 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -258,6 +258,7 @@ int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
>  #ifdef KVM_ARCH_WANT_MMU_NOTIFIER
>  struct kvm_gfn_range {
>  	struct kvm_memory_slot *slot;
> +	void *args;

There's no reason to make this "void *", just declare "struct test_clear_young_args"
in the header.  Arch code won't be able to use it regardless.  And I vote for
something more like "test_clear_young_metadata", as there's far more information
in there than just function arguments.

And to stave off the argument that "void *" would allow reuse, take this opportunity
to unionize the test_clear_young field with the change_pte field, e.g.

	/* comment about these fields being callback specific. */
	union {
		struct test_clear_young_metadata *metadata;
		pte_t pte;
		unsigned long callback_arg; /* needs a better name */
	};

> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 51e4882d0873..31ee58754b19 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -541,6 +541,7 @@ typedef void (*on_lock_fn_t)(struct kvm *kvm, unsigned long start,
>  typedef void (*on_unlock_fn_t)(struct kvm *kvm);
>  
>  struct kvm_hva_range {
> +	void *args;

Same feedback as kvm_gfn_range.

>  	unsigned long start;
>  	unsigned long end;
>  	pte_t pte;
> @@ -549,6 +550,7 @@ struct kvm_hva_range {
>  	on_unlock_fn_t on_unlock;
>  	bool flush_on_ret;
>  	bool may_block;
> +	bool lockless;
>  };
>  
>  /*
> @@ -602,6 +604,8 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
>  			hva_end = min(range->end, slot->userspace_addr +
>  						  (slot->npages << PAGE_SHIFT));
>  
> +			gfn_range.args = range->args;

And this goes away because the generic callback_arg is what gets propagated.

> +
>  			/*
>  			 * To optimize for the likely case where the address
>  			 * range is covered by zero or one memslots, don't
> @@ -619,7 +623,7 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
>  			gfn_range.end = hva_to_gfn_memslot(hva_end + PAGE_SIZE - 1, slot);
>  			gfn_range.slot = slot;
>  
> -			if (!locked) {
> +			if (!range->lockless && !locked) {
>  				locked = true;
>  				KVM_MMU_LOCK(kvm);
>  				if (!IS_KVM_NULL_FN(range->on_lock))
> @@ -628,6 +632,9 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
>  					break;
>  			}
>  			ret |= range->handler(kvm, &gfn_range);
> +
> +			if (range->lockless && ret)

I don't like overloading "lockless" to also mean "stop on ret".  Just add another
flag, there's literally no cost for most callbacks as everything is constant at
compile time and gets optimized away.

> +		range.args = &args;
> +		range.lockless = true;

The lockless and stop_on_ret behavior needs comments.

> +		range.handler = kvm_arch_test_clear_young;
> +
> +		if (!__kvm_handle_hva_range(kvm, &range))
> +			return args.young ? MMU_NOTIFIER_RANGE_LOCKLESS : 0;
> +	}
> +
> +	if (bitmap)
> +		return 0;
> +
> +	range.args = NULL;
> +	range.lockless = false;

No need to manually clear these, they'll be zeroed by the initialization code.

E.g. all in all, something like so

---
 include/linux/kvm_host.h |  9 +++++++--
 virt/kvm/kvm_main.c      | 29 +++++++++++++++++------------
 2 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 7a0922cbc36f..e04605061f5e 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -256,12 +256,17 @@ int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
 #endif
 
 #ifdef KVM_ARCH_WANT_MMU_NOTIFIER
+struct test_clear_young_metadata;
+
 struct kvm_gfn_range {
 	struct kvm_memory_slot *slot;
-	void *args;
 	gfn_t start;
 	gfn_t end;
-	pte_t pte;
+	union {
+		struct test_clear_young_metadata *metadata;
+		pte_t pte;
+		unsigned long callback_arg;
+	};
 	bool may_block;
 };
 
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index ac83cfb30771..8cf4fee9cd8b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -536,16 +536,20 @@ typedef void (*on_lock_fn_t)(struct kvm *kvm, unsigned long start,
 typedef void (*on_unlock_fn_t)(struct kvm *kvm);
 
 struct kvm_hva_range {
-	void *args;
 	unsigned long start;
 	unsigned long end;
-	pte_t pte;
 	hva_handler_t handler;
+	union {
+		struct test_clear_young_metadata *metadata;
+		pte_t pte;
+		unsigned long callback_arg;
+	};
 	on_lock_fn_t on_lock;
 	on_unlock_fn_t on_unlock;
 	bool flush_on_ret;
 	bool may_block;
 	bool lockless;
+	bool stop_on_ret;
 };
 
 /*
@@ -576,6 +580,9 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 	struct kvm_memslots *slots;
 	int i, idx;
 
+	BUILD_BUG_ON(sizeof(gfn_range.callback_arg) != sizeof(gfn_range.pte) ||
+		     sizeof(gfn_range.callback_arg) != sizeof(gfn_range.metadata));
+
 	if (WARN_ON_ONCE(range->end <= range->start))
 		return 0;
 
@@ -599,16 +606,14 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 			hva_end = min(range->end, slot->userspace_addr +
 						  (slot->npages << PAGE_SHIFT));
 
-			gfn_range.args = range->args;
-
 			/*
 			 * To optimize for the likely case where the address
 			 * range is covered by zero or one memslots, don't
 			 * bother making these conditional (to avoid writes on
 			 * the second or later invocation of the handler).
 			 */
-			gfn_range.pte = range->pte;
 			gfn_range.may_block = range->may_block;
+			gfn_range.callback_arg = range->callback_arg;
 
 			/*
 			 * {gfn(page) | page intersects with [hva_start, hva_end)} =
@@ -628,7 +633,8 @@ static __always_inline int __kvm_handle_hva_range(struct kvm *kvm,
 			}
 			ret |= range->handler(kvm, &gfn_range);
 
-			if (range->lockless && ret)
+			/* comment goes here. */
+			if (range->stop_on_ret && ret)
 				break;
 		}
 	}
@@ -830,7 +836,7 @@ static int kvm_mmu_notifier_clear_flush_young(struct mmu_notifier *mn,
 	return kvm_handle_hva_range(mn, start, end, __pte(0), kvm_age_gfn);
 }
 
-struct test_clear_young_args {
+struct test_clear_young_metadata {
 	unsigned long *bitmap;
 	unsigned long end;
 	bool clear;
@@ -839,7 +845,7 @@ struct test_clear_young_args {
 
 bool kvm_should_clear_young(struct kvm_gfn_range *range, gfn_t gfn)
 {
-	struct test_clear_young_args *args = range->args;
+	struct test_clear_young_metadata *args = range->metadata;
 
 	VM_WARN_ON_ONCE(gfn < range->start || gfn >= range->end);
 
@@ -880,14 +886,15 @@ static int kvm_mmu_notifier_test_clear_young(struct mmu_notifier *mn, struct mm_
 	trace_kvm_age_hva(start, end);
 
 	if (kvm_test_clear_young) {
-		struct test_clear_young_args args = {
+		struct test_clear_young_metadata args = {
 			.bitmap	= bitmap,
 			.end	= end,
 			.clear	= clear,
 		};
 
-		range.args = &args;
 		range.lockless = true;
+		range.stop_on_ret = true;
+		range.metadata = &args;
 		range.handler = kvm_test_clear_young;
 
 		if (!__kvm_handle_hva_range(kvm, &range))
@@ -897,8 +904,6 @@ static int kvm_mmu_notifier_test_clear_young(struct mmu_notifier *mn, struct mm_
 	if (bitmap)
 		return 0;
 
-	range.args = NULL;
-	range.lockless = false;
 	range.handler = clear ? kvm_age_gfn : kvm_test_age_gfn;
 
 	return __kvm_handle_hva_range(kvm, &range) ? MMU_NOTIFIER_RANGE_YOUNG : 0;

base-commit: 7a5d8be2c18415b73b9380741095f439d6983a40
-- 

