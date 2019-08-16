Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E26901DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 14:43:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4692zh2zsbzDqRx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 22:43:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4692pv66Z4zDrYy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 22:35:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4692pt0K9tz9sML;
 Fri, 16 Aug 2019 22:35:34 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/futex: fix warning: 'oldval' may be used
 uninitialized in this function
In-Reply-To: <86b72f0c134367b214910b27b9a6dd3321af93bb.1565774657.git.christophe.leroy@c-s.fr>
References: <86b72f0c134367b214910b27b9a6dd3321af93bb.1565774657.git.christophe.leroy@c-s.fr>
Date: Fri, 16 Aug 2019 22:35:31 +1000
Message-ID: <878srt70fg.fsf@concordia.ellerman.id.au>
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
>   CC      kernel/futex.o
> kernel/futex.c: In function 'do_futex':
> kernel/futex.c:1676:17: warning: 'oldval' may be used uninitialized in this function [-Wmaybe-uninitialized]
>    return oldval == cmparg;
>                  ^
> kernel/futex.c:1651:6: note: 'oldval' was declared here
>   int oldval, ret;
>       ^
>
> This is because arch_futex_atomic_op_inuser() only sets *oval
> if ret is NUL and GCC doesn't see that it will use it only when

I prefer 0 to "NUL", as ret is an int. I'll reword it. But otherwise
this looks OK.

cheers

> ret is NUL.
>
> Anyway, the non-NUL ret path is an error path that won't suffer from
> setting *oval, and as *oval is a local var in futex_atomic_op_inuser()
> it will have no impact.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/include/asm/futex.h | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/futex.h b/arch/powerpc/include/asm/futex.h
> index 3a6aa57b9d90..eea28ca679db 100644
> --- a/arch/powerpc/include/asm/futex.h
> +++ b/arch/powerpc/include/asm/futex.h
> @@ -60,8 +60,7 @@ static inline int arch_futex_atomic_op_inuser(int op, int oparg, int *oval,
>  
>  	pagefault_enable();
>  
> -	if (!ret)
> -		*oval = oldval;
> +	*oval = oldval;
>  
>  	prevent_write_to_user(uaddr, sizeof(*uaddr));
>  	return ret;
> -- 
> 2.13.3
