Return-Path: <linuxppc-dev+bounces-12963-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E720BBE5EBB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 02:34:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnm566vPRz3dBw;
	Fri, 17 Oct 2025 11:33:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760661194;
	cv=none; b=HoCZQzCgjalBvQXk5ZHPfJaD29tQXr/WvYZ3DU5GofNtETAp8EEX/psZwHMj4MRdOPmjpPQmTzPk+/EWml9T/L0z5UQv610apWzZ++DJLGgmJN3DrDFaCxQ45+AK6CDEC1aQgCa1oMzyDRgv4hhgpMr1FVKN/WA61sQyu0EsHyrLkyu5hg8pbTjZ1/a/dU/o4FkKHFRMW9Z94SagRznbWWAXKyNDp0XsV71YD/LJ9fnSpqM7Y3io+MXLw+0J9blBteyvX+tFwtPXU2KC+RgojtQyFGg+RHIkYkzuWzWFSBRpLTLdzjm9g9pwPYSNjS/aUxzOcMKBec8Le3MJ1/PrHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760661194; c=relaxed/relaxed;
	bh=yGJSKqxu0aNpKU4CMPi7Ju9DUaCLFSD0JC8SLGhbfdI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WvPRTEBsd8Ggtw36wCAkONcb5pYctuqgUHGUhqP1gHVsAy09Ce62IETM46lD5Lqlar0QQg+Lk2TlssSF8xPVFMgtJdwkgyqCLVE94taYMUiVLEnM2POjTiV4+Mdw/IAMG3GeKjN3PojcbUTr4wZn9JWCPrBHghQsn0rMncL+Dg3TJfLHwPrFS3HbkyFYLcyXnnAUc3IVrtAur8VeG++whUiSPwkfg7sZIvG3irKzSliyAP6BEaM60+c/8c22oeJCacWWh2lQE7XZ+kT6/wRaauF6fJzdV+INGg3YZ1HYI62GS3hZ19Ntvh4Yei7epiZF7hloHbft/ppdfDRlSnBoug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=IRi+sfJR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3yi7xaaykdpktfbokdhpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=IRi+sfJR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3yi7xaaykdpktfbokdhpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnm562pSWz3dBr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 11:33:14 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32eb18b5500so2174594a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 17:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661193; x=1761265993; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=yGJSKqxu0aNpKU4CMPi7Ju9DUaCLFSD0JC8SLGhbfdI=;
        b=IRi+sfJR8H9zUnw/5OOYHsSafkTEWvMPk4gEv9zCMszO8zQwD5T6HYD/IrsOfjPmxn
         zN/EVbhwKXRvQ3IbQFQaPscMt5n/SqhXPf1dq1KWuStLlD6ehwavYqIzJ6aOsGNonrnC
         1K690WRg9sleBrSSirTorY/IdPu97azUS80K1KsCc9eF3+UahRiylD22B+ZvqdI5lPPk
         nt1jBUS3rwrZ333h/1ofjmnJiom9OjGcles3fli1CclpSv/vNv7DSKRUd+PfbBc1ZjtL
         H6om/UIaLmL+g9OTyr6nRTj6l/RmKuB4NOd+283kLdcFbXtS3l0dDCsnlDJ3jAnvNkEX
         DW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661193; x=1761265993;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yGJSKqxu0aNpKU4CMPi7Ju9DUaCLFSD0JC8SLGhbfdI=;
        b=SUfgiEDNb+EkjYVIvuT5mlOVeCe8Ssb3CbY6sEWAgbmJN/Nz6r4s5Ck2d9HjArjAc6
         UPpYowN2owGZ/nayo2q/LDJNMzzHDGrKLocyQihykuNmKVodI6he7KvToVGDjV7Jp3vH
         GCYHNQF25weVYDf5ysjvY8h4JeU9ZF449a+t6EOu3nQc4zMI8y+QiFKzidFBzHa0Sq12
         vMr8GYVBXqpigmq02Yktka4Y0R/ymY/it/tk7FoGXAfyKJoT5YfuytXt3zqfCgpIk3tg
         IeUSAVvsa5QphQVc7QncqDHkMkAX+t3aPRsTbasdB3oR1bTZnQoHLvabW7VzRI+vJN3D
         zeiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQr5fSPcMrf+VJ22pTaxfEw/Fu394sdTPmtgTMU0WtYaLCafQ9wdXQReA8vO50jWN3Rm3/c+MTLxtnEtU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyPfIVBjQpEW3n9XQGScZWRgsJhS/FkTipSnA+la2jJdATvUuOU
	O6V7sW8VUcwweH2IQZK5v3JT0HuQYK/9mz0XV85CmkUXAbl6vIAL0QVQ5CWsFy57cuXB3h6YQYN
	n/tFNfw==
