Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF40147849
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 06:48:07 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 483p8L2PvtzDqcN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2020 16:48:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 483p6X3d6CzDqWW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2020 16:46:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=i+1ZNLkn; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 483p6W5zVMz9sNF;
 Fri, 24 Jan 2020 16:46:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579844788;
 bh=gUhlGsmxPsj7AoZY/nvO9RjsEp2BAfmFuizDcUbrgWo=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=i+1ZNLknNeLIspRl2aa5x3e2lpTbg88wfyCrpdxXnt8EvwW3El3+zs2qZBVm1FDcK
 TcRLmmkSc5q4TEwLXC6TqhOjfnX901H4gmhsXzQv/R3TPmIe6cDj7CakIRwiyTy+6L
 9WhV6NW9ZmZE07oOmbO9m04kgo3ift2emmVWMK1NAecX+ZoJMhXsGXMqgkOSPd730g
 BhRrJY4+wkqP8DzYxEV1OfVFHysGfy0yxHlQ1Y8L7H4YWh5hIo41AFqOhLFFHYKbkR
 NV+VIqtvStT8EdbeJtYKjVLQ1+W3zy5kGFQxeb6jJWgeoCWHtTOorJjVfbRrgsz3Tf
 +9YgFW25zZ9Hg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH 1/2] powerpc/irq: don't use current_stack_pointer() in
 check_stack_overflow()
In-Reply-To: <bae3e75a0c7f9037e4012ee547842c04cd527931.1575871613.git.christophe.leroy@c-s.fr>
References: <bae3e75a0c7f9037e4012ee547842c04cd527931.1575871613.git.christophe.leroy@c-s.fr>
Date: Fri, 24 Jan 2020 16:46:24 +1100
Message-ID: <87d0b9iez3.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@c-s.fr> writes:

> current_stack_pointer() doesn't return the stack pointer, but the
> caller's stack frame. See commit bfe9a2cfe91a ("powerpc: Reimplement
> __get_SP() as a function not a define") and commit acf620ecf56c
> ("powerpc: Rename __get_SP() to current_stack_pointer()") for details.
>
> The purpose of check_stack_overflow() is to verify that the stack has
> not overflowed.
>
> To really know whether the stack pointer is still within boundaries,
> the check must be done directly on the value of r1.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/kernel/irq.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
> index bb34005ff9d2..4d468d835558 100644
> --- a/arch/powerpc/kernel/irq.c
> +++ b/arch/powerpc/kernel/irq.c
> @@ -599,9 +599,8 @@ u64 arch_irq_stat_cpu(unsigned int cpu)
>  static inline void check_stack_overflow(void)
>  {
>  #ifdef CONFIG_DEBUG_STACKOVERFLOW
> -	long sp;
> -
> -	sp = current_stack_pointer() & (THREAD_SIZE-1);
> +	register unsigned long r1 asm("r1");
> +	long sp = r1 & (THREAD_SIZE - 1);

This appears to work but seems to be "unsupported" by GCC, and clang
actually complains about it:

  /linux/arch/powerpc/kernel/irq.c:603:12: error: variable 'r1' is uninitialized when used here [-Werror,-Wuninitialized]
          long sp = r1 & (THREAD_SIZE - 1);
                    ^~

The GCC docs say:

  The only supported use for this feature is to specify registers for
  input and output operands when calling Extended asm (see Extended
  Asm).

https://gcc.gnu.org/onlinedocs/gcc-9.1.0/gcc/Local-Register-Variables.html#Local-Register-Variables


If I do this it seems to work, but feels a little dicey:

	asm ("" : "=r" (r1));
	sp = r1 & (THREAD_SIZE - 1);


Generated code looks OK ish:

clang:

        sp = r1 & (THREAD_SIZE - 1);
    22e0:       a0 04 24 78     clrldi  r4,r1,50
        if (unlikely(sp < 2048)) {
    22e4:       ff 07 24 28     cmpldi  r4,2047
    22e8:       58 00 81 40     ble     2340 <do_IRQ+0xe0>


gcc:
	if (unlikely(sp < 2048)) {
    2eb4:	00 38 28 70 	andi.   r8,r1,14336
...
    2ecc:	24 00 82 40 	bne     c000000000002ef0 <do_IRQ+0xa0>


cheers
