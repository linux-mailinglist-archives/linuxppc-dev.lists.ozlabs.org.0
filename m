Return-Path: <linuxppc-dev+bounces-13221-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A4EC030BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 20:44:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csw1N5Z3jz3bfF;
	Fri, 24 Oct 2025 05:44:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761245064;
	cv=none; b=gew7rpCNvp/d0trO0F9RHD0WOZp+4nFWe/2eo6gye2vF7Qz+GFuLaGHTi/UYr+t6kX1iAnY4mjgfbf11K0lsZYjQazfPw9cWNfLGwWVAecrGx+SwyqLkIdZc/BnpHtyM45k1fSPCX1sBqlgLJs8ozt+pQgYH0U83aZrY0tqGKeYtr4Z0bDluQ6Zg3zLzvXmaQFKvExg4mu1FqfNSQ53RsQ2Zmm6mMbjvbXdlR1BiUVXNDq+ZpowCWufVIqjzpZ6dbq4lOze6biWwKPsY10hW/MXO94rewqWY0JY6XXE5PnTFlWR/h2F0FJOEhMezwmpSkzYlOy+EaW1bC+z6g6Om3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761245064; c=relaxed/relaxed;
	bh=gr+iTa6I2/obiorgX/iYvIq85HArhg0aBMc30DEux0I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZqfX9ndVyTMC8ju/ZN/QBYjP4CbPboNrpHEVUh/lJvQ0NYjw9npY+ZIDALsiqr/N5sMOsWPdH97YMW5h2493lNRbDAfyoFgFmDAHGsMKvEIYZY9HP7dkTMpFOyKSd7Rnn49Zqt8lPwz0sWXTstEzhb9/6Liqk9nzYBIqrpcSg8f4OZKszVonnpdgvJwWddFb72Ha9HOja6+jlmC+oYHuHwyz7mxvhNJM7+9KyX0V7S5OyEzQ82nRD8hscNKgkm9LJliYlG4xojUwn70nQFJBLFecJsvdumDmAz9JZj0CMbZxGUhy5ZpLfBq/VlTBusMDaN5EjXvcUp/k2UBd7JvShg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Z6JyVVvX; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=k2PqTysZ; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=Z6JyVVvX;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=k2PqTysZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csw1M0x6Nz3bf4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 05:44:23 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761245054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gr+iTa6I2/obiorgX/iYvIq85HArhg0aBMc30DEux0I=;
	b=Z6JyVVvXaWOYv4K7XWupHxBpzZlYpgf5Va2pTz0xKoekHimqy8m9kpzWJR67k8NTSge6Pu
	pj1eoQeYp8npSoNhcmRFl+wtklkvdSbntGU/+ZU+VkEYhATJ/2w67pfLl6NrKzFL8YkFBj
	tz+RIae+Vg6+/gA7ZwvSAx8jyyfFhHWoerQNsfsX8vZwG++ZSmVquE3u5d9Qky5u/pWhfe
	Z27mkNjesStYEnSIaLWsvH9GU2GdvVJ+/1wsaxCCyTnv7bk0dW7oyVKDPvU36ZH4tGdIz0
	SAAZZgn3S2Kdp9w4d8AFHEvN5ZwXz+cPMrMK16HbkBELjB3xvZYnc/4yMJ00yA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761245054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gr+iTa6I2/obiorgX/iYvIq85HArhg0aBMc30DEux0I=;
	b=k2PqTysZqIKK5wnAuNAF6YkOs1yYrSVeb86wNNECOCJRF4fnFtNx18Z5K79S+1+JpepjUk
	+w4iQ08K50QRq8Bg==
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra
 <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, Davidlohr
 Bueso <dave@stgolabs.net>, =?utf-8?Q?Andr=C3=A9?= Almeida
 <andrealmeid@igalia.com>, kernel
 test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, x86@kernel.org, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix
 <nicolas.palix@imag.fr>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: Re: [patch V4 10/12] futex: Convert to scoped user access
In-Reply-To: <CAHk-=wgLAJuJ8SP8NiSGbXJQMdxiPkBN32EvAy9R8kCnva4dfg@mail.gmail.com>
References: <20251022102427.400699796@linutronix.de>
 <20251022103112.478876605@linutronix.de>
 <CAHk-=wgLAJuJ8SP8NiSGbXJQMdxiPkBN32EvAy9R8kCnva4dfg@mail.gmail.com>
Date: Thu, 23 Oct 2025 20:44:13 +0200
Message-ID: <873479xxtu.ffs@tglx>
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
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Oct 22 2025 at 05:16, Linus Torvalds wrote:
> On Wed, 22 Oct 2025 at 02:49, Thomas Gleixner <tglx@linutronix.de> wrote:
>>
>> From: Thomas Gleixner <tglx@linutronix.de>
>>
>> Replace the open coded implementation with the new get/put_user_scoped()
>> helpers.
>
> Well, "scoped" here makes no sense in the name, since it isn't scoped
> in any way, it just uses the scoped helpers.

I know. Did not come up with a sensible name so far.

> I also wonder if we should just get rid of the futex_get/put_value()
> macros entirely. I did those masked user access things them long ago
> because that code used "__get_user()" and "__put_user()", and I was
> removing those helpers and making it match the pattern elsewhere, but
> I do wonder if there is any advantage left to them all.
>
> On x86, just using "get_user()" and "put_user()" should work fine now.
> Yes, they check the address, but these days *those* helpers use that
> masked user address trick too, so there is no real cost to it.
>
> The only cost would be the out-of-line function call, I think. Maybe
> that is a sufficiently big cost here.

I'll have a look at the usage sites.

But as you said out-of-line function call it occured to me that these
helpers might be just named get/put_user_inline(). Hmm?

Thanks,

        tglx

