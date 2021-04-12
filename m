Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F46A35D2E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 00:11:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FK2xZ1s8Kz3c0P
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 08:10:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FK2xD2SRbz2yy3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 08:10:39 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 13CM8MKP012708;
 Mon, 12 Apr 2021 17:08:22 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 13CM8MWJ012707;
 Mon, 12 Apr 2021 17:08:22 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Mon, 12 Apr 2021 17:08:22 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 2/2] powerpc/atomics: Use immediate operand when
 possible
Message-ID: <20210412220821.GN26583@gate.crashing.org>
References: <09da6fec57792d6559d1ea64e00be9870b02dab4.1617896018.git.christophe.leroy@csgroup.eu>
 <9f50b5fadeb090553e5c2fae025052d04d52f3c7.1617896018.git.christophe.leroy@csgroup.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f50b5fadeb090553e5c2fae025052d04d52f3c7.1617896018.git.christophe.leroy@csgroup.eu>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi!

On Thu, Apr 08, 2021 at 03:33:45PM +0000, Christophe Leroy wrote:
> +#define ATOMIC_OP(op, asm_op, dot, sign)				\
>  static __inline__ void atomic_##op(int a, atomic_t *v)			\
>  {									\
>  	int t;								\
>  									\
>  	__asm__ __volatile__(						\
>  "1:	lwarx	%0,0,%3		# atomic_" #op "\n"			\
> -	#asm_op " %0,%2,%0\n"						\
> +	#asm_op "%I2" dot " %0,%0,%2\n"					\
>  "	stwcx.	%0,0,%3 \n"						\
>  "	bne-	1b\n"							\
> -	: "=&r" (t), "+m" (v->counter)					\
> -	: "r" (a), "r" (&v->counter)					\
> +	: "=&b" (t), "+m" (v->counter)					\
> +	: "r"#sign (a), "r" (&v->counter)				\
>  	: "cc");							\
>  }									\

You need "b" (instead of "r") only for "addi".  You can use "addic"
instead, which clobbers XER[CA], but *all* inline asm does, so that is
not a downside here (it is also not slower on any CPU that matters).

> @@ -238,14 +238,14 @@ static __inline__ int atomic_fetch_add_unless(atomic_t *v, int a, int u)
>  "1:	lwarx	%0,0,%1		# atomic_fetch_add_unless\n\
>  	cmpw	0,%0,%3 \n\
>  	beq	2f \n\
> -	add	%0,%2,%0 \n"
> +	add%I2	%0,%0,%2 \n"
>  "	stwcx.	%0,0,%1 \n\
>  	bne-	1b \n"
>  	PPC_ATOMIC_EXIT_BARRIER
> -"	subf	%0,%2,%0 \n\
> +"	sub%I2	%0,%0,%2 \n\
>  2:"
> -	: "=&r" (t)
> -	: "r" (&v->counter), "r" (a), "r" (u)
> +	: "=&b" (t)
> +	: "r" (&v->counter), "rI" (a), "r" (u)
>  	: "cc", "memory");

Same here.

Nice patches!

Acked-by: Segher Boessenkool <segher@kernel.crashing.org>


Segher
