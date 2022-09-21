Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E755BF244
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 02:39:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXKLN4CS1z3fTZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 10:39:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RumQH9j9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com; envelope-from=3wlsqywykdemxjfsohlttlqj.htrqnsz2uuh-ij0qnxyx.t4qfgx.twl@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=RumQH9j9;
	dkim-atps=neutral
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com [IPv6:2607:f8b0:4864:20::549])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXKBr10ksz3c65
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 10:33:07 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id r7-20020a632047000000b00439d0709849so2525865pgm.22
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 17:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date;
        bh=K+eJDVrRDoT/6MhRD9TeI/5Knz9Tn6rS//AmvrkEOco=;
        b=RumQH9j9B8TemfcYt2a6b2x/yZUXUUkBbA8gdyrJEr38nDZ7RuvyLCRaRk5ZkufEy6
         p2NCHI5GbrqhMqhjM/+4WM5CnKN5bBsM+xcVusQQyjpPw3Ksepa4epiazoqa1DtUlznH
         D3jXrYZbhuvR8NS9oP9hxXzcyaKZyMMMzC8Q3AsRqni5HUkhRX+jDr6NPQVgVd+hQMGt
         1BKLvJS2NkApQBW4GGR8+r3gbwLtcfbqmtTVZArU0N3RAW9Bb+ckWgOW049H7NaAmkBn
         CgE9T8i2GbNr42RCENeJzZg+9RVQrzeyxaiopWDNfB1fyskDMaEA2WCUkePT/lJ5TLD+
         i91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date;
        bh=K+eJDVrRDoT/6MhRD9TeI/5Knz9Tn6rS//AmvrkEOco=;
        b=TFmirkJDEz9SrQqE7yydTlgKaTiaYkBGZaN/uy4+JmI/3c5/XFWlooYMR5TJ7hDVaf
         jQD4OyJinzWUeoGDGqfWIUN52WoVXVvLQbvADgVGhGPkmyfeesXbwHiHMOD3LuOW4ls2
         S8RZG9o3QJPi0nKgNT4b+vhptEKpElAQtVfnEbYbm3d3zjB00Vie0gLMzk76Zh/SowfU
         QFXSeC05d8UljAIVgtB5VI/3DPrGxB78swuJ8JEiXhp7IsRof/1iHAyTyTVdQHCnF5K6
         Fq+HDs/hLkPSxmPgG+vME0Ku9++HFEVskyUxZyeL2ASoL6poM5H0e3v0LaZp9ShfKJOO
         1IQA==
X-Gm-Message-State: ACrzQf3skpzaHw5XRMX+spH6QrnhpUIkT3du3LPCLNFZcA2GAxMyHwe+
	ts4Xczu3hTNOM4MiHRdJ1as59t1cfSg=
X-Google-Smtp-Source: AMsMyM7p74m7+dmjyK72nsLPYB9lNVLqfhypVno6piUFMo/NwEAnZPXgFzPrJP9ozDKFIC2/tvBZej6i8L4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:134d:b0:545:4d30:eebf with SMTP id
 k13-20020a056a00134d00b005454d30eebfmr26543768pfu.32.1663720386171; Tue, 20
 Sep 2022 17:33:06 -0700 (PDT)
Date: Wed, 21 Sep 2022 00:32:00 +0000
In-Reply-To: <20220921003201.1441511-1-seanjc@google.com>
Mime-Version: 1.0
References: <20220921003201.1441511-1-seanjc@google.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
Message-ID: <20220921003201.1441511-12-seanjc@google.com>
Subject: [PATCH v4 11/12] KVM: mips, x86: do not rely on KVM_REQ_UNHALT
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

From: Paolo Bonzini <pbonzini@redhat.com>

KVM_REQ_UNHALT is a weird request that simply reports the value of
kvm_arch_vcpu_runnable() on exit from kvm_vcpu_halt().  Only
MIPS and x86 are looking at it, the others just clear it.  Check
the state of the vCPU directly so that the request is handled
as a nop on all architectures.

No functional change intended, except for corner cases where an
event arrive immediately after a signal become pending or after
another similar host-side event.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/emulate.c | 7 +++----
 arch/x86/kvm/x86.c      | 9 ++++++++-
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/mips/kvm/emulate.c b/arch/mips/kvm/emulate.c
index b494d8d39290..1d7c56defe93 100644
--- a/arch/mips/kvm/emulate.c
+++ b/arch/mips/kvm/emulate.c
@@ -955,13 +955,12 @@ enum emulation_result kvm_mips_emul_wait(struct kvm_vcpu *vcpu)
 		kvm_vcpu_halt(vcpu);
 
 		/*
-		 * We we are runnable, then definitely go off to user space to
+		 * We are runnable, then definitely go off to user space to
 		 * check if any I/O interrupts are pending.
 		 */
-		if (kvm_check_request(KVM_REQ_UNHALT, vcpu)) {
-			kvm_clear_request(KVM_REQ_UNHALT, vcpu);
+		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
+		if (kvm_arch_vcpu_runnable(vcpu))
 			vcpu->run->exit_reason = KVM_EXIT_IRQ_WINDOW_OPEN;
-		}
 	}
 
 	return EMULATE_DONE;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 8aeacbc2bff9..8b1ff7e91ecb 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10811,7 +10811,14 @@ static inline int vcpu_block(struct kvm_vcpu *vcpu)
 		if (hv_timer)
 			kvm_lapic_switch_to_hv_timer(vcpu);
 
-		if (!kvm_check_request(KVM_REQ_UNHALT, vcpu))
+		kvm_clear_request(KVM_REQ_UNHALT, vcpu);
+
+		/*
+		 * If the vCPU is not runnable, a signal or another host event
+		 * of some kind is pending; service it without changing the
+		 * vCPU's activity state.
+		 */
+		if (!kvm_arch_vcpu_runnable(vcpu))
 			return 1;
 	}
 
-- 
2.37.3.968.ga6b4b080e4-goog

