Return-Path: <linuxppc-dev+bounces-2051-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE6F999067
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:32:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdX20pMfz3cRR;
	Fri, 11 Oct 2024 05:27:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584834;
	cv=none; b=CusHt3OLAmgzC4DZPQkoqqQ/FlWMfDazzlJF/zgpvXoEmB2cSIq9x4EUOrA55BuAcx8ZveZFgFy9UkIh3beuZeKPQN5JIF7tfU310XsTytWcRZZpwp/9WUc4knCX8USxEu0XahhmvW84mMW2du7YojnOdzBk4KMfZYg42p8dWPE3FxRnWRXiJB18mHzsYymmWtkBr/q//HFNwSJBZ6IoUbZwkq/VWbvIr1A/9ioUc8465V8U4sKrvsBbbUYM8F5TDXCBApjB1fj93Oxvy1eAKYEz5sYAaYyi57IB+1MAycHbr8M2bbli2M5jC4oOvI0bx89ruWcQg+xrhjrXL+PkNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584834; c=relaxed/relaxed;
	bh=2XctyNuj5rmp2glWM4MaDBrVp36o24kp0nhTjUz4HGM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CLOzVim8A1awIqWFWxeHGS4is8bfStD9Qdc/WkYcmBIjgO/REvzHHksqtDm+RD5rql8RD5Be+i0mdxP0U218vqk/PHnV30m9c7Yl+jx2MICgMMQPMJE7ynGnvboqVXwU53J3vzPCHtMwUxwATdVCzgW4Hs8xly991lJOq1VwbDPbNhdxmMyOfGf/F7dc6iyLo9U/zdZPloKOr5nPFIez+6XayVYnMfDCanEXxzquhRjrjGIrzsgk6v3CWsqo7c0mqUjyyWRCp8/Qgv5my0HoZMBVOiso2rJ0poelfUJaHrevRg9p4gjNpir8L+tSwzIrdsmlV9gQbn+yjs5Td+no2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fC8+XXHH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3fxwizwykdbgg2yb704cc492.0ca96bildd0-12j96ghg.cn9yzg.cf4@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fC8+XXHH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3fxwizwykdbgg2yb704cc492.0ca96bildd0-12j96ghg.cn9yzg.cf4@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdX10rQHz3cRF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:13 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e28edea9af6so1639539276.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584831; x=1729189631; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=2XctyNuj5rmp2glWM4MaDBrVp36o24kp0nhTjUz4HGM=;
        b=fC8+XXHH5YKrALlxtDx2jZr7dncUhaez8B0+53KlYhY5IuqqiwStsrsLM+R73EFMkw
         dDLjtTEBPMqRX1XVQYXmMCBXhyI56a6CU0hHhXYDY07hzMiAIMa3T8gSYqNVM35S5Z//
         jvmjo1R6zB7BGSlzwKQlKrFlxXkfBgfo7qho4feb78MKPMiBWHzlWnIFnMluG8gRMQRk
         IGYW3Z6TnOY61RRGkf4vEftc166lQC0G2OqfTiOL54aTEoYaMOXgCUNXe1T1oPmiZ8jD
         jXM6D0S4JfPxHCYLDF31x97ezpmOZAox4Si/zCbVzj94+xdnT5mkDrjc01ggpjOanBLa
         ZUCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584831; x=1729189631;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XctyNuj5rmp2glWM4MaDBrVp36o24kp0nhTjUz4HGM=;
        b=mmzua459Fsk782HymCEXxzlk1ENrXmRZljRcmkto6aqucGczETxzOzsTlskPnjeZt3
         9z1ZB20SHj8VJYAR2x1/S/pj5+RAVB/uf+dN03sAzlDoWGFstmWJnBjRt9NBfezpF6cL
         Aak5nGlpgkeSJF+VqwyaIqAuywmNKO4T2Jm14iaFpx+HC+pid9lwE4DbliqPSVGiH528
         1+6gabJCFIeGLetY3g0zo/tLkammGTuCVpBIQK8S0UbgrYStSXY7zsKikWZzIhyvyciz
         fed1otDpiKxZEh0+ayocZS0Npl4zmfRtVOdcLWxpLDrfDxorugRAYIJUw6Q9i63RtmWE
         AjIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHA831NmrKYW2P/eYOCmdpcOJSTSQLZ6o/MfquZsA523rnpGujR3iSxs+fkwCKzR7qPWGbR1TFSqwLUWw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxvoaRg4i3xT/6rin1i1iXHyhWciOUAxl9eHWhHF5OdBZ7F5g8Q
	wAZOQ+p9Mb89oPjPovFp/qGzmjp5IqHKi0/4xVzDweEgYNhmPP1YamyZxkzHoejInqe2RHM3K73
	mog==
X-Google-Smtp-Source: AGHT+IHdtHq1a5g5QmW1TlBMuTKUOZ7R4d6aOVSlzi7r2JK/pfzCqaKRixPsJw6iRhPElP6sWQ73LfqmPps=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:d353:0:b0:e28:e74f:4cb with SMTP id
 3f1490d57ef6-e28fe0df614mr96115276.0.1728584831124; Thu, 10 Oct 2024 11:27:11
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:08 -0700
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
Message-ID: <20241010182427.1434605-67-seanjc@google.com>
Subject: [PATCH v13 66/85] KVM: LoongArch: Mark "struct page" pfns accessed
 only in "slow" page fault path
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

Mark pages accessed only in the slow path, before dropping mmu_lock when
faulting in guest memory so that LoongArch can convert to
kvm_release_faultin_page() without tripping its lockdep assertion on
mmu_lock being held.

Reviewed-by: Bibo Mao <maobibo@loongson.cn>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/loongarch/kvm/mmu.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
index cc2a5f289b14..ed43504c5c7e 100644
--- a/arch/loongarch/kvm/mmu.c
+++ b/arch/loongarch/kvm/mmu.c
@@ -552,12 +552,10 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool write)
 {
 	int ret = 0;
-	kvm_pfn_t pfn = 0;
 	kvm_pte_t *ptep, changed, new;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	struct kvm *kvm = vcpu->kvm;
 	struct kvm_memory_slot *slot;
-	struct page *page;
 
 	spin_lock(&kvm->mmu_lock);
 
@@ -570,8 +568,6 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
 
 	/* Track access to pages marked old */
 	new = kvm_pte_mkyoung(*ptep);
-	/* call kvm_set_pfn_accessed() after unlock */
-
 	if (write && !kvm_pte_dirty(new)) {
 		if (!kvm_pte_write(new)) {
 			ret = -EFAULT;
@@ -595,23 +591,11 @@ static int kvm_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa, bool writ
 	}
 
 	changed = new ^ (*ptep);
-	if (changed) {
+	if (changed)
 		kvm_set_pte(ptep, new);
-		pfn = kvm_pte_pfn(new);
-		page = kvm_pfn_to_refcounted_page(pfn);
-		if (page)
-			get_page(page);
-	}
+
 	spin_unlock(&kvm->mmu_lock);
 
-	if (changed) {
-		if (kvm_pte_young(changed))
-			kvm_set_pfn_accessed(pfn);
-
-		if (page)
-			put_page(page);
-	}
-
 	if (kvm_pte_dirty(changed))
 		mark_page_dirty(kvm, gfn);
 
-- 
2.47.0.rc1.288.g06298d1525-goog


