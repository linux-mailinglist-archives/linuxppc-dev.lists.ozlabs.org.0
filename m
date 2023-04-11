Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA3C6DD901
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 13:11:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PwjpG05Ckz3ch5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 21:11:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pwjnl69rkz3bh5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 21:11:05 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D18F3D75;
	Tue, 11 Apr 2023 04:11:15 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.20.166])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90C313F6C4;
	Tue, 11 Apr 2023 04:10:29 -0700 (PDT)
Date: Tue, 11 Apr 2023 12:10:22 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Uros Bizjak <ubizjak@gmail.com>
Subject: Re: [PATCH v2 1/5] locking/atomic: Add generic
 try_cmpxchg{,64}_local support
Message-ID: <ZDVAHkkbxJOlKFzi@FVFF77S0Q05N>
References: <20230405141710.3551-1-ubizjak@gmail.com>
 <20230405141710.3551-2-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230405141710.3551-2-ubizjak@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, x86@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, loongarch@lists.linux.dev, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 05, 2023 at 04:17:06PM +0200, Uros Bizjak wrote:
> Add generic support for try_cmpxchg{,64}_local and their falbacks.
> 
> These provides the generic try_cmpxchg_local family of functions
> from the arch_ prefixed version, also adding explicit instrumentation.
> 
> Cc: Will Deacon <will@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  include/linux/atomic/atomic-arch-fallback.h | 24 ++++++++++++++++++++-
>  include/linux/atomic/atomic-instrumented.h  | 20 ++++++++++++++++-
>  scripts/atomic/gen-atomic-fallback.sh       |  4 ++++
>  scripts/atomic/gen-atomic-instrumented.sh   |  2 +-
>  4 files changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/atomic/atomic-arch-fallback.h b/include/linux/atomic/atomic-arch-fallback.h
> index 77bc5522e61c..36c92851cdee 100644
> --- a/include/linux/atomic/atomic-arch-fallback.h
> +++ b/include/linux/atomic/atomic-arch-fallback.h
> @@ -217,6 +217,28 @@
>  
>  #endif /* arch_try_cmpxchg64_relaxed */
>  
> +#ifndef arch_try_cmpxchg_local
> +#define arch_try_cmpxchg_local(_ptr, _oldp, _new) \
> +({ \
> +	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
> +	___r = arch_cmpxchg_local((_ptr), ___o, (_new)); \
> +	if (unlikely(___r != ___o)) \
> +		*___op = ___r; \
> +	likely(___r == ___o); \
> +})
> +#endif /* arch_try_cmpxchg_local */
> +
> +#ifndef arch_try_cmpxchg64_local
> +#define arch_try_cmpxchg64_local(_ptr, _oldp, _new) \
> +({ \
> +	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
> +	___r = arch_cmpxchg64_local((_ptr), ___o, (_new)); \
> +	if (unlikely(___r != ___o)) \
> +		*___op = ___r; \
> +	likely(___r == ___o); \
> +})
> +#endif /* arch_try_cmpxchg64_local */
> +
>  #ifndef arch_atomic_read_acquire
>  static __always_inline int
>  arch_atomic_read_acquire(const atomic_t *v)
> @@ -2456,4 +2478,4 @@ arch_atomic64_dec_if_positive(atomic64_t *v)
>  #endif
>  
>  #endif /* _LINUX_ATOMIC_FALLBACK_H */
> -// b5e87bdd5ede61470c29f7a7e4de781af3770f09
> +// 1f49bd4895a4b7a5383906649027205c52ec80ab
> diff --git a/include/linux/atomic/atomic-instrumented.h b/include/linux/atomic/atomic-instrumented.h
> index 7a139ec030b0..14a9212cc987 100644
> --- a/include/linux/atomic/atomic-instrumented.h
> +++ b/include/linux/atomic/atomic-instrumented.h
> @@ -2066,6 +2066,24 @@ atomic_long_dec_if_positive(atomic_long_t *v)
>  	arch_sync_cmpxchg(__ai_ptr, __VA_ARGS__); \
>  })
>  
> +#define try_cmpxchg_local(ptr, oldp, ...) \
> +({ \
> +	typeof(ptr) __ai_ptr = (ptr); \
> +	typeof(oldp) __ai_oldp = (oldp); \
> +	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
> +	instrument_atomic_write(__ai_oldp, sizeof(*__ai_oldp)); \
> +	arch_try_cmpxchg_local(__ai_ptr, __ai_oldp, __VA_ARGS__); \
> +})
> +
> +#define try_cmpxchg64_local(ptr, oldp, ...) \
> +({ \
> +	typeof(ptr) __ai_ptr = (ptr); \
> +	typeof(oldp) __ai_oldp = (oldp); \
> +	instrument_atomic_write(__ai_ptr, sizeof(*__ai_ptr)); \
> +	instrument_atomic_write(__ai_oldp, sizeof(*__ai_oldp)); \
> +	arch_try_cmpxchg64_local(__ai_ptr, __ai_oldp, __VA_ARGS__); \
> +})
> +
>  #define cmpxchg_double(ptr, ...) \
>  ({ \
>  	typeof(ptr) __ai_ptr = (ptr); \
> @@ -2083,4 +2101,4 @@ atomic_long_dec_if_positive(atomic_long_t *v)
>  })
>  
>  #endif /* _LINUX_ATOMIC_INSTRUMENTED_H */
> -// 764f741eb77a7ad565dc8d99ce2837d5542e8aee
> +// 456e206c7e4e681126c482e4edcc6f46921ac731
> diff --git a/scripts/atomic/gen-atomic-fallback.sh b/scripts/atomic/gen-atomic-fallback.sh
> index 3a07695e3c89..6e853f0dad8d 100755
> --- a/scripts/atomic/gen-atomic-fallback.sh
> +++ b/scripts/atomic/gen-atomic-fallback.sh
> @@ -225,6 +225,10 @@ for cmpxchg in "cmpxchg" "cmpxchg64"; do
>  	gen_try_cmpxchg_fallbacks "${cmpxchg}"
>  done
>  
> +for cmpxchg in "cmpxchg_local" "cmpxchg64_local"; do
> +	gen_try_cmpxchg_fallback "${cmpxchg}" ""
> +done
> +
>  grep '^[a-z]' "$1" | while read name meta args; do
>  	gen_proto "${meta}" "${name}" "atomic" "int" ${args}
>  done
> diff --git a/scripts/atomic/gen-atomic-instrumented.sh b/scripts/atomic/gen-atomic-instrumented.sh
> index 77c06526a574..c8165e9431bf 100755
> --- a/scripts/atomic/gen-atomic-instrumented.sh
> +++ b/scripts/atomic/gen-atomic-instrumented.sh
> @@ -173,7 +173,7 @@ for xchg in "xchg" "cmpxchg" "cmpxchg64" "try_cmpxchg" "try_cmpxchg64"; do
>  	done
>  done
>  
> -for xchg in "cmpxchg_local" "cmpxchg64_local" "sync_cmpxchg"; do
> +for xchg in "cmpxchg_local" "cmpxchg64_local" "sync_cmpxchg" "try_cmpxchg_local" "try_cmpxchg64_local" ; do
>  	gen_xchg "${xchg}" "" ""
>  	printf "\n"
>  done
> -- 
> 2.39.2
> 
