Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA633EF6C5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 02:13:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gq7fW2SPhz3cnC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 10:13:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=fyeUao6f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--seanjc.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com;
 envelope-from=3z1acyqykdig4qmzvos00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--seanjc.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=fyeUao6f; dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gq7d90Gb0z2yxk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 10:12:27 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id
 j21-20020a25d2150000b029057ac4b4e78fso984979ybg.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 17:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:message-id:mime-version:subject:from:to:cc;
 bh=JTnvoGQPkzSY6sftzgGOupURPM7Ep9m5Wy1FXJgvwt8=;
 b=fyeUao6f185gl09ZYsAcdA7yqynUAarWJxtZWYjEguvdRD3P7FagvzAviDCjWFv9rL
 hkTapS9n0MejNBYX2Q5yho2bHtiNxihusqY+CxIRaDELLoNGX+rLqUW5lJrnEo/Mnm0e
 tdASNb+sSeLR5tAQ8VguxhX7xu/etGncJN6MqDGLgROWk+szWdS+QKryOwUk7KtLD9kc
 VIB77hKdU4R/GCrKDGfJV45g5i0FA1HckPWMpfpc96fmGXzvuG0a3+dtXdvgVNUn85ch
 0fl8hUM/hx3+Jt5MkdC3np01fB7+YS8SSyrKtslPuKN3R0rpXVrltaB4IU7mkT2jcj3C
 EtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:message-id:mime-version:subject
 :from:to:cc;
 bh=JTnvoGQPkzSY6sftzgGOupURPM7Ep9m5Wy1FXJgvwt8=;
 b=rPw52za7XeTDEIbKnKbGdIs/Q16+uylas1Iqv1kPP+MVRUPaXGdrMqw6BuayTZWL61
 44qNRftMVFBAQ0Kr8x0vkUpkhLnhoAYDg+8PudEqTGztdNz6WJ6xg/BWSlNRIbxp/kWF
 nB1yi8pCEVS7Lzhr2F6Ou9Y0im/vTEHA+3WZ6PntIVANOaI2G5/f/uYUjLVsmlHD46AI
 onauSPNXWDp4M6LIvNkM/nlKVbJQt2d5X3RbwSrdYkLa5hiE2Ch+yC6OMtUFNxyCey/z
 ScZX+irp5vrWNVXzJGhSlGBNIH6Ahilhf+DijN8wB31AX0nDx1sf4OPGwRlSTBFQEr3D
 +SUQ==
X-Gm-Message-State: AOAM5305j67JxJT24J8q5utxaRnvIcen6XB3GnIADvmZAgGKQ5Djr1Dt
 F0QogdWmq3RSDtQ6OdrOhPwEPoss8mo=
X-Google-Smtp-Source: ABdhPJx/sMOLc7HCSgjqqqa43Z4/KNb0h6Qo8TurrCfZhkWk410D/oOp9imaDI4DVCS6cpPHQf2wmOXKS3s=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:158e:55a:74dd:5197])
 (user=seanjc job=sendgmr) by 2002:a25:7743:: with SMTP id
 s64mr7874463ybc.214.1629245543687; 
 Tue, 17 Aug 2021 17:12:23 -0700 (PDT)
Date: Tue, 17 Aug 2021 17:12:05 -0700
Message-Id: <20210818001210.4073390-1-seanjc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 0/5] KVM: rseq: Fix and a test for a KVM+rseq bug
From: Sean Christopherson <seanjc@google.com>
To: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@de.ibm.com>, Oleg Nesterov <oleg@redhat.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
 Andy Lutomirski <luto@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
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
Cc: linux-s390@vger.kernel.org, kvm@vger.kernel.org,
 Ben Gardon <bgardon@google.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-mips@vger.kernel.org,
 Peter Foley <pefoley@google.com>, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Sean Christopherson <seanjc@google.com>,
 Shakeel Butt <shakeelb@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patch 1 fixes a KVM+rseq bug where KVM's handling of TIF_NOTIFY_RESUME,
e.g. for task migration, clears the flag without informing rseq and leads
to stale data in userspace's rseq struct.

Patch 2 is a cleanup to try and make future bugs less likely.  It's also
a baby step towards moving and renaming tracehook_notify_resume() since
it has nothing to do with tracing.  It kills me to not do the move/rename
as part of this series, but having a dedicated series/discussion seems
more appropriate given the sheer number of architectures that call
tracehook_notify_resume() and the lack of an obvious home for the code.

Patch 3 is a fix/cleanup to stop overriding x86's unistd_{32,64}.h when
the include path (intentionally) omits tools' uapi headers.  KVM's
selftests do exactly that so that they can pick up the uapi headers from
the installed kernel headers, and still use various tools/ headers that
mirror kernel code, e.g. linux/types.h.  This allows the new test in
patch 4 to reference __NR_rseq without having to manually define it.

Patch 4 is a regression test for the KVM+rseq bug.

Patch 5 is a cleanup made possible by patch 3.


Sean Christopherson (5):
  KVM: rseq: Update rseq when processing NOTIFY_RESUME on xfer to KVM
    guest
  entry: rseq: Call rseq_handle_notify_resume() in
    tracehook_notify_resume()
  tools: Move x86 syscall number fallbacks to .../uapi/
  KVM: selftests: Add a test for KVM_RUN+rseq to detect task migration
    bugs
  KVM: selftests: Remove __NR_userfaultfd syscall fallback

 arch/arm/kernel/signal.c                      |   1 -
 arch/arm64/kernel/signal.c                    |   1 -
 arch/csky/kernel/signal.c                     |   4 +-
 arch/mips/kernel/signal.c                     |   4 +-
 arch/powerpc/kernel/signal.c                  |   4 +-
 arch/s390/kernel/signal.c                     |   1 -
 include/linux/tracehook.h                     |   2 +
 kernel/entry/common.c                         |   4 +-
 kernel/rseq.c                                 |   4 +-
 .../x86/include/{ => uapi}/asm/unistd_32.h    |   0
 .../x86/include/{ => uapi}/asm/unistd_64.h    |   3 -
 tools/testing/selftests/kvm/.gitignore        |   1 +
 tools/testing/selftests/kvm/Makefile          |   3 +
 tools/testing/selftests/kvm/rseq_test.c       | 131 ++++++++++++++++++
 14 files changed, 143 insertions(+), 20 deletions(-)
 rename tools/arch/x86/include/{ => uapi}/asm/unistd_32.h (100%)
 rename tools/arch/x86/include/{ => uapi}/asm/unistd_64.h (83%)
 create mode 100644 tools/testing/selftests/kvm/rseq_test.c

-- 
2.33.0.rc1.237.g0d66db33f3-goog

