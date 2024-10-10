Return-Path: <linuxppc-dev+bounces-1996-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB1F998FF1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:26:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdTp5rYPz3brM;
	Fri, 11 Oct 2024 05:25:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::64a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584718;
	cv=none; b=I5cxvifPJWsSLE50KDRujViq6zKZVvyJB/bbo/zwzcINdAz+DHLxXVdwXJxrZEGECdkkKIDXI85pmbnZ8TUop6R8fiGsbXUvPwIFqOub7IXCBNVUAgC/JBOLHvWWlGHx9UEA+sqg2tlL0BUXE42TSc2ZKnW/91NFCUjbRsJzj/oiv88L4wtdq1XfUR7FPUiriyh9JQ9td6TJsyJhYyM021faF5VN1azfGQb2YVi9ygk88xhDltNMeLJteNJG8mIQK0Zkj9FwR4AaaH5wDvTBRkVFu/Ph06sz7LiK+Ei62toosE4A5pL3fYl67aeK2RJP7z6YI/Pc5GGDRhs9pqMLMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584718; c=relaxed/relaxed;
	bh=WDoARMTIexYqUKDMQLAC2OQWFTeknat7PpvqQx990/M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QzYQhj8aWx5uL4uWdI8XmwX2FfaJAkq390f+7zpqjGoWtdGpnuMNV3kFGQvfZ+hFSIngGmIxSOQz59E+e1e4djqrdR2bdBG8ieE8UGBgV37ilCiBnS8QesgVv8LeER4/iktcU/MkgnznjyN+GuL+F5me8OGNoOuExwE4sjDbMzp3WELh9+LYiLWN/Sj9Eh66GZuboB74LUxbTJsDN1CrcyFf3lchmj3q+xE3A63U0g2xhvSG4segmTJF9rf8hlW3F5USybBOg3564Rz25N452xaULPqXj3WPHdvUlUiLVldkJqm9OL2c1/N1HVyCUZ/797rGGpVnCP9vBXLfBbT7FQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=or7ntmw2; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3cxwizwykdkiugcpleiqqing.eqonkpwzrre-fgxnkuvu.qbncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=or7ntmw2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3cxwizwykdkiugcpleiqqing.eqonkpwzrre-fgxnkuvu.qbncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdTn6RKGz3bkG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:17 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-20b921fa133so13291615ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584715; x=1729189515; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WDoARMTIexYqUKDMQLAC2OQWFTeknat7PpvqQx990/M=;
        b=or7ntmw2shYuilbmgo9ORcoqZ7QSCXvllejhjzJZOjmcwx1m6juJZ9Sr4DcDGD4aCv
         RkiJGFz09vQA8QGIbqg1ITxpvZh74QO9HtSTg2pbDvDiYxih5QGQ1JD/auwlW5jIs5+4
         Ix7ZwQ19fh/rQwqGZBcr64J8p6PisnPecfY1tzLjSNBSqmL+xt+JgM6Fs2WYl0uz/IHR
         hDP7YWrrzibnUGrH3Tct14AMHlZKEfWkCXyOwCIcS8zzrPH0jG2hMKG1z50mgH6ADxcH
         AZdLZuc3xoUUqZ3c/8Leatwmym6dOonbkiYW8dBuwBpfiHEiUk4aZHO3ytD6aYAD6g9X
         jYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584715; x=1729189515;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WDoARMTIexYqUKDMQLAC2OQWFTeknat7PpvqQx990/M=;
        b=SFuVlb8s5tFPfMPOuUYwwPdbd+x2VhL8bPh/O7vp9Xn1Fo/OlPdCEJLLp9lYWFjDMm
         DwHB4swhxmv4Yh9ppoNBOu54e/pWC8pgohNA9yMG4HML5D3ZDGkPlRFTkZXypxD2KnLi
         tNZuIFwJzGIgdEA7XfgzDnBql8NQehs+qTZOYndUqQG11mq1C6PY+mgHMCgieTYsbscZ
         sLCs9+csIC9+0+F7AZg4azhN3OXZ90/lCXPXb5uUzX5PZyW8SlXKH1d+CpGrG9iGNZKk
         VF6Y1PF03zWROYZHbTw4zKVEAD2uBDM4vHr+mPDozMZjMv1BoSzPDXwiUleV/URjgAdF
         DwUg==
