Return-Path: <linuxppc-dev+bounces-13991-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2309C456A0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Nov 2025 09:46:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4jtb024Yz2xql;
	Mon, 10 Nov 2025 19:45:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762764358;
	cv=none; b=iH1mNoGxQPpuIvftzcQiK9kFpzQbQvzDN9l1xxRZ9PWeBoxUVWWUv376LnMusIR4HCm7zsmslCOWmUJab7IK7DOO9LSG5fOxZycvWTHMAyM+3ckFjvSNj8aUrHeOV+EHf4DOTNqLKZnMK0onGeYqzX2x+w4/JaLjmdz5TrgKtB34MVcKpnqY7nIPPn4wWN1IBNtHdDZvsJPrMdlAV0EidG/0l04XoHlbORYbi7R6zBsGAOMcODiAOyBFbt6oUI9j83SfIcxFtysIECkzSDO05+3D4bGU5c6ZK70Vq6sjp0gyFEBfe/8q3f3A828xOpY0VA7gIg19Y8osNp+EOiut0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762764358; c=relaxed/relaxed;
	bh=bsLI0Nxueu9BHgoGhAQAGzoBni2o++loH1n4XsHhDVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7PiAQIB1cIhkSfDjjD795xJmdDdbFauaulDa/afJz10RY2efUw3avmwCRNJC8VfvreBmVJKAqMuCLLxfrxTPz1wno7Mm6HOBk3kKgymVRut2McdmYJYU/8oVy7a2u6KDZBHfykm/TOSMf7JqqDoPUqELB9M93IO0boJeByJG7Ekgr8RRN6e8BOkY6S0kXmVG84PsfE3jeEDawYcwKW729Jh9BV98aO7zwor5WSL8WII9tQqy1R9qUtRJRjfl+LNZi3O7TkIfRBlLaQ5T+a8ZOUvyz1IXdfjWIFevR+ayYj2gWy9+RvAcrK4l8S4TToerJZyoU6Mj/bLK6UINn6HVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zc0jjKjA; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=dKrT84Jk; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=zc0jjKjA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=dKrT84Jk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d4jtY6wpwz2xqh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 19:45:57 +1100 (AEDT)
Date: Mon, 10 Nov 2025 09:45:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762764350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsLI0Nxueu9BHgoGhAQAGzoBni2o++loH1n4XsHhDVo=;
	b=zc0jjKjAsp0YnhtHKw7eM1+liJCO5iSx7CCFd73BS2XJvvlXwflG1NFICzbDNPrMliB1Zz
	z9oijqTWuNr9uWvpbtAZJfvjFOWQZE3AFkPNDdET/ElQz/Xv3oLQmA/M6PJ/hhmHAX6Cpy
	Iay9FeMMRFmSX+WRkJbz/WiJ+lqtk6zlCxe5YYD/aR+0JWiaTbiZdKvflk/K+zTAKAHRyh
	iNT7oqeaQjzbbX4GfH8HcmR7cfsveFd4GJFxHPGpcHUVJs+ns0T1guWntAt+nL8WuHcQAH
	YY2YP6EklQ3einkrNDniOoe3mo7Bw4HTblfZNZoJk+qiWUqrtmRZ9kBC4KKy5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762764350;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bsLI0Nxueu9BHgoGhAQAGzoBni2o++loH1n4XsHhDVo=;
	b=dKrT84JkcQPBJNqu6XZmJfzmvsjkLpa1AvSOPwrcdFwP4VawI33FMJzCLV+t2ZRC2Nv2Nq
	0e6oPX/MtzX04lDw==
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
Subject: Re: [PATCH v5 17/34] random: vDSO: remove ifdeffery
Message-ID: <20251110094145-462671cc-1f51-466a-b448-3dc541e764ca@linutronix.de>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
 <20251106-vdso-sparc64-generic-2-v5-17-97ff2b6542f7@linutronix.de>
 <aQ6Cq_5kiIXllEoS@zx2c4.com>
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
In-Reply-To: <aQ6Cq_5kiIXllEoS@zx2c4.com>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Nov 08, 2025 at 12:37:15AM +0100, Jason A. Donenfeld wrote:
> On Thu, Nov 06, 2025 at 11:02:10AM +0100, Thomas Weißschuh wrote:
> > -#endif
> > +	if (IS_ENABLED(CONFIG_VDSO_GETRANDOM))
> > +		smp_store_release((unsigned long *)&vdso_k_rng_data->generation, next_gen + 1);
> > +
> 
> This is possible because vdso_k_rng_data is now defined in the C source
> on all platforms and under all configurations, even if
> !CONFIG_VDSO_GETRANDOM means it's null? Whereas before, some config's
> headers didn't have this at all, so the #ifdef was necessary?

This is possible because vdso/datapage.h is now included unconditionally.
(Which was made possible by the previous cleanup patches in this series)
vdso_k_rng_data is only defined if CONFIG_VDSO_GETRANDOM=y but declared
unconditionally. If CONFIG_VDSO_GETRANDOM=n all references to the symbol
are optimized away by the compiler before the linker is invoked, so no
unresolved references are created.

> If so, can you mention this in the commit message?

Will do.


Thomas

