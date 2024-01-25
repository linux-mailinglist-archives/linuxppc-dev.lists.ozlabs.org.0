Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66DC583C40C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jan 2024 14:48:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fmYHH8WZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TLMbw2WXYz3cTn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jan 2024 00:48:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fmYHH8WZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TLMb91Kyhz3bYx
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jan 2024 00:47:49 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B4088CE32AE;
	Thu, 25 Jan 2024 13:47:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C83C43390;
	Thu, 25 Jan 2024 13:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706190465;
	bh=HKDrkAxnm0v4E+WqvxXk+env0lFY8iQSHSbv6vYGCno=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fmYHH8WZQnbZVmOwtFZdPjwwSgnJ0e0MFVcP4jY0512jQufSsvx6y1xpl6w75ZACi
	 w+rMR58BzCjyEIytTw2RKtM6sqk6hzEsoZfjbmfZrxx8yRaYFt43X5jySgqZSfC4Fp
	 lVamrsla7/V5ZFjeRhg4gxkHxKmPUx2sWb5V4asqJrUyfT+Dl/2pDmSQLcUQZfyi4/
	 jR/M/QLL66z6ovtj1l4BD2QT9Qw/88eZ2ncN0npRMnpe/3zvwvZbe6hxsoxSc0xAqM
	 y4aqmkEDXfCiDhmfzo7GO7bCxgF0qrAij6kq4L7XckohlHe87lfoCB7HthLanolyFH
	 VrKza+Ez5PkXw==
Message-ID: <e017718b-d385-41de-9139-0265cf3e6149@kernel.org>
Date: Thu, 25 Jan 2024 19:17:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/mm/hash: Code cleanup
To: Kunwu Chan <chentao@kylinos.cn>, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen.n.rao@linux.ibm.com
References: <20240125094636.539372-1-chentao@kylinos.cn>
Content-Language: en-US
From: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
In-Reply-To: <20240125094636.539372-1-chentao@kylinos.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 1/25/24 3:16 PM, Kunwu Chan wrote:
> This part was commented in about 17 years before.
> If there are no plans to enable this part code in the future,
> we can remove this dead code.
> 
> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> ---
>  arch/powerpc/include/asm/book3s/64/mmu-hash.h | 22 -------------------
>  1 file changed, 22 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
> index 1c4eebbc69c9..d39ec7134a78 100644
> --- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
> @@ -731,26 +731,6 @@ struct hash_mm_context {
>  #endif /* CONFIG_PPC_SUBPAGE_PROT */
>  };
>  
> -#if 0
> -/*
> - * The code below is equivalent to this function for arguments
> - * < 2^VSID_BITS, which is all this should ever be called
> - * with.  However gcc is not clever enough to compute the
> - * modulus (2^n-1) without a second multiply.
> - */
> -#define vsid_scramble(protovsid, size) \
> -	((((protovsid) * VSID_MULTIPLIER_##size) % VSID_MODULUS_##size))
> -
> -/* simplified form avoiding mod operation */
> -#define vsid_scramble(protovsid, size) \
> -	({								 \
> -		unsigned long x;					 \
> -		x = (protovsid) * VSID_MULTIPLIER_##size;		 \
> -		x = (x >> VSID_BITS_##size) + (x & VSID_MODULUS_##size); \
> -		(x + ((x+1) >> VSID_BITS_##size)) & VSID_MODULUS_##size; \
> -	})
> -
> -#else /* 1 */
>  static inline unsigned long vsid_scramble(unsigned long protovsid,
>  				  unsigned long vsid_multiplier, int vsid_bits)
>  {
> @@ -764,8 +744,6 @@ static inline unsigned long vsid_scramble(unsigned long protovsid,
>  	return (vsid + ((vsid + 1) >> vsid_bits)) & vsid_modulus;
>  }
>  
> -#endif /* 1 */
> -
>  /* Returns the segment size indicator for a user address */
>  static inline int user_segment_size(unsigned long addr)
>  {

That was done to make sure one can follow the actual compiled code better. 

-aneesh

