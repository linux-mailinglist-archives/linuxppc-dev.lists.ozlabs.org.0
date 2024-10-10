Return-Path: <linuxppc-dev+bounces-2039-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5F499904E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:30:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdWZ38Qwz3cMQ;
	Fri, 11 Oct 2024 05:26:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584810;
	cv=none; b=iwyAtkk5gz9Q6A2Siirve4hZztYR8mfRtw2Ijvc3FsE/WldVRhaFWHhb9vtYboE5nMG6dCmLSA4phktXv+P+SpfZQH3UfJIM09HtTuLuSeXah4OFpI37iC4r1lSqRjwVIjkrV4uAEw4f6dadwKnHiI5Kwsc6R1ygI4rHD2Rv+nwJZzq//dqExr66cCD3Kwt7g7GBsZ924N27rD11p3ZWSjr+RnRD4cc0AStiSIreHd8Xz7kzfR2Epk/hoG+d8NE/ae2SGU/guhd1DEZ40kRExWxJoWCetHmICOpRwDClOP5GSi9Sug1OilDBJG1wgTkKQpaYr51hG4OlsPHToLOQ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584810; c=relaxed/relaxed;
	bh=nHP38EtPz8K1+ebGaPqvgAKvgaQP36cKGSrn8JpxRdw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A8vGaklnsPYTCGn5Eakx+G2Zah8YMusBWfQBCUMvLDeKl7MQb9x+znaM0mgVNmtve/62+XZ5z4HACy+MkEXkm35aPFkjl1hjVVD93feWSkrIP1tYrSPOK2oV4u7PvtJEyxFD+Y9gLhYI5GkkQeUs/xL+Q5hsVIqLMsfYU346fiSyYhGD8eZzidVTMcik9toI5Eg5II2qSn/UNPceHzKQCP7YK/w5k0UU7ikRwChJMSrvqx8pbdSvVQdITjx7u7FcvB2MvIsj9SXX4ywHe3jtSAl0VNwoAlNvW/iilxdaHbUM9FBuU+jQ/bNE1kz6R36/QyNR78S05QLry0w6BhHPGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=362rM5IU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3zxwizwykdp4ykgtpimuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=362rM5IU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3zxwizwykdp4ykgtpimuumrk.iusrot03vvi-jk1royzy.u5rghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdWY4Wwrz3cN4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:49 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e28fdb4f35fso2111619276.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584807; x=1729189607; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=nHP38EtPz8K1+ebGaPqvgAKvgaQP36cKGSrn8JpxRdw=;
        b=362rM5IUkoTfB4RrwdLWJqSuA0MK48A79XDZHvOAjFkZi2a+R5pDfad8JvGVlriusk
         cw8Ra4QNwhY8OrPN0YrTKZ5fCdEcTf4TPF7RqkX3ZvNFq4iXL5Vt0+ezdsYzxAz93nHu
         djwLLiFeuXTT8jDDtOIQ26GQORGonvQiwpTNb+kUuCsgFqBp263zWK2qvwTo4USYldwc
         OoFS1Oq4LhM8n01vzQBgDASz3WOOkDvYLFIUXIgM/H7RzVZnT2E/h9tG85YyUG3d6DjV
         63sUWpskeiodmRrD0E7No+8kJuRzfWaEZuN1PofLVd1UnM0NBn+vDQO/FDbuVCEFMcDm
         Segg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584807; x=1729189607;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nHP38EtPz8K1+ebGaPqvgAKvgaQP36cKGSrn8JpxRdw=;
        b=X9l+WPBvX2/qyKrFS6rlVJtrwjhLwd4Cnri03v9UYKz+yXmaSndCvPssM4FsurT/Io
         8JDiPHhKplHqr3grOf4iXqOPK7FREg1hV4vYcolF6P1mFY3Y0gZBH07jmwfvWZ8uYDVU
         kKJ6hfsalcaRsbLhNMY2F83Yoe5tq3hxOy1g0owfuqRFCGwc7akt/bgT2Bqyhohiz7SD
         7wflF3sa0SIGn4kAwvzjCmMbtCjHasr6KgaLQ0TfdbbvRI1qJ0n17HonwxHxn+fgxR1f
         mnPUAnJWqtg4/kNnpFPB86DOfv4PEDQDmHPL+tHD2UBFRpIxv9rYMoInIFErQg+xxTV3
         5iGg==
