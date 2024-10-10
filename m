Return-Path: <linuxppc-dev+bounces-2002-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 062CE999002
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:26:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdV22zTqz3btZ;
	Fri, 11 Oct 2024 05:25:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::649"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584730;
	cv=none; b=T7gFcBAme3FByLeszj/ZUBBw74ftWcIurwFGGTwX0izXTt2mI6xlKjUc5rNzSCBLTETtdKw5+h61l1JjEAtWll82s5MAF1z83ZAJd40omrnIk2lHgsBuFBuCfeqCoIkDpMjRiKEhSaQwkAbfx+guLWHsiL1pmKi4hSq9fYudbqr8zxW6d6aqmCHSDTcoID8rp3SQIRhZnxBBk38yaAJ3vZUwM/YQUdrM+2GRHhBHcgwck3IjfkTWmiqidSdZuTu+kKbefDLbIN2KfrM1zIJy1XI5ulxky2A4n0VQmF+W/iNl5JBh5jLFenZXxadc2A/mB/qtvYy9491gFDGxUbdo4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584730; c=relaxed/relaxed;
	bh=5N9i4qcLR1M4w0icoJwy+0qPwifBeFycVmWqg2S4YD0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VOSmUn+9oHRTOfVN5oCLoG4dqjig2uKa8vW+3vUujpqDbzZaKYjnWXP6yPkMXYAazwvqUHF/dbdTo9VlGGxn0RA4kqb2Y2YK12z4FKOPjawb557mMmqrdI6ZfX99QWcxdYZjUFywv8zz8rBavyxPo3UUai+bNUH6zmt77ULbprsRIk21JFk10bF9qDzu92s4HA/x9YuSPSoMnjaIBXK+oHGsrE1yrsvQuAO9kT+2c9fDeuo8VMlVe8WgSB7QaxyYDVjhZzQfGy/8aFuyvT1NNM7oCHYAQCys0EPeEr+H6O01AayvmIppSubqrd5KTyVsQ7/oIgp1Q2XyZ6mtmoTB2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=j7GsIbMv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3fxwizwykdk4gsobxquccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=j7GsIbMv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::649; helo=mail-pl1-x649.google.com; envelope-from=3fxwizwykdk4gsobxquccuzs.qcazwbilddq-rsjzwghg.cnzopg.cfu@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdV13jKhz3btX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:29 +1100 (AEDT)
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-20c56938075so15549925ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584728; x=1729189528; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5N9i4qcLR1M4w0icoJwy+0qPwifBeFycVmWqg2S4YD0=;
        b=j7GsIbMvGQShHHhbcxQBDIxL5drfkWkHbRkl7XTZxBwVBVYtPpn4oWgbKnuIFUyrUg
         DCsN0L4lyhk94cn6kq2lOshrb2f7ip0fRWzUQ9AkbNKzVgsZmXuaPYkQoqw1h9X84z4X
         3G7vW2+XIzHcXEm/S+5IpxZss6oWgnuIpFqm4/Vgpqko1fu25Wofuk3dF4q8678cj7EN
         9fpHrjGcc5GK00+aMku5ZCegoDBa5uOUrj9psmAZoXeewBJctxcOs047WF9dxedjY2wK
         Ec8NfoG+oDtw5RYuqeWVKVKMfH31CQwRc+N9aRpw8RYAKsmNby+U3bTaljoQKrACGqsU
         Y9oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584728; x=1729189528;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5N9i4qcLR1M4w0icoJwy+0qPwifBeFycVmWqg2S4YD0=;
        b=PC9Ngerv4s5A7zSJ6ZfLljYcZqajdYRTJHVdIg5+fS7BX/PsbF0/bU81h5salkPA3E
         rxwdqeBPU3rgIkL1hnUPEFcME7+kCXJuYGomgE/ksz48WsCBysauWQnAxwTYOB6Vk/B/
         7ytkkIxriV1rDd7t9leAVqJSJ38JAlRYaFzCJ2e6gGlbnAU0c4jkB5NkIT/sbeoAlvbJ
         WrIq5ZdHFR6PDTGPB0gUsoCxHod9Tfa0l9uM2lWE3AESmBguaQxY6feZCnmb3jUd1fkW
         YmaDxYuR+Zp83qpGRaVZglxQqmEoLPmD+VZeUR+cTsTALOxQNLH06oJsUSdLlLZ0bZUV
         nyRw==
