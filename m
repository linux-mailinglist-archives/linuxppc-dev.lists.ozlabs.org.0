Return-Path: <linuxppc-dev+bounces-13746-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA25AC31E66
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 16:43:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1CRQ2JJzz3bfM;
	Wed,  5 Nov 2025 02:43:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762271026;
	cv=none; b=hwAQtM9QcfG7Sup65ixx+Ts4m9JUhQ4ptbenvdiY7A8acA8iTmWrg+my7j9sPkag0gJhQZqOzB6xDXza7ah1RqHhZCtNHUBhOrpK7hLGw8csEjkzXZptmT3S/ZRnpfrUe7Y0NO88edYw/hjaCmI5aWQ5DVBivoTSjcBAHgs0kVWMN+DvkG4dT4/h6OBZY95BKKowjJJu2rVU2hQyzZuZlrR4I6KjVuQBq/EmQ/rZZ8ooXjX9s4FBqE8RLxoNaFnXf1XKgjp566dgtkcwGg35qWRcaJ5rQ2hGoMogBoCL5nW12SamFjjcblC5mpsWQHKPkmPBw45COLBUAEfY8/yobQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762271026; c=relaxed/relaxed;
	bh=6/0fonC1CcSFJ/vzCGw398TxXXxzhqjx7ZhCqclZhJI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLu+9+rcgk4YYbmuNBXh+R7Vv6g393mDoe3bBLMByNxIXe6d8/marg4OW5p8s4ujSob0JrlFh2Vm+Bcw0mWjKdqSeC2Xqb6RAFUOqDYVoqfhwvTR0y7k0jv6cHaeLDcJqjWKz/DMRLTV+2e0GkT2VSjcThzf+T25/d3tF8ZuwVud2IOSNKj93SYA3WZq7iG6TFWGQXPrnKGRvN+JJI1MDlpMEKGWO2ekizfSGbPW1QmwcEzeEZ38ZsqoZZ4aDyT1fqemx6vi+xs0ZuLBhPMtjDJ5dQKgppV9+7ZUeo2wPNwjL0SbGWGsQ+3Wu+oUpNObqzt/AayloLicPH6HFWAjZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rjbrvle2; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FojQgXp5; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rjbrvle2;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=FojQgXp5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d1CRP0QfQz3bf3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 02:43:44 +1100 (AEDT)
Date: Tue, 4 Nov 2025 16:43:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762271019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6/0fonC1CcSFJ/vzCGw398TxXXxzhqjx7ZhCqclZhJI=;
	b=rjbrvle2cRAQ2r1/E6AUyn/63AoNirT+MeY3CSkMLQkjVu4MZ9i9gsM5VaY1sb3+Qse+3E
	k5Tsj3k0sX10MaW1Vt77Ml/iwrO90sXCi7ohIUnxBp8RCfq2diJY/ZCpc3gLIELLZkZ1gT
	L/BTyFm2ieNoLfdbPm3joETfalKC7jCYGiBCKDuN65AUEULDiusUD1wLGQDHRp47rNGPSE
	CNiRZhbWp4pKi5KAc4rKlwVrMeyIJALch4gPPlEKog+++hdtB+pAyXWGyDy2/FQb1lBsmj
	YmFrBOIEWYHsmogSRF3LDckjk1IVIHNKXQ3GxfoNtiFlAXBk/A7zx0VxilqApg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762271019;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6/0fonC1CcSFJ/vzCGw398TxXXxzhqjx7ZhCqclZhJI=;
	b=FojQgXp5lZ7JuVC/TErfcQFIVgMu5YQg1OclEVtlB2s1//ebKD9BRtli3pju35zYRju4WW
	6T9NeyF0VG7+qZCA==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Mark Brown <broonie@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andy Lutomirski <luto@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Shuah Khan <shuah@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Russell King <linux@armlinux.org.uk>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, 
	Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, Aishwarya.TCV@arm.com
Subject: Re: [PATCH v4 23/35] vdso/datastore: Map pages through struct page
Message-ID: <20251104162009-8cffa62d-e95b-466b-9a27-c51b0f5257cd@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-23-e0607bf49dea@linutronix.de>
 <aQjJNmwniQwwjeBR@finisterre.sirena.org.uk>
 <CGME20251104084442eucas1p2af1bd88393f4d6a532df1cd41f32a287@eucas1p2.samsung.com>
 <e7f05748-a11c-47eb-b1fa-cdc9dc6d05e0@samsung.com>
 <aQn8G9r2OWv_yEQp@finisterre.sirena.org.uk>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQn8G9r2OWv_yEQp@finisterre.sirena.org.uk>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Nov 04, 2025 at 01:14:03PM +0000, Mark Brown wrote:
> On Tue, Nov 04, 2025 at 09:44:38AM +0100, Marek Szyprowski wrote:
> > On 03.11.2025 16:24, Mark Brown wrote:
> 
> > > We do have some other serious breakage affecting arm64 in -next which
> > > are making it hard to get a clear picture of which platforms are
> > > affected, at least the FVP and O6 are unaffected by those other issues
> > > (due to using MTE on platforms that don't have it, those platforms do
> > > have MTE).
> 
> > I got almost the same result while bisecting on ARM 32bit Exynos-based 
> > boards, so the issue with this patchset is not fully ARM64 specific. For 
> > some reasons it also doesn't affect all systems though. It is even 
> > worse, because it affected only a subset of boards, but different for 
> > each tested commit. The observed failure looks exactly the same:
> 
> I've now got the results for this specific commit, it looks like every
> single arm64 system is failing.  I didn't test any other architectures.

Which one do you mean exactly with "this specific commit"?

6a011a228293 ("vdso/datastore: Map pages through struct page")
10d91dac2ea5 ("vdso/datastore: Allocate data pages dynamically")

> > Then I've tested it on ARM64bit (RaspberrryPi3b+ board) and got the 
> > following panic on 6a011a228293 ("vdso/datastore: Map pages through 
> > struct page") commit:
> 
> I'm seeing the same thing on at least some of the systems - this is with
> arm64 defconfig (I suspect that's what Marek is doing too).  For
> example:

I can now reproduce this issue, too. Even on QEMU. But it goes away,
as soon as the second commit is applied. The two commits should be merged.
That could also explain the weird bisection results, landing on either one
of the commits. However I can't reproduce the "silent freeze" issue on commit
10d91dac2ea5 ("vdso/datastore: Allocate data pages dynamically") on my
Raspberry Pi 3b+.

Any chance I could get remote access to one of your test machines?
I don't have access to the exact machines and that should reduce the chance
of chasing down dead ends.


Thomas

