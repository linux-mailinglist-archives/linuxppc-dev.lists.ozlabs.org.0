Return-Path: <linuxppc-dev+bounces-2036-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75021999048
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:30:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdWS1ppmz3bkP;
	Fri, 11 Oct 2024 05:26:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1149"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584804;
	cv=none; b=IbSQdAP/s01oIyQThsVCeAVwhpuBdwe4Q8h/VbnL6lcF+9PaGqEuLkTmClh7SEJdRyf+QX4Lan9qoZsjIQKPdENXEGEOuNqsjlq7dhQXCs8AkT8LOL9tN4GrdSW/0Ou2l2Y0/Jxl6l5Tivv/LxyTImbUINOz+VGxDjCyeQwOdrnTgv6Ad+W4KcFNJTqjspwz3+ajdc6H0+TwK4c7zvLsodJvTyULi+I0oraluDeAOBQGRhdKNdUwdToiGQ9n8+8iB3zAe+05eFhOe+ZQr15E+utPw8EPvBOIP9+ZDbgV7UJafN1WCA0Ssonxui/OQ+PS7/KkUCQXTEMWA8MXCUv9tw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584804; c=relaxed/relaxed;
	bh=W6Zzl9AmyqedpEIwNpLXiwPcmrnHw6ZPa/9pyFpLcZ0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=O2T8h56z41VUHljsL8S8n5MVpmBFeyMjFlhdKNqla/7+xClPITeC7Y310kAHeu1D0eLzNIILph+uFZntV+nD3Hr5io6khoIc/kRvB6tB7WPESkuRQRcOx+znroj4jz75Y/PHwkLsx3i4CNWMYL9zQOlfvN0i61b9bUZGFgl+6xz+DSUQ+6+5aztmiJ61QxOCKpb8TAwUAOwk2pTZPPK9nHylIwl5ytuaHqAC9plbXBuHNz6hWWsrGT/ycNl32n5r+OOZRMK6cvmFa96I+ooLZGmuY45VjGKwwXHjOnZW/ghyMv9W15rMm4o1YFh96aXeQJXT3I7BUtMnAFdayxoa9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cKvZQQwr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3yrwizwykdpgxjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=cKvZQQwr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3yrwizwykdpgxjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdWR1v5yz3bqq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:26:43 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e3245ed6b8so23856757b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584801; x=1729189601; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6Zzl9AmyqedpEIwNpLXiwPcmrnHw6ZPa/9pyFpLcZ0=;
        b=cKvZQQwrlVvyfTwQu6eK6NdbQtat5rdOGwQxo5yHqhSQsv1niMlrPCQLG9GGF3hcq5
         tQXH+8V9Umz0y4L0xd9tb+ye/gyzhvy0ets4oJ65375MHtuyOlcUw+Zd3CgKAy2dgkFq
         7lhVKDR/MiGOxlmWcGU6HIhpLpnLqrjbmhZhSkUIHUJMfRIRUPsaikjUQrVJnliMW1qX
         0cK8dmQMTJ5RLMFe7SjXFaVPrl7uVbQlfkrv6v4MBXykgp/he0eFW7C7RR7VsJdmAvdm
         YeVXYJgtpJc62WiRQl084aSC4VLRW2G1THr3YrVbQ9XC3Tl0lCNRtqQWFXzEAUH2mDoN
         5iyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584801; x=1729189601;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W6Zzl9AmyqedpEIwNpLXiwPcmrnHw6ZPa/9pyFpLcZ0=;
        b=n4KRMMBhlFzj/sZanSmnwTZ4lxLrWsx/AQbeLwKdaBwotZCcXb3stFqZoxOhiDnHw7
         T8bYViz+uu7pM4YzSGFC1rMdnn63zvyYzQz/DQ4Y3LjOjrO5oWZqp9LQJGbcVL978oxA
         FAo0YTZ7dM2Pm1QASvY4LOKwM5T8JFbHq7ZdlDk33Jzqq89JXnTF30Maet8EXrd1QyoV
         yQ7MK7SXyXnY2beXvJfwCTv1W7SVhsn0D1i5o8IaBZPx4IWtqXyuJB3/dgUnJ7luiMVy
         1BnJkwMLi7+C44PWdDaxCZWy31aqG7u2bgEutXfN0WrC2JfBDl6SDht6wb1rrsxtDPjf
         3pWw==
