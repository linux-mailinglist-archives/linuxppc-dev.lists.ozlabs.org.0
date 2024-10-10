Return-Path: <linuxppc-dev+bounces-2045-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA0499905B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:31:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdWp4G0Cz3cPl;
	Fri, 11 Oct 2024 05:27:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b4a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584822;
	cv=none; b=keHZ8OUSvPc2R7TK7wnyxblzHWMLvGF4oru5JeEK2Fe/PXXJhm7hhbeCATWa8IG7O0ylR9ko31YjpJKr9axABL8OvmIcniyWm99F4WNatjGaWtikmHgoDTx63e1zLWCzYTxPxDneR19KkWAzYyvc56WigghyixGmzO82Ih+3wSjSuIrtdQ2kEb/z4+GhYaWpdzqBNGeD5MtvnqbEfgawR4M37fKaUa8eA/lCdMFr00XaEoye5OUhGgmYds52DDQv5jBaUp8KwCrIlM6CaZZK5NdwzZkTlv+rShb+674b/uJf2CoJXYzfLlH4sjKInpQl0oHJzAsMnOfwpAIBf/Ogbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584822; c=relaxed/relaxed;
	bh=SD6mqWUZeYJtl6GnT7U0LdjoV3gPIs/AdF7iNpavyUo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Dba/QxKt3DEELFgAgb7nfeAnRhMTOJRcU1ZstoKuSIiPLBWLyQkHxMe2lHyBGb+V8FMNxDjDJMziyeRmMzsf61Cv0YFpi/EoIYHdU3yos1Bn8aAKxpY2BWjDqwYORiEQdF1xUx9gnr2L42jyhAhj/cxhdoS6OEOMi2qwGSJyWApvSS+ac2RiZQNs4p4PTgS/eabAjQ5jofCQPiVRX3gGpCQN8Bn6VP3COa7eDwczLpYJGYJdMGjiaGTN2TQZqQ9mWsIsQgWyWS/9b6WXbuLas7WeSRrjaue3YI8GUmE4xQQNvUqD7QroI9nPYsAlTZpwOr93MkUxsssKCwpypQeJcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BCVBA7c8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3cxwizwykdaw4qmzvos00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=BCVBA7c8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3cxwizwykdaw4qmzvos00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdWn5pXxz3cPW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:01 +1100 (AEDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e24b43799e9so1252342276.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584820; x=1729189620; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=SD6mqWUZeYJtl6GnT7U0LdjoV3gPIs/AdF7iNpavyUo=;
        b=BCVBA7c8Ad2n45/DC5a4QICVEoCmYk/3DwE928mEJGqvSOvhon1ADEMoPE0WdmHteY
         KK40Cfbd36Gf/Oi7vAtNQFUIa6NXTR8OheFL/7gzP7QkKtxcm5bOCDPIUvQ3CEahJEws
         EMTFgUoqlMlTqS5bOvt+z8nK+CYMMaFbxKJd75QiUZ619pSj/GEt3aO9TC8IvulXeF/f
         vWq91XIfDbxcvwJYg4FVsdf3R7DxunHPqGUnZIFShRHyaGZTK5ElYypXUJ4awrUhdtoI
         +NjgI7r+83NIbYrwBL7PCRkk4osqNdS3Shezd3b9RfQI3lKon7mhaFxbqc2PIebDT1in
         TO3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584820; x=1729189620;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SD6mqWUZeYJtl6GnT7U0LdjoV3gPIs/AdF7iNpavyUo=;
        b=AKyJSrrw9tjwtZ+JQ6M6DV6+bsVvsATOm+D7FwAZnvgB6Ti7rM/1tLIF6gac9v2PRz
         fAXlakEzcSVzRxG2610txiq0gmASGYLVaVKn0hEntZr8p2D+JOXF8UL+af9ml0Lo/fSP
         q8jQ/e4QueC3M53XWcAhruFofmHIADogcaJosyXC+VAQfw8XunCNHnnAb0MloEtp2Cp2
         epHJgUwZ/nUEpkMA4w1IniufR0GkKKmtxAT05ZPTU8bG7rPPWIyGk02TxEvT/ilm8Kul
         85wE4R27A9sYWU4gRAcccMyipwNqEfiXC6+5nEtxdhHWZDFATHLz/9CXj9ERs32sPte3
         s+cg==
X-Forwarded-Encrypted: i=1; AJvYcCXujFambZmsJaTyuP8l4R4m9fdFxC3l6J53Yckj4p+y813GLzdun2hRfH5nSrkLASZ093q7QxR5HbO10uM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyEijyLkPiv5SoplDcT+v2DGp2UYn5QLjloBWW4jStQh5bXEaLI
	SqcTnt70Mb+PYtFpVQs8H+9NyR7tjRNKGKyRBVQgdLRnqQa1ariFlLElWUFVO7CceW3T+v334yV
	4MQ==
X-Google-Smtp-Source: AGHT+IGRQvxFZI4ySDHPZ8aV1dJi8vCYkQEt4dLiT8ndc3AvxflLIddldJBCv79vdNFr7/DaBU5iasgDdOk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:ce11:0:b0:e28:fb96:d0f4 with SMTP id
 3f1490d57ef6-e28fe33505emr40781276.2.1728584819828; Thu, 10 Oct 2024 11:26:59
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:02 -0700
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
Message-ID: <20241010182427.1434605-61-seanjc@google.com>
Subject: [PATCH v13 60/85] KVM: PPC: Use __kvm_faultin_pfn() to handle page
 faults on Book3s HV
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

Replace Book3s HV's homebrewed fault-in logic with __kvm_faultin_pfn(),
which functionally does pretty much the exact same thing.

Note, when the code was written, KVM indeed didn't do fast GUP without
"!atomic && !async", but that has long since changed (KVM tries fast GUP
for all writable mappings).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_64_mmu_hv.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
index 2f1d58984b41..f305395cf26e 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
@@ -603,27 +603,10 @@ int kvmppc_book3s_hv_page_fault(struct kvm_vcpu *vcpu,
 	write_ok = writing;
 	hva = gfn_to_hva_memslot(memslot, gfn);
 
-	/*
-	 * Do a fast check first, since __gfn_to_pfn_memslot doesn't
-	 * do it with !atomic && !async, which is how we call it.
-	 * We always ask for write permission since the common case
-	 * is that the page is writable.
-	 */
-	if (get_user_page_fast_only(hva, FOLL_WRITE, &page)) {
-		write_ok = true;
-	} else {
-		/* Call KVM generic code to do the slow-path check */
-		pfn = __gfn_to_pfn_memslot(memslot, gfn, false, NULL,
-					   writing, &write_ok);
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
+				&write_ok, &page);
+	if (is_error_noslot_pfn(pfn))
+		return -EFAULT;
 
 	/*
 	 * Read the PTE from the process' radix tree and use that
-- 
2.47.0.rc1.288.g06298d1525-goog


