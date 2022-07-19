Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53EDB579FC4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 15:36:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnKby2DLwz3d9y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 23:36:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aHMRxUHb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnKbJ1zyZz2xh0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 23:35:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=aHMRxUHb;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LnKbF1NT5z4x7X;
	Tue, 19 Jul 2022 23:35:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658237737;
	bh=CrnNLr81S4YloGowqIvvpwhKM5iqnery0Z9Yt9RUyUs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aHMRxUHbnCfBomhXQ9tcldDT7Pg5cCo4FncMhuN9OsMFUFaf1g9O5F7eSr913cN8V
	 6htMn2aBuGi1A0ciVH+PVPjaqPpmy4axP36kZF1GMcKGDvsIng09UB3jFSApnWQnVF
	 qpwEBvIATnpJkrTY9K7VLEIVWsp/LcImBXE2obx++KfGOLC7R63Ry00J0hGkmmSUlk
	 so2xQ8rIVeHG4gFXtj4tp3I53J7LL3AhVDLFSRcweulMtvcSYBl1o4dfbkI7m2cgYd
	 ToqoL7kkOTto9lRWn68KxknxrSec249u8WrBzJC+0+kUvx2Sr+jOv6O6W6LmYdHb0i
	 tJzl1r/3dGEtA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: mainline build failure of powerpc allmodconfig for prom_init_check
In-Reply-To: <CAHk-=wgJCTaY5FeNpcw6U-c1Z6c-A2WWQfCVa=1WW3Hdf9_eww@mail.gmail.com>
References: <Ys/aDKZNhhsENH9S@debian>
 <CADVatmO9XzFnX+N0TuOtr0FYyxKr1oe5RAhCEJjmnvjteT5QNw@mail.gmail.com>
 <87cze3docs.fsf@mpe.ellerman.id.au>
 <CAHk-=wgJCTaY5FeNpcw6U-c1Z6c-A2WWQfCVa=1WW3Hdf9_eww@mail.gmail.com>
Date: Tue, 19 Jul 2022 23:35:33 +1000
Message-ID: <871quhdy3e.fsf@mpe.ellerman.id.au>
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
Cc: Kees Cook <keescook@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linux-hardening@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:
> On Sun, Jul 17, 2022 at 9:41 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> >         li 4,254                 #,
>>
>> Here we load 254 into r4, which is the 2nd parameter to memset (c).
>
> I love how even powerpc people know that "4" is bogus, and have to
> make it clear that it means "r4".

I wouldn't say it's bogus, I was just translating from asm to English :)

But I agree it's preferable to use a proper register name rather than a
bare integer. I never write asm using bare integers, I always use r4 or
%r4, because as you say it's too easy to get mixed up otherwise.

When looking at generated code I usually use objdump -d output, which
uses the "r4" syntax.

> It's not even an IBM thing. S390 uses perfectly sane register syntax,
> and calls things '%r4" etc.

as accepts that syntax if you tell it to.

We use that syntax in some of our newer inline asm blocks.

> The human-written asm files have those #define's in headers just to
> make things slightly more legible, because apparently the assembler
> doesn't even *accept* the sane names.

I would like to switch to using %rX everywhere and get rid of those
defines, but it's never seemed like it's worth the churn. We have ~48K
lines of asm in arch/powerpc.

cheers
