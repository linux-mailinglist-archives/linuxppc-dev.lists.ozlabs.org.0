Return-Path: <linuxppc-dev+bounces-2009-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE71999011
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:27:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdVL08N6z3blc;
	Fri, 11 Oct 2024 05:25:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584745;
	cv=none; b=KqNXEQeoAGoLf1Spw6olUWMcg3v60lqZ/nhF6dZ3VEmv4FalpWitATg0taG6iBEL+DKKNq5RVgYmXCVbPh3ZB5ypeA/KI8XrJAV9XlwYWBwFxg2iMvYsgGAgF6gukVztS4W8JSFaUVcMGQlfeD6EPAAOcDyQZdCAIsAhd5FsEyam5TzMo5dIZdy8Gg84v1AQziY5UvE03MkRDdGGjyxiutiXJaue2scemvLjdnDTAue7W6go1pYA405uKvVxkVvawc9OArYcGn3C6H9cL47dzWG8JQKAMCLj+n5lufochbN1ij7VWnIvQCpNp4kH8Amh0cZMAAasQxkpM1my6b32rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584745; c=relaxed/relaxed;
	bh=eHAZpPaCzYnE+TRrbh6ni4wh+Yys2pChavpSnHk2YEU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S0gC31dqchsz/puBoczX8YIZe+wv6JLo/fJFW3u9RJc56taUlWaOqsisqi/Nsv6I8MuVCG4LWFxbqUyAerliU4JNXBH8GV3wmW2wnwUMKWvy1BezRqeYJT++HjbiCj5cExZYrRMxR4no/us80bA2G+tzfR80FRzRSAkHqmOjMoQHEfg29YQ0SCJ7CZRDgVjgqW/L6XNqnTY3ZpPTmuvSOp4ToIZdFKj9iX1Dlx+PfYYdUTOFira+lM69eMdxAVjcNKS5xfh9YrMbjXah9T5fFZFxtgsvFLkAXJw6orFAeCOZ/OD8+Jm2YZuhkQaLQfK0IZB0q+JLwmpX/f9T1+36VA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=p70Vo9Je; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3jhwizwykdl0vhdqmfjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=p70Vo9Je;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3jhwizwykdl0vhdqmfjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdVK1Rxrz3bjg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:44 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e290a9a294fso1853537276.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584743; x=1729189543; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHAZpPaCzYnE+TRrbh6ni4wh+Yys2pChavpSnHk2YEU=;
        b=p70Vo9JeTd3mDwD1OVRey6u67Qs40pQ2KaQzPv0EVpMh5wlOA7ApG3/+xEp7KXGoxK
         0FLTtSqU7xYyAuZFgeGuhmrxAWruvcsP4AUtj1ybMy4a1otwHSSu2xtDN6yuZUI6R2tl
         iFB7hpgPCp/X8XJhc1ckZZ9xAc5Rip9DpsmTRLUkrxJIzBrfBbF/j2NaoDqSMvmbDH/8
         O8viSQ1kBmNKbLs0JCDORoYdd1VBXbhVTON8dTYfKgmfS2vGR9BSs6l4YgQAMrZoKrN4
         zEMtMpw74quX2bmo8UJRPODu8V3WRWCRu0LRA/EV+IqcDb0L62TLKzxIvCMJz5ohfTDD
         RwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584743; x=1729189543;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eHAZpPaCzYnE+TRrbh6ni4wh+Yys2pChavpSnHk2YEU=;
        b=GCDvito3dk2S+TxV6Ecuuui2l2rBiEexSNeqJOf1fHU5v6xbEFnmCJyFFzgIftXV88
         BVe4N3eixgUXHT9jcygyXkEnMrR4k3WBqMrvUjFnopBBZm5fQbCE6hcNuZfP25b4OeuF
         uHmun7i6EkOWMoLFEaQvo7eZ7acVEsDGHl+74V9UbtBlpRMbDgedPrp6vYNWZdsiXz9e
         alJ5Bcguxf1ZnzQ+m7HAjjT++mm0BZxqrFw4WmI4Wa75DCXGPNrF2lzJsFcphGotgWzc
         jDLKUXp2gf9wp/500DYzYF2umZvKhhumANg4zzYwnOKIVVRqCC/tt2nZwwCSdxUf/grB
         wS4A==
