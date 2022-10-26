Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9989260DA04
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 05:45:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MxvpK14XKz3cCR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Oct 2022 14:45:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AayjD2kR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MxvnN5WSdz2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Oct 2022 14:44:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AayjD2kR;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MxvnM1dvYz4x1G;
	Wed, 26 Oct 2022 14:44:23 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1666755863;
	bh=TcGWZ/8i9vDAl2icjyxkCciEesQOkx/pAavjl5eoWBA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AayjD2kRxIUqP3jc+cvkhuLAvDZXJYqohWRcBduVvkSUWKf6aHZS0PGA9Y9XGtWEP
	 lyn1bIRrn5vjg7iOMfBZGSzrKOIZCmXvTdgxag0v5r5gihPHJI0LJ6GqSk2WyFqy/C
	 e5OAWQwHxkgng8VUtEYA9IOalD+QMFu5En6uQsTskAPfDSHdhTG4uSqVG0Ry55dlW7
	 svboBrmcSXxTpGxtRobBdPgA0Ym4PnxBdN9KPS579O+ra4cJs//cypl/461uHGj8i8
	 iPiBlaZ4eGaCvbgwomVkfC91hRhhNe31ha72WDXMxadAdtqk2C+968jNXCJNepuVhp
	 hqhhMM9gxP0MQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Guenter Roeck <linux@roeck-us.net>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: Linux 6.1-rc2
In-Reply-To: <20221025172239.GC968059@roeck-us.net>
References: <CAHk-=wgLV1tNP0EYz7qWK-xeKzO6bh5Kogbpn2wxKLPPpOit3w@mail.gmail.com>
 <20221025162441.GA1128834@roeck-us.net>
 <CAHk-=wivKoK4VgfKB8ykQUHKhNSUYA2=m4X7k8QKaizSMvzgZg@mail.gmail.com>
 <20221025172239.GC968059@roeck-us.net>
Date: Wed, 26 Oct 2022 14:44:18 +1100
Message-ID: <878rl3tfjh.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Guenter Roeck <linux@roeck-us.net> writes:
> On Tue, Oct 25, 2022 at 09:41:50AM -0700, Linus Torvalds wrote:
>> On Tue, Oct 25, 2022 at 9:24 AM Guenter Roeck <linux@roeck-us.net> wrote:
>> >
>> > Build results:
>> >         total: 152 pass: 152 fail: 0
>> > Qemu test results:
>> >         total: 499 pass: 499 fail: 0
>> 
>> Woo-hoo!
>> 
>> That was quick, for once.
>> 
>
> Yes, it was. I now have an even better one, with a new personal
> milestone reached (500 qemu boot tests):
>
> Build results:
> 	total: 152 pass: 152 fail: 0
> Qemu test results:
> 	total: 500 pass: 500 fail: 0
> 	       ^^^
>
> ... after getting yet another qemu machine to boot.
>
>> > Runtime warnings
>> 
>> Oh.
>> 
>> Well, close enough, and those fixes are presumably pending too.
>> 
>
> Let's hope so. I think I forgot to copy the ppc maintainers last week,
> so we'll see if we get some feedback on the status of those problems.

I have those in my fixes-test branch. While testing one of them I
stumbled on some issues that I've been trying to confirm are existing
and not regressions.

But I plan for those fixes to hit rc3.

cheers
