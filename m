Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 212C393DC8B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:27:11 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tFE+tag8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW56P0M9Tz3d8B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:27:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=tFE+tag8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3kjekzgykdguvhdqmfjrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4NX2FwZz3f0P
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:54:20 +1000 (AEST)
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2cb6c5f9810so1641847a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038059; x=1722642859; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=TqUPaGEc7V7k122pX7jZuWDsKBXmCX3Y3KCoLsEzljY=;
        b=tFE+tag86CHXAPqyyREUUNW2HW1CmV5lXeOuyZdQ/TZErDKXlN11xKCi9oAzA5l2Sr
         oSWCDQlyU/eRrWM/Yl3dAKkpkAEQgeBIzt2Qbg/jrCPSICQnnT704pNxkOkYM5puEiGl
         rI8pFR2cYi/BVwciF1fC4ITZFF3iKXNzcIXoG2nxc/IxPPOSSJzDhxU6xK0OsgJfFn5r
         qyq2ot0azM5mPAKpjoCmLISwAUpBUhZRGr5zOo1vPxV0aPKClXcd2waecIjRTG22yt0f
         4P9dZ94Ane5r0/+8vbloQD6ZGWR/CQa/MS49tPYNUNWZJzXsqQ77jF+vxbtWVHqYvYst
         DXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038059; x=1722642859;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TqUPaGEc7V7k122pX7jZuWDsKBXmCX3Y3KCoLsEzljY=;
        b=S6q1Wj0TbkCJwANJxHCbUpiUx8U+imRhBh91Y8faNHXPR80ZBMHck5cCwU3crAte/c
         poy0fbQKfc2kwrQKQqmM9nqXKV2ZYawflOFMpGcn63a3zenTCPwhmwM6eFkvw/ATwb8y
         i5KLvKehdPXuX930aQo250bH4h9LiYRbHpwJJRvXnEj+xH630mS4Q5MynzB5gcQWCvtY
         qwwdqdYmwltn60zcAmRZNYe3L2V7PJurvJP00TN89WqHOJLJFMY0cy2FLwmTjox8AIBW
         OHQZIi0bsO6ahqliRWyJ7aR1F0WPwq+5rOsT5M+uoQQp5WfJuoLrgwf+pkjjeLC5udR9
         WaSg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ8QkDbl6+Vdy+TALkfdeEv3SRKhCt4h2+C5rTgF8e7ZhbUIvKDHvvLqk97ZOJXAdLEf8h80FeZQmQLMl/HaYhnHpefd0Udg/WzK8p5Q==
X-Gm-Message-State: AOJu0YyE8H6my66MWx7Fy8kUmtpoPtU5vNAAcpViRJx/sU39ayvQx5WK
	vDCcHlvSn9wSKmBOVAyNwIPNlJN8PvwN5d/xxsGB8/RDLNLXpWgWxvqHTt/68ENr6IKgjBrViNG
	D1g==
X-Google-Smtp-Source: AGHT+IH7R2Sq6ws3raxo/M+HjUZh8HrSGcUFKZNBVKBew2cgXvpkeEwYajfUFO1jgdCm33mambqvR7vew2A=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:19c4:b0:2c8:8288:1f3c with SMTP id
 98e67ed59e1d1-2cf7e08defcmr21966a91.1.1722038058548; Fri, 26 Jul 2024
 16:54:18 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:58 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-50-seanjc@google.com>
Subject: [PATCH v12 49/84] KVM: VMX: Hold mmu_lock until page is released when
 updating APIC access page
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Reply-To: Sean Christopherson <seanjc@google.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, David Stevens <stevensd@chromium.org>, loongarch@lists.linux.dev, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hold mmu_lock across kvm_release_pfn_clean() when refreshing the APIC
access page address to ensure that KVM doesn't mark a page/folio as
accessed after it has been unmapped.  Practically speaking marking a folio
accesses is benign in this scenario, as KVM does hold a reference (it's
really just marking folios dirty that is problematic), but there's no
reason not to be paranoid (moving the APIC access page isn't a hot path),
and no reason to be different from other mmu_notifier-protected flows in
KVM.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index f18c2d8c7476..30032585f7dc 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -6828,25 +6828,22 @@ void vmx_set_apic_access_page_addr(struct kvm_vcpu *vcpu)
 		return;
 
 	read_lock(&vcpu->kvm->mmu_lock);
-	if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn)) {
+	if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn))
 		kvm_make_request(KVM_REQ_APIC_PAGE_RELOAD, vcpu);
-		read_unlock(&vcpu->kvm->mmu_lock);
-		goto out;
-	}
+	else
+		vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
 
-	vmcs_write64(APIC_ACCESS_ADDR, pfn_to_hpa(pfn));
-	read_unlock(&vcpu->kvm->mmu_lock);
-
-	/*
-	 * No need for a manual TLB flush at this point, KVM has already done a
-	 * flush if there were SPTEs pointing at the previous page.
-	 */
-out:
 	/*
 	 * Do not pin apic access page in memory, the MMU notifier
 	 * will call us again if it is migrated or swapped out.
 	 */
 	kvm_release_pfn_clean(pfn);
+
+	/*
+	 * No need for a manual TLB flush at this point, KVM has already done a
+	 * flush if there were SPTEs pointing at the previous page.
+	 */
+	read_unlock(&vcpu->kvm->mmu_lock);
 }
 
 void vmx_hwapic_isr_update(int max_isr)
-- 
2.46.0.rc1.232.g9752f9e123-goog

