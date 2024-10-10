Return-Path: <linuxppc-dev+bounces-2063-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0773999081
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:33:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdXX3B9Xz3cSv;
	Fri, 11 Oct 2024 05:27:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::54a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584860;
	cv=none; b=f3k9SNvvOipYU0cPeWMcfDUebLIUgHIDU20nOfsKtCiuGkey3TSzp62VhNmo4MNtfcLyJjmAizkIALgdjg2vpAVtAamkb0gQZ5yHflkUEkyRlgSqRgpbSrjT7IhYfH5bTOAqo64clOqW3fpkwQtJjUZjqosYedIcWmsZ71ccrK4Utcx/0ZQYwxzqIo8R39PWKoNfKSdFzYSbXoFjQvT1Cui3M8kA260q8cCs5SRhS1DWau+zWuhReOuYtBVrdJ3L+RYRV0xidN7UkGwTrt1bIxuHLk7VgtuMArx0poiyhIvrQuHA2pVJvJgQe7zEtybvli178E9aeiwuVkr38K6CeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584860; c=relaxed/relaxed;
	bh=43Dd+lWRPu/QQcFLGDLhCyyiH7uAqu5vbmltTcj5okg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kofcEFXWa7T3pJB+oXORlIQsr69ccYULbqJ2079WmJuVsyrALkqvjgXqFNPBEMezQyFwAInx8PxrNJOIeGoM4BJODpZkF6fpbjI+Uv5bPCaZCdj9JWc6ZD0HfzewvcCsxgAIQuK4y/GLmblVBW/z6MD5FKGeWu8+QzMZEcy9WT+DtlguYrUeHmeM7kky55SVVjENlyPmxkKcibiFNeeAjSVw8G7kLwLngoWvg26TD0OqaT4NrteEiBg9pc1VSRVjjU+c6hX1vHKnFT5b9wx8wkIEjsuaSZ6UnOrwOauCfuUzjPwxTQw9Mt5/FPzW2PzOP/Xv6WzN/7zT0UIhDdTZCA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Vop8Izqo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3mrwizwykddigsobxquccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Vop8Izqo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3mrwizwykddigsobxquccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdXW42bNz3blH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:39 +1100 (AEDT)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-778702b9f8fso1040808a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584858; x=1729189658; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=43Dd+lWRPu/QQcFLGDLhCyyiH7uAqu5vbmltTcj5okg=;
        b=Vop8Izqo/TvjlWY9Fwk4dIlbrHlGhpFeJN05lUr14fCBvH/Z3U6wV0i4iKRkJpMNqT
         kUBTx3KjgkyzayE3uezevhhNY2BFMm7wJ7G45UBZyDvTfVSECanUbWQlTJ8FFV99b5cU
         v8gJxwJPvm9Q4KqCl32kYxvr3ZZKdHtNEvLWimGt74MICTJRzDWQwuu1DUkNlbeaptIb
         JmlMdTTsSHwbNhMmrfEHwraMWLloWtrwVZrkLzNFJoki2v9rRhK4HW0K77JmJVRR2B8z
         j2lPKhKnIabqHqM+RFiF0efViCmS7sn+uqw65Yj/wzfTbEszXx6U0VajVrk35V6fCHeF
         B9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584858; x=1729189658;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=43Dd+lWRPu/QQcFLGDLhCyyiH7uAqu5vbmltTcj5okg=;
        b=lLdqRTHBSbcedtjfLxwBqj12+v3tJXBVIdwMGnC4eULRiNR/odoh7Z3DhBjvO+lx6f
         HIw/Wbf69kkyHKzDVTdCZHgVXdkjJ23bcDxVg52vFyKanwRJvGOYuLPbEQAG8+BBC8nl
         LYE299NG/DxNVHMIvSBh1pGuyTs6C4kQB0R+KkV9xI6mcrr6Y6gp6oVRV4Da6wpqEZaf
         2mBFVoXrhUSPhhCtup/7tVDMP4Xva4sa5TYIBIbFP3oMcosT51HWScVMnk7ubv7M/Qhc
         fRuOHGCy3UAJb0ZyDtX4NfJTjnUiPwStW91Jm5p9kOUFj+g89whWzl9579WC/3pzv3dp
         MMUw==
X-Forwarded-Encrypted: i=1; AJvYcCWtP92Q0AcDwxohTzArKNARkacjEX+bCOQtT/DdvAPANfxNSSj/Y/Pe9mdeieArFWgr+GdTsJGlsXIe8CA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyhkGIOEwDi715AlPW5hdU9E+4kQdxUjSiNb/VRQC9jNHsZeHmt
	gxTuG+2Hb8Vo9sSxmyVmJk2Lram1P1OzB2uW+MN3DyvJCabbLRA3xAC9Ksn3vIYmX/WiRDvpDfP
	E6Q==
