Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B60293DC88
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 02:25:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Xrd8e7nH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WW53z2SMdz3dLB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2024 10:25:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Xrd8e7nH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3jtekzgykdgaqc8lhaemmejc.amkjglsvnna-bctjgqrq.mxj89q.mpe@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WW4NQ61zlz3fRV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jul 2024 09:54:14 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1fc5652f7d4so11482885ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 16:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722038053; x=1722642853; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=IbuNIltU7tfSlkccHv78LPGh6NGiPV3XEW5ZkU/rXdY=;
        b=Xrd8e7nHDMeh4cGQENbQOMl6iTvHQxy4oXDKDnHWw+zLcrkXRPnKt/9Oon55K3LRV1
         ZMeluX5QRpyRndu29/WNq8z7JH4qzc6upLlxyboPEKjzTkpCPe5AJauuLlF5iWS39MYr
         qH+7QxZ2ILGTsBS75/iDAIh77vsra65OsFxLm8sk7RbvhyYce/5E5qnNsJEMjoYHlLSW
         PVT270HzjqX8OZWVsenmR9ZEiBco+B9AUipEK0cUlIA9oFzCW5hZJRw61ARdW/gFRMWJ
         ToQWpBpqdJjc2AX2eXr9yHGhZlLFWyxSjitE/8Vw1JGuaSYFKZnUqQ28TgypiZjuRlMU
         5mwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722038053; x=1722642853;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IbuNIltU7tfSlkccHv78LPGh6NGiPV3XEW5ZkU/rXdY=;
        b=KsdAdCVQQqWPq9t/aAaTCja0QOKKYy1hK14ELbMCbi7nAWvS6i8cTu06bIm8HSC4bT
         +Yf/4pn6kIGsBXSPCGqrnIpJjjGVrBqbpmPM8ImgZ/Z6yycR8y+fUtNcGdKZer7C8Fae
         MnSIKmjrGYip8TaRWfQiWSaYPCI3UYIJYYmb3Sz09imj7ttfWzbRw2G0Bw36jibD9T60
         rtfCC3F3l46LEb9rN6POsdPBYs5E/MrARwbwfH5bBG0I/uDyNsQRvyLe0E0UOWg+1OiL
         ir57F4nAJ2+GezgbtolDsOdEE2IzHsdTps4QQvTH+p+CMhYXdrv3rZuvEMiktWi74z8S
         Om2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/hbOZMJgnvtPDIjCrYHgOEa1eM5lYMp0DGcCg4GFGLaiD5pZ+QEafoJMciAVsWc3XqnSWJ00wSqTntN7ZQuuCIWn2jcpC6yprTmgOFA==
X-Gm-Message-State: AOJu0YyHV1g9Jn7rX8bOPaswnXd/RdRTzZwobV2uYEBQdq4zA9Xt0Gh4
	KPy2tdR+qkEWMjGpeqCFs55I7+eI2gA37GIYPfWBYrkwxNMj31umRfVPQD0vTUTcejGu+Vq1/Dg
	cBw==
X-Google-Smtp-Source: AGHT+IF1WA3mVZXk9S93pEq2eXLardKUPi+yfLeicmT6epShCKMtCcCE54tvymeWkFnvdj0Qbejb/rqSUKM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:41cc:b0:1fd:87a7:1445 with SMTP id
 d9443c01a7336-1ff0489344bmr935735ad.9.1722038053119; Fri, 26 Jul 2024
 16:54:13 -0700 (PDT)
Date: Fri, 26 Jul 2024 16:51:55 -0700
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Message-ID: <20240726235234.228822-47-seanjc@google.com>
Subject: [PATCH v12 46/84] KVM: x86/mmu: Put refcounted pages instead of
 blindly releasing pfns
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

Now that all x86 page fault paths precisely track refcounted pages, use
Use kvm_page_fault.refcounted_page to put references to struct page memory
when finishing page faults.  This is a baby step towards eliminating
kvm_pfn_to_refcounted_page().

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 146e57c9c86d..3cdb1bd80823 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -4326,6 +4326,9 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 	lockdep_assert_once(lockdep_is_held(&vcpu->kvm->mmu_lock) ||
 			    r == RET_PF_RETRY);
 
+	if (!fault->refcounted_page)
+		return;
+
 	/*
 	 * If the page that KVM got from the *primary MMU* is writable, and KVM
 	 * installed or reused a SPTE, mark the page/folio dirty.  Note, this
@@ -4337,9 +4340,9 @@ static void kvm_mmu_finish_page_fault(struct kvm_vcpu *vcpu,
 	 * folio dirty if KVM could locklessly make the SPTE writable.
 	 */
 	if (!fault->map_writable || r == RET_PF_RETRY)
-		kvm_release_pfn_clean(fault->pfn);
+		kvm_release_page_clean(fault->refcounted_page);
 	else
-		kvm_release_pfn_dirty(fault->pfn);
+		kvm_release_page_dirty(fault->refcounted_page);
 }
 
 static int kvm_mmu_faultin_pfn_private(struct kvm_vcpu *vcpu,
-- 
2.46.0.rc1.232.g9752f9e123-goog

