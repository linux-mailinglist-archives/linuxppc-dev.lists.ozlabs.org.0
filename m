Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA93E131D74
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 03:07:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47sG3K6XrwzDqW9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jan 2020 13:07:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47sG1P5j7qzDqT7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jan 2020 13:05:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="Tfyl7hLY"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47sG1K0wb1z9sPK;
 Tue,  7 Jan 2020 13:05:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1578362729;
 bh=pY6TIy9SR4tEyAS0HbPqGRNPZ2UwwqiyR4Kh28zeFFI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Tfyl7hLYmcqDio6TzmoNX4eEpU/VH1XedfybafyjFJyg/jxoC61dMnx7t5GnDfrfJ
 Gr7//aHjlvnqj55C8bvTjCcqWFo+aSO1NPh7AsQPq5aFEIKTLm7yKV6qDAcnALHt8h
 A7VXpu10GywS0S7g2Qj47S6T+C/eV1wQThf24GFD1DUv7X4l/x0a3RumaFeZnoadMp
 qF7E7AAViYFuxl4ze6gkiOSgHcYuV3D520w4SgqTIh/zS3g1JU6Nt9kTdkUmsq7nrn
 jzPazOZziHv4zPXU98iZXPnck+e4y7P+Z84onVCXahK4jbpT70RvV1V6lSPbpikXa9
 V694qnRtkDCZA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Arnd Bergmann <arnd@arndb.de>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Subject: Re: [PATCH v3 02/22] compat: provide compat_ptr() on all architectures
In-Reply-To: <20200102145552.1853992-3-arnd@arndb.de>
References: <20200102145552.1853992-1-arnd@arndb.de>
 <20200102145552.1853992-3-arnd@arndb.de>
Date: Tue, 07 Jan 2020 13:05:22 +1100
Message-ID: <87woa410nx.fsf@mpe.ellerman.id.au>
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
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Paul Burton <paulburton@kernel.org>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, oprofile-list@lists.sf.net,
 Catalin Marinas <catalin.marinas@arm.com>, James Hogan <jhogan@kernel.org>,
 Robert Richter <rric@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnd Bergmann <arnd@arndb.de> writes:
> In order to avoid needless #ifdef CONFIG_COMPAT checks,
> move the compat_ptr() definition to linux/compat.h
> where it can be seen by any file regardless of the
> architecture.
>
> Only s390 needs a special definition, this can use the
> self-#define trick we have elsewhere.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm64/include/asm/compat.h   | 17 -----------------
>  arch/mips/include/asm/compat.h    | 18 ------------------
>  arch/parisc/include/asm/compat.h  | 17 -----------------
>  arch/powerpc/include/asm/compat.h | 17 -----------------
>  arch/powerpc/oprofile/backtrace.c |  2 +-

LGTM.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

One minor comment:

> diff --git a/include/linux/compat.h b/include/linux/compat.h
> index 68f79d855c3d..11083d84eb23 100644
> --- a/include/linux/compat.h
> +++ b/include/linux/compat.h
> @@ -958,4 +958,22 @@ static inline bool in_compat_syscall(void) { return false; }
>  
>  #endif /* CONFIG_COMPAT */
>  
> +/*
> + * A pointer passed in from user mode. This should not
> + * be used for syscall parameters, just declare them
> + * as pointers because the syscall entry code will have
> + * appropriately converted them already.
> + */
> +#ifndef compat_ptr
> +static inline void __user *compat_ptr(compat_uptr_t uptr)
> +{
> +	return (void __user *)(unsigned long)uptr;
> +}
> +#endif
> +
> +static inline compat_uptr_t ptr_to_compat(void __user *uptr)
> +{
> +	return (u32)(unsigned long)uptr;
> +}

Is there a reason we cast to u32 directly instead of using compat_uptr_t?

cheers
