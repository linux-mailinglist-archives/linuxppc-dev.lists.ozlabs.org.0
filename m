Return-Path: <linuxppc-dev+bounces-13583-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E74C22245
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 21:11:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyFbM3T08z3dX2;
	Fri, 31 Oct 2025 07:10:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1049"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761855023;
	cv=none; b=hwe0gi9T9EskPZ/Li86LhMTi+X9HuumqLvyrarVMxnORlOW5mhyZSlqo3RSEVUFz/OGcNmYBQqWAgoEdMSjGsTozoCsLyhXnvtvZR/Dm/vEQCvtPW2i8q3h5xN4zuPKhdMwIUvxDO2suQXYlpAmBnpVqFHAOgmJFVYe+ctbyhqVom+F9ZVlY+Ryz9x4upRNSayxtSxrqrqtOFm6Cm7viXQHmFdludQ8k3EiWX9SlITxCRXdsLP8Ed6LzlKwE+acmZkWpUZnz/01s7Mlu9n4Mh2ttFAnzz3uUC04UCRvACdJ43edMu9LkbyIhDPlEUzCFwCELICcrIc4GqrakBRqFGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761855023; c=relaxed/relaxed;
	bh=l9YJv18Ob5fRSYpWoHOBPRjxzgmHk89rOMKnw0Dkb6I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I4WEDInpSlZUmZqHJY1w67H/X+S6GPLop9xaICtEU8B06P7I/XmIT0N4ahImtX39wzMvGpvszqk7bUHO8Gyj2cZm4C+Nauwlzk6rRzrvNoAuqFnz4al6fgNnAbDSO1s4vLpoUVDNeK4F6cPQ3kiJJSNhrZ5nWY0/036m/oCi1E+k3EkatVkPj1hgPfyBUMbHWAQH3b9UyQqaRZuGZG0+CVW7p1CSCm9caJ3DiivaiNALUfKjH/gQX3ULtnldU95GqYCaZT8vjkQrZRqq9JDVEnKSxjh369MFduysTVChx21euv4Oz/yzGOHHAwaBc+a+niW7qSOMKExo+ZqtJ4tfKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JkyZnOKY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3lcydaqykdbgg2yb704cc492.0ca96bildd0-12j96ghg.cn9yzg.cf4@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=JkyZnOKY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3lcydaqykdbgg2yb704cc492.0ca96bildd0-12j96ghg.cn9yzg.cf4@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cyFbL52Bmz3dWQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 07:10:22 +1100 (AEDT)
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-32eb18b5659so1098873a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 13:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855021; x=1762459821; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=l9YJv18Ob5fRSYpWoHOBPRjxzgmHk89rOMKnw0Dkb6I=;
        b=JkyZnOKYNW6aHM35ACy7DwH8Lg9TXpwtsUlB7kPsO4GT1J7hZp7jZcfuIn0gMWwWIn
         GG4zCJccMhYc+sqnUAI+R+NfQtOo++ohZBaS0BGOtm/Sau5DTEbtz+mlP7fGNu3QtAo6
         FQLqHFEP8IwHsktZwDyMJLZzsq06QG2TLoYn83sfcqUrYfnsVCRzoU/rIomUQeunyu23
         OLyCLYjbgjg1IwClRJu7z8TVysFsuHm04HTbQf8uzJ1t8330HPBfF0iUZw/nSsPF9670
         aq14LhjedRVdfufKW2zlIb/dIahmReDJpeeFy2Y6j24kWIZSkgdsMwPY+Euga9KkKwPJ
         QsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855021; x=1762459821;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l9YJv18Ob5fRSYpWoHOBPRjxzgmHk89rOMKnw0Dkb6I=;
        b=X8TdsWfD9ADr3fmg9GALh/7LemtW/Y3oteoT6XUI8aidgeXinqnmPMJtGNR431GsDK
         bdCk9ODycJ6MtfSa/QxdZH8wfw+4CdczfQsp8nRkWkuVdp0IK81z/XGoDht70JfRy6W+
         daSVXrdCYi8wZIRo95217lyUmWTE+lyQ2+4113KyYncc18OeoWG7Fvf9Kc29carjOw91
         1YpQvF6uI/LugPpiheS+cPNo6J3K/pgM7EgYTZ66GB5XsS6mQ35cyw03AHhvBgzXsobQ
         vukjReKl4L/WXf9d5I9cvapjH3FpCvi691RGGDfE3NAxQBhzEgHe/Lyy1utlwGR5rpN9
         i7+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVatBVMWg1oAwJvrGBXxHwUZY5BbJM2Cx4DBipPYCDzpybQydJb/ARh3ab7fM6arS9xxLgAISc/ITvT6aw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz1GxogJg9Jzb2Dy/IeOTnFAdJuPbLDDsswOrKu0itpZitsUp/a
	e2rFVtTNKu0knOavquJE2ags4M6d4IYv57kImWOqIJwkfjqkPSu3F9rPtNseGlC0tg31Lojqxxb
	BsqDV0A==
