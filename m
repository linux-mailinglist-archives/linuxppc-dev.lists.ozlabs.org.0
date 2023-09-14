Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2F079F782
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 04:04:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=SXTnWAYY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmLGq2LP6z3dKG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 12:04:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=SXTnWAYY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3kmgczqykddmhtpcyrvddvat.rdbaxcjmeer-stkaxhih.doapqh.dgv@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmL575yJWz3bX1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 11:55:55 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1c40ac5b6e7so2354725ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 18:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656554; x=1695261354; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=snuesVO7Pgb0vyCed2d5Ea1z3YHTBEL1EKVJI8LHRYQ=;
        b=SXTnWAYY5KCNhakKqAYv9WAd1ykHZQsDBNFZtH2ln3RFZJV7XrL/Y8sxLXiH/R4omM
         6TVd4+dSYV1P31U/qEHVMFmxipCVxiWyqik0qEUfn6RdmvlRdmmxcgIsLQodIbFVFpQE
         2qTz5oV0MqxpysLfDt5VdZBwEFsiJGpBkpTK2UtsIxFBobXCopSoQGYe+LGv8p4nIRWT
         0u3+foZQ1kQbYyLeOFl3wstdgFo2EITEsbOKFQ7ULikDf/HuM+GNZi8ken7dqOyh5gBG
         GgN/3ZrH+K6NUQ303ddf6+tMohjVseo1w1PssLF6/QWphk0zic1ZeFRBOenBhwYtOn6/
         wenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656554; x=1695261354;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=snuesVO7Pgb0vyCed2d5Ea1z3YHTBEL1EKVJI8LHRYQ=;
        b=ctNmIO8ScjONUCqKAvIhmgHuqRz869ZEjv4H1bug8IdvNmx0wNldOWxP0jYi5Bke3r
         s/kZSG3X6mZIeFMRU52EKKw2ZMGpeVK14u5SKRYdnYxFJAKwcrakmX9cT40t777wbJps
         o0u6Gk+/ZyGTagmTbvqJWMPXvZAIbbQhRJZt2aZGxs0+RulgP20YfLeFpAkPEAQ3DJia
         /YLBHfrwQxeyny+J7Of3bJvcOQ654BcZ4+zu88CjUx0V2XUNe1CLYM+rmpf7gHEUYaoO
         4G+OOxLxepKUA3KM2VrX5lqcPrpZuEw9opLeo47iB9KzzrXqXXqhAE9457ShX8whs4OL
         m4Aw==
X-Gm-Message-State: AOJu0Yxm3z8jyT7jcohGHR08Tz8dmMcH+W1mhti5QFLXtSrWH16GEBq/
	YeJ0eD0wqbfEjqqFmIs6mR9VkKobPrU=
X-Google-Smtp-Source: AGHT+IGilm0IehJXdYbDJdwfV4Q368JwTuC1tx+vxoEF5ebf3gbFa0uVyGZgeqLtkzJroDu6r4LDVxWZ5mo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:6bca:b0:1b8:80c9:a98e with SMTP id
 m10-20020a1709026bca00b001b880c9a98emr149790plt.13.1694656554156; Wed, 13 Sep
 2023 18:55:54 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:07 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-10-seanjc@google.com>
Subject: [RFC PATCH v12 09/33] KVM: Drop .on_unlock() mmu_notifier hook
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, linux-security-module@vger.kernel.org, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, linux-arm-kernel@lists.infradead.org, Maciej Szmigiero <mail@maciej.szmigiero.name>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, kvmarm@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>, Isaku Yamahata <isaku.yamahata@intel.com>, Quentin Perret <qperret@google.com>, linux-mips@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Yu Zhang <yu.c.zhang@linux.intel.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, Liam Merwick <liam.merwick@oracle.com>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Ani
 sh Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Drop the .on_unlock() mmu_notifer hook now that it's no longer used for
