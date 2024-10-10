Return-Path: <linuxppc-dev+bounces-2021-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F6F999029
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:29:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdVn2vt2z3cDd;
	Fri, 11 Oct 2024 05:26:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::44a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584769;
	cv=none; b=QZlEATnlmLZm+oc9/74G11BeCnNVl6Ca/Iwgl0QmkvTG2zb69Pfnmq7lybt1vtGni8zuKKDdWpiTcHOOA23Nkh7Um1a4g6UGScjexBwK8mmv31Z1zxZFfZkCYBksNrrsbX/ARRxROwgyjIhB3RfAg4MPqSBq+T4QYm0KEV724V4dnCBmMiNg7YQygRvlMxKhEknpYUJ/M/n/ldieJAeuvMasnnQsoFb2NkQRhf2z+juofcgwcba8DxlGyEl6rW+Ljbt3XyW8QsKwR0UsIYxDECQh0zOKC8zRFeAL2GHytRa6T/bOZhzytB6B4fLVbG9BOcuBQYlCS5LTBuzSgt7o/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584769; c=relaxed/relaxed;
	bh=n3l8C52m2RjpLTXcY6dq+UIBo01A1fTC4GBMzDz1kHI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BViqmeNe3VI4LCcHK5UX7aT3gRz8BAVjLv2hUowDYAQCXtcEO8nbElI0nNJ7ulzFw/v1PsN9VJEwsH65ARhsGfFiIN2WkooZGGgU46z9TdX8uvsEJ+w6sGb2K5Ga2mMnKEj6xNlRHdwibwBqezz/KRN+jzolunKycS3WiiL3z4hzA764CfPlwRdYckHsubjsupwuTfiDz37VJjWftdWCwXsBXXSWXRLRYNeaeqpmzZhNpy88T/W2p5Ymntz8tJhNkV0Z/sEAF2BUJFhdUM9OCYyZjN6F63qDryA2JwUckOH+adVHcen+Eswdk/6560fTdiykFI2lzlE4eimHsja/yQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4XG//h0T; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3phwizwykdnuj51ea37ff7c5.3fdc9elogg3-45mc9jkj.fqc12j.fi7@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=4XG//h0T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3phwizwykdnuj51ea37ff7c5.3fdc9elogg3-45mc9jkj.fqc12j.fi7@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdVm4t4Lz3bkL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:08 +1100 (AEDT)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-71e04c42fecso1289997b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584767; x=1729189567; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=n3l8C52m2RjpLTXcY6dq+UIBo01A1fTC4GBMzDz1kHI=;
        b=4XG//h0TLyH9k39SFj6VkWVAAUspAzBISJCELPTLCkJQfFugbr3KPO98uudkQCeEcv
         0DLIqtR7yMlLYYZqja1Nh6o0qZbSSIVInD6MBOppQ9A3shxOcWxly/drjxRjB6LW09vU
         kKe19E8xN/6W/5fkd+QO9iq2SFNvjWO150y5mvF7xPvl29tg4atr/ygApEs4NTQqKind
         Rxi9+9nCATJ+IaSZFgzorzTOKccVYNuMtMhsDDKUrSy5eH5O3y/xSW5cQQeDyecZsj40
         yEq+EVmzJzb06C3XBTdkiDl/lkAgG+jePY54fepsuzv85OkfFIgEfe3NNdhzYsTh0bg+
         KUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584767; x=1729189567;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3l8C52m2RjpLTXcY6dq+UIBo01A1fTC4GBMzDz1kHI=;
        b=xEUWwFKPedM/R9Ee6Q2BjILGqoBqIUWGOWP6zdV/jXpzRb26Lgsuy4IQRV7mSrl/tm
         f7aoHqPiYvwF31nj9TWNuutL1wR+90Mpsu+sufXL+qivEccIE6uE5FBb0ZDyPJDNJj24
         kC1kF76NBrUOL0gaEsDZY0xudXjYnrrWcxfidEF7MvkkKcdNujEQ4u1K5thZQuFwpdT0
         dLjIzOipl3R9zq95SEv3GOKaUuAItVvqW2Op5hc2cDshwRU/ICldpxJbKoo8XtN999YS
         ssWPqRG67OrDxzHR0T5DCHdXoyvzkehPeCS9qZfX5q7jOEVMKEBsaKro98M6dRp4I5Ua
         lbYA==
X-Forwarded-Encrypted: i=1; AJvYcCVmffqQgYNv73CovhYSmUEhTlANyoG1tXfSsqr3ynHOZdeoiSHEdesP4lvpbH72E0LHgrsHSyaJrnwltps=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyyb/M6Y/26c+bL5D0C5t92kpFpB8ELKQMFD3L7zgVL1c2rE0iD
	9fFxtdNx4Ky/6aAwvp88XixGXuncUzuFrs14VtEnuTlYzE9RT/d7VOjHcYlFDQPoOODjJAx64LW
	ohw==
X-Google-Smtp-Source: AGHT+IH5y4h19aQ8D3UFZNHEjFs0l+IkJ/F+GwDOdY5CLNZ6WKY+eP+zfpO4DiXt2PfVXCIgSRJOtCb+AeE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:6f44:b0:71e:268b:845e with SMTP id
 d2e1a72fcca58-71e26e53c16mr11733b3a.1.1728584766802; Thu, 10 Oct 2024
 11:26:06 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:38 -0700
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
Message-ID: <20241010182427.1434605-37-seanjc@google.com>
Subject: [PATCH v13 36/85] KVM: x86: Don't fault-in APIC access page during
 initial allocation
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

Drop the gfn_to_page() lookup when installing KVM's internal memslot for
the APIC access page, as KVM doesn't need to immediately fault-in the page
now that the page isn't pinned.  In the extremely unlikely event the
kernel can't allocate a 4KiB page, KVM can just as easily return -EFAULT
on the future page fault.

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/lapic.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 20526e4d6c62..65412640cfc7 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -2647,7 +2647,6 @@ void kvm_apic_update_apicv(struct kvm_vcpu *vcpu)
 
 int kvm_alloc_apic_access_page(struct kvm *kvm)
 {
-	struct page *page;
 	void __user *hva;
 	int ret = 0;
 
@@ -2663,17 +2662,6 @@ int kvm_alloc_apic_access_page(struct kvm *kvm)
 		goto out;
 	}
 
-	page = gfn_to_page(kvm, APIC_DEFAULT_PHYS_BASE >> PAGE_SHIFT);
-	if (!page) {
-		ret = -EFAULT;
-		goto out;
-	}
-
-	/*
-	 * Do not pin the page in memory, so that memory hot-unplug
-	 * is able to migrate it.
-	 */
-	put_page(page);
 	kvm->arch.apic_access_memslot_enabled = true;
 out:
 	mutex_unlock(&kvm->slots_lock);
-- 
2.47.0.rc1.288.g06298d1525-goog


