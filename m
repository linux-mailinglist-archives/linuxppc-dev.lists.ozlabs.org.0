Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E7413BA5A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 08:31:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yJt44mVqzDqBt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2020 18:31:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yJr424s5zDq6N
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 18:29:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pvTFMpB+; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47yJr25hjfz9sQp;
 Wed, 15 Jan 2020 18:29:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579073395;
 bh=bcwwULLU5QXf1vsaknN6wE7OuZQiR3iZQInThNA9XWw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pvTFMpB+5aKR5SALGkOvbL/teJwAOoD2l/jjWjJ/xX8792ket3BJZLD9jGsuRnHZr
 EXW5kTYkhjpbfWLwL8hObaXzbSKuq+BujBD/YN7XToQ11fjC49y5ICez5dtEHbKTHN
 0aue/5sMaGE1ITcaVWrDbWaGeGbRfhwc16SzVe+A3vLEpy6MvsGs067t6v6Uc1labb
 lbecgrBZfjmYFFXTcBznyZhUvDnfIKAnMME63oK81gq1TeDnobAwEe8cOVYG610rLL
 GANE+n8FSscfk0ZpGUrV/B55FOAzEDSus2r3hCAV37acBo2Gakx4aQJyWHiEcmK2W9
 EZmXLNs+5JN3Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sandipan Das <sandipan@linux.ibm.com>, shuahkh@osg.samsung.com,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v15 14/23] selftests/vm/pkeys: Fix assertion in
 test_pkey_alloc_exhaust()
In-Reply-To: <d82e1652135569cfc38b289f88e39e94d55308ff.1576645161.git.sandipan@linux.ibm.com>
References: <cover.1576645161.git.sandipan@linux.ibm.com>
 <d82e1652135569cfc38b289f88e39e94d55308ff.1576645161.git.sandipan@linux.ibm.com>
Date: Wed, 15 Jan 2020 17:30:01 +1000
Message-ID: <87a76p9nye.fsf@mpe.ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, fweimer@redhat.com, dave.hansen@intel.com,
 aneesh.kumar@linux.ibm.com, x86@kernel.org, linuxram@us.ibm.com,
 mhocko@kernel.org, linux-mm@kvack.org, mingo@redhat.com, msuchanek@suse.de,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sandipan Das <sandipan@linux.ibm.com> writes:
> From: Ram Pai <linuxram@us.ibm.com>
>
> Some pkeys which are valid on the hardware are reserved
> and not available for application use. These keys cannot
> be allocated.
>
> test_pkey_alloc_exhaust() tries to account for these and
> has an assertion which validates if all available pkeys
> have been exahaustively allocated. However, the expression
> that is currently used is only valid for x86. On powerpc,
> a pkey is additionally reserved as compared to x86. Hence,
> the assertion is made to use an arch-specific helper to
> get the correct count of reserved pkeys.

The number of reserved keys is at the whim of the
firmware/hypervisor/kernel.

I'm not sure it makes sense to test this exhaustion behaviour, it's
likely going to break in future.

If you do want to test it you should at least move patch 21 prior to
this one.

cheers

> cc: Dave Hansen <dave.hansen@intel.com>
> cc: Florian Weimer <fweimer@redhat.com>
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> Signed-off-by: Sandipan Das <sandipan@linux.ibm.com>
> ---
>  tools/testing/selftests/vm/protection_keys.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/vm/protection_keys.c b/tools/testing/selftests/vm/protection_keys.c
> index 1920bca84def..8d90cfe2c9bd 100644
> --- a/tools/testing/selftests/vm/protection_keys.c
> +++ b/tools/testing/selftests/vm/protection_keys.c
> @@ -1152,6 +1152,7 @@ void test_pkey_alloc_exhaust(int *ptr, u16 pkey)
>  	dprintf3("%s()::%d\n", __func__, __LINE__);
>  
>  	/*
> +	 * On x86:
>  	 * There are 16 pkeys supported in hardware.  Three are
>  	 * allocated by the time we get here:
>  	 *   1. The default key (0)
> @@ -1159,8 +1160,16 @@ void test_pkey_alloc_exhaust(int *ptr, u16 pkey)
>  	 *   3. One allocated by the test code and passed in via
>  	 *      'pkey' to this function.
>  	 * Ensure that we can allocate at least another 13 (16-3).
> +	 *
> +	 * On powerpc:
> +	 * There are either 5 or 32 pkeys supported in hardware
> +	 * depending on the page size (4K or 64K). Four are
> +	 * allocated by the time we get here. This includes
> +	 * pkey-0, pkey-1, exec-only pkey and the one allocated
> +	 * by the test code.
> +	 * Ensure that we can allocate the remaining.
>  	 */
> -	pkey_assert(i >= NR_PKEYS-3);
> +	pkey_assert(i >= (NR_PKEYS - get_arch_reserved_keys() - 1));
>  
>  	for (i = 0; i < nr_allocated_pkeys; i++) {
>  		err = sys_pkey_free(allocated_pkeys[i]);
> -- 
> 2.17.1
