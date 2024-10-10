Return-Path: <linuxppc-dev+bounces-2028-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8AC99903A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:29:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdW44ZS3z3cGv;
	Fri, 11 Oct 2024 05:26:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584784;
	cv=none; b=EAXw3OsDXPJ60wDvEmL0RKwRYemspFvMf2qRp1kLAKSntBA7+5fT91EnhRQbcjHd11trS88ZhFDpLr1r7YV2o6ZsL5CtM8FZ40pxXNx39P5fdVQujl0Z1A/JeqPaAlJZ6OZCEAr33qBfK2xJVLVCNB5KP+hhWfrPNlKgNPKylxoC+Z7k4sKDM/G84xXQl4OVGXgyOjGzHNyADidIiKafKr3/vkLio6ZEm/Ut/7FLVC3Ylo2JILxmt6PthMMLusc2V5PP+8Jx4MV65YKqSiiWsUNd0X/RSB1pA/1IhRIT3u24ee4sOgfQUvH5drPZHO3s9bBVBlN73SyoN8Nez5+Aow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584784; c=relaxed/relaxed;
	bh=CHy2j9VNwFKd5G/Ubc3O4QkXvNoIm5ox3M6XZ4oswcY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Rzx6KwxusdiorWQzYYU6mwOISaHixNB8jRAObrkuqjceqLYtt5O4zZNO9nb2Koqkx831GhJD5PS34Zt3RQPmxVgCWOOqo6mFXk1mma3qXSu874YoQ8iziKqcC6o+TjNzWDN+fC/pSpZ1DGLF/99dJL+jbZ7LGN/rjr12Vga/YIuiihU+ctw8cQpDYe8LRCu/Cw8z9VHgbGRQUd4qPI1TQh4KiNSP6cqsWxes6pL1LhX3+W2U25mcTpuh/bvMkw/gZRpbUZWV7u0VHjhIOWfvFbr+1ZXJrmrwAXCRJmYovjvOm7lt2nNs3MvkyBeIfFJq6PlOZNQgjDguioCvn7FZ+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tP4w0ZQJ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3trwizwykdoqykgtpimuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tP4w0ZQJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3trwizwykdoqykgtpimuumrk.iusrotadvvi-jkbroyzy.ufrghy.uxm@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdW35Hkqz3bkL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:23 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e29b4f8837so18944127b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584782; x=1729189582; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHy2j9VNwFKd5G/Ubc3O4QkXvNoIm5ox3M6XZ4oswcY=;
        b=tP4w0ZQJKer10vk37s9GDpdFIShoKTobGVlGrYg/Vxa6l5GSTaasDgca2M4PokiJFj
         Xhi7B8x5SvmdiO97jQvkach7TLeIY/TUUI3HnMXG5bVke+OgWTPzcw63PkwH60yxJQY4
         mCqImD3ISEtviU3DKTaAZmLW8Y+VAZrdrnpaEzlaaDEhf1N7Ub5QjrdWnfgER2rzo/ai
         un2mM9t72y6aenCjXtaGzpaFOy4jl34TIIrpdP+P7VjJT4Wu+7TQYhuqZ5VlNOiaD5/U
         jq7052ZuloxFyl7HUIdf4M2Hdc8iGQseTblXyC3RSpquA/B6ZTDlJA/CQh9X3FqN4WTo
         oLcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584782; x=1729189582;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CHy2j9VNwFKd5G/Ubc3O4QkXvNoIm5ox3M6XZ4oswcY=;
        b=bJXR8nHq5gVhJsRdtNVmPd2sS/RN1uDQf0308RrWa7duJYqJbD1SOmBZPLuYSEbLXI
         NyV8T3Ebsk6RF+XgzZ6MwQSh7B+8j9LUQ+/uJnpKq3PTLo01hPtck+hkbCuok24A16n6
         AjScCgp0rfZ+0gkSkRe3031QFEywxrXBls2iq9q+g4vJQjHoCwu+aP7LxE42JqXAijst
         EVh/03+nftK68KzGZGLI2StSgH2iw19NzKvPIFWwYcLe6QjDLkzTLbYyNPPkaneOMnB1
         v/p5Yq4Afy6SRdA2dYTLPthefRJ3U5CVME9g8QVcpeuocwQWj+UoCl8rW1yGVK+Fz/od
         rQ+w==
