Return-Path: <linuxppc-dev+bounces-2069-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FE699908F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:34:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdXm6Q56z3cVm;
	Fri, 11 Oct 2024 05:27:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584872;
	cv=none; b=A8oZca/d+MHkE0HI+Mx1DpMTSPSmUXMUpYUCXfdeKjXIU327Z+kTeWM6pCnkz7FkHY6nXSlcKJ4XWZ9uozRJiAnTs+4x1Hm9uwVa1nFcf9XmQrx4RyOw8y4ew3oUO3G9525CtNveq4UBwpRI3uoFMS6Cc9HwcCiHUaHmHnz+UEGvSaYzSwxqU3MkUq9BgcYFa2JLwJKQOkT6NrCadiL6cB8M4HCD/ffqkwdftd/bIPzxiEgfCMTowcCblsrZEExspa63UPUAmNa29Evqarjq0EVLMz5N5NXIAYufuvhutdx6pltJ5MFV8Y6dZ+Pv1c41PpCf6MDChq5xZHyXLy/VHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584872; c=relaxed/relaxed;
	bh=BeNSr3VxopvO4QfIOfKviYSPGRm8vVX1K3YR0sLhejo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=b92qifFmOsPXFRguu7joYJ5xpq+jicvhb0LRqp2f5csZQcgJO5NGxlJ1kHB6M6I5bsnRheqfe6iyThQxVrtq/tWMpilxSDXXN8khamI42qDt5wp3+bXvJuYX+lHsnrzGN5GRRGnxAheRLmV1kh5NV8NyDgy9Zr6SItwj+HUcLrCBALZty2i2lBXXNLRYA4vdDXECekhcPH9IHFwaX1VCaxF7qIZXqquWRed3L6tqa6BIu1uaqHECIyzjfdRwq99tS5tUibsverPikpuLuucZLw4O3O3ciDMNq6M8iPNgcKxIUokVDbwodWpwYLyms6/zlSmcDy5e+SD57mrUc0ccBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=n36IcPeS; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3phwizwykdd8tfbokdhpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=n36IcPeS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3phwizwykdd8tfbokdhpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdXm0q0xz3cVf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:52 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e1fbe2a6b1so23313727b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584870; x=1729189670; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BeNSr3VxopvO4QfIOfKviYSPGRm8vVX1K3YR0sLhejo=;
        b=n36IcPeSbIL5L3XfBLHHy8aiCCgDm+4tUtilBS5OPVbDnf/kj6A/Kvy94LkXFCf5sL
         ypa1tafl6HJiQwgwr9YxTYw/yrvcJ7XmOwk82yYQIzz0Lj4B0+XT/OiAkFUb7dRJZ32p
         mj7AIFu3RVK30T8XrpNttef3VL9ZPPobkGP9vM+/8kwGm0rQbXK/mr9MD6TzeBRq/H/1
         8lnJUCGstKjKoQrrpDYSqUjfce6N9wIxWcI8ngIOMjQLcYZZT2lzlRhmiNxs07KMoc93
         C2qc674kWg+iWe5nTkeS7aGB1ThCXrvpmxCHkBVaD5FKqI+DNTonwP96Aye5bs+Iz4fo
         PdMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584870; x=1729189670;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BeNSr3VxopvO4QfIOfKviYSPGRm8vVX1K3YR0sLhejo=;
        b=Bn5lQfZtDmUaUpo5nMwxBJLjHB3FQuacbpbvR8I1E894HKZOjAHD4mzyJIu0WcYUNd
         6Hhb98+6xbxOLlYEH0kKcmi8jfgxiLhzelmpFuTJQkqPUSSy92s+rtKqLn57WJWsLRJs
         WuTbEYTK4mfnU7Z+6AAVNfmA3b2ZvIf+NUsvkqovrtkehLNS6mIooURN8v5M9xmi0VZx
         eMQD5FhUZPZW62prJRHBQXyRTw+jbX+bX+7YkESvsTktfdo6fa3Vr3fhcWBJTv4HKL7x
         H+9J+EzLr+Lc8NhL+0m/wcxAVhxTlHw1K69BiC1wpbPwD526ELIVUhoAUlUx3OA9OZAn
         rr/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXs+f5X68rdaCbugfhQHhKhYUFmTYTKbGTxeuCKXWhqOsOUmbz7p97IrSnZavcz9sTKeCJGFzK/iqHNc2Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxDwXXsylccYUQ4cbcq5BQZXsKzn48xp0rFXyUxj6bMe+JcPyh1
	87+OAJgaxuBFXCbjCPYf+EY2Umu3Ru/iZvoOtnjIF/J5YJEFGNJi5JAoxWluSH27VFLgK6GVKoa
	s8A==
