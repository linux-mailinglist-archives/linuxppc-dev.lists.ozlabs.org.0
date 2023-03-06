Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 220286ACD74
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 20:02:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVnyl0PlLz3cL8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:02:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=VWgYmSrm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--dmatlack.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3pzggzagkdfg3c0jb02a6ee6b4.2ecb8dknff2-34lb8iji.epb01i.eh6@flex--dmatlack.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=VWgYmSrm;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVnxn1320z3cBm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 06:02:03 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5376fa4106eso111590407b3.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 11:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678129319;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=C+DxnQV3hp0RGd+ug96FCObNfG/ILFIXHP4OvcDjXtA=;
        b=VWgYmSrmEfZIk/6E1VMbGjDaim/LrqhaEaWbHuc+fH+V6S1DKdJkRtZ34FezlMlvhM
         U6mcoknL3sAYb7G1m+RD4Ig6gMHZ3RTQuTmwizQCiRBj2rGy41IyS90Qy6jvQXVsrewL
         9SFoAxeMBzW5t2TD3YILUvsMiBUCUbLVi57NBysGJg1yYn7YuGGMcpOxrx1eRRLBIO55
         6Jbb9BwFCYffUcjzVZAFu0HkR94u7+bMfdsXfZ8y0VaWIgzYSxnsXzYIhqkR9LOZ5C0I
         6G5p1/Kff9hdoITAYU26Wdj64V3gzTqUAgddrH7mg7Qk+8AvTWLN0NmGqN/B0ffPRXLb
         3ITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678129319;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C+DxnQV3hp0RGd+ug96FCObNfG/ILFIXHP4OvcDjXtA=;
        b=r8Kd860ccL7AethTZpchcCXH6jlyJRu+z2cH+vheVDdbUTU9vC5JExJHsq8jLYKN8Y
         Hggt2IL+bu3+R0S8aSZSO8UsC0iGHhwYSN9u0276hpBjz6+FEtmR+5ioVf3hN5qIlXR3
         OvgMOE8SfZ1yTVdmc6aMnfyptisxOKvg3PezsjN4P+2XQF/dcpFBDZM/PsDB5ExsJP3Z
         GrIeIr02OSQKHRX22jU586gyvKm7nGp5KeeEq57B46nTVyrkQT634WIPBCSdgkou377k
         O82neONdBzIqvMLaVrRrCbKxrSwFbISbhh7kAhGe0/hJgRAY5MR3h4H9REsMxeR6NaJC
         sA+w==
X-Gm-Message-State: AO0yUKWPjnQNtYMGl099rGMV1I9FDpFebMo4bbBzRYoe0g5l/rsBfVnj
	NlhdAE7Lk/vnxtSKW5EV4iBCwVcOp0Q4TQ==
X-Google-Smtp-Source: AK7set/pVosUQpXpF+342Y6QcFu+4eURtJP2+OiNzV4zJi7D/yZ3hybJi6gL3lLKDOrFj5EE1HIssi/eN+VpiA==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a81:b723:0:b0:536:38b4:f51 with SMTP id
 v35-20020a81b723000000b0053638b40f51mr7493840ywh.5.1678129319569; Mon, 06 Mar
 2023 11:01:59 -0800 (PST)
Date: Mon,  6 Mar 2023 11:01:52 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
Message-ID: <20230306190156.434452-1-dmatlack@google.com>
Subject: [PATCH v2 0/4] KVM: Refactor KVM stats macros and enable custom stat names
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Zenghui Yu <yuzenghui@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Sathvika Vasireddy <sv@linux.ibm.com>, Atish Patra <atishp@atishpatra.org>, David Matlack <dmatlack@google.com>, linux-arm-kernel@lists.infradead.org, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>, Sean Christopherson <seanjc@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, J
 ames Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series refactors the KVM stats macros to reduce duplication and
adds the support for choosing custom names for stats.

Custom name makes it possible to decouple the userspace-visible stat
names from their internal representation in C. This can allow future
commits to refactor the various stats structs without impacting
userspace tools that read KVM stats.

This also allows stats to be stored in data structures such as arrays,
without needing unions to access specific stats. Case in point, the last
patch in this series removes the pages_{4k,2m,1g} union, which is a
useful cleanup to prepare for sharing paging code across architectures
[1].

And for full transparency, another motivation for this series it that at
Google we have several out-of-tree stats that use arrays. Custom name
support is something we added internally and it reduces our technical
debt to get the support merged upstream.

Tested on x86. Compile tested on ARM. Not yet tested on any other
architectures.

Link: https://lore.kernel.org/kvm/20221208193857.4090582-1-dmatlack@google.com/

v2:
 - Refactor stat macros (patch 1) to reduce duplication and make it
   simpler to add custom name support [Sean]

v1: https://lore.kernel.org/kvm/20230118175300.790835-1-dmatlack@google.com/

David Matlack (4):
  KVM: Refactor stats descriptor generation macros
  KVM: Refactor designated initializer macros for struct _kvm_stats_desc
  KVM: Allow custom names for KVM_STAT()
  KVM: x86: Drop union for pages_{4k,2m,1g} stats

 arch/arm64/kvm/guest.c          |  14 +--
 arch/mips/kvm/mips.c            |  54 ++++-----
 arch/powerpc/kvm/book3s.c       |  62 +++++-----
 arch/powerpc/kvm/booke.c        |  48 ++++----
 arch/riscv/kvm/vcpu.c           |  16 +--
 arch/s390/kvm/kvm-s390.c        | 198 ++++++++++++++++----------------
 arch/x86/include/asm/kvm_host.h |   9 +-
 arch/x86/kvm/x86.c              |  94 +++++++--------
 include/linux/kvm_host.h        | 179 +++++++++++------------------
 9 files changed, 314 insertions(+), 360 deletions(-)


base-commit: 45dd9bc75d9adc9483f0c7d662ba6e73ed698a0b
-- 
2.40.0.rc0.216.gc4246ad0f0-goog

