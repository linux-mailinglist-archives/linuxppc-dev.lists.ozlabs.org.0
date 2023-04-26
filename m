Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F33AC6EEC70
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 04:38:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5jjd6NPHz3f4v
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 12:38:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=GQ92gMFY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=GQ92gMFY;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5jhn0D5qz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 12:37:58 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-63b5c48ea09so5441155b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 19:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682476676; x=1685068676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfQf0Jiq6X/CERIYJD0dYWjMRKdECYu2KJD2RoQUN1A=;
        b=GQ92gMFYuO32gPskobDC7LKjddLGuQpCOezV6OfQ0rXCKiC/Vysxgt8tEnuAHTSIUY
         eoQqnAzbYadUr2sP/69pt3JFZ4yx7QvNwnP7uvutjwDuJqEzMAtPCDF6jbuDH1u3YpK6
         Pjgs9KYJXAuneDuy7wkLtsZZEaaBWi4eh5IHSMozfk72bDm8Dq62nmcr8tr39xYMoB/N
         YkF5EMvyKDipxFqlNC5u8QrXkhnwjVvzEoFWUGxEkx1oNOyv8YE/5KJvL9oMCZZrA2rD
         /I9p79t6MMlFrc/gUoZ18gC9zxlSuEhUQzQPqQOhLJd3CR8/0AvRCwqCST6Dnk9bqAKN
         2W4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682476676; x=1685068676;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfQf0Jiq6X/CERIYJD0dYWjMRKdECYu2KJD2RoQUN1A=;
        b=FVdyJNVDCtBpsh6a16/gKBGiY3hdMxlh/MAfxOigX4M5Pa+TumcvaNhaeNf4F0f2u7
         OuHyNpw55/CjzfL4jj9KR5JQo1u3EZj6ScxzUbW6V4NmBYJtFO4xbyQvtVxbjTOmCZ9N
         wrbkQ2PViMb6uqSVAaPR8mLVv14LA7OmVb1cSnkLzoX61Wcmc07zbLqSNQeE2ClYcY1G
         oxME/wu7OD9wPr1dYPEFSyJS66hz+dWtb9saESiQCYnR3xohD1Yw0N2gdMN+UQZSalmT
         YVoUnbKv9aT/03WGoWl7Vab0+Vqaf2P73YBjf1MlWADIl5NxBmmnuj7t6oBSTaaOxN6C
         x3VA==
X-Gm-Message-State: AC+VfDyGrhXsu6OPsdDoHjNm4c1DHYsHlYtss6Qd/3kcAK/xba3EiNyp
	s2L6MXyhaek4OALdh652W4XC/wnL+tZMNjTQuBA=
X-Google-Smtp-Source: ACHHUZ4IR8CoJOS6oK95WrG9GmHIoQpEmg3s9C4z6TqevPOwRefuUdrCkZobGGq7KBW0hcQOC9s19lORl2TB46CmKSs=
X-Received: by 2002:a05:6a20:3c90:b0:f3:6406:9b0e with SMTP id
 b16-20020a056a203c9000b000f364069b0emr3546163pzj.23.1682476675740; Tue, 25
 Apr 2023 19:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230424151351.GP19790@gate.crashing.org> <ZEagN1jJwg+rUzX4@boqun-archlinux>
 <CAEXW_YRfetnhgCw5OgnwhgZF_U+UkHN=uy=L8ovGLqn1UCtfTg@mail.gmail.com>
 <20230425101324.GD1331236@hirez.programming.kicks-ass.net>
 <CAABZP2ypJ98T3XAqPnLrxxzrYckSQ6sn3woEmpigQ+cRRaw=Zw@mail.gmail.com>
 <CAEXW_YQEarLt7YGQZdwmcSyZcGRCGKf89ovxjQdXBO-TgXAk-w@mail.gmail.com>
 <528b2adc-9955-5545-9e9d-affd1f935838@csgroup.eu> <CAABZP2zW7aTPChjvZMA1bECdOdFUdTd-q+vEJXJnH2zPU+uR8A@mail.gmail.com>
 <CAEXW_YQJowYrF2A=f2NOKNNjL6qZH6LzghBxt7VnJFgg-i1zgg@mail.gmail.com>
 <CAABZP2w8eDSRXCoLiWGjGtz6VifPfaaF=Mje7Y8aXjugy-vNkA@mail.gmail.com> <20230426021525.GA2171827@google.com>
