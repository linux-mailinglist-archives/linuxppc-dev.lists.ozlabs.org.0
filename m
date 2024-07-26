Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB5593DC7F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:23:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fwjCg7XO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW52R20nKz3dV3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:23:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fwjCg7XO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::54a; helo=mail-pg1-x54a.google.com; envelope-from=3idekzgykdfsl73gc59hh9e7.5hfebgnqii5-67oeblml.hse34l.hk9@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x54a.google.com (mail-pg1-x54a.google.com [IPv6:2607:f8b0:4864:20::54a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4NL68TRz3d9V
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:54:10 +1000 (AEST)
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-721d20a0807so1376038a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038049; x=1722642849; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=kZSI1KNdqk//fOFhZYsFCszCldNWPUNapLOmZmlQ+ic=;
        b=fwjCg7XOB2nJtfDXM0UODp7Zifx8cbQsVldBGZfLHSOzkXbZ9vt3NDYgJzT1U3KaLH
         4nlclBXyO5eL4bhwYYoLWzLznY3JCHZ/3qTeFQ8LdElBIP4ipIea8kFNN00ucAkihomo
         cMDGLcrPER5TUfuOC2PLYbZa2mp0o8/55KvNjBwB5kSlP6jvy3BYb3++IqCUYIq/dQX/
         ensOZgfO2QkXG1zn/KY4oA4XAaL50dKdCViqhHEDCmnRWjzcmT0StDtB4IjJ131fz0m/
         tUmm8Wg6gyGqHUCplkxjNwkGSobXiPQsZwOnnrkBvSv0qMFOkLhvQKZ1Rn2+XC1ZYCpj
         EoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038049; x=1722642849;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kZSI1KNdqk//fOFhZYsFCszCldNWPUNapLOmZmlQ+ic=;
        b=ZR7hmBJKcmFm7UYMri1ZVY1Me5ttVo+Fm76fW/kUu8uL6LIXLkPWnEN0VUbcJBUxEC
         ObCvlLZzBasLpj0UnCUfr1jbA4VQSgQkbJh6V0NU/UllnjL/CxWjtIxt3hosS05IgXk7
         l4JJLrDpxF5JYOtwtFa4ZYRBAbg6GIqGnP2BUnHjbBLCG7MpNKMgDOfyfeI9ywj8uhvm
         nVADb60cqehRVMMetdMpFW1yY7vZISk12o4gyqVwiHpTCTY8nd2C8hBmsgxxKTvTQBRw
         ZO5i/IpFgMoTq1hLcrwfs0kGhw5sZUtQVE8IchoJob7gJf/mNFxW/10fqnEDsFmQ23oN
         VMag==
X-Forwarded-Encrypted: i=1; AJvYcCUnpAvoeBuR0FjVe8BRia5NVNccHh6qzN1h3Lwu+1s1HLtTpIHjfqTe6cGVkuuPG8L3Sl5F9ueODdAPta+5WYTxCKHviq6VI3VwnQxuvA==
X-Gm-Message-State: AOJu0YxwtjDXV8rapUUQDZJu5qLspEs0YRrGk2pkyvxjpYG2PDwH45Gf
	kJcmeKy2CBBgMontdojKa+N4kkxSv8jG9mQTgeyZu7vWSZjOvEUHjGkmsOaUcVkKa6x5mMp7wAK
	/tg==
X-Google-Smtp-Source: AGHT+IHwPJ/UM6h8kXfIVs09j5bz4zlDvOcU2rq/epWSbhMGMPOGMhlwxlAMNu8ktgd9HGr+mJ5fl7Shz2c=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a63:360a:0:b0:7a1:4462:412e with SMTP id
 41be03b00d2f7-7ac8fd30864mr2218a12.9.1722038048851; Fri, 26 Jul 2024 16:54:08
 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:53 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-45-seanjc@google.com>
Subject: [PATCH v12 44/84] KVM: x86/mmu: Convert page fault paths to kvm_faultin_pfn()
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

Convert KVM x86 to use the recently introduced __kvm_faultin_pfn().
Opportunstically capture the refcounted_page grabbed by KVM for use in
future changes.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c          | 14 ++++++++++----
 arch/x86/kvm/mmu/mmu_internal.h |  1 +
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 7e7b855ce1e1..53555ea5e5bb 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4369,11 +4369,14 @@ static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
 static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
 				 struct kvm_page_fault *fault)
 {
+	unsigned int foll = fault->write ? FOLL_WRITE : 0;
+
 	if (fault->is_private)
 		return kvm_mmu_faultin_pfn_private(vcpu, fault);
 
-	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, false, true,
-					  fault->write, &fault->map_writable);
+	foll |= FOLL_NOWAIT;
+	fault->pfn = __kvm_faultin_pfn(fault->slot, fault->gfn, foll,
+				       &fault->map_writable, &fault->refcounted_page);
 
 	/*
 	 * If resolving the page failed because I/O is needed to fault-in the
@@ -4400,8 +4403,11 @@ static int __kvm_mmu_faultin_pfn(struct kvm_vcpu *vcpu,
 	 * to wait for IO.  Note, gup always bails if it is unable to quickly
 	 * get a page and a fatal signal, i.e. SIGKILL, is pending.
 	 */
-	fault->pfn = __gfn_to_pfn_memslot(fault->slot, fault->gfn, true, true,
-					  fault->write, &fault->map_writable);
+	foll |= FOLL_INTERRUPTIBLE;
+	foll &= ~FOLL_NOWAIT;
+	fault->pfn = __kvm_faultin_pfn(fault->slot, fault->gfn, foll,
+				       &fault->map_writable, &fault->refcounted_page);
+
 	return RET_PF_CONTINUE;
 }
 
diff --git a/arch/x86/kvm/mmu/mmu_internal.h b/arch/x86/kvm/mmu/mmu_internal.h
index a5113347bb12..e1f8385105a5 100644
--- a/arch/x86/kvm/mmu/mmu_internal.h
+++ b/arch/x86/kvm/mmu/mmu_internal.h
@@ -238,6 +238,7 @@ struct kvm_page_fault {
 	/* Outputs of kvm_mmu_faultin_pfn().  */
 	unsigned long mmu_seq;
 	kvm_pfn_t pfn;
+	struct page *refcounted_page;
 	bool map_writable;
 
 	/*
-- 
2.46.0.rc1.232.g9752f9e123-goog

