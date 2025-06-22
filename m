Return-Path: <linuxppc-dev+bounces-9621-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF00AE30ED
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jun 2025 19:14:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQHqn5BX3z30VR;
	Mon, 23 Jun 2025 03:13:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750612437;
	cv=none; b=AWl49Zy5j163A/iY0jfLSqS6RxUa5P+7XQmiKpVvN5+hO2z6836OErb0XnSlNSkW1+c4rN+tE4PiyGnsd0MvZo4IuoeRYh6RfYI7RsXbia9Qw6RCYo+nRHZIEZQrNfrdtprLgjA9oBQKn9BRgmBRQdo9TebvEd264YIP8J74JdBeWIMEvzv9SR8mtOTCoPI0WkFEB2+L96zMDHOq6VFSq2reWLqa7ip2q7ORMWL4Mm7yFk7jFHxZymDZDNFaVLGUgtz5FXX72CL3PJKneV7XFvezlXUYc7P5UHTUmEcct3dqkKVC1+ie339e0m8M0IXuslbvz7TrQyYykYLDlBdarw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750612437; c=relaxed/relaxed;
	bh=bIZU4ZB8m4d8Bq5Wfwj0E+qHG2zC3SoNULF9eyehTrI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TcWevVEFfz560PA2G3YFQ5GdiRjBqZ6GG2U9jhl1FNbLWwIu5/Ir3tIWeycBGV3j1QlKUExDzB7MrqlR1d3uDsG99ztdDhXRQ2Zhrz28YMMLD+Q4oM9jq/C42zYbz03onH69rJ4VS2eQXfuKeZKfQ1rQFeCXkGRYPC7qLHknchs8ff1aQCZIa7RIAsvjVXfAQHtzaAo1SW6/rJF2VWU/mqttkLIR3J2ErlocnD6ayenIYuSoxCjYnKHVLip7y/YzhoiQAva10ZnXGkfqjF8pA7znRhjvNP06OYn/QjzcUW+hzTygG7k3AMLBZgWXmF2UGwHgYOXNNGOzovvLazh3Yw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ejbThj4y; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ejbThj4y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQHqm2Cnlz30T9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 03:13:56 +1000 (AEST)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so23815645e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jun 2025 10:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750612433; x=1751217233; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bIZU4ZB8m4d8Bq5Wfwj0E+qHG2zC3SoNULF9eyehTrI=;
        b=ejbThj4yqVvTW3ecAHc6uE1sPg7F4pimmgeV92R9nk8xx9N2FrdBhefXE9ppwwn/Av
         T0UjsqwRfLXfSyrhW+ELyx2F6OH6iYGZYBLiP6GeWOdN8wCiECwuyBCR69MtN3Bgdf02
         gLdpdanbr/ObsVEDRvBR5KysDNcMkC9C0aAEEqc8//WoYGz+eBQLWvp9dYfMmBaJBpI6
         DGHBMhv7Sokt54tcp50ufoWjjkrmv8DQFIDcZa3Sa0HntefNaADME0url9BcBF9BEMeb
         0FHs/c2Gt5T2H+Cm2MrrqAUCykGkLF9PbTCI9TpvbV+t2T2elKZWAp63wg9ppFIfzqWF
         0nbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750612433; x=1751217233;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bIZU4ZB8m4d8Bq5Wfwj0E+qHG2zC3SoNULF9eyehTrI=;
        b=tiWJ0UAYSy0mAWSXvgdHDDz5oV1/iEWggdEbonKab9KdgmXu7Sf1C4RrMDI7urkh/Z
         DdwG4Otzl2CaUNMcQ+MQbNiJZYgBaAA54V3ig8WZrk+9+pXhPYSZNW3wzI7/idWw5KnI
         VzjCFDzKlQW/PCnWPONuHxn0OkvXMOC7XSwhwlNF1T8RI4OglHuptnJQzaGkYvvpZ9m3
         VXpY1kxIhjPh9zabm8ZQCS0SPmD7k2/2cVvngZ6+dv8D7hYVAuMvrod0XUQ0ofs++PYN
         wuxKvC//RLcEDWsRPtWWVcfjgniezOOYCdZxxUHQLy+itTWcGVcX5Of9FbY0ZDz82150
         o/dg==
