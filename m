Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B46C6EE0C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 12:59:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5Jt76twCz3f89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 20:59:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NR2WE+Pg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=NR2WE+Pg;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5JsK05bTz2yJT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 20:59:00 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-24986ade373so5092440a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 03:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682420337; x=1685012337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b0JHWtYitmYVTIJ2+ge4uzqOjTVMwrngSNO6Xtd2pjU=;
        b=NR2WE+PgVRsWds0vo3wWvFtwGWABl8CrGItfKViXFhxsyUrBL04N2S1PfkqPdJ4LzQ
         JMMcQhwSiJpZgUPGMTBbIefeNfDHW5eErS7Lns22Z58bi3BvLFRPO1Fs0oYJp/vjzZT7
         l/aLkHxy0BV1OmBS3/ZugkuCMGUU6dSmaNG9DD3eN1sbDYCZfEhebaktBnf9xnX+J8ks
         l94ijmRjnxW+X0k5/QT75NHMuWJxQ/Y1zSaRiBFHWzbpwd4AjdZu6e4vfwce4ApmhKpn
         MAvbcqnrMtyJ42eG0Yr1klG/IXpJW6ouZK8m6oOpU8z9Pl0Xqt8Hg75CBu/MQVNAVEjH
         smQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682420337; x=1685012337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b0JHWtYitmYVTIJ2+ge4uzqOjTVMwrngSNO6Xtd2pjU=;
        b=BqFaJsiWp3Rt/4j5Uw06N5jSe5jBfLzcyaZGuv/AMLhoNkKBAORLyYe9xRGgjY35EP
         ggOkGl/Lk7ifGSxoZGU62XPfoG57vB8l2uxUx68hdO8Qz7jF773D9HdUR9/qKFPweuRz
         d+Nh9xnTGAf041FM0fnaxyTD0I8qxVU3QSq9DogBUgXTIN3CT25RIPDdfSZdA3OBcaOm
         ntpcaNYBWDIFl8RMMbehfR5nO5ZruUfQidGByge6Ttja7oCdNpm96KUj8D0FX0aolb1s
         G/qjOOcONuyoL8ozjDPg8tF1cSfuMWii/nCyxV70Coy3HHU5/ryZeXJcydO0h8fWWnat
         oXMQ==
X-Gm-Message-State: AAQBX9dYjOrjrObYiO/oyZW4VjaGaflitKWYYl5Q7G/HL1ckF+XdAlUm
	FUhDZtssJbTCa7w1wCX7NJn3MW3+dS5+PXIJzUc=
X-Google-Smtp-Source: AKy350b7YsHwI9f/5O7hIJgsJ7JJuWFqCPTNPXWlJ3/jyxBC4CZMH+4+sI+BWs8iKzjP1J9OdMb6AQjkhCoerfWOPJY=
X-Received: by 2002:a17:90a:950e:b0:24b:2ef6:64d5 with SMTP id
 t14-20020a17090a950e00b0024b2ef664d5mr16225496pjo.47.1682420337231; Tue, 25
 Apr 2023 03:58:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <CAEXW_YSSGYgqTpxqbYikCFS9t=2f+L-0phbU+gAAngB5z-FbyA@mail.gmail.com>
 <ZEXOMC2casTlobE1@boqun-archlinux> <87fs8pzalj.fsf@mail.concordia>
 <20230424151351.GP19790@gate.crashing.org> <ZEagN1jJwg+rUzX4@boqun-archlinux>
 <CAEXW_YRfetnhgCw5OgnwhgZF_U+UkHN=uy=L8ovGLqn1UCtfTg@mail.gmail.com> <20230425101324.GD1331236@hirez.programming.kicks-ass.net>
In-Reply-To: <20230425101324.GD1331236@hirez.programming.kicks-ass.net>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Tue, 25 Apr 2023 18:58:46 +0800
Message-ID: <CAABZP2ypJ98T3XAqPnLrxxzrYckSQ6sn3woEmpigQ+cRRaw=Zw@mail.gmail.com>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
To: Peter Zijlstra <peterz@infradead.org>
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, lance@osuosl.org, Joel Fernandes <joel@joelfernandes.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

hi

On Tue, Apr 25, 2023 at 6:13=E2=80=AFPM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Apr 24, 2023 at 02:55:11PM -0400, Joel Fernandes wrote:
> > This is amazing debugging Boqun, like a boss! One comment below:
> >
> > > > > Or something simple I haven't thought of? :)
> > > >
> > > > At what points can r13 change?  Only when some particular functions=
 are
> > > > called?
> > > >
> > >
> > > r13 is the local paca:
> > >
> > >         register struct paca_struct *local_paca asm("r13");
> > >
> > > , which is a pointer to percpu data.
> > >
> > > So if a task schedule from one CPU to anotehr CPU, the value gets
> > > changed.
> >
> > It appears the whole issue, per your analysis, is that the stack
> > checking code in gcc should not cache or alias r13, and must read its
> > most up-to-date value during stack checking, as its value may have
> > changed during a migration to a new CPU.
> >
> > Did I get that right?
> >
> > IMO, even without a reproducer, gcc on PPC should just not do that,
> > that feels terribly broken for the kernel. I wonder what clang does,
> > I'll go poke around with compilerexplorer after lunch.
> >
> > Adding +Peter Zijlstra as well to join the party as I have a feeling
> > he'll be interested. ;-)
>
> I'm a little confused; the way I understand the whole stack protector
> thing to work is that we push a canary on the stack at call and on
> return check it is still valid. Since in general tasks randomly migrate,
> the per-cpu validation canary should be the same on all CPUs.
>
> Additionally, the 'new' __srcu_read_{,un}lock_nmisafe() functions use
> raw_cpu_ptr() to get 'a' percpu sdp, preferably that of the local cpu,
> but no guarantees.
>
> Both cases use r13 (paca) in a racy manner, and in both cases it should
> be safe.
New test results today: both gcc build from git (git clone
git://gcc.gnu.org/git/gcc.git) and Ubuntu 22.04 gcc-12.1.0
are immune from the above issue. We can see the assembly code on
http://140.211.169.189/0425/srcu_gp_start_if_needed-gcc-12.txt

while
Both native gcc on PPC vm (gcc version 9.4.0), and gcc cross compiler
on my x86 laptop (gcc version 10.4.0) will reproduce the bug.
