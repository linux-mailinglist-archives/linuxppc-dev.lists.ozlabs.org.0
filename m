Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F3D57DBE4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 10:12:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lq2HV5pGDz3cj0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jul 2022 18:12:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QF2VrZvw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dengler@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QF2VrZvw;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lq2Bm3KLNz30LR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jul 2022 18:08:47 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26M7VKt4015731;
	Fri, 22 Jul 2022 08:08:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=moe7py1YR/3sbMyhERKkLOYJQa6RY11Gn+EhzLrSnAU=;
 b=QF2VrZvw053k3Wngs5Q71LdWAc3sYhCCJW9ZaalGHbGSgxczdeaQDVLv3Pl3lXtqBbTH
 iL8/o4kPV49U50l3nHIqQU3XHWm4YBYEAR7tXyej+b2S5HAhaSptbeyQJjxqnWMSuwOq
 cK9aT5OmfjQjkmm8FArzgHh8VCgbUoGNQdnTVkbb2djLOcBP2+Bxm4AeHf+3mO3pZcks
 j5j+/s1RApU7vpGz9mThi+clhYpMI8o0mUB96AKIZoh78LP6lOojWZNLYmUGHYSzyTHR
 Q8XxPE60IBlSVP7LJx6VS2sqYJbv8DZIWYTRCy/OJkkVW0+7/HHuziEtb6CjYlSmYdo1 rg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hfqk1gw0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Jul 2022 08:08:12 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26M84wko032412;
	Fri, 22 Jul 2022 08:08:10 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04ams.nl.ibm.com with ESMTP id 3hbmy8yyd4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Jul 2022 08:08:10 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26M8871n12190038
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 22 Jul 2022 08:08:07 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34E38AE04D;
	Fri, 22 Jul 2022 08:08:07 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B5A1AE045;
	Fri, 22 Jul 2022 08:08:06 +0000 (GMT)
Received: from [9.171.55.21] (unknown [9.171.55.21])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 22 Jul 2022 08:08:06 +0000 (GMT)
Message-ID: <46c1a7be-080b-3315-50cc-d3c848fd99e3@linux.ibm.com>
Date: Fri, 22 Jul 2022 10:08:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] random: handle archrandom in plural words
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, x86@kernel.org
References: <YtP1+MJ1tNdJA60l@zx2c4.com>
 <20220717200356.75060-1-Jason@zx2c4.com>
From: Holger Dengler <dengler@linux.ibm.com>
In-Reply-To: <20220717200356.75060-1-Jason@zx2c4.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: lvpUn2H9Z4VH3Q4iv7w5qBHHrwpuW8BU
X-Proofpoint-GUID: lvpUn2H9Z4VH3Q4iv7w5qBHHrwpuW8BU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-21_28,2022-07-21_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 clxscore=1011 bulkscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207220033
X-Mailman-Approved-At: Fri, 22 Jul 2022 18:12:20 +1000
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
Cc: Heiko Carstens <hca@linux.ibm.com>, "H . Peter Anvin" <hpa@zytor.com>, Johannes Berg <johannes@sipsolutions.net>, Harald Freudenberger <freude@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Borislav Petkov <bp@suse.de>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jason,

On 17/07/2022 22:03, Jason A. Donenfeld wrote:
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

Why not changing the API to take bytes instead of words? Sure, at the moment it looks like all platforms with TRNG support are able to deliver at least one word, but bytes would be more flexible. 

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

-- 
Mit freundlichen Grüßen / Kind regards
Holger Dengler
--
IBM Systems, Linux on IBM Z Development
dengler@linux.ibm.com
