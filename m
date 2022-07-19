Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8067D579CDB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 14:43:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnJRV3GlWz3dQr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 22:43:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnJR401vhz2xkW
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 22:43:25 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C41F153B;
	Tue, 19 Jul 2022 05:42:52 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.86.74])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7EFB23F766;
	Tue, 19 Jul 2022 05:42:49 -0700 (PDT)
Date: Tue, 19 Jul 2022 13:42:36 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2] random: handle archrandom in plural words
Message-ID: <YtamvPvl04ByTrVp@FVFF77S0Q05N>
References: <YtP1+MJ1tNdJA60l@zx2c4.com>
 <20220717200356.75060-1-Jason@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220717200356.75060-1-Jason@zx2c4.com>
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
Cc: linux-s390@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>, linuxppc-dev@lists.ozlabs.org, Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, Catalin Marinas <catalin.marinas@arm.com>, Harald Freudenberger <freude@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Borislav Petkov <bp@suse.de>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jul 17, 2022 at 10:03:56PM +0200, Jason A. Donenfeld wrote:
> The archrandom interface was originally designed for x86, which supplies
> RDRAND/RDSEED for receiving random words into registers, resulting in
> one function to generate an int and another to generate a long. However,
> other architectures don't follow this.
> 
> On arm64, the SMCCC TRNG interface can return between 1 and 3 words. On
> s390, the CPACF TRNG interface can return between 1 and 32 words for the
> same cost as for one word. On UML, the os_getrandom() interface can return
> arbitrary amounts.
> 
> So change the api signature to take a "words" parameter designating the
> maximum number of words requested, and then return the number of words
> generated.
> 
> Since callers need to check this return value and loop anyway, each arch
> implementation does not bother implementing its own loop to try again to
> fill the requested number of words. Additionally, all existing callers
> pass in a constant words parameter. Taken together, these two things
> mean that the codegen doesn't really change much for one-word-at-a-time
> platforms, while performance is greatly improved on platforms such as
> s390.
> 
> Cc: Will Deacon <will@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Borislav Petkov <bp@suse.de>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Johannes Berg <johannes@sipsolutions.net>
> Cc: Harald Freudenberger <freude@linux.ibm.com>
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
> ---
>  arch/arm64/include/asm/archrandom.h   | 102 ++++++++++++--------------
>  arch/arm64/kernel/kaslr.c             |   2 +-
>  arch/powerpc/include/asm/archrandom.h |  30 ++------
>  arch/powerpc/kvm/book3s_hv.c          |   2 +-
>  arch/s390/include/asm/archrandom.h    |  29 ++------
>  arch/um/include/asm/archrandom.h      |  21 ++----
>  arch/x86/include/asm/archrandom.h     |  41 +----------
>  arch/x86/kernel/espfix_64.c           |   2 +-
>  drivers/char/random.c                 |  45 ++++++++----
>  include/asm-generic/archrandom.h      |  18 +----
>  include/linux/random.h                |  12 +--
>  11 files changed, 116 insertions(+), 188 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/archrandom.h b/arch/arm64/include/asm/archrandom.h
> index c3b9fa56af67..7a24fdee3e2f 100644
> --- a/arch/arm64/include/asm/archrandom.h
> +++ b/arch/arm64/include/asm/archrandom.h
> @@ -58,7 +58,7 @@ static inline bool __arm64_rndrrs(unsigned long *v)
>  	return ok;
>  }
>  
> -static inline bool __must_check arch_get_random_long(unsigned long *v)
> +static inline size_t __must_check arch_get_random_words(unsigned long *v, size_t words)

As others have suggested, could we please s/words/longs/? That's a smaller
change from the existing name, and avoids amibugity were "word" has an
architecture-specific meaning. e.g. the ARM ARM (ARM DDI 0487G.b) defines:

	Word
	A 32-bit data item. Words are normally word-aligned in Arm systems.

