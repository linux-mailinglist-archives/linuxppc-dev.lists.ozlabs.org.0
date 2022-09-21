Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEF75BF23C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 02:37:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXKJN3g6yz3f3y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 10:37:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=BXLnvleO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3vvsqywykdd4xjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=BXLnvleO;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXKBm0qWCz3bxC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 10:33:03 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-33dc888dc62so38033737b3.4
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 17:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=jS6wDbw1pF8Ah0FgPiebKmSPM6cE3vh92J7x5AZxxS8=;
        b=BXLnvleOcPw2Y/CP9Ur+TUIGjrRNHf90WKKjZAL9Icsc0hEgdcWSuQ+GHVYb1EUn7B
         sg7UYfZNRpVmJtSJClj570j+DzZOIqw4J10R/J9Yt7QeCVYCKTpKQGufMZPkwcZhkNUl
         3vaoURIDkAnxonLZR0kp8E9GOTPxPNNt2Uho8o+B4y7tM55x9dF6kjtMv6AEMiukUUVr
         9k2MNMpEmt6zvG+nctg/UgWyL5RXO74DdhR2N9XX4q20RL0XpVSV68ufwiv6eT0kEN2P
         i58uBMosfJaPWh3cFlR3V9rNs3L5A+Vc+LFEiAaNl1sbw3jHRaKk/mS0dRmTHm93SlWB
         i4PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=jS6wDbw1pF8Ah0FgPiebKmSPM6cE3vh92J7x5AZxxS8=;
        b=MHPkb5ezxnHVD+tNCUzWT+LX7lZWptaqKh1fsdEMM3YZzw4HwcziYAlQNqy6oFJ4bu
         vraZJRu09rrBsmvEjCnJW9OsCRk7lqzdMKbxP4az+WbogJ/6wiYq3EsThEKt3voNRyNh
         DHk7tdO9+TuMKRSHY19Cd3sr0/kFe7Kg6N+7O4kn60RPefN1GnNbA/cuS73TwTVtIPJl
         bywy4UFJjQPRJSnGM++wbUrfvZsRG9y+fIpqwKc+ZGt6pKhB7ohvPjRjls+Hv55h8X1+
         sVXPD4ndLRHlAex0an990agvbKk8HJw/QAZw2OuorDsUf4aK7+GQ2eszwlxvDb6BYlPK
         0DKw==
X-Gm-Message-State: ACrzQf2t4nKOyg7z/2jk0uOo/Z683blatsmIVb8QceeEjYl4Tt9DGTUb
	lNFMlgD+9QzDg278gotgjl3drhmrpoo=
X-Google-Smtp-Source: AMsMyM4FwFyakAFj4uLb7acHZDkmCOLDogY8I+5AwDxw4BtkzCD4DzOXBcnEDpQ/JYhzAy9RSZ7GSFvqyP0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:81cf:0:b0:6a9:4d0d:5ee6 with SMTP id
 n15-20020a2581cf000000b006a94d0d5ee6mr22583489ybm.153.1663720381243; Tue, 20
 Sep 2022 17:33:01 -0700 (PDT)
Date: Wed, 21 Sep 2022 00:31:57 +0000
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-9-seanjc@google.com>
Subject: [PATCH v4 08/12] KVM: nVMX: Make event request on VMXOFF iff
 INIT/SIPI is pending
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Suzuki K Poulose <suzuki.poulose@arm.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Maxim Levitsky <mlevitsk@redhat.com>, Alexandru Elisei <alexandru.elisei@arm.com>, kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Explicitly check for a pending INIT/SIPI event when emulating VMXOFF
instead of blindly making an event request.  There's obviously no need
to evaluate events if none are pending.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 5922531f6c52..8f67a9c4a287 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -5193,8 +5193,8 @@ static int handle_vmxoff(struct kvm_vcpu *vcpu)
 
 	free_nested(vcpu);
 
-	/* Process a latched INIT during time CPU was in VMX operation */
-	kvm_make_request(KVM_REQ_EVENT, vcpu);
+	if (kvm_apic_has_pending_init_or_sipi(vcpu))
+		kvm_make_request(KVM_REQ_EVENT, vcpu);
 
 	return nested_vmx_succeed(vcpu);
 }
-- 
2.37.3.968.ga6b4b080e4-goog