X-Google-Smtp-Source: AGHT+IG+gFwz9Ni5D6YjNM4YmwfrZ1OxqSQdFqNs3bWhzX+cRsNM16o/ggLOmTawQXyQElnAsV5VYAZIDy0=
X-Received: from pjvp23.prod.google.com ([2002:a17:90a:df97:b0:339:e59f:e26])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4e83:b0:33b:c5de:6a4e
 with SMTP id 98e67ed59e1d1-34082fa592cmr1221665a91.5.1761855021014; Thu, 30
 Oct 2025 13:10:21 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 30 Oct 2025 13:09:32 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
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
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-10-seanjc@google.com>
Subject: [PATCH v4 09/28] KVM: TDX: Return -EIO, not -EINVAL, on a
 KVM_BUG_ON() condition
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
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Return -EIO when a KVM_BUG_ON() is tripped, as KVM's ABI is to return -EIO
when a VM has been killed due to a KVM bug, not -EINVAL.  Note, many (all?)
of the affected paths never propagate the error code to userspace, i.e.
this is about internal consistency more than anything else.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Ira Weiny <ira.weiny@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index c3bae6b96dc4..c242d73b6a7b 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1621,7 +1621,7 @@ static int tdx_mem_page_record_premap_cnt(struct kvm *kvm, gfn_t gfn,
 	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
 
 	if (KVM_BUG_ON(kvm->arch.pre_fault_allowed, kvm))
-		return -EINVAL;
+		return -EIO;
 
 	/* nr_premapped will be decreased when tdh_mem_page_add() is called. */
 	atomic64_inc(&kvm_tdx->nr_premapped);
@@ -1635,7 +1635,7 @@ static int tdx_sept_set_private_spte(struct kvm *kvm, gfn_t gfn,
 
 	/* TODO: handle large pages. */
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
-		return -EINVAL;
+		return -EIO;
 
 	/*
 	 * Read 'pre_fault_allowed' before 'kvm_tdx->state'; see matching
@@ -1658,10 +1658,10 @@ static int tdx_sept_drop_private_spte(struct kvm *kvm, gfn_t gfn,
 
 	/* TODO: handle large pages. */
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
-		return -EINVAL;
+		return -EIO;
 
 	if (KVM_BUG_ON(!is_hkid_assigned(kvm_tdx), kvm))
-		return -EINVAL;
+		return -EIO;
 
 	/*
 	 * When zapping private page, write lock is held. So no race condition
@@ -1846,7 +1846,7 @@ static int tdx_sept_free_private_spt(struct kvm *kvm, gfn_t gfn,
 	 * and slot move/deletion.
 	 */
 	if (KVM_BUG_ON(is_hkid_assigned(kvm_tdx), kvm))
-		return -EINVAL;
+		return -EIO;
 
 	/*
 	 * The HKID assigned to this TD was already freed and cache was
@@ -1867,7 +1867,7 @@ static int tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	 * there can't be anything populated in the private EPT.
 	 */
 	if (KVM_BUG_ON(!is_hkid_assigned(to_kvm_tdx(kvm)), kvm))
-		return -EINVAL;
+		return -EIO;
 
 	ret = tdx_sept_zap_private_spte(kvm, gfn, level, page);
 	if (ret <= 0)
-- 
2.51.1.930.gacf6e81ea2-goog


