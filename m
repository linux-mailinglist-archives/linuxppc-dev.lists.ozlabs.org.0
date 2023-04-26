Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 115426EF6B8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Apr 2023 16:46:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q61sK6vcvz3f4M
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Apr 2023 00:46:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gfBLEMyo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q61rV418qz3cKb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Apr 2023 00:45:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gfBLEMyo;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q61rS6PL0z4x1H;
	Thu, 27 Apr 2023 00:45:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1682520345;
	bh=oMuxe+KJMbGNCZWYXnNWaQGhxAfiAj2LaZcWFR8JHYs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gfBLEMyoAxGwCpEE9bWsDlEcneRdSa0i0L6TuE6lyTRckWh6EI1FJRxaEncFnWpfK
	 0Peh1/OXF1fV1pBhOz+0HtoMCHT1fFL61BFpfQfg4uNJz1vjovVqgEqTmxF/Yc1ewb
	 Bbu3/As/Va0rAKRt7gk/DR9DmCONJsnTe+UJYjFWDpRWn5N8iFqMd3f6iXLSlJ0aVe
	 wv287yiW4xC7eR0l+gk6WOXzSMBBiUkh4DSKFd1AiA918pHeQhfXCrvtCJbqsgZcP/
	 bOTA7gvTUewq4M2lROswBt/qcBhb+o2qi36AQgicpEIIT1I9w+XdX0HAGS51dNnAop
	 GXZlkHivnu+fQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Peter Zijlstra <peterz@infradead.org>, Joel Fernandes
 <joel@joelfernandes.org>
Subject: Re: BUG : PowerPC RCU: torture test failed with __stack_chk_fail
In-Reply-To: <20230426142054.GA1381951@hirez.programming.kicks-ass.net>
References: <ZEXOMC2casTlobE1@boqun-archlinux>
 <87fs8pzalj.fsf@mail.concordia> <20230424151351.GP19790@gate.crashing.org>
 <ZEagN1jJwg+rUzX4@boqun-archlinux>
 <CAEXW_YRfetnhgCw5OgnwhgZF_U+UkHN=uy=L8ovGLqn1UCtfTg@mail.gmail.com>
 <20230425101324.GD1331236@hirez.programming.kicks-ass.net>
 <CAABZP2ypJ98T3XAqPnLrxxzrYckSQ6sn3woEmpigQ+cRRaw=Zw@mail.gmail.com>
 <CAEXW_YQEarLt7YGQZdwmcSyZcGRCGKf89ovxjQdXBO-TgXAk-w@mail.gmail.com>
 <877ctyzv08.fsf@mail.concordia>
 <CAEXW_YR4rmNY5JF-077EUpriF=PP9uML+_WMDSVi-L3G6_FOdw@mail.gmail.com>
 <20230426142054.GA1381951@hirez.programming.kicks-ass.net>
Date: Thu, 27 Apr 2023 00:45:44 +1000
Message-ID: <874jp2zopz.fsf@mail.concordia>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, "Paul E. McKenney" <paulmck@kernel.org>, Zhouyi Zhou <zhouzhouyi@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>, lance@osuosl.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Peter Zijlstra <peterz@infradead.org> writes:
> On Wed, Apr 26, 2023 at 09:44:22AM -0400, Joel Fernandes wrote:
>
>> How could you control which code paths don't have the stack protector?
>> Just curious.
>
> https://lkml.kernel.org/r/20230412-no_stackp-v2-0-116f9fe4bbe7@google.com

We also have some entire files disabled, eg:

$ git grep no-stack-protector arch/powerpc/
arch/powerpc/kernel/Makefile:CFLAGS_prom_init.o += -fno-stack-protector
arch/powerpc/kernel/Makefile:CFLAGS_syscall.o += -fno-stack-protector
arch/powerpc/kernel/Makefile:CFLAGS_setup_64.o                += -fno-stack-protector
arch/powerpc/kernel/Makefile:CFLAGS_paca.o                        += -fno-stack-protector

cheers
