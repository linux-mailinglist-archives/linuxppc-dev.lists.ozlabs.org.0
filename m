Return-Path: <linuxppc-dev+bounces-2034-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 477AA999044
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:30:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdWL6YZhz3cKV;
	Fri, 11 Oct 2024 05:26:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::549"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584798;
	cv=none; b=gT9mBN9jEem8wKRJxRAN5GFOdU7vEDfD/vdDPIbj4LbRZoDjQUPXG3EP28k0r0BlIFfxwr6WZJCQGvobq3rSKxYpvlvgmeUh46+IHzoQIHJ4yr6DHDJOKH+xVj21ke59AfT/fJcUocSVsryeD3SavC5PFG2XMUQBdvCTNE1/gSrl6JDmXOTffE5M+DNoB4K4XnrGyNRwq58TxIbxsk/outZYkuXzEQxvd9FszOoTuRxS3fH38a4KgggJx1oyyOSXe/lv9llgjUBP60Ai1CDYYq3FsOVjC2jL4XmEFdnGq9OG9GXvtSJkvbw+uLTs5ABQAQxlygcZbeelBLTbMAzKKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584798; c=relaxed/relaxed;
	bh=Ndpfmsd07O3XHkbROvy9SWySHpmtrF0LUOG5EHCQjAE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Pb0EIxewTMtIgW4NnfGsWpoEb6IVuen4fGAGWJNB+Ud189H2Ys+gjMGN75MXDKVQQCbDcLBgdYAstLEgL0MVwq2pmKE8kvHto8ocow/5Ho6aK0mdxkzECotLHz0WGuPOG/FcJ/bJEdPc0XMxC5o23I6LmOZf+EX8YM9KzX7vCybTxjYzj+tQ4LdW8Q3HmjB0xUXgXX++UkDajdbsxeK9dnq/KVgs14TXNEEPvrofdOrKHR3IIq06EA/HlASvVmn++Scy25z3kQn312Y0X1BjhFUONp2/+XsGPEvj36pOlvLOyFweERGWddJwYsnvq/7moNNKQsz7nlyTYcik8JsQZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZvQeADRD; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3xbwizwykdpmnzviexbjjbgz.xjhgdipskkx-yzqgdnon.jugvwn.jmb@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ZvQeADRD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3xbwizwykdpmnzviexbjjbgz.xjhgdipskkx-yzqgdnon.jugvwn.jmb@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdWL01z4z3cK8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:38 +1100 (AEDT)
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-7c6a9c1a9b8so928317a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584796; x=1729189596; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ndpfmsd07O3XHkbROvy9SWySHpmtrF0LUOG5EHCQjAE=;
        b=ZvQeADRD6oB7ic/M5h1MxtKuJPUrAJ1qub1hsTK4bGaaTWtWuY1zD4B2yFQY9OaaPj
         e8pRqoA3oZyYxt/qjCAP2fm379N4x5q/lNtiusqULTkgZQRgUSkfzGQ/Azy5WxPwohkj
         PT+gzuay65Kx2JV7GYGMYOfUTAAdoM89U9Q6PZXQEMyMghYfQTwmlBPiFoVSq2HOrOYY
         MxwqWMyyfCR3+aVAAyETS3vhDY3e56Rbyxe7cq7xsm4ug4vjsq+MwxeLyeFUT+mQe1Fh
         RNjwMgiVR2WnZg6Bve1K+usqcyIOkP53hSAs6JNrmtj4L2+3PFz5K00sef7U4WjILe4w
         vsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584796; x=1729189596;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ndpfmsd07O3XHkbROvy9SWySHpmtrF0LUOG5EHCQjAE=;
        b=dwYm0ClaK3vNGGeSmCJK7mxmZhB8D/ku/jjZjtl9eyLwX/Qx4fsAQUqY5WI7ORtyen
         k7X+xQ9/eILfk1AUgT7CKUo6HCLHxMIGW4BiHST1wS/CHbrwgQLYkCD54zECUubWLueX
         W4QBLkNE9JFPZS6h9ZIqRC2Qbd8nyvzfL0bHAyiRuCRVWZ3u3yNpUV2PpjcKZOgmEjII
         M9CuWAQRVK9t0tiuV0TkOgg4QMLcsnvvVALsF8mCJs1jGcIM1PlbA+ihx9ETxYgoSMgq
         j4exSG85NFbgR2OKQ25Zq2VC3l0O9hVmgwJR5G2rMuV+r+QuJdLV/d+kC+0DTCfKB4qn
         Vpxg==
