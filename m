Return-Path: <linuxppc-dev+bounces-4722-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A84F5A03002
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 19:58:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRk300pl9z30VR;
	Tue,  7 Jan 2025 05:58:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::64a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736189884;
	cv=none; b=bUiTTa/HiqbvfTHJF4OCaPoXfGqB+eEzIvC6jjkp3UKOg3Nx5jXnbATDnoAtIbd/BujPvyTEf4wDOwScVlVyj62gtsYBNDHcStoQdO/Dx0Fi4/j8y5jPzCCfhkopwY2YvrLPyKO2x5CgkGJgwSUfb4qymQ48UlNU2V84aIZtJkaoTg/fkCyUFCt2F7FxPEVeGGmHEWX11ELk67JlonjOXkPzbyexzTW9LHOyCd/qfBYZpXJziykVLLp60MXc41Cwfano8Kc4GiJcPWNWPuafkoamdV1HXdvJSMyPbBN7ZFvW2PLE/riBSIZoESH+IRRGs7X1yKu9eY0AT9YJprBKIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736189884; c=relaxed/relaxed;
	bh=/aNADIekx2j0/enI87SMjtmQjX7teTUCuYI/dNHjl3o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Y73Y30bjmJ3hMv7rpLknw+mFguAv7OOLqXLFLyCcDAPwg3zi2hV0e5kmh7UC74lORnh74G0Tp1z9UHmxQiYaLXN0rXJoQA8o88vGuBwNyulwNB2DJiF3cY90UgxSY4iuX8BxkjX0pSFroGFSjPtBGTEWHKtxAza7JxIVEJBpIwaYJbfYoGyWhD+p1mGrLpy31aJVFYfyAJnbfM2CJv+A7SEbODAPtDrmRQzuEXDS5fkAq9/6ibMulU6im89dBS5gEFtBYn2uaXGTd8AY5IXV2Wn3H8yCslwMGf+k7yT4DEmfYDl/y7ZfgpSLXw7ZNQQCFSkJ4Yjveg/WC0+SUqY8ZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=doqF7pFU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3sid8zwykddujvreatxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=doqF7pFU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3sid8zwykddujvreatxffxcv.tfdczeloggt-uvmczjkj.fqcrsj.fix@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRk2y0kjBz30CN
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2025 05:58:00 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-21681a2c0d5so172293955ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Jan 2025 10:58:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736189874; x=1736794674; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/aNADIekx2j0/enI87SMjtmQjX7teTUCuYI/dNHjl3o=;
        b=doqF7pFUidQzabb3+QVRySrLlx4uN4Dk/9foPKix5E6CRolCBR8HkK5hOw9Q1NB7TR
         jxp8gcKLIwuw3EwuRZ9Bcm2eo7jM1KshHFprz5KwIa3ZpxulZ5l8tFxLbe5svJUxfY9I
         +1k/6Ymd1mEQY6w6dZLpWj8A2mk0AecM95A0kORB6ML8QZJuNwLncLUySSYq6zNv7mDd
         LpNV6PcZgg3I7bF/PT7E5gZcChBUgrNx+MCoKZ8aa9RAe3GCrWZ6cD4/fa66cXCu1XPj
         NNpwOSCisjnXaJTSUB43rQkVg/4UyVCKvk3ap02zkI0S5qdxfGObridiUwHy3HMExA5W
         Cq2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736189874; x=1736794674;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/aNADIekx2j0/enI87SMjtmQjX7teTUCuYI/dNHjl3o=;
        b=M3H9SC9NC1NbR7ecacsoLQavVDiY8hx/N3bQ5yPlNv0KZ7hbQ9gtmmFfDSqjFuPlji
         fbW6bmfw5UWRZI/xd9/J9oPYEnP4s9z0ZVMwYr12/+JD/4Xa+/tkiVwKRhfs+eHoKbvr
         aq42YZLm+wG4zdPR3zZEs8LspSiWBTA/v+6W0lZkXbDuExLOBEARUhwmfFJkd2crJmZq
         EG/tlUrfFvneHUK0CvEly1SLRxY4SNoMcI+hfGjrvAai2pjYbyVrIgGcJ2ox6CqCNGsh
         5/LZsGO/eYXyUFpM0sMsWASYkFLfn+BC0B2kUMuSqqFmNh6S7ajLXRRqyOJGa92NPlLi
         VQtA==
