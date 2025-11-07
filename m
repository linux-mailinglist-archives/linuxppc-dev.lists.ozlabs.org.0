Return-Path: <linuxppc-dev+bounces-13952-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0531C4207E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 08 Nov 2025 00:46:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d3G0t58cjz30Qk;
	Sat,  8 Nov 2025 10:46:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762559182;
	cv=none; b=WGcIFJr9/4rcE2bHuaxK5fKOoOxawiMEfW/uUzK+Iyhmyy0LOPLPkbFeozU3sZd9V0DCQZpti2KZZn8Gj/RB8N6ym490Sy+eE9IGv0zYHz3EFPUwo/JCpFAOQnv9LyWrtTX3Klpm1oMaDW/3NV5+Gvxy8B2uDzb1G0BHyIH7XluavcZ6N7bRqm1Qixy97ByvRnj34V/B2Dx1hmsHm+edTZDmsyHKas5J2UkcBPzntYMSlAFK6cKEYmyBtGYm9oX4o7CQ5tzJ1gfovOSDE2Rkktdot0wZsFntjEhqzmlnkoQTqrlceCRIQqnw5nagw/EEPPZRWWMTsMwHRwvR7DZN5g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762559182; c=relaxed/relaxed;
	bh=rOGbjEMvho9DWS0i3tlr01jp4bYqQwHxD0wdftLlPDk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWDIS4jmy2zexSgosGza4LwvbFV6wSDHmSkSKHVt0rip7eP7Us2ibWGq5XieuP4Cgl/DB24uBGu5uCK6pFJYrWE3HsVtCI+cu3zPSdRQe0E2tEM1+SxVNmVPZRUbjM+ZJDr2ppgTMJFzShBPy7xT/l7gT6TA2OmAkOIdoHHGvAs3QnAQgBIzTAFgMh5C4SUuEjGpTjEZzGlOpU6qnZbBPnu75ZnHx26e7MRrqq559JS7QVLNiQryOM86f1TYx/CDXORfRgnvreV/DrU06cYqr0uGr37LkCoDLpPt2ey1MAd3eWw4/Iwm2SB6EnZKTgUadCNXbfEmbfrClf8crraA6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=YTujExV9; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=srs0=+xqp=5p=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=YTujExV9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=srs0=+xqp=5p=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d3G0s65vyz2ynf
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 10:46:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DCD5F40909;
	Fri,  7 Nov 2025 23:46:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29549C116C6;
	Fri,  7 Nov 2025 23:46:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="YTujExV9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1762559174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rOGbjEMvho9DWS0i3tlr01jp4bYqQwHxD0wdftLlPDk=;
	b=YTujExV99iq+x3/5TiVgxM3SNv/SNCs01cmQ8GL0Jpi/3NRgFfDths0Wd+AhJn/Zi+xdjz
	KJuL84DTYadQtc42UEd5WjaYhLFn9gbieg9iZN1PsrsuVKUou2TnnU4tSyt61zSLX6REJ4
	VbFmzErGcGRRuGr4NEC9WQjYO1r7QcQ=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a1e888cd (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Fri, 7 Nov 2025 23:46:13 +0000 (UTC)
Date: Sat, 8 Nov 2025 00:46:05 +0100
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
Message-ID: <aQ6EvdukQytvqK-u@zx2c4.com>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
 <20251106-vdso-sparc64-generic-2-v5-19-97ff2b6542f7@linutronix.de>
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
In-Reply-To: <20251106-vdso-sparc64-generic-2-v5-19-97ff2b6542f7@linutronix.de>
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Thomas,

I'm not a huge fan of this change:

On Thu, Nov 06, 2025 at 11:02:12AM +0100, Thomas Weißschuh wrote:
> +static DEFINE_STATIC_KEY_FALSE(random_vdso_is_ready);
>  
>  /* Control how we warn userspace. */
>  static struct ratelimit_state urandom_warning =
> @@ -252,6 +253,9 @@ static void random_vdso_update_generation(unsigned long next_gen)
>  	if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
>  		return;
>  
> +	if (!static_branch_likely(&random_vdso_is_ready))
> +		return;
> +
>  	/* base_crng.generation's invalid value is ULONG_MAX, while
>  	 * vdso_k_rng_data->generation's invalid value is 0, so add one to the
>  	 * former to arrive at the latter. Use smp_store_release so that this
> @@ -274,6 +278,9 @@ static void random_vdso_set_ready(void)
>  	if (!IS_ENABLED(CONFIG_VDSO_GETRANDOM))
>  		return;
>  
> +	if (!static_branch_likely(&random_vdso_is_ready))
> +		return;
> +
>  	WRITE_ONCE(vdso_k_rng_data->is_ready, true);
>  }
>  
> @@ -925,6 +932,9 @@ void __init random_init(void)
>  	_mix_pool_bytes(&entropy, sizeof(entropy));
>  	add_latent_entropy();
>  
> +	if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
> +		static_branch_enable(&random_vdso_is_ready);
> +
>  	/*
>  	 * If we were initialized by the cpu or bootloader before jump labels
>  	 * or workqueues are initialized, then we should enable the static
> @@ -934,8 +944,10 @@ void __init random_init(void)
>  		crng_set_ready(NULL);
>  
>  	/* Reseed if already seeded by earlier phases. */
> -	if (crng_ready())
> +	if (crng_ready()) {
>  		crng_reseed(NULL);
> +		random_vdso_set_ready();
> +	}

The fact that the vdso datapage is set up by the time random_init() is
called seems incredibly contingent on init details. Why not, instead,
make this a necessary part of the structure of vdso setup code, which
can actually know about what happens when? For example, one clean way of
doing that would be to make vdso_k_rng_data always valid by having it
initially point to __initdata memory, and then when it's time to
initialize the real datapage, memcpy() the __initdata memory to the new
specially allocated memory. Then we don't need the complex state
tracking that this commit and the prior one introduce.

Jason

