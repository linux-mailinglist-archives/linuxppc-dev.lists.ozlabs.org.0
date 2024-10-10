Return-Path: <linuxppc-dev+bounces-2055-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1874E999072
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 20:32:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPdXD0dy3z3cSJ;
	Fri, 11 Oct 2024 05:27:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b49"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728584844;
	cv=none; b=RH9ojjpU3G6b790eUwsR/e+cdgmp3KK/kg6926FFAJc1Tf/rks5dkkT0WZhA44XS6svT9Gcylnkq0q142NpyJpXRyEJuKcxpfbt3I6o4DZDBea28ma3UuZrF8cn1anzthPSTsjpviRCcxCAsJOnWVmK4MLfXfR7AI8TCVMYYUXEJKkVMxt/4+r9riLjehAlnMoznKkg3DK0ZuOMstT7fwwXlYacqWpp/AWg//vRfBHRReNAdgO3RqeNalWhdHPmQWd950xQqxH0dqqjRfNOwqu2CwvELrN8Xb0SGpjvhAU6zD+x6R4AhcKDg+0W+MIYrsmrLPZa4CofzGAMaBmIcMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728584844; c=relaxed/relaxed;
	bh=KbunjaDKwfDzESX7bCyZnVXI4Jj60WAsli6cgjlK44o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PfQrR8SnVpkF+6WPq2eKL7r9UQaYUewwLmECNrkFgckppJS5hhgbP875WwL1VbtztjOJrqeG9Gcs/EDVt7BUF1ILF936agCyttxXjgFzS13Rq+4uXeIhFITHGw0/NHFdMQZ2eSFmFYSHdOen9rRlOxLafUKdDaBN3GJKbeyal9nRNpS4GhAdf/fGyNHnHQWCBxpyCdCt7L4D4wQWx/ZN5rhfNtiBB+Jk7NdL3YbCm7krngR914DLH66gFSVC2W6611pthheHEYl4e3MGgCO8aAxa0XH57IHIXzzovsggfRzvykSXkPyF5ow39aPey5lQYDxfVcbsZWI+6A3f+g7nLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=LyQCsoPU; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3hxwizwykdcaoa6jf8ckkcha.8kihejqtll8-9arheopo.kvh67o.knc@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=LyQCsoPU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3hxwizwykdcaoa6jf8ckkcha.8kihejqtll8-9arheopo.kvh67o.knc@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPdXC0fDbz3cRF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 05:27:23 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e28fdb4f35fso2112491276.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 11:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728584841; x=1729189641; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=KbunjaDKwfDzESX7bCyZnVXI4Jj60WAsli6cgjlK44o=;
        b=LyQCsoPUfrbFpiBgazJWDMiQEuN6el+ciQc2dmpDYmY0fSDN8pYkYa6JPNUQaaWdym
         Gerw7WfQ/feeZvQdwvrD2TSmTPHi1cv13zTLO4PYsT3cMaRJKYvUXDae6AFnxqKqVMfy
         if/A/JzTlheRx4G1gTkeYWezbJUiAUMrrBydLz2B89xrzUAMVRuYukHNZtFSnkZ0Ul+D
         n/+2RI99Vy5zXHUpIe7Jybz93DSIgm0BWkCONw6bRQGORdpW8DsUDwvve2PgHDKB2ZPb
         KPat51UhZlTtxCn3T+rH0j1YgIG9i4Bzh7oDeI0kUWATZQCjo72ZZziuSY/xlVlJ9xI+
         gNiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728584841; x=1729189641;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KbunjaDKwfDzESX7bCyZnVXI4Jj60WAsli6cgjlK44o=;
        b=lG5XyEoiI6q+21ZdtS7gxnEEodXIfGAm75YZA5tfbDATzS1AhOnH/N2/KZwwUwBka+
         NFLc7f9IeNPeGF56kdEKIFKJb37b0lSmnFOyKSrhsn1SMM20ENoVy4PtJHdIVXSDqlzv
         LA58cXMmgD5YX3WWUbpkzjSyv74+TCpOOIY2Ze4uxYmrYCTQUXgVsd+a3qFX+DPyS186
         Cv2aYsREA2/qFbGxqMYFOwUwnt7g6uo5YmlMSY3+pcQNgCFyD2UUVuAAtl0ycyKp0R1I
         BMnHzG45G+qnqQasALv90TrfWRLmNWRSgDGwFChigDzB8jzA5VYaahGN5ulq/ttkStCr
         Gt2g==