notifying arch code that memory has been reclaimed.  Adding .on_unlock()
and invoking it *after* dropping mmu_lock was a terrible idea, as doing so
resulted in .on_lock() and .on_unlock() having divergent and asymmetric
behavior, and set future developers up for failure, i.e. all but asked for
bugs where KVM relied using .on_unlock() to try to run a callback while
holding mmu_lock.

Opportunistically add a lockdep assertion in kvm_mmu_invalidate_end() to
guard against future bugs of this nature.

Reported-by: Isaku Yamahata <isaku.yamahata@intel.com>
Link: https://lore.kernel.org/all/20230802203119.GB2021422@ls.amr.corp.intel.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 76d01de7838f..174de2789657 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -544,7 +544,6 @@ static inline struct kvm *mmu_notifier_to_kvm(struct mmu_notifier *mn)
 typedef bool (*gfn_handler_t)(struct kvm *kvm, struct kvm_gfn_range *range);
 
 typedef void (*on_lock_fn_t)(struct kvm *kvm);
-typedef void (*on_unlock_fn_t)(struct kvm *kvm);
 
 struct kvm_mmu_notifier_range {
 	/*
@@ -556,7 +555,6 @@ struct kvm_mmu_notifier_range {
 	union kvm_mmu_notifier_arg arg;
 	gfn_handler_t handler;
 	on_lock_fn_t on_lock;
-	on_unlock_fn_t on_unlock;
 	bool flush_on_ret;
 	bool may_block;
 };
@@ -663,11 +661,8 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
 	if (range->flush_on_ret && r.ret)
 		kvm_flush_remote_tlbs(kvm);
 
-	if (r.found_memslot) {
+	if (r.found_memslot)
 		KVM_MMU_UNLOCK(kvm);
-		if (!IS_KVM_NULL_FN(range->on_unlock))
-			range->on_unlock(kvm);
-	}
 
 	srcu_read_unlock(&kvm->srcu, idx);
 
@@ -687,7 +682,6 @@ static __always_inline int kvm_handle_hva_range(struct mmu_notifier *mn,
 		.arg		= arg,
 		.handler	= handler,
 		.on_lock	= (void *)kvm_null_fn,
-		.on_unlock	= (void *)kvm_null_fn,
 		.flush_on_ret	= true,
 		.may_block	= false,
 	};
@@ -706,7 +700,6 @@ static __always_inline int kvm_handle_hva_range_no_flush(struct mmu_notifier *mn
 		.end		= end,
 		.handler	= handler,
 		.on_lock	= (void *)kvm_null_fn,
-		.on_unlock	= (void *)kvm_null_fn,
 		.flush_on_ret	= false,
 		.may_block	= false,
 	};
@@ -811,7 +804,6 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 		.end		= range->end,
 		.handler	= kvm_mmu_unmap_gfn_range,
 		.on_lock	= kvm_mmu_invalidate_begin,
-		.on_unlock	= (void *)kvm_null_fn,
 		.flush_on_ret	= true,
 		.may_block	= mmu_notifier_range_blockable(range),
 	};
@@ -856,6 +848,8 @@ static int kvm_mmu_notifier_invalidate_range_start(struct mmu_notifier *mn,
 
 void kvm_mmu_invalidate_end(struct kvm *kvm)
 {
+	lockdep_assert_held_write(&kvm->mmu_lock);
+
 	/*
 	 * This sequence increase will notify the kvm page fault that
 	 * the page that is going to be mapped in the spte could have
@@ -887,7 +881,6 @@ static void kvm_mmu_notifier_invalidate_range_end(struct mmu_notifier *mn,
 		.end		= range->end,
 		.handler	= (void *)kvm_null_fn,
 		.on_lock	= kvm_mmu_invalidate_end,
-		.on_unlock	= (void *)kvm_null_fn,
 		.flush_on_ret	= false,
 		.may_block	= mmu_notifier_range_blockable(range),
 	};
-- 
2.42.0.283.g2d96d420d3-goog

