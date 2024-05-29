Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id D666A8D3E2D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 20:16:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BPf6lcP/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqHTK070vz88cw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 04:09:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BPf6lcP/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--jthoughton.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3ym5xzgokdnuak8fl78kfe7ff7c5.3fdc9elogg3-45mc9jkj.fqc12j.fi7@flex--jthoughton.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqHNh48Kjz78rS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 04:05:24 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-627eb3fb46cso35434637b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 11:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717005923; x=1717610723; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=K/D/1FA4Uw1YrzG6+cN1+7larQcduYYAcSD+7tGLFpU=;
        b=BPf6lcP/RfopCcmTRA2WPaKqOisOLMrPq9jz+DAdKIbJUMcejbk08UN6/60OpZEqrD
         cpbdBC0nslZyVR+LEuEJLLWlpV5kXzG827PjoxTtGwULqe2A1Ftfo7bhD1nAEDVV4KMU
         wVLK+cHaoraXeL77WB6CiG4v0OK+KFrguQxRgzb7DQGvaEhRMaLS1myQE8vi5RyBgF1B
         FmKIhXhYfalpTcH6+25GijIShm45ovPeIidwwXPQlA8e24tVjX/0QJ9iyAH7ZKBNCAKH
         g9l6BvpbwX/GLrhS+dzQHGVDE4IT8bAakpDr1U9h7+l0Gr9DLvpGD2pkKjAYAXU94HY/
         Swgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717005923; x=1717610723;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K/D/1FA4Uw1YrzG6+cN1+7larQcduYYAcSD+7tGLFpU=;
        b=uBghl4LJ3IQLiwmHXRRVuQflUZDCrFqfeOmLOqkE3xoEs+O8fLUNnj8+yDjqomSE+7
         dt+2SYjqkWwG4vUOMpoqY0lh0jy+8hbmBHDpGwgFuDU4O/6btIpeA5ZYlKyppattPEQW
         jXe7IRbaFxJkmForyvnT5rO+PVS4rKWc7/HEfHSCJf2DDoqImwZ737yTHJ3w8pVXY8cW
         zSWUYFZscn8UK2YfboiiIBGKmLc01o96VKF5Uotobw1Pm3kV90cIZkiv3SZqN1Y+G8Sp
         Wq4C75sOcmpjwIPjJBec/0nVngHMC4zwHaniltV9G17bicCL4m/MHI6LGxK6elijfCO8
         rD+A==
X-Forwarded-Encrypted: i=1; AJvYcCUtEx2Cz1KbVy15G+7ojipacokuS53kTrccz/LtNELK4OvMSmGvlzSYI3fohtC+GcV1NRzhVc8LQqeb/UXrhLvycB4gP0Ej2mbT8Ul83Q==
X-Gm-Message-State: AOJu0YzXIe2XtsqP9SUUNExxk8eyF+SpByjKir6fEE/mBNOQlTKSlke3
	SpgFowzzA+z/cfe1uBoeSRahLb9SrMOrK4GXrF8R9qUZD7RCIxqmpH/5qgHUzDgSjJcLoC8InKp
	L8V/RmDYAm1ERDzSUTA==
X-Google-Smtp-Source: AGHT+IFSnjz7OFMOWeVI0MI1apHPovJ16H+bOSMdUdDO7KbUX1eLZ6QqkPj6sVplMDT0O6FTB3I8hMUTstLZ6+/c
X-Received: from jthoughton.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:2a4f])
 (user=jthoughton job=sendgmr) by 2002:a05:690c:6010:b0:61a:e7f7:a4cc with
 SMTP id 00721157ae682-62a08dd7631mr39296497b3.4.1717005922981; Wed, 29 May
 2024 11:05:22 -0700 (PDT)
Date: Wed, 29 May 2024 18:05:09 +0000
In-Reply-To: <20240529180510.2295118-1-jthoughton@google.com>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240529180510.2295118-7-jthoughton@google.com>
Subject: [PATCH v4 6/7] KVM: arm64: Relax locking for kvm_test_age_gfn and kvm_age_gfn
From: James Houghton <jthoughton@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, Paolo Bonzini <pbonzini@redhat.com>
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
Cc: James Houghton <jthoughton@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, Raghavendra Rao Ananta <rananta@google.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Yu Zhao <yuzhao@google.com>, Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, David Rientjes <rientjes@google.com>, Zenghui Yu <yuzenghui@huawei.com>, Axel Rasmussen <axelrasmussen@google.com>, linux-mips@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, David Matlack <dmatlack@google.
 com>, Palmer Dabbelt <palmer@dabbelt.com>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, Sean Christopherson <seanjc@google.com>, Ankit Agrawal <ankita@nvidia.com>, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace the MMU write locks for read locks.

Grabbing the read lock instead of the write lock is safe because the
only requirement we have is that the stage-2 page tables do not get
deallocated while we are walking them. The stage2_age_walker() callback
is safe to race with itself; update the comment to reflect the
synchronization change.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 arch/arm64/kvm/hyp/pgtable.c | 9 ++++-----
 arch/arm64/kvm/mmu.c         | 8 ++++----
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 9e2bbee77491..eabb07c66a07 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1319,10 +1319,8 @@ static int stage2_age_walker(const struct kvm_pgtable_visit_ctx *ctx,
 	data->young = true;
 
 	/*
-	 * stage2_age_walker() is always called while holding the MMU lock for
-	 * write, so this will always succeed. Nonetheless, this deliberately
-	 * follows the race detection pattern of the other stage-2 walkers in
-	 * case the locking mechanics of the MMU notifiers is ever changed.
+	 * This walk may not be exclusive; the PTE is permitted to change
+	 * from under us.
 	 */
 	if (data->mkold && !stage2_try_set_pte(ctx, new))
 		return -EAGAIN;
@@ -1345,7 +1343,8 @@ bool kvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr,
 	struct kvm_pgtable_walker walker = {
 		.cb		= stage2_age_walker,
 		.arg		= &data,
-		.flags		= KVM_PGTABLE_WALK_LEAF,
+		.flags		= KVM_PGTABLE_WALK_LEAF |
+				  KVM_PGTABLE_WALK_SHARED,
 	};
 
 	WARN_ON(kvm_pgtable_walk(pgt, addr, size, &walker));
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 8337009dde77..40e7427462a7 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1775,7 +1775,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 	bool young = false;
 
-	write_lock(&kvm->mmu_lock);
+	read_lock(&kvm->mmu_lock);
 
 	if (!kvm->arch.mmu.pgt)
 		goto out;
@@ -1785,7 +1785,7 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 						    size, true);
 
 out:
-	write_unlock(&kvm->mmu_lock);
+	read_unlock(&kvm->mmu_lock);
 	return young;
 }
 
@@ -1794,7 +1794,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 	u64 size = (range->end - range->start) << PAGE_SHIFT;
 	bool young = false;
 
-	write_lock(&kvm->mmu_lock);
+	read_lock(&kvm->mmu_lock);
 
 	if (!kvm->arch.mmu.pgt)
 		goto out;
@@ -1804,7 +1804,7 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 						    size, false);
 
 out:
-	write_unlock(&kvm->mmu_lock);
+	read_unlock(&kvm->mmu_lock);
 	return young;
 }
 
-- 
2.45.1.288.g0e0cd299f1-goog

