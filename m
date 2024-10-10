Return-Path: <linuxppc-dev+bounces-2007-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB50899900C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:27:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdVF4rwrz3bjf;
	Fri, 11 Oct 2024 05:25:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584741;
	cv=none; b=UYub0HxqFJ3GJb3mzz7iBKmgGbXN/gJ47mMjUdfOffRnkUGOJ/zLriNq41ftyhjB37zfC9VNehyCg+psqH61Rg9c2v5Ako/xN879Zr4oN0qLUoPvVta+b3bKp1CbW2b+TN9lrfekNZNLKXb5GQ8j73JBSqQMZk9gB8hcHH1kR/D4468m2KwWpCnSSqIff9adW58MVaW7PPF5VTA2woTQoD8yvbJE1HJntcUikCTCTbaSrAHd+IT8d4YIVxuMjhQWCggaqKhLr4bSQEYm7O7uymwOjEggEZWf3684ugu7wKpiDn9/oOlfDgIXKEpDOqbJgFcHiarNU5KA+LxC1ML2HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584741; c=relaxed/relaxed;
	bh=wU+jX/zRq5GV793BchOJ2bBXpO8AjDudJh47DKJg70M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Bc2OOC/Gl6VlSWhgQpdqlwl5sabKeKlML2PBmlizns/+V56OT23nBiTIdOV5EaH18Vn1h+YngChQHmeQj0lyfWJc/QnpZr+WZTQSLwDJKWSi/DIuDz1fXNdztX2wthujFaPHhetPLIGcEBZChib5ZAXo/Tzzi7VR5fACmsvdWbiE4Qpff9LCJV9D5+hofJPhLJ+LQWK3IaB8D90wE2NbH7MKaiK6t+mQweaU9LznrTPw8i0+WCvVMa2HEwsGMY6XpKF1CazUJMH2vXXwJPn6IKnXulF2M+NT8KRv6Fsv8NyvYp9MtCvX0osNc0fsXdrsil231kICbWe6BsH5VhQkEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fT3Bf2Wo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3ihwizwykdlkrdzmibfnnfkd.bnlkhmtwoob-cdukhrsr.nykzar.nqf@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fT3Bf2Wo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3ihwizwykdlkrdzmibfnnfkd.bnlkhmtwoob-cdukhrsr.nykzar.nqf@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdVD6LF8z3blc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:40 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e2916c47e9fso295462276.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584739; x=1729189539; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wU+jX/zRq5GV793BchOJ2bBXpO8AjDudJh47DKJg70M=;
        b=fT3Bf2WoR/3TgLi2jY4/lWtTK7rNKHov7VNwE1vpGiy/G3p7S/gSofX56CXwa8JVGQ
         aaDEAOcr/3Ddv59vF1VVF3Mq56LEsbz2r5CutLzxzdEnxBaNN26RP3RP6xWLXgINzv1o
         TAkzoQ8leSO8H+H5/k3ce6kBQOXWV1TMKf6tBij9MLG6gxOxVSYpSn1DjQORU9z/+Gxw
         0oPhrwcMoQUEPobAIA2IS9OZvAWYJ+aoLJbGMkZa++pYyqRRLOtHHJbjtXKLKXmAbv1h
         hCjPUXkhJAEnBAqHqEc3E00k6RhI1VV8HSv2UCEsrDekdAqZbyxZjn6LFuApy7Elmgv/
         v7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584739; x=1729189539;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wU+jX/zRq5GV793BchOJ2bBXpO8AjDudJh47DKJg70M=;
        b=eq3S8USB9L8pZ0FlJ4i6kaFo/k5y5FVI+FY3BMYIkSiavE6eRVOj2nwpzAtH86LOyF
         YRaKP3yiw5Iv39k9MEUJL5//fBS/gJm4wsIxb4cPQ69jbx4/3HXKHRGL9Uw6XYoxU6wO
         l5eISDTmuFlu3G6PWQY2gyu5DWRwVRqsyfxKibPJ5HXn6a2/FS6R/Xa4T0HhwT6nGIzs
         fj1dEFD3Zv7YPSbe43o+80rNhKv9d0ba0x0tnPAAP6Wrqsf3NFeeGRnPdEwLZgvS0Dwm
         FpzbZnkrULw+XmDeWakuUJH6H6gO0H1HOXmoJi/a6C9TiPZEerkz/tvNWseAX8vCBwv0
         bFng==
X-Forwarded-Encrypted: i=1; AJvYcCWfWmjlGdeq5K9um5GJAM88LngxxXBU6sm4v/6jmyHI7prQKFxiMNtpM4nsIooB89q0LR7jexyB8DCdmxY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywh8DKdQrnLwpsrb3F7gjen/W0RdSaqS/Slg4ZVYu/nBRThX/bI
	S0xWPxgHQd/T7qclctKWevrI8smX0Bz2vCNE2Ecf8hMoWNOHeE3oBzLg2/ZWQ0qnKdZsC1+vdOS
	oPw==
X-Google-Smtp-Source: AGHT+IGZ+3mddEgfwOZrB7Mg/yEB+clUKORcl3gwcx/GeFypDRI64NMuGnBtjzJ0gTzObJ64BsofGpKHxtA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:ab6d:0:b0:e28:f8e6:f4c6 with SMTP id
 3f1490d57ef6-e28fe465652mr58758276.2.1728584738891; Thu, 10 Oct 2024 11:25:38
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:24 -0700
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
Message-ID: <20241010182427.1434605-23-seanjc@google.com>
Subject: [PATCH v13 22/85] KVM: Use NULL for struct page pointer to indicate
 mremapped memory
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

Drop yet another unnecessary magic page value from KVM, as there's zero
reason to use a poisoned pointer to indicate "no page".  If KVM uses a
NULL page pointer, the kernel will explode just as quickly as if KVM uses
a poisoned pointer.  Never mind the fact that such usage would be a
blatant and egregious KVM bug.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 4 ----
 virt/kvm/kvm_main.c      | 4 ++--
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index cbc7b9c04c14..e3c01cbbc41a 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -273,16 +273,12 @@ enum {
 	READING_SHADOW_PAGE_TABLES,
 };
=20
-#define KVM_UNMAPPED_PAGE	((void *) 0x500 + POISON_POINTER_DELTA)
-
 struct kvm_host_map {
 	/*
 	 * Only valid if the 'pfn' is managed by the host kernel (i.e. There is
 	 * a 'struct page' for it. When using mem=3D kernel parameter some memory
 	 * can be used as guest memory but they are not managed by host
 	 * kernel).
-	 * If 'pfn' is not managed by the host kernel, this field is
-	 * initialized to KVM_UNMAPPED_PAGE.
 	 */
 	struct page *page;
 	void *hva;
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f1c9a781315c..7acb1a8af2e4 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3067,7 +3067,7 @@ void kvm_release_pfn(kvm_pfn_t pfn, bool dirty)
=20
 int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *ma=
p)
 {
-	map->page =3D KVM_UNMAPPED_PAGE;
+	map->page =3D NULL;
 	map->hva =3D NULL;
 	map->gfn =3D gfn;
=20
@@ -3093,7 +3093,7 @@ void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm=
_host_map *map, bool dirty)
 	if (!map->hva)
 		return;
=20
-	if (map->page !=3D KVM_UNMAPPED_PAGE)
+	if (map->page)
 		kunmap(map->page);
 #ifdef CONFIG_HAS_IOMEM
 	else
--=20
2.47.0.rc1.288.g06298d1525-goog


