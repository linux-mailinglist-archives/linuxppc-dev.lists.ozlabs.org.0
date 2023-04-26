Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 737C76EEC48
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 04:16:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5jCl23ycz3cfL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 12:16:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=Q1fA8n97;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=joelfernandes.org (client-ip=2607:f8b0:4864:20::729; helo=mail-qk1-x729.google.com; envelope-from=joel@joelfernandes.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=joelfernandes.org header.i=@joelfernandes.org header.a=rsa-sha256 header.s=google header.b=Q1fA8n97;
	dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5jBr3cHXz30Qg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 12:15:30 +1000 (AEST)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-74df41e2e61so346475485a.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 19:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google; t=1682475327; x=1685067327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jGc47UmShwVrvDYZPpGcnQwNYLvIbd7qZ14xZo9khvU=;
        b=Q1fA8n97qoplxDSqa8wI8dtHEu1b9yHDm+d49HtS9Hw7PILZx9lDF0GpjgZTSsklU4
         d1DI5wPp7hQ0hOPbiY8rDzmBs3U2TsTfCBzQ/ibSfH+sv6uza0b6iYchK17Mo2UyP17l
         dO5hILr4oMBKVAYcmJiiJpCtsCUJqNLkj0Bdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682475327; x=1685067327;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGc47UmShwVrvDYZPpGcnQwNYLvIbd7qZ14xZo9khvU=;
        b=Hnwt/nXBdCYDf09RVqT2NO2m+IAS6Qg02i8xKcG73QNOIh1U6qicrAS86Ik9hiUfVD
         p7QLWfndYA91BNVGtI/KHKcd5DiTpUSlJL3nVlhhkBUBbfiOE84MMMLAIZwdfDUQBjlX
         6lapn34VWXurjfaQaAEB9JzJApXfaHFzhDzIpvVJGLFBW9pnqSJ56JJdMf3ypxWbCmCN
         eNM7nkAVff/YNav9zNAZy64YyqNacnQE/TttZz0ODHjx9h25iFpAwxKKb9RQBMY3C1Kv
         cYPDnVR1daW+72CBQ2PUuisaGwhhmYV8tujgBMbyaTTm4/OoXwh0HOboWHQq82x2JJ9Y
         3EEA==
X-Gm-Message-State: AAQBX9caz6AO/kZP7RAoj0JmoSC9lMFP1mxzWPt95bJyZmavkchrbI7Y
	Ru7X44mA/ZXyThrjTlOvXzdu4Q==
X-Google-Smtp-Source: AKy350b9uSUMPSCwybpYqSUcr8gjirWn9Qm4JhzaIyDtDY7ICUyQYmQeurkjgnSCeAYc5LUWkrzvdw==
X-Received: by 2002:a05:6214:2305:b0:5ef:5e1b:a365 with SMTP id gc5-20020a056214230500b005ef5e1ba365mr29059934qvb.10.1682475326878;
        Tue, 25 Apr 2023 19:15:26 -0700 (PDT)
Received: from localhost (129.239.188.35.bc.googleusercontent.com. [35.188.239.129])
        by smtp.gmail.com with ESMTPSA id b9-20020a0ccd09000000b005e5b2c560d0sm4497149qvm.7.2023.04.25.19.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 19:15:26 -0700 (PDT)
Date: Wed, 26 Apr 2023 02:15:25 +0000
From: Joel Fernandes <joel@joelfernandes.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
Message-ID: <20230426021525.GA2171827@google.com>
References: <20230424151351.GP19790@gate.crashing.org>
 <ZEagN1jJwg+rUzX4@boqun-archlinux>
 <CAEXW_YRfetnhgCw5OgnwhgZF_U+UkHN=uy=L8ovGLqn1UCtfTg@mail.gmail.com>
 <20230425101324.GD1331236@hirez.programming.kicks-ass.net>
 <CAABZP2ypJ98T3XAqPnLrxxzrYckSQ6sn3woEmpigQ+cRRaw=Zw@mail.gmail.com>
 <CAEXW_YQEarLt7YGQZdwmcSyZcGRCGKf89ovxjQdXBO-TgXAk-w@mail.gmail.com>
 <528b2adc-9955-5545-9e9d-affd1f935838@csgroup.eu>
 <CAABZP2zW7aTPChjvZMA1bECdOdFUdTd-q+vEJXJnH2zPU+uR8A@mail.gmail.com>
 <CAEXW_YQJowYrF2A=f2NOKNNjL6qZH6LzghBxt7VnJFgg-i1zgg@mail.gmail.com>
 <CAABZP2w8eDSRXCoLiWGjGtz6VifPfaaF=Mje7Y8aXjugy-vNkA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABZP2w8eDSRXCoLiWGjGtz6VifPfaaF=Mje7Y8aXjugy-vNkA@mail.gmail.com>
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

Hi Zhouyi,

On Wed, Apr 26, 2023 at 09:31:17AM +0800, Zhouyi Zhou wrote:
[..]
> Joel makes the learning process easier for me, indeed!

I know that feeling being a learner myself ;-)

> One question I have tried very hard to understand, but still confused.
> for now, I know
> r13 is fixed, but r1 is not, why "r9,40(r1)"'s 40(r1) can be assumed
> to be equal to 3192(r10).

First you have to I guess read up a bit about stack canaries. Google for
"gcc stack protector" and "gcc stack canaries", and the look for basics of
"buffer overflow attacks". That'll explain the concept of stack guards etc
(Sorry if this is too obvious but I did not know how much you knew about it
already).

40(r1) is where the canary was stored. In the beginning of the function, you
have this:

c000000000226d58:	78 0c 2d e9 	ld      r9,3192(r13)
c000000000226d5c:	28 00 21 f9 	std     r9,40(r1)

r1 is your stack pointer. 3192(r13) is the canary value.

40(r1) is where the canary is stored for later comparison.

r1 should not change through out the function I believe, because otherwise
you don't know where the stack frame is, right?

Later you have this stuff before the function returns which gcc presumably
did due to optimization. That mr means move register and is where the caching
of r13 to r10 happens that Boqun pointed.

c000000000226eb4:	78 6b aa 7d 	mr      r10,r13
[...]
and then the canary comparison happens:

c000000000226ed8:	28 00 21 e9 	ld      r9,40(r1)
c000000000226edc:	78 0c 4a e9 	ld      r10,3192(r10)
c000000000226ee0:	79 52 29 7d 	xor.    r9,r9,r10
c000000000226ee4:	00 00 40 39 	li      r10,0
c000000000226ee8:	b8 03 82 40 	bne     c0000000002272a0 <srcu_gp_start_if_needed+0x5a0>

So looks like for this to blow up, the preemption/migration has to happen
precisely between the mr doing the caching, and the xor doing the comparison,
since that's when the r10 will be stale.

thanks,

 - Joel

