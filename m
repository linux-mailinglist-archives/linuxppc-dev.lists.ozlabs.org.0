Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C24495F7697
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 12:00:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MkP2H6jkxz3drg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 21:00:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JrsEniCa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MkP1K4sN2z3c3V
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 20:59:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=JrsEniCa;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MkP1F4Prqz4x1V;
	Fri,  7 Oct 2022 20:59:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1665136785;
	bh=r5pOhr5aXcgfuxajTgRTIpgB/fG0Hr0VJvR4lNkxQuk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=JrsEniCa8qmRDqtWz6i7lz8Evqm4LMSG/owqkEoToYVYDx/4RYzKgRr8s4lW6F9x4
	 btk+FMh1Fy/mR7jqcXnE7Nwzn1qM4rOO2fidSQolZbs9Jt5qIZ3a6YoDkbD0AIPMJA
	 1mTassUolopT46KlIKk1/GKiz0pS/hxDIcdpSmT7vCC5WHrLB1MztvHgW0/fhy3ffc
	 Uc2Fo1N/y+azSYQi5VwynlKDz/t3VIzymq+IqIsr88AT/WSaNPzsHDYIUECKqrjNf9
	 xh4BgcSD6H+Ij5ZJ4TiJSHGVsFmzsSg4Z3Nf/kVhExpMT2X718HNa0kFFxNArEDWin
	 HucxopABOhxMA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [PATCH v2 06/19] powerpc/cputable: Split cpu_specs[] out of
 cputable.h
In-Reply-To: <f75c2d9d-423f-f8c4-5bcd-cdea6c33e206@csgroup.eu>
References: <828f6a64eeb51ce9abfa1d4e84c521a02fecebb8.1663606875.git.christophe.leroy@csgroup.eu>
 <a44b865e0318286155273b10cdf524ab697928c1.1663606875.git.christophe.leroy@csgroup.eu>
 <CN13QQX0NEA2.M6SABG46NYYN@bobo>
 <f75c2d9d-423f-f8c4-5bcd-cdea6c33e206@csgroup.eu>
Date: Fri, 07 Oct 2022 20:59:40 +1100
Message-ID: <87k05cnecz.fsf@mpe.ellerman.id.au>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Le 20/09/2022 =C3=A0 10:56, Nicholas Piggin a =C3=A9crit=C2=A0:
>> On Tue Sep 20, 2022 at 3:01 AM AEST, Christophe Leroy wrote:
>>=20
>> This series is a nice cleanup. No comments yet but kernel/ is getting
>> pretty crowded. Should we make some subdirectories for subarch things
>> like mm has?
>>=20
>> Can do that after your series. Probably requires another merge window
>> to do it.
>>=20
>
> By the way, I'm wondering how we decide whether some code goes in=20
> arch/powerpc/kernel/ or in arch/powerpc/lib/

On a case-by-case basis? :)

I think our lib is *mostly* routines that are library like, eg. string
copy, memcpy, memcmp etc. Though there's also single step code, code
patching etc.

I guess one thing they have in common is that they're (somewhat) self
contained routines that do a specific thing, and that they are called
from various other parts of the kernel.

On the other hand code in kernel *tends* to be more larger things, like
early boot sequence, interrupt/syscall entry, module loading etc.

But really kernel is where everything lives that doesn't have anywhere
else to go, so it's a bit of a dumping ground.


Talking specifically about all these CPU files, I think we could create
an arch/powerpc/cpu for them. On x86 they have arch/x86/kernel/cpu, but
the kernel seems redundant.

With all the CPU specs, CPU setups, and dt_cpu_ftrs.c we'd have ~4500
lines that could go in arch/powerpc/cpu. Which seems like enough to
justify a directory.

cheers
