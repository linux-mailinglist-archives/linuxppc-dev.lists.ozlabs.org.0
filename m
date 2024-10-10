Return-Path: <linuxppc-dev+bounces-2010-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98810999013
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:27:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdVM4NhGz3bmS;
	Fri, 11 Oct 2024 05:25:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::114a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584747;
	cv=none; b=cz6f93i1SM+wSnGS/GFeBjeyDJBdwJZeqnaIuAQ7Aj2ytuOidqEs5I3qNfvR0Ra5uSkR/p6YOpC4fa/ALEIXEtYjdOS13G8cjOj1POle8tEIEPakf07tYAV/51SXs4pK7X4zksbO4SRhCZ5oDzc47WmX1hQDk3+7maVB9VAsus+3CoNDSWNdr+Tj7IAZmvC5mscu+MiSQ/EVpFFJ1opYYRZcGq9y32wWodnMZIYy2XDo0ASFitXLy70WgGC9zi/kCWDuLbdVOZZLCx2FClCGbeIUzk3+ZidP75TazDkGFEBc7s7luy9Zk0WZaFWLqM336gPo88smljoVT0zB60U7BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584747; c=relaxed/relaxed;
	bh=xnti8P2TQudE7lvlkZdCl8Wq+TvGW4tpGYbCykNWsXw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QdLxT2LnzmNhnfGh1xQKnPJOy/qJdCbZzUIyY11ALVmpg9e0hwY8smsuHjOmMZXy6fOibbIx91twMZdq7cw+dwx1PW3/wesXrlwtoyF7iCfoX6AtkKxyJ7R/1jNtwASZh38LmyPXyhdxg/HsEygnjk+CcC16tjTdmQQM40lM8x6eVQs+OL1DkfqJSC5yKDUUPaKIoHz+QP3qpf1V9Us52PIUq266Hg41AyC5MGyAGLeAcVK1IdRYdSnpcLCMU0gRl4gMVO4h8SQDz3AghjU14AKLRerrN5KrU+SYRyVVmhJg1Vmzeue1j0FFftniRNHS6BQDxxpQPIepAlmvYJfVtg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=IO8pB3Jy; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3kbwizwykdl8xjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=IO8pB3Jy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3kbwizwykdl8xjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdVL4GHRz3bjg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:25:46 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e25b39871fso27044067b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584744; x=1729189544; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnti8P2TQudE7lvlkZdCl8Wq+TvGW4tpGYbCykNWsXw=;
        b=IO8pB3JyRF/QZs5IM+u5jmcLWEIQRyyla/rGjG0vxYQMgowjfpyL47P5vk06M2kRoC
         VBUqpcft4saOH8l+JfVhYu26beR8mhRi6VjJF6aRnwMb7mM81BbEd+sABF+h28p1Dhjl
         vi1PH2JGyz777nNsI1EQsNao8c7otN2HzB/z93cRtoL/soOHXfz8694K0cWxvrA1XUhU
         lvNdhxdo8XhTj+s9XVfpmpIT4uuFErZswmC4oyDEk3KnVzp/FarS4UeOqZRD/ZWzuTwY
         BVyfqwutRC0E3d15ergl/4cEURFMX54kr0T1esy4gU9Hd3ogif8QO8NOGXE8n/YdwfWx
         LfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584744; x=1729189544;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xnti8P2TQudE7lvlkZdCl8Wq+TvGW4tpGYbCykNWsXw=;
        b=PzGwIJOWmPGGqCAWVrfPKfgdxqFRHQtxaaZTUBWM4fie685nZvOrTn0BCdbPMtbkZp
         eJKPaOYkHr0SlhxPINY/sAf4wTNC7bcshKI9L9F41E48dp5r8NWLyV+ZgdqSlCWqh1pX
         SJgvNnXKpqyZI5u+JXmYxNGpzf4vgeSsR7UNXEU5BK5nSO6uGVuvlqw4WLcrvx94G5rX
         iBZKColF2fhVNHKFFKtsT3LIEkl2xfBhbqRx/mkvAKzkkA0WC2on1Q47nxl9jUhystoA
         qT8VGSNKmOZLjcyXenaD5qBcWbWhpsmIafpI8/f/MBdWkq2I3kLZmXKpM76/nz3TDDGj
         mWEA==
