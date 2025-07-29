Return-Path: <linuxppc-dev+bounces-10439-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8207FB15237
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jul 2025 19:43:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bs2k24ymnz3bkb;
	Wed, 30 Jul 2025 03:42:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::104a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753810970;
	cv=none; b=TyL9khNxc2EGOKIEbGa+qefkci1a1Cz+bGwxjlJyaeKMRGyVCptibXABcocNjnHmvlfmok3KfMxdBKM3lA1J+VW4ECgztNghYiZcbVAe1OITvJJqrzJhMGIMdPp+ZkidDVihfXXpsFgQsRozetStDttqolQlm9quVyRSuUN/yNxSOuNNkmsVLU3WVjyDbQQJftmmQbS1LFyikpjggfYDm3BoiDfIRCZzI/pWaeXH6QNVmwBDSJ8cDQflGF7nZIQQibhlTGsicdSt0S/y9EDI2V/FUNUmRwMsAx9TOET6cwmqZsKARwoHktrODPmG3vV5DdXEmEEvdQWCIKZis6snwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753810970; c=relaxed/relaxed;
	bh=0cDIK6qF6nWwCr2NoTbZWaYG+2Frltnz2b6AbcPAKOQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PyImP3fjOao8WPwJFIV5rxHuoYAZrqBwSDTlSn7aWUFO/xiVIzNr5Jg2oQQlltpGXKbKuiI4fgPOthbIbj6RrLZUPfnZwMXQjxldKEmCfU905TKpsJ1uO/8dJYzt0Ho2Dss0rJ+OOv4cbrblsrKr3hguxKlJNw1AhHTbFTFtN7ytMK1hwfXNn3+mha+QDX2ZD0pkjf+OTKXp7O3ov3bkqdrM47IG7WTl4+dlzIacJ1p7iEs1B7TQmH861sFBOEMqazK0oYllFinF/1QN8Ku/UE53E11pSq0LzGyK6xgXFVFXu1HP4U8vnu3LyuJwmo7vGaw3snAYBxOFPQ/TT0x0Jw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2f5Kw7VK; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3gaijaaykdjcj51ea37ff7c5.3fdc9elogg3-45mc9jkj.fqc12j.fi7@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2f5Kw7VK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3gaijaaykdjcj51ea37ff7c5.3fdc9elogg3-45mc9jkj.fqc12j.fi7@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bs2k20yWtz3bgX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 03:42:50 +1000 (AEST)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-31332dc2b59so5766860a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jul 2025 10:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753810968; x=1754415768; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=0cDIK6qF6nWwCr2NoTbZWaYG+2Frltnz2b6AbcPAKOQ=;
        b=2f5Kw7VKo/22uJFV03dA/SvuuCJbRUZZHDQ8zKOxQ6Hq5tsLktZPTTxm9kmrqqYRrA
         DfBFgfeYkc3MSLbeQ66N1UWYqvxbqo4ZHlgfbptwu7Zz+5fb1jjgw9ePn/exMKPVZM/l
         qJwAsbIxTVRlBrCO4EwnrhtFg2o5Q1rSNcOvVXUWR1dpjwGjAd5bP398uGiDeKh008yd
         I7aaFYaSCx4QODiKMUxrIV9IkJ8y/yVdXb5k2mpKVHrZgFxVvpE4BtYVHfwd/Glba3Z7
         Zi9E4ozzqaNtv8w1VeD50bwUFSm8/bXM/UvxmRASabgWqrxm7nH/1SWrBSFQ/aOeZaJG
         PxJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753810968; x=1754415768;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0cDIK6qF6nWwCr2NoTbZWaYG+2Frltnz2b6AbcPAKOQ=;
        b=Uqr0xgZWScSHX8KB5BgE8G8vSEQunQivWMX+hnMKrgcPBLd9LNJp6L4DrTDsP6dsJn
         /PaVoTctg55UBsz3AK+WD0AiE/aODuK7+fnXA39S9gZuH63+p70FCFuYDwwO515vV3d/
         /QxlJLjfc+H/JNa1MfM+LOakP6DNs4pWWF0cYDkQ4z17zTh0WKT6N71geUEj1SQwNKh3
         sQJT9V8iIbil0qLKXk9jQwsDxOMWWTGnJfrVuho8ITW9LrUtGuibnzMy4qV+X/iBsOVp
         6Dloub50K1hHZkrMxLD9hEq1lx7eZeozNv2fDYL9kJtl0ScIBNUzLd/sL2aEoBIZq4Tq
         Q51Q==
X-Gm-Message-State: AOJu0YzZP+CCMvSBFWsQ9K/SvnAYegzghRIDlzuOZgJbu1DwQ5Nyd2wu
	cA2W4paFmTG8Pg0YTaPVXCeprMm1QnoZAduckHQzlXWkknM/nvL0MXY5URbyJBHK8abPDgh8+hG
	4+jbmOg==
X-Google-Smtp-Source: AGHT+IEy2tKRxEDM0MA44Vkr5JiteWyEFEnQvVSVGFQxO5N3upFR7JMnSmnNBB5kB8Ubw1uZp7pGKyP+A6w=
X-Received: from pjsc24.prod.google.com ([2002:a17:90a:bf18:b0:31f:3029:884a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:47:b0:31f:42cd:690d
 with SMTP id 98e67ed59e1d1-31f5dd9e0d8mr540145a91.13.1753810968559; Tue, 29
 Jul 2025 10:42:48 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 29 Jul 2025 10:42:36 -0700
In-Reply-To: <20250729174238.593070-1-seanjc@google.com>
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
References: <20250729174238.593070-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.1.552.g942d659e1b-goog
Message-ID: <20250729174238.593070-5-seanjc@google.com>
Subject: [PATCH 4/6] KVM: x86: Drop pointless exports of kvm_arch_xxx() hooks
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Andy Lutomirski <luto@kernel.org>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "Kirill A. Shutemov" <kas@kernel.org>, 
	Tony Krowiak <akrowiak@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Jason Herne <jjherne@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>, 
	Holger Dengler <dengler@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-sgx@vger.kernel.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-s390@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Drop the exporting of several kvm_arch_xxx() hooks that are only called
from arch-neutral code, i.e. that are only called from kvm.ko.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index a1c49bc681c4..14c0e03b48ae 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13492,14 +13492,12 @@ void kvm_arch_register_noncoherent_dma(struct kvm *kvm)
 	if (atomic_inc_return(&kvm->arch.noncoherent_dma_count) == 1)
 		kvm_noncoherent_dma_assignment_start_or_stop(kvm);
 }
-EXPORT_SYMBOL_GPL(kvm_arch_register_noncoherent_dma);
 
 void kvm_arch_unregister_noncoherent_dma(struct kvm *kvm)
 {
 	if (!atomic_dec_return(&kvm->arch.noncoherent_dma_count))
 		kvm_noncoherent_dma_assignment_start_or_stop(kvm);
 }
-EXPORT_SYMBOL_GPL(kvm_arch_unregister_noncoherent_dma);
 
 bool kvm_arch_has_noncoherent_dma(struct kvm *kvm)
 {
@@ -13516,7 +13514,6 @@ bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
 {
 	return (vcpu->arch.msr_kvm_poll_control & 1) == 0;
 }
-EXPORT_SYMBOL_GPL(kvm_arch_no_poll);
 
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_PREPARE
 int kvm_arch_gmem_prepare(struct kvm *kvm, gfn_t gfn, kvm_pfn_t pfn, int max_order)
-- 
2.50.1.552.g942d659e1b-goog