X-Forwarded-Encrypted: i=1; AJvYcCX/n/a8aOYEhxnCqkMqRzlZavyaRsuR5K41DiRFkmuW8yZNJddyQw+ZSdv8iYIeWDtofytJSspW5NJGpLs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw9lorqB/4VI9fBUWXlbm4es9wCajsTXVqvSYPwlTblyYlW0LXP
	KDS2LwKCjYmQu+M8EHeE1Ib9FGPlpYaMW+BkKsuN22Nk4BVERdimegn+/R8mlP0xC8gUQSg1Jtt
	wfQ==
X-Google-Smtp-Source: AGHT+IFdLsiMiQR9ssEjYgvfJ+TOiOlvv8h202qp7bAbI4MCMFrC9IRsz+IufRcGyfoerq3Ms7MkoMKw8Uo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:902:f143:b0:20c:5beb:9c6a with SMTP id
 d9443c01a7336-20c80510505mr43225ad.4.1728584715291; Thu, 10 Oct 2024 11:25:15
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:13 -0700
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
Message-ID: <20241010182427.1434605-12-seanjc@google.com>
Subject: [PATCH v13 11/85] KVM: Rename gfn_to_page_many_atomic() to kvm_prefetch_pages()
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

Rename gfn_to_page_many_atomic() to kvm_prefetch_pages() to try and
communicate its true purpose, as the "atomic" aspect is essentially a
side effect of the fact that x86 uses the API while holding mmu_lock.
E.g. even if mmu_lock weren't held, KVM wouldn't want to fault-in pages,
as the goal is to opportunistically grab surrounding pages that have
already been accessed and/or dirtied by the host, and to do so quickly.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c         | 2 +-
 arch/x86/kvm/mmu/paging_tmpl.h | 2 +-
 include/linux/kvm_host.h       | 4 ++--
 virt/kvm/kvm_main.c            | 6 +++---
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 04228a7da69a..5fe45ab0e818 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -2958,7 +2958,7 @@ static int direct_pte_prefetch_many(struct kvm_vcpu *=
vcpu,
 	if (!slot)
 		return -1;
=20
-	ret =3D gfn_to_page_many_atomic(slot, gfn, pages, end - start);
+	ret =3D kvm_prefetch_pages(slot, gfn, pages, end - start);
 	if (ret <=3D 0)
 		return -1;
=20
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.=
h
index 36b2607280f0..143b7e9f26dc 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -549,7 +549,7 @@ FNAME(prefetch_gpte)(struct kvm_vcpu *vcpu, struct kvm_=
mmu_page *sp,
 	if (!slot)
 		return false;
=20
-	if (gfn_to_page_many_atomic(slot, gfn, &page, 1) !=3D 1)
+	if (kvm_prefetch_pages(slot, gfn, &page, 1) !=3D 1)
 		return false;
=20
 	mmu_set_spte(vcpu, slot, spte, pte_access, gfn, page_to_pfn(page), NULL);
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ab4485b2bddc..56e7cde8c8b8 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1207,8 +1207,8 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm);
 void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 				   struct kvm_memory_slot *slot);
=20
-int gfn_to_page_many_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
-			    struct page **pages, int nr_pages);
+int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
+		       struct page **pages, int nr_pages);
=20
 struct page *gfn_to_page(struct kvm *kvm, gfn_t gfn);
 unsigned long gfn_to_hva(struct kvm *kvm, gfn_t gfn);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 2032292df0b0..957b4a6c9254 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3053,8 +3053,8 @@ kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, =
gfn_t gfn)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_pfn);
=20
-int gfn_to_page_many_atomic(struct kvm_memory_slot *slot, gfn_t gfn,
-			    struct page **pages, int nr_pages)
+int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
+		       struct page **pages, int nr_pages)
 {
 	unsigned long addr;
 	gfn_t entry =3D 0;
@@ -3068,7 +3068,7 @@ int gfn_to_page_many_atomic(struct kvm_memory_slot *s=
lot, gfn_t gfn,
=20
 	return get_user_pages_fast_only(addr, nr_pages, FOLL_WRITE, pages);
 }
-EXPORT_SYMBOL_GPL(gfn_to_page_many_atomic);
+EXPORT_SYMBOL_GPL(kvm_prefetch_pages);
=20
 /*
  * Do not use this helper unless you are absolutely certain the gfn _must_=
 be
--=20
2.47.0.rc1.288.g06298d1525-goog