X-Forwarded-Encrypted: i=1; AJvYcCUAe1v8TTtX7bzgwBH07agVwDcJRfpKng2eVRtbeJOP50vZvNtD/1indf/Qv6H4TYlzbGdZxmNVYgkZREU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy14j0eo3OYSJhW4DrSPCOP4h+HMrHvAq3xy3TVvXyqIMyWp991
	QlrBja6860I84tpFJl5kjgdQaYCmtMXlmr0DjgALC1agtWk5jbUgdRUG9qEvUAugW9nNNGXvAtB
	MRg==
X-Google-Smtp-Source: AGHT+IEdX//xUJq0LlzHSFsWnzcNANrEE9KtnndGvFzP5BAu23zXYFVXA6eeBi51F5M5i08FgAsxiLe5HbY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:300b:b0:6e3:f32:5fc8 with SMTP id
 00721157ae682-6e32217bbe0mr502817b3.1.1728584744665; Thu, 10 Oct 2024
 11:25:44 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:27 -0700
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
Message-ID: <20241010182427.1434605-26-seanjc@google.com>
Subject: [PATCH v13 25/85] KVM: nVMX: Add helper to put (unmap) vmcs12 pages
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

Add a helper to dedup unmapping the vmcs12 pages.  This will reduce the
amount of churn when a future patch refactors the kvm_vcpu_unmap() API.

No functional change intended.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index fb37658b62c9..81865db18e12 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -314,6 +314,21 @@ static void vmx_switch_vmcs(struct kvm_vcpu *vcpu, str=
uct loaded_vmcs *vmcs)
 	vcpu->arch.regs_dirty =3D 0;
 }
=20
+static void nested_put_vmcs12_pages(struct kvm_vcpu *vcpu)
+{
+	struct vcpu_vmx *vmx =3D to_vmx(vcpu);
+
+	/*
+	 * Unpin physical memory we referred to in the vmcs02.  The APIC access
+	 * page's backing page (yeah, confusing) shouldn't actually be accessed,
+	 * and if it is written, the contents are irrelevant.
+	 */
+	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, false);
+	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
+	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
+	vmx->nested.pi_desc =3D NULL;
+}
+
 /*
  * Free whatever needs to be freed from vmx->nested when L1 goes down, or
  * just stops using VMX.
@@ -346,15 +361,8 @@ static void free_nested(struct kvm_vcpu *vcpu)
 	vmx->nested.cached_vmcs12 =3D NULL;
 	kfree(vmx->nested.cached_shadow_vmcs12);
 	vmx->nested.cached_shadow_vmcs12 =3D NULL;
-	/*
-	 * Unpin physical memory we referred to in the vmcs02.  The APIC access
-	 * page's backing page (yeah, confusing) shouldn't actually be accessed,
-	 * and if it is written, the contents are irrelevant.
-	 */
-	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, false);
-	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
-	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
-	vmx->nested.pi_desc =3D NULL;
+
+	nested_put_vmcs12_pages(vcpu);
=20
 	kvm_mmu_free_roots(vcpu->kvm, &vcpu->arch.guest_mmu, KVM_MMU_ROOTS_ALL);
=20
@@ -5010,11 +5018,7 @@ void nested_vmx_vmexit(struct kvm_vcpu *vcpu, u32 vm=
_exit_reason,
 		vmx_update_cpu_dirty_logging(vcpu);
 	}
=20
-	/* Unpin physical memory we referred to in vmcs02 */
-	kvm_vcpu_unmap(vcpu, &vmx->nested.apic_access_page_map, false);
-	kvm_vcpu_unmap(vcpu, &vmx->nested.virtual_apic_map, true);
-	kvm_vcpu_unmap(vcpu, &vmx->nested.pi_desc_map, true);
-	vmx->nested.pi_desc =3D NULL;
+	nested_put_vmcs12_pages(vcpu);
=20
 	if (vmx->nested.reload_vmcs01_apic_access_page) {
 		vmx->nested.reload_vmcs01_apic_access_page =3D false;
--=20
2.47.0.rc1.288.g06298d1525-goog


