Return-Path: <linuxppc-dev+bounces-13992-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ABDC45803
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 10:04:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4kHq0DHxz2xqM;
	Mon, 10 Nov 2025 20:04:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762765462;
	cv=none; b=e+q2h8bIDREYKSltqM9fpc9xgQTcN/x9yN4JJgCpFlc3oEsWD24NQ9PmIH2kWwBA66s7ylLwF80aKrLiLV8MoymHoE9/dLbQUFoL9GNAs1gk422NOPjX3CmzdTFFGaYTKSxz4sidAVMssjBcJITm81nY7lmJb8PdN2ICvKiKKLquBqS1Dt7TMh9fqzjGucklvmJ2cEyR+OVlJPUrztmr8AeTth1hRYrSQaxpqBlS6hBbUviADOg0DuY7mozqPX17r/dnQR6oPc7TvsMPZet1uWme9B4LQQ0dC6eEktcG4cc05oN4tCYxNCNoUOYr+Qw8sgW1wQqLWf5/DprrKhz/Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762765462; c=relaxed/relaxed;
	bh=t7Guwo0wpxf95Dj+W5UROJyXFGtl7LdcWRhhh/Qf98U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4WQYYYEFedPIkzc7Hn7Dz+Z6IWB2qZ7qf84AYjaHsdVgJLiLCY2fYwelR1llhGvwd1l/bIYBc4eyeMbUerxBsVRrVheLqJ1+EvcDznzneKXn+YfgYUQcPclDOlD3h2G5Zgun/GA8Sp38jVJi8uo2M2Aq0HB07gvp+ZKHyfNJflb5NCNumNcEPERC5gQZccJnE+q/yqvULK9QYuHNwInBARAUTBBVRkfLLW9FYnbCsfqxkDvvkhxH9+gyrRiFRax69jB9NRRt6Z5je3pNRg4zo2hrwIZMe3rAN8sO8yLsgaX4FGqP4nRTjs/oRpROArYJwXL9Q163G30pPQXxiPryg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=THzC1+oh; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+Nqx/ogP; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=THzC1+oh;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=+Nqx/ogP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d4kHp1Px0z2xFT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 20:04:22 +1100 (AEDT)
Date: Mon, 10 Nov 2025 10:04:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762765458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t7Guwo0wpxf95Dj+W5UROJyXFGtl7LdcWRhhh/Qf98U=;
	b=THzC1+ohs7W95eY6RMSRaFJ23VdVBGm5I563I8YASdM00wmofpB9awW1xssuqstq1G4GN9
	sOp/H73rX5A8lDzddsuk8aEuXZEoY8VatUS8uqdA4P1QwSycvK5U5xYCvCQW9Q155hvtp3
	7ckU266rRRDn0XAp4JFw8QggWtZsAdOzRHV27wCZCUOuJXVoY4kNpRUGWB5Gkn9W3A+Nid
	ZNdYJVGJc5HIjFvYZ80gZ8VPKbKpROUhWLEJnGJX/MlPmmtBKOsGsmRMNFy48oFYgIc0zU
	W+Yiule8nXEF4YfdxOus7DWnvJkK4zQXI2Nc/NhrrTfeic27du8bXWM6BV1vSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762765458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t7Guwo0wpxf95Dj+W5UROJyXFGtl7LdcWRhhh/Qf98U=;
	b=+Nqx/ogPinQ4vfSfKxwtwM9MURpLI4OvfJJe18bf22Qbmt21zd133O7NoOhjUAYH62UQVr
	zbqasc8HiwXrEsDA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Shuah Khan <shuah@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	Russell King <linux@armlinux.org.uk>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v5 19/34] random: vDSO: only access vDSO datapage after
 random_init()
Message-ID: <20251110094555-353883a9-1950-4cc6-a774-bb0ef5db11c5@linutronix.de>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
 <20251106-vdso-sparc64-generic-2-v5-19-97ff2b6542f7@linutronix.de>
 <aQ6EvdukQytvqK-u@zx2c4.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aQ6EvdukQytvqK-u@zx2c4.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Nov 08, 2025 at 12:46:05AM +0100, Jason A. Donenfeld wrote:
> I'm not a huge fan of this change:
> 
> On Thu, Nov 06, 2025 at 11:02:12AM +0100, Thomas Weißschuh wrote:
> > +static DEFINE_STATIC_KEY_FALSE(random_vdso_is_ready);
> >  
> >  /* Control how we warn userspace. */
> >  static struct ratelimit_state urandom_warning =
> > @@ -252,6 +253,9 @@ static void random_vdso_update_generation(unsigned long next_gen)
> >  	if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
> >  		return;
> >  
> > +	if (!static_branch_likely(&random_vdso_is_ready))
> > +		return;
> > +
> >  	/* base_crng.generation's invalid value is ULONG_MAX, while
> >  	 * vdso_k_rng_data->generation's invalid value is 0, so add one to the
> >  	 * former to arrive at the latter. Use smp_store_release so that this
> > @@ -274,6 +278,9 @@ static void random_vdso_set_ready(void)
> >  	if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
> >  		return;
> >  
> > +	if (!static_branch_likely(&random_vdso_is_ready))
> > +		return;
> > +
> >  	WRITE_ONCE(vdso_k_rng_data->is_ready, true);
> >  }
> >  
> > @@ -925,6 +932,9 @@ void __init random_init(void)
> >  	_mix_pool_bytes(&entropy, sizeof(entropy));
> >  	add_latent_entropy();
> >  
> > +	if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
> > +		static_branch_enable(&random_vdso_is_ready);
> > +
> >  	/*
> >  	 * If we were initialized by the cpu or bootloader before jump labels
> >  	 * or workqueues are initialized, then we should enable the static
> > @@ -934,8 +944,10 @@ void __init random_init(void)
> >  		crng_set_ready(NULL);
> >  
> >  	/* Reseed if already seeded by earlier phases. */
> > -	if (crng_ready())
> > +	if (crng_ready()) {
> >  		crng_reseed(NULL);
> > +		random_vdso_set_ready();
> > +	}
> 
> The fact that the vdso datapage is set up by the time random_init() is
> called seems incredibly contingent on init details. Why not, instead,
> make this a necessary part of the structure of vdso setup code, which
> can actually know about what happens when?

The whole early init is "carefully" ordered in any case. I would have been
happy to allocate the data pages before the random initialization, but the
allocator is not yet usable by then.
We could also make the ordering more visible by having the vDSO datastore call
into a dedicated function to allow the random core to touch the data pages:
random_vdso_enable_datapages().

> For example, one clean way of
> doing that would be to make vdso_k_rng_data always valid by having it
> initially point to __initdata memory, and then when it's time to
> initialize the real datapage, memcpy() the __initdata memory to the new
> specially allocated memory. Then we don't need the complex state
> tracking that this commit and the prior one introduce.

Wouldn't that require synchronization between the update path and the memcpy()
path? Also if the pointer is going to change at some point we'll probably need
to use READ_ONCE()/WRITE_ONCE(). In general I would be happy about a cleaner
solution for this but didn't find a great one.


Thomas

