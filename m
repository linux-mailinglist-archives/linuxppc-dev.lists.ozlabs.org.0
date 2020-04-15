Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 259551AB39D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 00:08:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492c270PDXzDr0r
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 08:08:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 492c0T14h3zDr8m
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 08:07:20 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 03FM6sb4027212;
 Wed, 15 Apr 2020 17:06:54 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 03FM6rJd027211;
 Wed, 15 Apr 2020 17:06:53 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 15 Apr 2020 17:06:52 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc/uaccess: Use flexible addressing with
 __put_user()/__get_user()
Message-ID: <20200415220652.GW26902@gate.crashing.org>
References: <4fdc2aba6f5e51887d1cd0fee94be0989eada2cd.1586942312.git.christophe.leroy@c-s.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fdc2aba6f5e51887d1cd0fee94be0989eada2cd.1586942312.git.christophe.leroy@c-s.fr>
User-Agent: Mutt/1.4.2.3i
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Wed, Apr 15, 2020 at 09:20:26AM +0000, Christophe Leroy wrote:
> At the time being, __put_user()/__get_user() and friends only use
> register indirect with immediate index addressing, with the index
> set to 0. Ex:
> 
> 	lwz	reg1, 0(reg2)

This is called a "D-form" instruction, or sometimes "offset addressing".
Don't talk about an "index", it confuses things, because the *other*
kind is called "indexed" already, also in the ISA docs!  (X-form, aka
indexed addressing, [reg+reg], where D-form does [reg+imm], and both
forms can do [reg]).

> Give the compiler the opportunity to use other adressing modes
> whenever possible, to get more optimised code.

Great :-)

> --- a/arch/powerpc/include/asm/uaccess.h
> +++ b/arch/powerpc/include/asm/uaccess.h
> @@ -114,7 +114,7 @@ extern long __put_user_bad(void);
>   */
>  #define __put_user_asm(x, addr, err, op)			\
>  	__asm__ __volatile__(					\
> -		"1:	" op " %1,0(%2)	# put_user\n"		\
> +		"1:	" op "%U2%X2 %1,%2	# put_user\n"	\
>  		"2:\n"						\
>  		".section .fixup,\"ax\"\n"			\
>  		"3:	li %0,%3\n"				\
> @@ -122,7 +122,7 @@ extern long __put_user_bad(void);
>  		".previous\n"					\
>  		EX_TABLE(1b, 3b)				\
>  		: "=r" (err)					\
> -		: "r" (x), "b" (addr), "i" (-EFAULT), "0" (err))
> +		: "r" (x), "m" (*addr), "i" (-EFAULT), "0" (err))

%Un on an "m" operand doesn't do much: you need to make it "m<>" if you
want pre-modify ("update") insns to be generated.  (You then will want
to make sure that operand is used in a way GCC can understand; since it
is used only once here, that works fine).

> @@ -130,8 +130,8 @@ extern long __put_user_bad(void);
>  #else /* __powerpc64__ */
>  #define __put_user_asm2(x, addr, err)				\
>  	__asm__ __volatile__(					\
> -		"1:	stw %1,0(%2)\n"				\
> -		"2:	stw %1+1,4(%2)\n"			\
> +		"1:	stw%U2%X2 %1,%2\n"			\
> +		"2:	stw%U2%X2 %L1,%L2\n"			\
>  		"3:\n"						\
>  		".section .fixup,\"ax\"\n"			\
>  		"4:	li %0,%3\n"				\
> @@ -140,7 +140,7 @@ extern long __put_user_bad(void);
>  		EX_TABLE(1b, 4b)				\
>  		EX_TABLE(2b, 4b)				\
>  		: "=r" (err)					\
> -		: "r" (x), "b" (addr), "i" (-EFAULT), "0" (err))
> +		: "r" (x), "m" (*addr), "i" (-EFAULT), "0" (err))

Here, it doesn't work.  You don't want two consecutive update insns in
any case.  Easiest is to just not use "m<>", and then, don't use %Un
(which won't do anything, but it is confusing).

Same for the reads.

Rest looks fine, and update should be good with that fixed as said.

Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>


Segher
