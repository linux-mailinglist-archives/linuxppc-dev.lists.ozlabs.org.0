Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E92F03FE421
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 22:34:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0G4l5L1mz3cJd
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 06:34:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=d1pxFxqJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--seanjc.bounces.google.com
 (client-ip=2607:f8b0:4864:20::849; helo=mail-qt1-x849.google.com;
 envelope-from=39-ivyqykdiw8uq3zsw44w1u.s421y3ad55s-tub1y898.4f1qr8.47w@flex--seanjc.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=d1pxFxqJ; dkim-atps=neutral
Received: from mail-qt1-x849.google.com (mail-qt1-x849.google.com
 [IPv6:2607:f8b0:4864:20::849])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0G0V0XBhz2yJj
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 06:30:49 +1000 (AEST)
Received: by mail-qt1-x849.google.com with SMTP id
 k3-20020ac80203000000b0029f2c3c6b34so855927qtg.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 01 Sep 2021 13:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=6ZnGJJdv4n8mbt+RRpvBUW8D60FX4+hBHNzvuCZCTkM=;
 b=d1pxFxqJMbf3szpeZg0swAOEez6wH0zflg3vAq4KGbMImJ4S+KcHkhLB2r/3ioVEjj
 ZLhMOpEXMbzCd0IWl9AkSsBlcbzJmd/lYcIK62ZIhRKzL4NvbVpZZVPoNMVqdiHHbt4l
 QbALEWkmHHyf/Sxszih3MXmSDzw28c9uX4Z6jqZP9TuQMex85DDMRFWrKHdddQ1LfBDG
 HR2V+1v5QBtwvPNmJM7wbgXhZ/x0UcPvJa2o/Y/oXzQq4oHwW3F/hSIbY0H235BKyazb
 jt7ElehpbA0TgSdQZQHpNpry8CrPH3K3ffwS8r087C919IqMkZVLjJpdsnXa0ZlxJf0O
 /VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=6ZnGJJdv4n8mbt+RRpvBUW8D60FX4+hBHNzvuCZCTkM=;
 b=Th3hG4wWDJAopZl41gkrpbhihbIhsaKUpxMzJVP5VcL5KmMdkl0uKd+ch6hOBMZRzb
 C9KfIJ+wV0EJskHpRautVQWZkzbEQj//s0q5/wS0WanKe6w1laB8kaYE2fclMnGJJJwP
 6kclmfNLOO1aDyIyYORuAxZz2tC/T8H5jrZXMkUCeR9zmKTBQIo5D6qUWlrlmvn8aQqV
 y/JTiJPSuWk/Ea22E2ohZRw2x42rkkVoPhPMkEpYk0lx0C+Ww9M+Zm4MiG9YYgW8hT0W
 Cn2b+kGZEkC6lQY7p833ZO6l6EDYHKjvc533o2GvfrFrcKay5ylUL1paGnVU79UwdbnB
 kquA==
X-Gm-Message-State: AOAM5330pWXdMrWoUtJoRVydPhZcqAf2BjUiOUA6A5ZXDNTw0hK1wlB6
 nEZZrqRPfsm5iH3bkXYX9+JJRBDyYrA=
X-Google-Smtp-Source: ABdhPJwYmVdzRr+jSYE642JvpN+Oe5nX73xj03Cuo8ty9uFNk/pmfGvXKihV+8dOLi2D30iy1yma/XQrogE=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:9935:5a5e:c7b6:e649])
 (user=seanjc job=sendgmr) by 2002:a05:6214:104d:: with SMTP id
 l13mr1694132qvr.13.1630528247381; Wed, 01 Sep 2021 13:30:47 -0700 (PDT)
Date: Wed,  1 Sep 2021 13:30:30 -0700
In-Reply-To: <20210901203030.1292304-1-seanjc@google.com>
Message-Id: <20210901203030.1292304-6-seanjc@google.com>
Mime-Version: 1.0
References: <20210901203030.1292304-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.153.gba50c8fa24-goog
Subject: [PATCH v3 5/5] KVM: selftests: Remove __NR_userfaultfd syscall
 fallback
From: Sean Christopherson <seanjc@google.com>
To: Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>, 
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Oleg Nesterov <oleg@redhat.com>, 
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
Cc: kvm@vger.kernel.org, Ben Gardon <bgardon@google.com>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, Peter Foley <pefoley@google.com>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Sean Christopherson <seanjc@google.com>, Shakeel Butt <shakeelb@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Revert the __NR_userfaultfd syscall fallback added for KVM selftests now
that x86's unistd_{32,63}.h overrides are under uapi/ and thus not in
KVM sefltests' search path, i.e. now that KVM gets x86 syscall numbers
from the installed kernel headers.

No functional change intended.

Reviewed-by: Ben Gardon <bgardon@google.com>
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
2.33.0.153.gba50c8fa24-goog

