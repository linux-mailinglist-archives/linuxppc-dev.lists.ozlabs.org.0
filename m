Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B8428A9042
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 03:01:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SDAV5RYY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKfc81W63z3cY2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Apr 2024 11:01:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SDAV5RYY;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKfbP06Z9z3cBx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Apr 2024 11:00:49 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1713402045;
	bh=vTanqau4t/U+Uyls6+AXjIbwm8dSM1/9KWNhqrmGuGY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SDAV5RYYCtv9/IfXyhzcOOOTEmUMqPzfiEGS4GgSjQnGQUV7yADPMa14Nd0rmUE/K
	 aquXYXEUaYGpBv5GCsf8zH15kInnF/2Xi9xZigUB1VFYkbS3IWcata7UA7dTgHg+rs
	 7Fd+yV9yJBuUoLZkiMLrspqMbOl6FKqPUQ87rykTej4IKlGrkD83YiCNOwliRNm4yR
	 osPxlSCN9oSgSQNXy9fbIMcKfAXI08A3mrZCyZ3alA/xpYUJRjClRlIDtlLJqY56IV
	 SHmyD7lVNtHX7SS+8Q95mEw1DDSmFAz18MUgX1C0dHSN0cUPgvKKr58M4Yvj5nc+fc
	 4UEOJKGC3p1iA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VKfbJ1h6Hz4wc8;
	Thu, 18 Apr 2024 11:00:44 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Frederic Weisbecker <frederic@kernel.org>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH v2 RESEND 0/5] sched/vtime: vtime.h headers cleanup
In-Reply-To: <Zh-kEvJbNR2krwmx@localhost.localdomain>
References: <cover.1712760275.git.agordeev@linux.ibm.com>
 <Zh-kEvJbNR2krwmx@localhost.localdomain>
Date: Thu, 18 Apr 2024 11:00:43 +1000
Message-ID: <87h6fzbi2s.fsf@mail.lhotse>
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
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-s390@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Vasily Gorbik <gor@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Ingo Molnar <mingo@redhat.com>, linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Frederic Weisbecker <frederic@kernel.org> writes:
> Le Wed, Apr 10, 2024 at 05:09:43PM +0200, Alexander Gordeev a =C3=A9crit :
>> Hi All,
>>=20
>> There are no changes since the last post, just a re-send.
>>=20
>> v2:
>> - patch 4: commit message reworded (Heiko)
>> - patch 5: vtime.h is removed from Kbuild scripts (PowerPC only) (Heiko)
>>=20
>> v1:
>> Please find a small cleanup to vtime_task_switch() wiring.
>> I split it into smaller patches to allow separate PowerPC
>> vs s390 reviews. Otherwise patches 2+3 and 4+5 could have
>> been merged.
>>=20
>> I tested it on s390 and compile-tested it on 32- and 64-bit
>> PowerPC and few other major architectures only, but it is
>> only of concern for CONFIG_VIRT_CPU_ACCOUNTING_NATIVE-capable
>> ones (AFAICT).
>>=20
>> Thanks!
>
> It probably makes sense to apply the whole series to the scheduler tree.
> Does any powerpc or s390 maintainer oppose to that?

No objection. It has acks and reviews from powerpc.

cheers
