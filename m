Return-Path: <linuxppc-dev+bounces-6937-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCF6A5E13B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Mar 2025 16:57:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCZyP26TRz3bnJ;
	Thu, 13 Mar 2025 02:57:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741795037;
	cv=none; b=lDSY6TshWT5rEsFCTRVJlEaXNzI9IUHl4fsBJ9vFhKZSeRPm09+HAh++NMu88aAw4ghaW4IjhswPleaeqGaBn+dXAFK1sHA/aPPJv/bCECOswTkZcK9H8YZla0hRrVmnJw55ZnaiT0PQs5GDnj7/FWciGu7fZFNXKN7vwaU6iVzywtYg14rxQGFYVLOEXgRgtaJkVR7+8P9/G39SWV28sXgXjPENk/0eIzvFOD8oRLi1WfAdd+RSrWS8LMFIxK6m6MVAZfxv+s+lQm1MvGa0IldTXRCD6oaavK4uYxvdfWf/PEjR/2o+dD15Ak/sRlL2slEW4ta9TLIlWaDXhvfPrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741795037; c=relaxed/relaxed;
	bh=JChFXqPXVY1XHtpbP2WqOfMeQnLS1qQftUfTh17+lXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hmb6gLvq3acyGCp1LlvH94aRy+bv7TOml9LsLozDaYdXikVUBZ2Lr7E+P6sA5XaI3ngJnAc4Fwrbym4RGtzA8yl+K9vQ6ha7B16O/V4T9e0zCD0+SIbMGvLfg/D8zr8E2lP9j0ZxBmQyXKqnsS7YyTJTiecr5lA0lDHLUiuncrzgZ8OjGEFokt6Mljy+zLYlJrGbnH7yGOQwWWxxBS35uSEso+vRCMac/k9zD1EBv4xQZyjLivGw+JBNTLDKRVywynKDZvJK/VHfR8l2cWwee9hAgJ25WI/MXbCziopa5n+CJT40Vot3sOvF3k/PcJZLYY4ow7Zen/hisBh8zCkw3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VMGDPNzr; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VMGDPNzr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZCZyN23jfz30gC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 02:57:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 419F65C5C6E
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 15:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E68EC113D0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 15:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741795033;
	bh=dgU35NJAC9FuhPfl4fCxI5+qb1wmL7e+GyilvA+NxwE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VMGDPNzrQPf5TkD0b7NrkaL9vBedP++HcJIYppS3OacGh+lmMlyllNbJ65T8EUwpe
	 X6mgQAvFxmpr+7NeL+U8J5eO9mUFyF9iC/Bpw3Fnv2dGtL6Hrt/Yx6uH52UPkON/Bd
	 bMd4vd1sat3O7CafhieqmZ6kqMEcz/ppjRlQKe5fcS7fyHE/3Y4vyt7IpKYAo5CVFc
	 NGaHqUjovj3IqQIA6D2VmMJyyRyouA92R+HwQ7lUhQMLRtbPXzmj+6/9l+YNIMzd2o
	 aGu6LYyHU+u7IYNYk6FT81OA0rsZ70e5lk7oXpt1fRBo8+yNkDj8UUhHY3Of+SO/GN
	 Rivwxuyc+GVag==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-549644ae382so8183198e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Mar 2025 08:57:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZGot91o97j4GybYJOkON6Dd+iGLeuNBioM1loAzsYEnBjaOe76zjw28qlS32LXoCm2kd5Xewsu34IxJc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyo8cYCPB8nqMu0LLFTCipUak6U71Qk363RYk43VNQ9pbExt1sp
	0ndKB9v7N8n5Uy1x70VCv7XoPOscTlHsEGKloibqU3Uju3iuTspxbj5XQTRhrbUKNnCLFMsrokF
	wQfNUv5mXl1IO/quczsaF6EwjKEY=
