Return-Path: <linuxppc-dev+bounces-12961-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D60BE5EB2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 02:34:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnm534Bhnz3d9B;
	Fri, 17 Oct 2025 11:33:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::64a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760661191;
	cv=none; b=B9/vgjUucE2c382vGoQ7mxfjAvS0nUk8TaRJ6ocUsUSP8sYZff3+yFLSucYu4HxmitBPqBEyIyRosHD7PE1xMCSviErkxLcCffiZZeF7CfYKCf2DkyZkdfsPqvv5UuchqGTwOPdRK0YiHlSnB+HYVjggEQl3yGtKQELPYpMFuZlTLBJjo8xAr+aibtfiN2+eU7sN8aDGBW9tRWFYr/tIXCN2PcK63H/AMC8WfHKqfBsuyx4bPNQrYh4pfZ6N/QVc0JFAhoJJ+Cmj/o8e+QDkH+t6rg4ILSVLjSzN8YO+u42cnH1c5Xs1KkSTjARTLhc/czt2pPJf9QJhsTAXQGur2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760661191; c=relaxed/relaxed;
	bh=YenbGRez6bu/UEaTbB8eZbtDNA5csFA4mZUF4JnZu9w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gDPgimHOgEbH9RxsakMtaFn2wKsvW5E48XBoBLaIptRtSjL+iYpGPbmKln07IGQMHL87VptzQ/MSOGtKxwSI3N+SVGFFxcrUhuabzvupeXegO4zCYNM10ncjtmAmZnutZ3J6WqCQG5/O/qfkLNIG1fIwkR4Bk81H2Le86R3U4oijTLm41PWPiNkzSFLpt9pmytNPGW/VqEf/WOuJWjHq2lBL8djCTyyhGnvjGh0bikV6yhIFWH7Smcql3iRKBoB43rBXVwivh5HH+T88lK+Enjc+kkJVW+GR7RFfy22wqoOzi5DNVdCY+n215gF2OAe0dlhh5V7gfy5SGua8Td9sZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=iyjHP/vt; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3xy7xaaykdpyqcylhaemmejc.amkjglsvnna-bctjgqrq.mxjyzq.mpe@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=iyjHP/vt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3xy7xaaykdpyqcylhaemmejc.amkjglsvnna-bctjgqrq.mxjyzq.mpe@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnm5273GGz3d8x
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 11:33:10 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-27eca7298d9so29216585ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 17:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661189; x=1761265989; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YenbGRez6bu/UEaTbB8eZbtDNA5csFA4mZUF4JnZu9w=;
        b=iyjHP/vtashsUX01YMpS/WYD00eknrAkCjEHSf49RuRBcj2ra7DL47xg08/hpCbX/8
         gnXrsfa28UzJJWQCxLYg4IFbYuEQwSLnyog22vITlO5pFH9jnTFDx79AfHtzhIRziTCq
         KpokRVDE60oUc5fd/qzH4QtERvYvkz/xMCss92EQZuEnEHYwOaJFtoewONngvKzXrurG
         l6I22IBMkxxQdxnIBtXiFPaTr23viGXV6CKyyzRCKyDCXJcevFBDldz+RBJzGtkhwZ6g
         QLcrA5zpvG4t7iIg59zEQJNvT/fLLVi5DdP02PnGp2J2RD5sg250cTVJc8vuXNPIeONi
         hRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661189; x=1761265989;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YenbGRez6bu/UEaTbB8eZbtDNA5csFA4mZUF4JnZu9w=;
        b=KvFX3ElS6YfQEILDx0U5aY+dPQOaDHwtzlBiTTHNEGEphogtIwIJoj1+3o46V+4cFQ
         blD10y9kwAi9atNXr3UNd9VqUR9SiHr0PV7SwITCATw+s9tdLzZlt/HxnSmqgh9BXU24
         HzshYKmGjpaHaMJ1GFlcxPrdP5N40kN+9NzpeM6cCwAsXhZsnqowgExskDpCtlYpsXrm
         PWygyUrKLCNfKIuMjMIrjMetnbEe2IQUoNGlGNuVwfRT4g78hyNgS/A36dyp72I3LQd+
         cvzq0VfJU5DfZ1jeCgpnWnNPtkMPu0dvSTI6sGmVVUSBTE2blxCb1JJabaxwG5vVRC6R
         hcgA==
X-Forwarded-Encrypted: i=1; AJvYcCV/lMU7j9Dxl/g40UbDWc1kPQa34dMq2xQIKGSrehGaanHlOATaGZw2bLDwQ0xlJLVY+1L5mozgbq6IjKI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw0Z6Jd1in+BxZ0Uk5pShUWmaJct96S2B6UTVkA81akzCSl93Bl
	4Nv3x/ivM2pxhI5oE4HMuKH79Fvyw9ht08MbvN1hKanhj4azih/d/aiIZmJ3WIzenbyAPtNuSEC
	uNIKE4A==
X-Google-Smtp-Source: AGHT+IFzwgrTUpyTLmlR4n7vLZlT3Ntvx3uZ2AlOGbeNdkR1Pz/L5L7m7JolYZt52l8hjag9eabuD/ERTOw=
X-Received: from pjbpf6.prod.google.com ([2002:a17:90b:1d86:b0:33b:5907:81cb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19f0:b0:286:d3c5:4d15
 with SMTP id d9443c01a7336-290cb947798mr22501395ad.36.1760661189400; Thu, 16
 Oct 2025 17:33:09 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 16 Oct 2025 17:32:30 -0700
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
Message-ID: <20251017003244.186495-13-seanjc@google.com>
Subject: [PATCH v3 12/25] KVM: TDX: Use atomic64_dec_return() instead of a
 poor equivalent
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

Use atomic64_dec_return() when decrementing the number of "pre-mapped"
S-EPT pages to ensure that the count can't go negative without KVM
noticing.  In theory, checking for '0' and then decrementing in a separate
operation could miss a 0=>-1 transition.  In practice, such a condition is
impossible because nr_premapped is protected by slots_lock, i.e. doesn't
actually need to be an atomic (that wart will be addressed shortly).

Don't bother trying to keep the count non-negative, as the KVM_BUG_ON()
ensures the VM is dead, i.e. there's no point in trying to limp along.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 220989a1e085..6c0adc1b3bd5 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1722,10 +1722,9 @@ static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
 		tdx_no_vcpus_enter_stop(kvm);
 	}
 	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level)) {
-		if (KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm))
+		if (KVM_BUG_ON(atomic64_dec_return(&kvm_tdx->nr_premapped) < 0, kvm))
 			return -EIO;
 
-		atomic64_dec(&kvm_tdx->nr_premapped);
 		return 0;
 	}
 
@@ -3157,8 +3156,7 @@ static int tdx_gmem_post_populate(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn,
 		goto out;
 	}
 
-	if (!KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm))
-		atomic64_dec(&kvm_tdx->nr_premapped);
+	KVM_BUG_ON(atomic64_dec_return(&kvm_tdx->nr_premapped) < 0, kvm);
 
 	if (arg->flags & KVM_TDX_MEASURE_MEMORY_REGION) {
 		for (i = 0; i < PAGE_SIZE; i += TDX_EXTENDMR_CHUNKSIZE) {
-- 
2.51.0.858.gf9c4a03a3a-goog