X-Forwarded-Encrypted: i=1; AJvYcCUMemtD12i3MuQXZ+k8X5cfncIYX7qqt7e9fjdzSdaXAnZaQMW8sEXvFiiaNGC9FVy2T199c6nUZdQXAUM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzzRI60TXeVvUH97jyw+6PILnoooszFwydBQM3ZSJha9rG+ll/M
	Zq3xJoyzUppVPc8tVOo7oBV6+iqWoN8k5lXR08QvpEW4KF7aIBK7S4KPUgQFtmBUIK/7/Qtjz/s
	WtQ==
X-Google-Smtp-Source: AGHT+IHx3wOCIkhIacFyS0KkUCfogOtyOnmQIp9NOdA3rn83blMwYV/7exbhoH/uHIfky6alS3vCfOjmfpM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a17:902:d502:b0:20b:7ece:3225 with SMTP id
 d9443c01a7336-20c6358fdd3mr1169885ad.0.1728584727745; Thu, 10 Oct 2024
 11:25:27 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:19 -0700
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
Message-ID: <20241010182427.1434605-18-seanjc@google.com>
Subject: [PATCH v13 17/85] KVM: x86/mmu: Drop kvm_page_fault.hva, i.e. don't
 track intermediate hva
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

Remove kvm_page_fault.hva as it is never read, only written.  This will
allow removing the @hva param from __gfn_to_pfn_memslot().

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 5 ++---
 arch/x86/kvm/mmu/mmu_internal.h | 2 --
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index fa8f3fb7c14b..c67228b46bd5 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -3294,7 +3294,6 @@ static int kvm_handle_noslot_fault(struct kvm_vcpu *v=
cpu,
 	fault->slot =3D NULL;
 	fault->pfn =3D KVM_PFN_NOSLOT;
 	fault->map_writable =3D false;
-	fault->hva =3D KVM_HVA_ERR_BAD;
=20
 	/*
 	 * If MMIO caching is disabled, emulate immediately without
@@ -4379,7 +4378,7 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, s=
truct kvm_page_fault *fault
=20
 	fault->pfn =3D __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, true,
 					  fault->write, &fault->map_writable,
-					  &fault->hva);
+					  NULL);
=20
 	/*
 	 * If resolving the page failed because I/O is needed to fault-in the
@@ -4408,7 +4407,7 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, s=
truct kvm_page_fault *fault
 	 */
 	fault->pfn =3D __gfn_to_pfn_memslot(fault->slot, fault->gfn, true, true,
 					  fault->write, &fault->map_writable,
-					  &fault->hva);
+					  NULL);
 	return RET_PF_CONTINUE;
 }
=20
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_interna=
l.h
index 4da83544c4e1..633aedec3c2e 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -238,7 +238,6 @@ struct kvm_page_fault {
 	/* Outputs of kvm_faultin_pfn.  */
 	unsigned long mmu_seq;
 	kvm_pfn_t pfn;
-	hva_t hva;
 	bool map_writable;
=20
 	/*
@@ -313,7 +312,6 @@ static inline int kvm_mmu_do_page_fault(struct kvm_vcpu=
 *vcpu, gpa_t cr2_or_gpa,
 		.is_private =3D err & PFERR_PRIVATE_ACCESS,
=20
 		.pfn =3D KVM_PFN_ERR_FAULT,
-		.hva =3D KVM_HVA_ERR_BAD,
 	};
 	int r;
=20
--=20
2.47.0.rc1.288.g06298d1525-goog


