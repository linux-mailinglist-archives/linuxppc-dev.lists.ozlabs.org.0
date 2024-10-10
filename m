Return-Path: <linuxppc-dev+bounces-2000-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9C3998FF8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:26:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdTy5Yfgz3bsZ;
	Fri, 11 Oct 2024 05:25:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584726;
	cv=none; b=jsjfXEUJoUa0j+dK8Ddwb2FkxTvFSCgPgVcYr8N+knC8DmAtqYvhZRLqTFJsDL/APOZ+Dr9bDkJ4Ic7NfLCZXIWN2aH6dVrjlxte9BC0rDPM5aD8jJrHTrlaQcVdlXPL/Jf23RqXN+VMyGcHL8Pki+4abH2qjzdt3VjgH1oju4fTxOjPcc2aXfQ4wlV+uVNHby2r+Ar4WBSUQM2mGDQ2/MK9zWBsH2IxORTDao1MuxkUrxafeOeo0TOVS09h6CF4PBQ/lBLsn4SqtuCIzJkHOletXhx7rHk4f6H6i1nhbrQZtYIw1Y6yo7UW8VjIH61PRObZreJHJcZp28o7tL+m1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584726; c=relaxed/relaxed;
	bh=86tNdlyX8HXR/WHFYCj/131p34DPDBwWgQrhOuSjETM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Mpi6lCqW5PFlqiiaE7VE4781qBrPdzeUGDaclAna7SNmbhrxMwJBfIqPRSGInqEyJ53vaV20N6bdZZ+0IpnZAb69GqzKzVtKGRsh3OH0sJb1yIm1Zwl8v/YKGapJtkrIiNLQ3fxX0l8VOPMbZez25Ghw9Iq7oiMqMxlNkDKmgJP+PnrjiyDMy4RRF5Exr8H1E6yJVfZstuQWo6Fqw1WNf5bEtPfwE2YpGcr7wJJchHyjsUAKQunIBv3k7VYpyepcf+WU9WmVp2TXPrUx2uOkekV5O9LimYq+zP/cEbmZ6eVRELWfqXS0ZE7D4Sc01r9xT0P6sV3H8RRfLOeQ/QfuRA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PAIyZ1xe; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3exwizwykdkocokxtmqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=PAIyZ1xe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3exwizwykdkocokxtmqyyqvo.mywvsxehzzm-nofvscdc.yjvklc.ybq@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdTx5RSfz3brt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:25 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e32e920cf6so23628607b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584724; x=1729189524; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=86tNdlyX8HXR/WHFYCj/131p34DPDBwWgQrhOuSjETM=;
        b=PAIyZ1xeSnHLHGWOQoGPMQfKe6X5NbLcgpAx7Lhc7VNztBxd3tm+ER5QAitaOseB0+
         m44FCYeMah7YkyyuFUSTN/+q3gfXGaaj93q85r0owgdrPCdMjDMyi2aG+f4T4svdTRCh
         TRfvqldKFkIuoWp06gx8ewv7s1uhhEbjqgxeSR7ZIVOm6UaaAppyR8SIpNu0ZMmoCD3n
         p6ys5v/5syDCofeMV8QMqReeYmyFpjZZK/Yd6fvEY1ijSAdZBizQ4lE7mUMmmn+ETLCs
         s+nYDVjuebgPh+tNIHNO7eqcWKhx1mRHqM7LVDXK/gUhdKgUmFik1DWCIPizawARv6V4
         LqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584724; x=1729189524;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86tNdlyX8HXR/WHFYCj/131p34DPDBwWgQrhOuSjETM=;
        b=lPQNfmGXxKid7XnOow5mq+Fjo6905bBy0dbNEGhXiJgORC0NyA4FuU1hgkKDxXSRqc
         m5iTuFNnywshGQ1XyoIOTyTK/TNUcOwt7C8NZKKAz+0rK+RBJu/EYD61yOIUlg6K51eK
         m2WJdbwpJl4dHiyH8erIHaVxhi9xFB/SaetO1l6F9Sy5iujae4Ef4fg9TZ0/gU83Qa1b
         JaoxG/YrgusE0nnucQDglMNyiLvj43a3ofs2Bdknb0U5H1DrXObs2suNmBxuSP//Ir/a
         lO7oNF+ibO+wC8PCJ9fEX33X8i5YHKYkinJxcVGajFc//rUrS13bNBMtHvT2G+GkTdn6
         5ajw==
