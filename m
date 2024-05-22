Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 4549E8CB8B1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 03:52:01 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=WIws1BWe;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VkYxz5832z79TQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 11:44:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=WIws1BWe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=3cu1nzgykdbiaws51uy66y3w.u64305cf77u-vwd30aba.6h3sta.69y@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VkYsS0SQcz3g5f
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 11:40:28 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-de8b66d59f7so576002276.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 18:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716342025; x=1716946825; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=9/Jh3NT05cAP4Dr5P4AOID5+N71m8JBqExCgFsAlL8M=;
        b=WIws1BWeQ/CK2ZSNScgjK2GoXEf4aQhYQcbQMD7TMMXRxRfJee5rwdY5j5yJQbCkwo
         3uzzDzCAHDZ4Y5AfbWstCCNpcuBUsVN8cgbZxOEQCIsJdKuw0VHkZzsekTziMUBdYGAU
         p8vggxGCdCWRn2nL63r5X9snSpo/zVYRuUoIRc9FhTf2K7o+GXEQE3ixZ66S2mMcPRFx
         H6L2rgT0uOy6lz9gMyq7KyekUQTRy5UcFIORLZAVPE+0qn0Mt0QhSxaiJKTHECHvtE/5
         2zPOMyS7XPZKpFDgR0sa/SGK6kvebelw2bdHb9l2aI+YOkZCH3VeR8JcJVU7AUU/75UM
         cXhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716342025; x=1716946825;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/Jh3NT05cAP4Dr5P4AOID5+N71m8JBqExCgFsAlL8M=;
        b=B2J6QVKmHlxWH/V74amzoB18A+lEJ6Bzo4t1UWqxJ1mMp5TQBaex5VOzh3VqN++at0
         WKaF8kT9RI124A+xllDDVH2xxbL1HrymOntBq5DUBTqxDJOC80BYKlbkOkaxApSFddaw
         bTNcgWMyAkf4u1ZfWgnoQXxQ5EX8wL5MgdXT69gM0bfAyx7u5zdLCYWdV60aj/5UrnVO
         gxbLAnSsIRpekjB4f25JsbRpXvOWWXEQBtdGtiwHrg4DchX3mI12URwA9TMkwwL1TW36
         l6zzYM3O4imCVFsZBcYiEq7BY+L4jnCIO1XuNUrkuc+zAy35MyvOn9ka1kagK6J26o94
         JyLg==
X-Forwarded-Encrypted: i=1; AJvYcCXa0EHjJCB+XR0WA0c4+MMn5jwhqdfezXNb+PYENEvb5D0pFMbcM8aEd2kR64mYgf4qLutNGrFqaXlFXIsmJC0FwzJoqdh8DsFaii1dCg==
X-Gm-Message-State: AOJu0YzZTSoxDZoZ1BfGRnFINrnZiQ64bCeHjjNuTkqrxLbWgkYmgM62
	8HlI+Orcr4X1v+FBYcHV244mwaTYdU45zDmfhlRYqs18XT9W9s0ExRWy5waUhB7g4paoAM7E1Tg
	Yyw==
X-Google-Smtp-Source: AGHT+IFb4ojjFIBjH/g1gqSAZtGdXjScECyPQCKxtonXS1wS1/Q6Sfuh8cMohHl5GHkfuJ7096x7AKNuxdo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:100f:b0:dda:c4ec:7db5 with SMTP id
 3f1490d57ef6-df4e10405f6mr210549276.4.1716342025422; Tue, 21 May 2024
 18:40:25 -0700 (PDT)
Date: Tue, 21 May 2024 18:40:12 -0700
In-Reply-To: <20240522014013.1672962-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240522014013.1672962-1-seanjc@google.com>
X-Mailer: git-send-email 2.45.0.215.g3402c0e53f-goog
Message-ID: <20240522014013.1672962-6-seanjc@google.com>
Subject: [PATCH v2 5/6] KVM: x86: Unconditionally set l1tf_flush_l1d during
 vCPU load
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
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
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Always set l1tf_flush_l1d during kvm_arch_vcpu_load() instead of setting
it only when the vCPU is being scheduled back in.  The flag is processed
only when VM-Enter is imminent, and KVM obviously needs to load the vCPU
before VM-Enter, so attempting to precisely set l1tf_flush_l1d provides no
meaningful value.  I.e. the flag _will_ be set either way, it's simply a
matter of when.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 59aa772af755..60fea297f91f 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -5006,12 +5006,11 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 {
 	struct kvm_pmu *pmu = vcpu_to_pmu(vcpu);
 
-	if (vcpu->scheduled_out) {
-		vcpu->arch.l1tf_flush_l1d = true;
-		if (pmu->version && unlikely(pmu->event_count)) {
-			pmu->need_cleanup = true;
-			kvm_make_request(KVM_REQ_PMU, vcpu);
-		}
+	vcpu->arch.l1tf_flush_l1d = true;
+
+	if (vcpu->scheduled_out && pmu->version && pmu->event_count) {
+		pmu->need_cleanup = true;
+		kvm_make_request(KVM_REQ_PMU, vcpu);
 	}
 
 	/* Address WBINVD may be executed by guest */
-- 
2.45.0.215.g3402c0e53f-goog

