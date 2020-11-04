Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7A22A616F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 11:23:56 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CR2n50Vl8zDqbv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 21:23:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CR2lc0nT2zDqWf
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 21:22:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=oDkd83Ut; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CR2lS6ZW8z9sTL;
 Wed,  4 Nov 2020 21:22:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1604485355;
 bh=L70AG7tzTd7Z55u+Fj8DTKuCWP9ecgUCCOxcamNMHIs=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=oDkd83UtH0Srm5gou9o8FbK7V4IaynA9LCA2YJKhl+5lUnI+xkZjuVD5VI7pJ+a2M
 HfsMI0MoloEkD3kwT+0vUtyCVb5PM2a9WPF6rkPmZB+9idXkIb7EMvyH3VOFzyp/Ps
 68txSVLNJRowCRuykY+i+5Ewg7c/SwxbVOrNc5RWW00H/82L7EDvL4Qy2KV2oBLDUb
 2yVheHA/7sjVh0E3O3cAIx/q6Zcp5FGUuuzsq1Mfee0O7JtPXB0z7fnfD69DrTlxhD
 Ug36BFsOA8q9k55mb81BwQUF1fU4SM3xLLRlc5FTkEqiwDPXMtmP7ZL6xkIZIdCtj0
 qdybn2J+0q8JQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: YiFei Zhu <zhuyifei1999@gmail.com>, containers@lists.linux-foundation.org
Subject: Re: [PATCH seccomp 3/8] powerpc: Enable seccomp architecture tracking
In-Reply-To: <4ec2970fcc819eb4d5dac2bd35233ccdadfda845.1604410035.git.yifeifz2@illinois.edu>
References: <cover.1604410035.git.yifeifz2@illinois.edu>
 <4ec2970fcc819eb4d5dac2bd35233ccdadfda845.1604410035.git.yifeifz2@illinois.edu>
Date: Wed, 04 Nov 2020 21:22:28 +1100
Message-ID: <87wnz1to9n.fsf@mpe.ellerman.id.au>
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
Cc: linux-sh@vger.kernel.org, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Jack Chen <jianyan2@illinois.edu>,
 linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, YiFei Zhu <yifeifz2@illinois.edu>,
 linux-csky@vger.kernel.org, Tianyin Xu <tyxu@illinois.edu>,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, Valentin Rothberg <vrothber@redhat.com>,
 Aleksa Sarai <cyphar@cyphar.com>, Josep Torrellas <torrella@illinois.edu>,
 Will Drewry <wad@chromium.org>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
 Dimitrios Skarlatos <dskarlat@cs.cmu.edu>,
 David Laight <David.Laight@aculab.com>,
 Giuseppe Scrivano <gscrivan@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Tycho Andersen <tycho@tycho.pizza>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

YiFei Zhu <zhuyifei1999@gmail.com> writes:
> From: YiFei Zhu <yifeifz2@illinois.edu>
>
> To enable seccomp constant action bitmaps, we need to have a static
> mapping to the audit architecture and system call table size. Add these
> for powerpc.
>
> Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
> ---
>  arch/powerpc/include/asm/seccomp.h | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/seccomp.h b/arch/powerpc/include/asm/seccomp.h
> index 51209f6071c5..3efcc83e9cc6 100644
> --- a/arch/powerpc/include/asm/seccomp.h
> +++ b/arch/powerpc/include/asm/seccomp.h
> @@ -8,4 +8,25 @@
>  
>  #include <asm-generic/seccomp.h>
>  
> +#ifdef __LITTLE_ENDIAN__

As Kees mentioned this should (must?!) match the configured endian.

But I think it would still be better to use the CONFIG symbol, which is
CONFIG_CPU_LITTLE_ENDIAN.

> +#define __SECCOMP_ARCH_LE_BIT		__AUDIT_ARCH_LE
> +#else
> +#define __SECCOMP_ARCH_LE_BIT		0
> +#endif
> +
> +#ifdef CONFIG_PPC64
> +# define SECCOMP_ARCH_NATIVE		(AUDIT_ARCH_PPC64 | __SECCOMP_ARCH_LE)

You use __SECCOMP_ARCH_LE there, but previously you only defined
__SECCOMP_ARCH_LE_BIT.

Is there some magic somewhere that defines __SECCOMP_ARCH_LE based on
__SECCOMP_ARCH_LE_BIT ?

> +# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
> +# define SECCOMP_ARCH_NATIVE_NAME	"ppc64"

What's the name used for?

Usually we use "ppc64" for 64-bit big endian and "ppc64le" for 64-bit
little endian.

> +# ifdef CONFIG_COMPAT
> +#  define SECCOMP_ARCH_COMPAT		(AUDIT_ARCH_PPC | __SECCOMP_ARCH_LE)
> +#  define SECCOMP_ARCH_COMPAT_NR	NR_syscalls
> +#  define SECCOMP_ARCH_COMPAT_NAME	"powerpc"

And usually we use "ppc" for 32-bit.

> +# endif
> +#else /* !CONFIG_PPC64 */
> +# define SECCOMP_ARCH_NATIVE		(AUDIT_ARCH_PPC | __SECCOMP_ARCH_LE)
> +# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
> +# define SECCOMP_ARCH_NATIVE_NAME	"powerpc"
> +#endif
> +
>  #endif	/* _ASM_POWERPC_SECCOMP_H */
> -- 
> 2.29.2


cheers