>  {
>  	/*
>  	 * Only support the generic interface after we have detected
> @@ -66,27 +66,15 @@ static inline bool __must_check arch_get_random_long(unsigned long *v)
>  	 * cpufeature code and with potential scheduling between CPUs
>  	 * with and without the feature.
>  	 */
> -	if (cpus_have_const_cap(ARM64_HAS_RNG) && __arm64_rndr(v))
> -		return true;
> -	return false;
> +	if (words && cpus_have_const_cap(ARM64_HAS_RNG) && __arm64_rndr(v))
> +		return 1;
> +	return 0;
>  }
>  
> -static inline bool __must_check arch_get_random_int(unsigned int *v)
> +static inline size_t __must_check arch_get_random_seed_words(unsigned long *v, size_t words)

Likewise, s/words/longs/ woudl be clearer.

>  {
> -	if (cpus_have_const_cap(ARM64_HAS_RNG)) {
> -		unsigned long val;
> -
> -		if (__arm64_rndr(&val)) {
> -			*v = val;
> -			return true;
> -		}
> -	}
> -	return false;
> -}
> -
> -static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
> -{
> -	struct arm_smccc_res res;
> +	if (!words)
> +		return 0;
>  
>  	/*
>  	 * We prefer the SMCCC call, since its semantics (return actual
> @@ -95,10 +83,23 @@ static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
>  	 * (the output of a pseudo RNG freshly seeded by a TRNG).
>  	 */
>  	if (smccc_trng_available) {
> -		arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_RND64, 64, &res);
> +		struct arm_smccc_res res;
> +
> +		words = min_t(size_t, 3, words);
> +		arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_RND64, words * 64, &res);
>  		if ((int)res.a0 >= 0) {
> -			*v = res.a3;
> -			return true;
> +			switch (words) {
> +			case 3:
> +				*v++ = res.a1;
> +				fallthrough;
> +			case 2:
> +				*v++ = res.a2;
> +				fallthrough;
> +			case 1:
> +				*v++ = res.a3;
> +				break;
> +			}
> +			return words;
>  		}
>  	}
>  
> @@ -108,32 +109,9 @@ static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
>  	 * enough to implement this API if no other entropy source exists.
>  	 */
>  	if (cpus_have_const_cap(ARM64_HAS_RNG) && __arm64_rndrrs(v))
> -		return true;
> +		return 1;
>  
> -	return false;
> -}
> -
> -static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
> -{
> -	struct arm_smccc_res res;
> -	unsigned long val;
> -
> -	if (smccc_trng_available) {
> -		arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_RND64, 32, &res);
> -		if ((int)res.a0 >= 0) {
> -			*v = res.a3 & GENMASK(31, 0);
> -			return true;
> -		}
> -	}
> -
> -	if (cpus_have_const_cap(ARM64_HAS_RNG)) {
> -		if (__arm64_rndrrs(&val)) {
> -			*v = val;
> -			return true;
> -		}
> -	}
> -
> -	return false;
> +	return 0;
>  }
>  
>  static inline bool __init __early_cpu_has_rndr(void)
> @@ -143,26 +121,40 @@ static inline bool __init __early_cpu_has_rndr(void)
>  	return (ftr >> ID_AA64ISAR0_EL1_RNDR_SHIFT) & 0xf;
>  }
>  
> -static inline bool __init __must_check
> -arch_get_random_seed_long_early(unsigned long *v)
> +static inline size_t __init __must_check
> +arch_get_random_seed_words_early(unsigned long *v, size_t words)
>  {
>  	WARN_ON(system_state != SYSTEM_BOOTING);
>  
> +	if (!words)
> +		return 0;
> +
>  	if (smccc_trng_available) {
>  		struct arm_smccc_res res;
>  
> -		arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_RND64, 64, &res);
> +		words = min_t(size_t, 3, words);
> +		arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_RND64, words * 64, &res);
>  		if ((int)res.a0 >= 0) {
> -			*v = res.a3;
> -			return true;
> +			switch (words) {
> +			case 3:
> +				*v++ = res.a1;
> +				fallthrough;
> +			case 2:
> +				*v++ = res.a2;
> +				fallthrough;
> +			case 1:
> +				*v++ = res.a3;
> +				break;
> +			}
> +			return words;
>  		}
>  	}
>  
>  	if (__early_cpu_has_rndr() && __arm64_rndr(v))
> -		return true;
> +		return 1;
>  
> -	return false;
> +	return 0;
>  }
> -#define arch_get_random_seed_long_early arch_get_random_seed_long_early
> +#define arch_get_random_seed_words_early arch_get_random_seed_words_early
>  
>  #endif /* _ASM_ARCHRANDOM_H */
> diff --git a/arch/arm64/kernel/kaslr.c b/arch/arm64/kernel/kaslr.c
> index 418b2bba1521..ed77afe16121 100644
> --- a/arch/arm64/kernel/kaslr.c
> +++ b/arch/arm64/kernel/kaslr.c
> @@ -106,7 +106,7 @@ u64 __init kaslr_early_init(void)
>  	 * and supported.
>  	 */
>  
> -	if (arch_get_random_seed_long_early(&raw))
> +	if (arch_get_random_seed_words_early(&raw, 1))
>  		seed ^= raw;
>  
>  	if (!seed) {

FWIW, other than the naming nits, the arm64 bits look fine to me.

Mark.

> diff --git a/arch/powerpc/include/asm/archrandom.h b/arch/powerpc/include/asm/archrandom.h
> index 25ba65df6b1a..bf2182f80480 100644
> --- a/arch/powerpc/include/asm/archrandom.h
> +++ b/arch/powerpc/include/asm/archrandom.h
> @@ -4,34 +4,16 @@
>  
>  #include <asm/machdep.h>
>  
> -static inline bool __must_check arch_get_random_long(unsigned long *v)
> +static inline size_t __must_check arch_get_random_words(unsigned long *v, size_t words)
>  {
> -	return false;
> +	return 0;
>  }
>  
> -static inline bool __must_check arch_get_random_int(unsigned int *v)
> +static inline size_t __must_check arch_get_random_seed_words(unsigned long *v, size_t words)
>  {
> -	return false;
> -}
> -
> -static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
> -{
> -	if (ppc_md.get_random_seed)
> -		return ppc_md.get_random_seed(v);
> -
> -	return false;
> -}
> -
> -static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
> -{
> -	unsigned long val;
> -	bool rc;
> -
> -	rc = arch_get_random_seed_long(&val);
> -	if (rc)
> -		*v = val;
> -
> -	return rc;
> +	if (words && ppc_md.get_random_seed && ppc_md.get_random_seed(v))
> +		return 1;
> +	return 0;
>  }
>  
>  #ifdef CONFIG_PPC_POWERNV
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index e08fb3124dca..18b2d80996b6 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1207,7 +1207,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu *vcpu)
>  		break;
>  #endif
>  	case H_RANDOM:
> -		if (!arch_get_random_seed_long(&vcpu->arch.regs.gpr[4]))
> +		if (!arch_get_random_seed_words(&vcpu->arch.regs.gpr[4], 1))
>  			ret = H_HARDWARE;
>  		break;
>  	case H_RPT_INVALIDATE:
> diff --git a/arch/s390/include/asm/archrandom.h b/arch/s390/include/asm/archrandom.h
> index 0a1c2e66c709..29f1a9bc3867 100644
> --- a/arch/s390/include/asm/archrandom.h
> +++ b/arch/s390/include/asm/archrandom.h
> @@ -18,34 +18,19 @@
>  DECLARE_STATIC_KEY_FALSE(s390_arch_random_available);
>  extern atomic64_t s390_arch_random_counter;
>  
> -static inline bool __must_check arch_get_random_long(unsigned long *v)
> +static inline size_t __must_check arch_get_random_words(unsigned long *v, size_t words)
>  {
> -	return false;
> +	return 0;
>  }
>  
> -static inline bool __must_check arch_get_random_int(unsigned int *v)
> -{
> -	return false;
> -}
> -
> -static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
> -{
> -	if (static_branch_likely(&s390_arch_random_available)) {
> -		cpacf_trng(NULL, 0, (u8 *)v, sizeof(*v));
> -		atomic64_add(sizeof(*v), &s390_arch_random_counter);
> -		return true;
> -	}
> -	return false;
> -}
> -
> -static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
> +static inline size_t __must_check arch_get_random_seed_words(unsigned long *v, size_t words)
>  {
>  	if (static_branch_likely(&s390_arch_random_available)) {
> -		cpacf_trng(NULL, 0, (u8 *)v, sizeof(*v));
> -		atomic64_add(sizeof(*v), &s390_arch_random_counter);
> -		return true;
> +		cpacf_trng(NULL, 0, (u8 *)v, words * sizeof(*v));
> +		atomic64_add(words * sizeof(*v), &s390_arch_random_counter);
> +		return words;
>  	}
> -	return false;
> +	return 0;
>  }
>  
>  #endif /* _ASM_S390_ARCHRANDOM_H */
> diff --git a/arch/um/include/asm/archrandom.h b/arch/um/include/asm/archrandom.h
> index 2f24cb96391d..6bcbd47fcb62 100644
> --- a/arch/um/include/asm/archrandom.h
> +++ b/arch/um/include/asm/archrandom.h
> @@ -7,24 +7,19 @@
>  /* This is from <os.h>, but better not to #include that in a global header here. */
>  ssize_t os_getrandom(void *buf, size_t len, unsigned int flags);
>  
> -static inline bool __must_check arch_get_random_long(unsigned long *v)
> +static inline size_t __must_check arch_get_random_words(unsigned long *v, size_t words)
>  {
> -	return os_getrandom(v, sizeof(*v), 0) == sizeof(*v);
> -}
> +	ssize_t ret;
>  
> -static inline bool __must_check arch_get_random_int(unsigned int *v)
> -{
> -	return os_getrandom(v, sizeof(*v), 0) == sizeof(*v);
> -}
> -
> -static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
> -{
> -	return false;
> +	ret = os_getrandom(v, words * sizeof(*v), 0);
> +	if (ret < 0)
> +		return 0;
> +	return ret / sizeof(*v);
>  }
>  
> -static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
> +static inline size_t __must_check arch_get_random_seed_words(unsigned long *v, size_t words)
>  {
> -	return false;
> +	return 0;
>  }
>  
>  #endif
> diff --git a/arch/x86/include/asm/archrandom.h b/arch/x86/include/asm/archrandom.h
> index fb235b696175..a1717b81d876 100644
> --- a/arch/x86/include/asm/archrandom.h
> +++ b/arch/x86/include/asm/archrandom.h
> @@ -31,20 +31,6 @@ static inline bool __must_check rdrand_long(unsigned long *v)
>  	return false;
>  }
>  
> -static inline bool __must_check rdrand_int(unsigned int *v)
> -{
> -	bool ok;
> -	unsigned int retry = RDRAND_RETRY_LOOPS;
> -	do {
> -		asm volatile("rdrand %[out]"
> -			     CC_SET(c)
> -			     : CC_OUT(c) (ok), [out] "=r" (*v));
> -		if (ok)
> -			return true;
> -	} while (--retry);
> -	return false;
> -}
> -
>  static inline bool __must_check rdseed_long(unsigned long *v)
>  {
>  	bool ok;
> @@ -54,38 +40,19 @@ static inline bool __must_check rdseed_long(unsigned long *v)
>  	return ok;
>  }
>  
> -static inline bool __must_check rdseed_int(unsigned int *v)
> -{
> -	bool ok;
> -	asm volatile("rdseed %[out]"
> -		     CC_SET(c)
> -		     : CC_OUT(c) (ok), [out] "=r" (*v));
> -	return ok;
> -}
> -
>  /*
>   * These are the generic interfaces; they must not be declared if the
>   * stubs in <linux/random.h> are to be invoked.
>   */
>  
> -static inline bool __must_check arch_get_random_long(unsigned long *v)
> -{
> -	return static_cpu_has(X86_FEATURE_RDRAND) ? rdrand_long(v) : false;
> -}
> -
> -static inline bool __must_check arch_get_random_int(unsigned int *v)
> -{
> -	return static_cpu_has(X86_FEATURE_RDRAND) ? rdrand_int(v) : false;
> -}
> -
> -static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
> +static inline size_t __must_check arch_get_random_words(unsigned long *v, size_t words)
>  {
> -	return static_cpu_has(X86_FEATURE_RDSEED) ? rdseed_long(v) : false;
> +	return words && static_cpu_has(X86_FEATURE_RDRAND) && rdrand_long(v) ? 1 : 0;
>  }
>  
> -static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
> +static inline size_t __must_check arch_get_random_seed_words(unsigned long *v, size_t words)
>  {
> -	return static_cpu_has(X86_FEATURE_RDSEED) ? rdseed_int(v) : false;
> +	return words && static_cpu_has(X86_FEATURE_RDSEED) && rdseed_long(v) ? 1 : 0;
>  }
>  
>  #ifndef CONFIG_UML
> diff --git a/arch/x86/kernel/espfix_64.c b/arch/x86/kernel/espfix_64.c
> index 4fe7af58cfe1..f46c9ff3c0d4 100644
> --- a/arch/x86/kernel/espfix_64.c
> +++ b/arch/x86/kernel/espfix_64.c
> @@ -100,7 +100,7 @@ static void init_espfix_random(void)
>  	 * This is run before the entropy pools are initialized,
>  	 * but this is hopefully better than nothing.
>  	 */
> -	if (!arch_get_random_long(&rand)) {
> +	if (!arch_get_random_words(&rand, 1)) {
>  		/* The constant is an arbitrary large prime */
>  		rand = rdtsc();
>  		rand *= 0xc345c6b72fd16123UL;
> diff --git a/drivers/char/random.c b/drivers/char/random.c
> index 0c6568ae5f68..70d8d1d7e2d7 100644
> --- a/drivers/char/random.c
> +++ b/drivers/char/random.c
> @@ -596,12 +596,20 @@ static void extract_entropy(void *buf, size_t len)
>  		unsigned long rdseed[32 / sizeof(long)];
>  		size_t counter;
>  	} block;
> -	size_t i;
> +	size_t i, words;
>  
> -	for (i = 0; i < ARRAY_SIZE(block.rdseed); ++i) {
> -		if (!arch_get_random_seed_long(&block.rdseed[i]) &&
> -		    !arch_get_random_long(&block.rdseed[i]))
> -			block.rdseed[i] = random_get_entropy();
> +	for (i = 0; i < ARRAY_SIZE(block.rdseed);) {
> +		words = arch_get_random_seed_words(&block.rdseed[i], ARRAY_SIZE(block.rdseed) - i);
> +		if (words) {
> +			i += words;
> +			continue;
> +		}
> +		words = arch_get_random_words(&block.rdseed[i], ARRAY_SIZE(block.rdseed) - i);
> +		if (words) {
> +			i += words;
> +			continue;
> +		}
> +		block.rdseed[i++] = random_get_entropy();
>  	}
>  
>  	spin_lock_irqsave(&input_pool.lock, flags);
> @@ -776,22 +784,31 @@ static struct notifier_block pm_notifier = { .notifier_call = random_pm_notifica
>  int __init random_init(const char *command_line)
>  {
>  	ktime_t now = ktime_get_real();
> -	unsigned int i, arch_bits;
> -	unsigned long entropy;
> +	size_t i, words, arch_bits;
> +	unsigned long entropy[BLAKE2S_BLOCK_SIZE / sizeof(long)];
>  
>  #if defined(LATENT_ENTROPY_PLUGIN)
>  	static const u8 compiletime_seed[BLAKE2S_BLOCK_SIZE] __initconst __latent_entropy;
>  	_mix_pool_bytes(compiletime_seed, sizeof(compiletime_seed));
>  #endif
>  
> -	for (i = 0, arch_bits = BLAKE2S_BLOCK_SIZE * 8;
> -	     i < BLAKE2S_BLOCK_SIZE; i += sizeof(entropy)) {
> -		if (!arch_get_random_seed_long_early(&entropy) &&
> -		    !arch_get_random_long_early(&entropy)) {
> -			entropy = random_get_entropy();
> -			arch_bits -= sizeof(entropy) * 8;
> +	for (i = 0, arch_bits = sizeof(entropy) * 8; i < ARRAY_SIZE(entropy);) {
> +		words = arch_get_random_seed_words(entropy, ARRAY_SIZE(entropy) - i);
> +		if (words) {
> +			_mix_pool_bytes(entropy, sizeof(*entropy) * words);
> +			i += words;
> +			continue;
>  		}
> -		_mix_pool_bytes(&entropy, sizeof(entropy));
> +		words = arch_get_random_words(entropy, ARRAY_SIZE(entropy) - i);
> +		if (words) {
> +			_mix_pool_bytes(entropy, sizeof(*entropy) * words);
> +			i += words;
> +			continue;
> +		}
> +		entropy[0] = random_get_entropy();
> +		_mix_pool_bytes(entropy, sizeof(*entropy));
> +		arch_bits -= sizeof(*entropy) * 8;
> +		++i;
>  	}
>  	_mix_pool_bytes(&now, sizeof(now));
>  	_mix_pool_bytes(utsname(), sizeof(*(utsname())));
> diff --git a/include/asm-generic/archrandom.h b/include/asm-generic/archrandom.h
> index 3a5ee202dd86..ae618916c74c 100644
> --- a/include/asm-generic/archrandom.h
> +++ b/include/asm-generic/archrandom.h
> @@ -2,24 +2,14 @@
>  #ifndef __ASM_GENERIC_ARCHRANDOM_H__
>  #define __ASM_GENERIC_ARCHRANDOM_H__
>  
> -static inline bool __must_check arch_get_random_long(unsigned long *v)
> +static inline size_t __must_check arch_get_random_words(unsigned long *v, size_t words)
>  {
> -	return false;
> +	return 0;
>  }
>  
> -static inline bool __must_check arch_get_random_int(unsigned int *v)
> +static inline size_t __must_check arch_get_random_seed_words(unsigned long *v, size_t words)
>  {
> -	return false;
> -}
> -
> -static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
> -{
> -	return false;
> -}
> -
> -static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
> -{
> -	return false;
> +	return 0;
>  }
>  
>  #endif
> diff --git a/include/linux/random.h b/include/linux/random.h
> index 865770e29f3e..0a327a289f09 100644
> --- a/include/linux/random.h
> +++ b/include/linux/random.h
> @@ -112,19 +112,19 @@ declare_get_random_var_wait(long, unsigned long)
>   * Called from the boot CPU during startup; not valid to call once
>   * secondary CPUs are up and preemption is possible.
>   */
> -#ifndef arch_get_random_seed_long_early
> -static inline bool __init arch_get_random_seed_long_early(unsigned long *v)
> +#ifndef arch_get_random_seed_words_early
> +static inline size_t __init arch_get_random_seed_words_early(unsigned long *v, size_t words)
>  {
>  	WARN_ON(system_state != SYSTEM_BOOTING);
> -	return arch_get_random_seed_long(v);
> +	return arch_get_random_seed_words(v, words);
>  }
>  #endif
>  
> -#ifndef arch_get_random_long_early
> -static inline bool __init arch_get_random_long_early(unsigned long *v)
> +#ifndef arch_get_random_words_early
> +static inline bool __init arch_get_random_words_early(unsigned long *v, size_t words)
>  {
>  	WARN_ON(system_state != SYSTEM_BOOTING);
> -	return arch_get_random_long(v);
> +	return arch_get_random_words(v, words);
>  }
>  #endif
>  
> -- 
> 2.35.1
> 
