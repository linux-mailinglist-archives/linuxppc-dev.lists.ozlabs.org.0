Return-Path: <linuxppc-dev+bounces-2033-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B611999042
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:30:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdWJ621mz3cH7;
	Fri, 11 Oct 2024 05:26:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584796;
	cv=none; b=eGlnJ1DKFem0XqodolL08ifgfaAksKqp8HxOvpFEki3jnWkLBMODY8pgdoSjTO+UfucItxTXD22rRPIf+ni1ro1O7ZWHH0tdc76yOTZGg2EvfO9j3KmEi1vK8oyA5Vl0lCpD1miR5xB9NogruFqpR52bL3yDdsoqbhYIK8dqb0KjVmNovUySq/LyuhSrmxpYc2BsBPR82mP+NKgidgbRs+Z/8DTsmqlA1mTJ9x3Dka0y1Y0dOgt3HsGHqQKduwn0Z87/PJqE7MCZ/f2TQiS6HjXfYtJb4sUqn0uCEZTZsm+auHsb85TvMY4fWOKsVb7S5YNTZHsTHmEi+jrDhvtPBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584796; c=relaxed/relaxed;
	bh=BN+hsHae4h8wzhzshUJRGKM30XxzO0F311sC9z4rUGc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IqSAkCcnlzobdwg6tSUUxV3u1dFXB+uYDwRCqiLLZ84pdVwM8RNavhyx7qK08ol52OOOhrS5Q2yq4Wch7baRzwzaMiXnNF18nc6ErnTUdSP+HZMwL9+QlCPZ3I76ECQdIodc1zq2sUZy1SK76P1y/oFWN8tzJM1a6NdGphjiOZvO5iKJDkZn0Hld+0y11F/rzs3BLVZKoEI2Ae7OmIbs6KaMwTYoazchL3NPChnK2Fd8LDpborS6Btd82E6CvV3clCbU/rcq0FegNt838Td0W7s1svb1ak/aVhCtDiLqca17M9R8xJR4RHIwq6g7hp9hXEtcGli2XkVtzLtcrbdu1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=wrldRygO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3wrwizwykdpakwsfbuyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=wrldRygO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3wrwizwykdpakwsfbuyggydw.ugedafmphhu-vwndaklk.grdstk.gjy@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdWJ0WHBz3cK8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:36 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e1fbe2a6b1so23282217b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584794; x=1729189594; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BN+hsHae4h8wzhzshUJRGKM30XxzO0F311sC9z4rUGc=;
        b=wrldRygOiiiQYcO14F+jbEaSRtMUOplMxGei2YrtD+MUDgt37syoivBQUS+O5O6Xqa
         RLvxdOTUFDhyOB0Owc67lQko2EqheAujsy2qmqvLlPolzBhBkTWX74E6KavopA2S/X+j
         0OztF4O6hLZRCVybhDIoFiceAoBPSusQ1uemS31EdbZHvAXlzkFa+pp4H/HvN3I7+eSW
         npvMwWppuj0ThPQoxq4d/qPvtttA567X2vx+l7I+qnepjzZyFHvunUaI9ibnhBFkiHFp
         LJEBC7F0f/a8p99hvlbM9iJkZGAgq/L6EcKW07qGnZ2lOnSGVxtO26s3tqDjSCdN0LU/
         K1hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584794; x=1729189594;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BN+hsHae4h8wzhzshUJRGKM30XxzO0F311sC9z4rUGc=;
        b=G1v//0BxbPfBMPtsrJL1CBfEOL4gMJMFaMmfhHQ6mPz4calkLmNSAEO/vM+zOf16Ea
         yeDYLBhd4QD4Rho2JOjxqpQ0HptTSFgYyh2htKVYp2bAfqncHF+z9/5e9ItV6Q8L/g7/
         +a+UXR+Sg/jPVtQG0FPmP+AFAYeRfNiqgfJjQ8Kb4k7pSnqS4YS8Vz77xHrd2OwqeGl3
         fnTXvwarULtWs6si42uI80n78KK4BpBJLdcyFD09tTxm89KYsk/38JdmEYCEsUBrs+Bu
         2vUFGFnh9anZLOstiblv/Q33NaPwP6Ufztby5zGZW2WCWx0yviMmkm9y19h3ueSnxkk8
         /MNg==
X-Forwarded-Encrypted: i=1; AJvYcCVQJGwghgr8N8nC63TeIPF+/UivynxgJfhO9ZfVMhDG8grgogVxKOZJufsadPBqaMrJAIymizZZC7dR8xk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzXVALQqC3DEwzrrmDOwYLc1Ep6A8krtT4cxnRc3h4Y3WNZBAbz
	rNixh5Ytepu0f5SEdSpqdDUkIc1EAONtfLVc/YamCAfT3TBrw3zQRu3vl6CsQidFNVPEFYMOMWn
	TdQ==
X-Google-Smtp-Source: AGHT+IEjw5s9ln5Mmco0bHKHDYNNIWwRc71SIREcZZABOz/fcRYPRAU5+BeNEqASF/uZrX6+QTap8C7eoHE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:2c01:b0:6e2:3e17:1838 with SMTP id
 00721157ae682-6e3221407b0mr440167b3.1.1728584793806; Thu, 10 Oct 2024
 11:26:33 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:50 -0700
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
Message-ID: <20241010182427.1434605-49-seanjc@google.com>
Subject: [PATCH v13 48/85] KVM: x86/mmu: Don't mark unused faultin pages as accessed
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

When finishing guest page faults, don't mark pages as accessed if KVM
is resuming the guest _without_ installing a mapping, i.e. if the page
isn't being used.  While it's possible that marking the page accessed
could avoid minor thrashing due to reclaiming a page that the guest is
about to access, it's far more likely that the gfn=3D>pfn mapping was
was invalidated, e.g. due a memslot change, or because the corresponding
VMA is being modified.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index f9b7e3a7370f..e14b84d2f55b 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4386,7 +4386,9 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu=
 *vcpu,
 	 * fault handler, and so KVM must (somewhat) speculatively mark the
 	 * folio dirty if KVM could locklessly make the SPTE writable.
 	 */
-	if (!fault->map_writable || r =3D=3D RET_PF_RETRY)
+	if (r =3D=3D RET_PF_RETRY)
+		kvm_release_page_unused(fault->refcounted_page);
+	else if (!fault->map_writable)
 		kvm_release_page_clean(fault->refcounted_page);
 	else
 		kvm_release_page_dirty(fault->refcounted_page);
--=20
2.47.0.rc1.288.g06298d1525-goog


