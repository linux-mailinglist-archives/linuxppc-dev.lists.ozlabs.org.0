Return-Path: <linuxppc-dev+bounces-4368-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBAC9F9CFF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Dec 2024 00:06:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFNMZ51dzz30WP;
	Sat, 21 Dec 2024 10:06:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734735994;
	cv=none; b=hlSbXD+183NcDZzT3roieXa4i/aT5RJTe2AhHNkTLZL+i1HzwFrrXPmHTdkBSSPaA7VczFrNhlwcSi0gUVni7HFIkDsbIaOcAoTsYazIVaU8p0+6EvOJy6mUWHftnxdqKc98pcN9hjdCmfY7RO8vSvqstUfx0GQ4ilIODNcP9kBiMKN2mPciQIF5sEHwmZMOhdbQiQW5kSK1jTTFpMJ9vbE9vdqn0NwWadbs5U25HlvUZi3EDvqFE6s6NoPKX4QSRWmi20Vk0XNrCE4OGjnBhXdPlNWir6T2FJY2FhVmpzy+NYe4TWhmTGdWteHKP4Klc6KP+flvrLkicx1CknPcIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734735994; c=relaxed/relaxed;
	bh=EwcaWmbpAr7Tt6bNh0ZEoMJ/C6ZMgwB9Hii3xy1Ro3M=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=QRYPtxFpBL5iTtYydxYgkPCxhb6y8wvQcclfMj7frbpj8713sLLglNe5/eqadDX8M24/QJ+6Jvi3x1df5CRLjhFmVDzDwQaVt7jJiMJJC1Eg2me7xYa4MrBxzlqccEUarBBOzVYk6huPitzTgbxC/A3q7ZP2IuUeCutJ2fsbXqfbUSFFLUjHcPy0GqHgwIJQe1TTh37utSccTq5bbJwGVcOKzIluapK9O/tDNzdQJa20+es8R16++CDrWKenDUEfnYNh6UWnFh1yD1Srs4PiLEp4foHxpg1lE4AFs6al+RJ9D8Z/ZfMKdMI3UgZvmBMpTpsGx+Cu18eRyjq4MR23DA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=ko0NoC85; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=ko0NoC85;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFNMY1WKzz2xxx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2024 10:06:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0B8B0A4281D;
	Fri, 20 Dec 2024 23:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D4DC4CECD;
	Fri, 20 Dec 2024 23:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1734735987;
	bh=rDnT4CiiEQHDei+WTY8t89wAldSK7/wzy9hzuNQ2FY0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ko0NoC85TGcP1IppTBQ7r5GFZyBBTG2SpQ0tFrc/AJkG+/T9Itx2K+hPhmLUjOFT3
	 W/JopMsDfKdWQ+Sgte/CaZu5u4oCC9X7AhqHTGt1/QNG5SKrdk/OmLPnondMcorXOq
	 YK2sRjfqtNIqcRTWYGNAXSYWTaR7HQTBx80wOGXo=
Date: Fri, 20 Dec 2024 15:06:23 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Guo Weikang <guoweikang.kernel@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>, Dennis Zhou <dennis@kernel.org>, Tejun
 Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Sam Creasey <sammy@sammy.net>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Huacai Chen <chenhuacai@kernel.org>,
 Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Oreoluwa Babatunde <quic_obabatun@quicinc.com>, rafael.j.wysocki@intel.com,
 Palmer Dabbelt <palmer@rivosinc.com>, Hanjun Guo <guohanjun@huawei.com>,
 Easwar Hariharan <eahariha@linux.microsoft.com>, Johannes Berg
 <johannes.berg@intel.com>, Ingo Molnar <mingo@kernel.org>, Dave Hansen
 <dave.hansen@intel.com>, Christian Brauner <brauner@kernel.org>, KP Singh
 <kpsingh@kernel.org>, Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Russell King <linux@armlinux.org.uk>,
 WANG Xuerui <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>,
 Jonas Bonn <jonas@southpole.se>, Stefan Kristiansson
 <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>,
 Helge Deller <deller@gmx.de>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Geoff
 Levand <geoff@infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
 <glider@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov
 <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Yoshinori
 Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Andreas Larsson
 <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Johannes Berg
 <johannes@sipsolutions.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, x86@kernel.org, Len Brown <lenb@kernel.org>,
 Juergen Gross <jgross@suse.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Chris Zankel <chris@zankel.net>, Max Filippov
 <jcmvbkbc@gmail.com>, Tero Kristo <kristo@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Saravana Kannan <saravanak@google.com>, Pavel Machek
 <pavel@ucw.cz>, Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Marco Elver <elver@google.com>, Al Viro
 <viro@zeniv.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
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
Subject: Re: [PATCH] mm/memblock: Add memblock_alloc_or_panic interface
Message-Id: <20241220150623.278e8fa9f073b66dc81edfe6@linux-foundation.org>
In-Reply-To: <20241220092638.2611414-1-guoweikang.kernel@gmail.com>
References: <20241220092638.2611414-1-guoweikang.kernel@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 20 Dec 2024 17:26:38 +0800 Guo Weikang <guoweikang.kernel@gmail.com> wrote:

> Before SLUB initialization, various subsystems used memblock_alloc to
> allocate memory. In most cases, when memory allocation fails, an immediate
> panic is required. To simplify this behavior and reduce repetitive checks,
> introduce `memblock_alloc_or_panic`. This function ensures that memory
> allocation failures result in a panic automatically, improving code
> readability and consistency across subsystems that require this behavior.
> 

Seems nice.

> ...
>
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -417,6 +417,19 @@ static __always_inline void *memblock_alloc(phys_addr_t size, phys_addr_t align)
>  				      MEMBLOCK_ALLOC_ACCESSIBLE, NUMA_NO_NODE);
>  }
>  
> +static __always_inline void *memblock_alloc_or_panic(phys_addr_t size, phys_addr_t align)

We lost the printing of the function name, but it's easy to retain with
something like

#define memblock_alloc_or_panic(size, align)	\
		__memblock_alloc_or_panic(size, align, __func__)

> +{
> +	void *addr = memblock_alloc(size, align);
> +
> +	if (unlikely(!addr))
> +#ifdef CONFIG_PHYS_ADDR_T_64BIT
> +		panic("%s: Failed to allocate %llu bytes\n", __func__, size);

Won't this always print "memblock_alloc_or_panic: Failed ..."?  Not
very useful.

> +#else
> +		panic("%s: Failed to allocate %u bytes\n", __func__, size);
> +#endif

We can avoid the ifdef with printk's "%pap"?

> +	return addr;
> +}


