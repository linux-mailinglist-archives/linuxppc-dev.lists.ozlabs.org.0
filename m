Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 205DB93DBC2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:06:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VRWgq2j2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW4fN0KRNz3fnQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:06:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=VRWgq2j2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=36zakzgykdcyugcpleiqqing.eqonkpwzrre-fgxnkuvu.qbncdu.qti@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4ML5tyNz3dLc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:53:18 +1000 (AEST)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-78e323b3752so1105773a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722037996; x=1722642796; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=oqsp5dWmLf1ceGtEyEpwn2+TSiYr9kgkgYyCIEXijOU=;
        b=VRWgq2j2YFSTmvJEvDBdPW4K1a0GCxUJFwBQ7gTgaxonuP/ZEmdmkHhf6kTXOlFHYB
         XMj8/V+HS4AGjMO9qIgWt8GM55HHdxADySGjeGO5gm2q8bOFmARl2gxU07v9p19h32hI
         HN4HLrSD5/UgXhmmr2dgZsMtNHb3BrHKc5wA8QNSfIr7tFktD4G/oMpQt9wVG3lomDqG
         OBPuk/f/5rvCLSRkMWO0rhCA0IGg+T/EYuvYJcu/fH6gC8MtNTvpNTHM3TJZIXjjrIKx
         A+jk4Gxx4ft5zh76IIvsclJYJAc1rAcuOz1EoGFmhaDvSQJV7j1qe5hERj1rbma9mGyO
         MOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722037996; x=1722642796;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oqsp5dWmLf1ceGtEyEpwn2+TSiYr9kgkgYyCIEXijOU=;
        b=BDUD265o2jVGPcPQrh7CfeKE9V08A6kEu1R0EHQnpLDGlz9AKveKb36xYyIYGjKHVk
         lEzatZhIGAVr5m7680f42FxNk54XgY3BlmP6+nVM9S/kO8z87Aa7A/xfIkfYVbpCO5/o
         Z3/labMO8pI1zBM2W2KNb1kfsv/GqAuzs9OaO/pQKvK1D1jjm3HTeGdXqWHERsTZQ4lJ
         w454dQLR2tgfIgcgnDupEfyytapiEU0k+WCWuSZWBfO1jUJaNA77yNejcmcxfM4HVlk+
         iNUpRbPX45smbN9wL468ln1JYWQkEV8mF6TMmjOLCurGC7oeCHwyVftDlJud3bbi0v+k
         0uuw==
X-Forwarded-Encrypted: i=1; AJvYcCVyACrallb+ASOP2SS8PNvemXd1+uUTqdRkCz0dBWNrzPN0J2GhnlTFs1Wwz+uN1Mbi5yUU1J9izt1PEckf0dwQeFiG9UBvx4hQP1JRTQ==
X-Gm-Message-State: AOJu0Yw+zB04YYf/iT5IPng3LITU5JroXcFpNyRPapQVJbuwmAGMj1P/
	GNvdJiRyiQ6AUTReZLHiuu9wz+HJFpAtfAyqPpUhH6iCvZoj05z4vdmow4JOm3X6ycydg8V3N6t
	86w==
X-Google-Smtp-Source: AGHT+IGPnVvSSR8GC4je1DUQj4K0eIO0wDIdrfABFjI4ae5Nt/lU6oCOfX0avnzwArksU/NKeR8FWd7ZKxM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:5a9:b0:6be:8aa5:bffb with SMTP id
 41be03b00d2f7-7ac8e0bb8cdmr3560a12.4.1722037995764; Fri, 26 Jul 2024 16:53:15
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:28 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-20-seanjc@google.com>
Subject: [PATCH v12 19/84] KVM: Explicitly initialize all fields at the start
 of kvm_vcpu_map()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
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
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, loongarch@lists.linux.dev, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Explicitly initialize the entire kvm_host_map structure when mapping a
pfn, as some callers declare their struct on the stack, i.e. don't
zero-initialize the struct, which makes the map->hva in kvm_vcpu_unmap()
*very* suspect.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 40 ++++++++++++++++------------------------
 1 file changed, 16 insertions(+), 24 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 21ff0f4fa02c..67a50b87bb87 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3088,32 +3088,24 @@ void kvm_release_pfn(kvm_pfn_t pfn, bool dirty)
 
 int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map)
 {
-	kvm_pfn_t pfn;
-	void *hva = NULL;
-	struct page *page = KVM_UNMAPPED_PAGE;
-
-	pfn = gfn_to_pfn(vcpu->kvm, gfn);
-	if (is_error_noslot_pfn(pfn))
-		return -EINVAL;
-
-	if (pfn_valid(pfn)) {
-		page = pfn_to_page(pfn);
-		hva = kmap(page);
-#ifdef CONFIG_HAS_IOMEM
-	} else {
-		hva = memremap(pfn_to_hpa(pfn), PAGE_SIZE, MEMREMAP_WB);
-#endif
-	}
-
-	if (!hva)
-		return -EFAULT;
-
-	map->page = page;
-	map->hva = hva;
-	map->pfn = pfn;
+	map->page = KVM_UNMAPPED_PAGE;
+	map->hva = NULL;
 	map->gfn = gfn;
 
-	return 0;
+	map->pfn = gfn_to_pfn(vcpu->kvm, gfn);
+	if (is_error_noslot_pfn(map->pfn))
+		return -EINVAL;
+
+	if (pfn_valid(map->pfn)) {
+		map->page = pfn_to_page(map->pfn);
+		map->hva = kmap(map->page);
+#ifdef CONFIG_HAS_IOMEM
+	} else {
+		map->hva = memremap(pfn_to_hpa(map->pfn), PAGE_SIZE, MEMREMAP_WB);
+#endif
+	}
+
+	return map->hva ? 0 : -EFAULT;
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_map);
 
-- 
2.46.0.rc1.232.g9752f9e123-goog

