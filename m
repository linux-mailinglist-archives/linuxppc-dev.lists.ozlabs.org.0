Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 02A268CB8A6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 03:46:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=eG4SR/Ir;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VkYt55KG0z3vX5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 11:41:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=eG4SR/Ir;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3ae1nzgykdak1njwslpxxpun.lxvurw36yyl-mn4ur121.x8ujk1.x0p@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VkYsJ6gVQz3g1d
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 11:40:19 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-622d157d9fbso169400537b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2024 18:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716342016; x=1716946816; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zcj+niLGOsOBGFG/wxz5ssr64Z9mR+IM9s4JveywwVo=;
        b=eG4SR/Ir9t70+D1UlRgrQzxJQSo6CsriYRLB81eSPsvRYx1uViqsZRgM23iB9XDBi0
         4XF04gWN5+K1Wn9xP3sbaGkaZZoeY9YVJ8B6eTT+2Bw/q6n3A+ndTS7igtuMJO/k6zD7
         csuXpwATEWGtG4qUby0ykkgZNZ5aCcvsEMIndYd1BDBEwa58Mg+3n9J0A2n7IHbGEKYT
         MvK9uU/J4++x75VD7C5dvp5cvBcdpE9hZ+v7TW1CSnLOsKI8cSDU1aZVMxLJ3wxosXh0
         HkubV3PJCqag4l+KUwH8VWKynr5Al9zLsL3giBA9KAe53ObcIKV6DEBIwvYZLhGJWUFD
         5Faw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716342016; x=1716946816;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zcj+niLGOsOBGFG/wxz5ssr64Z9mR+IM9s4JveywwVo=;
        b=bzRbsfKIf+ID3HmNKi0wPRO6QtNv9+lReYJafMjgpK2O6z5tf+yuf1b8y3PozCBgVl
         2XjnNm9yBcOEL0RO12XPHVCf7W1FDLAUiq3oUYFL9zjfOeuEo97jiXc06WcRNZfTdlgh
         6DrV+BeXvidULtUT2uNNIDtpfY2pPNxvtu2b9ObZAlnVVJ7CJ5DcVEP92oR6y8p3Id5A
         8c/8qG06WofuL3aLskPwoea1ndyxhampfBjs6Slp/1hGakmHzsH+tGp8cfjV5A3e4gWD
         94EI9U7fYgxmCMBP3uzFhlp4H6P9PxLkRcn0u/SHeXT1JACOusf+hixB79Y3AuDWfk9m
         y3og==
X-Forwarded-Encrypted: i=1; AJvYcCXBGVXuBeDFSvr3iTP7OmQ5IvYjTOirl46UmPXOd1JT4i5UEAKLDWpNnyBsHn24vVLMrETvta3LbIBqb+ftdsEW+soBxuJoi2wrxj6kZQ==
X-Gm-Message-State: AOJu0YzqsQc4SLVXgPcegLwLK+6pc04WBoAVMbPyBIz91uWcw3E8R5VE
	LkzgmH2SX3fjXfHDwkXplwPdRs+1OpxlwTEqj1/EcqqdA9Fx9aZ1/WIg23SAP1T0MD5gbmPuMwK
	aGg==
X-Google-Smtp-Source: AGHT+IF8tl2Sd1O1Adb/DEG65NrlAsoUAahexLMaCbbpQeSeG4ZOBg+4u/hLB5lJUUIzwhVDdo9qeU1encA=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:20c1:b0:de5:3003:4b64 with SMTP id
 3f1490d57ef6-df4e0a80c05mr82582276.1.1716342016391; Tue, 21 May 2024 18:40:16
 -0700 (PDT)
Date: Tue, 21 May 2024 18:40:07 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.215.g3402c0e53f-goog
Message-ID: <20240522014013.1672962-1-seanjc@google.com>
Subject: [PATCH v2 0/6] KVM: Fold kvm_arch_sched_in() into kvm_arch_vcpu_load()
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

Drop kvm_arch_sched_in() and instead add and use kvm_vcpu.scheduled_out
to communicate to kvm_arch_vcpu_load() that the vCPU is being scheduling
back in.

While fiddling with an idea for optimizing state management on AMD CPUs,
I wanted to skip re-saving certain host state when a vCPU is scheduled back
in, as the state (theoretically) shouldn't change for the task while it's
scheduled out.  Actually doing that was annoying and unnecessarily brittle
due to having a separate API for the kvm_sched_in() case (the state save
needed to be in kvm_arch_vcpu_load() for the common path).

The other motivation for this is to avoid yet another arch hook, and more
arbitrary ordering, if there's a future need to hook kvm_sched_out() (we've
come close on the x86 side several times).  E.g. kvm_arch_vcpu_put() can
simply check kvm_vcpu.scheduled_out if it needs to something specific for
the vCPU being scheduled out.

v2:
 - Add scheduled_out flag instead of passing a bool to kvm_arch_vcpu_load().
   [Oliver]
 - Tack on patches to clean up x86's setting of l1tf_flush_l1d in
   kvm_arch_sched_load() (the code looked slightly less weird when the flag
   was being set by kvm_arch_sched_in()).

v1: https://lore.kernel.org/all/20240430193157.419425-1-seanjc@google.com

Sean Christopherson (6):
  KVM: Add a flag to track if a loaded vCPU is scheduled out
  KVM: VMX: Move PLE grow/shrink helpers above vmx_vcpu_load()
  KVM: x86: Fold kvm_arch_sched_in() into kvm_arch_vcpu_load()
  KVM: Delete the now unused kvm_arch_sched_in()
  KVM: x86: Unconditionally set l1tf_flush_l1d during vCPU load
  KVM: x86: Drop now-superflous setting of l1tf_flush_l1d in vcpu_run()

 arch/arm64/include/asm/kvm_host.h     |  1 -
 arch/loongarch/include/asm/kvm_host.h |  1 -
 arch/mips/include/asm/kvm_host.h      |  1 -
 arch/powerpc/include/asm/kvm_host.h   |  1 -
 arch/riscv/include/asm/kvm_host.h     |  1 -
 arch/s390/include/asm/kvm_host.h      |  1 -
 arch/x86/include/asm/kvm-x86-ops.h    |  1 -
 arch/x86/include/asm/kvm_host.h       |  2 -
 arch/x86/kvm/pmu.c                    |  6 +-
 arch/x86/kvm/svm/svm.c                | 11 +---
 arch/x86/kvm/vmx/main.c               |  2 -
 arch/x86/kvm/vmx/vmx.c                | 80 +++++++++++++--------------
 arch/x86/kvm/vmx/x86_ops.h            |  1 -
 arch/x86/kvm/x86.c                    | 22 +++-----
 include/linux/kvm_host.h              |  3 +-
 virt/kvm/kvm_main.c                   |  5 +-
 16 files changed, 59 insertions(+), 80 deletions(-)


base-commit: 4aad0b1893a141f114ba40ed509066f3c9bc24b0
-- 
2.45.0.215.g3402c0e53f-goog

