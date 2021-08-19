Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C482F3F23D7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 01:49:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrM1V4yD1z3cGS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 09:49:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=BbFJLtvx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=BbFJLtvx; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrM0n503qz2xlC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 09:48:39 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id n5so6117777pjt.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 16:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=peyh3WLA8DgwuaakoXbly04TuP2J4HXY0owEUug9y1c=;
 b=BbFJLtvxbxBG+7picsXObo5Qj8iquJ+C6Q7w5pe27YupZ7+zDXLN540+QU8HPzkPh2
 WwzvQTknLR7mJUL2ZtsslkF86UhNT3PUimzJd1W/xc0YsfWgxj0uNN/X65pRaldPuQy1
 Svz/l9I2+rXfrKEmbGry3ew82Uw0db0pKDxq9ukmqwtSMFXcHcAuMrcqlCqOeGH1V/uC
 AqRS5aTXg3eyxy84gMMrOJhW6Ac+BzpVGDyg6q+eRN+OlPt5iJkRzEHzotLklvgBWCCO
 ThS3AjXFs8AEz4pcXFmbRPSyBU/T0LhtGGlVC0DabZEeUTxAm2SIBNQHSE15qMVZvLr/
 ceIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=peyh3WLA8DgwuaakoXbly04TuP2J4HXY0owEUug9y1c=;
 b=YL/SsOqYrZwsMMoTwwSWUGYj+Sl+nPiJFaBtezzISjgt4bVP1N3soz17/iyxmT/anx
 yNUcJRaRlIjXL9N9t+D+J+EGHho6o8kqJK3Tw+bY/2u993oi5/v8qSLt6NiD5LD4AnUy
 s2Nx/aS5jLhalmeLUJsKLrN8wTdTS5mqShrc2gznURMkkg8UVnHPvG+Rj8LOb5WgJZ4L
 gXndi2JZiLen8ralrIQnHuxst5h1+E1ntCTEFp/lIcur+gv6o7QE8yS0Pw+HJGGfYlSO
 YRFzUO+MN1PLAw+k6bJVVbkpxq944NK6RbwV3WI+gi3zjfNbbbvqFGkA5pef6Z2HTAVL
 9wJQ==
X-Gm-Message-State: AOAM530x+Qu1f+vEs7pC5PzOTHiLD63pgt8bQSi5TxTbpLwYphjuzjY1
 07lc42fj3auj1/NUz1BLdTYmhA==
X-Google-Smtp-Source: ABdhPJwX9PVK0tEzKb91C/ktX1nj3RcgHWNnmrdk1FjTlt3T+0IB78U5SgxuhlVnRMNmyLPH0lN5vw==
X-Received: by 2002:a17:90b:80c:: with SMTP id
 bk12mr1415764pjb.134.1629416916083; 
 Thu, 19 Aug 2021 16:48:36 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id a4sm4880315pfk.0.2021.08.19.16.48.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 16:48:35 -0700 (PDT)
Date: Thu, 19 Aug 2021 23:48:29 +0000
From: Sean Christopherson <seanjc@google.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH 1/5] KVM: rseq: Update rseq when processing NOTIFY_RESUME
 on xfer to KVM guest
Message-ID: <YR7tzZ98XC6OV2vu@google.com>
References: <20210818001210.4073390-1-seanjc@google.com>
 <20210818001210.4073390-2-seanjc@google.com>
 <1673583543.19718.1629409152244.JavaMail.zimbra@efficios.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1673583543.19718.1629409152244.JavaMail.zimbra@efficios.com>
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
Cc: KVM list <kvm@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, linux-kselftest <linux-kselftest@vger.kernel.org>,
 Ben Gardon <bgardon@google.com>, shuah <shuah@kernel.org>,
 Paul Mackerras <paulus@samba.org>, linux-s390@vger.kernel.org,
 gor <gor@linux.ibm.com>, "Russell King, ARM Linux" <linux@armlinux.org.uk>,
 linux-csky <linux-csky@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org,
 Boqun Feng <boqun.feng@gmail.com>, paulmck <paulmck@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, rostedt <rostedt@goodmis.org>,
 Shakeel Butt <shakeelb@google.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Peter Foley <pefoley@google.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Oleg Nesterov <oleg@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 19, 2021, Mathieu Desnoyers wrote:
> ----- On Aug 17, 2021, at 8:12 PM, Sean Christopherson seanjc@google.com wrote:
> > @@ -250,7 +250,7 @@ static int rseq_ip_fixup(struct pt_regs *regs)
> > 	 * If not nested over a rseq critical section, restart is useless.
> > 	 * Clear the rseq_cs pointer and return.
> > 	 */
> > -	if (!in_rseq_cs(ip, &rseq_cs))
> > +	if (!regs || !in_rseq_cs(ip, &rseq_cs))
> 
> I think clearing the thread's rseq_cs unconditionally here when regs is NULL
> is not the behavior we want when this is called from xfer_to_guest_mode_work.
> 
> If we have a scenario where userspace ends up calling this ioctl(KVM_RUN)
> from within a rseq c.s., we really want a CONFIG_DEBUG_RSEQ=y kernel to
> kill this application in the rseq_syscall handler when exiting back to usermode
> when the ioctl eventually returns.
> 
> However, clearing the thread's rseq_cs will prevent this from happening.
> 
> So I would favor an approach where we simply do:
> 
> if (!regs)
>      return 0;
> 
> Immediately at the beginning of rseq_ip_fixup, before getting the instruction
> pointer, so effectively skip all side-effects of the ip fixup code. Indeed, it
> is not relevant to do any fixup here, because it is nested in a ioctl system
> call.
> 
> Effectively, this would preserve the SIGSEGV behavior when this ioctl is
> erroneously called by user-space from a rseq critical section.

Ha, that's effectively what I implemented first, but I changed it because of the
comment in clear_rseq_cs() that says:

  The rseq_cs field is set to NULL on preemption or signal delivery ... as well
  as well as on top of code outside of the rseq assembly block.

Which makes it sound like something might rely on clearing rseq_cs?

Ah, or is it the case that rseq_cs is non-NULL if and only if userspace is in an
rseq critical section, and because syscalls in critical sections are illegal, by
definition clearing rseq_cs is a nop unless userspace is misbehaving.

If that's true, what about explicitly checking that at NOTIFY_RESUME?  Or is it
not worth the extra code to detect an error that will likely be caught anyways?

diff --git a/kernel/rseq.c b/kernel/rseq.c
index 35f7bd0fced0..28b8342290b0 100644
--- a/kernel/rseq.c
+++ b/kernel/rseq.c
@@ -282,6 +282,13 @@ void __rseq_handle_notify_resume(struct ksignal *ksig, struct pt_regs *regs)

        if (unlikely(t->flags & PF_EXITING))
                return;
+       if (!regs) {
+#ifdef CONFIG_DEBUG_RSEQ
+               if (t->rseq && rseq_get_rseq_cs(t, &rseq_cs))
+                       goto error;
+#endif
+               return;
+       }
        ret = rseq_ip_fixup(regs);
        if (unlikely(ret < 0))
                goto error;

> Thanks for looking into this !
> 
> Mathieu
> 
> > 		return clear_rseq_cs(t);
> > 	ret = rseq_need_restart(t, rseq_cs.flags);
> > 	if (ret <= 0)
> > --
> > 2.33.0.rc1.237.g0d66db33f3-goog
> 
> -- 
> Mathieu Desnoyers
> EfficiOS Inc.
> http://www.efficios.com