In-Reply-To: <20230426021525.GA2171827@google.com>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Wed, 26 Apr 2023 10:37:44 +0800
Message-ID: <CAABZP2z-ny8ruzTc7snthzpgs6aEi93e8a19pLRK-Aw74FToMA@mail.gmail.com>
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, "lance@osuosl.org" <lance@osuosl.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 26, 2023 at 10:15=E2=80=AFAM Joel Fernandes <joel@joelfernandes=
.org> wrote:
>
> Hi Zhouyi,
>
> On Wed, Apr 26, 2023 at 09:31:17AM +0800, Zhouyi Zhou wrote:
> [..]
> > Joel makes the learning process easier for me, indeed!
>
> I know that feeling being a learner myself ;-)
>
> > One question I have tried very hard to understand, but still confused.
> > for now, I know
> > r13 is fixed, but r1 is not, why "r9,40(r1)"'s 40(r1) can be assumed
> > to be equal to 3192(r10).
>
> First you have to I guess read up a bit about stack canaries. Google for
> "gcc stack protector" and "gcc stack canaries", and the look for basics o=
f
> "buffer overflow attacks". That'll explain the concept of stack guards et=
c
> (Sorry if this is too obvious but I did not know how much you knew about =
it
> already).
>
> 40(r1) is where the canary was stored. In the beginning of the function, =
you
> have this:
>
> c000000000226d58:       78 0c 2d e9     ld      r9,3192(r13)
> c000000000226d5c:       28 00 21 f9     std     r9,40(r1)
>
> r1 is your stack pointer. 3192(r13) is the canary value.
>
> 40(r1) is where the canary is stored for later comparison.
>
> r1 should not change through out the function I believe, because otherwis=
e
> you don't know where the stack frame is, right?
Thanks Joel's awesome explanation. I can understand the mechanics
behind our situation now!!
40(r1) is where the canary is stored for later comparison, this is
located on the stack.
while 3192(r13) is inside the cpu's PACA.
I quote Christophe's note here
"in order to be able to
have the canary as an offset of a fixed register as expected by GCC, we
copy the task canary into the cpu's PACA struct during _switch():
        addi    r6,r4,-THREAD   /* Convert THREAD to 'current' */
        std     r6,PACACURRENT(r13)     /* Set new 'current' */
#if defined(CONFIG_STACKPROTECTOR)
        ld      r6, TASK_CANARY(r6)
        std     r6, PACA_CANARY(r13)
#endif
"
>
> Later you have this stuff before the function returns which gcc presumabl=
y
> did due to optimization. That mr means move register and is where the cac=
hing
> of r13 to r10 happens that Boqun pointed.
Thank Boqun and all others' wonderful debugging! Your work confirmed
my bug report ;-)
>
> c000000000226eb4:       78 6b aa 7d     mr      r10,r13
> [...]
> and then the canary comparison happens:
>
> c000000000226ed8:       28 00 21 e9     ld      r9,40(r1)
> c000000000226edc:       78 0c 4a e9     ld      r10,3192(r10)
3192(r13) is correct because "we copy the task canary into the cpu's
PACA struct during _switch():"
but 3192(r10) is not correct, because r10 is the old value of r13.
> c000000000226ee0:       79 52 29 7d     xor.    r9,r9,r10
> c000000000226ee4:       00 00 40 39     li      r10,0
> c000000000226ee8:       b8 03 82 40     bne     c0000000002272a0 <srcu_gp=
_start_if_needed+0x5a0>
>
> So looks like for this to blow up, the preemption/migration has to happen
> precisely between the mr doing the caching, and the xor doing the compari=
son,
> since that's when the r10 will be stale.
Thank Joel and all others for your time ;-)
I benefit a lot, and am very glad to do more good work to the
community in return ;-)

Cheers
Zhouyi
>
> thanks,
>
>  - Joel
>