X-Forwarded-Encrypted: i=1; AJvYcCX/74OjlK2yN/esatwQnkEao8knoTXZd2VvTz+PfyjaosR2OqDYhMLJgv08/koCh6JNosqqvYhsGgcowhc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzB1ml+7DMt2ACqnxSNzkaII36VQaQ24s3dw0mWhKVHxfsQMz26
	XOsMWO4pxVom0rtuc7EEoHD+3A9Kr04jQo3DFZ0YyKXM5nDYkf74/oZE
X-Gm-Gg: ASbGncuvqF9EZXQEQwj/LfYNxU7f9F8Rfa8vK4+acAY9e6iCe2ax8Hg4ME+fLtd8Nj9
	lfToivQ0+o9XqB0RqIv8zLhytD1qUCeDok04aeOZMRWc774/ctEPTZS8orxmBo1E1IctY7xPJQv
	h0kg0+R4/l40FSTajMeuy99TFWpEY7WK5mPP8BUWi8K/D4wvFQCusn2fXgRSgHMGwX3grRF2ksC
	/IoucjfudVxDNPM5sCr4cvYtsSedKxK11fHpuYzU+/07CI6jZHzpjRWLM4P2Pmwn8dFNxmKMA2t
	KxpdSsmGsHPO7pvXpKWJvcw3P6N5LzVPvTGVjnk1ZWeAZUGUL494zNNgqvpie7Yx1YF1Rx3ebH6
	eFFW49keIBfqd2bR2eHizkbfn
X-Google-Smtp-Source: AGHT+IFxKlVxKCduPVVRwrWdl6NPspLUWEEGe3o0GYO6USWSDesx39FJP/b+Omd3c/6Se1vOl1bWTw==
X-Received: by 2002:a05:600c:5250:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-453653925f1mr79632595e9.6.1750612432858;
        Sun, 22 Jun 2025 10:13:52 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f10a27sm7621546f8f.14.2025.06.22.10.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 10:13:52 -0700 (PDT)
Date: Sun, 22 Jun 2025 18:13:51 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, Davidlohr Bueso
 <dave@stgolabs.net>, "Andre Almeida" <andrealmeid@igalia.com>, Andrew
 Morton <akpm@linux-foundation.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 5/5] powerpc: Implement masked user access
Message-ID: <20250622181351.08141b50@pumpkin>
In-Reply-To: <9dfb66c94941e8f778c4cabbf046af2a301dd963.1750585239.git.christophe.leroy@csgroup.eu>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
	<9dfb66c94941e8f778c4cabbf046af2a301dd963.1750585239.git.christophe.leroy@csgroup.eu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 22 Jun 2025 11:52:43 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Masked user access avoids the address/size verification by access_ok().
> Allthough its main purpose is to skip the speculation in the
> verification of user address and size hence avoid the need of spec
> mitigation, it also has the advantage to reduce the amount of
> instructions needed so it also benefits to platforms that don't
> need speculation mitigation, especially when the size of the copy is
> not know at build time.

Not checking the size is slightly orthogonal.
It really just depends on the accesses being 'reasonably sequential'.
That is probably always true since access_ok() covers a single copy.

> 
> So implement masked user access on powerpc. The only requirement is
> to have memory gap that faults between the top user space and the
> real start of kernel area. On 64 bits platform it is easy, bit 0 is
> always 0 for user addresses and always 1 for kernel addresses and
> user addresses stop long before the end of the area. On 32 bits it
> is more tricky. It theory user space can go up to 0xbfffffff while
> kernel will usually start at 0xc0000000. So a gap needs to be added
> inbetween. Allthough in theory a single 4k page would suffice, it
> is easier and more efficient to enforce a 128k gap below kernel,
> as it simplifies the masking.

The gap isn't strictly necessary - provided the first access is guaranteed
to be at the specified address and the transfer are guaranteed sequential.
But that is hard to guarantee.

Where does the vdso end up?
My guess is 'near the top of userspace' - but maybe not.

