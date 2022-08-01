Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1AE1586D37
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 16:47:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxLZj6Bz0z3bnr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 00:47:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m2NNqbGw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=freude@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m2NNqbGw;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxLYy3BWzz2xHq
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 00:47:17 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 271DrZrp020607;
	Mon, 1 Aug 2022 14:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=mime-version : date :
 from : to : cc : subject : reply-to : in-reply-to : references :
 message-id : content-type : content-transfer-encoding; s=pp1;
 bh=AbTmj0RHvu1Iaid0pDHo22CW/tW2w65FNuoQWnK78q4=;
 b=m2NNqbGweKngNSWbsCP9a/22/Z+h00v4XMKGBduPafDgUxZD3v6G80kosRTwEVgkAZQs
 znOENhbBfoYcmo4uxBU4hlPAyMG8gfRJbrf9iR1UzQkvmjBvMO2OvuHZbUsqqrgD5TfG
 fjNffeh3t7TYUEEKdzBStiFvX5Ul4ei7yRfq9TwOciYAP5bfWtnxA0TgQ52Answ/LsKq
 hPGHUgEa4c733HGBO6gmQh5oz9B3jawgQMlj9O5tSiehLPvGxD3D5Ual7+cBMDSR3+VS
 rvdPFQ8OaWEL/3hNTLWg9Ehi16clL2YspFkrn+aYUgFUH08qhtro4TnvdY/1Kr8IVuEM sA== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hpaaamkjc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Aug 2022 14:46:41 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 271EZJ0p027222;
	Mon, 1 Aug 2022 14:46:40 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
	by ppma05wdc.us.ibm.com with ESMTP id 3hmv99ch80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 01 Aug 2022 14:46:40 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 271Eke2x64684412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Aug 2022 14:46:40 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 23A43124055;
	Mon,  1 Aug 2022 14:46:40 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A559124054;
	Mon,  1 Aug 2022 14:46:39 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.10.229.42])
	by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
	Mon,  1 Aug 2022 14:46:39 +0000 (GMT)
MIME-Version: 1.0
Date: Mon, 01 Aug 2022 16:46:39 +0200
From: Harald Freudenberger <freude@linux.ibm.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v3] random: handle archrandom with multiple longs
In-Reply-To: <20220719130207.147536-1-Jason@zx2c4.com>
References: <CAHmME9qTA90=GEr6h1GZh0CjS+6tpe5uuqkYoJVv79h0zd0w1w@mail.gmail.com>
 <20220719130207.147536-1-Jason@zx2c4.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <7285be49c459bdc8f4ec3abe85d9e171@linux.ibm.com>
