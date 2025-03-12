Return-Path: <linuxppc-dev+bounces-6938-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B0A7A5E17F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Mar 2025 17:09:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCbDb2hB7z3bxL;
	Thu, 13 Mar 2025 03:09:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741795775;
	cv=none; b=SThn572KsZqrKEU3TRE/q5v/3pvXkPPvPkNj7cZkKm/ZgaS0C9XSsdcDYrQp6IR0QuJENWQi3LSTvB5lQze5PaZE95LC+ksUogPGeEq4qB4m10lXP+G7RdjNxP1KLtWrH9pF2ql2ZL5tK6p7gM3/GB1aHBjTDD3oKS/S6Kz+3WYm0laV3d+ck9MtvMxY2S6hWLvVI91kybJycSm9uTmlwcd8v0lJa7STeLWx2RcVjTw/nYHot5dxhJT+C6QA5/e3gRDPztMGBQ8qZkzrvzZ5xmTfz0cn962wbM20Opwy98/AJuqTfRLa7bTYCpQuXEXMFdA02uFUSPDIjoHt1Bb7eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741795775; c=relaxed/relaxed;
	bh=wsMJykXiAVRnUAnbnGJL1+xUj8omt8ZvzvgCgKuGHWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OTcPxugzhVrG5srM9eQ0hcMeSKjGjD7cXw1BL80+kfzD2axq5IE/6gqeQGF0xEm850IIHhYUJDKJXDvuIpYgh5gO2hF7RsPqXZ2ThvK+6jiFfSaVQ76uAMLc4ESh7t/z5EZMHvDiGRVzIoGk/5Iep0g3+UCdxaoY1HXM0KafD2SQIzOH7GGwmD6PgQrCjAxcv5T1nMzoj5FdU8tS9rBxVo+cDY/y5MfBugfE0w0AqGCHxQ8Rx84p7PjwdRoJpkPSwbEAKlVqDLJE3eVtO3C7oWvaeuBxjgXH1SY2R3tplGbVGs5/eomGduj5UMZEj5kPGmeC6PFw3KfX6NYZQ53i0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o1nXbH0l; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o1nXbH0l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZCbDZ0g13z3bx0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 03:09:33 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AE4BCA41156;
	Wed, 12 Mar 2025 16:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBA43C4CEDD;
	Wed, 12 Mar 2025 16:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741795770;
	bh=U+kn0eqCA1vTkLcceUerHMcbUlG4P1T7ky+SM+cNeZ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o1nXbH0lAp/Eqh29Z9apDenWiT7PjuKxKiO2JQvLOJVWK5GP4OmPvFpXi6asrnzZT
	 nu94zZUymz0UiYH5e2oHwUKtTI1fSzIDWOtzi+i34Gkz1xkL6x5U9bzNGRhUtzuTKS
	 DXX5HBMSnM0KQHz9TeDEZUAKZi2/XgNg8n+fKtj+coTJt3gRJNcK3xsnp4c0Rfm92c
	 yO1JQdFiH5w2Gbb11wg1ZkFYIseNAErd8Fb7JJ7KzSSF/QC6tMXJP/39miA0uSvCwy
	 IrlqFK1R0v32Dh9qsAKLmrl9vNb/vAYRou4oKyLZKKWsSVO2mj5QR0FroBYJHAdDo/
	 ffW5IRilofYyA==
Date: Wed, 12 Mar 2025 18:09:07 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH 07/13] s390: make setup_zero_pages() use memblock
Message-ID: <Z9GxozjZTKOGDPv1@kernel.org>
References: <20250306185124.3147510-1-rppt@kernel.org>
 <20250306185124.3147510-8-rppt@kernel.org>
 <20250307152815.9880Gbd-hca@linux.ibm.com>
 <Z8_Qawg0dGtZdys7@kernel.org>
 <CAMj1kXHS1YbnYVqVgsyfFSpg9kJM599Yp9TO8AP6--Nbgk7dHQ@mail.gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXHS1YbnYVqVgsyfFSpg9kJM599Yp9TO8AP6--Nbgk7dHQ@mail.gmail.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Mar 12, 2025 at 04:56:59PM +0100, Ard Biesheuvel wrote:
> On Tue, 11 Mar 2025 at 06:56, Mike Rapoport <rppt@kernel.org> wrote:
> >
> > On Fri, Mar 07, 2025 at 04:28:15PM +0100, Heiko Carstens wrote:
> > > On Thu, Mar 06, 2025 at 08:51:17PM +0200, Mike Rapoport wrote:
> > > > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > > >
> > > > Allocating the zero pages from memblock is simpler because the memory is
> > > > already reserved.
> > > >
> > > > This will also help with pulling out memblock_free_all() to the generic
> > > > code and reducing code duplication in arch::mem_init().
> > > >
> > > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > > ---
> > > >  arch/s390/mm/init.c | 14 +++-----------
> > > >  1 file changed, 3 insertions(+), 11 deletions(-)
> > >
> > > Acked-by: Heiko Carstens <hca@linux.ibm.com>
> > >
> > > > -   empty_zero_page = __get_free_pages(GFP_KERNEL | __GFP_ZERO, order);
> > > > +   empty_zero_page = (unsigned long)memblock_alloc(PAGE_SIZE << order, order);
> > > >     if (!empty_zero_page)
> > > >             panic("Out of memory in setup_zero_pages");
> > >
> > > This could have been converted to memblock_alloc_or_panic(), but I
> > > guess this can also be done at a later point in time.
> >
> > Duh, I should have remembered about memblock_alloc_or_panic() :)
> >
> > @Andrew, can you please pick this as a fixup?
> >
> > From 344fec8519e5152c25809c9277b54a68f9cde0e9 Mon Sep 17 00:00:00 2001
> > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > Date: Tue, 11 Mar 2025 07:51:27 +0200
> > Subject: [PATCH] s390: use memblock_alloc_or_panic() in setup_zero_page()
> >
> > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > ---
> >  arch/s390/mm/init.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> > index ab8ece3c41f1..c6a97329d7e7 100644
> > --- a/arch/s390/mm/init.c
> > +++ b/arch/s390/mm/init.c
> > @@ -81,9 +81,7 @@ static void __init setup_zero_pages(void)
> >         while (order > 2 && (total_pages >> 10) < (1UL << order))
> >                 order--;
> >
> > -       empty_zero_page = (unsigned long)memblock_alloc(PAGE_SIZE << order, order);
> > -       if (!empty_zero_page)
> > -               panic("Out of memory in setup_zero_pages");
> > +       empty_zero_page = (unsigned long)memblock_alloc_or_panic(PAGE_SIZE << order, order);
> >
> 
> memblock_alloc_or_panic() takes the alignment is in bytes, no? So
> shouldn't the second argument be BIT(order)?

The second argument should be PAGE_SIZE. Thanks for catching that!

-- 
Sincerely yours,
Mike.

