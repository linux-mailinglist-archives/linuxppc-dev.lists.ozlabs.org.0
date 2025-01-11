Return-Path: <linuxppc-dev+bounces-5061-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C467A09FFC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Jan 2025 02:25:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YVLRc3l1kz3d81;
	Sat, 11 Jan 2025 12:25:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::64a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736558700;
	cv=none; b=MbGrgRoQZw6YePnvIVo6aaAUQWmeasf9geySbEqa7UTvZ15lTG2uWBMAqAGdlg6y2D7xZuSrTAvTInRGRnRdIypluFVxhANvFoHqGIJilXNjnC7A7LO+OnsRwgIhMJwkuYAzazsY/3tKpV69qx/DGNzUGF/KmsBJP+lkOOADGAdNULfHzc2koBOvezrYe+A0e2INvLTZrz4w32ZETyFLayDUA2bzgln68Boh/0WjBbul1I+id5BnEZK+qM4SSexzltwSKuZ1WfFqGLZkEcm0UoL5R5jDIZ+q1wCW52I1MfRgu1wOBMIiurTzaJJNNpvHQ7NhwYe80MRuM4GAdczncw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736558700; c=relaxed/relaxed;
	bh=yPMtRfEi+Y38oJbaqxUUwsgL1BiiO9TX2S4BZFXkjhs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ac8SpUfGfoHqZimuDtByHteEk2PsGUHaweRSeHkZmxnD4FuX3oGLp1IYoHuMJec0wqN/hzYec1vDbIfYvJMbzpKw9WAPtRBiS/1VpIxjHp55bzj5a+/2N3+mtlcdXy1JUgAOGmnyMF7Bl9vdBEnXOsoZodip0CNOTKBFUsggo2KpAi2TZjA9uw4pMO9Q+/tYI21vHIByfuZDoabOGsLIEi9SlwLQR5xh5RLydZWL4cB0U9xsmoOHEfC86qVxTVyRE3fP+XPVM+mYTjdaHi8R5e1G7ej+qxbwTH8/LKYRS1N69j21LNk40iE575Eg+ga4YJAhhBU9FaQig4SUWvZkGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Z9Pspjo8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3z8ibzwykdeiwierngksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Z9Pspjo8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3z8ibzwykdeiwierngksskpi.gsqpmry1ttg-hizpmwxw.s3pefw.svk@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YVLRb3Krsz3cnt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 12:24:58 +1100 (AEDT)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-21655569152so48669555ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 17:24:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736558696; x=1737163496; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=yPMtRfEi+Y38oJbaqxUUwsgL1BiiO9TX2S4BZFXkjhs=;
        b=Z9Pspjo8IfJTHM1ITxSG8YlIDLhLDw8yLNNzsjZMb+y014L16VH9KyEMDDYR9Vr26C
         QprlcgKN4qd15AqZjp/geZuV8HLGerj6YBAvVIqQf7baoqZnp/BQUn9agzJdqqpmfOcl
         oce7wWLIsurM702ktN5+Mo2AWK0SDVB4yL0lHQHN6Iq1WKa8zLDh8Kvt53vd637gvcJk
         TRX5vyoblTb/+c3WAc5bS3ULB1HaNuRdaKT9eX4pfwbr7j0udLySEmFNMNLhngLhj62F
         6qdt19T+GKXdYcMLx63Uc66oEyXEoOHc9BxGLtdIIlUuiV4Br8Pj5o2FtO+f9gQFl6ao
         27LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736558696; x=1737163496;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yPMtRfEi+Y38oJbaqxUUwsgL1BiiO9TX2S4BZFXkjhs=;
        b=CeHlStTymEc9pQ7AdP3wvu9WuXSgzWOBz/s0y23Gfa5SI9w5qBndu+49sqvE85JUEb
         DhqhsxeYbqCb4dDIXbihwWVO+sKtIP8sVIqqjCUeZtQ66tfWupyOgeED5SSxTxC9VHpd
         wi8xYiisUO/iW2rmQMeaqWqRhui54Km+oapbVySErPP+ZZosQbX95WhNosWck0MUvdAS
         YfUX360kp7febUzXLDPPlQXuylpf8mg3JbRf0pMg+IKqIB0/QWD/7kRWGXYSy1hzURrg
         Uzidbs6ZyvnMYgrCO/h7p+ZL/UukxJokWTT38OegwHCsxrd/g0nUznfCpP0Wdl9PR2Au
         9YJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSAf/DJPk6n4JMhZCuKzsko5jxr7iTF4AmMvwIgI+gB/ZunDTJvZpGEysyAl1qU13t/qeXgiFWsieTII8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyMxzaZ6jPzH7r2H3GkfkUk238U9pSZ9KKLiuODDf2SX3ul7Q1c
	Z3aUTEmgDw/OUHgpljkzY1G+Dq6aPS2JIh5Z8iWpALiRdOFtE+L5KI5UwjPTBeeJ73P/qyLkrU4
	i2Q==