X-Sender: freude@linux.ibm.com
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mqzb8UR0c1-cBm34eaY0EtQ-SkVENnaL
X-Proofpoint-ORIG-GUID: mqzb8UR0c1-cBm34eaY0EtQ-SkVENnaL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-01_07,2022-08-01_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 mlxscore=0 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 spamscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208010073
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
Reply-To: freude@linux.ibm.com
Cc: Mark Rutland <mark.rutland@arm.com>, linux-s390@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org, Heiko Carstens <hca@linux.ibm.com>, x86@kernel.org, linux-kernel@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, "H . Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Borislav Petkov <bp@suse.de>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022-07-19 15:02, Jason A. Donenfeld wrote:
> The archrandom interface was originally designed for x86, which 
> supplies
> RDRAND/RDSEED for receiving random words into registers, resulting in
> one function to generate an int and another to generate a long. 
> However,
> other architectures don't follow this.
> 
> On arm64, the SMCCC TRNG interface can return between 1 and 3 longs. On
> s390, the CPACF TRNG interface can return arbitrary amounts, with 32
> longs having the same cost as one. On UML, the os_getrandom() interface
> can return arbitrary amounts.
> 
> So change the api signature to take a "max_longs" parameter designating
> the maximum number of longs requested, and then return the number of
> longs generated.
> 
> Since callers need to check this return value and loop anyway, each 
> arch
> implementation does not bother implementing its own loop to try again 
> to
> fill the maximum number of longs. Additionally, all existing callers
> pass in a constant max_longs parameter. Taken together, these two 
> things
> mean that the codegen doesn't really change much for one-word-at-a-time
> platforms, while performance is greatly improved on platforms such as
> s390.
> 
> Cc: Will Deacon <will@kernel.org>
> Cc: Alexander Gordeev <agordeev@linux.ibm.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: H. Peter Anvin <hpa@zytor.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Borislav Petkov <bp@suse.de>
> Cc: Heiko Carstens <hca@linux.ibm.com>
> Cc: Johannes Berg <johannes@sipsolutions.net>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Harald Freudenberger <freude@linux.ibm.com>
> Acked-by: Michael Ellerman <mpe@ellerman.id.au>
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
> diff --git a/arch/arm64/include/asm/archrandom.h
> b/arch/arm64/include/asm/archrandom.h
> index c3b9fa56af67..109e2a4454be 100644
> --- a/arch/arm64/include/asm/archrandom.h
> +++ b/arch/arm64/include/asm/archrandom.h
> @@ -58,7 +58,7 @@ static inline bool __arm64_rndrrs(unsigned long *v)
>  	return ok;
>  }
> 
> -static inline bool __must_check arch_get_random_long(unsigned long *v)
> +static inline size_t __must_check arch_get_random_longs(unsigned long
> *v, size_t max_longs)
>  {
>  	/*
>  	 * Only support the generic interface after we have detected
> @@ -66,27 +66,15 @@ static inline bool __must_check
> arch_get_random_long(unsigned long *v)
>  	 * cpufeature code and with potential scheduling between CPUs
>  	 * with and without the feature.
>  	 */
> -	if (cpus_have_const_cap(ARM64_HAS_RNG) && __arm64_rndr(v))
> -		return true;
> -	return false;
> +	if (max_longs && cpus_have_const_cap(ARM64_HAS_RNG) && 
> __arm64_rndr(v))
> +		return 1;
> +	return 0;
>  }
> 
> -static inline bool __must_check arch_get_random_int(unsigned int *v)
> +static inline size_t __must_check arch_get_random_seed_longs(unsigned
> long *v, size_t max_longs)
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
> -static inline bool __must_check arch_get_random_seed_long(unsigned 
> long *v)
> -{
> -	struct arm_smccc_res res;
> +	if (!max_longs)
> +		return 0;
> 
>  	/*
>  	 * We prefer the SMCCC call, since its semantics (return actual
> @@ -95,10 +83,23 @@ static inline bool __must_check
> arch_get_random_seed_long(unsigned long *v)
>  	 * (the output of a pseudo RNG freshly seeded by a TRNG).
>  	 */
>  	if (smccc_trng_available) {
> -		arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_RND64, 64, &res);
> +		struct arm_smccc_res res;
> +
> +		max_longs = min_t(size_t, 3, max_longs);
> +		arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_RND64, max_longs * 64, &res);
>  		if ((int)res.a0 >= 0) {
> -			*v = res.a3;
> -			return true;
> +			switch (max_longs) {
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
> +			return max_longs;
>  		}
>  	}
> 
> @@ -108,32 +109,9 @@ static inline bool __must_check
> arch_get_random_seed_long(unsigned long *v)
>  	 * enough to implement this API if no other entropy source exists.
>  	 */
>  	if (cpus_have_const_cap(ARM64_HAS_RNG) && __arm64_rndrrs(v))
> -		return true;
> +		return 1;
> 
> -	return false;
> -}
> -
> -static inline bool __must_check arch_get_random_seed_int(unsigned int 
> *v)
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
> @@ -143,26 +121,40 @@ static inline bool __init 
> __early_cpu_has_rndr(void)
>  	return (ftr >> ID_AA64ISAR0_EL1_RNDR_SHIFT) & 0xf;
>  }
> 
> -static inline bool __init __must_check
> -arch_get_random_seed_long_early(unsigned long *v)
> +static inline size_t __init __must_check
> +arch_get_random_seed_longs_early(unsigned long *v, size_t max_longs)
>  {
>  	WARN_ON(system_state != SYSTEM_BOOTING);
> 
> +	if (!max_longs)
> +		return 0;
> +
>  	if (smccc_trng_available) {
>  		struct arm_smccc_res res;
> 
> -		arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_RND64, 64, &res);
> +		max_longs = min_t(size_t, 3, max_longs);
> +		arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_RND64, max_longs * 64, &res);
>  		if ((int)res.a0 >= 0) {
> -			*v = res.a3;
> -			return true;
> +			switch (max_longs) {
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
> +			return max_longs;
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
> -#define arch_get_random_seed_long_early 
> arch_get_random_seed_long_early
> +#define arch_get_random_seed_longs_early 
> arch_get_random_seed_longs_early
> 
>  #endif /* _ASM_ARCHRANDOM_H */
> diff --git a/arch/arm64/kernel/kaslr.c b/arch/arm64/kernel/kaslr.c
> index 418b2bba1521..c5d541f358d3 100644
> --- a/arch/arm64/kernel/kaslr.c
> +++ b/arch/arm64/kernel/kaslr.c
> @@ -106,7 +106,7 @@ u64 __init kaslr_early_init(void)
>  	 * and supported.
>  	 */
> 
> -	if (arch_get_random_seed_long_early(&raw))
> +	if (arch_get_random_seed_longs_early(&raw, 1))
>  		seed ^= raw;
> 
>  	if (!seed) {
> diff --git a/arch/powerpc/include/asm/archrandom.h
> b/arch/powerpc/include/asm/archrandom.h
> index 25ba65df6b1a..0e365c5b2396 100644
> --- a/arch/powerpc/include/asm/archrandom.h
> +++ b/arch/powerpc/include/asm/archrandom.h
> @@ -4,34 +4,16 @@
> 
>  #include <asm/machdep.h>
> 
> -static inline bool __must_check arch_get_random_long(unsigned long *v)
> +static inline size_t __must_check arch_get_random_longs(unsigned long
> *v, size_t max_longs)
>  {
> -	return false;
> +	return 0;
>  }
> 
> -static inline bool __must_check arch_get_random_int(unsigned int *v)
> +static inline size_t __must_check arch_get_random_seed_longs(unsigned
> long *v, size_t max_longs)
>  {
> -	return false;
> -}
> -
> -static inline bool __must_check arch_get_random_seed_long(unsigned 
> long *v)
> -{
> -	if (ppc_md.get_random_seed)
> -		return ppc_md.get_random_seed(v);
> -
> -	return false;
> -}
> -
> -static inline bool __must_check arch_get_random_seed_int(unsigned int 
> *v)
> -{
> -	unsigned long val;
> -	bool rc;
> -
> -	rc = arch_get_random_seed_long(&val);
> -	if (rc)
> -		*v = val;
> -
> -	return rc;
> +	if (max_longs && ppc_md.get_random_seed && ppc_md.get_random_seed(v))
> +		return 1;
> +	return 0;
>  }
> 
>  #ifdef CONFIG_PPC_POWERNV
> diff --git a/arch/powerpc/kvm/book3s_hv.c 
> b/arch/powerpc/kvm/book3s_hv.c
> index e08fb3124dca..631062cde6b4 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1207,7 +1207,7 @@ int kvmppc_pseries_do_hcall(struct kvm_vcpu 
> *vcpu)
>  		break;
>  #endif
>  	case H_RANDOM:
> -		if (!arch_get_random_seed_long(&vcpu->arch.regs.gpr[4]))
> +		if (!arch_get_random_seed_longs(&vcpu->arch.regs.gpr[4], 1))
>  			ret = H_HARDWARE;
>  		break;
>  	case H_RPT_INVALIDATE:
> diff --git a/arch/s390/include/asm/archrandom.h
> b/arch/s390/include/asm/archrandom.h
> index 0a1c2e66c709..cf5e000df0a1 100644
> --- a/arch/s390/include/asm/archrandom.h
> +++ b/arch/s390/include/asm/archrandom.h
> @@ -18,34 +18,19 @@
>  DECLARE_STATIC_KEY_FALSE(s390_arch_random_available);
>  extern atomic64_t s390_arch_random_counter;
> 
> -static inline bool __must_check arch_get_random_long(unsigned long *v)
> +static inline size_t __must_check arch_get_random_longs(unsigned long
> *v, size_t max_longs)
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
> -static inline bool __must_check arch_get_random_seed_long(unsigned 
> long *v)
> -{
> -	if (static_branch_likely(&s390_arch_random_available)) {
> -		cpacf_trng(NULL, 0, (u8 *)v, sizeof(*v));
> -		atomic64_add(sizeof(*v), &s390_arch_random_counter);
> -		return true;
> -	}
> -	return false;
> -}
> -
> -static inline bool __must_check arch_get_random_seed_int(unsigned int 
> *v)
> +static inline size_t __must_check arch_get_random_seed_longs(unsigned
> long *v, size_t max_longs)
>  {
>  	if (static_branch_likely(&s390_arch_random_available)) {
> -		cpacf_trng(NULL, 0, (u8 *)v, sizeof(*v));
> -		atomic64_add(sizeof(*v), &s390_arch_random_counter);
> -		return true;
> +		cpacf_trng(NULL, 0, (u8 *)v, max_longs * sizeof(*v));
> +		atomic64_add(max_longs * sizeof(*v), &s390_arch_random_counter);
> +		return max_longs;
>  	}
> -	return false;
> +	return 0;
>  }
> 
>  #endif /* _ASM_S390_ARCHRANDOM_H */
> diff --git a/arch/um/include/asm/archrandom.h 
> b/arch/um/include/asm/archrandom.h
> index 2f24cb96391d..24e16c979c51 100644
> --- a/arch/um/include/asm/archrandom.h
> +++ b/arch/um/include/asm/archrandom.h
> @@ -7,24 +7,19 @@
>  /* This is from <os.h>, but better not to #include that in a global
> header here. */
>  ssize_t os_getrandom(void *buf, size_t len, unsigned int flags);
> 
> -static inline bool __must_check arch_get_random_long(unsigned long *v)
> +static inline size_t __must_check arch_get_random_longs(unsigned long
> *v, size_t max_longs)
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
> -static inline bool __must_check arch_get_random_seed_long(unsigned 
> long *v)
> -{
> -	return false;
> +	ret = os_getrandom(v, max_longs * sizeof(*v), 0);
> +	if (ret < 0)
> +		return 0;
> +	return ret / sizeof(*v);
>  }
> 
> -static inline bool __must_check arch_get_random_seed_int(unsigned int 
> *v)
> +static inline size_t __must_check arch_get_random_seed_longs(unsigned
> long *v, size_t max_longs)
>  {
> -	return false;
> +	return 0;
>  }
> 
>  #endif
> diff --git a/arch/x86/include/asm/archrandom.h
> b/arch/x86/include/asm/archrandom.h
> index fb235b696175..02bae8e0758b 100644
> --- a/arch/x86/include/asm/archrandom.h
> +++ b/arch/x86/include/asm/archrandom.h
> @@ -31,20 +31,6 @@ static inline bool __must_check rdrand_long(unsigned 
> long *v)
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
> @@ -54,38 +40,19 @@ static inline bool __must_check
> rdseed_long(unsigned long *v)
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
> -static inline bool __must_check arch_get_random_seed_long(unsigned 
> long *v)
> +static inline size_t __must_check arch_get_random_longs(unsigned long
> *v, size_t max_longs)
>  {
> -	return static_cpu_has(X86_FEATURE_RDSEED) ? rdseed_long(v) : false;
> +	return max_longs && static_cpu_has(X86_FEATURE_RDRAND) &&
> rdrand_long(v) ? 1 : 0;
>  }
> 
> -static inline bool __must_check arch_get_random_seed_int(unsigned int 
> *v)
> +static inline size_t __must_check arch_get_random_seed_longs(unsigned
> long *v, size_t max_longs)
>  {
> -	return static_cpu_has(X86_FEATURE_RDSEED) ? rdseed_int(v) : false;
> +	return max_longs && static_cpu_has(X86_FEATURE_RDSEED) &&
> rdseed_long(v) ? 1 : 0;
>  }
> 
>  #ifndef CONFIG_UML
> diff --git a/arch/x86/kernel/espfix_64.c b/arch/x86/kernel/espfix_64.c
> index 4fe7af58cfe1..9417d5aa7305 100644
> --- a/arch/x86/kernel/espfix_64.c
> +++ b/arch/x86/kernel/espfix_64.c
> @@ -100,7 +100,7 @@ static void init_espfix_random(void)
>  	 * This is run before the entropy pools are initialized,
>  	 * but this is hopefully better than nothing.
>  	 */
> -	if (!arch_get_random_long(&rand)) {
> +	if (!arch_get_random_longs(&rand, 1)) {
>  		/* The constant is an arbitrary large prime */
>  		rand = rdtsc();
>  		rand *= 0xc345c6b72fd16123UL;
> diff --git a/drivers/char/random.c b/drivers/char/random.c
> index 0c6568ae5f68..7bf11fa66265 100644
> --- a/drivers/char/random.c
> +++ b/drivers/char/random.c
> @@ -596,12 +596,20 @@ static void extract_entropy(void *buf, size_t 
> len)
>  		unsigned long rdseed[32 / sizeof(long)];
>  		size_t counter;
>  	} block;
> -	size_t i;
> +	size_t i, longs;
> 
> -	for (i = 0; i < ARRAY_SIZE(block.rdseed); ++i) {
> -		if (!arch_get_random_seed_long(&block.rdseed[i]) &&
> -		    !arch_get_random_long(&block.rdseed[i]))
> -			block.rdseed[i] = random_get_entropy();
> +	for (i = 0; i < ARRAY_SIZE(block.rdseed);) {
> +		longs = arch_get_random_seed_longs(&block.rdseed[i],
> ARRAY_SIZE(block.rdseed) - i);
> +		if (longs) {
> +			i += longs;
> +			continue;
> +		}
> +		longs = arch_get_random_longs(&block.rdseed[i],
> ARRAY_SIZE(block.rdseed) - i);
> +		if (longs) {
> +			i += longs;
> +			continue;
> +		}
> +		block.rdseed[i++] = random_get_entropy();
>  	}
> 
>  	spin_lock_irqsave(&input_pool.lock, flags);
> @@ -776,22 +784,31 @@ static struct notifier_block pm_notifier = {
> .notifier_call = random_pm_notifica
>  int __init random_init(const char *command_line)
>  {
>  	ktime_t now = ktime_get_real();
> -	unsigned int i, arch_bits;
> -	unsigned long entropy;
> +	size_t i, longs, arch_bits;
> +	unsigned long entropy[BLAKE2S_BLOCK_SIZE / sizeof(long)];
> 
>  #if defined(LATENT_ENTROPY_PLUGIN)
>  	static const u8 compiletime_seed[BLAKE2S_BLOCK_SIZE] __initconst
> __latent_entropy;
>  	_mix_pool_bytes(compiletime_seed, sizeof(compiletime_seed));
>  #endif
> 
> -	for (i = 0, arch_bits = BLAKE2S_BLOCK_SIZE * 8;
> -	     i < BLAKE2S_BLOCK_SIZE; i += sizeof(entropy)) {
> -		if (!arch_get_random_seed_long_early(&entropy) &&
> -		    !arch_get_random_long_early(&entropy)) {
> -			entropy = random_get_entropy();
> -			arch_bits -= sizeof(entropy) * 8;
> +	for (i = 0, arch_bits = sizeof(entropy) * 8; i < 
> ARRAY_SIZE(entropy);) {
> +		longs = arch_get_random_seed_longs(entropy, ARRAY_SIZE(entropy) - 
> i);
> +		if (longs) {
> +			_mix_pool_bytes(entropy, sizeof(*entropy) * longs);
> +			i += longs;
> +			continue;
>  		}
> -		_mix_pool_bytes(&entropy, sizeof(entropy));
> +		longs = arch_get_random_longs(entropy, ARRAY_SIZE(entropy) - i);
> +		if (longs) {
> +			_mix_pool_bytes(entropy, sizeof(*entropy) * longs);
> +			i += longs;
> +			continue;
> +		}
> +		entropy[0] = random_get_entropy();
> +		_mix_pool_bytes(entropy, sizeof(*entropy));
> +		arch_bits -= sizeof(*entropy) * 8;
> +		++i;
>  	}
>  	_mix_pool_bytes(&now, sizeof(now));
>  	_mix_pool_bytes(utsname(), sizeof(*(utsname())));
> diff --git a/include/asm-generic/archrandom.h 
> b/include/asm-generic/archrandom.h
> index 3a5ee202dd86..3cd7f980cfdc 100644
> --- a/include/asm-generic/archrandom.h
> +++ b/include/asm-generic/archrandom.h
> @@ -2,24 +2,14 @@
>  #ifndef __ASM_GENERIC_ARCHRANDOM_H__
>  #define __ASM_GENERIC_ARCHRANDOM_H__
> 
> -static inline bool __must_check arch_get_random_long(unsigned long *v)
> +static inline size_t __must_check arch_get_random_longs(unsigned long
> *v, size_t max_longs)
>  {
> -	return false;
> +	return 0;
>  }
> 
> -static inline bool __must_check arch_get_random_int(unsigned int *v)
> +static inline size_t __must_check arch_get_random_seed_longs(unsigned
> long *v, size_t max_longs)
>  {
> -	return false;
> -}
> -
> -static inline bool __must_check arch_get_random_seed_long(unsigned 
> long *v)
> -{
> -	return false;
> -}
> -
> -static inline bool __must_check arch_get_random_seed_int(unsigned int 
> *v)
> -{
> -	return false;
> +	return 0;
>  }
> 
>  #endif
> diff --git a/include/linux/random.h b/include/linux/random.h
> index 865770e29f3e..3fec206487f6 100644
> --- a/include/linux/random.h
> +++ b/include/linux/random.h
> @@ -112,19 +112,19 @@ declare_get_random_var_wait(long, unsigned long)
>   * Called from the boot CPU during startup; not valid to call once
>   * secondary CPUs are up and preemption is possible.
>   */
> -#ifndef arch_get_random_seed_long_early
> -static inline bool __init arch_get_random_seed_long_early(unsigned 
> long *v)
> +#ifndef arch_get_random_seed_longs_early
> +static inline size_t __init arch_get_random_seed_longs_early(unsigned
> long *v, size_t max_longs)
>  {
>  	WARN_ON(system_state != SYSTEM_BOOTING);
> -	return arch_get_random_seed_long(v);
> +	return arch_get_random_seed_longs(v, max_longs);
>  }
>  #endif
> 
> -#ifndef arch_get_random_long_early
> -static inline bool __init arch_get_random_long_early(unsigned long *v)
> +#ifndef arch_get_random_longs_early
> +static inline bool __init arch_get_random_longs_early(unsigned long
> *v, size_t max_longs)
>  {
>  	WARN_ON(system_state != SYSTEM_BOOTING);
> -	return arch_get_random_long(v);
> +	return arch_get_random_longs(v, max_longs);
>  }
>  #endif

Nice interface :-)
Here is my
Acked-by: Harald Freudenberger <freude@linux.ibm.com>
but please keep in mind that your patch does not apply cleanly as there
is my other patch
918e75f77af7 ("s390/archrandom: prevent CPACF trng invocations in 
interrupt context")
in between.
Thanks for your work
Harald
