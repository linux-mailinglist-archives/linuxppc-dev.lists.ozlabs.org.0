Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C83501FB9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 02:44:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KfczB0jRtz3bp0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 10:44:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=MeCa2hpH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--seanjc.bounces.google.com
 (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com;
 envelope-from=3wr9yygykdl0vhdqmfjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--seanjc.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=MeCa2hpH; dkim-atps=neutral
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com
 [IPv6:2607:f8b0:4864:20::104a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kfcyb6vFxz2yg3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Apr 2022 10:43:50 +1000 (AEST)
Received: by mail-pj1-x104a.google.com with SMTP id
 s13-20020a17090a764d00b001cb896b75ffso3629752pjl.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Apr 2022 17:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:message-id:mime-version:subject:from:to:cc;
 bh=7OMi2RIEzFlzmxnmlN9xX+Hiuvy0euETloS8ByI5IaE=;
 b=MeCa2hpH2EDOFAv86dWfFxEDhUCoVgtYtspWsZspfLv8qId3NORSe7rf03wn86oylz
 +XJ0GcdqQRybf6xncuTBeePmfFN4InpFQ41P9BSR3Syo01zZHvGZ9zQr4T4EE1WEIloe
 reG4s0K2VYD7FLIjoouyOUE3otCfnre0GNbLyJfTBPWb2DV4bee0Kn/uLaXDFLxrNX/x
 UbZV6ELm90R1ITrDKiVMDDPojI8aJ036Iusf7S6xFX02aeLgG7OCHcrKOwsYwLbInWX3
 PegPDslVaW429FO+Y+K2OsH/9FIvKxrhlxBKuaQed7QGbk7x/m+I+YhWAP5nEspT3bi9
 F2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:message-id:mime-version:subject
 :from:to:cc;
 bh=7OMi2RIEzFlzmxnmlN9xX+Hiuvy0euETloS8ByI5IaE=;
 b=MwfO7XPDX1d6ukNslC3faoxlF83TQZDuqfxlfUf2lxSfQXKKNTfmBnGuGSGADufOXe
 FDZmizKS1pNMcaaLfkkbmgKPGAh1RW0L7TuKJjS/XltXxrC70c0Vc5Q7/l9C0AF1RSEx
 z7feC56j9nrxxrd90D77pye4HelxIp8GamNPMi1wufVK3OF5O+lgeG7KwULW0aRvWVgV
 I5VY1Zo9yyAkMFz9VYz+5VrT5c+NrB1CJwVhJTK89wQw82OZW/4neWnOzNVAbwwhRoFB
 H3c2PVvMrFg/x2qAD/xxADv300JRyzpSYDp0EgEnlea0jUU0uT2ZEaDjM8wzCuU5zNaU
 UOpA==
X-Gm-Message-State: AOAM532sLRgQBrtegy6wnb1Zh92rhWaCZrAGPRmxsqBQ2P1bDDk61O63
 4MIZrvY1NBEj3HylNTpXhTrPyrsoCQk=
X-Google-Smtp-Source: ABdhPJx6JOuyqIVZMdQQ1Mawo8G7YZO4giLYHAwOTFBDw/d0CTLHvznAoZ7hbCtCNcCnHHDws4949mgI1FE=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1490:b0:4fb:1544:bc60
 with SMTP id
 v16-20020a056a00149000b004fb1544bc60mr17317476pfu.73.1649983426720; Thu, 14
 Apr 2022 17:43:46 -0700 (PDT)
Date: Fri, 15 Apr 2022 00:43:40 +0000
Message-Id: <20220415004343.2203171-1-seanjc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.36.0.rc0.470.gd361397f0d-goog
Subject: [PATCH 0/3] KVM: x86 SRCU bug fix and SRCU hardening
From: Sean Christopherson <seanjc@google.com>
To: Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
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
Cc: Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>, Sean Christopherson <seanjc@google.com>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix an x86 bug where KVM overwrites vcpu->srcu_idx and can leak an SRCU
lock due to unlocking the wrong index, ultimately causing a hang if/when
KVM attempts to synchronize.

Switch RISC-V to the generic vcpu->srcu_idx, for reasons unknown it has
its own copy and ignores the generic one.

Add helpers with rudimentary detection of illegal vcpu->srcu_idx usage,
the x86 bug would have been incredibly painful to debug had I not known
what to look for (found by a selftest with very specific behavior...
that we recently modified with respect to SRCU).

Non-x86 changes are compile tested only.

Sean Christopherson (3):
  KVM: x86: Don't re-acquire SRCU lock in complete_emulated_io()
  KVM: RISC-V: Use kvm_vcpu.srcu_idx, drop RISC-V's unnecessary copy
  KVM: Add helpers to wrap vcpu->srcu_idx and yell if it's abused

 arch/powerpc/kvm/book3s_64_mmu_radix.c |  9 ++++---
 arch/powerpc/kvm/book3s_hv_nested.c    | 16 ++++++------
 arch/powerpc/kvm/book3s_rtas.c         |  4 +--
 arch/powerpc/kvm/powerpc.c             |  4 +--
 arch/riscv/include/asm/kvm_host.h      |  3 ---
 arch/riscv/kvm/vcpu.c                  | 16 ++++++------
 arch/riscv/kvm/vcpu_exit.c             |  4 +--
 arch/s390/kvm/interrupt.c              |  4 +--
 arch/s390/kvm/kvm-s390.c               |  8 +++---
 arch/s390/kvm/vsie.c                   |  4 +--
 arch/x86/kvm/x86.c                     | 35 +++++++++++---------------
 include/linux/kvm_host.h               | 24 +++++++++++++++++-
 12 files changed, 72 insertions(+), 59 deletions(-)


base-commit: 150866cd0ec871c765181d145aa0912628289c8a
-- 
2.36.0.rc0.470.gd361397f0d-goog

