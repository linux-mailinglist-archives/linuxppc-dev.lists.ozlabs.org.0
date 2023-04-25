Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C625E6EE0D6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 13:07:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5K2l4NzTz3cMy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 21:07:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=VdR3wwmA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=joelfernandes.org (client-ip=2607:f8b0:4864:20::b29; helo=mail-yb1-xb29.google.com; envelope-from=joel@joelfernandes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=VdR3wwmA;
	dkim-atps=neutral
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5K1r6gNDz30QS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 21:06:22 +1000 (AEST)
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-b8f5121503eso8233228276.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 04:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1682420779; x=1685012779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxnh6Hi9HqlHGEwie6ZZICYaa0bP7KY/+WuMwYNYTmY=;
        b=VdR3wwmAEjxfeujbEcL+VAXT+xd04RRZcqXvF6U5icWhnGsOEohwg7vARx9yoOTROC
         hbiMXGNFSBxAXxwprIgOE8Xq0QItgGv02in+lMvVZuq8Klm4WI0CUFQ2Hrac/yWECqi4
         md5KxCiyVN7a9X+oAjBZ3b9rrFEPZpDwnbm2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682420779; x=1685012779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxnh6Hi9HqlHGEwie6ZZICYaa0bP7KY/+WuMwYNYTmY=;
        b=F7jSwPl6FuIagk7WDyft4zRDypLav94atdEUYRf54tsMeOQR11gmn3hpoGEMJl8BeF
         xyPhowse+1jxDReCd+foTNevZas18oKBm/Z51Zi5i2f6Z8RDkG0S3gUl/KeIM/39Lw9U
         XCU02TrWCHtDpLdKfOefTQrJd/gstAuFdnZ7knUSlWYG22rZnt99PVpqtrc6Zi+ZgMZY
         l9RfWZwtmHA0ILsbaZgrBZxOxUrG5+4kiI6QF2XeMosdITx40M8ot+9I74pbiJEozNmV
         68YGBLe1R30Q8q+TFM6UtPbFEs1UKFC9srUCEs1cebAR25GKCv+9SUvEO4MbN/IxD27H
         OTtg==
X-Gm-Message-State: AAQBX9fzxEV965e0pVPQdB7c8gKh0aORHLgEatjzuI47GiJfuYinNk6U
	1bM+YLYfe+VHBRhy852H/ES7CpTiUndIyyojsLOe/w==
X-Google-Smtp-Source: AKy350Z2MMGY9lUYIgZ/RTFuuaAQUwutf3WfAlP93ocKcWEfXzN5niDO7fXLYWQHI48oJKslRzKoaFZSHENDyb2u5I0=
X-Received: by 2002:a81:5288:0:b0:54f:ba9d:c9c4 with SMTP id
 g130-20020a815288000000b0054fba9dc9c4mr9756341ywb.16.1682420779531; Tue, 25
 Apr 2023 04:06:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <CAEXW_YSSGYgqTpxqbYikCFS9t=2f+L-0phbU+gAAngB5z-FbyA@mail.gmail.com>
 <ZEXOMC2casTlobE1@boqun-archlinux> <87fs8pzalj.fsf@mail.concordia>
 <20230424151351.GP19790@gate.crashing.org> <ZEagN1jJwg+rUzX4@boqun-archlinux>
 <CAEXW_YRfetnhgCw5OgnwhgZF_U+UkHN=uy=L8ovGLqn1UCtfTg@mail.gmail.com>
 <20230425101324.GD1331236@hirez.programming.kicks-ass.net> <CAABZP2ypJ98T3XAqPnLrxxzrYckSQ6sn3woEmpigQ+cRRaw=Zw@mail.gmail.com>
In-Reply-To: <CAABZP2ypJ98T3XAqPnLrxxzrYckSQ6sn3woEmpigQ+cRRaw=Zw@mail.gmail.com>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Tue, 25 Apr 2023 07:06:08 -0400
Message-ID: <CAEXW_YQEarLt7YGQZdwmcSyZcGRCGKf89ovxjQdXBO-TgXAk-w@mail.gmail.com>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
To: Zhouyi Zhou <zhouzhouyi@gmail.com>, Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, lance@osuosl.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 25, 2023 at 6:58=E2=80=AFAM Zhouyi Zhou <zhouzhouyi@gmail.com> =
wrote:
>
> hi
>
> On Tue, Apr 25, 2023 at 6:13=E2=80=AFPM Peter Zijlstra <peterz@infradead.=
org> wrote:
> >
> > On Mon, Apr 24, 2023 at 02:55:11PM -0400, Joel Fernandes wrote:
> > > This is amazing debugging Boqun, like a boss! One comment below:
> > >
> > > > > > Or something simple I haven't thought of? :)
> > > > >
> > > > > At what points can r13 change?  Only when some particular functio=
ns are
> > > > > called?
> > > > >
> > > >
> > > > r13 is the local paca:
> > > >
> > > >         register struct paca_struct *local_paca asm("r13");
> > > >
> > > > , which is a pointer to percpu data.
> > > >
> > > > So if a task schedule from one CPU to anotehr CPU, the value gets
> > > > changed.
> > >
> > > It appears the whole issue, per your analysis, is that the stack
> > > checking code in gcc should not cache or alias r13, and must read its
> > > most up-to-date value during stack checking, as its value may have
> > > changed during a migration to a new CPU.
> > >
> > > Did I get that right?
> > >
> > > IMO, even without a reproducer, gcc on PPC should just not do that,
> > > that feels terribly broken for the kernel. I wonder what clang does,
> > > I'll go poke around with compilerexplorer after lunch.
> > >
> > > Adding +Peter Zijlstra as well to join the party as I have a feeling
> > > he'll be interested. ;-)
> >
> > I'm a little confused; the way I understand the whole stack protector
> > thing to work is that we push a canary on the stack at call and on
> > return check it is still valid. Since in general tasks randomly migrate=
,
> > the per-cpu validation canary should be the same on all CPUs.
> >
> > Additionally, the 'new' __srcu_read_{,un}lock_nmisafe() functions use
> > raw_cpu_ptr() to get 'a' percpu sdp, preferably that of the local cpu,
> > but no guarantees.
> >
> > Both cases use r13 (paca) in a racy manner, and in both cases it should
> > be safe.
> New test results today: both gcc build from git (git clone
> git://gcc.gnu.org/git/gcc.git) and Ubuntu 22.04 gcc-12.1.0
> are immune from the above issue. We can see the assembly code on
> http://140.211.169.189/0425/srcu_gp_start_if_needed-gcc-12.txt
>
> while
> Both native gcc on PPC vm (gcc version 9.4.0), and gcc cross compiler
> on my x86 laptop (gcc version 10.4.0) will reproduce the bug.

Do you know what fixes the issue? I would not declare victory yet. My
feeling is something changes in timing, or compiler codegen which
hides the issue. So the issue is still there but it is just a matter
of time before someone else reports it.

Out of curiosity for PPC folks, why cannot 64-bit PPC use per-task
canary? Michael, is this an optimization? Adding Christophe as well
since it came in a few years ago via the following commit:

commit 06ec27aea9fc84d9c6d879eb64b5bcf28a8a1eb7
Author: Christophe Leroy <christophe.leroy@c-s.fr>
Date:   Thu Sep 27 07:05:55 2018 +0000

    powerpc/64: add stack protector support

    On PPC64, as register r13 points to the paca_struct at all time,
    this patch adds a copy of the canary there, which is copied at
    task_switch.
    That new canary is then used by using the following GCC options:
    -mstack-protector-guard=3Dtls
    -mstack-protector-guard-reg=3Dr13
    -mstack-protector-guard-offset=3Doffsetof(struct paca_struct, canary))

    Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
    Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

 - Joel
