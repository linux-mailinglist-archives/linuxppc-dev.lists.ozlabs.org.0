Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A931B3EF6C9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 02:16:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gq7jV4dchz3dVh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 10:16:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=SPf96yhV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--seanjc.bounces.google.com
 (client-ip=2607:f8b0:4864:20::84a; helo=mail-qt1-x84a.google.com;
 envelope-from=3clacyqykdjmf1xa6z3bb381.zb985ahkccz-01i85fgf.bm8xyf.be3@flex--seanjc.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=SPf96yhV; dkim-atps=neutral
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gq7dL1MbHz3bNh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 10:12:38 +1000 (AEST)
Received: by mail-qt1-x84a.google.com with SMTP id
 o22-20020ac872d60000b029029817302575so110531qtp.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 17:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=b+D2wYBAlQke3x9JmkHfnRLEolzYl7vtoLkPYastC9U=;
 b=SPf96yhVitla9fan3IPn+20/DnpTxFcV2rJEUslNb4wU2oCEHWEr0TqYuejQIpJC6o
 jNSlYG+qBG8JbfyX7VG4m902MAYzTMIKxE+J/MrcopqG+WhchVZGJ22ACD9otOp/g1MJ
 y8nklKpCoREBa48CLrIfCPmMdB2GYVCrgtlvmB4GKsIMsEqBcxosOyXpoGKbtYzFUxZP
 Mm1I083bv5z0TQY7dAZh75UyzcpU/oojg63UuFCwEtyUQLcR51nv2dL3CjfuKg5iKWol
 K+EQ3dmDwhxcBXzNf+59Mx+svVE9z+9may7ss8OC49FzSgAQttlvHK9DI1ILn8qo818b
 bPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=b+D2wYBAlQke3x9JmkHfnRLEolzYl7vtoLkPYastC9U=;
 b=udr8vK7P8yuK7ByGxeXLrkSEzrUaVKmSjeL9Sthl8EeUNaKKOAkAecJl55vlheMrhR
 oyLcsMyisdME2DR/Ha/0/zbRW8mhTaVHWxjg6gYZzzQ1va/iGc8oDfwpnvgRPnuvoTkX
 bu5/AZ9eiYZbog28e2C+b4sqVJYUECJxHQDfnYMbvbvqAC7PjgTcqP6n2qQ9y0tgkGDE
 8po0sSYA1ndJzw6yvd+AwT4KdQC7e5jhFLsrFHadLXYdA8/MIv0ErwoeBxet1alsSW16
 lv3wodj/9jgk0Fyw/HEA/n5oya+QTuHuCNf77BjEw+IoLEv2oVcMz8jw18HyQVRmi1rH
 OwXg==
X-Gm-Message-State: AOAM532oK/CmqiVPeDR3+HW3sR3F43y3tHHyaQ29VfPE86PfvyY+R0Wi
 gKP1+Fa1vcYWuNrdgPJE8N2SLGn4YtE=
X-Google-Smtp-Source: ABdhPJwjcybq5SY8/j4KCEcr/HLmkC+uHYVjqMZ/h+nMujuHcP7O+f1gmxV0bp94O0yeV50pIPXQ8l0qs8Q=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:158e:55a:74dd:5197])
 (user=seanjc job=sendgmr) by 2002:ad4:46cb:: with SMTP id
 g11mr6107577qvw.45.1629245554714; 
 Tue, 17 Aug 2021 17:12:34 -0700 (PDT)
Date: Tue, 17 Aug 2021 17:12:10 -0700
In-Reply-To: <20210818001210.4073390-1-seanjc@google.com>
Message-Id: <20210818001210.4073390-6-seanjc@google.com>
Mime-Version: 1.0
References: <20210818001210.4073390-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 5/5] KVM: selftests: Remove __NR_userfaultfd syscall fallback
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

Revert the __NR_userfaultfd syscall fallback added for KVM selftests now
that x86's unistd_{32,63}.h overrides are under uapi/ and thus not in
KVM sefltests' search path, i.e. now that KVM gets x86 syscall numbers
from the installed kernel headers.

No functional change intended.

Cc: Ben Gardon <bgardon@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/arch/x86/include/uapi/asm/unistd_64.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/arch/x86/include/uapi/asm/unistd_64.h b/tools/arch/x86/include/uapi/asm/unistd_64.h
index 4205ed4158bf..cb52a3a8b8fc 100644
--- a/tools/arch/x86/include/uapi/asm/unistd_64.h
+++ b/tools/arch/x86/include/uapi/asm/unistd_64.h
@@ -1,7 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __NR_userfaultfd
-#define __NR_userfaultfd 282
-#endif
 #ifndef __NR_perf_event_open
 # define __NR_perf_event_open 298
 #endif
-- 
2.33.0.rc1.237.g0d66db33f3-goog