X-Forwarded-Encrypted: i=1; AJvYcCWxbcoLHNgTjQSKjs2LZk1SpnXNjb9IkkFk+mKe+vhHCijBT+E3B0vhWawc80ZVlAG39HxfwzPZ3kQMXWM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyXly+ri8cA/x4Q49OzazhkpAu/PWNPlwN9112WRBxKe8gavDYr
	iPa/eEIz497GE3n4f4eWnKUomXT+OaNajEbS5BrS+IrZpq2Dk6l9f4SQ2bH1cvaSf7dUQW1s5IH
	XYQ==
X-Google-Smtp-Source: AGHT+IFTUQyqLv9XSGGLv1fnVkWYgSUL4cT3Eg9R6oafiMKaRGpJd6axUPFHZbm1bK48Dbcs7JdFs6gpXoI=
X-Received: from pgbcv4.prod.google.com ([2002:a05:6a02:4204:b0:7fd:4d08:df94])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:8412:b0:1e1:b727:1801
 with SMTP id adf61e73a8af0-1e5e07a55e8mr87767148637.27.1736189874330; Mon, 06
 Jan 2025 10:57:54 -0800 (PST)
Date: Mon, 6 Jan 2025 10:57:53 -0800
In-Reply-To: <20250101064928.389504-1-pbonzini@redhat.com>
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
Mime-Version: 1.0
References: <20250101064928.389504-1-pbonzini@redhat.com>
Message-ID: <Z3wnsQQ67GBf1Vsb@google.com>
Subject: Re: [PATCH] KVM: allow NULL writable argument to __kvm_faultin_pfn
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Christian Zigotzky <chzigotzky@xenosoft.de>, linuxppc-dev@lists.ozlabs.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 01, 2025, Paolo Bonzini wrote:
> kvm_follow_pfn() is able to work with NULL in the .map_writable field
> of the homonymous struct.  But __kvm_faultin_pfn() rejects the combo
> despite KVM for e500 trying to use it.  Indeed .map_writable is not
> particularly useful if the flags include FOLL_WRITE and readonly
> guest memory is not supported, so add support to __kvm_faultin_pfn()
> for this case.

I would prefer to keep the sanity check to minimize the risk of a page fault
handler not supporting opportunistic write mappings.  e500 is definitely the
odd one out here.

What about adding a dedicated wrapper for getting a writable PFN?  E.g. (untested)

---
 arch/powerpc/kvm/e500_mmu_host.c | 2 +-
 arch/x86/kvm/vmx/vmx.c           | 3 +--
 include/linux/kvm_host.h         | 8 ++++++++
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index e5a145b578a4..2251bb30b8ec 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -444,7 +444,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 
 	if (likely(!pfnmap)) {
 		tsize_pages = 1UL << (tsize + 10 - PAGE_SHIFT);
-		pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
+		pfn = kvm_faultin_writable_pfn(slot, gfn, &page);
 		if (is_error_noslot_pfn(pfn)) {
 			if (printk_ratelimit())
 				pr_err("%s: real page not found for gfn %lx\n",
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 893366e53732..7012b583f2e8 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6800,7 +6800,6 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
 	struct page *refcounted_page;
 	unsigned long mmu_seq;
 	kvm_pfn_t pfn;
-	bool writable;
 
 	/* Defer reload until vmcs01 is the current VMCS. */
 	if (is_guest_mode(vcpu)) {
@@ -6836,7 +6835,7 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
 	 * controls the APIC-access page memslot, and only deletes the memslot
 	 * if APICv is permanently inhibited, i.e. the memslot won't reappear.
 	 */
-	pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &writable, &refcounted_page);
+	pfn = kvm_faultin_writable_pfn(slot, gfn, &refcounted_page);
 	if (is_error_noslot_pfn(pfn))
 		return;
 
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index c788d0bd952a..b0af7c7f99da 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1287,6 +1287,14 @@ static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_vcpu *vcpu, gfn_t gfn,
 				 write ? FOLL_WRITE : 0, writable, refcounted_page);
 }
 
+static inline kvm_pfn_t kvm_faultin_writable_pfn(const struct kvm_memory_slot *slot,
+						 gfn_t gfn, struct page **refcounted_page)
+{
+	bool writable;
+
+	return __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &writable, refcounted_page);
+}
+
 int kvm_read_guest_page(struct kvm *kvm, gfn_t gfn, void *data, int offset,
 			int len);
 int kvm_read_guest(struct kvm *kvm, gpa_t gpa, void *data, unsigned long len);

base-commit: 2c3412e999738bfd60859c493ff47f5c268814a3
-- 