X-Google-Smtp-Source: AGHT+IHjaZ2dKb3gnqjzbrezKxoV9F/Lq4sC9R35D07gH2vTOnVl3FqHgnrEtTPEkkZOYMNEYP5euQorQsk=
X-Received: from pjtu8.prod.google.com ([2002:a17:90a:c888:b0:32b:58d1:a610])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4c05:b0:339:ec9c:b275
 with SMTP id 98e67ed59e1d1-33bcf84e181mr2234528a91.6.1760661192796; Thu, 16
 Oct 2025 17:33:12 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:32 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
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
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-15-seanjc@google.com>
Subject: [PATCH v3 14/25] KVM: TDX: Bug the VM if extended the initial
 measurement fails
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

WARN and terminate the VM if TDH_MR_EXTEND fails, as extending the
measurement should fail if and only if there is a KVM bug, or if the S-EPT
mapping is invalid, and it should be impossible for the S-EPT mappings to
be removed between kvm_tdp_mmu_map_private_pfn() and tdh_mr_extend().

Holding slots_lock prevents zaps due to memslot updates,
filemap_invalidate_lock() prevents zaps due to guest_memfd PUNCH_HOLE,
and all usage of kvm_zap_gfn_range() is mutually exclusive with S-EPT
entries that can be used for the initial image.  The call from sev.c is
obviously mutually exclusive, TDX disallows KVM_X86_QUIRK_IGNORE_GUEST_PAT
so same goes for kvm_noncoherent_dma_assignment_start_or_stop, and while
__kvm_set_or_clear_apicv_inhibit() can likely be tripped while building the
image, the APIC page has its own non-guest_memfd memslot and so can't be
used for the initial image, which means that too is mutually exclusive.

Opportunistically switch to "goto" to jump around the measurement code,
partly to make it clear that KVM needs to bail entirely if extending the
measurement fails, partly in anticipation of reworking how and when
TDH_MEM_PAGE_ADD is done.

Fixes: d789fa6efac9 ("KVM: TDX: Handle vCPU dissociation")
Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index c37591730cc5..f4bab75d3ffb 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -3151,14 +3151,22 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 
 	KVM_BUG_ON(atomic64_dec_return(&kvm_tdx->nr_premapped) < 0, kvm);
 
-	if (arg->flags & KVM_TDX_MEASURE_MEMORY_REGION) {
-		for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
-			err = tdh_mr_extend(&kvm_tdx->td, gpa + i, &entry,
-					    &level_state);
-			if (err) {
-				ret = -EIO;
-				break;
-			}
+	if (!(arg->flags & KVM_TDX_MEASURE_MEMORY_REGION))
+		goto out;
+
+	/*
+	 * Note, MR.EXTEND can fail if the S-EPT mapping is somehow removed
+	 * between mapping the pfn and now, but slots_lock prevents memslot
+	 * updates, filemap_invalidate_lock() prevents guest_memfd updates,
+	 * mmu_notifier events can't reach S-EPT entries, and KVM's internal
+	 * zapping flows are mutually exclusive with S-EPT mappings.
+	 */
+	for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
+		err = tdh_mr_extend(&kvm_tdx->td, gpa + i, &entry, &level_state);
+		if (KVM_BUG_ON(err, kvm)) {
+			pr_tdx_error_2(TDH_MR_EXTEND, err, entry, level_state);
+			ret = -EIO;
+			goto out;
 		}
 	}
 
-- 
2.51.0.858.gf9c4a03a3a-goog


