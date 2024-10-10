Return-Path: <linuxppc-dev+bounces-2046-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7492B99905C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:31:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdWr3RXDz3bl1;
	Fri, 11 Oct 2024 05:27:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584824;
	cv=none; b=n0W90aAeAh292b9LeD19s063k2hedq1/3WxNaXozV8m4pNYFm+QDN83mTDZ+6N3mRK6dLNMDgy2uEXllKD3Uay7CEiTvztt/rXgKTBrYXDIEdb+lOQQWwYslkIPx+B9B0aibMQZsou9tizmFRcp/qwR+nOTvSjVChm++sXXUBTjaSrVsmTXQ94sn0mgh2E04Kd2j7Ro3YAiXvlUoUPsRM93WJrFUR7jmo+RS3Yc697sowQm0t3NDJ9C281VOloresdhj2uUrJeZwoDSywuC80i7B7gja8XZ/8kwCdbQEuosoXf/NDiHWDGTb/TOrcQr1ZHiGXU6eLVbngVCQCmaO9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584824; c=relaxed/relaxed;
	bh=YGpJ+GsXH4oG8p6vIrNjfshF8svSSAFECmaA34wp4no=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZFmfGALU+7IfHVfvRU67l/55d+6Xbt+P7+V/FyikUmxlU6DA4M5SaVMkYFALvehCzyEF7xPCsII25lBJCnXk1Q3fkxlmjNflFbZ502jQSipKEYel1G21NTMJYf2ddgnXsZY+DlqhWDEA7ZFrZjN8S16LlzJoO2F6OMqM2IG2sn87P7gsRHmICuK4kbH9Gh2tGGxgJPYdszwOah+KYJSHyQLXrOb+kbbKASrAPq4cCzdVrqpHuwzR3b9aoYWJGuCogOXg7F7stzPt4La4DsTCFAGmsYxnG00gOBPeyF6YhvMaHQ/jeuZeGi+WYrKsqKBiM3IVRynNwMOc3vLoWEVSKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=IV6381gI; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3drwizwykda46so1xqu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=IV6381gI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3drwizwykda46so1xqu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdWq50Bsz3cPW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:03 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e29135d1d0cso861819276.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584822; x=1729189622; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=YGpJ+GsXH4oG8p6vIrNjfshF8svSSAFECmaA34wp4no=;
        b=IV6381gIbgZVKgqzkAwR/3ceUhfhFG+Ti6tfDlagjuF1kiVTq4/jju87hN7HLH/Epk
         XLub61foFfV3hkfoncRE+U7k59k2lsUuBC8XgwxZlcE0M/jrV5Yan91+6oi7FRtq0DJ6
         ZMrFOQFkH5nakbT5bR6w7pGYGhOJrsTsT9nxRFsGQQZqsU90BpaQoPDJFIH8hKwh5B5N
         0kmn23a/r6sjv02+8LDM4iZ1IZuAJd297sjTPugZyttLxG/3HyPdrWC0+aHeWsd58N3X
         m+gP2P4JOdyG+yJHHB8Hu/pZwCRMXAUvCprLJ+rDj46+9A4aUUnHTdWIUegpG8EdOA22
         Vzqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584822; x=1729189622;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YGpJ+GsXH4oG8p6vIrNjfshF8svSSAFECmaA34wp4no=;
        b=r6NNVm41wWKl+4/+2ABpSeXC8fgdVFMvIMzHQgI0RRuk2d42nISxlG79GkWqet7GBc
         AU6y1R3x4+gS2VhJW4sIsUk0gotazV6zElNWa+Ql2drXCdjlHqzA02Z4FjGA9342A2Kp
         KYLK3cAEZpwHtAgz5jdQQx1jgGDO9H8sb9gleAjB6IbGOI9/x6EDsDf78h6NB7DLQjWK
         tKgKy7w/Y6lKMC4qpvRfh2Jb2nDf7dRkncqRujSiBQycdT0Sqi+pn6RIUKkGjSV0Kvlg
         fBtws+c5c/bi7iCSGkvQpb2IjdFkS5uwUx0dGrMJaX8GzN4Kce3TaX8hgW5dj80bXSKN
         tCAA==
X-Forwarded-Encrypted: i=1; AJvYcCXK+Kn6RJYPzjORQNtD+dPsERyyAzWkydbEmlHhY2vx6SZvx65pb53/vER+5w58a9BwHd5z8WlKSlfcGyE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzMXJuFJCv21W+aw/YdKpVyI1dI4kbEPxiOVcz34aGMth2W0l5C
	3cua/st0TxoemmVFQtCyHwp6Iz59q2eV1nwIBiquw9xHnle3JbJn1g42TNzQQJTkqT1hhGQj9W6
	mQw==
X-Google-Smtp-Source: AGHT+IFyzgxXPfejJoY0SZCQ3T+Vo8hzb1HJlB5l94FFDfZID39IeT9MHN/ZgR4beqIvxQ/gO8qC3c4Qafk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6902:4ac:b0:e28:fdfc:b788 with SMTP id
 3f1490d57ef6-e28fe4426b8mr4979276.9.1728584821558; Thu, 10 Oct 2024 11:27:01
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:03 -0700
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
Message-ID: <20241010182427.1434605-62-seanjc@google.com>
Subject: [PATCH v13 61/85] KVM: PPC: Use __kvm_faultin_pfn() to handle page
 faults on Book3s Radix
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

Replace Book3s Radix's homebrewed (read: copy+pasted) fault-in logic with
__kvm_faultin_pfn(), which functionally does pretty much the exact same
thing.

Note, when the code was written, KVM indeed didn't do fast GUP without
"!atomic && !async", but that has long since changed (KVM tries fast GUP
for all writable mappings).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c | 29 +++++---------------------
 1 file changed, 5 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 8304b6f8fe45..14891d0a3b73 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -829,40 +829,21 @@ int kvmppc_book3s_instantiate_page(struct kvm_vcpu *vcpu,
 	unsigned long mmu_seq;
 	unsigned long hva, gfn = gpa >> PAGE_SHIFT;
 	bool upgrade_write = false;
-	bool *upgrade_p = &upgrade_write;
 	pte_t pte, *ptep;
 	unsigned int shift, level;
 	int ret;
 	bool large_enable;
+	kvm_pfn_t pfn;
 
 	/* used to check for invalidations in progress */
 	mmu_seq = kvm->mmu_invalidate_seq;
 	smp_rmb();
 
-	/*
-	 * Do a fast check first, since __gfn_to_pfn_memslot doesn't
-	 * do it with !atomic && !async, which is how we call it.
-	 * We always ask for write permission since the common case
-	 * is that the page is writable.
-	 */
 	hva = gfn_to_hva_memslot(memslot, gfn);
-	if (!kvm_ro && get_user_page_fast_only(hva, FOLL_WRITE, &page)) {
-		upgrade_write = true;
-	} else {
-		unsigned long pfn;
-
-		/* Call KVM generic code to do the slow-path check */
-		pfn = __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
-					   writing, upgrade_p);
-		if (is_error_noslot_pfn(pfn))
-			return -EFAULT;
-		page = NULL;
-		if (pfn_valid(pfn)) {
-			page = pfn_to_page(pfn);
-			if (PageReserved(page))
-				page = NULL;
-		}
-	}
+	pfn = __kvm_faultin_pfn(memslot, gfn, writing ? FOLL_WRITE : 0,
+				&upgrade_write, &page);
+	if (is_error_noslot_pfn(pfn))
+		return -EFAULT;
 
 	/*
 	 * Read the PTE from the process' radix tree and use that
-- 
2.47.0.rc1.288.g06298d1525-goog