X-Forwarded-Encrypted: i=1; AJvYcCX0sfqalAwfpp9gvGJoLTQJWrLVt4VdCddkmZYfh2sOgHxEBqzU4tXGpCmU1icE/o1boiqgynPCd/iABqI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzEM+vljBz4DDKkER9atuYFWVEDbKq8WYUGkKzfJYOMsY5a7pZw
	j26xkubFGGFs50PjhtdufCzG8GcdgH3KeraqbaTydUvS3TCIHP9vjJIKfpsUnw6yjnYZc5JHaon
	5eA==
X-Google-Smtp-Source: AGHT+IGJc8hgBZq6lOovV4Dgly5ctIXEs7jDnJfEupYxVqninaLorgqTg5WNW0BPJZYnJnHdEtp0yWaf7UM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a65:450a:0:b0:717:a912:c302 with SMTP id
 41be03b00d2f7-7ea53525e73mr49a12.1.1728584796119; Thu, 10 Oct 2024 11:26:36
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:51 -0700
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
Message-ID: <20241010182427.1434605-50-seanjc@google.com>
Subject: [PATCH v13 49/85] KVM: Move x86's API to release a faultin page to
 common KVM
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
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Move KVM x86's helper that "finishes" the faultin process to common KVM
so that the logic can be shared across all architectures.  Note, not all
architectures implement a fast page fault path, but the gist of the
comment applies to all architectures.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c   | 24 ++----------------------
 include/linux/kvm_host.h | 26 ++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 22 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index e14b84d2f55b..5acdaf3b1007 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4370,28 +4370,8 @@ static u8 kvm_max_private_mapping_level(struct kvm *=
kvm, kvm_pfn_t pfn,
 static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 				      struct kvm_page_fault *fault, int r)
 {
-	lockdep_assert_once(lockdep_is_held(&vcpu->kvm->mmu_lock) ||
-			    r =3D=3D RET_PF_RETRY);
-
-	if (!fault->refcounted_page)
-		return;
-
-	/*
-	 * If the page that KVM got from the *primary MMU* is writable, and KVM
-	 * installed or reused a SPTE, mark the page/folio dirty.  Note, this
-	 * may mark a folio dirty even if KVM created a read-only SPTE, e.g. if
-	 * the GFN is write-protected.  Folios can't be safely marked dirty
-	 * outside of mmu_lock as doing so could race with writeback on the
-	 * folio.  As a result, KVM can't mark folios dirty in the fast page
-	 * fault handler, and so KVM must (somewhat) speculatively mark the
-	 * folio dirty if KVM could locklessly make the SPTE writable.
-	 */
-	if (r =3D=3D RET_PF_RETRY)
-		kvm_release_page_unused(fault->refcounted_page);
-	else if (!fault->map_writable)
-		kvm_release_page_clean(fault->refcounted_page);
-	else
-		kvm_release_page_dirty(fault->refcounted_page);
+	kvm_release_faultin_page(vcpu->kvm, fault->refcounted_page,
+				 r =3D=3D RET_PF_RETRY, fault->map_writable);
 }
=20
 static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 504483d35197..9f7682ece4a1 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1231,6 +1231,32 @@ static inline void kvm_release_page_unused(struct pa=
ge *page)
 void kvm_release_page_clean(struct page *page);
 void kvm_release_page_dirty(struct page *page);
=20
+static inline void kvm_release_faultin_page(struct kvm *kvm, struct page *=
page,
+					    bool unused, bool dirty)
+{
+	lockdep_assert_once(lockdep_is_held(&kvm->mmu_lock) || unused);
+
+	if (!page)
+		return;
+
+	/*
+	 * If the page that KVM got from the *primary MMU* is writable, and KVM
+	 * installed or reused a SPTE, mark the page/folio dirty.  Note, this
+	 * may mark a folio dirty even if KVM created a read-only SPTE, e.g. if
+	 * the GFN is write-protected.  Folios can't be safely marked dirty
+	 * outside of mmu_lock as doing so could race with writeback on the
+	 * folio.  As a result, KVM can't mark folios dirty in the fast page
+	 * fault handler, and so KVM must (somewhat) speculatively mark the
+	 * folio dirty if KVM could locklessly make the SPTE writable.
+	 */
+	if (unused)
+		kvm_release_page_unused(page);
+	else if (dirty)
+		kvm_release_page_dirty(page);
+	else
+		kvm_release_page_clean(page);
+}
+
 kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
 			    unsigned int foll, bool *writable,
 			    struct page **refcounted_page);
--=20
2.47.0.rc1.288.g06298d1525-goog


