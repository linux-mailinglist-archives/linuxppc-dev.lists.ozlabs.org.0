Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 368846EE379
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 15:50:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5Ngd11WXz3f6n
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 23:50:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jamzRusO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=jamzRusO;
	dkim-atps=neutral
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5Nfk6Mdlz3cM1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 23:50:05 +1000 (AEST)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-51fcf5d1e44so5822873a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 06:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682430601; x=1685022601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2lAuwknu3oppNAiUSZpnFi04sAphUW8dNNMCjOkBABs=;
        b=jamzRusOo2NjkX7molZM2aCKuhRTgTL0DhlzMquEyNRxa2MjYgzuDwRNGa0LIxc34N
         e7mJmtfFgZIs1brtVwmW0LO16YcSGlUfOW0x1kkRsrDlhFOFWXLM8tkC3Lr+Qzi0+gJ5
         xPnzh3BkhQsDNdVyh3OTN4FijvnyjBZUN7LLcBKSblbnQ3jiyL4Sg283i7vxiR3b1UZE
         5RsspSs88YBOkut/edo7rBsRVJid5/o1rjaYnm8iPdbIv2VXkLV7iEGB4tRqfLHJSuhP
         QXkmfm23JUgcXyzpXo6uQNN8HbRcXvJUVlJRHu5MRWeLNyg6tq8TmZvurN6sTuKwdmwa
         cSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682430601; x=1685022601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2lAuwknu3oppNAiUSZpnFi04sAphUW8dNNMCjOkBABs=;
        b=KHGWLo9wopv0OM/eYGBGOhAEwmH1db/E+SpZVfX/tMFTNzkpF8ZffAch8pL49b8B15
         XkXhOSGSULYBxkrs/nJyiyXfaq6h5IXmiCmlnQebQx4UdgXsDKPFLzHf6Gd/Fv2/1WwA
         JmLMl5uM157FpQQf5j00LPuD5IGWTQNx3PuabB1XrTYDZ6UZUZ64FxSc1BBH3R3hhX4x
         Z+Js8zma6N+jGiXY7QeFb7y33H9hokBj1TaElB0gJy03T0quffh92xlJmbNIbGA6s6AJ
         AirCckL/vxs0bRl6tD4NC74GddKH7C7VOThTA8a5TPqmZBqmmGwIRJ82XLwVIJm1CDD5
         00CQ==
X-Gm-Message-State: AAQBX9eXYp0JgMeVB5K36VQgi5+t8G8ZaZHyu5rkHb5lfwgEdX2k+wIi
	wr1G+C8LZI72Xv44oqqJd0maPhxGWDGTDMOKcmo=
X-Google-Smtp-Source: AKy350bSykcNq3VWBNHcmLinwWgOiXbhiBxgTZcPMEi8qD3oJP0OeW7EYXjKHPDrXkcHdS29jHT1he9ARB1EyQCCd1c=
X-Received: by 2002:a17:90a:6447:b0:23f:a4da:1208 with SMTP id
 y7-20020a17090a644700b0023fa4da1208mr16749390pjm.39.1682430601304; Tue, 25
 Apr 2023 06:50:01 -0700 (PDT)
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
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Tue, 25 Apr 2023 21:49:50 +0800
Message-ID: <CAABZP2zW7aTPChjvZMA1bECdOdFUdTd-q+vEJXJnH2zPU+uR8A@mail.gmail.com>
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, "lance@osuosl.org" <lance@osuosl.org>, Joel Fernandes <joel@joelfernandes.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

On Tue, Apr 25, 2023 at 9:40=E2=80=AFPM Christophe Leroy
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
This is a fruitful learning process for me!
Christophe:
Do you think there is still a need to bisect GCC ? If so, I am very
glad to continue

Cheers
Zhouyi
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