> 
> Unlike x86_64 which masks the address to 'all bits set' when the
> user address is invalid, here the address is set to an address is
> the gap. It avoids relying on the zero page to catch offseted
> accesses.

Not true.
Using 'cmov' also removed an instruction.

> 
> e500 has the isel instruction which allows selecting one value or
> the other without branch and that instruction is not speculative, so
> use it. Allthough GCC usually generates code using that instruction,
> it is safer to use inline assembly to be sure. The result is:
> 
>   14:	3d 20 bf fe 	lis     r9,-16386
>   18:	7c 03 48 40 	cmplw   r3,r9
>   1c:	7c 69 18 5e 	iselgt  r3,r9,r3
> 
> On other ones, when kernel space is over 0x80000000 and user space
> is below, the logic in mask_user_address_simple() leads to a
> 3 instruction sequence:
> 
>   14:	7c 69 fe 70 	srawi   r9,r3,31
>   18:	7c 63 48 78 	andc    r3,r3,r9
>   1c:	51 23 00 00 	rlwimi  r3,r9,0,0,0
> 
> This is the default on powerpc 8xx.
> 
> When the limit between user space and kernel space is not 0x80000000,
> mask_user_address_32() is used and a 6 instructions sequence is
> generated:
> 
>   24:	54 69 7c 7e 	srwi    r9,r3,17
>   28:	21 29 57 ff 	subfic  r9,r9,22527
>   2c:	7d 29 fe 70 	srawi   r9,r9,31
>   30:	75 2a b0 00 	andis.  r10,r9,45056
>   34:	7c 63 48 78 	andc    r3,r3,r9
>   38:	7c 63 53 78 	or      r3,r3,r10
> 
> The constraint is that TASK_SIZE be aligned to 128K in order to get
> the most optimal number of instructions.
> 
> When CONFIG_PPC_BARRIER_NOSPEC is not defined, fallback on the
> test-based masking as it is quicker than the 6 instructions sequence
> but not necessarily quicker than the 3 instructions sequences above.

Doesn't that depend on whether the branch is predicted correctly?

I can't read ppc asm well enough to check the above.
And the C is also a bit tortuous.


