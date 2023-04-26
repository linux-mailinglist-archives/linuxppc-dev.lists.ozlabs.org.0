Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 192726EEB8F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 02:43:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5g8J0GjSz3cfB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 10:43:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=aM5snHVJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=joelfernandes.org (client-ip=2607:f8b0:4864:20::b30; helo=mail-yb1-xb30.google.com; envelope-from=joel@joelfernandes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=aM5snHVJ;
	dkim-atps=neutral
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5g7Q0vbVz308w
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 10:42:24 +1000 (AEST)
Received: by mail-yb1-xb30.google.com with SMTP id 3f1490d57ef6-b992ed878ebso20899492276.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 17:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1682469740; x=1685061740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ex64O22Q6MJK3vmUJrUzxDpwyisWe3dSu5BawTJE6oE=;
        b=aM5snHVJdK41+qi/asnsYEkzt/hrVltqs8FhwWZJzHVoB6pEL3qrWjqm4K8RJ+MirC
         6I4YEenpRtU+Y+VrpoT0dsSmYhcyFnSe4Y88VoZHxY4HxlRijN/ulaZAbfij1TZ2nUu8
         yr4cezbYS6UyLwIklvxS2tsbZ0GEgLaQJ2J7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682469740; x=1685061740;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ex64O22Q6MJK3vmUJrUzxDpwyisWe3dSu5BawTJE6oE=;
        b=GmZAVgwFZCoUWx5aX1SJ+5sb+WmefTlz5Ppn/ud5By39+7sRE0HIuAztpT/sF4J2Yc
         Cqvy87FtxqHrcUhCPU/eVj9bjlqdFufn/5ITZA8NWU8K0Beu8gslkR6kbx1TbFHAxiNE
         vb2aY+cu2BpCufK7oEksK47qfy7gwViPzmpet8cMC+u3+bpAcrBv3UTajyvw+7chXwNa
         dbUbRha1hYY5bDoGacNrXjpA1yklS30phzTbMZ48wPUBLIpSm1n7IFPz5tVyOYb2D7hM
         0Snc6rvM7jhFoes1c5A2WyPq2JXByNVNGA6yNFKCdLSBXl1m9zCYPeGdQfItQGCo0Jug
         AVEg==
X-Gm-Message-State: AC+VfDwfEoog3I620DRv/piHYjxnCUncnKfXGDw2tAeIfcYSpWkackz/
	WFtHmAKUlcRTdoOhCoGn8ZkdB0hCeYCf69wipV2qsQ==
X-Google-Smtp-Source: ACHHUZ7XSktwiGI80bL5xyuWLRJVxHHTNrtwyhkd9aW9AQ2QgVh4GCjQDrBxrRxes13HDv22h/aP3ezxT/idpZHXHjM=
X-Received: by 2002:a25:37d0:0:b0:b99:16bd:441c with SMTP id
 e199-20020a2537d0000000b00b9916bd441cmr558120yba.6.1682469740424; Tue, 25 Apr
 2023 17:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <CAEXW_YSSGYgqTpxqbYikCFS9t=2f+L-0phbU+gAAngB5z-FbyA@mail.gmail.com>
 <ZEXOMC2casTlobE1@boqun-archlinux> <87fs8pzalj.fsf@mail.concordia>
 <20230424151351.GP19790@gate.crashing.org> <ZEagN1jJwg+rUzX4@boqun-archlinux>
 <CAEXW_YRfetnhgCw5OgnwhgZF_U+UkHN=uy=L8ovGLqn1UCtfTg@mail.gmail.com>
 <20230425101324.GD1331236@hirez.programming.kicks-ass.net>
 <CAABZP2ypJ98T3XAqPnLrxxzrYckSQ6sn3woEmpigQ+cRRaw=Zw@mail.gmail.com>
 <CAEXW_YQEarLt7YGQZdwmcSyZcGRCGKf89ovxjQdXBO-TgXAk-w@mail.gmail.com> <528b2adc-9955-5545-9e9d-affd1f935838@csgroup.eu>
In-Reply-To: <528b2adc-9955-5545-9e9d-affd1f935838@csgroup.eu>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Tue, 25 Apr 2023 20:42:08 -0400
Message-ID: <CAEXW_YRtPycnjT5kc-YkYo2Tj3+Jt1Cog7OPxg4bG1mbXDp+RA@mail.gmail.com>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Zhouyi Zhou <zhouzhouyi@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, "lance@osuosl.org" <lance@osuosl.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 25, 2023 at 9:40=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 25/04/2023 =C3=A0 13:06, Joel Fernandes a =C3=A9crit :
> > On Tue, Apr 25, 2023 at 6:58=E2=80=AFAM Zhouyi Zhou <zhouzhouyi@gmail.c=
om> wrote:
> >>
> >> hi
> >>
> >> On Tue, Apr 25, 2023 at 6:13=E2=80=AFPM Peter Zijlstra <peterz@infrade=
ad.org> wrote:
> >>>
> >>> On Mon, Apr 24, 2023 at 02:55:11PM -0400, Joel Fernandes wrote:
> >>>> This is amazing debugging Boqun, like a boss! One comment below:
> >>>>
> >>>>>>> Or something simple I haven't thought of? :)
> >>>>>>
> >>>>>> At what points can r13 change?  Only when some particular function=
s are
> >>>>>> called?
> >>>>>>
> >>>>>
> >>>>> r13 is the local paca:
> >>>>>
> >>>>>          register struct paca_struct *local_paca asm("r13");
> >>>>>
> >>>>> , which is a pointer to percpu data.
> >>>>>
> >>>>> So if a task schedule from one CPU to anotehr CPU, the value gets
> >>>>> changed.
> >>>>
> >>>> It appears the whole issue, per your analysis, is that the stack
> >>>> checking code in gcc should not cache or alias r13, and must read it=
s
> >>>> most up-to-date value during stack checking, as its value may have
> >>>> changed during a migration to a new CPU.
> >>>>
> >>>> Did I get that right?
> >>>>
> >>>> IMO, even without a reproducer, gcc on PPC should just not do that,
> >>>> that feels terribly broken for the kernel. I wonder what clang does,
> >>>> I'll go poke around with compilerexplorer after lunch.
> >>>>
> >>>> Adding +Peter Zijlstra as well to join the party as I have a feeling
> >>>> he'll be interested. ;-)
> >>>
> >>> I'm a little confused; the way I understand the whole stack protector
> >>> thing to work is that we push a canary on the stack at call and on
> >>> return check it is still valid. Since in general tasks randomly migra=
te,
> >>> the per-cpu validation canary should be the same on all CPUs.
> >>>
> >>> Additionally, the 'new' __srcu_read_{,un}lock_nmisafe() functions use
> >>> raw_cpu_ptr() to get 'a' percpu sdp, preferably that of the local cpu=
,
> >>> but no guarantees.
> >>>
> >>> Both cases use r13 (paca) in a racy manner, and in both cases it shou=
ld
> >>> be safe.
> >> New test results today: both gcc build from git (git clone
> >> git://gcc.gnu.org/git/gcc.git) and Ubuntu 22.04 gcc-12.1.0
> >> are immune from the above issue. We can see the assembly code on
> >> http://140.211.169.189/0425/srcu_gp_start_if_needed-gcc-12.txt
> >>
> >> while
> >> Both native gcc on PPC vm (gcc version 9.4.0), and gcc cross compiler
> >> on my x86 laptop (gcc version 10.4.0) will reproduce the bug.
> >
> > Do you know what fixes the issue? I would not declare victory yet. My
> > feeling is something changes in timing, or compiler codegen which
> > hides the issue. So the issue is still there but it is just a matter
> > of time before someone else reports it.
> >
> > Out of curiosity for PPC folks, why cannot 64-bit PPC use per-task
> > canary? Michael, is this an optimization? Adding Christophe as well
> > since it came in a few years ago via the following commit:
>
> It uses per-task canary. But unlike PPC32, PPC64 doesn't have a fixed
> register pointing to 'current' at all time so the canary is copied into
> a per-cpu struct during _switch().
>
> If GCC keeps an old value of the per-cpu struct pointer, it then gets
> the canary from the wrong CPU struct so from a different task.

Thanks a lot Christophe, that makes sense. Segher, are you convinced
that it is a compiler issue or is there still some doubt?  Could you
modify gcc's stack checker to not optimize away r13 reads or is that
already the case in newer gcc?

thanks,

 - Joel

>
> Christophe
>
> >
> > commit 06ec27aea9fc84d9c6d879eb64b5bcf28a8a1eb7
> > Author: Christophe Leroy <christophe.leroy@c-s.fr>
> > Date:   Thu Sep 27 07:05:55 2018 +0000
> >
> >      powerpc/64: add stack protector support
> >
> >      On PPC64, as register r13 points to the paca_struct at all time,
> >      this patch adds a copy of the canary there, which is copied at
> >      task_switch.
> >      That new canary is then used by using the following GCC options:
> >      -mstack-protector-guard=3Dtls
> >      -mstack-protector-guard-reg=3Dr13
> >      -mstack-protector-guard-offset=3Doffsetof(struct paca_struct, cana=
ry))
> >
> >      Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> >      Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> >
> >   - Joel
