Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A77B16EE0C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 13:00:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5Jv447cgz3fCj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 21:00:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=xqweQ1xw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=joelfernandes.org (client-ip=2607:f8b0:4864:20::112e; helo=mail-yw1-x112e.google.com; envelope-from=joel@joelfernandes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=xqweQ1xw;
	dkim-atps=neutral
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5Jt73Zlxz3f7r
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 20:59:43 +1000 (AEST)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-54fc6949475so62957127b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 03:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1682420380; x=1685012380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUg+wNP5+RlGjx++pGYBiKCIld1zQdbRIXNqep4/CZY=;
        b=xqweQ1xw0DS4HaLefbthJGpFnpdM1a5ar9XrlzaVPB2uYZ3keHM9+iJcpYs5jlGPYw
         GlojP/aOOysoc7fsoOwDPVYqcusgLhlQ+94hs5NyHKPzvEvtT/OWe6E9WG8WrnuCm6QA
         rK8TroW1KZrHvDEcrqTxBhiX+vahvoKpHXzX4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682420380; x=1685012380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUg+wNP5+RlGjx++pGYBiKCIld1zQdbRIXNqep4/CZY=;
        b=Btc7xSjEn6A9uVDkfTZs2LHizC+aIXTxlrki5csIZLe39Yq54FPVFqLUnNwLHnKhWZ
         lgZPv5cOW5OrNoust2yGtEkmyDd/ycSxIeCsSyMlv7k4yq/k4fqbL0+q3pGNoMJREo3g
         rGfd1rPV0eLp6u8/O6/juEZvngSeqOHJa3RKyBMfxJfWNOH17rgtiXis1fx5vzz+vQwc
         nKvjoKFMHAT/boZNnzS2hwEu/Envhv1DweBQuorPs2KdzBurd5qM76gf37RWRxm4D9Fr
         jqUU9zIbrGu70RjK1asp4JXhpwyNUxKdXwU8HZq22A0DuAJGantspvTS/4dd/6468MPv
         QnFA==
X-Gm-Message-State: AAQBX9fodMEBvpkfl/G5cH+zgqefXL3FYDeob4NZIIfIRHaKYnfvXzMx
	tdAE7Jkqe+xQLGYMN7/7o28joEpZ8AEK6dOBM7DTWw==
X-Google-Smtp-Source: AKy350YaQoIpYpar+yrvSSOL9ToYRuxOYpny2c9JespRM7apZgHDEAqlXF+tX74BhnaJumdsvGm5n6jRBV8nLU+7V/w=
X-Received: by 2002:a81:8303:0:b0:54f:d233:d3b7 with SMTP id
 t3-20020a818303000000b0054fd233d3b7mr8858195ywf.21.1682420380486; Tue, 25 Apr
 2023 03:59:40 -0700 (PDT)
MIME-Version: 1.0
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <CAEXW_YSSGYgqTpxqbYikCFS9t=2f+L-0phbU+gAAngB5z-FbyA@mail.gmail.com>
 <ZEXOMC2casTlobE1@boqun-archlinux> <87fs8pzalj.fsf@mail.concordia>
 <20230424151351.GP19790@gate.crashing.org> <ZEagN1jJwg+rUzX4@boqun-archlinux>
 <CAEXW_YRfetnhgCw5OgnwhgZF_U+UkHN=uy=L8ovGLqn1UCtfTg@mail.gmail.com> <20230425101324.GD1331236@hirez.programming.kicks-ass.net>
In-Reply-To: <20230425101324.GD1331236@hirez.programming.kicks-ass.net>
From: Joel Fernandes <joel@joelfernandes.org>
Date: Tue, 25 Apr 2023 06:59:29 -0400
Message-ID: <CAEXW_YRFZ3zDc0gJRHjJPRuNaBtnmUc+9RxSAHH48jkFw_b34g@mail.gmail.com>
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, lance@osuosl.org, Zhouyi Zhou <zhouzhouyi@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 25, 2023 at 6:13=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
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

AFAICS, the canary is randomly chosen both in the kernel [1]. This
also appears to be the case in glibc. That makes sense because you
don't want the canary to be something that the attacker can easily
predict and store on the stack to bypass buffer overflow attacks:

[1] kernel :
/*
 * Initialize the stackprotector canary value.
 *
 * NOTE: this must only be called from functions that never return,
 * and it must always be inlined.
 */
static __always_inline void boot_init_stack_canary(void)
{
        unsigned long canary =3D get_random_canary();

        current->stack_canary =3D canary;
#ifdef CONFIG_PPC64
        get_paca()->canary =3D canary;
#endif
}

thanks,

 - Joel
