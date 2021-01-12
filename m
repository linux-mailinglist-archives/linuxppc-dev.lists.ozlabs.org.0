Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC532F2458
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 02:15:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFCL31GhszDqyP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 12:15:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFCHy22xWzDqlh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jan 2021 12:13:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=YRh6ZWH6; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DFCHq17dGz9sVb;
 Tue, 12 Jan 2021 12:13:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1610413996;
 bh=S/7jgyEMX8jCF5ztHgwvPqBfJNWba57wkdKj3Nr9QCw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=YRh6ZWH6YuZrrwd6OqvvWNWIDNFe6gjRx+RhHgekSnr4iTmcRETBtNN8OY4l1RGWu
 PGaXOw/talGTPXbsb/6uL4tKQl63WmMdSvx5Zs3I3QFcTmSZi5mFKi1B2hV58SSXR6
 wP1OhqQbVEXK5K2EVjzZCJlh+BZeYfGx78I1auMbIwwrVVCccgg10AQpUF9Iexmy0+
 Pen36dQldkfejeM7Q4zdsef9R+hRcKAZOvbkVxoEWDIuSOWm71uWWDk5nzlqOMmd5G
 BprOb35vsULgTcFLTQmvQHW2p4Lx77kTryrgK1mr+ao88v54ZOaE25HWgksJA7BFP5
 KJqyZAIc5YzRw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, schwab@linux-m68k.org
Subject: Re: [PATCH v2] powerpc/vdso: fix clock_gettime_fallback for vdso32
In-Reply-To: <77cb8f5e668a2f6e00ea6e90d5f4f37763957b5b.1610383963.git.christophe.leroy@csgroup.eu>
References: <77cb8f5e668a2f6e00ea6e90d5f4f37763957b5b.1610383963.git.christophe.leroy@csgroup.eu>
Date: Tue, 12 Jan 2021 12:13:06 +1100
Message-ID: <87v9c3j6u5.fsf@mpe.ellerman.id.au>
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

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> From: Andreas Schwab <schwab@linux-m68k.org>
>
> The second argument of __kernel_clock_gettime64 points to a struct
> __kernel_timespec, with 64-bit time_t, so use the clock_gettime64 syscall
> in the fallback function for the 32-bit vdso.  Similarily,
> clock_getres_fallback should use the clock_getres_time64 syscall, though
> it isn't yet called from the 32-bit vdso.
>
> Signed-off-by: Andreas Schwab <schwab@linux-m68k.org>
> [chleroy: Moved into the #ifdef CONFIG_VDSO32 block]

That doesn't build for 64-bit with compat VDSO. Should I just take
Andreas' version, or do you want to send a v3?

cheers

> Fixes: d0e3fc69d00d ("powerpc/vdso: Provide __kernel_clock_gettime64() on vdso32")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/vdso/gettimeofday.h | 27 +++++++++++++++-----
>  1 file changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
> index 7a215cc5da77..3ecddd9c6302 100644
> --- a/arch/powerpc/include/asm/vdso/gettimeofday.h
> +++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
> @@ -102,22 +102,22 @@ int gettimeofday_fallback(struct __kernel_old_timeval *_tv, struct timezone *_tz
>  	return do_syscall_2(__NR_gettimeofday, (unsigned long)_tv, (unsigned long)_tz);
>  }
>  
> +#ifdef CONFIG_VDSO32
> +
> +#define BUILD_VDSO32		1
> +
>  static __always_inline
>  int clock_gettime_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
>  {
> -	return do_syscall_2(__NR_clock_gettime, _clkid, (unsigned long)_ts);
> +	return do_syscall_2(__NR_clock_gettime64, _clkid, (unsigned long)_ts);
>  }
>  
>  static __always_inline
>  int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
>  {
> -	return do_syscall_2(__NR_clock_getres, _clkid, (unsigned long)_ts);
> +	return do_syscall_2(__NR_clock_getres_time64, _clkid, (unsigned long)_ts);
>  }
>  
> -#ifdef CONFIG_VDSO32
> -
> -#define BUILD_VDSO32		1
> -
>  static __always_inline
>  int clock_gettime32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
>  {
> @@ -129,6 +129,21 @@ int clock_getres32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
>  {
>  	return do_syscall_2(__NR_clock_getres, _clkid, (unsigned long)_ts);
>  }
> +
> +#else
> +
> +static __always_inline
> +int clock_gettime_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
> +{
> +	return do_syscall_2(__NR_clock_gettime, _clkid, (unsigned long)_ts);
> +}
> +
> +static __always_inline
> +int clock_getres_fallback(clockid_t _clkid, struct __kernel_timespec *_ts)
> +{
> +	return do_syscall_2(__NR_clock_getres, _clkid, (unsigned long)_ts);
> +}
> +
>  #endif
>  
>  static __always_inline u64 __arch_get_hw_counter(s32 clock_mode,
> -- 
> 2.25.0