X-Google-Smtp-Source: AGHT+IHd+FrUHToN8zCIkYvgOINETMZJki/NvRa0TX9T0SvIe4EkJVM+k58lts/E3WmtqFbt0GpXCZ7ftrMtmqZt6y8=
X-Received: by 2002:a05:6512:3e1a:b0:549:8e54:da9c with SMTP id
 2adb3069b0e04-54990e2becamr8141673e87.4.1741795031214; Wed, 12 Mar 2025
 08:57:11 -0700 (PDT)
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
References: <20250306185124.3147510-1-rppt@kernel.org> <20250306185124.3147510-8-rppt@kernel.org>
 <20250307152815.9880Gbd-hca@linux.ibm.com> <Z8_Qawg0dGtZdys7@kernel.org>
In-Reply-To: <Z8_Qawg0dGtZdys7@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 12 Mar 2025 16:56:59 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHS1YbnYVqVgsyfFSpg9kJM599Yp9TO8AP6--Nbgk7dHQ@mail.gmail.com>
X-Gm-Features: AQ5f1Jrq0NRixaZgOe6Zrlj_W8SN3MQrS2p8OQe5yMSfjVPvuZ4c51CBlAcj7NU
Message-ID: <CAMj1kXHS1YbnYVqVgsyfFSpg9kJM599Yp9TO8AP6--Nbgk7dHQ@mail.gmail.com>
Subject: Re: [PATCH 07/13] s390: make setup_zero_pages() use memblock
To: Mike Rapoport <rppt@kernel.org>
Cc: Heiko Carstens <hca@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, 
	Brian Cain <bcain@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Guo Ren <guoren@kernel.org>, 
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, 
	Stafford Horne <shorne@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 11 Mar 2025 at 06:56, Mike Rapoport <rppt@kernel.org> wrote:
>
> On Fri, Mar 07, 2025 at 04:28:15PM +0100, Heiko Carstens wrote:
> > On Thu, Mar 06, 2025 at 08:51:17PM +0200, Mike Rapoport wrote:
> > > From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> > >
> > > Allocating the zero pages from memblock is simpler because the memory is
> > > already reserved.
> > >
> > > This will also help with pulling out memblock_free_all() to the generic
> > > code and reducing code duplication in arch::mem_init().
> > >
> > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > ---
> > >  arch/s390/mm/init.c | 14 +++-----------
> > >  1 file changed, 3 insertions(+), 11 deletions(-)
> >
> > Acked-by: Heiko Carstens <hca@linux.ibm.com>
> >
> > > -   empty_zero_page = __get_free_pages(GFP_KERNEL | __GFP_ZERO, order);
> > > +   empty_zero_page = (unsigned long)memblock_alloc(PAGE_SIZE << order, order);
> > >     if (!empty_zero_page)
> > >             panic("Out of memory in setup_zero_pages");
> >
> > This could have been converted to memblock_alloc_or_panic(), but I
> > guess this can also be done at a later point in time.
>
> Duh, I should have remembered about memblock_alloc_or_panic() :)
>
> @Andrew, can you please pick this as a fixup?
>
> From 344fec8519e5152c25809c9277b54a68f9cde0e9 Mon Sep 17 00:00:00 2001
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> Date: Tue, 11 Mar 2025 07:51:27 +0200
> Subject: [PATCH] s390: use memblock_alloc_or_panic() in setup_zero_page()
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  arch/s390/mm/init.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/arch/s390/mm/init.c b/arch/s390/mm/init.c
> index ab8ece3c41f1..c6a97329d7e7 100644
> --- a/arch/s390/mm/init.c
> +++ b/arch/s390/mm/init.c
> @@ -81,9 +81,7 @@ static void __init setup_zero_pages(void)
>         while (order > 2 && (total_pages >> 10) < (1UL << order))
>                 order--;
>
> -       empty_zero_page = (unsigned long)memblock_alloc(PAGE_SIZE << order, order);
> -       if (!empty_zero_page)
> -               panic("Out of memory in setup_zero_pages");
> +       empty_zero_page = (unsigned long)memblock_alloc_or_panic(PAGE_SIZE << order, order);
>

memblock_alloc_or_panic() takes the alignment is in bytes, no? So
shouldn't the second argument be BIT(order)?