X-Forwarded-Encrypted: i=1; AJvYcCXdmS57HSkpvNnSv9f3mA2MevH7qVbdlZpKXIwMRq/BT+wheWsgBpzIBh9/7iZX4aFgt7tabXPkn7TgUWI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwkVbNa04Jx4CbOY1y2PnqddVX6r45yF9lGXx/mxMCQI09sn1Oy
	c91bWeGQVW7Hxp2v3iBIBOFYlkwB3H0B5PC6qBPZpdb8QfPk3j0C1u0Y70urzVDQWd4fLw0K3VE
	h8w==
X-Google-Smtp-Source: AGHT+IEbamZE/KJDJ4kw63fZFZN0PThnG54xKd82AQ09AwFkx3KIodEPvEqsDBHZyT6DCHkY/GuTD4px7aQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:9d:3983:ac13:c240])
 (user=seanjc job=sendgmr) by 2002:a25:6c05:0:b0:e24:c3eb:ad03 with SMTP id
 3f1490d57ef6-e28fe540170mr1289276.10.1728584839383; Thu, 10 Oct 2024 11:27:19
 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:12 -0700
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
Message-ID: <20241010182427.1434605-71-seanjc@google.com>
Subject: [PATCH v13 70/85] KVM: MIPS: Mark "struct page" pfns accessed only in
 "slow" page fault path
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

Mark pages accessed only in the slow page fault path in order to remove
an unnecessary user of kvm_pfn_to_refcounted_page().  Marking pages
accessed in the primary MMU during KVM page fault handling isn't harmful,
but it's largely pointless and likely a waste of a cycles since the
primary MMU will call into KVM via mmu_notifiers when aging pages.  I.e.
KVM participates in a "pull" model, so there's no need to also "push"
updates.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mmu.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/mips/kvm/mmu.c b/arch/mips/kvm/mmu.c
index 4da9ce4eb54d..f1e4b618ec6d 100644
--- a/arch/mips/kvm/mmu.c
+++ b/arch/mips/kvm/mmu.c
@@ -484,8 +484,6 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 	struct kvm *kvm = vcpu->kvm;
 	gfn_t gfn = gpa >> PAGE_SHIFT;
 	pte_t *ptep;
-	kvm_pfn_t pfn = 0;	/* silence bogus GCC warning */
-	bool pfn_valid = false;
 	int ret = 0;
 
 	spin_lock(&kvm->mmu_lock);
@@ -498,12 +496,9 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 	}
 
 	/* Track access to pages marked old */
-	if (!pte_young(*ptep)) {
+	if (!pte_young(*ptep))
 		set_pte(ptep, pte_mkyoung(*ptep));
-		pfn = pte_pfn(*ptep);
-		pfn_valid = true;
-		/* call kvm_set_pfn_accessed() after unlock */
-	}
+
 	if (write_fault && !pte_dirty(*ptep)) {
 		if (!pte_write(*ptep)) {
 			ret = -EFAULT;
@@ -512,7 +507,6 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 
 		/* Track dirtying of writeable pages */
 		set_pte(ptep, pte_mkdirty(*ptep));
-		pfn = pte_pfn(*ptep);
 		mark_page_dirty(kvm, gfn);
 	}
 
@@ -523,8 +517,6 @@ static int _kvm_mips_map_page_fast(struct kvm_vcpu *vcpu, unsigned long gpa,
 
 out:
 	spin_unlock(&kvm->mmu_lock);
-	if (pfn_valid)
-		kvm_set_pfn_accessed(pfn);
 	return ret;
 }
 
-- 
2.47.0.rc1.288.g06298d1525-goog


