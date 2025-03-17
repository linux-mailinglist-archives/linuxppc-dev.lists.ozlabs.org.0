Return-Path: <linuxppc-dev+bounces-7131-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6673DA64F5F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Mar 2025 13:40:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZGZM16xDhz2yjb;
	Mon, 17 Mar 2025 23:40:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742215229;
	cv=none; b=hj7XY1yLiwHZnj5Vr9n9HizKX/5VEnik2EEiaDAf3zyzFPtZwWJu/zU7uOKzvpkEJiIHEF5lgDaBYMfV7XwJjPzU/eemVt/LuGUaJ3UI08a3yJq+75ZKNEncev3SDlA51qT58kfTiPH4kSkH4wLAM8Zxv/BrfVfzT017Fhgp13E3j3uIAT8IWd9Bwl0IkWHFqKXE2XH0TpqqGXRpBnIIlYe9EfJKa5e959DwJaGU7SXUYGrCTEsgTER/eXYRn0jmgNAJ7g0EqeaZFBMO3vxtDSbwQ1NQ1ZBgyYyydfRZ/TRAL9asf9JjMTE7HGgY+dmhXZla+B9NBZgqnmNAMAGLpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742215229; c=relaxed/relaxed;
	bh=fs5ffMkeEW2ax5/QQF+JZfPkEQjIQoY+vvUAGiw5Fes=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AzVncW4vB9ucsE4G+oL+M2Oz1poBHHGw40O6ctbjRmOsu+BApXQ60FjYxOUzaMZEpUaSI4Dn1oAuiobY40DAL9ASDrd1YLDU+1fkeBzxlftrQALDsdy+6B3CuunNazAuVtluCpmb44na7lZ7sCOVif2HKXBg7HXuuo8L3v9ci8A9H5nuXtTw1pbxEPnHsxXKVPEkitXEp4lHkvlL8tbdgN1ek3hIcd4FSeay/g0gKIWiMe5sPnId6iOLb3f9SOC+Fag3mIIbMwIYvjISbISbHTT2kh5Jajzf26QObFazoh5gi05lvepZNA7rtKY/iPpK88gXZftcoHt9g691gkExOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E7Ar7yyZ; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=dinguyen@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E7Ar7yyZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=dinguyen@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZGZM065GZz2ygg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Mar 2025 23:40:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B1D645C5606;
	Mon, 17 Mar 2025 12:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A338C4CEE9;
	Mon, 17 Mar 2025 12:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742215225;
	bh=Qm34pbxAa6RjHCc2A1aXJ4qBOugE70Km6ONzqhDGMKA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E7Ar7yyZci/sFoCidNgE8WXrHkJCdBUtC5+SBI7ElJU6LgZqLiSvRPlv1xqMCdR+2
	 JdSknt+r47jh4J64JDHOV3bC2f8CCEHU9CwoE9ISsT1r2OFEQaCkooFpGyY2cq0AUS
	 8BJqKWvVNVKmYaiENoybfTCks4OV2Hujobg04vepdZYEAJYEHgTYSVQtuBbCiU49Wg
	 w4Y7etNdGOWGUdqy5s7jSxyR/7rnszsVQfJoCdbVmwcu/WQyL4uucGKWINrXNoVXHO
	 5i4vQUYMXA8gu7KzsUBsrs+oDW3h+voixjT+nCGjato5WHQworTVVXnwjAQoo5sK7c
	 ZdFal0K6UlYKw==
Message-ID: <e3dfe753-fb5f-4f2f-9d24-da8a4f01be19@kernel.org>
Date: Mon, 17 Mar 2025 07:40:20 -0500
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] nios2: move pr_debug() about memory start and
 end to setup_arch()
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Guo Ren
 <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-mm@kvack.org, x86@kernel.org
References: <20250313135003.836600-1-rppt@kernel.org>
 <20250313135003.836600-7-rppt@kernel.org>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20250313135003.836600-7-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 3/13/25 08:49, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> This will help with pulling out memblock_free_all() to the generic
> code and reducing code duplication in arch::mem_init().
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>   arch/nios2/kernel/setup.c | 2 ++
>   arch/nios2/mm/init.c      | 2 --
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/nios2/kernel/setup.c b/arch/nios2/kernel/setup.c
> index da122a5fa43b..a4cffbfc1399 100644
> --- a/arch/nios2/kernel/setup.c
> +++ b/arch/nios2/kernel/setup.c
> @@ -149,6 +149,8 @@ void __init setup_arch(char **cmdline_p)
>   	memory_start = memblock_start_of_DRAM();
>   	memory_end = memblock_end_of_DRAM();
>   
> +	pr_debug("%s: start=%lx, end=%lx\n", __func__, memory_start, memory_end);
> +
>   	setup_initial_init_mm(_stext, _etext, _edata, _end);
>   	init_task.thread.kregs = &fake_regs;
>   
> diff --git a/arch/nios2/mm/init.c b/arch/nios2/mm/init.c
> index a2278485de19..aa692ad30044 100644
> --- a/arch/nios2/mm/init.c
> +++ b/arch/nios2/mm/init.c
> @@ -65,8 +65,6 @@ void __init mem_init(void)
>   	unsigned long end_mem   = memory_end; /* this must not include
>   						kernel stack at top */
>   
> -	pr_debug("mem_init: start=%lx, end=%lx\n", memory_start, memory_end);
> -
>   	end_mem &= PAGE_MASK;
>   	high_memory = __va(end_mem);
>   

Acked-By: Dinh Nguyen <dinguyen@kernel.org>

