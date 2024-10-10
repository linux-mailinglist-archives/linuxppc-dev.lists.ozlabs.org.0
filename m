Return-Path: <linuxppc-dev+bounces-1995-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBF7998FF0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:26:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdTm5JVdz3bkX;
	Fri, 11 Oct 2024 05:25:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584716;
	cv=none; b=kv3lt2QHEGFVZEbkY6lpJyWdsnj8gnp11rqKRpzR2ENKaSYeXGrU/8lelfS8CV9kWIZIa+GyXE0nTtlrdwczMiXMdqYrSB7M2KU/JjS3KVNJ4dvJZpBGabFYbLsvIpoX9gZDIY55YS1i2z4RIsthBwrJTg8ZWmN7GRbhRXs3SjiDyqylsXHo1IpjfrFlaqUMlYeoBoo4l0a4vFLYbjQuuFHLyxJDLmyz/xdU3QQkhn0GZSqcd26vCuNYNe6XsFoY3dxwtlkL9oURRnIM8ya39NPUlWwWb5qbKmyM0S7g1NQJU8AJhw3/b13EOTUtRElpKwDEfrjQp8iNeycJ/kQWqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584716; c=relaxed/relaxed;
	bh=k3/xcOX0JmpZSdxUAeDWhRU0v4mqVA9cM67JfDYoNsA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iHAetoXW3GIoQeQw8VlTxn4XWjzgVWhsQ3Oy1zMzUpzwiAPiOor4w/OROmC29pgIYxq9fvJFJ+pe6RLRw8B5Qgi4wwV7b5MF+tMiEmJPJf48pZaN9IYcYwpXXBrE9+Jp6WTwvJO18tHbqxt6AzYiJwd++Zz8bXKBpSB7L4tlIhOtde+CHdp5UpiT6v565MTVzuISE9g9uwKgqroIxO+Z+5zHj9pzXtHqmVLWKBh/NtYTiH+LbNQDBr9eSfKFW+OXAeKYdYyTJMOqm012P/nOo6nECVQj2NCneZMmqgbTkCkkUMrjMocVle4Yb/Xw/l3RBsWGTf25fWOwj3H6eHcT4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=1DxgiPPG; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3crwizwykdkaseanjcgoogle.comlinuxppc-devlists.ozlabs.org@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=1DxgiPPG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3crwizwykdkaseanjcgoogle.comlinuxppc-devlists.ozlabs.org@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdTl63rrz3bkG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:15 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2e2ed2230fcso134786a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584713; x=1729189513; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3/xcOX0JmpZSdxUAeDWhRU0v4mqVA9cM67JfDYoNsA=;
        b=1DxgiPPGaN6DBXnvBEBIP/Bkzfxrj/Rxf66OnzvhbIfMzDYkBOUT0seuBnn8pTBsO1
         VhFbe+NmPCP8e4f9n5bprYvuzMM1K3hcfwkwNrtqBDUE97GBZwBsCxaSkUFwY1gLlf7K
         NIK/4Aun4Q1pG0LAB71u9yuGx1A2yQLGYeUvqBRxd01E45tWdAiJssQ1HPTaq6mPkKtD
         rzqJCZnNEiNkgGeWKlNUz1LZkkdoxQHbNphmxes/6VofP2eaWSKVWHQnJGQFaNtn0Xaj
         wulZwqaNda2R0e5EfnHWBy3eBeOOhlMbHwsXY1cpv+B1HKHsC2dVkDP06W9fTJivKzyi
         7Ufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584713; x=1729189513;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k3/xcOX0JmpZSdxUAeDWhRU0v4mqVA9cM67JfDYoNsA=;
        b=J+X0UzmJWYmc1pR6qtk8qDH1+2vDp2RWjHsOkvlzJoiKunT538K3Cso9jeucscyjiC
         M7JYWL2MT72t0BTeRfl60jF+1VP9UoskHRjNDg2XZnvpY2yf3tSfScuPWyefDxpEewcw
         UbwQN7r01TmZ/UULraVgdN4X8xgQIhOUHYhyKQKsvqdPB7RCoS0hRv7ocl3dP5klSXtQ
         8WIVqHgVgd+BNHwL1eKMUpBYJk3PWg6yhKyF2x+JUvCvmn+hvSFHC4MTlHOmsdL7V/iX
         HueKlxAyZ0m9mq6Dzv7Uol8DhyqTuAViCvmql0kK/qhvomXeCwU413yIh5HZlvGVsnAy
         Ww5g==
X-Forwarded-Encrypted: i=1; AJvYcCV6YlXXzOsPtHyLPVESiYPrD1u8avVRlJRNddCUHT/HxhnIZO1voqz0UTIGvxVIs1Sg/zBOnjhVbSAU//8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy1LjM25mplMFoA0/EjKUq9MbfxrdTPCkYWhb6S+TuIPMMCKSKA
	3T+ohz/8cSSN5fTqaI7k0IfKT68a3K6fetxyn5Ap9648yldFVGdfl8oqnhP8ruP+9I2fONLw5qL
	J9A==
X-Google-Smtp-Source: AGHT+IEzZdX7U43FtBqfYwOSCvhQrFRs7MoNj08p1am6l1FbD4QaVhgMc/3KfB78OlyTOzXtpjGPG3KIosU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:90a:ea0e:b0:2e2:d843:4880 with SMTP id
 98e67ed59e1d1-2e2f0c82a2fmr30a91.5.1728584713017; Thu, 10 Oct 2024 11:25:13
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:12 -0700
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
Message-ID: <20241010182427.1434605-11-seanjc@google.com>
Subject: [PATCH v13 10/85] KVM: x86/mmu: Use gfn_to_page_many_atomic() when
 prefetching indirect PTEs
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
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Use gfn_to_page_many_atomic() instead of gfn_to_pfn_memslot_atomic() when
prefetching indirect PTEs (direct_pte_prefetch_many() already uses the
"to page" APIS).  Functionally, the two are subtly equivalent, as the "to
pfn" API short-circuits hva_to_pfn() if hva_to_pfn_fast() fails, i.e. is
just a wrapper for get_user_page_fast_only()/get_user_pages_fast_only().

Switching to the "to page" API will allow dropping the @atomic parameter
from the entire hva_to_pfn() callchain.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/paging_tmpl.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.=
h
index fbaae040218b..36b2607280f0 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -535,8 +535,8 @@ FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kvm_=
mmu_page *sp,
 {
 	struct kvm_memory_slot *slot;
 	unsigned pte_access;
+	struct page *page;
 	gfn_t gfn;
-	kvm_pfn_t pfn;
=20
 	if (FNAME(prefetch_invalid_gpte)(vcpu, sp, spte, gpte))
 		return false;
@@ -549,12 +549,11 @@ FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kv=
m_mmu_page *sp,
 	if (!slot)
 		return false;
=20
-	pfn =3D gfn_to_pfn_memslot_atomic(slot, gfn);
-	if (is_error_pfn(pfn))
+	if (gfn_to_page_many_atomic(slot, gfn, &page, 1) !=3D 1)
 		return false;
=20
-	mmu_set_spte(vcpu, slot, spte, pte_access, gfn, pfn, NULL);
-	kvm_release_pfn_clean(pfn);
+	mmu_set_spte(vcpu, slot, spte, pte_access, gfn, page_to_pfn(page), NULL);
+	kvm_release_page_clean(page);
 	return true;
 }
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