X-Forwarded-Encrypted: i=1; AJvYcCX9T8PCBgkq8cZwUwAFzFirdmYJU9j2D0AinqsgeV27fLXyweHJgSv6abtQq347sbDPdLxWhdGjvgPmexU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzSBQB1lg/dpseavyW8RqbgSMETdoz2N1uL79GKhFbvur7DmDth
	Sqlxr7n7jTPW5cB2Ar6+BWwR6Qj0qO1hHCs+HuSh4hQlkgQgFjhHuqrDpSvCo24e2lrKP1nY+F+
	12g==
X-Google-Smtp-Source: AGHT+IEBXjEpYcXfPYRm3Nf4G9ZN1ucR55aqjscHr2p9QPsSrcRZYI0185ucK64AXquh+1QVcruWQv+kNDM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:5605:b0:6be:523:af53 with SMTP id
 00721157ae682-6e32f2f4e28mr919077b3.3.1728584781575; Thu, 10 Oct 2024
 11:26:21 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:45 -0700
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
Message-ID: <20241010182427.1434605-44-seanjc@google.com>
Subject: [PATCH v13 43/85] KVM: Add kvm_faultin_pfn() to specifically service
 guest page faults
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

Add a new dedicated API, kvm_faultin_pfn(), for servicing guest page
faults, i.e. for getting pages/pfns that will be mapped into the guest via
an mmu_notifier-protected KVM MMU.  Keep struct kvm_follow_pfn buried in
internal code, as having __kvm_faultin_pfn() take "out" params is actually
cleaner for several architectures, e.g. it allows the caller to have its
own "page fault" structure without having to marshal data to/from
kvm_follow_pfn.

Long term, common KVM would ideally provide a kvm_page_fault structure, a
la x86's struct of the same name.  But all architectures need to be
converted to a common API before that can happen.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 12 ++++++++++++
 virt/kvm/kvm_main.c      | 22 ++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 346bfef14e5a..3b9afb40e935 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1231,6 +1231,18 @@ static inline void kvm_release_page_unused(struct pa=
ge *page)
 void kvm_release_page_clean(struct page *page);
 void kvm_release_page_dirty(struct page *page);
=20
+kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
+			    unsigned int foll, bool *writable,
+			    struct page **refcounted_page);
+
+static inline kvm_pfn_t kvm_faultin_pfn(struct kvm_vcpu *vcpu, gfn_t gfn,
+					bool write, bool *writable,
+					struct page **refcounted_page)
+{
+	return __kvm_faultin_pfn(kvm_vcpu_gfn_to_memslot(vcpu, gfn), gfn,
+				 write ? FOLL_WRITE : 0, writable, refcounted_page);
+}
+
 kvm_pfn_t gfn_to_pfn(struct kvm *kvm, gfn_t gfn);
 kvm_pfn_t gfn_to_pfn_prot(struct kvm *kvm, gfn_t gfn, bool write_fault,
 		      bool *writable);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6dcb4f0eed3e..696d5e429b3e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3098,6 +3098,28 @@ kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu,=
 gfn_t gfn)
 }
 EXPORT_SYMBOL_GPL(kvm_vcpu_gfn_to_pfn);
=20
+kvm_pfn_t __kvm_faultin_pfn(const struct kvm_memory_slot *slot, gfn_t gfn,
+			    unsigned int foll, bool *writable,
+			    struct page **refcounted_page)
+{
+	struct kvm_follow_pfn kfp =3D {
+		.slot =3D slot,
+		.gfn =3D gfn,
+		.flags =3D foll,
+		.map_writable =3D writable,
+		.refcounted_page =3D refcounted_page,
+	};
+
+	if (WARN_ON_ONCE(!writable || !refcounted_page))
+		return KVM_PFN_ERR_FAULT;
+
+	*writable =3D false;
+	*refcounted_page =3D NULL;
+
+	return kvm_follow_pfn(&kfp);
+}
+EXPORT_SYMBOL_GPL(__kvm_faultin_pfn);
+
 int kvm_prefetch_pages(struct kvm_memory_slot *slot, gfn_t gfn,
 		       struct page **pages, int nr_pages)
 {
--=20
2.47.0.rc1.288.g06298d1525-goog