> 
> On 64 bits, kernel is always above 0x8000000000000000 and user always
> below, which leads to a 4 instructions sequence:
> 
>   80:	7c 69 1b 78 	mr      r9,r3
>   84:	7c 63 fe 76 	sradi   r3,r3,63
>   88:	7d 29 18 78 	andc    r9,r9,r3
>   8c:	79 23 00 4c 	rldimi  r3,r9,0,1
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/Kconfig               |   2 +-
>  arch/powerpc/include/asm/uaccess.h | 100 +++++++++++++++++++++++++++++
>  2 files changed, 101 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index c3e0cc83f120..c26a39b4504a 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -1303,7 +1303,7 @@ config TASK_SIZE
>  	hex "Size of user task space" if TASK_SIZE_BOOL
>  	default "0x80000000" if PPC_8xx
>  	default "0xb0000000" if PPC_BOOK3S_32 && EXECMEM
> -	default "0xc0000000"
> +	default "0xbffe0000"
>  
>  config MODULES_SIZE_BOOL
>  	bool "Set custom size for modules/execmem area"
> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
> index 89d53d4c2236..19743ee80523 100644
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -2,6 +2,8 @@
>  #ifndef _ARCH_POWERPC_UACCESS_H
>  #define _ARCH_POWERPC_UACCESS_H
>  
> +#include <linux/sizes.h>
> +
>  #include <asm/processor.h>
>  #include <asm/page.h>
>  #include <asm/extable.h>
> @@ -455,6 +457,104 @@ user_write_access_begin(const void __user *ptr, size_t len)
>  #define user_write_access_begin	user_write_access_begin
>  #define user_write_access_end		prevent_current_write_to_user
>  
> +/*
> + * Masking the user address is an alternative to a conditional
> + * user_access_begin that can avoid the fencing. This only works
> + * for dense accesses starting at the address.

I think you need to say that kernel addresses get converted to an invalid
address between user and kernel addresses.
It works provided accesses are 'reasonably dense'.

	David

> + */
> +static inline void __user *mask_user_address_simple(const void __user *ptr)
> +{
> +	unsigned long addr = (unsigned long)ptr;
> +	unsigned long mask = (unsigned long)((long)addr >> (BITS_PER_LONG - 1));
> +
> +	addr = ((addr & ~mask) & (~0UL >> 1)) | (mask & (1UL << (BITS_PER_LONG - 1)));
> +
> +	return (void __user *)addr;
> +}
> +
> +static inline void __user *mask_user_address_e500(const void __user *ptr)
> +{
> +	unsigned long addr;
> +
> +	asm("cmplw %1, %2; iselgt %0, %2, %1" : "=r"(addr) : "r"(ptr), "r"(TASK_SIZE): "cr0");
> +
> +	return (void __user *)addr;
> +}
> +
> +/* Make sure TASK_SIZE is a multiple of 128K for shifting by 17 to the right */
> +static inline void __user *mask_user_address_32(const void __user *ptr)
> +{
> +	unsigned long addr = (unsigned long)ptr;
> +	unsigned long mask = (unsigned long)((long)((TASK_SIZE >> 17) - 1 - (addr >> 17)) >> 31);
> +
> +	addr = (addr & ~mask) | (TASK_SIZE & mask);
> +
> +	return (void __user *)addr;
> +}
> +
> +static inline void __user *mask_user_address_fallback(const void __user *ptr)
> +{
> +	unsigned long addr = (unsigned long)ptr;
> +
> +	return (void __user *)(addr < TASK_SIZE ? addr : TASK_SIZE);
> +}
> +
> +static inline void __user *mask_user_address(const void __user *ptr)
> +{
> +#ifdef MODULES_VADDR
> +	const unsigned long border = MODULES_VADDR;
> +#else
> +	const unsigned long border = PAGE_OFFSET;
> +#endif
> +	BUILD_BUG_ON(TASK_SIZE_MAX & (SZ_128K - 1));
> +	BUILD_BUG_ON(TASK_SIZE_MAX + SZ_128K > border);
> +	BUILD_BUG_ON(TASK_SIZE_MAX & 0x8000000000000000ULL);
> +	BUILD_BUG_ON(IS_ENABLED(CONFIG_PPC64) && !(PAGE_OFFSET & 0x8000000000000000ULL));
> +
> +	if (IS_ENABLED(CONFIG_PPC64))
> +		return mask_user_address_simple(ptr);
> +	if (IS_ENABLED(CONFIG_E500))
> +		return mask_user_address_e500(ptr);
> +	if (TASK_SIZE <= SZ_2G && border >= SZ_2G)
> +		return mask_user_address_simple(ptr);
> +	if (IS_ENABLED(CONFIG_PPC_BARRIER_NOSPEC))
> +		return mask_user_address_32(ptr);
> +	return mask_user_address_fallback(ptr);
> +}
> +
> +static inline void __user *masked_user_access_begin(const void __user *p)
> +{
> +	void __user *ptr = mask_user_address(p);
> +
> +	might_fault();
> +	allow_read_write_user(ptr, ptr);
> +
> +	return ptr;
> +}
> +#define masked_user_access_begin masked_user_access_begin
> +
> +static inline void __user *masked_user_read_access_begin(const void __user *p)
> +{
> +	void __user *ptr = mask_user_address(p);
> +
> +	might_fault();
> +	allow_read_from_user(ptr);
> +
> +	return ptr;
> +}
> +#define masked_user_read_access_begin masked_user_read_access_begin
> +
> +static inline void __user *masked_user_write_access_begin(const void __user *p)
> +{
> +	void __user *ptr = mask_user_address(p);
> +
> +	might_fault();
> +	allow_write_to_user(ptr);
> +
> +	return ptr;
> +}
> +#define masked_user_write_access_begin masked_user_write_access_begin
> +
>  #define unsafe_get_user(x, p, e) do {					\
>  	__long_type(*(p)) __gu_val;				\
>  	__typeof__(*(p)) __user *__gu_addr = (p);		\


