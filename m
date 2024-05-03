Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA878BB2B9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 20:20:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fc2PgZtZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWJy26yqvz3vjm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 04:20:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=fc2PgZtZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--dmatlack.bounces.google.com (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com; envelope-from=3qio1zggkdkmgpdwodfnjrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--dmatlack.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWJtx6sk5z3dCm
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 04:17:44 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dc64f63d768so17839689276.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 May 2024 11:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714760258; x=1715365058; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u5lOataUl4CqNIE0BOfGoSKjtAnehJHFOaimjTGPj/Y=;
        b=fc2PgZtZ70GIgKuLoK5WqMHggzZLdFnPTSCQC9YC5utMhIFaFKx+7+a5AwxCvjX3po
         b0S7c6VjV/zFIrzuhOLmFh3zU38M3D0HjVyYJPe7Zt3wudUJ8TkwfPjhz6SKsyJTRDxc
         g0Bf0VZyMTy4t6y23c+/ZmH/G1+iYvqF8FeM0xMWwEmfeXYTX9IxAI0df4G5PIBwF0Hz
         o1CxZ/N/MD2BkePUimq6ctS/c3rve3XknY3mhVFYHdwJhy4JpvpL0DmLB7cHDivQXj50
         HAkcOyJyQjU28utE0xUN4nOFBLc5r11ybSrbxL1agPY+AuBeXYE0PLWJhPfk2n2WuAF0
         1fvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714760258; x=1715365058;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u5lOataUl4CqNIE0BOfGoSKjtAnehJHFOaimjTGPj/Y=;
        b=QPw3tQuTjpMD74ZkEvsoGQvEQtvyrmwgUec9Na0j4nvECTZlwC5GSVi2oNHdopWwvb
         xKukMt2ZFL5wSQZc6T4PcNyz87/wJQkG84tWHaD/KToGJVfa4B7KUg1H67EnnINs1pkI
         2GjxxXrsiHEo2SwpLGm6gFDDpqxFBcsZf96DeW4xCZqtYcr2qT/Dg3j2SJWJNbqZ1kWr
         icaQ8r0ubJp46SJfrFrAllax6KCr3MDzpBuFjj63ADdU0Zb8LZzpLD+KngY3JpiQ9dO/
         ikvv3kVX1ULzY2lAncVLjzZbr+cZmc4lTpAwp2LQwLSQBeeDVxUbSNFdaCpOzxtg+6tf
         5ing==
X-Forwarded-Encrypted: i=1; AJvYcCXYjeXqb3HUnsmZ3tq39/FT72AiMyKmWUvGRaB3iWSnCVuPXYizG2pY4XKqF8EW0ljqZy39PZ6ZzDkjAQlmHzvSNqJf2RxFJcmQ+UapOA==
X-Gm-Message-State: AOJu0YyWKfa7P1X0HwsMnkIKYGSUnjEiBIZiI7aLk3DK4XDiLWgt10CE
	oc9WhCaSpRDNB4KGbhQ5Cqx1cvDHAAAQI4fExgnYA9+8x7SNoWvg/dNOA+mk5zLIXJLzNvYCtmH
	uV4EdkIblIw==
X-Google-Smtp-Source: AGHT+IGi/6BGSqLUvb7wYnWHXOlhd9obpauunW/BcufWuEVmkE7H211A4Dm9y03t3pfp70UoCYU1Se1aO50snA==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a05:6902:729:b0:dcc:c57c:8873 with SMTP
 id l9-20020a056902072900b00dccc57c8873mr1104781ybt.9.1714760258668; Fri, 03
 May 2024 11:17:38 -0700 (PDT)
Date: Fri,  3 May 2024 11:17:31 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
Message-ID: <20240503181734.1467938-1-dmatlack@google.com>
Subject: [PATCH v3 0/3] KVM: Set vcpu->preempted/ready iff scheduled out while running
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, David Matlack <dmatlack@google.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, Palmer Dabbelt <palmer@dabbelt.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Atish Patra <atishp@atishpatra.org>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Sean Christopherson <seanjc@google.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series changes KVM to mark a vCPU as preempted/ready if-and-only-if
it's scheduled out while running. i.e. Do not mark a vCPU
preempted/ready if it's scheduled out during a non-KVM_RUN ioctl() or
when userspace is doing KVM_RUN with immediate_exit=true.

This is a logical extension of commit 54aa83c90198 ("KVM: x86: do not
set st->preempted when going back to user space"), which  stopped
marking a vCPU as preempted when returning to userspace. But if userspace
invokes a KVM vCPU ioctl() that gets preempted, the vCPU will be marked
preempted/ready. This is arguably incorrect behavior since the vCPU was
not actually preempted while the guest was running, it was preempted
while doing something on behalf of userspace.

In practice, this avoids KVM dirtying guest memory via the steal time
page after userspace has paused vCPUs, e.g. for Live Migration, which
allows userspace to collect the final dirty bitmap before or in parallel
with saving vCPU state without having to worry about saving vCPU state
triggering writes to guest memory.

Patch 1 introduces vcpu->wants_to_run to allow KVM to detect when a vCPU
is in its core run loop.

Patch 2 renames immediated_exit to immediated_exit__unsafe within KVM to
ensure that any new references get extra scrutiny.

Patch 3 perform leverages vcpu->wants_to_run to contrain when
vcpu->preempted and vcpu->ready are set.

v3:
 - Use READ_ONCE() to read immediate_exit [Sean]
 - Replace use of immediate_exit with !wants_to_run to avoid TOCTOU [Sean]
 - Hide/Rename immediate_exit in KVM to harden against TOCTOU bugs [Sean]

v2: https://lore.kernel.org/kvm/20240307163541.92138-1-dmatlack@google.com/
 - Drop Google-specific "PRODKERNEL: " shortlog prefix [me]

v1: https://lore.kernel.org/kvm/20231218185850.1659570-1-dmatlack@google.com/

David Matlack (3):
  KVM: Introduce vcpu->wants_to_run
  KVM: Ensure new code that references immediate_exit gets extra
    scrutiny
  KVM: Mark a vCPU as preempted/ready iff it's scheduled out while
    running

 arch/arm64/kvm/arm.c       |  2 +-
 arch/loongarch/kvm/vcpu.c  |  2 +-
 arch/mips/kvm/mips.c       |  2 +-
 arch/powerpc/kvm/powerpc.c |  2 +-
 arch/riscv/kvm/vcpu.c      |  2 +-
 arch/s390/kvm/kvm-s390.c   |  2 +-
 arch/x86/kvm/x86.c         |  4 ++--
 include/linux/kvm_host.h   |  1 +
 include/uapi/linux/kvm.h   | 15 ++++++++++++++-
 virt/kvm/kvm_main.c        |  5 ++++-
 10 files changed, 27 insertions(+), 10 deletions(-)


base-commit: 296655d9bf272cfdd9d2211d099bcb8a61b93037
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

