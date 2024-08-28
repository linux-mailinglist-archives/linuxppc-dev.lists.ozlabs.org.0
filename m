Return-Path: <linuxppc-dev+bounces-638-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0FC961FD9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2024 08:34:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wtvlz38y8z2xg3;
	Wed, 28 Aug 2024 16:34:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724826895;
	cv=none; b=JFG/gpbcHFD6j7QZkFrwObeDnJhLi2RWWqnxEeWDeJGg1pvOhzw7nKaAHpI0B744EtH+uKNBNatGlMg5G/GMV1xTA/3iEnA6iiV/kOC09AnUOUDdUQw4ltxVTszSc+5rL8lROQ6t8DZyQEdKNqyPETOAZTc0raCBaKQ/R+z6JRDXEWngqfQsxckFWdOZQ1QiTXsFnvJsyIGXbVOAG/pqpqRqsvSb6oi7rk4SYCOHV4Br1gLzjiTs9NbZxiPKjB8pzz1pDgTbON8iv+Seu/ueNlKed1FYoh3srnbglcXb8NuYuQDc8Fm5+b2ZOFZPmiXK8pD/u3AzyYLJrUZSqSm/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724826895; c=relaxed/relaxed;
	bh=OL6ocaP88ZibPSKFClSCWWAKIYu4SwcnRj2Y3FXVdBc=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=HWf5g1kAQE7JK8i0H9HWNrV6f9DljnQZ0tb4zNxh5Lj2H0MLE36jArdGnCPRwOv3OfC6+pqQc+MuwVl9ClPoxDdeThqWR8bKy9PP6eMYceQ7JcDi3QqP3Y9ruZGHsU+UUlzfAv6YE/H/sqUISIYLyAY3gXlSrSXlZsbGB99lnADnYng5KsSsrm5p/mjiRnYAYPkFhcUTw9IRMy1aw0I7m9DtNoASm3WCMzrc28pXlYKBqeV/mB5K66GOiMbTv3rWl1sXKzfh2Htd4kWY+2l4ZrO79IwxGUeVdI+3hnbmf1kSG37vdKh43OFDLkfRQC3NV8z16Ks/kP36AA1lVJDTOg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wtvlz0sB8z2xfq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2024 16:34:54 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wtvlv5gSRz9sRs;
	Wed, 28 Aug 2024 08:34:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6jPb3ZkzpTtP; Wed, 28 Aug 2024 08:34:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wtvlt44Xsz9sRy;
	Wed, 28 Aug 2024 08:34:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 72A688B77E;
	Wed, 28 Aug 2024 08:34:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id vzIG7P3XR8ze; Wed, 28 Aug 2024 08:34:50 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C02CD8B764;
	Wed, 28 Aug 2024 08:34:49 +0200 (CEST)
Message-ID: <a43c52c6-c1ac-4ef3-b511-08f0459bddad@csgroup.eu>
Date: Wed, 28 Aug 2024 08:34:49 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/16] powerpc: mm: Support MAP_BELOW_HINT
To: Charlie Jenkins <charlie@rivosinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Shuah Khan <shuah@kernel.org>,
 Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-mm@kvack.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
 <20240827-patches-below_hint_mmap-v1-7-46ff2eb9022d@rivosinc.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240827-patches-below_hint_mmap-v1-7-46ff2eb9022d@rivosinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Charlie,

Le 28/08/2024 à 07:49, Charlie Jenkins a écrit :
> Add support for MAP_BELOW_HINT to arch_get_mmap_base() and
> arch_get_mmap_end().
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>   arch/powerpc/include/asm/task_size_64.h | 36 +++++++++++++++++++++++++++------
>   1 file changed, 30 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/task_size_64.h b/arch/powerpc/include/asm/task_size_64.h
> index 239b363841aa..a37a5a81365d 100644
> --- a/arch/powerpc/include/asm/task_size_64.h
> +++ b/arch/powerpc/include/asm/task_size_64.h
> @@ -72,12 +72,36 @@
>   #define STACK_TOP_MAX TASK_SIZE_USER64
>   #define STACK_TOP (is_32bit_task() ? STACK_TOP_USER32 : STACK_TOP_USER64)
>   
> -#define arch_get_mmap_base(addr, len, base, flags) \
> -	(((addr) > DEFAULT_MAP_WINDOW) ? (base) + TASK_SIZE - DEFAULT_MAP_WINDOW : (base))
> +#define arch_get_mmap_base(addr, len, base, flags)					\

This macro looks quite big for a macro, can it be a static inline 
function instead ? Same for the other macro below.

> +({											\
> +	unsigned long mmap_base;							\
> +	typeof(flags) _flags = (flags);							\
> +	typeof(addr) _addr = (addr);							\
> +	typeof(base) _base = (base);							\
> +	typeof(len) _len = (len);							\
> +	unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);				\
> +	if (_flags & MAP_BELOW_HINT && _addr != 0 && ((_addr + _len) > BIT(VA_BITS - 1)))\
> +		mmap_base = (_addr + _len) - rnd_gap;					\
> +	else										\
> +		mmap_end = ((_addr > DEFAULT_MAP_WINDOW) ?				\
> +				_base + TASK_SIZE - DEFAULT_MAP_WINDOW :		\
> +				_base);							\
> +	mmap_end;									\

mmap_end doesn't exist, did you mean mmap_base ?

> +})
>   
> -#define arch_get_mmap_end(addr, len, flags) \
> -	(((addr) > DEFAULT_MAP_WINDOW) || \
> -	 (((flags) & MAP_FIXED) && ((addr) + (len) > DEFAULT_MAP_WINDOW)) ? TASK_SIZE : \
> -									    DEFAULT_MAP_WINDOW)
> +#define arch_get_mmap_end(addr, len, flags)							\
> +({												\
> +	unsigned long mmap_end;									\
> +	typeof(flags) _flags = (flags);								\
> +	typeof(addr) _addr = (addr);								\
> +	typeof(len) _len = (len);								\
> +	if (_flags & MAP_BELOW_HINT && _addr != 0 && ((_addr + _len) > BIT(VA_BITS - 1)))	\
> +		mmap_end = (_addr + _len);							\
> +	else											\
> +		mmap_end = (((_addr) > DEFAULT_MAP_WINDOW) ||					\
> +				(((_flags) & MAP_FIXED) && ((_addr) + (_len) > DEFAULT_MAP_WINDOW))\
> +				? TASK_SIZE : DEFAULT_MAP_WINDOW)				\
> +	mmap_end;										\
> +})
>   
>   #endif /* _ASM_POWERPC_TASK_SIZE_64_H */
> 