X-Forwarded-Encrypted: i=1; AJvYcCXD81j/HbadVE5V5IbolUiqQne0134su1KsdAcRgNahyvEvpa8cxaT37gvyM87JknbzZcRIBRqOEojXFEo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzxF6x7ABDdriFrpO3eWW03QTg6z3uqHR/ROmad2u4+VjRs953a
	hRbd1DuOwfNDLd0GeEQz6PkLsxmPPkp/7ZjRyLh2JNAfVxoECQGIKXxguSsDv+T+tdPs1AtOtHY
	t6Q==
X-Google-Smtp-Source: AGHT+IHQvsj0FcPHwm2v4Ks73fb0XY1uO3QmFFCKoUyfp7OKRYByAKtc8uXQ4anZ8QaSR/IH5oavOTtruEI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a5b:b86:0:b0:e0e:8b26:484e with SMTP id
 3f1490d57ef6-e28fe516b5amr5188276.8.1728584807403; Thu, 10 Oct 2024 11:26:47
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:56 -0700
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
Message-ID: <20241010182427.1434605-55-seanjc@google.com>
Subject: [PATCH v13 54/85] KVM: PPC: e500: Use __kvm_faultin_pfn() to handle
 page faults
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

Convert PPC e500 to use __kvm_faultin_pfn()+kvm_release_faultin_page(),
and continue the inexorable march towards the demise of
kvm_pfn_to_refcounted_page().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/e500_mmu_host.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/kvm/e500_mmu_host.c b/arch/powerpc/kvm/e500_mmu_host.c
index 334dd96f8081..e5a145b578a4 100644
--- a/arch/powerpc/kvm/e500_mmu_host.c
+++ b/arch/powerpc/kvm/e500_mmu_host.c
@@ -322,6 +322,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 {
 	struct kvm_memory_slot *slot;
 	unsigned long pfn = 0; /* silence GCC warning */
+	struct page *page = NULL;
 	unsigned long hva;
 	int pfnmap = 0;
 	int tsize = BOOK3E_PAGESZ_4K;
@@ -443,7 +444,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 
 	if (likely(!pfnmap)) {
 		tsize_pages = 1UL << (tsize + 10 - PAGE_SHIFT);
-		pfn = gfn_to_pfn_memslot(slot, gfn);
+		pfn = __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, NULL, &page);
 		if (is_error_noslot_pfn(pfn)) {
 			if (printk_ratelimit())
 				pr_err("%s: real page not found for gfn %lx\n",
@@ -488,8 +489,6 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 		}
 	}
 	writable = kvmppc_e500_ref_setup(ref, gtlbe, pfn, wimg);
-	if (writable)
-		kvm_set_pfn_dirty(pfn);
 
 	kvmppc_e500_setup_stlbe(&vcpu_e500->vcpu, gtlbe, tsize,
 				ref, gvaddr, stlbe);
@@ -498,8 +497,7 @@ static inline int kvmppc_e500_shadow_map(struct kvmppc_vcpu_e500 *vcpu_e500,
 	kvmppc_mmu_flush_icache(pfn);
 
 out:
-	/* Drop refcount on page, so that mmu notifiers can clear it */
-	kvm_release_pfn_clean(pfn);
+	kvm_release_faultin_page(kvm, page, !!ret, writable);
 	spin_unlock(&kvm->mmu_lock);
 	return ret;
 }
-- 
2.47.0.rc1.288.g06298d1525-goog


