Return-Path: <linuxppc-dev+bounces-4406-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C374E9FA523
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Dec 2024 11:07:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGGzC3n9Vz2xjv;
	Sun, 22 Dec 2024 21:07:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734862023;
	cv=none; b=dPSOPwxF0mZkw/77DN+X+NCFNA4DVTHX80c+/3oNugOu7o1ARcyQDy0SL78rwht4nWgj5AZ2NE0+WA8g4JVleOqMctNGi5AVawDp1pxa1K5v7XauzqcbfgM7ZUkfMMK1PnC9OnJD4sRZXqGO7QE5ATUrBWt7KMCV8ozCJQdgt3rziVgEbgl9dpyM0db1MuzPfqbyGvaDwS9RVta8OuSnwi9ryaCtkcRGzeDd/gK+oUDYxM/lP5y/bd2je7GJfd7WyZkt1tBxpq3MJZPVDRU8H+tw8ZX4uJmLQ0gkFfEvp0KJdN1mq5GMJsj90GGZq9y6JfoVBrRqgrRpoKvLx0alaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734862023; c=relaxed/relaxed;
	bh=+hFbeVZytTc7as3NSImfMf3crm19rt/Slw/x+P9Woiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUhzrlw1HmSGp/RzT0e0FRaAjWeE8bHfBqHCtK6eNRmMXpesfsTPpZX/jSgpjOr8FHzmYdiWmKlzHwhqpnM3oI1xf1G+Kbeqh805kvcQK1zbO1x7mDQnU2aOtJKi0DVxOj1c7J3DRbbmhBHAKugS5GkwBPXCifzVA6benOTqoPOYbzWlVhVstUE8UG8LOAq/iCQTZ4peqUkajNZ2fIEaIBDLJB6zW0GDmso+EulvQYheBOtjONUKJ2hvhXDgcF456Zmxa8n7FNj6ib2Ny5oi6V1E24d2yjcyli2wsU9kkYFGevjJGa9T19kZBYl7CQsPTmEP4+KFvhVSBpSaZe8zOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s3+eZLw2; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=s3+eZLw2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGGzB29z9z2xfb
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Dec 2024 21:07:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 018E35C4689;
	Sun, 22 Dec 2024 10:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7832C4CECD;
	Sun, 22 Dec 2024 10:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734862017;
	bh=sHCtg4von/olng1R4HlYChWVtzpfTivVlSvduFQtli4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s3+eZLw2H4fsTfYy7R26AMbxlUMiT45Y42thwzbQ7PzYcjCMV+xxnbiGc5SjcS8ee
	 N/pq6zKrdaTkA0THA/ohfrCjL8qwibt1MJ2o6NoUYUPkl8EkNQJF5tSH+SY+J1fE/8
	 Cvqm19I8xARPjWukujUbLNF0kg/VQ2JYfhr7BGGUm+m05r04yTqUEGCkxSjPDtezqD
	 tVCjBp4QZY5na1pptfRr8OCkrj7c6+qsi21cr2LJfacf2iXQzPcBvoG6AX6jq7P+Mk
	 T1nS6fK7nO7+rovxDAahs2X2IJBNreAhQtCCLuO9qzEwhrWBjbRlWnWXYxS/hWfdIV
	 u6Jyj1v1mllWg==
Date: Sun, 22 Dec 2024 12:06:22 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Guo Weikang <guoweikang.kernel@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Sam Creasey <sammy@sammy.net>, Huacai Chen <chenhuacai@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Oreoluwa Babatunde <quic_obabatun@quicinc.com>,
	rafael.j.wysocki@intel.com, Palmer Dabbelt <palmer@rivosinc.com>,
	Hanjun Guo <guohanjun@huawei.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Ingo Molnar <mingo@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
	Christian Brauner <brauner@kernel.org>,
	KP Singh <kpsingh@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	WANG Xuerui <kernel@xen0n.name>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Geoff Levand <geoff@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	kasan-dev@googlegroups.com, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org, linux-acpi@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-omap@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v6] mm/memblock: Add memblock_alloc_or_panic interface
Message-ID: <Z2fknmnNtiZbCc7x@kernel.org>
References: <20241222054331.2705948-1-guoweikang.kernel@gmail.com>
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
In-Reply-To: <20241222054331.2705948-1-guoweikang.kernel@gmail.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Dec 22, 2024 at 01:43:31PM +0800, Guo Weikang wrote:
> Before SLUB initialization, various subsystems used memblock_alloc to
> allocate memory. In most cases, when memory allocation fails, an immediate
> panic is required. To simplify this behavior and reduce repetitive checks,
> introduce `memblock_alloc_or_panic`. This function ensures that memory
> allocation failures result in a panic automatically, improving code
> readability and consistency across subsystems that require this behavior.
> 
> Signed-off-by: Guo Weikang <guoweikang.kernel@gmail.com>
> ---

...

> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index 673d5cae7c81..73af7ca3fa1c 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -417,6 +417,12 @@ static __always_inline void *memblock_alloc(phys_addr_t size, phys_addr_t align)
>  				      MEMBLOCK_ALLOC_ACCESSIBLE, NUMA_NO_NODE);
>  }
>  
> +void *__memblock_alloc_or_panic(phys_addr_t size, phys_addr_t align,
> +				       const char *func);

Please align this line with the first parameter to the function.
Other than that

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> +
> +#define memblock_alloc_or_panic(size, align)    \
> +	 __memblock_alloc_or_panic(size, align, __func__)
> +
>  static inline void *memblock_alloc_raw(phys_addr_t size,
>  					       phys_addr_t align)
>  {


-- 
Sincerely yours,
Mike.

