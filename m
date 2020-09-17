Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C0C26DBA2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 14:34:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bsby54yn7zDqcw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 22:34:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bsb4Y27GTzDqZX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 21:55:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=M0AuMmfN; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bsb4W64ffz9ryj;
 Thu, 17 Sep 2020 21:55:07 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1600343708;
 bh=fCZj5obSeQ0Pnfx7QT/+Bd2NhEwGjy1covQLImy2inM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=M0AuMmfNOc4Sj4HwQTeyWwU8R87iUeiYI16Mt2mqmT1v8mMuSYPJr+VnwbXwsaDO1
 RwoexPoAbMlS0r69j+UXjfqdfJ30qJfra9JHVQtj88QRmvrgc4tzccFkmRTdaorgHh
 lpAH1djxWDTphKNnCsGaRoM1ELZupeBx1lxfW326H2vh6Ll3CTkgIrjLfwAjveD6mK
 TIXNVlfS5igZS4eReH+W2lv4lSoR0T6GzD13rnc1pwcO229aw6kR40rDULn5LQ6/A9
 dcQAU1yC1wv1MnRGU0q4T/MB/xLh2HnsiB5V6rs+O3oDKwsQ+WqRkzqDP8836U/o9x
 NDSS+lmizEQuQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Tony Ambardar <tony.ambardar@gmail.com>
Subject: Re: [PATCH v2] powerpc: fix EDEADLOCK redefinition error in
 uapi/asm/errno.h
In-Reply-To: <20200917000757.1232850-1-Tony.Ambardar@gmail.com>
References: <20200916074214.995128-1-Tony.Ambardar@gmail.com>
 <20200917000757.1232850-1-Tony.Ambardar@gmail.com>
Date: Thu, 17 Sep 2020 21:55:04 +1000
Message-ID: <87363gpqhz.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, Tony Ambardar <Tony.Ambardar@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Rosen Penev <rosenp@gmail.com>,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[ Cc += linux-arch & Arnd ]

Hi Tony,

This looks OK to me, but I'm always a bit nervous about changes in uapi.
I've Cc'ed linux-arch and Arnd who look after the asm-generic headers,
which this is slightly related to, just in case.

One minor comment below.

Tony Ambardar <tony.ambardar@gmail.com> writes:
> A few archs like powerpc have different errno.h values for macros
> EDEADLOCK and EDEADLK. In code including both libc and linux versions of
> errno.h, this can result in multiple definitions of EDEADLOCK in the
> include chain. Definitions to the same value (e.g. seen with mips) do
> not raise warnings, but on powerpc there are redefinitions changing the
> value, which raise warnings and errors (if using "-Werror").
>
> Guard against these redefinitions to avoid build errors like the following,
> first seen cross-compiling libbpf v5.8.9 for powerpc using GCC 8.4.0 with
> musl 1.1.24:
>
>   In file included from ../../arch/powerpc/include/uapi/asm/errno.h:5,
>                    from ../../include/linux/err.h:8,
>                    from libbpf.c:29:
>   ../../include/uapi/asm-generic/errno.h:40: error: "EDEADLOCK" redefined [-Werror]
>    #define EDEADLOCK EDEADLK
>
>   In file included from toolchain-powerpc_8540_gcc-8.4.0_musl/include/errno.h:10,
>                    from libbpf.c:26:
>   toolchain-powerpc_8540_gcc-8.4.0_musl/include/bits/errno.h:58: note: this is the location of the previous definition
>    #define EDEADLOCK       58
>
>   cc1: all warnings being treated as errors
>
> Fixes: 95f28190aa01 ("tools include arch: Grab a copy of errno.h for arch's supported by perf")
> Fixes: c3617f72036c ("UAPI: (Scripted) Disintegrate arch/powerpc/include/asm")

I suspect that's not the right commit to tag. It just moved errno.h from
arch/powerpc/include/asm to arch/powerpc/include/uapi/asm. It's content
was almost identical, and entirely identical as far as EDEADLOCK was
concerned.

Prior to that the file lived in asm-powerpc/errno.h, eg:

$ git cat-file -p b8b572e1015f^:include/asm-powerpc/errno.h

Before that it was include/asm-ppc64/errno.h, content still the same.

To go back further we'd have to look at the historical git trees, which
is probably overkill. I'm pretty sure it's always had this problem.

So we should probably drop the Fixes tags and just Cc: stable, that
means please backport it as far back as possible.

cheers


> Reported-by: Rosen Penev <rosenp@gmail.com>
> Signed-off-by: Tony Ambardar <Tony.Ambardar@gmail.com>
> ---
> v1 -> v2:
>  * clean up commit description formatting
> ---
>  arch/powerpc/include/uapi/asm/errno.h       | 1 +
>  tools/arch/powerpc/include/uapi/asm/errno.h | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/powerpc/include/uapi/asm/errno.h b/arch/powerpc/include/uapi/asm/errno.h
> index cc79856896a1..4ba87de32be0 100644
> --- a/arch/powerpc/include/uapi/asm/errno.h
> +++ b/arch/powerpc/include/uapi/asm/errno.h
> @@ -2,6 +2,7 @@
>  #ifndef _ASM_POWERPC_ERRNO_H
>  #define _ASM_POWERPC_ERRNO_H
>  
> +#undef	EDEADLOCK
>  #include <asm-generic/errno.h>
>  
>  #undef	EDEADLOCK
> diff --git a/tools/arch/powerpc/include/uapi/asm/errno.h b/tools/arch/powerpc/include/uapi/asm/errno.h
> index cc79856896a1..4ba87de32be0 100644
> --- a/tools/arch/powerpc/include/uapi/asm/errno.h
> +++ b/tools/arch/powerpc/include/uapi/asm/errno.h
> @@ -2,6 +2,7 @@
>  #ifndef _ASM_POWERPC_ERRNO_H
>  #define _ASM_POWERPC_ERRNO_H
>  
> +#undef	EDEADLOCK
>  #include <asm-generic/errno.h>
>  
>  #undef	EDEADLOCK
> -- 
> 2.25.1