X-Google-Smtp-Source: AGHT+IGjs5y0lK7jvR8/zbNWJNDHfDWRUWSPa98vwOnU2bZ6sNQJgoH/6j7HDiYxyC+lHu033MhghQMujcY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a63:b208:0:b0:7e6:c3f2:24c2 with SMTP id
 41be03b00d2f7-7ea535dce6cmr30a12.6.1728584857741; Thu, 10 Oct 2024 11:27:37
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:20 -0700
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
Message-ID: <20241010182427.1434605-79-seanjc@google.com>
Subject: [PATCH v13 78/85] KVM: PPC: Explicitly require struct page memory for
 Ultravisor sharing
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

Explicitly require "struct page" memory when sharing memory between
guest and host via an Ultravisor.  Given the number of pfn_to_page()
calls in the code, it's safe to assume that KVM already requires that the
pfn returned by gfn_to_pfn() is backed by struct page, i.e. this is
likely a bug fix, not a reduction in KVM capabilities.

Switching to gfn_to_page() will eventually allow removing gfn_to_pfn()
and kvm_pfn_to_refcounted_page().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 92f33115144b..3a6592a31a10 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -879,9 +879,8 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 {
 
 	int ret = H_PARAMETER;
-	struct page *uvmem_page;
+	struct page *page, *uvmem_page;
 	struct kvmppc_uvmem_page_pvt *pvt;
-	unsigned long pfn;
 	unsigned long gfn = gpa >> page_shift;
 	int srcu_idx;
 	unsigned long uvmem_pfn;
@@ -901,8 +900,8 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 
 retry:
 	mutex_unlock(&kvm->arch.uvmem_lock);
-	pfn = gfn_to_pfn(kvm, gfn);
-	if (is_error_noslot_pfn(pfn))
+	page = gfn_to_page(kvm, gfn);
+	if (!page)
 		goto out;
 
 	mutex_lock(&kvm->arch.uvmem_lock);
@@ -911,16 +910,16 @@ static unsigned long kvmppc_share_page(struct kvm *kvm, unsigned long gpa,
 		pvt = uvmem_page->zone_device_data;
 		pvt->skip_page_out = true;
 		pvt->remove_gfn = false; /* it continues to be a valid GFN */
-		kvm_release_pfn_clean(pfn);
+		kvm_release_page_unused(page);
 		goto retry;
 	}
 
-	if (!uv_page_in(kvm->arch.lpid, pfn << page_shift, gpa, 0,
+	if (!uv_page_in(kvm->arch.lpid, page_to_pfn(page) << page_shift, gpa, 0,
 				page_shift)) {
 		kvmppc_gfn_shared(gfn, kvm);
 		ret = H_SUCCESS;
 	}
-	kvm_release_pfn_clean(pfn);
+	kvm_release_page_clean(page);
 	mutex_unlock(&kvm->arch.uvmem_lock);
 out:
 	srcu_read_unlock(&kvm->srcu, srcu_idx);
@@ -1083,21 +1082,21 @@ kvmppc_h_svm_page_out(struct kvm *kvm, unsigned long gpa,
 
 int kvmppc_send_page_to_uv(struct kvm *kvm, unsigned long gfn)
 {
-	unsigned long pfn;
+	struct page *page;
 	int ret = U_SUCCESS;
 
-	pfn = gfn_to_pfn(kvm, gfn);
-	if (is_error_noslot_pfn(pfn))
+	page = gfn_to_page(kvm, gfn);
+	if (!page)
 		return -EFAULT;
 
 	mutex_lock(&kvm->arch.uvmem_lock);
 	if (kvmppc_gfn_is_uvmem_pfn(gfn, kvm, NULL))
 		goto out;
 
-	ret = uv_page_in(kvm->arch.lpid, pfn << PAGE_SHIFT, gfn << PAGE_SHIFT,
-			 0, PAGE_SHIFT);
+	ret = uv_page_in(kvm->arch.lpid, page_to_pfn(page) << PAGE_SHIFT,
+			 gfn << PAGE_SHIFT, 0, PAGE_SHIFT);
 out:
-	kvm_release_pfn_clean(pfn);
+	kvm_release_page_clean(page);
 	mutex_unlock(&kvm->arch.uvmem_lock);
 	return (ret == U_SUCCESS) ? RESUME_GUEST : -EFAULT;
 }
-- 
2.47.0.rc1.288.g06298d1525-goog


