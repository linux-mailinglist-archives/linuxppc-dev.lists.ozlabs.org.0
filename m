Return-Path: <linuxppc-dev+bounces-4376-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B001D9F9FF9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2024 11:00:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFfsZ04rGz2yRd;
	Sat, 21 Dec 2024 21:00:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::b2c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734775201;
	cv=none; b=f/fVMC+Z1FHxFOiKHBV+kGthiHwcTJtddSZhmYbyyHYWbQn9JNsJ22X/ekILBSLC0EJAXkW2+rql8GuSrHrjRORJ/kbCMPIcMDZY35INVqciYjibca58si+XXw8DRwjftNs8heSKtfPoBYGSRmVSB3cPoZVhLVWaUpFEKVJC8T/JrsRs9y5JclZgbirVOuZUMwbwxqpEx4FqlEgZbd9lZX7Fb2Wj5eCkxoFyuQkPtyA97Hya9UXAunLn/pQsk47ADh5uDyeTwxsJnw2j9huO1qQPiISXIRBIGCsL8/b+IF7udBflLe1uUm06jQ3PyDvflPaAHDgr7ATYmKbLgI69pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734775201; c=relaxed/relaxed;
	bh=egHprya5wIN6bGofZtv4dfpbBXKQe0iUzhyvNvr/kt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PuoEVfhS7KjR5psxOaHdB3/b2c9aCLJSVvZd5rwwZy8HBZHkIW56nTtIDOBqiSnBBLll6Jom9fW25F97lmr70YQ9PTJIlS4q2nuQubrc95ZdYz8FcJOXiFZU6jqPBLQADfFrtzEPqsRS0SHDOPSpzr2PrdGXUhZFE8RHmfnWymUf+M5bGkQ5B/6pnQcuTstjGUTUGfWezWwhP4TQv9P87EX7IJebF7VNFcK2VYOJdxzQAmcGyCy9cNqcY+RdcYBAa9cw+GTFF930u1YdEYMMfEzJTRRgElmwSKL1U6Op5S9s9SB0X7VM3ilhQ8bhm3Q9RVpX2z1jXxsbyEmH1j0Idw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QyOtcDTp; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=guoweikang.kernel@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QyOtcDTp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2c; helo=mail-yb1-xb2c.google.com; envelope-from=guoweikang.kernel@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFfsX0nP8z2yGT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2024 20:59:58 +1100 (AEDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-e46ebe19368so2038808276.0
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2024 01:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734775194; x=1735379994; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=egHprya5wIN6bGofZtv4dfpbBXKQe0iUzhyvNvr/kt4=;
        b=QyOtcDTpbP0qIUID4J420c56VbLWLdFd/Yokf39GVU9DT/fSA7N95hU/Y55+5gLQvd
         MudJZUg5Aw41pp3vY6yxGHdvI9fzGpHDaG0lt903YejeW+5mZGUdRoM7rAEU6niPmUaE
         1J/AeACNGQ/UioL6TKldbvZXJZJYWqkG4vPd4onLNpd4p9ILusWdjWAiXi1vMCMDlv8v
         fmCq/xtW2k2NwywXDAaZNpnWzQj4VctC+SeSKgqO5fc5Wz2WiKdtTXkygobXt37+l+Ol
         2gMr4opkV50V7YD1ewzfuTZ1B/CeZKVZwnBlc6s1Z2b1iIwTjkjB3slX0kyOKxvNLRL6
         cn6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734775194; x=1735379994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=egHprya5wIN6bGofZtv4dfpbBXKQe0iUzhyvNvr/kt4=;
        b=Cqe8O6+yJ2RPy8LTLYOyUQ9MfbZkikkwFOtYXz1RwCjVL7FXSjA6Sizyy/zEn5ucAG
         VxqYE3wBAYE/nMrb1cHO3h8pCX6pVagFQY8akXtagwsPVUTT6naAdsSp9QdoFoZuGZkS
         tTf3qob+DTxir1KJzFeeh+AKPtYYP79eyWSB3Q3C/PUUemjr4qq1W9FfwUF6aFiQt5W9
         5GfvH6rhymowb2PzMjCkeDKCMutdMxfcJbrsL3bvQsMjbmIThgyuoRXiMCl4N1YrPvBt
         slMtF6MOrMC7mS0i4eHnM6j1wZjtbN1ErNSoQvVEvGQlsIW5wmDAa1sGbd2Fk6B+uVQx
         ytKg==
X-Forwarded-Encrypted: i=1; AJvYcCX4iufyg3JcaamrtohpheCeMezeN8hE3OJdD/2v1HNZErXWXZMNy29ha9IuP/FPgMln84b9+CMgo5O8GNA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw4mhyuu4wpWD5D6ksRwd6c5jiRUCDHeCEVST1I7YkCFidtrC3k
	5OJnAYnLtkxZdP/YZbq75f5xjbjjnNHnVDvpxho1/aBYUvEQOmX2hGqH1h3ZqPoZWia7s0CU/j+
	QZJXHsQe6WYlVkPciYXLk/cVGTis=
X-Gm-Gg: ASbGncvAh4On5a2uZWREPYLkuoUgFc/ibVe1Y50dEOMq823vliU1m4xjwq/wDs/eYRg
	9VK30uOFTnT0l54m3dUrfpDfXStiaOMdxt+Okxv4=
X-Google-Smtp-Source: AGHT+IG9hgHXPNsbBNiOuY+6OAJ+D2q82bPj4v1OfjOz7h337kMTVjsW2qLUpiuBZXc33tZc49lNKi5hOGaIXzFbkh0=
X-Received: by 2002:a05:690c:4b13:b0:6ef:7036:3b25 with SMTP id
 00721157ae682-6f3f8216b3cmr49229327b3.31.1734775193934; Sat, 21 Dec 2024
 01:59:53 -0800 (PST)
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
References: <20241220092638.2611414-1-guoweikang.kernel@gmail.com> <20241220150623.278e8fa9f073b66dc81edfe6@linux-foundation.org>
In-Reply-To: <20241220150623.278e8fa9f073b66dc81edfe6@linux-foundation.org>
From: Weikang Guo <guoweikang.kernel@gmail.com>
Date: Sat, 21 Dec 2024 17:59:43 +0800
Message-ID: <CAOm6qnnFDjyiQvUmyVA4iq5aJAO8NC=wcAvpKscvfRZKPnzkYw@mail.gmail.com>
Subject: Re: [PATCH] mm/memblock: Add memblock_alloc_or_panic interface
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Christoph Lameter <cl@linux.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Sam Creasey <sammy@sammy.net>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Huacai Chen <chenhuacai@kernel.org>, 
	Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Oreoluwa Babatunde <quic_obabatun@quicinc.com>, rafael.j.wysocki@intel.com, 
	Palmer Dabbelt <palmer@rivosinc.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Easwar Hariharan <eahariha@linux.microsoft.com>, Johannes Berg <johannes.berg@intel.com>, 
	Ingo Molnar <mingo@kernel.org>, Dave Hansen <dave.hansen@intel.com>, 
	Christian Brauner <brauner@kernel.org>, KP Singh <kpsingh@kernel.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, WANG Xuerui <kernel@xen0n.name>, 
	Michael Ellerman <mpe@ellerman.id.au>, Jonas Bonn <jonas@southpole.se>, 
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
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Len Brown <lenb@kernel.org>, 
	Juergen Gross <jgross@suse.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, Tero Kristo <kristo@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Pavel Machek <pavel@ucw.cz>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Marco Elver <elver@google.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Arnd Bergmann <arnd@arndb.de>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	kasan-dev@googlegroups.com, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-acpi@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-omap@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-mm@kvack.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Andrew Morton <akpm@linux-foundation.org> wrote on Saturday, 21
December 2024 07:06:
>
> On Fri, 20 Dec 2024 17:26:38 +0800 Guo Weikang <guoweikang.kernel@gmail.c=
om> wrote:
>
> > Before SLUB initialization, various subsystems used memblock_alloc to
> > allocate memory. In most cases, when memory allocation fails, an immedi=
ate
> > panic is required. To simplify this behavior and reduce repetitive chec=
ks,
> > introduce `memblock_alloc_or_panic`. This function ensures that memory
> > allocation failures result in a panic automatically, improving code
> > readability and consistency across subsystems that require this behavio=
r.
> >
>
> Seems nice.
>
> > ...
> >
> > --- a/include/linux/memblock.h
> > +++ b/include/linux/memblock.h
> > @@ -417,6 +417,19 @@ static __always_inline void *memblock_alloc(phys_a=
ddr_t size, phys_addr_t align)
> >                                     MEMBLOCK_ALLOC_ACCESSIBLE, NUMA_NO_=
NODE);
> >  }
> >
> > +static __always_inline void *memblock_alloc_or_panic(phys_addr_t size,=
 phys_addr_t align)
>
> We lost the printing of the function name, but it's easy to retain with
> something like
>
> #define memblock_alloc_or_panic(size, align)    \
>                 __memblock_alloc_or_panic(size, align, __func__)
>
You're absolutely right, this was an oversight on my part. I=E2=80=99ll mak=
e
sure to update it with the correct function name.
> > +{
> > +     void *addr =3D memblock_alloc(size, align);
> > +
> > +     if (unlikely(!addr))
> > +#ifdef CONFIG_PHYS_ADDR_T_64BIT
> > +             panic("%s: Failed to allocate %llu bytes\n", __func__, si=
ze);
>
> Won't this always print "memblock_alloc_or_panic: Failed ..."?  Not
> very useful.
>
As mentioned above.
> > +#else
> > +             panic("%s: Failed to allocate %u bytes\n", __func__, size=
);
> > +#endif
>
> We can avoid the ifdef with printk's "%pap"?
>
I appreciate you pointing this out. I wasn=E2=80=99t aware of this approach=
,
but it=E2=80=99s a great idea. It definitely simplifies things, and I=E2=80=
=99ve
learned something new in the process. I'll incorporate this into the
code.
> > +     return addr;
> > +}
>