X-Google-Smtp-Source: AGHT+IHhmEpfdjhYs/g96WpbaMl3fao5EtfU192MAf3yyGbJNoRiDL4cTPbNYR1fq37SA+x5liddjIzSKiU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:2e86:b0:6dd:bcce:7cd4 with SMTP id
 00721157ae682-6e3221404ddmr516647b3.2.1728584870148; Thu, 10 Oct 2024
 11:27:50 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:26 -0700
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
Message-ID: <20241010182427.1434605-85-seanjc@google.com>
Subject: [PATCH v13 84/85] KVM: Drop APIs that manipulate "struct page" via pfns
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

Remove all kvm_{release,set}_pfn_*() APIs now that all users are gone.

No functional change intended.

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  5 ----
 virt/kvm/kvm_main.c      | 55 ----------------------------------------
 2 files changed, 60 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 4a1eaa40a215..d045f8310a48 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1274,11 +1274,6 @@ static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_v=
cpu *vcpu, gfn_t gfn,
 				 write ? FOLL_WRITE : 0, writable, refcounted_page);
 }
=20
-void kvm_release_pfn_clean(kvm_pfn_t pfn);
-void kvm_release_pfn_dirty(kvm_pfn_t pfn);
-void kvm_set_pfn_dirty(kvm_pfn_t pfn);
-void kvm_set_pfn_accessed(kvm_pfn_t pfn);
-
 int kvm_read_guest_page(struct kvm *kvm, gfn_t gfn, void *data, int offset=
,
 			int len);
 int kvm_read_guest(struct kvm *kvm, gpa_t gpa, void *data, unsigned long l=
en);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a483da96f4be..396ca14f18f3 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3164,61 +3164,6 @@ void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kv=
m_host_map *map)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_unmap);
=20
-void kvm_release_pfn_clean(kvm_pfn_t pfn)
-{
-	struct page *page;
-
-	if (is_error_noslot_pfn(pfn))
-		return;
-
-	page =3D kvm_pfn_to_refcounted_page(pfn);
-	if (!page)
-		return;
-
-	kvm_release_page_clean(page);
-}
-EXPORT_SYMBOL_GPL(kvm_release_pfn_clean);
-
-void kvm_release_pfn_dirty(kvm_pfn_t pfn)
-{
-	struct page *page;
-
-	if (is_error_noslot_pfn(pfn))
-		return;
-
-	page =3D kvm_pfn_to_refcounted_page(pfn);
-	if (!page)
-		return;
-
-	kvm_release_page_dirty(page);
-}
-EXPORT_SYMBOL_GPL(kvm_release_pfn_dirty);
-
-/*
- * Note, checking for an error/noslot pfn is the caller's responsibility w=
hen
- * directly marking a page dirty/accessed.  Unlike the "release" helpers, =
the
- * "set" helpers are not to be used when the pfn might point at garbage.
- */
-void kvm_set_pfn_dirty(kvm_pfn_t pfn)
-{
-	if (WARN_ON(is_error_noslot_pfn(pfn)))
-		return;
-
-	if (pfn_valid(pfn))
-		kvm_set_page_dirty(pfn_to_page(pfn));
-}
-EXPORT_SYMBOL_GPL(kvm_set_pfn_dirty);
-
-void kvm_set_pfn_accessed(kvm_pfn_t pfn)
-{
-	if (WARN_ON(is_error_noslot_pfn(pfn)))
-		return;
-
-	if (pfn_valid(pfn))
-		kvm_set_page_accessed(pfn_to_page(pfn));
-}
-EXPORT_SYMBOL_GPL(kvm_set_pfn_accessed);
-
 static int next_segment(unsigned long len, int offset)
 {
 	if (len > PAGE_SIZE - offset)
--=20
2.47.0.rc1.288.g06298d1525-goog


