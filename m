Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB9F2114C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 02:33:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454q5k03VgzDqDy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 May 2019 10:33:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="UoBZCRHQ"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454q4Q55B4zDqQM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 May 2019 10:32:19 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id y3so2461370plp.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 17:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=dCFD7viGcEXJL7mHlbKV/lec43FECwsfiY9/t/GVPmU=;
 b=UoBZCRHQH5Cm0u/cDshvqXIn7QYwv/U5nCVGh+rwyAfpfK1qLBLrXvPBf8SUgBuMMR
 jplUoWWGoe42q4lUVJBV2V33rBHRCl0+l6H+lhqDf1wmWmpTDffLh+6lPZ7EfYHYi1Mc
 0370y4D4HcGmz/sNaI04YlYNw8FPoeN95g+KQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=dCFD7viGcEXJL7mHlbKV/lec43FECwsfiY9/t/GVPmU=;
 b=F17DSLhYvffbtrNhefxcFCdKjfzoZSoLte+1q8mJ7QjIE8aIb85obaiy9KTZYNQGGa
 Qx+Mp5BQHUmjk2QrKqI76KQc3yPLotGblWxUaKAk58KUmyWoa2p9CtsD3DejD7m8eqMX
 hBDJuT3OqLXNxgv4FH9gxYVj8eOsCoLW38Z8pbP3EVlUT9gIlZBWK5YDRf8nmAb9m2eR
 uvmSjov26PxN8pAMQ+a+KbF7OoiRRmnuoh+DwPrSD4RsjL7sJqGsa37LqT5JTXshI+R3
 epnEsLWd9CqgD1b5QzWbTZ3pQjASn7klFjrjMJOYSzmmMIqS2yCVrJ4G1insak1UgJHs
 qKYA==
X-Gm-Message-State: APjAAAWyxXWKTSDApyEHNUskaUg7fMVmfjyoxImIilcjfp9E4XaHVOLX
 a5iR4jPrC1E/SFCu/OjzztZCOA==
X-Google-Smtp-Source: APXvYqwGy3bM5fHYZLrfrKrituXA1wPeX9Z71rNqkFzkzKaeffGfo+0DXBeJSGOAKfr1OccDQruiGw==
X-Received: by 2002:a17:902:201:: with SMTP id 1mr8780006plc.263.1558053136630; 
 Thu, 16 May 2019 17:32:16 -0700 (PDT)
Received: from localhost (dip-220-235-49-186.wa.westnet.com.au.
 [220.235.49.186])
 by smtp.gmail.com with ESMTPSA id q19sm12397654pff.96.2019.05.16.17.32.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 16 May 2019 17:32:15 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Michael Ellerman <mpe@ellerman.id.au>, ebiggers@kernel.org,
 linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: vmx - ghash: do nosimd fallback manually
In-Reply-To: <87bm02hsl4.fsf@concordia.ellerman.id.au>
References: <20190516154002.26246-1-dja@axtens.net>
 <87bm02hsl4.fsf@concordia.ellerman.id.au>
Date: Fri, 17 May 2019 10:32:12 +1000
Message-ID: <87tvdtzzsj.fsf@dja-thinkpad.axtens.net>
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
Cc: leo.barbosa@canonical.com, Stephan Mueller <smueller@chronox.de>,
 nayna@linux.ibm.com, omosnacek@gmail.com, leitao@debian.org,
 pfsmorigo@gmail.com, marcelo.cerri@canonical.com, gcwilson@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> Daniel Axtens <dja@axtens.net> writes:
>> VMX ghash was using a fallback that did not support interleaving simd
>> and nosimd operations, leading to failures in the extended test suite.
>>
>> If I understood correctly, Eric's suggestion was to use the same
>> data format that the generic code uses, allowing us to call into it
>> with the same contexts. I wasn't able to get that to work - I think
>> there's a very different key structure and data layout being used.
>>
>> So instead steal the arm64 approach and perform the fallback
>> operations directly if required.
>>
>> Reported-by: Eric Biggers <ebiggers@google.com>
>> Signed-off-by: Daniel Axtens <dja@axtens.net>
>
> This probably needs a fixes tag?
>
> I assume it goes back to the original submission, ie.
>
>   Fixes: cc333cd68dfa ("crypto: vmx - Adding GHASH routines for VMX module")
>   Cc: stable@vger.kernel.org # v4.1+
>
> Or did something change in the interim to expose this?

