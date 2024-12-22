Return-Path: <linuxppc-dev+bounces-4407-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D619FA537
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Dec 2024 11:23:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGHKz6q5Tz2yRM;
	Sun, 22 Dec 2024 21:23:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::112c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734862999;
	cv=none; b=Y/T6Z82J6WczkOtVM97yHlsbULhVK6sixGSMOFc2n7rqYe5QfaYH0HkRSjGNOHwXQ4XpGGAtsP6QIb29/OuQhnN9MkdBONHfl+DCGeeNcdG+iWtLgo7bbl2MSmD8vZDEJ77kOyKIBKEEISFHOhcAIhuGquuxbJN4FvhC9uun7251/KjbbdeH7D04ztlEFQzJYpWgOZci2WA3wpXHFFPgR1i8pZRVFYT+685P06fxOuoszKUUIhPK6dcdFGYwlSvRq3R/Hc6ysPo5pH8wB5ke1RlsynLd9543gWBKNHoYslpczQNVhvE+25JfOJFVvrUSTtpSSNEi8NZXI6j949kI3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734862999; c=relaxed/relaxed;
	bh=/ONVNbxYIwyadSLDvwLNaPGVW+13KFD/yyNlBVYXNzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=geh8xBPyT6sn/vqgK4Ee4jxfTmVHWfeBtLkWJjMVfkoPgFC4ZqPJYT4SeLD+9LN4pYaxY933WCts5vCVngSnqZhWA7BJG+FPOKGJl+5u+W1otuI3W80VSs1N6T9647Dcwa2qljzNte6xeqpqWZ0U0vSS79KkefeCYMtu5aEpIHYgpssr5Ly/dPdybVciUpjTvILR/vp1GAjFZQw+D8tg/yc8WbxNbxw/2PvJgiNQM9tTKl9OtlAuY8VaF9dKyhPufj5+02BB8MiDcQx0yakAcDY6QQVfptaIUDuELqrEkrq6jQdJj2YfDvCBciGxWPEx0lzZ20DgzwfYHRkUm8dQYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cOXaXCTl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=guoweikang.kernel@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=cOXaXCTl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com; envelope-from=guoweikang.kernel@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGHKy32X6z2yDT
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 21:23:16 +1100 (AEDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-6f26c517979so23703377b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 02:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734862993; x=1735467793; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/ONVNbxYIwyadSLDvwLNaPGVW+13KFD/yyNlBVYXNzc=;
        b=cOXaXCTlaMzd+b+xGPnv3n/tILefOoQoSduBJrAdkQ7mjzp1gv98NWW3CvZZLVJ/w2
         0gElzudWdRcLpG3RC8vkz+TpvVEJJqB75Js77hy2PP7NiNhlDPM1LQ+mKz4AhYgahgqz
         PGofiUUXleKDs6Y/v6QZ+pjyOmg8cUaMgSvhWU2Uxxei6kqGgktqYE7PfimtxeeuWuaV
         7dMUvPGpwG7h5sch9gqloafri7zLvHd+hfgBSWmDJpadYXPkWDc6K/flqraBB4TLzGFf
         nd7qZLwqgd3eS/OqUXyN/li4z7ab3mgs3L7aayF4C0F0M6RpmloDdRUtkfgt2BKWlMY+
         AlEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734862993; x=1735467793;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ONVNbxYIwyadSLDvwLNaPGVW+13KFD/yyNlBVYXNzc=;
        b=N3ZLTvOc1v9xzkp1NX2B5hwVYpwBwLkMceIwAL4czeYDmwfUWpBe9v8ejSKD12bUMy
         5ul2kLQE/hRBBbj6J4VQokL9ESMbKf9WztTjvqOrzr3rp5nXdmkOqcLh8kCmpIEmentQ
         uLs6bKF8zs3qQb9g70qifZAh8FwvcvUXy8n19nsAXxYfl+79zJ2KJvYJdu37tBc4qZCC
         20hzgECkxU3wja2h43RTc6CUCiQvceoZ3XpQjpNnDqnazQ6/7vhRHfsNKhM8M8Jfd81G
         fue4s6krMG5/cwCk29cxSr9fKd36HjYEUgSjo2jMiL9b2dp3p9vDHZD2fYlcXRVMUubi
         dokg==
X-Forwarded-Encrypted: i=1; AJvYcCVMnqM4TqgCzHVhpswGD17AGMnb79Lm49f48pWwZBS5Kx8V6hJzq0cZUXy5+WQH+qLQQ/GBVpnplrPNqrg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy2iDzDx2XFAG1WSSMmng/SdkK4JX68WoK3c6PNMKTx7TLCWO08
	OSzHrcg7otNakEFffaZL8ZiyFMdHcm1+a31A9URMNSDoYjrt4+kFpyhIOBJO1JXStPQ5sxZrVec
	eM3ihzf43J71mvL8F3Ajpm2aiM/0=
X-Gm-Gg: ASbGncvDW8z+F/+2KzwY7SwDjPEMElnD04GHs/KFqKMGqYpj/kkA3by9F7D7dh5I5qd
	JhwNVC7GJ1cVQs4qz6+UQkH8DL1e8NLAUqTetMd8=
X-Google-Smtp-Source: AGHT+IHX0mjmsoNFu7Nk/P1ylkLtsHAmn22nfKbaHPnh1Btm1p2RULi24EAOG9MYK2JmawFo9lS/pEKQIPK2LOk3TLc=
X-Received: by 2002:a05:690c:360c:b0:6f2:9704:405c with SMTP id
 00721157ae682-6f3f8125edfmr74773997b3.15.1734862992817; Sun, 22 Dec 2024
 02:23:12 -0800 (PST)
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
References: <20241222054331.2705948-1-guoweikang.kernel@gmail.com> <Z2fknmnNtiZbCc7x@kernel.org>
In-Reply-To: <Z2fknmnNtiZbCc7x@kernel.org>
From: Weikang Guo <guoweikang.kernel@gmail.com>
Date: Sun, 22 Dec 2024 18:23:02 +0800
Message-ID: <CAOm6qn=L0GzX4z4Mak1LH6R4wD282dz6qafMFmA39ADaBuLJJQ@mail.gmail.com>
Subject: Re: [PATCH v6] mm/memblock: Add memblock_alloc_or_panic interface
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Sam Creasey <sammy@sammy.net>, 
	Huacai Chen <chenhuacai@kernel.org>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Oreoluwa Babatunde <quic_obabatun@quicinc.com>, 
	rafael.j.wysocki@intel.com, Palmer Dabbelt <palmer@rivosinc.com>, 
	Hanjun Guo <guohanjun@huawei.com>, Easwar Hariharan <eahariha@linux.microsoft.com>, 
	Johannes Berg <johannes.berg@intel.com>, Ingo Molnar <mingo@kernel.org>, 
	Dave Hansen <dave.hansen@intel.com>, Christian Brauner <brauner@kernel.org>, 
	KP Singh <kpsingh@kernel.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Geoff Levand <geoff@infradead.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
	Alexander Potapenko <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, kasan-dev@googlegroups.com, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-acpi@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-omap@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Mike Rapoport <rppt@kernel.org> wrote on Sunday, 22 December 2024 18:06
>
> On Sun, Dec 22, 2024 at 01:43:31PM +0800, Guo Weikang wrote:
> > Before SLUB initialization, various subsystems used memblock_alloc to
> > allocate memory. In most cases, when memory allocation fails, an immediate
> > panic is required. To simplify this behavior and reduce repetitive checks,
> > introduce `memblock_alloc_or_panic`. This function ensures that memory
> > allocation failures result in a panic automatically, improving code
> > readability and consistency across subsystems that require this behavior.
> >
> > Signed-off-by: Guo Weikang <guoweikang.kernel@gmail.com>
> > ---
>
> ...
>
> > diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> > index 673d5cae7c81..73af7ca3fa1c 100644
> > --- a/include/linux/memblock.h
> > +++ b/include/linux/memblock.h
> > @@ -417,6 +417,12 @@ static __always_inline void *memblock_alloc(phys_addr_t size, phys_addr_t align)
> >                                     MEMBLOCK_ALLOC_ACCESSIBLE, NUMA_NO_NODE);
> >  }
> >
> > +void *__memblock_alloc_or_panic(phys_addr_t size, phys_addr_t align,
> > +                                    const char *func);
>
> Please align this line with the first parameter to the function.
> Other than that
>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
>

Got it!  Thanks for the feedback!

> > +
> > +#define memblock_alloc_or_panic(size, align)    \
> > +      __memblock_alloc_or_panic(size, align, __func__)
> > +
> >  static inline void *memblock_alloc_raw(phys_addr_t size,
> >                                              phys_addr_t align)
> >  {
>
>
> --
> Sincerely yours,
> Mike.

Best regards.
Guo