X-Forwarded-Encrypted: i=1; AJvYcCX9wuDUr1Q1K8DscTPKZ/fwsVQE/gW/sD/Xs+w8WDefVkVaaCPQMJUsCA25MM226j/zhL2mLmBM7uBVj8s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxTJhhjjSjdNXNLk4nN7nF8wMYIMftsowSeM2xehlO6+49gvQ/2
	+4/qJ4qzpB9j2MCSoeCBSSjXC0diVqVKom0YNVCLzsf4sftgvJI9W/qGVmS7etuqSNJUmAlYu+Z
	nTA==
X-Google-Smtp-Source: AGHT+IGFUTZueI+Si3awRWj8jA+YGlhXMEzUcm/2nm7iA7dHF8070ZlvI1MSF0nUJUhFBhXPPz9v/uVg5Fg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a05:690c:2f08:b0:6e2:2c72:3abb with SMTP id
 00721157ae682-6e3224db667mr816567b3.7.1728584801239; Thu, 10 Oct 2024
 11:26:41 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:53 -0700
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
Message-ID: <20241010182427.1434605-52-seanjc@google.com>
Subject: [PATCH v13 51/85] KVM: VMX: Use __kvm_faultin_page() to get APIC
 access page/pfn
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

Use __kvm_faultin_page() get the APIC access page so that KVM can
precisely release the refcounted page, i.e. to remove yet another user
of kvm_pfn_to_refcounted_page().  While the path isn't handling a guest
page fault, the semantics are effectively the same; KVM just happens to
be mapping the pfn into a VMCS field instead of a secondary MMU.

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 851be0820e04..44cc25dfebba 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6790,8 +6790,10 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *=
vcpu)
 	struct kvm *kvm =3D vcpu->kvm;
 	struct kvm_memslots *slots =3D kvm_memslots(kvm);
 	struct kvm_memory_slot *slot;
+	struct page *refcounted_page;
 	unsigned long mmu_seq;
 	kvm_pfn_t pfn;
+	bool writable;
=20
 	/* Defer reload until vmcs01 is the current VMCS. */
 	if (is_guest_mode(vcpu)) {
@@ -6827,7 +6829,7 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *v=
cpu)
 	 * controls the APIC-access page memslot, and only deletes the memslot
 	 * if APICv is permanently inhibited, i.e. the memslot won't reappear.
 	 */
-	pfn =3D gfn_to_pfn_memslot(slot, gfn);
+	pfn =3D __kvm_faultin_pfn(slot, gfn, FOLL_WRITE, &writable, &refcounted_p=
age);
 	if (is_error_noslot_pfn(pfn))
 		return;
=20
@@ -6838,10 +6840,13 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu =
*vcpu)
 		vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
=20
 	/*
-	 * Do not pin apic access page in memory, the MMU notifier
-	 * will call us again if it is migrated or swapped out.
+	 * Do not pin the APIC access page in memory so that it can be freely
+	 * migrated, the MMU notifier will call us again if it is migrated or
+	 * swapped out.  KVM backs the memslot with anonymous memory, the pfn
+	 * should always point at a refcounted page (if the pfn is valid).
 	 */
-	kvm_release_pfn_clean(pfn);
+	if (!WARN_ON_ONCE(!refcounted_page))
+		kvm_release_page_clean(refcounted_page);
=20
 	/*
 	 * No need for a manual TLB flush at this point, KVM has already done a
--=20
2.47.0.rc1.288.g06298d1525-goog


