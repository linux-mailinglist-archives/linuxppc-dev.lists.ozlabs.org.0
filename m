Return-Path: <linuxppc-dev+bounces-13996-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E07C45F5A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 11:37:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4mM75RgLz2xqZ;
	Mon, 10 Nov 2025 21:37:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762771043;
	cv=none; b=YrLdXWTaGzByiYcuZ9Ycr8SMhnttrm2bLIBdC53ge/82GfJcNVpaDOTNFmge85xz5i2ChERTDmrargX/mrq2RAR5sSuTgaIxYSlolEwDDxmWeHEicCSENn6kQb7bG1vd6slZpTeDItEwdDkQtP6FJawJXn2bxNmxAkhyhIk3jOnsAfsERDORArdBdf/72FxNSw4DdXv+9Zn7V95bXMngrZ9zkhZrFAp4ov9Ndtszh423JNM7VAD9OIX8yEWqevxfQzW+tUv9i63sCzvp/oHTRB4wOlqfOvSm5OOkiy/p/+fOktqSEn6EuBE0/seg1zILAPFRMileOWupMTlC2MHuug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762771043; c=relaxed/relaxed;
	bh=1WrguxH4pokigxxkQ8JIMem650725yeeLwdoGz6ziPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PEx/DehCgodTTNn02L8sy/gwu4HtMlxNtBiYK6f/BAI0V+NhuPw130ZOP4f+JO6jOPRJzuQYb98jwmMINk78Jp6Zf5cF3XjRJD18w49bFAN12eJXCB5F7P1Fk0uOF3YEH+wv9hh4ePRnCBw9lgmvUMj26+FfEdd8qW453S8o2UORtKyhxAVIHje+7S31y+BCfmeafWOk7Cov4R3nZkyXBXmsnOEw8ZfJ0S1xg1/GDjNofvDBYHm514TZbefbrUWBsIxjdlZwR8pdg4Zpxy6F6mbUIkO50v/tdwuj6xM8Pbw9P3RxUqfujAWqYb9ekMdXbxeWW3t0SZU1pb4J/azSzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=WTAHFhLQ; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=srs0=6s+/=5s=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=WTAHFhLQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=srs0=6s+/=5s=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4mM467kCz2xFT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 21:37:20 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10DD5601A5;
	Mon, 10 Nov 2025 10:37:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E76C4CEF5;
	Mon, 10 Nov 2025 10:37:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="WTAHFhLQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1762771032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1WrguxH4pokigxxkQ8JIMem650725yeeLwdoGz6ziPQ=;
	b=WTAHFhLQBM9L4uVZANImYYYEpEwrJCJmpUsPeVS7opyWT3kewXLiJpB+S7cWvpyOqmRlk0
	jOvTCsms0UYDa7uYKl2FQdhRurOUoi+bCEX1pnKZador3BykkqFb6xAp1lo4cuCgYvgUtd
	mk8NOd2uY8oXx8TZ6HnEj3LlqXVn94g=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 190dbf96 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 10 Nov 2025 10:37:11 +0000 (UTC)
Date: Mon, 10 Nov 2025 11:37:07 +0100
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Nick Alcock <nick.alcock@oracle.com>,
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Shuah Khan <shuah@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
	Russell King <linux@armlinux.org.uk>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v5 19/34] random: vDSO: only access vDSO datapage after
 random_init()
Message-ID: <aRHAU7bVAIyaOrpA@zx2c4.com>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
 <20251106-vdso-sparc64-generic-2-v5-19-97ff2b6542f7@linutronix.de>
 <aQ6EvdukQytvqK-u@zx2c4.com>
 <20251110094555-353883a9-1950-4cc6-a774-bb0ef5db11c5@linutronix.de>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251110094555-353883a9-1950-4cc6-a774-bb0ef5db11c5@linutronix.de>
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Nov 10, 2025 at 10:04:17AM +0100, Thomas Weißschuh wrote:
> On Sat, Nov 08, 2025 at 12:46:05AM +0100, Jason A. Donenfeld wrote:
> > I'm not a huge fan of this change:
> > 
> > On Thu, Nov 06, 2025 at 11:02:12AM +0100, Thomas Weißschuh wrote:
> > > +static DEFINE_STATIC_KEY_FALSE(random_vdso_is_ready);
> > >  
> > >  /* Control how we warn userspace. */
> > >  static struct ratelimit_state urandom_warning =
> > > @@ -252,6 +253,9 @@ static void random_vdso_update_generation(unsigned long next_gen)
> > >  	if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
> > >  		return;
> > >  
> > > +	if (!static_branch_likely(&random_vdso_is_ready))
> > > +		return;
> > > +
> > >  	/* base_crng.generation's invalid value is ULONG_MAX, while
> > >  	 * vdso_k_rng_data->generation's invalid value is 0, so add one to the
> > >  	 * former to arrive at the latter. Use smp_store_release so that this
> > > @@ -274,6 +278,9 @@ static void random_vdso_set_ready(void)
> > >  	if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
> > >  		return;
> > >  
> > > +	if (!static_branch_likely(&random_vdso_is_ready))
> > > +		return;
> > > +
> > >  	WRITE_ONCE(vdso_k_rng_data->is_ready, true);
> > >  }
> > >  
> > > @@ -925,6 +932,9 @@ void __init random_init(void)
> > >  	_mix_pool_bytes(&entropy, sizeof(entropy));
> > >  	add_latent_entropy();
> > >  
> > > +	if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
> > > +		static_branch_enable(&random_vdso_is_ready);
> > > +
> > >  	/*
> > >  	 * If we were initialized by the cpu or bootloader before jump labels
> > >  	 * or workqueues are initialized, then we should enable the static
> > > @@ -934,8 +944,10 @@ void __init random_init(void)
> > >  		crng_set_ready(NULL);
> > >  
> > >  	/* Reseed if already seeded by earlier phases. */
> > > -	if (crng_ready())
> > > +	if (crng_ready()) {
> > >  		crng_reseed(NULL);
> > > +		random_vdso_set_ready();
> > > +	}
> > 
> > The fact that the vdso datapage is set up by the time random_init() is
> > called seems incredibly contingent on init details. Why not, instead,
> > make this a necessary part of the structure of vdso setup code, which
> > can actually know about what happens when?
> 
> The whole early init is "carefully" ordered in any case. I would have been
> happy to allocate the data pages before the random initialization, but the
> allocator is not yet usable by then.
> We could also make the ordering more visible by having the vDSO datastore call
> into a dedicated function to allow the random core to touch the data pages:
> random_vdso_enable_datapages().
> 
> > For example, one clean way of
> > doing that would be to make vdso_k_rng_data always valid by having it
> > initially point to __initdata memory, and then when it's time to
> > initialize the real datapage, memcpy() the __initdata memory to the new
> > specially allocated memory. Then we don't need the complex state
> > tracking that this commit and the prior one introduce.
> 
> Wouldn't that require synchronization between the update path and the memcpy()
> path? Also if the pointer is going to change at some point we'll probably need
> to use READ_ONCE()/WRITE_ONCE(). In general I would be happy about a cleaner
> solution for this but didn't find a great one.

This is still before userspace has started, and interrupts are disabled,
so I don't think so? Also, you only care about being after
mm_core_init(), right? So move your thing before sched_init() and then
you'll really have nothing to worry about.

But I think globally I agree with Andy/Arnd -- this is kind of ugly and
not worth it. Disable vDSO for these old CPUs with cache aliasing
issues.

Jason

