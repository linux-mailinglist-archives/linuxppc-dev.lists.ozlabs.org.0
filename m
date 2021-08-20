Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D89C33F3708
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 00:52:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrxjD5G34z3cTS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Aug 2021 08:52:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=Y/9oq0nM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--seanjc.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com;
 envelope-from=3tdegyqykdkczlhuqjnvvnsl.jvtspubewwj-klcspzaz.vgshiz.vyn@flex--seanjc.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Y/9oq0nM; dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com
 [IPv6:2607:f8b0:4864:20::b49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrxgC43dNz306Y
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Aug 2021 08:50:31 +1000 (AEST)
Received: by mail-yb1-xb49.google.com with SMTP id
 j21-20020a25d2150000b029057ac4b4e78fso11022757ybg.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 15:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=gJGDno5klw1XWXHZwjjz8QtpqHXGwJ6PM18IirOkI4E=;
 b=Y/9oq0nMIPvoCL9CTWZ/XfjOgK5S9SGDHb2RXM7plfEV8R736kfS/mVaau+uS61SJS
 ZcHbTFNVquLsTw5/Cgp7gZ9GlIaPPC1AuedEsix1Xl+nOiYD5bszAV76QDFt/JgvEqCl
 wsyG1kyx9Jl3u03r2nF2Oub5MJ93qXCws2Pa5A1Zf6UmXmszQK8I460CPN6ayIpMhkY8
 eMX5TGteHEALuSiHGHkxbmeXFfVFIJ6NzZZbghS+9tm87+GhTwMdEMS1gn49Y1aH42fw
 zJ4BqNg/gPBQ3v9tbwL0EAJ+OXKA9B2Gf9tro5WKFD5dQMrDYXujqk8rPQDDTP8IPIYq
 W58w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=gJGDno5klw1XWXHZwjjz8QtpqHXGwJ6PM18IirOkI4E=;
 b=qvq0x8+5zotGBmHIaHsGsxc0vai+M7kpn8dS9VGvItz0T8Xm83mEZ5an3wPWHtMtFQ
 jjZpdXZl/dNIOwrfBmHbsGfxWu63PmCvVtad5boOcB72hcWpM5E4bEE7v0FeSHrdfAdR
 793mbSxXmH/FQ7izQcYmaKW953R0zdQ5RaAiYXcUqObht69LQ1pvpIxdqoluRcoLc8SY
 wCr74eTAPZaZDXsOwQ//JOkiGRdiXSEXS7wPmz7Hj6F32i7fDW64xDlrm0EScqT8qk03
 ARnn/i2h6Ec4zbG+8olgLjfrZgDeVOq8ibbgTHOgldmDEhdnzJlEDyLjvCX19VHhXYts
 aGtA==
X-Gm-Message-State: AOAM530qGQkCpSs1T/zSxGfp5FyMGh2Ohu42LtB80oX3Z/9SvMoxHWMm
 4B6k+xTuiLChYXoGhZ3N7fRO9U4Lbtg=
X-Google-Smtp-Source: ABdhPJyV62gidknEb4k4a6DMafmSrAzZNIWz+Uk5mR+ELt24rWU/K+sp1dx9Z4H73mtx1X87SZND7NGjzdo=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:f11d:a281:af9b:5de6])
 (user=seanjc job=sendgmr) by 2002:a25:d242:: with SMTP id
 j63mr27053838ybg.99.1629499828874; 
 Fri, 20 Aug 2021 15:50:28 -0700 (PDT)
Date: Fri, 20 Aug 2021 15:49:59 -0700
In-Reply-To: <20210820225002.310652-1-seanjc@google.com>
Message-Id: <20210820225002.310652-3-seanjc@google.com>
Mime-Version: 1.0
References: <20210820225002.310652-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.rc2.250.ged5fa647cd-goog
Subject: [PATCH v2 2/5] entry: rseq: Call rseq_handle_notify_resume() in
 tracehook_notify_resume()
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

Invoke rseq_handle_notify_resume() from tracehook_notify_resume() now
that the two function are always called back-to-back by architectures
that have rseq.  The rseq helper is stubbed out for architectures that
don't support rseq, i.e. this is a nop across the board.

Note, tracehook_notify_resume() is horribly named and arguably does not
belong in tracehook.h as literally every line of code in it has nothing
to do with tracing.  But, that's been true since commit a42c6ded827d
("move key_repace_session_keyring() into tracehook_notify_resume()")
first usurped tracehook_notify_resume() back in 2012.  Punt cleaning that
mess up to future patches.

No functional change intended.

Acked-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm/kernel/signal.c     | 1 -
 arch/arm64/kernel/signal.c   | 1 -
 arch/csky/kernel/signal.c    | 4 +---
 arch/mips/kernel/signal.c    | 4 +---
 arch/powerpc/kernel/signal.c | 4 +---
 arch/s390/kernel/signal.c    | 1 -
 include/linux/tracehook.h    | 2 ++
 kernel/entry/common.c        | 4 +---
 kernel/entry/kvm.c           | 4 +---
 9 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/arch/arm/kernel/signal.c b/arch/arm/kernel/signal.c
