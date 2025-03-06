Return-Path: <linuxppc-dev+bounces-6784-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E6FA558A5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Mar 2025 22:20:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z82Pk1K82z3054;
	Fri,  7 Mar 2025 08:20:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741296010;
	cv=none; b=IHwzPU6SkU6tqvd3a3vzEwY43PKqlq48D9FTYA3XrfM39OiWGhu8+m7NwSY1KAji8ocvgoanFRZQJ7b9kS+xccvqg0OwpgZvFXKuNyuq0icCkQjuv2nYcmll4BAaISBUmGGt7qaI9KP9DMSSxpro841E0DLC20zwreh+/GM04edGWnDkfSWQp8QzYPd+fd+V+iXeIQu/40V3wtWCHYj6NdQydyegVCFyaQQFuL6Vf60rurLSGwPuVE66AqbzfGHxfvOiVrwbKhhKWy705Us3B+uuv/2NS89cPM+qVllr8QcrZb/wZPFn7q+mOJxqXboVYHawxaszCyWdTPw6KnjBPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741296010; c=relaxed/relaxed;
	bh=S+WgGZZwuy6dcxKu6tQ5X7wRFZYCKjuZRXphT7j3y4s=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DwqQpvf0gbQbn2Hpyw3nBdxvUGMV5UfJGyLzokggFCZhcppbG81Bjy4w1WKzXV96BrEs/HpH1p5n1law80/WQOUc8zjRYVGi7ifT1L8UZ25NVWUsd54YY2sCGZcqI6DGT5lF0WY6D6MDSuxYNlKRgP0zMvzjGgj/aR6s0ljdrgd7I/4MjdfNxHTwl6BNTIj1vWuj7AH2Pf37SmPNzaQWlxBtu5GWwdTah8XQlkxy2CK8TTvUV8IwJ8ofTDzow90iaA7qYI2lK1AFkhR53uqvK3LDLX+Zwdgd4CSbr1Icm3XIh+blafp89Z6ml1930E8o5k0UQzH6SInrnQbsKTi0JA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=fCD2eitP; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=fCD2eitP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z82Ph6vWMz2yhG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 08:20:08 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E60865C57C8;
	Thu,  6 Mar 2025 21:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9335C4CEE0;
	Thu,  6 Mar 2025 21:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1741296005;
	bh=cZDw6Poc4BDrQ+UyFQkoa8sDIiciZub+M7TYHo89aq4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=fCD2eitPTHFzv+QGanXjZD4bENnmRFCyuGnOvEmFo3oZUyxfGbz0e9/waUKJcay/B
	 ulqAAqZ8fT7ST4z1YZd+B5XSm85iLoKo7BN7tD3KTLECZ4zAMHYgvB+TmrABW752ri
	 sqVT0tKHdBGtciAetPrknw/7LiV2aVP98DL5X7zA=
Date: Thu, 6 Mar 2025 13:20:03 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson
 <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Brian Cain
 <bcain@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>,
 Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge
 Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Johannes Berg
 <johannes@sipsolutions.net>, John Paul Adrian Glaubitz
 <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, Vasily
 Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, Will Deacon
 <will@kernel.org>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH 00/13] arch, mm: reduce code duplication in mem_init()
Message-Id: <20250306132003.0066f109dae75f74711f9432@linux-foundation.org>
In-Reply-To: <20250306185124.3147510-1-rppt@kernel.org>
References: <20250306185124.3147510-1-rppt@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu,  6 Mar 2025 20:51:10 +0200 Mike Rapoport <rppt@kernel.org> wrote:

> Every architecture has implementation of mem_init() function and some
> even more than one. All these release free memory to the buddy
> allocator, most of them set high_memory to the end of directly
> addressable memory and many of them set max_mapnr for FLATMEM case.
> 
> These patches pull the commonalities into the generic code and refactor
> some of the mem_init() implementations so that many of them can be just
> dropped.

Thanks, I added this series to mm.git.

