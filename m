Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A446ED156
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 17:30:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4px11GGzz3fDL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 01:30:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=blvtesPo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::832; helo=mail-qt1-x832.google.com; envelope-from=boqun.feng@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=blvtesPo;
	dkim-atps=neutral
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4pw42Kz6z3bg3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 01:29:38 +1000 (AEST)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-3ef2452967fso40945851cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Apr 2023 08:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682350175; x=1684942175;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/H851rRFJIhrc5Icbka/8pAvzTmZC3yadbn9uvAq0XE=;
        b=blvtesPowGNtBz9lUM+Gf3mQxYY59UlRz98lJrEgw1iHLbHLphpVABhotTo35xQ33J
         XQUD6ZpqT2ea2A+Wr+wiYxKVh1asBQg8OYpgImXy3n5QMOmABzoIfB9ClU8uRYouyou6
         eXu9uWAGHkCNgPGZJR8W/kb1mYoYbYIGSGEF149u9XEjGQnEzOmrcQKrLdav1A6+AQzx
         uapUJCTUsO/pwXThQ5by0PUSNlmzAjERX+J9tayq4GsVziA/rnSgyVYyiF9FjgjabZ3F
         8fVxkw46f1T1IAbfB0KQLhs+cohqL+jeVA6r8y1Xc/H01k4i2zhezyz6iLLolz9lA049
         MdhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682350175; x=1684942175;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/H851rRFJIhrc5Icbka/8pAvzTmZC3yadbn9uvAq0XE=;
        b=a7HrcP7iaF7c6enTJ4hTIc8FWBUPP8lkxyxCJtyfNDjFiEzcHkKdsZz9Z7fLf367Ru
         +Ds5gPlJWNAxWabCmnqdwWkMY4Xfk6nbkj1J7MC4u03psl2MVMa3qpJiOSvL9vJ2biUT
         U7dBy++hqk1H6kc7pTyUUO6jEzaxjTaMg6vzqIpT/vCMGfF8bhHoif1VmrwNUnlNMQ0o
         zB60SOHOTr4g931JAEMk48RzQYbYIplzo6yuEldoeDoyELRhoc5SJfNhNfkVJLh4AL//
         vppcuZzelwi+RuOoeDjTIoIDWzCjgWTcYg75xP3gP2Yjmf4cauInzM/ubPA2IKCzbCoR
         hhIA==
X-Gm-Message-State: AAQBX9c+ll8F2QheY72jAILJEdLpzy449k5Gf8PjaihApTcGcDrXrJOY
	1+iqgYsKYN6Ymr7Yw9/Wg7M=
X-Google-Smtp-Source: AKy350YcjdUOXmjc2ihKt+Q+FUEqxBSPqM+n1GdiYKaPzztul3P8sKZCMdsqXNTBd/Sfsa7zuBMf/w==
X-Received: by 2002:a05:622a:95:b0:3e6:4535:d24c with SMTP id o21-20020a05622a009500b003e64535d24cmr24885539qtw.61.1682350174618;
        Mon, 24 Apr 2023 08:29:34 -0700 (PDT)
Received: from auth2-smtp.messagingengine.com (auth2-smtp.messagingengine.com. [66.111.4.228])
        by smtp.gmail.com with ESMTPSA id k1-20020ac86041000000b003ecf475286csm3661723qtm.39.2023.04.24.08.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 08:29:33 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailauth.nyi.internal (Postfix) with ESMTP id 866E427C0060;
	Mon, 24 Apr 2023 11:29:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 24 Apr 2023 11:29:33 -0400
X-ME-Sender: <xms:XKBGZKc11r9ACXW6vWUfr6R6LypE8WjWmLQ7AuylV714W5vfv9zI1w>
    <xme:XKBGZEP-UrLRdtJfS4lR1NHRUMY-OJ7d2rj0tHCf7vA-dxlejRb3NpUeVFrwhpPLW
    4e0zye0YcXPnVDaMw>
X-ME-Received: <xmr:XKBGZLjM6vRFG5y2IJURDgoPhpFss4llN4WASCPp7gLrZGderqqfYa0_FUc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedutddgkeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpeeuohhq
    uhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrf
    grthhtvghrnhepvefghfeuveekudetgfevudeuudejfeeltdfhgfehgeekkeeigfdukefh
    gfegleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:XKBGZH_macociAX6Q2Yh9cxn5ZjA6guxg66wS7R9Oj9-VMlbuv1pWA>
    <xmx:XKBGZGsChS8eY7kXtKtOnfyVyQICo3fNi8Dv8YEmjd1o0MoEBzjjZQ>
    <xmx:XKBGZOHFWEFaykLEjoPrGzj80X6Vt_-NGRx4S6rLTaPYUHkACQZRAg>
    <xmx:XaBGZEBTRgA2yLfOKfMQvSwwnzyWoXEgUjoWIRrX71UjLHgWXbeg1w>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 24 Apr 2023 11:29:31 -0400 (EDT)