Yes, I think that's the right fixes tag. Not quite sure how I managed to
miss that! Herbert, I assume this will go via your tree: do you want me
to send a v2 with the tag or are you OK to just add that in when you
merge it?

Regards,
Daniel



>
>
>> ---
>>
>> Tested on BE and LE in qemu-tcg, so more testing would be lovely.
>
> I tested this on power8 with fuzz_iterations=10000, no problems.
> Previously it would fail very quickly.
>
> Tested-by: Michael Ellerman <mpe@ellerman.id.au>
>
>
> cheers
>
>
>> diff --git a/drivers/crypto/vmx/ghash.c b/drivers/crypto/vmx/ghash.c
>> index b5a6883bb09e..14807ac2e3b9 100644
>> --- a/drivers/crypto/vmx/ghash.c
>> +++ b/drivers/crypto/vmx/ghash.c
>> @@ -1,22 +1,14 @@
>> +// SPDX-License-Identifier: GPL-2.0
>>  /**
>>   * GHASH routines supporting VMX instructions on the Power 8
>>   *
>> - * Copyright (C) 2015 International Business Machines Inc.
>> - *
>> - * This program is free software; you can redistribute it and/or modify
>> - * it under the terms of the GNU General Public License as published by
>> - * the Free Software Foundation; version 2 only.
>> - *
>> - * This program is distributed in the hope that it will be useful,
>> - * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> - * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> - * GNU General Public License for more details.
>> - *
>> - * You should have received a copy of the GNU General Public License
>> - * along with this program; if not, write to the Free Software
>> - * Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
>> + * Copyright (C) 2015, 2019 International Business Machines Inc.
>>   *
>>   * Author: Marcelo Henrique Cerri <mhcerri@br.ibm.com>
>> + *
>> + * Extended by Daniel Axtens <dja@axtens.net> to replace the fallback
>> + * mechanism. The new approach is based on arm64 code, which is:
>> + *   Copyright (C) 2014 - 2018 Linaro Ltd. <ard.biesheuvel@linaro.org>
>>   */
>>  
>>  #include <linux/types.h>
>> @@ -38,70 +30,25 @@ void gcm_ghash_p8(u64 Xi[2], const u128 htable[16],
>>  		  const u8 *in, size_t len);
>>  
>>  struct p8_ghash_ctx {
>> +	/* key used by vector asm */
>>  	u128 htable[16];
>> -	struct crypto_shash *fallback;
>> +	/* key used by software fallback */
>> +	be128 key;
>>  };
>>  
>>  struct p8_ghash_desc_ctx {
>>  	u64 shash[2];
>>  	u8 buffer[GHASH_DIGEST_SIZE];
>>  	int bytes;
>> -	struct shash_desc fallback_desc;
>>  };
>>  
>> -static int p8_ghash_init_tfm(struct crypto_tfm *tfm)
>> -{
>> -	const char *alg = "ghash-generic";
>> -	struct crypto_shash *fallback;
>> -	struct crypto_shash *shash_tfm = __crypto_shash_cast(tfm);
>> -	struct p8_ghash_ctx *ctx = crypto_tfm_ctx(tfm);
>> -
>> -	fallback = crypto_alloc_shash(alg, 0, CRYPTO_ALG_NEED_FALLBACK);
>> -	if (IS_ERR(fallback)) {
>> -		printk(KERN_ERR
>> -		       "Failed to allocate transformation for '%s': %ld\n",
>> -		       alg, PTR_ERR(fallback));
>> -		return PTR_ERR(fallback);
>> -	}
>> -
>> -	crypto_shash_set_flags(fallback,
>> -			       crypto_shash_get_flags((struct crypto_shash
>> -						       *) tfm));
>> -
>> -	/* Check if the descsize defined in the algorithm is still enough. */
>> -	if (shash_tfm->descsize < sizeof(struct p8_ghash_desc_ctx)
>> -	    + crypto_shash_descsize(fallback)) {
>> -		printk(KERN_ERR
>> -		       "Desc size of the fallback implementation (%s) does not match the expected value: %lu vs %u\n",
>> -		       alg,
>> -		       shash_tfm->descsize - sizeof(struct p8_ghash_desc_ctx),
>> -		       crypto_shash_descsize(fallback));
>> -		return -EINVAL;
>> -	}
>> -	ctx->fallback = fallback;
>> -
>> -	return 0;
>> -}
>> -
>> -static void p8_ghash_exit_tfm(struct crypto_tfm *tfm)
>> -{
>> -	struct p8_ghash_ctx *ctx = crypto_tfm_ctx(tfm);
>> -
>> -	if (ctx->fallback) {
>> -		crypto_free_shash(ctx->fallback);
>> -		ctx->fallback = NULL;
>> -	}
>> -}
>> -
>>  static int p8_ghash_init(struct shash_desc *desc)
>>  {
>> -	struct p8_ghash_ctx *ctx = crypto_tfm_ctx(crypto_shash_tfm(desc->tfm));
>>  	struct p8_ghash_desc_ctx *dctx = shash_desc_ctx(desc);
>>  
>>  	dctx->bytes = 0;
>>  	memset(dctx->shash, 0, GHASH_DIGEST_SIZE);
>> -	dctx->fallback_desc.tfm = ctx->fallback;
>> -	return crypto_shash_init(&dctx->fallback_desc);
>> +	return 0;
>>  }
>>  
>>  static int p8_ghash_setkey(struct crypto_shash *tfm, const u8 *key,
>> @@ -119,7 +66,51 @@ static int p8_ghash_setkey(struct crypto_shash *tfm, const u8 *key,
>>  	disable_kernel_vsx();
>>  	pagefault_enable();
>>  	preempt_enable();
>> -	return crypto_shash_setkey(ctx->fallback, key, keylen);
>> +
>> +	memcpy(&ctx->key, key, GHASH_BLOCK_SIZE);
>> +
>> +	return 0;
>> +}
>> +
>> +static inline void __ghash_block(struct p8_ghash_ctx *ctx,
>> +				 struct p8_ghash_desc_ctx *dctx)
>> +{
>> +	if (crypto_simd_usable()) {
>> +		preempt_disable();
>> +		pagefault_disable();
>> +		enable_kernel_vsx();
>> +		gcm_ghash_p8(dctx->shash, ctx->htable,
>> +				dctx->buffer, GHASH_DIGEST_SIZE);
>> +		disable_kernel_vsx();
>> +		pagefault_enable();
>> +		preempt_enable();
>> +	} else {
>> +		crypto_xor((u8 *)dctx->shash, dctx->buffer, GHASH_BLOCK_SIZE);
>> +		gf128mul_lle((be128 *)dctx->shash, &ctx->key);
>> +	}
>> +}
>> +
>> +static inline void __ghash_blocks(struct p8_ghash_ctx *ctx,
>> +				  struct p8_ghash_desc_ctx *dctx,
>> +				  const u8 *src, unsigned int srclen)
>> +{
>> +	if (crypto_simd_usable()) {
>> +		preempt_disable();
>> +		pagefault_disable();
>> +		enable_kernel_vsx();
>> +		gcm_ghash_p8(dctx->shash, ctx->htable,
>> +				src, srclen);
>> +		disable_kernel_vsx();
>> +		pagefault_enable();
>> +		preempt_enable();
>> +	} else {
>> +		while (srclen >= GHASH_BLOCK_SIZE) {
>> +			crypto_xor((u8 *)dctx->shash, src, GHASH_BLOCK_SIZE);
>> +			gf128mul_lle((be128 *)dctx->shash, &ctx->key);
>> +			srclen -= GHASH_BLOCK_SIZE;
>> +			src += GHASH_BLOCK_SIZE;
>> +		}
>> +	}
>>  }
>>  
>>  static int p8_ghash_update(struct shash_desc *desc,
>> @@ -129,49 +120,33 @@ static int p8_ghash_update(struct shash_desc *desc,
>>  	struct p8_ghash_ctx *ctx = crypto_tfm_ctx(crypto_shash_tfm(desc->tfm));
>>  	struct p8_ghash_desc_ctx *dctx = shash_desc_ctx(desc);
>>  
>> -	if (!crypto_simd_usable()) {
>> -		return crypto_shash_update(&dctx->fallback_desc, src,
>> -					   srclen);
>> -	} else {
>> -		if (dctx->bytes) {
>> -			if (dctx->bytes + srclen < GHASH_DIGEST_SIZE) {
>> -				memcpy(dctx->buffer + dctx->bytes, src,
>> -				       srclen);
>> -				dctx->bytes += srclen;
>> -				return 0;
>> -			}
>> +	if (dctx->bytes) {
>> +		if (dctx->bytes + srclen < GHASH_DIGEST_SIZE) {
>>  			memcpy(dctx->buffer + dctx->bytes, src,
>> -			       GHASH_DIGEST_SIZE - dctx->bytes);
>> -			preempt_disable();
>> -			pagefault_disable();
>> -			enable_kernel_vsx();
>> -			gcm_ghash_p8(dctx->shash, ctx->htable,
>> -				     dctx->buffer, GHASH_DIGEST_SIZE);
>> -			disable_kernel_vsx();
>> -			pagefault_enable();
>> -			preempt_enable();
>> -			src += GHASH_DIGEST_SIZE - dctx->bytes;
>> -			srclen -= GHASH_DIGEST_SIZE - dctx->bytes;
>> -			dctx->bytes = 0;
>> -		}
>> -		len = srclen & ~(GHASH_DIGEST_SIZE - 1);
>> -		if (len) {
>> -			preempt_disable();
>> -			pagefault_disable();
>> -			enable_kernel_vsx();
>> -			gcm_ghash_p8(dctx->shash, ctx->htable, src, len);
>> -			disable_kernel_vsx();
>> -			pagefault_enable();
>> -			preempt_enable();
>> -			src += len;
>> -			srclen -= len;
>> -		}
>> -		if (srclen) {
>> -			memcpy(dctx->buffer, src, srclen);
>> -			dctx->bytes = srclen;
>> +				srclen);
>> +			dctx->bytes += srclen;
>> +			return 0;
>>  		}
>> -		return 0;
>> +		memcpy(dctx->buffer + dctx->bytes, src,
>> +			GHASH_DIGEST_SIZE - dctx->bytes);
>> +
>> +		__ghash_block(ctx, dctx);
>> +
>> +		src += GHASH_DIGEST_SIZE - dctx->bytes;
>> +		srclen -= GHASH_DIGEST_SIZE - dctx->bytes;
>> +		dctx->bytes = 0;
>> +	}
>> +	len = srclen & ~(GHASH_DIGEST_SIZE - 1);
>> +	if (len) {
>> +		__ghash_blocks(ctx, dctx, src, len);
>> +		src += len;
>> +		srclen -= len;
>>  	}
>> +	if (srclen) {
>> +		memcpy(dctx->buffer, src, srclen);
>> +		dctx->bytes = srclen;
>> +	}
>> +	return 0;
>>  }
>>  
>>  static int p8_ghash_final(struct shash_desc *desc, u8 *out)
>> @@ -180,25 +155,14 @@ static int p8_ghash_final(struct shash_desc *desc, u8 *out)
>>  	struct p8_ghash_ctx *ctx = crypto_tfm_ctx(crypto_shash_tfm(desc->tfm));
>>  	struct p8_ghash_desc_ctx *dctx = shash_desc_ctx(desc);
>>  
>> -	if (!crypto_simd_usable()) {
>> -		return crypto_shash_final(&dctx->fallback_desc, out);
>> -	} else {
>> -		if (dctx->bytes) {
>> -			for (i = dctx->bytes; i < GHASH_DIGEST_SIZE; i++)
>> -				dctx->buffer[i] = 0;
>> -			preempt_disable();
>> -			pagefault_disable();
>> -			enable_kernel_vsx();
>> -			gcm_ghash_p8(dctx->shash, ctx->htable,
>> -				     dctx->buffer, GHASH_DIGEST_SIZE);
>> -			disable_kernel_vsx();
>> -			pagefault_enable();
>> -			preempt_enable();
>> -			dctx->bytes = 0;
>> -		}
>> -		memcpy(out, dctx->shash, GHASH_DIGEST_SIZE);
>> -		return 0;
>> +	if (dctx->bytes) {
>> +		for (i = dctx->bytes; i < GHASH_DIGEST_SIZE; i++)
>> +			dctx->buffer[i] = 0;
>> +		__ghash_block(ctx, dctx);
>> +		dctx->bytes = 0;
>>  	}
>> +	memcpy(out, dctx->shash, GHASH_DIGEST_SIZE);
>> +	return 0;
>>  }
>>  
>>  struct shash_alg p8_ghash_alg = {
>> @@ -213,11 +177,8 @@ struct shash_alg p8_ghash_alg = {
>>  		 .cra_name = "ghash",
>>  		 .cra_driver_name = "p8_ghash",
>>  		 .cra_priority = 1000,
>> -		 .cra_flags = CRYPTO_ALG_NEED_FALLBACK,
>>  		 .cra_blocksize = GHASH_BLOCK_SIZE,
>>  		 .cra_ctxsize = sizeof(struct p8_ghash_ctx),
>>  		 .cra_module = THIS_MODULE,
>> -		 .cra_init = p8_ghash_init_tfm,
>> -		 .cra_exit = p8_ghash_exit_tfm,
>>  	},
>>  };
>> -- 
>> 2.19.1