index a3a38d0a4c85..9df68d139965 100644
--- a/arch/arm/kernel/signal.c
+++ b/arch/arm/kernel/signal.c
@@ -670,7 +670,6 @@ do_work_pending(struct pt_regs *regs, unsigned int thread_flags, int syscall)
 				uprobe_notify_resume(regs);
 			} else {
 				tracehook_notify_resume(regs);
-				rseq_handle_notify_resume(NULL, regs);
 			}
 		}
 		local_irq_disable();
diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
index 23036334f4dc..22b55db13da6 100644
--- a/arch/arm64/kernel/signal.c
+++ b/arch/arm64/kernel/signal.c
@@ -951,7 +951,6 @@ asmlinkage void do_notify_resume(struct pt_regs *regs,
 
 			if (thread_flags & _TIF_NOTIFY_RESUME) {
 				tracehook_notify_resume(regs);
-				rseq_handle_notify_resume(NULL, regs);
 
 				/*
 				 * If we reschedule after checking the affinity
diff --git a/arch/csky/kernel/signal.c b/arch/csky/kernel/signal.c
index 312f046d452d..bc4238b9f709 100644
--- a/arch/csky/kernel/signal.c
+++ b/arch/csky/kernel/signal.c
@@ -260,8 +260,6 @@ asmlinkage void do_notify_resume(struct pt_regs *regs,
 	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
 		do_signal(regs);
 
-	if (thread_info_flags & _TIF_NOTIFY_RESUME) {
+	if (thread_info_flags & _TIF_NOTIFY_RESUME)
 		tracehook_notify_resume(regs);
-		rseq_handle_notify_resume(NULL, regs);
-	}
 }
diff --git a/arch/mips/kernel/signal.c b/arch/mips/kernel/signal.c
index f1e985109da0..c9b2a75563e1 100644
--- a/arch/mips/kernel/signal.c
+++ b/arch/mips/kernel/signal.c
@@ -906,10 +906,8 @@ asmlinkage void do_notify_resume(struct pt_regs *regs, void *unused,
 	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
 		do_signal(regs);
 
-	if (thread_info_flags & _TIF_NOTIFY_RESUME) {
+	if (thread_info_flags & _TIF_NOTIFY_RESUME)
 		tracehook_notify_resume(regs);
-		rseq_handle_notify_resume(NULL, regs);
-	}
 
 	user_enter();
 }
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index e600764a926c..b93b87df499d 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -293,10 +293,8 @@ void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags)
 		do_signal(current);
 	}
 
-	if (thread_info_flags & _TIF_NOTIFY_RESUME) {
+	if (thread_info_flags & _TIF_NOTIFY_RESUME)
 		tracehook_notify_resume(regs);
-		rseq_handle_notify_resume(NULL, regs);
-	}
 }
 
 static unsigned long get_tm_stackpointer(struct task_struct *tsk)
diff --git a/arch/s390/kernel/signal.c b/arch/s390/kernel/signal.c
index 78ef53b29958..b307db26bf2d 100644
--- a/arch/s390/kernel/signal.c
+++ b/arch/s390/kernel/signal.c
@@ -537,5 +537,4 @@ void arch_do_signal_or_restart(struct pt_regs *regs, bool has_signal)
 void do_notify_resume(struct pt_regs *regs)
 {
 	tracehook_notify_resume(regs);
-	rseq_handle_notify_resume(NULL, regs);
 }
diff --git a/include/linux/tracehook.h b/include/linux/tracehook.h
index 3e80c4bc66f7..2564b7434b4d 100644
--- a/include/linux/tracehook.h
+++ b/include/linux/tracehook.h
@@ -197,6 +197,8 @@ static inline void tracehook_notify_resume(struct pt_regs *regs)
 
 	mem_cgroup_handle_over_high();
 	blkcg_maybe_throttle_current();
+
+	rseq_handle_notify_resume(NULL, regs);
 }
 
 /*
diff --git a/kernel/entry/common.c b/kernel/entry/common.c
index bf16395b9e13..d5a61d565ad5 100644
--- a/kernel/entry/common.c
+++ b/kernel/entry/common.c
@@ -171,10 +171,8 @@ static unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
 		if (ti_work & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
 			handle_signal_work(regs, ti_work);
 
-		if (ti_work & _TIF_NOTIFY_RESUME) {
+		if (ti_work & _TIF_NOTIFY_RESUME)
 			tracehook_notify_resume(regs);
-			rseq_handle_notify_resume(NULL, regs);
-		}
 
 		/* Architecture specific TIF work */
 		arch_exit_to_user_mode_work(regs, ti_work);
diff --git a/kernel/entry/kvm.c b/kernel/entry/kvm.c
index 049fd06b4c3d..49972ee99aff 100644
--- a/kernel/entry/kvm.c
+++ b/kernel/entry/kvm.c
@@ -19,10 +19,8 @@ static int xfer_to_guest_mode_work(struct kvm_vcpu *vcpu, unsigned long ti_work)
 		if (ti_work & _TIF_NEED_RESCHED)
 			schedule();
 
-		if (ti_work & _TIF_NOTIFY_RESUME) {
+		if (ti_work & _TIF_NOTIFY_RESUME)
 			tracehook_notify_resume(NULL);
-			rseq_handle_notify_resume(NULL, NULL);
-		}
 
 		ret = arch_xfer_to_guest_mode_handle_work(vcpu, ti_work);
 		if (ret)
-- 
2.33.0.rc2.250.ged5fa647cd-goog

