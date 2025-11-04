Return-Path: <linuxppc-dev+bounces-13716-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD5AC2FB77
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 08:50:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d10ws6TxRz3bf3;
	Tue,  4 Nov 2025 18:50:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762242605;
	cv=none; b=Tw0XVelNP102EiBtMBoEKa7WmsNeuec1vQf508BIdaVAGvehO+1/K/5R24NSE2zHEm+d7se5A75CpmENJh/8v9SWbirBEcqsWQhex5BPts1cRPvJ8rKMF9cjkSxjLackGmG++5NVRVrJLLToHUFA3BN78DAKjL3sOT1i28dq/QPwjLRVqnvfe3wX/gvC7nfw5nzQHI0P30D2nk1OAPaktVNNna3iFlSZNHUrCyNIRPG4XhTSDxqmENVEWKJfWUKz/lbH0I3YCpQa5nnrLN8YjQgXptBXflXEuCMiwg6AxczlKb7ko5bLn342WHz3XMyjh2WK+TJuAs1u6YGsEponaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762242605; c=relaxed/relaxed;
	bh=tNuUpq5e6vkEkL9QRwI+Wdn8BwX5B5dX9u4+4qgyKns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i+Hy3F4zGFVDlcb7/P4VC94ysuE2cvrBvn+BeVooX2kwyykSmSk4TxxP0LZ2OcVezwGbwv6Mkt/L/1DDd/JxQnQlv9LrCQqHDBeX21Kgiffkou/0CoAMBaG8Li8edHNZTUbvGUFOZ44fOMXfNsKJ2P6GPJEyN4TKIz7bWIzHrL6TD6qNzP6Ig0q9Jo/UXg+u+L0kxK1D1UWPXRqr1MkJ9nnezF2X/puvhRHzoweC9niOPsXKHjPptAnEdjK5IHcuHJKUmLkvu56+Gpv6JIBU6HuR2w82Xayj2y0j7LfqH39w6FeSbuwxwRUwUbdRvNj+kWEEjuI3ICjLV2Pkqm+oaA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d10ws0hrTz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 18:50:04 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d0yqn4Hdvz9sSL;
	Tue,  4 Nov 2025 07:15:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KvWCvtBuZZqr; Tue,  4 Nov 2025 07:15:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d0yqn3J6sz9sS8;
	Tue,  4 Nov 2025 07:15:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 595658B76C;
	Tue,  4 Nov 2025 07:15:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id fIxXjoi-bve2; Tue,  4 Nov 2025 07:15:33 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E3778B763;
	Tue,  4 Nov 2025 07:15:31 +0100 (CET)
Message-ID: <f8872b02-d7f5-421d-8699-5d27987c6e1f@csgroup.eu>
Date: Tue, 4 Nov 2025 07:15:30 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V5 04/12] powerpc/uaccess: Use unsafe wrappers for ASM
 GOTO
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.356628509@linutronix.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251027083745.356628509@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 27/10/2025 à 09:43, Thomas Gleixner a écrit :
> ASM GOTO is miscompiled by GCC when it is used inside a auto cleanup scope:
> 
> bool foo(u32 __user *p, u32 val)
> {
> 	scoped_guard(pagefault)
> 		unsafe_put_user(val, p, efault);
> 	return true;
> efault:
> 	return false;
> }
> 
> It ends up leaking the pagefault disable counter in the fault path. clang
> at least fails the build.

Confirmed on powerpc:

Before the patch

000001e8 <foo>:
  1e8:	81 22 05 24 	lwz     r9,1316(r2)
  1ec:	39 29 00 01 	addi    r9,r9,1
  1f0:	91 22 05 24 	stw     r9,1316(r2)
  1f4:	90 83 00 00 	stw     r4,0(r3)
  1f8:	81 22 05 24 	lwz     r9,1316(r2)
  1fc:	38 60 00 01 	li      r3,1
  200:	39 29 ff ff 	addi    r9,r9,-1
  204:	91 22 05 24 	stw     r9,1316(r2)
  208:	4e 80 00 20 	blr
  20c:	38 60 00 00 	li      r3,0
  210:	4e 80 00 20 	blr

00000000 <__ex_table>:
         ...
                         20: R_PPC_REL32 .text+0x1f4
                         24: R_PPC_REL32 .text+0x20c

After the patch

000001e8 <foo>:
  1e8:	81 22 05 24 	lwz     r9,1316(r2)
  1ec:	39 29 00 01 	addi    r9,r9,1
  1f0:	91 22 05 24 	stw     r9,1316(r2)
  1f4:	90 83 00 00 	stw     r4,0(r3)
  1f8:	81 22 05 24 	lwz     r9,1316(r2)
  1fc:	38 60 00 01 	li      r3,1
  200:	39 29 ff ff 	addi    r9,r9,-1
  204:	91 22 05 24 	stw     r9,1316(r2)
  208:	4e 80 00 20 	blr
  20c:	81 22 05 24 	lwz     r9,1316(r2)
  210:	38 60 00 00 	li      r3,0
  214:	39 29 ff ff 	addi    r9,r9,-1
  218:	91 22 05 24 	stw     r9,1316(r2)
  21c:	4e 80 00 20 	blr

00000000 <__ex_table>:
         ...
                         20: R_PPC_REL32 .text+0x1f4
                         24: R_PPC_REL32 .text+0x20c



> 
> Rename unsafe_*_user() to arch_unsafe_*_user() which makes the generic
> uaccess header wrap it with a local label that makes both compilers emit
> correct code. Same for the kernel_nofault() variants.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: linuxppc-dev@lists.ozlabs.org

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>


> ---
>   arch/powerpc/include/asm/uaccess.h |    8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -451,7 +451,7 @@ user_write_access_begin(const void __use
>   #define user_write_access_begin	user_write_access_begin
>   #define user_write_access_end		prevent_current_write_to_user
>   
> -#define unsafe_get_user(x, p, e) do {					\
> +#define arch_unsafe_get_user(x, p, e) do {			\
>   	__long_type(*(p)) __gu_val;				\
>   	__typeof__(*(p)) __user *__gu_addr = (p);		\
>   								\
> @@ -459,7 +459,7 @@ user_write_access_begin(const void __use
>   	(x) = (__typeof__(*(p)))__gu_val;			\
>   } while (0)
>   
> -#define unsafe_put_user(x, p, e) \
> +#define arch_unsafe_put_user(x, p, e)				\
>   	__put_user_size_goto((__typeof__(*(p)))(x), (p), sizeof(*(p)), e)
>   
>   #define unsafe_copy_from_user(d, s, l, e) \
> @@ -504,11 +504,11 @@ do {									\
>   		unsafe_put_user(*(u8*)(_src + _i), (u8 __user *)(_dst + _i), e); \
>   } while (0)
>   
> -#define __get_kernel_nofault(dst, src, type, err_label)			\
> +#define arch_get_kernel_nofault(dst, src, type, err_label)		\
>   	__get_user_size_goto(*((type *)(dst)),				\
>   		(__force type __user *)(src), sizeof(type), err_label)
>   
> -#define __put_kernel_nofault(dst, src, type, err_label)			\
> +#define arch_put_kernel_nofault(dst, src, type, err_label)		\
>   	__put_user_size_goto(*((type *)(src)),				\
>   		(__force type __user *)(dst), sizeof(type), err_label)
>   
> 


