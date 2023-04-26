Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4796EF454
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 14:30:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q5yrl4L5nz3fVm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 22:30:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ezlHX53X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q5yqs34F2z306Y
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Apr 2023 22:30:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ezlHX53X;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q5yqr2YHkz4xFd;
	Wed, 26 Apr 2023 22:30:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1682512200;
	bh=8LaY3/EdE4NVsF9YWnEonYJEbMaadgI0VtNBm8ceyN4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ezlHX53XcQh0cJTlV2sS3bQ0g2PN0QTR0hk5JRJFcOcLThfA8983vId1vYMvP+RCJ
	 WrG0FLBABNmivnreMK5adZwpHqgw0Re4T72gvomty/kkIUY4uGRyCxA0ltLvkqI1ts
	 RyCEFIFgnHc6B5xPUOHtHhFtDNC+EVLo6ia4OtWscKwFXgYS4nH9Vu8nYhcGEdJv6N
	 YhNR3Uv8LHXcPLOX7UE49wjPPxBNBtdJYH+vC0Ta/MaycXJ30W9qENqHtO+VTovb20
	 giHSyCC0cKz+xh82HBrU1OpLjhoSIaSOe6BJOXymMcev+qVhQy7kIZx3R2TD0t5a1w
	 N5ukeAwPKWeew==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joel Fernandes <joel@joelfernandes.org>, Zhouyi Zhou
 <zhouzhouyi@gmail.com>, Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
In-Reply-To: <CAEXW_YQEarLt7YGQZdwmcSyZcGRCGKf89ovxjQdXBO-TgXAk-w@mail.gmail.com>
References: <CAABZP2xJRGhPmfB-PrfesQKzP7fsuZsj+3TewAiLLW8u=YK4dg@mail.gmail.com>
 <CAEXW_YSSGYgqTpxqbYikCFS9t=2f+L-0phbU+gAAngB5z-FbyA@mail.gmail.com>
 <ZEXOMC2casTlobE1@boqun-archlinux> <87fs8pzalj.fsf@mail.concordia>
 <20230424151351.GP19790@gate.crashing.org>
 <ZEagN1jJwg+rUzX4@boqun-archlinux>
 <CAEXW_YRfetnhgCw5OgnwhgZF_U+UkHN=uy=L8ovGLqn1UCtfTg@mail.gmail.com>
 <20230425101324.GD1331236@hirez.programming.kicks-ass.net>
 <CAABZP2ypJ98T3XAqPnLrxxzrYckSQ6sn3woEmpigQ+cRRaw=Zw@mail.gmail.com>
 <CAEXW_YQEarLt7YGQZdwmcSyZcGRCGKf89ovxjQdXBO-TgXAk-w@mail.gmail.com>
Date: Wed, 26 Apr 2023 22:29:59 +1000
Message-ID: <877ctyzv08.fsf@mail.concordia>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: "Paul E.
 McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, lance@osuosl.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Joel Fernandes <joel@joelfernandes.org> writes:
> On Tue, Apr 25, 2023 at 6:58=E2=80=AFAM Zhouyi Zhou <zhouzhouyi@gmail.com=
> wrote:
...
>
> Out of curiosity for PPC folks, why cannot 64-bit PPC use per-task
> canary? Michael, is this an optimization? Adding Christophe as well
> since it came in a few years ago via the following commit:

I think Christophe also answered these in his reply.

We do use a per-task canary, but because we don't have "current" in a
register, we can't use the value in current for GCC.

In one of my replies I said a possible solution would be to keep current
in a register on 64-bit, but we'd need to do that in addition to the
paca, so that would consume another GPR which we'd need to think hard
about.

There's another reason to have it in the paca, which is that the paca is
always accessible, even when the MMU is off, whereas current isn't (in
some situations).

In general we don't want to use stack protector in code that runs with
the MMU off, but if the canary wasn't in the paca then we'd have a hard
requirement to not use stack protector in that code.

cheers
