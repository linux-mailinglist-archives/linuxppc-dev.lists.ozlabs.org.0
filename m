Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD7B3EF6B4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 02:13:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gq7dn5Hb1z3cSv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 10:13:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=vajtP/F/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--seanjc.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com;
 envelope-from=3avacyqykdio6so1xqu22uzs.q20zw18b33q-rs9zw676.2dzop6.25u@flex--seanjc.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=vajtP/F/; dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gq7d90XM6z2yxx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 10:12:28 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id
 s4-20020a259004000000b005947575ac53so1004532ybl.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 17:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=0kmO0MXVdRK0WdAgg/6yMEC7RBXf+m4S57NGAaoueXI=;
 b=vajtP/F/au1Tkxc/uMHpx+wr8aY1oET38J2sT1hES8QrTFB2Dr3oDgomOmJ/04aSMX
 lPK1QrJIh+mzpGub10rTCHasL8utUkiKO5AujazcvozxMjzzzWE/06eICjttBqDW3wf+
 L+e0XTHIKQBt1t0atCJyvQw6dljHh7sPVM+lNxiOVyhoa1DzUDDx6dQHJ2ZOrMCmt0xA
 fFbKEG/o6KcSe6yZPj3GRHJnKKFGJyAKq2ptleprShB7iq6yF+/x+neqdnUnQI+JIIMX
 VZ6h4TGr3Gq7pWzwv41cDDYdvfyYVIZwrxDQBv0kJyCpdV4sxAMmf3uwkTGRUUMGsrs7
 dfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=0kmO0MXVdRK0WdAgg/6yMEC7RBXf+m4S57NGAaoueXI=;
 b=rmiyA7IvRJSSlRUUiaZ1KSg9HKdyoIJJXUXu4hF4aRh9RoDtW0P2bV/wdId8BK8jJH
 hWHShEzkMsyCTQum09+r/plmXmLtC/NEGVt2HchV2ncOXFwnJn+QOm6QDDOBwThLwdGt
 wt2XSxd/bmowEGBI6N6hFcbRFGm9390eUWOLfNSHF4o1snQ9ikFQ0yaAyfCNZeCyKQje
 nw87Cv7n0Oao7JcIMfCHEYJ0NrLV4OSxO4mtduwD3PFDMJB2UykjY2MIsDtSvfFrkI7r
 VCFHJiNenownF4CO7iR9W0zOOULPQYMHBVXD9e/dJJAJYcT+7/6qFtGXDthnqgxs11Q9
 Xk/Q==
X-Gm-Message-State: AOAM532NqQUzYhbBs2hw1XDOTi2Awp2F6/IhQ3FK3nTCoJcmU493cnuU
 22QPhTiaJIYy97/YLJyIw73B1SEdhq8=
X-Google-Smtp-Source: ABdhPJwj0XdhQo6iokvEKxnWDKRRiWaTrHjA6QIRd/4VPgyLOcTkIrMPZ6K8bZ+tJ3Cs7VZGVyliISEEGh0=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:158e:55a:74dd:5197])
 (user=seanjc job=sendgmr) by 2002:a25:e60a:: with SMTP id
 d10mr7393693ybh.56.1629245545888; 
 Tue, 17 Aug 2021 17:12:25 -0700 (PDT)
Date: Tue, 17 Aug 2021 17:12:06 -0700
In-Reply-To: <20210818001210.4073390-1-seanjc@google.com>
Message-Id: <20210818001210.4073390-2-seanjc@google.com>
Mime-Version: 1.0
References: <20210818001210.4073390-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 1/5] KVM: rseq: Update rseq when processing NOTIFY_RESUME on
 xfer to KVM guest
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

Invoke rseq's NOTIFY_RESUME handler when processing the flag prior to
transferring to a KVM guest, which is roughly equivalent to an exit to
userspace and processes many of the same pending actions.  While the task
cannot be in an rseq critical section as the KVM path is reachable only
via ioctl(KVM_RUN), the side effects that apply to rseq outside of a
critical section still apply, e.g. the CPU ID needs to be updated if the
task is migrated.

Clearing TIF_NOTIFY_RESUME without informing rseq can lead to segfaults
and other badness in userspace VMMs that use rseq in combination with KVM,
e.g. due to the CPU ID being stale after task migration.

Fixes: 72c3c0fe54a3 ("x86/kvm: Use generic xfer to guest work function")
Reported-by: Peter Foley <pefoley@google.com>
Bisected-by: Doug Evans <dje@google.com>
Cc: Shakeel Butt <shakeelb@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 kernel/entry/kvm.c | 4 +++-
 kernel/rseq.c      | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/kernel/entry/kvm.c b/kernel/entry/kvm.c
index 49972ee99aff..049fd06b4c3d 100644
--- a/kernel/entry/kvm.c
+++ b/kernel/entry/kvm.c
@@ -19,8 +19,10 @@ static int xfer_to_guest_mode_work(struct kvm_vcpu *vcpu, unsigned long ti_work)
 		if (ti_work & _TIF_NEED_RESCHED)
 			schedule();
 
-		if (ti_work & _TIF_NOTIFY_RESUME)
+		if (ti_work & _TIF_NOTIFY_RESUME) {
 			tracehook_notify_resume(NULL);
+			rseq_handle_notify_resume(NULL, NULL);
+		}
 
 		ret = arch_xfer_to_guest_mode_handle_work(vcpu, ti_work);
 		if (ret)
diff --git a/kernel/rseq.c b/kernel/rseq.c
index 35f7bd0fced0..58c79a7918cd 100644
--- a/kernel/rseq.c
+++ b/kernel/rseq.c
@@ -236,7 +236,7 @@ static bool in_rseq_cs(unsigned long ip, struct rseq_cs *rseq_cs)
 
 static int rseq_ip_fixup(struct pt_regs *regs)
 {
-	unsigned long ip = instruction_pointer(regs);
+	unsigned long ip = regs ? instruction_pointer(regs) : 0;
 	struct task_struct *t = current;
 	struct rseq_cs rseq_cs;
 	int ret;
@@ -250,7 +250,7 @@ static int rseq_ip_fixup(struct pt_regs *regs)
 	 * If not nested over a rseq critical section, restart is useless.
 	 * Clear the rseq_cs pointer and return.
 	 */
-	if (!in_rseq_cs(ip, &rseq_cs))
+	if (!regs || !in_rseq_cs(ip, &rseq_cs))
 		return clear_rseq_cs(t);
 	ret = rseq_need_restart(t, rseq_cs.flags);
 	if (ret <= 0)
-- 
2.33.0.rc1.237.g0d66db33f3-goog