Date: Mon, 24 Apr 2023 08:28:55 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
Message-ID: <ZEagN1jJwg+rUzX4@boqun-archlinux>
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <CAEXW_YSSGYgqTpxqbYikCFS9t=2f+L-0phbU+gAAngB5z-FbyA@mail.gmail.com>
 <ZEXOMC2casTlobE1@boqun-archlinux>
 <87fs8pzalj.fsf@mail.concordia>
 <20230424151351.GP19790@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230424151351.GP19790@gate.crashing.org>
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, lance@osuosl.org, Zhouyi Zhou <zhouzhouyi@gmail.com>, Joel Fernandes <joel@joelfernandes.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 24, 2023 at 10:13:51AM -0500, Segher Boessenkool wrote:
> Hi!
> 
> On Mon, Apr 24, 2023 at 11:14:00PM +1000, Michael Ellerman wrote:
> > Boqun Feng <boqun.feng@gmail.com> writes:
> > > On Sat, Apr 22, 2023 at 09:28:39PM +0200, Joel Fernandes wrote:
> > >> On Sat, Apr 22, 2023 at 2:47 PM Zhouyi Zhou <zhouzhouyi@gmail.com> wrote:
> > >> > by debugging, I see the r10 is assigned with r13 on c000000000226eb4,
> > >> > but if there is a context-switch before c000000000226edc, a false
> > >> > positive will be reported.
> 
> > I've never understood why the compiler wants to make a copy of a
> > register variable into another register!? >:#
> 
> It is usually because a) you told it to (maybe via an earlyclobber), or
> b) it looked cheaper.  I don't see either here :-(
> 
> > > here I think that the compiler is using r10 as an alias to r13, since
> > > for userspace program, it's safe to assume the TLS pointer doesn't
> > > change. However this is not true for kernel percpu pointer.
> 
> r13 is a "fixed" register, but that means it has a fixed purpose (so not
> available for allocation), it does not mean "unchanging".
> 
> > > The real intention here is to compare 40(r1) vs 3192(r13) for stack
> > > guard checking, however since r13 is the percpu pointer in kernel, so
> > > the value of r13 can be changed if the thread gets scheduled to a
> > > different CPU after reading r13 for r10.
> > 
> > Yeah that's not good.
> 
> The GCC pattern here makes the four machine insns all stay together.
> That is to make sure to not leak any secret value, which is impossible
> to guarantee otherwise.
> 
> What tells GCC r13 can randomly change behind its back?  And, what then
> makes GCC ignore that fact?
> 
> > > 	+       asm volatile("" : : : "r13", "memory");
> 
> Any asm without output is always volatile.
> 
> > > Needless to say, the correct fix is to make ppc stack protector aware of
> > > r13 is volatile.
> > 
> > I suspect the compiler developers will tell us to go jump :)
> 
> Why would r13 change over the course of *this* function / this macro,
> why can this not happen anywhere else?
> 
> > The problem of the compiler caching r13 has come up in the past, but I
> > only remember it being "a worry" rather than causing an actual bug.
> 
> In most cases the compiler is smart enough to use r13 directly, instead
> of copying it to another reg and then using that one.  But not here for
> some strange reason.  That of course is a very minor generated machine
> code quality bug and nothing more :-(
> 
> > We've had the DEBUG_PREEMPT checks in get_paca(), which have given us at
> > least some comfort that if the compiler is caching r13, it shouldn't be
> > doing it in preemptable regions.
> > 
> > But obviously that doesn't help at all with the stack protector check.
> > 
> > I don't see an easy fix.
> > 
> > Adding "volatile" to the definition of local_paca seems to reduce but
> > not elimate the caching of r13, and the GCC docs explicitly say *not* to
> > use volatile. It also triggers lots of warnings about volatile being
> > discarded.
> 
> The point here is to say some code clobbers r13, not the asm volatile?
> 
> > Or something simple I haven't thought of? :)
> 
> At what points can r13 change?  Only when some particular functions are
> called?
> 

r13 is the local paca:

	register struct paca_struct *local_paca asm("r13");

, which is a pointer to percpu data.

So if a task schedule from one CPU to anotehr CPU, the value gets
changed.

Regards,
Boqun


> 
> Segher
