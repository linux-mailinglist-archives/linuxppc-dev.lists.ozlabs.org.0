Return-Path: <linuxppc-dev+bounces-13812-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1070C369A2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 17:14:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1r3t6K4Zz3btC;
	Thu,  6 Nov 2025 03:14:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762359242;
	cv=none; b=GbqQ6KDDC61eqhAmwO25J7hP6HiYNiboaOCRoFtopgzzzwjXP6IqV2NDDX6af2DR/fqJ5XKBMYRRu6+rplNrd+qlGVFxJWkzTgjyE6j/IAqt9BXzmA1WmB3bNFh85FBtUUwFfIe0OZhJKLHv6hNCaWEq3ewyIiYTxHKjkEbjpJ1Ckxm5bf+PcsNf/NhD2kqyt7zOKXCal4ny5Z7a0pW7alIggye0oIkrWCJXE9aCe0AnO6M9WoSmw9E1di5/P7bjjIXrBrgbmllefd9AIZeRUJm1HGX0rzEqQR+a3WNbMm1Ng64SgArRmOTtqJcD4kskV5uWLXwE1f8ksMDt3MML2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762359242; c=relaxed/relaxed;
	bh=g1kjwvsagYmMzNuZ/CDg1YQEqNnD94LL7vwY0lbT+zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROj94ikH8HqwouM52foYvCnF6+bhut8BzAVdYKImQJNEckjizAV4Zlr6pxG7CwIfliojAGv1p7kaqieemg/SXnuJiWwe0r4yvbLonN8F1m2/G+w+pO73jgk9Rb3lh7G3XvVCcRXMasoNvh3m8eZwCDx3CbLPevCv71PbFsYnPb7PGkIduQ+cFO8rgqUYH4jgMmt7lgxpJYwheHY+T5oYUjYHjGfh8GStf+F9BKP3tIWE683bzGI+brtAqVP6huTv1qxJmK+8x4Md4RB+2YLjVrvwGIrBIMICRO+cZ5XULFpp+EfQdCV8MZ2f3LI9haQaXVZHnspEt/reBU3/l6yesw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DXD+P7YT; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=uBx1FG07; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=DXD+P7YT;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=uBx1FG07;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4d1r3r4rQdz3bt1
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 03:14:00 +1100 (AEDT)
Date: Wed, 5 Nov 2025 17:13:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762359231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1kjwvsagYmMzNuZ/CDg1YQEqNnD94LL7vwY0lbT+zs=;
	b=DXD+P7YTv6IEX026kjt1F8YVXgIehfvUAI2O1StYFCuCM36Ax/oj2ROl9Escj22TUSaV4K
	XfImvsPVa/mQ0I7DEHuibSVfWzOlMz3M+KgDJSXVorRx5bGPSFHoqM9FycVPirDojnhUtq
	CbfssrMGHETE2LY0v3CA6uyP4tl9UFs8OzAbl8KW55+3K2/fgA63xL1Sl97z/Vk28JOo6U
	6Mgp/npslthxLyh+pFwUz6WNsceCFuwjKZjnO/eE/Z4H1ieVecgE0St4CC4+WoGo8HhH3T
	8wcbegPnMEc80NKfWlyWW2w+PimxAYcJeifVJHoT6Gus/rczh64e5m+aNhrDRg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762359231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g1kjwvsagYmMzNuZ/CDg1YQEqNnD94LL7vwY0lbT+zs=;
	b=uBx1FG075ggbcRA5/Y07q3BLRHNQ+GDoQ7eqUFqWhPI3pyBOqf8No/MhlVY8xo1RqAIQA2
	9qHdPiWxMev3tkDw==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Heiko Carstens <hca@linux.ibm.com>
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
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>, 
	Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 24/35] vdso/datastore: Allocate data pages dynamically
Message-ID: <20251105170813-070d53d9-aa2a-4cb6-bcda-3bce8c5be9c1@linutronix.de>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-24-e0607bf49dea@linutronix.de>
 <20251105153426.16228C13-hca@linux.ibm.com>
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
In-Reply-To: <20251105153426.16228C13-hca@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	T_PHOTO_EDITING_DIRECT autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Nov 05, 2025 at 04:34:26PM +0100, Heiko Carstens wrote:
> On Tue, Oct 14, 2025 at 08:49:10AM +0200, Thomas Weiﬂschuh wrote:
> > Allocating the datapages as part of the kernel image does not work on
> > SPARC. It is also problematic with regards to dcache aliasing as there is
> > no guarantee that the virtual addresses used by the kernel are compatible
> > with those used by userspace.
> > 
> > Allocate the data pages through the page allocator instead.
> > Unused pages in the vDSO VMA are still allocated to keep the virtual
> > addresses aligned.
> > 
> > These pages are used by both the timekeeping, random pool and architecture
> > initialization code. Introduce a new early initialization step, to make
> > sure they are available when needed.
> > 
> > Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> > Tested-by: Andreas Larsson <andreas@gaisler.com>
> > Reviewed-by: Andreas Larsson <andreas@gaisler.com>
> > ---
> >  include/linux/vdso_datastore.h |  6 ++++++
> >  init/main.c                    |  2 ++
> >  lib/vdso/datastore.c           | 44 ++++++++++++++++++++++--------------------
> >  3 files changed, 31 insertions(+), 21 deletions(-)
> 
> ...
> 
> > +void __init vdso_setup_data_pages(void)
> > +{
> > +	unsigned int order = get_order(VDSO_NR_PAGES * PAGE_SIZE);
> > +	struct folio *folio = folio_alloc(GFP_KERNEL, order);
> 
> I'm seeing random hangs on s390 too with our CI, but unfortunately I cannot
> reproduce it manually. But looking at one of the dumps it looks to me like the
> vdso time page contains (more or less) random junk at the end. Or in other
> words, shouldn't this be:
> 
> 	struct folio *folio = folio_alloc(GFP_KERNEL | __GFP_ZERO, order);
> 
> ? At least that is a difference to before as far as I can tell.

Thanks! This perfectly explains all the weird issues. It also does fix
the issue on the affected hardware which Mark kindly let me use.
I'll test it some more and send a fixed series tomorrow.


Thanks again!
Thomas

