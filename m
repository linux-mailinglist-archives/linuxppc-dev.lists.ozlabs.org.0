Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 015776EE0F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 13:13:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5K9w6SlWz3f5G
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 21:13:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=paR1bePG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=paR1bePG;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5K951Phsz30Qg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 21:12:39 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-51b0f9d7d70so5776548a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 04:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682421156; x=1685013156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqGIa/lrLpJrmoRpxyzaA1Tx9m/kyGx/QdMVB4h890s=;
        b=paR1bePGwkgWwCzvt9zWE/3yIXCNWtmSsT0JXOZCoOkDwFWX5qx/0q1xVz7W8UPZ8/
         NZ3jKCA8TuuawZYRspyQMrpqS6JGEUe96ObvOff8tZCvtv5CTo4d9yymQ7zYRW46nPlO
         cr9qW29XSjWt4y32wKiuST9i/1hv/S20dD7aOy8cSE2bn9KWbXRXH1Z48UGljuFOiq0J
         ZNcAWtZ51M9j7aSIbCRt99aROSoOGOQQtMpTyUz+G+21EfglryeaMgvwD4kpywkZCER0
         Aw2x7m5XQBHI19c4J2jbX63V6kYHho+46BGCvx9G0e1O3NU4WmpadgKAo9oZ4I81WRic
         zoNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682421156; x=1685013156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqGIa/lrLpJrmoRpxyzaA1Tx9m/kyGx/QdMVB4h890s=;
        b=BVYtflH1CFUWS+tfTD6/UP9IalvPdjm8tTdptJEduleJaJE+xRth4m6jVROM40B9ug
         UrSKdZ+cCfpYKkULsjoqHFb32foTdgIJt+LKVVMmKc0ds95CJXm8RyHjAV/c6UPJQ2iH
         ZgDSA1RZjddJstjNh+nlfybY3KdiTsadxqDy5jFYkMgHhskrHWfZ9fbkr4QAiEKC+1CM
         wjOCuTwageGlryM1zKA729YZbHOTdHmg3m91NiydmpJbYtSG8SZyGmevzoNcYHaEQWAj
         fXxLuYETsL6fLIHAO8gUTN2r0Yu251qHUa7FNFbWhNOMw4VnxI71Wi4/s/FAzxvsBnbY
         I0XA==
X-Gm-Message-State: AAQBX9emjcwYHn0Vw5QNr/xnFQ2urMPWj8ioBmTTA5Tgsff9qD30yLDp
	MeRwG5RSURPgCbRg/rutgqmYxdZ04Xf24YYiTXY=
X-Google-Smtp-Source: AKy350YaE9BuCCjbRY5bQ9+2YtrPPIBrPUupFyzvYcjpsSPT95PtmSW2xc4vMHs4fq1+TdODtxYKoQH9Yo8mDvNlnQc=
X-Received: by 2002:a17:90a:950e:b0:24b:2ef6:64d5 with SMTP id
 t14-20020a17090a950e00b0024b2ef664d5mr16266352pjo.47.1682421156130; Tue, 25
 Apr 2023 04:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <CAEXW_YSSGYgqTpxqbYikCFS9t=2f+L-0phbU+gAAngB5z-FbyA@mail.gmail.com>
 <ZEXOMC2casTlobE1@boqun-archlinux> <87fs8pzalj.fsf@mail.concordia>
 <20230424151351.GP19790@gate.crashing.org> <ZEagN1jJwg+rUzX4@boqun-archlinux>
 <CAEXW_YRfetnhgCw5OgnwhgZF_U+UkHN=uy=L8ovGLqn1UCtfTg@mail.gmail.com>
 <20230425101324.GD1331236@hirez.programming.kicks-ass.net>
 <CAABZP2ypJ98T3XAqPnLrxxzrYckSQ6sn3woEmpigQ+cRRaw=Zw@mail.gmail.com> <CAEXW_YQEarLt7YGQZdwmcSyZcGRCGKf89ovxjQdXBO-TgXAk-w@mail.gmail.com>