X-Forwarded-Encrypted: i=1; AJvYcCU3wwN/IDWIjYNyWr/BLK1EDG4S7OEfNHvbcCaabLhIV8chYOn403VbKTkZdXKLe2oWjhim67psnW2F9a0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzCZB36qJ4uz9pHmL6A8GtJQ3ajg8FKlMIJie93XvAFyw69Fxmp
	VlHkmuZK5MujE7xawZ3Cyj0veJ8pa+vgaXXcSWe9FJr7gqffg16xPP1t1MNPethpkryr9NIcjsH
	jHQ==
X-Google-Smtp-Source: AGHT+IGUAGxjHNELfO1gnQBoxyShlnhLiinRslmifWPsD1igdN7s2BU3B9tdatRPL4jwPkA1Z0qI9X+JjYQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:9346:0:b0:e28:fc1b:66bb with SMTP id
 3f1490d57ef6-e28fe4f0fddmr4836276.6.1728584742775; Thu, 10 Oct 2024 11:25:42
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:26 -0700
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
Message-ID: <20241010182427.1434605-25-seanjc@google.com>
Subject: [PATCH v13 24/85] KVM: nVMX: Drop pointless msr_bitmap_map field from
 struct nested_vmx
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

Remove vcpu_vmx.msr_bitmap_map and instead use an on-stack structure in
the one function that uses the map, nested_vmx_prepare_msr_bitmap().

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 8 ++++----
 arch/x86/kvm/vmx/vmx.h    | 2 --
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index e94a25373a59..fb37658b62c9 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -621,7 +621,7 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct=
 kvm_vcpu *vcpu,
 	int msr;
 	unsigned long *msr_bitmap_l1;
 	unsigned long *msr_bitmap_l0 =3D vmx->nested.vmcs02.msr_bitmap;
-	struct kvm_host_map *map =3D &vmx->nested.msr_bitmap_map;
+	struct kvm_host_map msr_bitmap_map;
=20
 	/* Nothing to do if the MSR bitmap is not in use.  */
 	if (!cpu_has_vmx_msr_bitmap() ||
@@ -644,10 +644,10 @@ static inline bool nested_vmx_prepare_msr_bitmap(stru=
ct kvm_vcpu *vcpu,
 			return true;
 	}
=20
-	if (kvm_vcpu_map(vcpu, gpa_to_gfn(vmcs12->msr_bitmap), map))
+	if (kvm_vcpu_map(vcpu, gpa_to_gfn(vmcs12->msr_bitmap), &msr_bitmap_map))
 		return false;
=20
-	msr_bitmap_l1 =3D (unsigned long *)map->hva;
+	msr_bitmap_l1 =3D (unsigned long *)msr_bitmap_map.hva;
=20
 	/*
 	 * To keep the control flow simple, pay eight 8-byte writes (sixteen
@@ -711,7 +711,7 @@ static inline bool nested_vmx_prepare_msr_bitmap(struct=
 kvm_vcpu *vcpu,
 	nested_vmx_set_intercept_for_msr(vmx, msr_bitmap_l1, msr_bitmap_l0,
 					 MSR_IA32_FLUSH_CMD, MSR_TYPE_W);
=20
-	kvm_vcpu_unmap(vcpu, &vmx->nested.msr_bitmap_map, false);
+	kvm_vcpu_unmap(vcpu, &msr_bitmap_map, false);
=20
 	vmx->nested.force_msr_bitmap_recalc =3D false;
=20
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index 2325f773a20b..40303b43da6c 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -200,8 +200,6 @@ struct nested_vmx {
 	struct kvm_host_map virtual_apic_map;
 	struct kvm_host_map pi_desc_map;
=20
-	struct kvm_host_map msr_bitmap_map;
-
 	struct pi_desc *pi_desc;
 	bool pi_pending;
 	u16 posted_intr_nv;
--=20
2.47.0.rc1.288.g06298d1525-goog


