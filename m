Return-Path: <linuxppc-dev+bounces-13118-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D4ABF775C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Oct 2025 17:46:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4crc8c0vpKz306S;
	Wed, 22 Oct 2025 02:46:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761061568;
	cv=none; b=NyLPKXJEhw2nfxFDnVu0GjF4amwiCgW7pAZ2ICKztxSeIJGP21mL/spGj7PS1JykzagV4TvQAv6J9oRiKSo2yqXZrwW4g8JJlz/HeoR5UgdHhb8k/jdOiA6XeFn8wUIV1m2XzatQFyoGLbh1JiY0NUb0u7jqEymnyaFbRsupyS1c7kOrezMNx398xcf0tBv0R3X3D1beViRSycxuSInb/ilvG6b0MKcbzlag8UC8dyhIbSfqN1nKeKFCfgLqhe+GQglDsSu78C43gJHUNHRZd4r3OuCzuyx8QscNW5SewXhv7q1aRdTbL7hE2SQ6NXEQlnWNWZ/1/cSgQ6dqK2KdjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761061568; c=relaxed/relaxed;
	bh=bwrcsQ4E69ewTeWtqAZ5emGZEvWIYhFcDibNTG0FA/U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l9Jhdn7nB1DITM0QLu9CKNHBzztjijiFckOWrCqDnxRUmbvTa3huvGB3cRwJAT+zPKi/8/54uO1jNN5T2MnxlaluZCDFXWulUr+pagY0ETDmgSBd8yJtTXqM9r9rMwY5MsOtMS5x/DTaxyNxaSjKEtJZmsSoaP8GQJ3hWuFyXKGdat2k73r0c7n3Akq0eyxRHFeEvwQQBmKAbqkYPK7oZA2PQF9BNU72xK1+s0sEusHzhvR0Z9gWzmfztfo/weyP0+Q9OX+uGI76B5rmhyOHwIeHT4cznghR3J/sEuUl09SYepBIEWhZUyrc5O2+pzoKb0bYz4qg1Dr2fhZcZNMKHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=AimhTbm/; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cvRNsdPS; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=AimhTbm/;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cvRNsdPS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4crc8T5RBMz2ymg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Oct 2025 02:46:01 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761061557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bwrcsQ4E69ewTeWtqAZ5emGZEvWIYhFcDibNTG0FA/U=;
	b=AimhTbm/MmiU0oRMAd3uF686t3hr81Y5owQjwPt+t/EQgCKBa69nmulwgBV69DAgmeOiLs
	0dBlFvHe0CuIkLHWUhiL1t/BqksXKeOpRZ/JKO0XZ3uhW83aU/uvkv0aGEtMB3NqQYbo8T
	c1a/8lfSam1pX5DGvhcfkGXmV4x32lsZ332bnVFLI1XCKFZjiwp6KgAVuCMJQhQZ/BG1+3
	zi05GK9tLktBwlzF4YW3WSZoTogjkHwXyP3B8Tirr/2VvmwbsYu+mDsX55tIF2MT64MPBm
	xLwiGchu4C52oZGHU6/XiSveriXXJanvaLMtB2ia9NFfIw4m6RTH0hIsSxsIxw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761061557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bwrcsQ4E69ewTeWtqAZ5emGZEvWIYhFcDibNTG0FA/U=;
	b=cvRNsdPSRZnlZAgeJWkp3R95tMpoJ7F1qDZZCErTmzw+alSEUX9RVLzo8yFL18BIEiQxRa
	dsntvmwnLjX8G6Dg==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: David Laight <david.laight.linux@gmail.com>, LKML
 <linux-kernel@vger.kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, kernel test robot <lkp@intel.com>, Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko
 Carstens <hca@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?utf-8?Q?Andr=C3=A9?= Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan
 Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 07/12] uaccess: Provide scoped masked user access
 regions
In-Reply-To: <CAHk-=wgE-dAHPzrZ7RxwZNdqw8u-5w1HGQUWAWQ0rMDCJORfCw@mail.gmail.com>
References: <20251017085938.150569636@linutronix.de>
 <20251017093030.253004391@linutronix.de> <20251020192859.640d7f0a@pumpkin>
 <877bwoz5sp.ffs@tglx>
 <CAHk-=wgE-dAHPzrZ7RxwZNdqw8u-5w1HGQUWAWQ0rMDCJORfCw@mail.gmail.com>
Date: Tue, 21 Oct 2025 17:45:56 +0200
Message-ID: <871pmwz2a3.ffs@tglx>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 21 2025 at 05:06, Linus Torvalds wrote:
> On Tue, 21 Oct 2025 at 04:30, Thomas Gleixner <tglx@linutronix.de> wrote:
>>
>> On Mon, Oct 20 2025 at 19:28, David Laight wrote:
>> >
>> > (I don't like the word 'masked' at all, not sure where it came from.
>>
>> It's what Linus named it and I did not think about the name much so far.
>
> The original implementation was a mask application, so it made sense
> at the time.
>
> We could still change it since there aren't that many users, but I'm
> not sure what would be a better name...

I couldn't come up with something sensible for the architecture side.

But for the scope guards I think the simple scoped_user_$MODE_access()
is fine as for the usage site it's just a user access, no?

the scope magic resolves either to the "masked" variant or to the
regular user_access_begin() + speculation barrier depending on
architecture support. But that's under the hood an implementation detail
of the scope...() macros.

Thanks,

        tglx