In-Reply-To: <CAEXW_YQEarLt7YGQZdwmcSyZcGRCGKf89ovxjQdXBO-TgXAk-w@mail.gmail.com>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Tue, 25 Apr 2023 11:12:25 +0800
Message-ID: <CAABZP2x5UMxuNYEr6ATsbZPywdnHYYMvi7Pyy80aSqpcHk9yTw@mail.gmail.com>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
To: Joel Fernandes <joel@joelfernandes.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, lance@osuosl.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 25, 2023 at 7:06=E2=80=AFPM Joel Fernandes <joel@joelfernandes.=
org> wrote:
>
> On Tue, Apr 25, 2023 at 6:58=E2=80=AFAM Zhouyi Zhou <zhouzhouyi@gmail.com=
> wrote:
> >
> > hi
> >
> > On Tue, Apr 25, 2023 at 6:13=E2=80=AFPM Peter Zijlstra <peterz@infradea=
d.org> wrote:
> > >
> > > On Mon, Apr 24, 2023 at 02:55:11PM -0400, Joel Fernandes wrote:
> > > > This is amazing debugging Boqun, like a boss! One comment below:
> > > >
> > > > > > > Or something simple I haven't thought of? :)
> > > > > >
> > > > > > At what points can r13 change?  Only when some particular funct=
ions are
> > > > > > called?
> > > > > >
> > > > >
> > > > > r13 is the local paca:
> > > > >
> > > > >         register struct paca_struct *local_paca asm("r13");
> > > > >
> > > > > , which is a pointer to percpu data.
> > > > >
> > > > > So if a task schedule from one CPU to anotehr CPU, the value gets
> > > > > changed.
> > > >
> > > > It appears the whole issue, per your analysis, is that the stack
> > > > checking code in gcc should not cache or alias r13, and must read i=
ts
> > > > most up-to-date value during stack checking, as its value may have
> > > > changed during a migration to a new CPU.
> > > >
> > > > Did I get that right?
> > > >
> > > > IMO, even without a reproducer, gcc on PPC should just not do that,
> > > > that feels terribly broken for the kernel. I wonder what clang does=
,
> > > > I'll go poke around with compilerexplorer after lunch.
> > > >
> > > > Adding +Peter Zijlstra as well to join the party as I have a feelin=
g
> > > > he'll be interested. ;-)
> > >
> > > I'm a little confused; the way I understand the whole stack protector
> > > thing to work is that we push a canary on the stack at call and on
> > > return check it is still valid. Since in general tasks randomly migra=
te,
> > > the per-cpu validation canary should be the same on all CPUs.
> > >
> > > Additionally, the 'new' __srcu_read_{,un}lock_nmisafe() functions use
> > > raw_cpu_ptr() to get 'a' percpu sdp, preferably that of the local cpu=
,
> > > but no guarantees.
> > >
> > > Both cases use r13 (paca) in a racy manner, and in both cases it shou=
ld
> > > be safe.
> > New test results today: both gcc build from git (git clone
> > git://gcc.gnu.org/git/gcc.git) and Ubuntu 22.04 gcc-12.1.0
> > are immune from the above issue. We can see the assembly code on
> > http://140.211.169.189/0425/srcu_gp_start_if_needed-gcc-12.txt
> >
> > while
> > Both native gcc on PPC vm (gcc version 9.4.0), and gcc cross compiler
> > on my x86 laptop (gcc version 10.4.0) will reproduce the bug.
>
> Do you know what fixes the issue? I would not declare victory yet. My
> feeling is something changes in timing, or compiler codegen which
> hides the issue. So the issue is still there but it is just a matter
> of time before someone else reports it.
I am going to try bisect on GCC, hope we can find some clue.
>
> Out of curiosity for PPC folks, why cannot 64-bit PPC use per-task
> canary? Michael, is this an optimization? Adding Christophe as well
> since it came in a few years ago via the following commit:
>
> commit 06ec27aea9fc84d9c6d879eb64b5bcf28a8a1eb7
> Author: Christophe Leroy <christophe.leroy@c-s.fr>
> Date:   Thu Sep 27 07:05:55 2018 +0000
>
>     powerpc/64: add stack protector support
>
>     On PPC64, as register r13 points to the paca_struct at all time,
>     this patch adds a copy of the canary there, which is copied at
>     task_switch.
>     That new canary is then used by using the following GCC options:
>     -mstack-protector-guard=3Dtls
>     -mstack-protector-guard-reg=3Dr13
>     -mstack-protector-guard-offset=3Doffsetof(struct paca_struct, canary)=
)
>
>     Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>     Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
>  - Joel
