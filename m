Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B5D6C7FA1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 15:14:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjkjT5WSGz3fRl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 01:14:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pjkhx3qlwz3f8S
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 01:13:50 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A1AF11FB;
	Fri, 24 Mar 2023 07:14:02 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.55.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 367B43F71E;
	Fri, 24 Mar 2023 07:13:16 -0700 (PDT)
Date: Fri, 24 Mar 2023 14:13:13 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Uros Bizjak <ubizjak@gmail.com>
Subject: Re: [PATCH 01/10] locking/atomic: Add missing cast to try_cmpxchg()
 fallbacks
Message-ID: <ZB2v+avNt52ac/+w@FVFF77S0Q05N>
References: <20230305205628.27385-1-ubizjak@gmail.com>
 <20230305205628.27385-2-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230305205628.27385-2-ubizjak@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, loongarch@lists.linux.dev, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 05, 2023 at 09:56:19PM +0100, Uros Bizjak wrote:
> Cast _oldp to the type of _ptr to avoid incompatible-pointer-types warning.

Can you give an example of where we are passing an incompatible pointer?

That sounds indicative of a bug in the caller, but maybe I'm missing some
reason this is necessary due to some indirection.

> Fixes: 29f006fdefe6 ("asm-generic/atomic: Add try_cmpxchg() fallbacks")

I'm not sure that this needs a fixes tag. Does anything go wrong today, or only
later in this series?

Thanks,
Mark.

> Cc: Will Deacon <will@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> ---
>  include/linux/atomic/atomic-arch-fallback.h | 18 +++++++++---------
>  scripts/atomic/gen-atomic-fallback.sh       |  2 +-
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/atomic/atomic-arch-fallback.h b/include/linux/atomic/atomic-arch-fallback.h
> index 77bc5522e61c..19debd501ee7 100644
> --- a/include/linux/atomic/atomic-arch-fallback.h
> +++ b/include/linux/atomic/atomic-arch-fallback.h
> @@ -87,7 +87,7 @@
>  #ifndef arch_try_cmpxchg
>  #define arch_try_cmpxchg(_ptr, _oldp, _new) \
>  ({ \
> -	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
> +	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
>  	___r = arch_cmpxchg((_ptr), ___o, (_new)); \
>  	if (unlikely(___r != ___o)) \
>  		*___op = ___r; \
> @@ -98,7 +98,7 @@
>  #ifndef arch_try_cmpxchg_acquire
>  #define arch_try_cmpxchg_acquire(_ptr, _oldp, _new) \
>  ({ \
> -	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
> +	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
>  	___r = arch_cmpxchg_acquire((_ptr), ___o, (_new)); \
>  	if (unlikely(___r != ___o)) \
>  		*___op = ___r; \
> @@ -109,7 +109,7 @@
>  #ifndef arch_try_cmpxchg_release
>  #define arch_try_cmpxchg_release(_ptr, _oldp, _new) \
>  ({ \
> -	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
> +	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
>  	___r = arch_cmpxchg_release((_ptr), ___o, (_new)); \
>  	if (unlikely(___r != ___o)) \
>  		*___op = ___r; \
> @@ -120,7 +120,7 @@
>  #ifndef arch_try_cmpxchg_relaxed
>  #define arch_try_cmpxchg_relaxed(_ptr, _oldp, _new) \
>  ({ \
> -	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
> +	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
>  	___r = arch_cmpxchg_relaxed((_ptr), ___o, (_new)); \
>  	if (unlikely(___r != ___o)) \
>  		*___op = ___r; \
> @@ -157,7 +157,7 @@
>  #ifndef arch_try_cmpxchg64
>  #define arch_try_cmpxchg64(_ptr, _oldp, _new) \
>  ({ \
> -	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
> +	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
>  	___r = arch_cmpxchg64((_ptr), ___o, (_new)); \
>  	if (unlikely(___r != ___o)) \
>  		*___op = ___r; \
> @@ -168,7 +168,7 @@
>  #ifndef arch_try_cmpxchg64_acquire
>  #define arch_try_cmpxchg64_acquire(_ptr, _oldp, _new) \
>  ({ \
> -	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
> +	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
>  	___r = arch_cmpxchg64_acquire((_ptr), ___o, (_new)); \
>  	if (unlikely(___r != ___o)) \
>  		*___op = ___r; \
> @@ -179,7 +179,7 @@
>  #ifndef arch_try_cmpxchg64_release
>  #define arch_try_cmpxchg64_release(_ptr, _oldp, _new) \
>  ({ \
> -	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
> +	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
>  	___r = arch_cmpxchg64_release((_ptr), ___o, (_new)); \
>  	if (unlikely(___r != ___o)) \
>  		*___op = ___r; \
> @@ -190,7 +190,7 @@
>  #ifndef arch_try_cmpxchg64_relaxed
>  #define arch_try_cmpxchg64_relaxed(_ptr, _oldp, _new) \
>  ({ \
> -	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
> +	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
>  	___r = arch_cmpxchg64_relaxed((_ptr), ___o, (_new)); \
>  	if (unlikely(___r != ___o)) \
>  		*___op = ___r; \
> @@ -2456,4 +2456,4 @@ arch_atomic64_dec_if_positive(atomic64_t *v)
>  #endif
>  
>  #endif /* _LINUX_ATOMIC_FALLBACK_H */
> -// b5e87bdd5ede61470c29f7a7e4de781af3770f09
> +// 1b4d4c82ae653389cd1538d5b07170267d9b3837
> diff --git a/scripts/atomic/gen-atomic-fallback.sh b/scripts/atomic/gen-atomic-fallback.sh
> index 3a07695e3c89..39f447161108 100755
> --- a/scripts/atomic/gen-atomic-fallback.sh
> +++ b/scripts/atomic/gen-atomic-fallback.sh
> @@ -171,7 +171,7 @@ cat <<EOF
>  #ifndef arch_try_${cmpxchg}${order}
>  #define arch_try_${cmpxchg}${order}(_ptr, _oldp, _new) \\
>  ({ \\
> -	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \\
> +	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \\
>  	___r = arch_${cmpxchg}${order}((_ptr), ___o, (_new)); \\
>  	if (unlikely(___r != ___o)) \\
>  		*___op = ___r; \\
> -- 
> 2.39.2
> 
