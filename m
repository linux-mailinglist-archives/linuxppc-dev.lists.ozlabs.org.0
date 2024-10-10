Return-Path: <linuxppc-dev+bounces-2027-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE98C999038
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:29:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdW21sD1z3cGZ;
	Fri, 11 Oct 2024 05:26:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::44a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584782;
	cv=none; b=FlobkJBBAhhy2cZLphOS8WHOsYAMIfgaMJUKp1zptsHF6lF4f+tUX8/5Xn/eAtZN88veLoNTTCgrBpsa3fgecGslGwgnetVQMt/x9QGytsVvOB3a0poVP6nVi3+1lEtIw10fAzJ0DAu2jWmeUaCKusemZpdzkHImIim2es6lusxh/l6MnJS48RUVBF0mVaiNAFH3ENXU9A2eZyfgFGQcDHzenfLirrNGFJ4cJDYskkKNVDicVlwvEFaX8hjnWgecJL8BeARWDO1SzdUTWexCcM+off026pV3exeO1SoOZlcUK3r27sUszZQbh9ECnRDhOOxzlMnZAtU6IAS2baLEkw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584782; c=relaxed/relaxed;
	bh=8DwvYXI8CmE5CO0Ycvk+EgdgF52vTMi74FFh8TONwA8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dphXZYRVi4uGiY10et2pFF37/3+kB5ltyAJ7wNgDnqp9b52CYigSA2zU62oJrhNNg2ZX9F7+CMTUaUHOuZD8Hm23lz1ZNw+au9OEcTu2AH92pYHBA85iPqVopV6SDDfmkwP1P5URunsc3a8uHY0dJnRwwI7dMk58oo6iIkuDU3g3mSp9xOcpr/elmKdFwIln3oCw+v0MCnCHamX62+SYJzamA30Pg4fUtYA8tnCwuckKobPVt8xdM6UZUioA/L+5R8KMudBiI3b3p1jALAcD176+UtGQ9cPXdB9v83YOdi7pUGrhmshK2z+yFhdIiHyg5U0eRelS1cw23YcZaSN6XQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=sXvby1g0; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3sxwizwykdoiwierngksskpi.gsqpmrybttg-hizpmwxw.sdpefw.svk@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=sXvby1g0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::44a; helo=mail-pf1-x44a.google.com; envelope-from=3sxwizwykdoiwierngksskpi.gsqpmrybttg-hizpmwxw.sdpefw.svk@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x44a.google.com (mail-pf1-x44a.google.com [IPv6:2607:f8b0:4864:20::44a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdW12ghJz3bkL
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:21 +1100 (AEDT)
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-71dfeda9ac0so1339089b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584780; x=1729189580; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8DwvYXI8CmE5CO0Ycvk+EgdgF52vTMi74FFh8TONwA8=;
        b=sXvby1g0BQ2dS4X+Y6xhQ15C8auvtYEVs4e6SR1VJ0CHb8T4gYsJ0UIYsY/wim4p5I
         Cs/ahkD8pCtDNgrOGhxyjvorF0It+x0yZpkNqJ3LdRIk7DmSyq+cjQa6dsMqXgQOj+wy
         udgxCU3JDt3F2wuoi7SvmpI2BsT9aoBtFs57Cc8k15r4akK+vFy5jxJ0K9LW/yEl7OjY
         zLojkPCEawmkEFBw3qaTnofsUrNY8SdgoxzlYbc0fZ2DycPolnfWMGhXOT6MkHPie08w
         6mY5T0ai6TPs9cEiJD8C3n8XmKrFCmnSvgPwvVbG8DwWpys2h3zWdvgYRK1hv1NMsW52
         U/9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584780; x=1729189580;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8DwvYXI8CmE5CO0Ycvk+EgdgF52vTMi74FFh8TONwA8=;
        b=lx7mUpFGY+Kh+J5ogM0D2B31thg3bhFz/tkhRDRRINZdXagWCuqAqUox7zUfNIrHKH
         jvQWnRLFqHWKeMiAvmwf1Mr8kXdRGD3+RGmk4zl51WezbNSv5zekJAUfmsu+RFPpfrXM
         eMY8BT2p0HnhqHvRNdGq5UiDnJDL2FatNTJNoEuGmmRXYmNMTEIRHRzQrp3rhq+8BpW+
         MEyo4Sd0NuXlM10DBzyShXgvAohWrSSTTFVtnrSbXgujWiAo+UYpt4RikdHtpNJOoLps
         4B6Mekg4PF9lCJBu76m83u8atSGoATigfpY/HNrJEU+vmZ4yLuKBUFAwr2UYSLFmSlUj
         QshA==
X-Forwarded-Encrypted: i=1; AJvYcCXCpJqA57hykR/qv1d9X/3yO6f+LVFbGzejUKZCQ5/wUwOaMQJ2VHKkGbkC7PFWxACrM7pVpYVjIwUbkZg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzz040hZYsahLiky79McfU7hgiX4r+s9z97Uc3OaJ+wil2GbMKa
	EO/VjSz6/M9SR4jBhpkoKv9qhB/NqS1F5/TUo0EafG9EuZEznUWIQ9TAxR2vd+idt+P0Eb0Wfxl
	hng==
X-Google-Smtp-Source: AGHT+IG3pPvsekcqYnotExeZVZUXEYlJLq+6e3a1eutYJX4gtVKcKQbhJKMNrxmpaRIGMBxtyW/kZ/ByL14=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:91a3:b0:71d:fb06:e79b with SMTP id
 d2e1a72fcca58-71e37c53abamr28b3a.0.1728584779496; Thu, 10 Oct 2024 11:26:19
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:44 -0700
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
Message-ID: <20241010182427.1434605-43-seanjc@google.com>
Subject: [PATCH v13 42/85] KVM: Move declarations of memslot accessors up in kvm_host.h
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

Move the memslot lookup helpers further up in kvm_host.h so that they can
be used by inlined "to pfn" wrappers.

No functional change intended.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 9263375d0362..346bfef14e5a 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1168,6 +1168,10 @@ static inline bool kvm_memslot_iter_is_valid(struct =
kvm_memslot_iter *iter, gfn_
 	     kvm_memslot_iter_is_valid(iter, end);			\
 	     kvm_memslot_iter_next(iter))
=20
+struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn);
+struct kvm_memslots *kvm_vcpu_memslots(struct kvm_vcpu *vcpu);
+struct kvm_memory_slot *kvm_vcpu_gfn_to_memslot(struct kvm_vcpu *vcpu, gfn=
_t gfn);
+
 /*
  * KVM_SET_USER_MEMORY_REGION ioctl allows the following operations:
  * - create a new memory slot
@@ -1303,15 +1307,13 @@ int kvm_gfn_to_hva_cache_init(struct kvm *kvm, stru=
ct gfn_to_hva_cache *ghc,
 })
=20
 int kvm_clear_guest(struct kvm *kvm, gpa_t gpa, unsigned long len);
-struct kvm_memory_slot *gfn_to_memslot(struct kvm *kvm, gfn_t gfn);
 bool kvm_is_visible_gfn(struct kvm *kvm, gfn_t gfn);
 bool kvm_vcpu_is_visible_gfn(struct kvm_vcpu *vcpu, gfn_t gfn);
 unsigned long kvm_host_page_size(struct kvm_vcpu *vcpu, gfn_t gfn);
 void mark_page_dirty_in_slot(struct kvm *kvm, const struct kvm_memory_slot=
 *memslot, gfn_t gfn);
 void mark_page_dirty(struct kvm *kvm, gfn_t gfn);
=20
-struct kvm_memslots *kvm_vcpu_memslots(struct kvm_vcpu *vcpu);
-struct kvm_memory_slot *kvm_vcpu_gfn_to_memslot(struct kvm_vcpu *vcpu, gfn=
_t gfn);
+
 kvm_pfn_t kvm_vcpu_gfn_to_pfn(struct kvm_vcpu *vcpu, gfn_t gfn);
=20
 int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gpa_t gpa, struct kvm_host_map *=
map,
--=20
2.47.0.rc1.288.g06298d1525-goog


