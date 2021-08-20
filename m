Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A993F36DE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 00:51:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Grxgp3t7hz3d7t
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 08:51:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=c0x2Ekl3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--seanjc.bounces.google.com
 (client-ip=2607:f8b0:4864:20::74a; helo=mail-qk1-x74a.google.com;
 envelope-from=3sdegyqykdkmvhdqmfjrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--seanjc.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=c0x2Ekl3; dkim-atps=neutral
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com
 [IPv6:2607:f8b0:4864:20::74a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Grxg85cpjz306Y
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Aug 2021 08:50:26 +1000 (AEST)
Received: by mail-qk1-x74a.google.com with SMTP id
 70-20020a370b49000000b003d2f5f0dcc6so7438849qkl.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 15:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:message-id:mime-version:subject:from:to:cc;
 bh=gyS/18bxD5Ot3om3ClN1RHHdw6uDm46TAPmhFRClN7E=;
 b=c0x2Ekl31aHgoUr6bS0aBngW8SrcCyXGQ6Eg5RkenHrpLPuk61rKOt6P1SLL5kGpCV
 7Q/hwVqrOW+gQ/v3K19SjHlrik6vUlVurzVNjzrPZuy8yaIJYuxpQBictxecVo5Nq+kp
 75zG8M002Kjp/q5WlQpL9i9sO4ZrKNxIQavsXfw2HehYTn5oog/nQS8x/qaEbhMPUOUM
 ccXmKxYBcJpZ+gmTSFvQXJWzizQ+B84f2u2Q9D1+hN2pszPtrQntT2CFvtwN7i4kDteh
 N7lB2iyqekXxnNmmaDxg+oJ9mOUY3XV5hIyhddm0GtJ4OgnYpsgomnp8ihDtrwm3h+GE
 x/ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:message-id:mime-version:subject
 :from:to:cc;
 bh=gyS/18bxD5Ot3om3ClN1RHHdw6uDm46TAPmhFRClN7E=;
 b=khpNfnT6Z+yIEonV/k678rUt3l1iiTezdU2HuQmNj7pvlLr52htf9MdnW0de5qtHSA
 5q3Cuf+jF0wImc9Qb/XytYk2cHFfumYxFhN2EzbFV5b4EhLAQ+lOwRT2edx53+OXyZ1x
 XnbNglkpNqbqHGWd+H/u+UKHRKHPM2/+aP4XvvIo7YuSNBjjruOvZ9cuDTsSs0lmMlxz
 4q1iLljP90K3cV4azPufwJENMSoKZqvw389zhInBnO920ZsqJu9Qz8aJRVdJCLcrT2WL
 YI5KGb8T9Av9CCpJaueyAMp5lcByQU9/RC0j17mKvTi6ihjuA10qiIxuaAG0wcLQ1dM6
 MZeQ==
X-Gm-Message-State: AOAM531gD1FfPRpSEviOb447N28Z7gqfUCadT97XuhgFSoPAl4psWETD
 3//6q6tnB+Ij4fx8ayRGTzo3kUhN9T4=
X-Google-Smtp-Source: ABdhPJx4goZRGT6Tb8tV1HHxrF56PXshejmS+qu7yC6GJihmWv/bHnUoawuFayGttP22JtXzBIs2h2vWzkY=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:f11d:a281:af9b:5de6])
 (user=seanjc job=sendgmr) by 2002:a05:6214:ca2:: with SMTP id
 s2mr22615169qvs.35.1629499824082; Fri, 20 Aug 2021 15:50:24 -0700 (PDT)
Date: Fri, 20 Aug 2021 15:49:57 -0700
Message-Id: <20210820225002.310652-1-seanjc@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
Subject: [PATCH v2 0/5] KVM: rseq: Fix and a test for a KVM+rseq bug
From: Sean Christopherson <seanjc@google.com>
To: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Steven Rostedt <rostedt@goodmis.org>, 
 Ingo Molnar <mingo@redhat.com>, Oleg Nesterov <oleg@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Shuah Khan <shuah@kernel.org>
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
it has nothing to do with tracing.

Patch 3 is a fix/cleanup to stop overriding x86's unistd_{32,64}.h when
the include path (intentionally) omits tools' uapi headers.  KVM's
selftests do exactly that so that they can pick up the uapi headers from
the installed kernel headers, and still use various tools/ headers that
mirror kernel code, e.g. linux/types.h.  This allows the new test in
patch 4 to reference __NR_rseq without having to manually define it.

Patch 4 is a regression test for the KVM+rseq bug.

Patch 5 is a cleanup made possible by patch 3.

v2:
  - Don't touch rseq_cs when handling KVM case so that rseq_syscall() will
    still detect a naughty userspace. [Mathieu]
  - Use a sequence counter + retry in the test to ensure the process isn't
    migrated between sched_getcpu() and reading rseq.cpu_id, i.e. to
    avoid a flaky test. [Mathieu]
  - Add Mathieu's ack for patch 2.
  - Add more comments in the test.

v1: https://lkml.kernel.org/r/20210818001210.4073390-1-seanjc@google.com

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
 kernel/rseq.c                                 |  14 +-
 .../x86/include/{ => uapi}/asm/unistd_32.h    |   0
 .../x86/include/{ => uapi}/asm/unistd_64.h    |   3 -
 tools/testing/selftests/kvm/.gitignore        |   1 +
 tools/testing/selftests/kvm/Makefile          |   3 +
 tools/testing/selftests/kvm/rseq_test.c       | 154 ++++++++++++++++++
 14 files changed, 175 insertions(+), 21 deletions(-)
 rename tools/arch/x86/include/{ => uapi}/asm/unistd_32.h (100%)
 rename tools/arch/x86/include/{ => uapi}/asm/unistd_64.h (83%)
 create mode 100644 tools/testing/selftests/kvm/rseq_test.c

-- 
2.33.0.rc2.250.ged5fa647cd-goog