X-Google-Smtp-Source: AGHT+IFD3f0YjwZz/pTHPUxUy4yfVqFt92VRSC3L2LvrexSYRapcV9Xo2L4A2CKFVBcFdjD8/mn4jkTqU/U=
X-Received: from pgkp11.prod.google.com ([2002:a63:f44b:0:b0:7fc:fac3:7df6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:4325:b0:1e1:b062:f3fa
 with SMTP id adf61e73a8af0-1e88d1dba97mr25121737637.34.1736558695870; Fri, 10
 Jan 2025 17:24:55 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 10 Jan 2025 17:24:47 -0800
In-Reply-To: <20250111012450.1262638-1-seanjc@google.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
References: <20250111012450.1262638-1-seanjc@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250111012450.1262638-3-seanjc@google.com>
Subject: [PATCH 2/5] KVM: Clear vcpu->run->flags at start of KVM_RUN for all architectures
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Michael Ellerman <mpe@ellerman.id.au>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Clear kvm_run.flags at the start of KVM_RUN for all architectures to
minimize the probability of leaving a stale flag set.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c         | 1 -
 arch/arm64/kvm/handle_exit.c | 2 +-
 arch/powerpc/kvm/book3s_hv.c | 4 +---
 arch/x86/kvm/x86.c           | 1 -
 virt/kvm/kvm_main.c          | 3 +++
 5 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index a102c3aebdbc..925fa010bb7b 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1128,7 +1128,6 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 	ret = 1;
 	run->exit_reason = KVM_EXIT_UNKNOWN;
-	run->flags = 0;
 	while (ret > 0) {
 		/*
 		 * Check conditions before entering the guest
diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index d7c2990e7c9e..63692c254a07 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -186,7 +186,7 @@ static int kvm_handle_guest_debug(struct kvm_vcpu *vcpu)
 	run->exit_reason = KVM_EXIT_DEBUG;
 	run->debug.arch.hsr = lower_32_bits(esr);
 	run->debug.arch.hsr_high = upper_32_bits(esr);
-	run->flags = KVM_DEBUG_ARCH_HSR_HIGH_VALID;
+	run->flags |= KVM_DEBUG_ARCH_HSR_HIGH_VALID;
 
 	switch (ESR_ELx_EC(esr)) {
 	case ESR_ELx_EC_WATCHPT_LOW:
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 25429905ae90..b253f7372774 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -1704,9 +1704,7 @@ static int kvmppc_handle_exit_hv(struct kvm_vcpu *vcpu,
 		/* Exit to guest with KVM_EXIT_NMI as exit reason */
 		run->exit_reason = KVM_EXIT_NMI;
 		run->hw.hardware_exit_reason = vcpu->arch.trap;
-		/* Clear out the old NMI status from run->flags */
-		run->flags &= ~KVM_RUN_PPC_NMI_DISP_MASK;
-		/* Now set the NMI status */
+		/* Note, run->flags is cleared at the start of KVM_RUN. */
 		if (vcpu->arch.mce_evt.disposition == MCE_DISPOSITION_RECOVERED)
 			run->flags |= KVM_RUN_PPC_NMI_DISP_FULLY_RECOV;
 		else
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 1b04092ec76a..a8aa12e0911d 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -11465,7 +11465,6 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 	vcpu_load(vcpu);
 	kvm_sigset_activate(vcpu);
-	kvm_run->flags = 0;
 	kvm_load_guest_fpu(vcpu);
 
 	kvm_vcpu_srcu_read_lock(vcpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index de2c11dae231..7d2076439081 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4336,6 +4336,9 @@ static long kvm_vcpu_ioctl(struct file *filp,
 
 			put_pid(oldpid);
 		}
+
+		vcpu->run->flags = 0;
+
 		vcpu->wants_to_run = !READ_ONCE(vcpu->run->immediate_exit__unsafe);
 		r = kvm_arch_vcpu_ioctl_run(vcpu);
 		vcpu->wants_to_run = false;
-- 
2.47.1.613.gc27f4b7a9f-goog


