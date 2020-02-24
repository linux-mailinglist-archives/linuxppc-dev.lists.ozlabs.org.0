Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CCC16A44E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 11:50:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48QzNj63dyzDqVs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2020 21:50:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48QzLk38ckzDqV6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2020 21:48:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=VxO9///u; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48QzLj0yR2z9sP7;
 Mon, 24 Feb 2020 21:48:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1582541309;
 bh=706Vp/HHmo+lrWjl+3TUImaROxTZwoAKGRpck8URTZ0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=VxO9///uot9PqW/pBL7CbpvXKurwqJJXDD+1rHaEkqYGJbz4JApxRwSgEaG9JgiqY
 MSCgqTqNjbWiX6c2l99XfmIGaQNylMpN1+ZkxmymBClnJPLLnJD9K7G88fx4+ZfF0y
 ioriFn8/lOj7U6uP6L/mIsS2lTjetKpbH++Odf0j0sNcP4KV4CcQFsJniBZ1it730B
 eIjaSQcPF6HJrEasbl825N2kn5tFd//X4L/YOjr4vi1DuxJhSx1KZ82piqRDLrdSMz
 ZhbII0tBnxb80mqFiTlA/Uv1d5iuYPxemFVFdzdX7ANLmAmeTzi8K6WhZ9k5st/eLe
 RWCUH81LjTiAA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, mikey@neuling.org
Subject: Re: [RFC PATCH v2 02/12] powerpc/ptrace: drop unnecessary #ifdefs
 CONFIG_PPC64
In-Reply-To: <34af3942cd27f6b5365caae772fb8e0af44763d5.1561735587.git.christophe.leroy@c-s.fr>
References: <cover.1561735587.git.christophe.leroy@c-s.fr>
 <34af3942cd27f6b5365caae772fb8e0af44763d5.1561735587.git.christophe.leroy@c-s.fr>
Date: Mon, 24 Feb 2020 21:48:26 +1100
Message-ID: <878sks1csl.fsf@mpe.ellerman.id.au>
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
> Drop a bunch of #ifdefs CONFIG_PPC64 that are not vital.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> ---
>  arch/powerpc/include/asm/ptrace.h      |  9 ++++-----
>  arch/powerpc/include/uapi/asm/ptrace.h | 12 ++++--------
>  arch/powerpc/kernel/ptrace/ptrace.c    | 24 +++---------------------
>  3 files changed, 11 insertions(+), 34 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
> index faa5a338ac5a..1506a9c61d50 100644
> --- a/arch/powerpc/include/asm/ptrace.h
> +++ b/arch/powerpc/include/asm/ptrace.h
> @@ -36,11 +36,10 @@ struct pt_regs
>  			unsigned long link;
>  			unsigned long xer;
>  			unsigned long ccr;
> -#ifdef CONFIG_PPC64
> -			unsigned long softe;
> -#else
> -			unsigned long mq;
> -#endif
> +			union {
> +				unsigned long softe;
> +				unsigned long mq;
> +			};
>  			unsigned long trap;
>  			unsigned long dar;
>  			unsigned long dsisr;
> diff --git a/arch/powerpc/include/uapi/asm/ptrace.h b/arch/powerpc/include/uapi/asm/ptrace.h
> index f5f1ccc740fc..37d7befbb8dc 100644
> --- a/arch/powerpc/include/uapi/asm/ptrace.h
> +++ b/arch/powerpc/include/uapi/asm/ptrace.h
> @@ -43,12 +43,11 @@ struct pt_regs
>  	unsigned long link;
>  	unsigned long xer;
>  	unsigned long ccr;
> -#ifdef __powerpc64__
> -	unsigned long softe;		/* Soft enabled/disabled */
> -#else
> -	unsigned long mq;		/* 601 only (not used at present) */
> +	union {
> +		unsigned long softe;	/* Soft enabled/disabled */
> +		unsigned long mq;	/* 601 only (not used at present) */
>  					/* Used on APUS to hold IPL value. */
> -#endif
> +	};

As Andreas pointed out this is not safe as this is a uapi header.

>  	unsigned long trap;		/* Reason for being here */
>  	/* N.B. for critical exceptions on 4xx, the dar and dsisr
>  	   fields are overloaded to hold srr0 and srr1. */
> @@ -105,11 +104,8 @@ struct pt_regs
>  #define PT_LNK	36
>  #define PT_XER	37
>  #define PT_CCR	38
> -#ifndef __powerpc64__
>  #define PT_MQ	39
> -#else
>  #define PT_SOFTE 39
> -#endif

I'd also rather leave that as it is.

There's a slim chance it could break some code that already has either
of those defined.

If you need them both defined to make other code work in the kernel
that's fine, in the kernel header we can do:

// Ensure these are always defined inside the kernel to avoid #ifdefs
#ifdef CONFIG_PPC64
#define PT_MQ	39
#else
#define PT_SOFTE 39
#endif


>  #define PT_TRAP	40
>  #define PT_DAR	41
>  #define PT_DSISR 42
> diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
> index 684b0b315c32..0afb223c4d57 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace.c
> @@ -113,11 +113,8 @@ static const struct pt_regs_offset regoffset_table[] = {
>  	REG_OFFSET_NAME(link),
>  	REG_OFFSET_NAME(xer),
>  	REG_OFFSET_NAME(ccr),
> -#ifdef CONFIG_PPC64
>  	REG_OFFSET_NAME(softe),
> -#else
>  	REG_OFFSET_NAME(mq),
> -#endif

Pretty sure that will cause breakage. The offset is ABI.


cheers

