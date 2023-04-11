Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B08846DD921
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 13:14:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PwjsW40Bpz3ccg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 21:14:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pwjs231tjz3bfk
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 21:13:57 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 587DED75;
	Tue, 11 Apr 2023 04:14:10 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.20.166])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57B213F6C4;
	Tue, 11 Apr 2023 04:13:24 -0700 (PDT)
Date: Tue, 11 Apr 2023 12:13:21 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Uros Bizjak <ubizjak@gmail.com>
Subject: Re: [PATCH v2 2/5] locking/generic: Wire up local{,64}_try_cmpxchg
Message-ID: <ZDVA0a6QHaONg8AL@FVFF77S0Q05N>
References: <20230405141710.3551-1-ubizjak@gmail.com>
 <20230405141710.3551-3-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405141710.3551-3-ubizjak@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, loongarch@lists.linux.dev, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 05, 2023 at 04:17:07PM +0200, Uros Bizjak wrote:
> Implement generic support for local{,64}_try_cmpxchg.
> 
> Redirect to the atomic_ family of functions when the target
> does not provide its own local.h definitions.
> 
> For 64-bit targets, implement local64_try_cmpxchg and
> local64_cmpxchg using typed C wrappers that call local_
> family of functions and provide additional checking
> of their input arguments.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  include/asm-generic/local.h   |  1 +
>  include/asm-generic/local64.h | 12 +++++++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/include/asm-generic/local.h b/include/asm-generic/local.h
> index fca7f1d84818..7f97018df66f 100644
> --- a/include/asm-generic/local.h
> +++ b/include/asm-generic/local.h
> @@ -42,6 +42,7 @@ typedef struct
>  #define local_inc_return(l) atomic_long_inc_return(&(l)->a)
>  
>  #define local_cmpxchg(l, o, n) atomic_long_cmpxchg((&(l)->a), (o), (n))
> +#define local_try_cmpxchg(l, po, n) atomic_long_try_cmpxchg((&(l)->a), (po), (n))
>  #define local_xchg(l, n) atomic_long_xchg((&(l)->a), (n))
>  #define local_add_unless(l, _a, u) atomic_long_add_unless((&(l)->a), (_a), (u))
>  #define local_inc_not_zero(l) atomic_long_inc_not_zero(&(l)->a)
> diff --git a/include/asm-generic/local64.h b/include/asm-generic/local64.h
> index 765be0b7d883..14963a7a6253 100644
> --- a/include/asm-generic/local64.h
> +++ b/include/asm-generic/local64.h
> @@ -42,7 +42,16 @@ typedef struct {
>  #define local64_sub_return(i, l) local_sub_return((i), (&(l)->a))
>  #define local64_inc_return(l)	local_inc_return(&(l)->a)
>  
> -#define local64_cmpxchg(l, o, n) local_cmpxchg((&(l)->a), (o), (n))
> +static inline s64 local64_cmpxchg(local64_t *l, s64 old, s64 new)
> +{
> +	return local_cmpxchg(&l->a, old, new);
> +}
> +
> +static inline bool local64_try_cmpxchg(local64_t *l, s64 *old, s64 new)
> +{
> +	return local_try_cmpxchg(&l->a, (long *)old, new);
> +}
> +
>  #define local64_xchg(l, n)	local_xchg((&(l)->a), (n))
>  #define local64_add_unless(l, _a, u) local_add_unless((&(l)->a), (_a), (u))
>  #define local64_inc_not_zero(l)	local_inc_not_zero(&(l)->a)
> @@ -81,6 +90,7 @@ typedef struct {
>  #define local64_inc_return(l)	atomic64_inc_return(&(l)->a)
>  
>  #define local64_cmpxchg(l, o, n) atomic64_cmpxchg((&(l)->a), (o), (n))
> +#define local64_try_cmpxchg(l, po, n) atomic64_try_cmpxchg((&(l)->a), (po), (n))
>  #define local64_xchg(l, n)	atomic64_xchg((&(l)->a), (n))
>  #define local64_add_unless(l, _a, u) atomic64_add_unless((&(l)->a), (_a), (u))
>  #define local64_inc_not_zero(l)	atomic64_inc_not_zero(&(l)->a)
> -- 
> 2.39.2
> 
