Return-Path: <linuxppc-dev+bounces-2042-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C447B999054
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:31:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdWj0lhfz3cP3;
	Fri, 11 Oct 2024 05:26:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584817;
	cv=none; b=FF3h1mgpYLps6XAJMOWqKyan5Nu+HsaudZ4m1lpdchZ//S8AtQt3n3vqGAmXr14x8YK1BfZBZwGrjOVDjo1UoKSmKJD364pdooVqBf4Rgd3VJJY4TiaBCi8+OqLtBuIG1eefQB203VEfOdTMgLvUaSw+BVUfAc2ipyzCFueQjJWUJWOjA5Hhnl6VKBWa15AqSG3y+tGC79MCNOGWbp1DxUW4uGyWOlTNWV/LvE5KqnGnGKN6ZAsT/lu8YLNYgv5vX0SVPoZAotzp4qWdzTy/Wl1d23JLJX4IgL2/Re9hkoRtCHYJryfg/7p+2JG49QccsM066rwHxQGEGnmiMHwpAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584817; c=relaxed/relaxed;
	bh=9PLNR7J7/StxhsadOj2FvapRbIqIfrDfQ6nFmhEUvk8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kiG3d66O1VNzCzybwPPyD95uHwuDqlANYMYRiad+Z1cqRFG7TdFaTZygthOChNF45pcE18ibRmwD/ysu6J2l7StRcZEwf/C0YILxaim2HKALsiJshL+AutGjOoZ+WY8IxuG99tdWE3q8fD4egAve4J/fY47nDGJIfDEDYpAkEa+J8P+votcz55WwJMhUeks2sC5R/N0rJOjzQn2Db5xR5/9moeejKd9hWQNtga9YXpJR6CjPsUP5+SDATJo2e41v4yL+zVIez88UnfKcrgfc/+DcPZnW51BapSFR5+YrLxgi8/HP4jUGnfDkjVJ0IkRuFtgKU9Lpk372mACIpQKrSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=HNCpMIww; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3bhwizwykdaczlhuqjnvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=HNCpMIww;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3bhwizwykdaczlhuqjnvvnsl.jvtspu14wwj-kl2spz0z.v6shiz.vyn@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdWh0qFLz3brC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:56 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e2b049b64aso20320577b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584814; x=1729189614; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9PLNR7J7/StxhsadOj2FvapRbIqIfrDfQ6nFmhEUvk8=;
        b=HNCpMIwwWTIbxKbHjLWpdZ3XLPiMC8IfgS+XS9kLfgARHH33pU9AelKGa8iWcLWUHR
         53ovrAObTpVNhCeTYSObs/fVO0N0I2tBtKCWnwyBS+PZOs80y5P2wIdREdJ7YndeCoss
         SoP07xKJKe7apksBRrk0seoRSHtu4J2Zo4wXlU9toygPw2tU5FzSlwWn7ISTxwa+2PuO
         KPbD7d9/2RUpLtc7Tlb2gCRahj5C2+2YDO4BbpdyZ8vLTVB+7zbX15FQIyGAO8gqAj+l
         0IRE8jnnEmaWJTfpaK8QizyI8nrynF5HiqHRqN0FxmwVSAlPOeL06/3wTvo70P/9Ny7g
         RmVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584814; x=1729189614;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9PLNR7J7/StxhsadOj2FvapRbIqIfrDfQ6nFmhEUvk8=;
        b=w1uIu0A55ss9VBNnlAyqK/ZSeV40ud30X//08GcLve9zlFJpiWBTfZayvgKUVLWBRP
         eMhGKgc9aDsf67uZbQYsjoPhqbhnp+GtkGvNK0ZVL41f8PkPK4xrEP0HlmqcMkOH1n2n
         WxzxUmPiEKF1aJ0ccYyHf9Ji2a+FdBQ5sfZuWbPp0zpYfTG+HjY4BLW2eFeVI2sMR6rR
         wo4SB4a3m9uL4DfdIe4aeHyoZ2w1i3NLCV0h2re4d2AK+WZufMusm2tA808fNXDFYOR4
         UrauUDYHrQO6PrMkRpmLjti6h5xVv4JEMwjJ/EADYAWI3NmItcIrlCE1cQIjaBvDz5d4
         KV3A==
X-Forwarded-Encrypted: i=1; AJvYcCVA/N4NHNIpK8DVPolnEI8Ut6zNuKFkOeMkcGAMkVBDsTLXN/F8vhJuLtQdQlzVVBC6SrhYseFdNlCakjg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw0OrAjOuMwBWdHxPD/c4+LQgzJf5F7XCgozzmI9scihTL+wvyo
	coYuagQIseMcnjvR00rFeIUoDwO0kEwdLmtFk9e7EIOmdRWXxiqzmKap/L+gCiLRctqqOxW0hxp
	RRA==
X-Google-Smtp-Source: AGHT+IFTz5/NgoL1lG2XSkf5pquU6CJl4M8l3x57mh4U7FbzzS84rW+oHIk+OXb87gKu92fZB4cgNqwOitE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:46c3:b0:6e3:21cf:a67f with SMTP id
 00721157ae682-6e32242fb5emr1006557b3.7.1728584814138; Thu, 10 Oct 2024
 11:26:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:59 -0700
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
Message-ID: <20241010182427.1434605-58-seanjc@google.com>
Subject: [PATCH v13 57/85] KVM: RISC-V: Mark "struct page" pfns dirty iff a
 stage-2 PTE is installed
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

Don't mark pages dirty if KVM bails from the page fault handler without
installing a stage-2 mapping, i.e. if the page is guaranteed to not be
written by the guest.

In addition to being a (very) minor fix, this paves the way for converting
RISC-V to use kvm_release_faultin_page().

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Acked-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index b63650f9b966..06aa5a0d056d 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -669,7 +669,6 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		goto out_unlock;
 
 	if (writable) {
-		kvm_set_pfn_dirty(hfn);
 		mark_page_dirty(kvm, gfn);
 		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
 				      vma_pagesize, false, true);
@@ -682,6 +681,9 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 		kvm_err("Failed to map in G-stage\n");
 
 out_unlock:
+	if ((!ret || ret == -EEXIST) && writable)
+		kvm_set_pfn_dirty(hfn);
+
 	spin_unlock(&kvm->mmu_lock);
 	kvm_set_pfn_accessed(hfn);
 	kvm_release_pfn_clean(hfn);
-- 
2.47.0.rc1.288.g06298d1525-goog