X-Forwarded-Encrypted: i=1; AJvYcCXYeTFJGPUW2qCiF5WqlH3a0oT/9dD1egZ91vWefcakXgcG1rSK3Znwu6CKgEDIfDWCCPuEf/apxCFheGI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyptVFpYn0M//m8AmDbSew+w2dZ6le5wKqvk4R6F/exXDwRZ2Ld
	E/CGVpeK53YKcGxZ99P/vZpzfjtR/lsi5L6Ixj2FKf2X2hm1V/TT/ogo5oJ4w8IMcdzfAg32aJA
	lAw==
X-Google-Smtp-Source: AGHT+IGf82b/hxj2IWFe54/TAnEDS4XyhakmYGUWxryxrCLTzb83+cUU5J1DZhSXbLBNZQvipdjBbhmVkR8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:8e09:0:b0:e28:ef25:5f13 with SMTP id
 3f1490d57ef6-e28fe0e7352mr200743276.0.1728584723790; Thu, 10 Oct 2024
 11:25:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:17 -0700
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
Message-ID: <20241010182427.1434605-16-seanjc@google.com>
Subject: [PATCH v13 15/85] KVM: Drop extra GUP (via check_user_page_hwpoison())
 to detect poisoned page
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

Remove check_user_page_hwpoison() as it's effectively dead code.  Prior to
commit 234b239bea39 ("kvm: Faults which trigger IO release the mmap_sem"),
hva_to_pfn_slow() wasn't actually a slow path in all cases, i.e. would do
get_user_pages_fast() without ever doing slow GUP with FOLL_HWPOISON.

Now that hva_to_pfn_slow() is a straight shot to get_user_pages_unlocked(),
and unconditionally passes FOLL_HWPOISON, it is impossible for hva_to_pfn()
to get an -errno that needs to be morphed to -EHWPOISON.

There are essentially four cases in KVM:

  - npages == 0, then FOLL_NOWAIT, a.k.a. @async, must be true, and thus
    check_user_page_hwpoison() will not be called
  - npages == 1 || npages == -EHWPOISON, all good
  - npages == -EINTR || npages == -EAGAIN, bail early, all good
  - everything else, including -EFAULT, can go down the vma_lookup() path,
    as npages < 0 means KVM went through hva_to_pfn_slow() which passes
    FOLL_HWPOISON

Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index ebba5d22db2d..87f81e74cbc0 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2746,14 +2746,6 @@ unsigned long kvm_vcpu_gfn_to_hva_prot(struct kvm_vcpu *vcpu, gfn_t gfn, bool *w
 	return gfn_to_hva_memslot_prot(slot, gfn, writable);
 }
 
-static inline int check_user_page_hwpoison(unsigned long addr)
-{
-	int rc, flags = FOLL_HWPOISON | FOLL_WRITE;
-
-	rc = get_user_pages(addr, 1, flags, NULL);
-	return rc == -EHWPOISON;
-}
-
 /*
  * The fast path to get the writable pfn which will be stored in @pfn,
  * true indicates success, otherwise false is returned.
@@ -2948,14 +2940,10 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 		return pfn;
 	if (npages == -EINTR || npages == -EAGAIN)
 		return KVM_PFN_ERR_SIGPENDING;
+	if (npages == -EHWPOISON)
+		return KVM_PFN_ERR_HWPOISON;
 
 	mmap_read_lock(current->mm);
-	if (npages == -EHWPOISON ||
-	      (!async && check_user_page_hwpoison(addr))) {
-		pfn = KVM_PFN_ERR_HWPOISON;
-		goto exit;
-	}
-
 retry:
 	vma = vma_lookup(current->mm, addr);
 
@@ -2972,7 +2960,6 @@ kvm_pfn_t hva_to_pfn(unsigned long addr, bool interruptible, bool *async,
 			*async = true;
 		pfn = KVM_PFN_ERR_FAULT;
 	}
-exit:
 	mmap_read_unlock(current->mm);
 	return pfn;
 }
-- 
2.47.0.rc1.288.g06298d1525-goog


