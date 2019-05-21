Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC4D24751
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 07:09:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 457P2H1Y23zDqRB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 May 2019 15:09:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 457P141PpLzDqGm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 May 2019 15:08:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 457P134ZZfz9s3Z;
 Tue, 21 May 2019 15:08:23 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: vmx - convert to skcipher API
In-Reply-To: <20190520164448.160430-1-ebiggers@kernel.org>
References: <20190520164448.160430-1-ebiggers@kernel.org>
Date: Tue, 21 May 2019 15:08:23 +1000
Message-ID: <871s0s8ke0.fsf@concordia.ellerman.id.au>
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
Cc: Breno =?utf-8?Q?Leit=C3=A3o?= <leitao@debian.org>,
 linuxppc-dev@lists.ozlabs.org, Nayna Jain <nayna@linux.ibm.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Eric Biggers <ebiggers@kernel.org> writes:
> From: Eric Biggers <ebiggers@google.com>
>
> Convert the VMX implementations of AES-CBC, AES-CTR, and AES-XTS from
> the deprecated "blkcipher" API to the "skcipher" API.
>
> As part of this, I moved the skcipher_request for the fallback algorithm
> off the stack and into the request context of the parent algorithm.
>
> I tested this in a PowerPC VM with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y.

I booted it a few times on a Power9 bare metal machine with
panic_on_fail=1 and fuzz_iterations=400, no issues.

Tested-by: Michael Ellerman <mpe@ellerman.id.au>

cheers

> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  drivers/crypto/vmx/aes_cbc.c   | 183 ++++++++++++---------------------
>  drivers/crypto/vmx/aes_ctr.c   | 165 +++++++++++++----------------
>  drivers/crypto/vmx/aes_xts.c   | 175 ++++++++++++++-----------------
>  drivers/crypto/vmx/aesp8-ppc.h |   2 -
>  drivers/crypto/vmx/vmx.c       |  72 +++++++------
>  5 files changed, 252 insertions(+), 345 deletions(-)
>
> diff --git a/drivers/crypto/vmx/aes_cbc.c b/drivers/crypto/vmx/aes_cbc.c
> index dae8af3c46dce..92e75a05d6a9e 100644
> --- a/drivers/crypto/vmx/aes_cbc.c
> +++ b/drivers/crypto/vmx/aes_cbc.c
> @@ -7,64 +7,52 @@
>   * Author: Marcelo Henrique Cerri <mhcerri@br.ibm.com>
>   */
>  
> -#include <linux/types.h>
> -#include <linux/err.h>
> -#include <linux/crypto.h>
> -#include <linux/delay.h>
>  #include <asm/simd.h>
>  #include <asm/switch_to.h>
>  #include <crypto/aes.h>
>  #include <crypto/internal/simd.h>
> -#include <crypto/scatterwalk.h>
> -#include <crypto/skcipher.h>
> +#include <crypto/internal/skcipher.h>
>  
>  #include "aesp8-ppc.h"
>  
>  struct p8_aes_cbc_ctx {
> -	struct crypto_sync_skcipher *fallback;
> +	struct crypto_skcipher *fallback;
>  	struct aes_key enc_key;
>  	struct aes_key dec_key;
>  };
>  
> -static int p8_aes_cbc_init(struct crypto_tfm *tfm)
> +static int p8_aes_cbc_init(struct crypto_skcipher *tfm)
>  {
> -	const char *alg = crypto_tfm_alg_name(tfm);
> -	struct crypto_sync_skcipher *fallback;
> -	struct p8_aes_cbc_ctx *ctx = crypto_tfm_ctx(tfm);
> -
> -	fallback = crypto_alloc_sync_skcipher(alg, 0,
> -					      CRYPTO_ALG_NEED_FALLBACK);
> +	struct p8_aes_cbc_ctx *ctx = crypto_skcipher_ctx(tfm);
> +	struct crypto_skcipher *fallback;
>  
> +	fallback = crypto_alloc_skcipher("cbc(aes)", 0,
> +					 CRYPTO_ALG_NEED_FALLBACK |
> +					 CRYPTO_ALG_ASYNC);
>  	if (IS_ERR(fallback)) {
> -		printk(KERN_ERR
> -		       "Failed to allocate transformation for '%s': %ld\n",
> -		       alg, PTR_ERR(fallback));
> +		pr_err("Failed to allocate cbc(aes) fallback: %ld\n",
> +		       PTR_ERR(fallback));
>  		return PTR_ERR(fallback);
>  	}
>  
> -	crypto_sync_skcipher_set_flags(
> -		fallback,
> -		crypto_skcipher_get_flags((struct crypto_skcipher *)tfm));
> +	crypto_skcipher_set_reqsize(tfm, sizeof(struct skcipher_request) +
> +				    crypto_skcipher_reqsize(fallback));
>  	ctx->fallback = fallback;
> -
>  	return 0;
>  }
>  
> -static void p8_aes_cbc_exit(struct crypto_tfm *tfm)
> +static void p8_aes_cbc_exit(struct crypto_skcipher *tfm)
>  {
> -	struct p8_aes_cbc_ctx *ctx = crypto_tfm_ctx(tfm);
> +	struct p8_aes_cbc_ctx *ctx = crypto_skcipher_ctx(tfm);
>  
> -	if (ctx->fallback) {
> -		crypto_free_sync_skcipher(ctx->fallback);
> -		ctx->fallback = NULL;
> -	}
> +	crypto_free_skcipher(ctx->fallback);
>  }
>  
> -static int p8_aes_cbc_setkey(struct crypto_tfm *tfm, const u8 *key,
> +static int p8_aes_cbc_setkey(struct crypto_skcipher *tfm, const u8 *key,
>  			     unsigned int keylen)
>  {
> +	struct p8_aes_cbc_ctx *ctx = crypto_skcipher_ctx(tfm);
>  	int ret;
> -	struct p8_aes_cbc_ctx *ctx = crypto_tfm_ctx(tfm);
>  
>  	preempt_disable();
>  	pagefault_disable();
> @@ -75,108 +63,71 @@ static int p8_aes_cbc_setkey(struct crypto_tfm *tfm, const u8 *key,
>  	pagefault_enable();
>  	preempt_enable();
>  
> -	ret |= crypto_sync_skcipher_setkey(ctx->fallback, key, keylen);
> +	ret |= crypto_skcipher_setkey(ctx->fallback, key, keylen);
>  
>  	return ret ? -EINVAL : 0;
>  }
>  
> -static int p8_aes_cbc_encrypt(struct blkcipher_desc *desc,
> -			      struct scatterlist *dst,
> -			      struct scatterlist *src, unsigned int nbytes)
> +static int p8_aes_cbc_crypt(struct skcipher_request *req, int enc)
>  {
> +	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
> +	const struct p8_aes_cbc_ctx *ctx = crypto_skcipher_ctx(tfm);
> +	struct skcipher_walk walk;
> +	unsigned int nbytes;
>  	int ret;
> -	struct blkcipher_walk walk;
> -	struct p8_aes_cbc_ctx *ctx =
> -		crypto_tfm_ctx(crypto_blkcipher_tfm(desc->tfm));
>  
>  	if (!crypto_simd_usable()) {
> -		SYNC_SKCIPHER_REQUEST_ON_STACK(req, ctx->fallback);
> -		skcipher_request_set_sync_tfm(req, ctx->fallback);
> -		skcipher_request_set_callback(req, desc->flags, NULL, NULL);
> -		skcipher_request_set_crypt(req, src, dst, nbytes, desc->info);
> -		ret = crypto_skcipher_encrypt(req);
> -		skcipher_request_zero(req);
> -	} else {
> -		blkcipher_walk_init(&walk, dst, src, nbytes);
> -		ret = blkcipher_walk_virt(desc, &walk);
> -		while ((nbytes = walk.nbytes)) {
> -			preempt_disable();
> -			pagefault_disable();
> -			enable_kernel_vsx();
> -			aes_p8_cbc_encrypt(walk.src.virt.addr,
> -					   walk.dst.virt.addr,
> -					   nbytes & AES_BLOCK_MASK,
> -					   &ctx->enc_key, walk.iv, 1);
> -			disable_kernel_vsx();
> -			pagefault_enable();
> -			preempt_enable();
> -
> -			nbytes &= AES_BLOCK_SIZE - 1;
> -			ret = blkcipher_walk_done(desc, &walk, nbytes);
> -		}
> +		struct skcipher_request *subreq = skcipher_request_ctx(req);
> +
> +		*subreq = *req;
> +		skcipher_request_set_tfm(subreq, ctx->fallback);
> +		return enc ? crypto_skcipher_encrypt(subreq) :
> +			     crypto_skcipher_decrypt(subreq);
>  	}
>  
> +	ret = skcipher_walk_virt(&walk, req, false);
> +	while ((nbytes = walk.nbytes) != 0) {
> +		preempt_disable();
> +		pagefault_disable();
> +		enable_kernel_vsx();
> +		aes_p8_cbc_encrypt(walk.src.virt.addr,
> +				   walk.dst.virt.addr,
> +				   round_down(nbytes, AES_BLOCK_SIZE),
> +				   enc ? &ctx->enc_key : &ctx->dec_key,
> +				   walk.iv, enc);
> +		disable_kernel_vsx();
> +		pagefault_enable();
> +		preempt_enable();
> +
> +		ret = skcipher_walk_done(&walk, nbytes % AES_BLOCK_SIZE);
> +	}
>  	return ret;
>  }
>  
> -static int p8_aes_cbc_decrypt(struct blkcipher_desc *desc,
> -			      struct scatterlist *dst,
> -			      struct scatterlist *src, unsigned int nbytes)
> +static int p8_aes_cbc_encrypt(struct skcipher_request *req)
>  {
> -	int ret;
> -	struct blkcipher_walk walk;
> -	struct p8_aes_cbc_ctx *ctx =
> -		crypto_tfm_ctx(crypto_blkcipher_tfm(desc->tfm));
> -
> -	if (!crypto_simd_usable()) {
> -		SYNC_SKCIPHER_REQUEST_ON_STACK(req, ctx->fallback);
> -		skcipher_request_set_sync_tfm(req, ctx->fallback);
> -		skcipher_request_set_callback(req, desc->flags, NULL, NULL);
> -		skcipher_request_set_crypt(req, src, dst, nbytes, desc->info);
> -		ret = crypto_skcipher_decrypt(req);
> -		skcipher_request_zero(req);
> -	} else {
> -		blkcipher_walk_init(&walk, dst, src, nbytes);
> -		ret = blkcipher_walk_virt(desc, &walk);
> -		while ((nbytes = walk.nbytes)) {
> -			preempt_disable();
> -			pagefault_disable();
> -			enable_kernel_vsx();
> -			aes_p8_cbc_encrypt(walk.src.virt.addr,
> -					   walk.dst.virt.addr,
> -					   nbytes & AES_BLOCK_MASK,
> -					   &ctx->dec_key, walk.iv, 0);
> -			disable_kernel_vsx();
> -			pagefault_enable();
> -			preempt_enable();
> -
> -			nbytes &= AES_BLOCK_SIZE - 1;
> -			ret = blkcipher_walk_done(desc, &walk, nbytes);
> -		}
> -	}
> -
> -	return ret;
> +	return p8_aes_cbc_crypt(req, 1);
>  }
>  
> +static int p8_aes_cbc_decrypt(struct skcipher_request *req)
> +{
> +	return p8_aes_cbc_crypt(req, 0);
> +}
>  
> -struct crypto_alg p8_aes_cbc_alg = {
> -	.cra_name = "cbc(aes)",
> -	.cra_driver_name = "p8_aes_cbc",
> -	.cra_module = THIS_MODULE,
> -	.cra_priority = 2000,
> -	.cra_type = &crypto_blkcipher_type,
> -	.cra_flags = CRYPTO_ALG_TYPE_BLKCIPHER | CRYPTO_ALG_NEED_FALLBACK,
> -	.cra_alignmask = 0,
> -	.cra_blocksize = AES_BLOCK_SIZE,
> -	.cra_ctxsize = sizeof(struct p8_aes_cbc_ctx),
> -	.cra_init = p8_aes_cbc_init,
> -	.cra_exit = p8_aes_cbc_exit,
> -	.cra_blkcipher = {
> -			  .ivsize = AES_BLOCK_SIZE,
> -			  .min_keysize = AES_MIN_KEY_SIZE,
> -			  .max_keysize = AES_MAX_KEY_SIZE,
> -			  .setkey = p8_aes_cbc_setkey,
> -			  .encrypt = p8_aes_cbc_encrypt,
> -			  .decrypt = p8_aes_cbc_decrypt,
> -	},
> +struct skcipher_alg p8_aes_cbc_alg = {
> +	.base.cra_name = "cbc(aes)",
> +	.base.cra_driver_name = "p8_aes_cbc",
> +	.base.cra_module = THIS_MODULE,
> +	.base.cra_priority = 2000,
> +	.base.cra_flags = CRYPTO_ALG_NEED_FALLBACK,
> +	.base.cra_blocksize = AES_BLOCK_SIZE,
> +	.base.cra_ctxsize = sizeof(struct p8_aes_cbc_ctx),
> +	.setkey = p8_aes_cbc_setkey,
> +	.encrypt = p8_aes_cbc_encrypt,
> +	.decrypt = p8_aes_cbc_decrypt,
> +	.init = p8_aes_cbc_init,
> +	.exit = p8_aes_cbc_exit,
> +	.min_keysize = AES_MIN_KEY_SIZE,
> +	.max_keysize = AES_MAX_KEY_SIZE,
> +	.ivsize = AES_BLOCK_SIZE,
>  };
> diff --git a/drivers/crypto/vmx/aes_ctr.c b/drivers/crypto/vmx/aes_ctr.c
> index dc31101178446..c4d2809a5d9ee 100644
> --- a/drivers/crypto/vmx/aes_ctr.c
> +++ b/drivers/crypto/vmx/aes_ctr.c
> @@ -7,62 +7,51 @@
>   * Author: Marcelo Henrique Cerri <mhcerri@br.ibm.com>
>   */
>  
> -#include <linux/types.h>
> -#include <linux/err.h>
> -#include <linux/crypto.h>
> -#include <linux/delay.h>
>  #include <asm/simd.h>
>  #include <asm/switch_to.h>
>  #include <crypto/aes.h>
>  #include <crypto/internal/simd.h>
> -#include <crypto/scatterwalk.h>
> -#include <crypto/skcipher.h>
> +#include <crypto/internal/skcipher.h>
>  
>  #include "aesp8-ppc.h"
>  
>  struct p8_aes_ctr_ctx {
> -	struct crypto_sync_skcipher *fallback;
> +	struct crypto_skcipher *fallback;
>  	struct aes_key enc_key;
>  };
>  
> -static int p8_aes_ctr_init(struct crypto_tfm *tfm)
> +static int p8_aes_ctr_init(struct crypto_skcipher *tfm)
>  {
> -	const char *alg = crypto_tfm_alg_name(tfm);
> -	struct crypto_sync_skcipher *fallback;
> -	struct p8_aes_ctr_ctx *ctx = crypto_tfm_ctx(tfm);
> +	struct p8_aes_ctr_ctx *ctx = crypto_skcipher_ctx(tfm);
> +	struct crypto_skcipher *fallback;
>  
> -	fallback = crypto_alloc_sync_skcipher(alg, 0,
> -					      CRYPTO_ALG_NEED_FALLBACK);
> +	fallback = crypto_alloc_skcipher("ctr(aes)", 0,
> +					 CRYPTO_ALG_NEED_FALLBACK |
> +					 CRYPTO_ALG_ASYNC);
>  	if (IS_ERR(fallback)) {
> -		printk(KERN_ERR
> -		       "Failed to allocate transformation for '%s': %ld\n",
> -		       alg, PTR_ERR(fallback));
> +		pr_err("Failed to allocate ctr(aes) fallback: %ld\n",
> +		       PTR_ERR(fallback));
>  		return PTR_ERR(fallback);
>  	}
>  
> -	crypto_sync_skcipher_set_flags(
> -		fallback,
> -		crypto_skcipher_get_flags((struct crypto_skcipher *)tfm));
> +	crypto_skcipher_set_reqsize(tfm, sizeof(struct skcipher_request) +
> +				    crypto_skcipher_reqsize(fallback));
>  	ctx->fallback = fallback;
> -
>  	return 0;
>  }
>  
> -static void p8_aes_ctr_exit(struct crypto_tfm *tfm)
> +static void p8_aes_ctr_exit(struct crypto_skcipher *tfm)
>  {
> -	struct p8_aes_ctr_ctx *ctx = crypto_tfm_ctx(tfm);
> +	struct p8_aes_ctr_ctx *ctx = crypto_skcipher_ctx(tfm);
>  
> -	if (ctx->fallback) {
> -		crypto_free_sync_skcipher(ctx->fallback);
> -		ctx->fallback = NULL;
> -	}
> +	crypto_free_skcipher(ctx->fallback);
>  }
>  
> -static int p8_aes_ctr_setkey(struct crypto_tfm *tfm, const u8 *key,
> +static int p8_aes_ctr_setkey(struct crypto_skcipher *tfm, const u8 *key,
>  			     unsigned int keylen)
>  {
> +	struct p8_aes_ctr_ctx *ctx = crypto_skcipher_ctx(tfm);
>  	int ret;
> -	struct p8_aes_ctr_ctx *ctx = crypto_tfm_ctx(tfm);
>  
>  	preempt_disable();
>  	pagefault_disable();
> @@ -72,13 +61,13 @@ static int p8_aes_ctr_setkey(struct crypto_tfm *tfm, const u8 *key,
>  	pagefault_enable();
>  	preempt_enable();
>  
> -	ret |= crypto_sync_skcipher_setkey(ctx->fallback, key, keylen);
> +	ret |= crypto_skcipher_setkey(ctx->fallback, key, keylen);
>  
>  	return ret ? -EINVAL : 0;
>  }
>  
> -static void p8_aes_ctr_final(struct p8_aes_ctr_ctx *ctx,
> -			     struct blkcipher_walk *walk)
> +static void p8_aes_ctr_final(const struct p8_aes_ctr_ctx *ctx,
> +			     struct skcipher_walk *walk)
>  {
>  	u8 *ctrblk = walk->iv;
>  	u8 keystream[AES_BLOCK_SIZE];
> @@ -98,77 +87,63 @@ static void p8_aes_ctr_final(struct p8_aes_ctr_ctx *ctx,
>  	crypto_inc(ctrblk, AES_BLOCK_SIZE);
>  }
>  
> -static int p8_aes_ctr_crypt(struct blkcipher_desc *desc,
> -			    struct scatterlist *dst,
> -			    struct scatterlist *src, unsigned int nbytes)
> +static int p8_aes_ctr_crypt(struct skcipher_request *req)
>  {
> +	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
> +	const struct p8_aes_ctr_ctx *ctx = crypto_skcipher_ctx(tfm);
> +	struct skcipher_walk walk;
> +	unsigned int nbytes;
>  	int ret;
> -	u64 inc;
> -	struct blkcipher_walk walk;
> -	struct p8_aes_ctr_ctx *ctx =
> -		crypto_tfm_ctx(crypto_blkcipher_tfm(desc->tfm));
>  
>  	if (!crypto_simd_usable()) {
> -		SYNC_SKCIPHER_REQUEST_ON_STACK(req, ctx->fallback);
> -		skcipher_request_set_sync_tfm(req, ctx->fallback);
> -		skcipher_request_set_callback(req, desc->flags, NULL, NULL);
> -		skcipher_request_set_crypt(req, src, dst, nbytes, desc->info);
> -		ret = crypto_skcipher_encrypt(req);
> -		skcipher_request_zero(req);
> -	} else {
> -		blkcipher_walk_init(&walk, dst, src, nbytes);
> -		ret = blkcipher_walk_virt_block(desc, &walk, AES_BLOCK_SIZE);
> -		while ((nbytes = walk.nbytes) >= AES_BLOCK_SIZE) {
> -			preempt_disable();
> -			pagefault_disable();
> -			enable_kernel_vsx();
> -			aes_p8_ctr32_encrypt_blocks(walk.src.virt.addr,
> -						    walk.dst.virt.addr,
> -						    (nbytes &
> -						     AES_BLOCK_MASK) /
> -						    AES_BLOCK_SIZE,
> -						    &ctx->enc_key,
> -						    walk.iv);
> -			disable_kernel_vsx();
> -			pagefault_enable();
> -			preempt_enable();
> -
> -			/* We need to update IV mostly for last bytes/round */
> -			inc = (nbytes & AES_BLOCK_MASK) / AES_BLOCK_SIZE;
> -			if (inc > 0)
> -				while (inc--)
> -					crypto_inc(walk.iv, AES_BLOCK_SIZE);
> -
> -			nbytes &= AES_BLOCK_SIZE - 1;
> -			ret = blkcipher_walk_done(desc, &walk, nbytes);
> -		}
> -		if (walk.nbytes) {
> -			p8_aes_ctr_final(ctx, &walk);
> -			ret = blkcipher_walk_done(desc, &walk, 0);
> -		}
> +		struct skcipher_request *subreq = skcipher_request_ctx(req);
> +
> +		*subreq = *req;
> +		skcipher_request_set_tfm(subreq, ctx->fallback);
> +		return crypto_skcipher_encrypt(subreq);
>  	}
>  
> +	ret = skcipher_walk_virt(&walk, req, false);
> +	while ((nbytes = walk.nbytes) >= AES_BLOCK_SIZE) {
> +		preempt_disable();
> +		pagefault_disable();
> +		enable_kernel_vsx();
> +		aes_p8_ctr32_encrypt_blocks(walk.src.virt.addr,
> +					    walk.dst.virt.addr,
> +					    nbytes / AES_BLOCK_SIZE,
> +					    &ctx->enc_key, walk.iv);
> +		disable_kernel_vsx();
> +		pagefault_enable();
> +		preempt_enable();
> +
> +		do {
> +			crypto_inc(walk.iv, AES_BLOCK_SIZE);
> +		} while ((nbytes -= AES_BLOCK_SIZE) >= AES_BLOCK_SIZE);
> +
> +		ret = skcipher_walk_done(&walk, nbytes);
> +	}
> +	if (nbytes) {
> +		p8_aes_ctr_final(ctx, &walk);
> +		ret = skcipher_walk_done(&walk, 0);
> +	}
>  	return ret;
>  }
>  
> -struct crypto_alg p8_aes_ctr_alg = {
> -	.cra_name = "ctr(aes)",
> -	.cra_driver_name = "p8_aes_ctr",
> -	.cra_module = THIS_MODULE,
> -	.cra_priority = 2000,
> -	.cra_type = &crypto_blkcipher_type,
> -	.cra_flags = CRYPTO_ALG_TYPE_BLKCIPHER | CRYPTO_ALG_NEED_FALLBACK,
> -	.cra_alignmask = 0,
> -	.cra_blocksize = 1,
> -	.cra_ctxsize = sizeof(struct p8_aes_ctr_ctx),
> -	.cra_init = p8_aes_ctr_init,
> -	.cra_exit = p8_aes_ctr_exit,
> -	.cra_blkcipher = {
> -			  .ivsize = AES_BLOCK_SIZE,
> -			  .min_keysize = AES_MIN_KEY_SIZE,
> -			  .max_keysize = AES_MAX_KEY_SIZE,
> -			  .setkey = p8_aes_ctr_setkey,
> -			  .encrypt = p8_aes_ctr_crypt,
> -			  .decrypt = p8_aes_ctr_crypt,
> -	},
> +struct skcipher_alg p8_aes_ctr_alg = {
> +	.base.cra_name = "ctr(aes)",
> +	.base.cra_driver_name = "p8_aes_ctr",
> +	.base.cra_module = THIS_MODULE,
> +	.base.cra_priority = 2000,
> +	.base.cra_flags = CRYPTO_ALG_NEED_FALLBACK,
> +	.base.cra_blocksize = 1,
> +	.base.cra_ctxsize = sizeof(struct p8_aes_ctr_ctx),
> +	.setkey = p8_aes_ctr_setkey,
> +	.encrypt = p8_aes_ctr_crypt,
> +	.decrypt = p8_aes_ctr_crypt,
> +	.init = p8_aes_ctr_init,
> +	.exit = p8_aes_ctr_exit,
> +	.min_keysize = AES_MIN_KEY_SIZE,
> +	.max_keysize = AES_MAX_KEY_SIZE,
> +	.ivsize = AES_BLOCK_SIZE,
> +	.chunksize = AES_BLOCK_SIZE,
>  };
> diff --git a/drivers/crypto/vmx/aes_xts.c b/drivers/crypto/vmx/aes_xts.c
> index aee1339f134ec..965d8e03321cd 100644
> --- a/drivers/crypto/vmx/aes_xts.c
> +++ b/drivers/crypto/vmx/aes_xts.c
> @@ -7,67 +7,56 @@
>   * Author: Leonidas S. Barbosa <leosilva@linux.vnet.ibm.com>
>   */
>  
> -#include <linux/types.h>
> -#include <linux/err.h>
> -#include <linux/crypto.h>
> -#include <linux/delay.h>
>  #include <asm/simd.h>
>  #include <asm/switch_to.h>
>  #include <crypto/aes.h>
>  #include <crypto/internal/simd.h>
> -#include <crypto/scatterwalk.h>
> +#include <crypto/internal/skcipher.h>
>  #include <crypto/xts.h>
> -#include <crypto/skcipher.h>
>  
>  #include "aesp8-ppc.h"
>  
>  struct p8_aes_xts_ctx {
> -	struct crypto_sync_skcipher *fallback;
> +	struct crypto_skcipher *fallback;
>  	struct aes_key enc_key;
>  	struct aes_key dec_key;
>  	struct aes_key tweak_key;
>  };
>  
> -static int p8_aes_xts_init(struct crypto_tfm *tfm)
> +static int p8_aes_xts_init(struct crypto_skcipher *tfm)
>  {
> -	const char *alg = crypto_tfm_alg_name(tfm);
> -	struct crypto_sync_skcipher *fallback;
> -	struct p8_aes_xts_ctx *ctx = crypto_tfm_ctx(tfm);
> +	struct p8_aes_xts_ctx *ctx = crypto_skcipher_ctx(tfm);
> +	struct crypto_skcipher *fallback;
>  
> -	fallback = crypto_alloc_sync_skcipher(alg, 0,
> -					      CRYPTO_ALG_NEED_FALLBACK);
> +	fallback = crypto_alloc_skcipher("xts(aes)", 0,
> +					 CRYPTO_ALG_NEED_FALLBACK |
> +					 CRYPTO_ALG_ASYNC);
>  	if (IS_ERR(fallback)) {
> -		printk(KERN_ERR
> -			"Failed to allocate transformation for '%s': %ld\n",
> -			alg, PTR_ERR(fallback));
> +		pr_err("Failed to allocate xts(aes) fallback: %ld\n",
> +		       PTR_ERR(fallback));
>  		return PTR_ERR(fallback);
>  	}
>  
> -	crypto_sync_skcipher_set_flags(
> -		fallback,
> -		crypto_skcipher_get_flags((struct crypto_skcipher *)tfm));
> +	crypto_skcipher_set_reqsize(tfm, sizeof(struct skcipher_request) +
> +				    crypto_skcipher_reqsize(fallback));
>  	ctx->fallback = fallback;
> -
>  	return 0;
>  }
>  
> -static void p8_aes_xts_exit(struct crypto_tfm *tfm)
> +static void p8_aes_xts_exit(struct crypto_skcipher *tfm)
>  {
> -	struct p8_aes_xts_ctx *ctx = crypto_tfm_ctx(tfm);
> +	struct p8_aes_xts_ctx *ctx = crypto_skcipher_ctx(tfm);
>  
> -	if (ctx->fallback) {
> -		crypto_free_sync_skcipher(ctx->fallback);
> -		ctx->fallback = NULL;
> -	}
> +	crypto_free_skcipher(ctx->fallback);
>  }
>  
> -static int p8_aes_xts_setkey(struct crypto_tfm *tfm, const u8 *key,
> +static int p8_aes_xts_setkey(struct crypto_skcipher *tfm, const u8 *key,
>  			     unsigned int keylen)
>  {
> +	struct p8_aes_xts_ctx *ctx = crypto_skcipher_ctx(tfm);
>  	int ret;
> -	struct p8_aes_xts_ctx *ctx = crypto_tfm_ctx(tfm);
>  
> -	ret = xts_check_key(tfm, key, keylen);
> +	ret = xts_verify_key(tfm, key, keylen);
>  	if (ret)
>  		return ret;
>  
> @@ -81,100 +70,90 @@ static int p8_aes_xts_setkey(struct crypto_tfm *tfm, const u8 *key,
>  	pagefault_enable();
>  	preempt_enable();
>  
> -	ret |= crypto_sync_skcipher_setkey(ctx->fallback, key, keylen);
> +	ret |= crypto_skcipher_setkey(ctx->fallback, key, keylen);
>  
>  	return ret ? -EINVAL : 0;
>  }
>  
> -static int p8_aes_xts_crypt(struct blkcipher_desc *desc,
> -			    struct scatterlist *dst,
> -			    struct scatterlist *src,
> -			    unsigned int nbytes, int enc)
> +static int p8_aes_xts_crypt(struct skcipher_request *req, int enc)
>  {
> -	int ret;
> +	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
> +	const struct p8_aes_xts_ctx *ctx = crypto_skcipher_ctx(tfm);
> +	struct skcipher_walk walk;
> +	unsigned int nbytes;
>  	u8 tweak[AES_BLOCK_SIZE];
> -	u8 *iv;
> -	struct blkcipher_walk walk;
> -	struct p8_aes_xts_ctx *ctx =
> -		crypto_tfm_ctx(crypto_blkcipher_tfm(desc->tfm));
> +	int ret;
>  
>  	if (!crypto_simd_usable()) {
> -		SYNC_SKCIPHER_REQUEST_ON_STACK(req, ctx->fallback);
> -		skcipher_request_set_sync_tfm(req, ctx->fallback);
> -		skcipher_request_set_callback(req, desc->flags, NULL, NULL);
> -		skcipher_request_set_crypt(req, src, dst, nbytes, desc->info);
> -		ret = enc? crypto_skcipher_encrypt(req) : crypto_skcipher_decrypt(req);
> -		skcipher_request_zero(req);
> -	} else {
> -		blkcipher_walk_init(&walk, dst, src, nbytes);
> +		struct skcipher_request *subreq = skcipher_request_ctx(req);
> +
> +		*subreq = *req;
> +		skcipher_request_set_tfm(subreq, ctx->fallback);
> +		return enc ? crypto_skcipher_encrypt(subreq) :
> +			     crypto_skcipher_decrypt(subreq);
> +	}
> +
> +	ret = skcipher_walk_virt(&walk, req, false);
> +	if (ret)
> +		return ret;
> +
> +	preempt_disable();
> +	pagefault_disable();
> +	enable_kernel_vsx();
>  
> -		ret = blkcipher_walk_virt(desc, &walk);
> +	aes_p8_encrypt(walk.iv, tweak, &ctx->tweak_key);
> +
> +	disable_kernel_vsx();
> +	pagefault_enable();
> +	preempt_enable();
>  
> +	while ((nbytes = walk.nbytes) != 0) {
>  		preempt_disable();
>  		pagefault_disable();
>  		enable_kernel_vsx();
> -
> -		iv = walk.iv;
> -		memset(tweak, 0, AES_BLOCK_SIZE);
> -		aes_p8_encrypt(iv, tweak, &ctx->tweak_key);
> -
> +		if (enc)
> +			aes_p8_xts_encrypt(walk.src.virt.addr,
> +					   walk.dst.virt.addr,
> +					   round_down(nbytes, AES_BLOCK_SIZE),
> +					   &ctx->enc_key, NULL, tweak);
> +		else
> +			aes_p8_xts_decrypt(walk.src.virt.addr,
> +					   walk.dst.virt.addr,
> +					   round_down(nbytes, AES_BLOCK_SIZE),
> +					   &ctx->dec_key, NULL, tweak);
>  		disable_kernel_vsx();
>  		pagefault_enable();
>  		preempt_enable();
>  
> -		while ((nbytes = walk.nbytes)) {
> -			preempt_disable();
> -			pagefault_disable();
> -			enable_kernel_vsx();
> -			if (enc)
> -				aes_p8_xts_encrypt(walk.src.virt.addr, walk.dst.virt.addr,
> -						nbytes & AES_BLOCK_MASK, &ctx->enc_key, NULL, tweak);
> -			else
> -				aes_p8_xts_decrypt(walk.src.virt.addr, walk.dst.virt.addr,
> -						nbytes & AES_BLOCK_MASK, &ctx->dec_key, NULL, tweak);
> -			disable_kernel_vsx();
> -			pagefault_enable();
> -			preempt_enable();
> -
> -			nbytes &= AES_BLOCK_SIZE - 1;
> -			ret = blkcipher_walk_done(desc, &walk, nbytes);
> -		}
> +		ret = skcipher_walk_done(&walk, nbytes % AES_BLOCK_SIZE);
>  	}
>  	return ret;
>  }
>  
> -static int p8_aes_xts_encrypt(struct blkcipher_desc *desc,
> -			      struct scatterlist *dst,
> -			      struct scatterlist *src, unsigned int nbytes)
> +static int p8_aes_xts_encrypt(struct skcipher_request *req)
>  {
> -	return p8_aes_xts_crypt(desc, dst, src, nbytes, 1);
> +	return p8_aes_xts_crypt(req, 1);
>  }
>  
> -static int p8_aes_xts_decrypt(struct blkcipher_desc *desc,
> -			      struct scatterlist *dst,
> -			      struct scatterlist *src, unsigned int nbytes)
> +static int p8_aes_xts_decrypt(struct skcipher_request *req)
>  {
> -	return p8_aes_xts_crypt(desc, dst, src, nbytes, 0);
> +	return p8_aes_xts_crypt(req, 0);
>  }
>  
> -struct crypto_alg p8_aes_xts_alg = {
> -	.cra_name = "xts(aes)",
> -	.cra_driver_name = "p8_aes_xts",
> -	.cra_module = THIS_MODULE,
> -	.cra_priority = 2000,
> -	.cra_type = &crypto_blkcipher_type,
> -	.cra_flags = CRYPTO_ALG_TYPE_BLKCIPHER | CRYPTO_ALG_NEED_FALLBACK,
> -	.cra_alignmask = 0,
> -	.cra_blocksize = AES_BLOCK_SIZE,
> -	.cra_ctxsize = sizeof(struct p8_aes_xts_ctx),
> -	.cra_init = p8_aes_xts_init,
> -	.cra_exit = p8_aes_xts_exit,
> -	.cra_blkcipher = {
> -			.ivsize = AES_BLOCK_SIZE,
> -			.min_keysize = 2 * AES_MIN_KEY_SIZE,
> -			.max_keysize = 2 * AES_MAX_KEY_SIZE,
> -			.setkey	 = p8_aes_xts_setkey,
> -			.encrypt = p8_aes_xts_encrypt,
> -			.decrypt = p8_aes_xts_decrypt,
> -	}
> +struct skcipher_alg p8_aes_xts_alg = {
> +	.base.cra_name = "xts(aes)",
> +	.base.cra_driver_name = "p8_aes_xts",
> +	.base.cra_module = THIS_MODULE,
> +	.base.cra_priority = 2000,
> +	.base.cra_flags = CRYPTO_ALG_NEED_FALLBACK,
> +	.base.cra_blocksize = AES_BLOCK_SIZE,
> +	.base.cra_ctxsize = sizeof(struct p8_aes_xts_ctx),
> +	.setkey = p8_aes_xts_setkey,
> +	.encrypt = p8_aes_xts_encrypt,
> +	.decrypt = p8_aes_xts_decrypt,
> +	.init = p8_aes_xts_init,
> +	.exit = p8_aes_xts_exit,
> +	.min_keysize = 2 * AES_MIN_KEY_SIZE,
> +	.max_keysize = 2 * AES_MAX_KEY_SIZE,
> +	.ivsize = AES_BLOCK_SIZE,
>  };
> diff --git a/drivers/crypto/vmx/aesp8-ppc.h b/drivers/crypto/vmx/aesp8-ppc.h
> index 349646b73754f..01774a4d26a25 100644
> --- a/drivers/crypto/vmx/aesp8-ppc.h
> +++ b/drivers/crypto/vmx/aesp8-ppc.h
> @@ -2,8 +2,6 @@
>  #include <linux/types.h>
>  #include <crypto/aes.h>
>  
> -#define AES_BLOCK_MASK  (~(AES_BLOCK_SIZE-1))
> -
>  struct aes_key {
>  	u8 key[AES_MAX_KEYLENGTH];
>  	int rounds;
> diff --git a/drivers/crypto/vmx/vmx.c b/drivers/crypto/vmx/vmx.c
> index abd89c2bcec4d..eff03fdf964f2 100644
> --- a/drivers/crypto/vmx/vmx.c
> +++ b/drivers/crypto/vmx/vmx.c
> @@ -15,54 +15,58 @@
>  #include <linux/crypto.h>
>  #include <asm/cputable.h>
>  #include <crypto/internal/hash.h>
> +#include <crypto/internal/skcipher.h>
>  
>  extern struct shash_alg p8_ghash_alg;
>  extern struct crypto_alg p8_aes_alg;
> -extern struct crypto_alg p8_aes_cbc_alg;
> -extern struct crypto_alg p8_aes_ctr_alg;
> -extern struct crypto_alg p8_aes_xts_alg;
> -static struct crypto_alg *algs[] = {
> -	&p8_aes_alg,
> -	&p8_aes_cbc_alg,
> -	&p8_aes_ctr_alg,
> -	&p8_aes_xts_alg,
> -	NULL,
> -};
> +extern struct skcipher_alg p8_aes_cbc_alg;
> +extern struct skcipher_alg p8_aes_ctr_alg;
> +extern struct skcipher_alg p8_aes_xts_alg;
>  
>  static int __init p8_init(void)
>  {
> -	int ret = 0;
> -	struct crypto_alg **alg_it;
> +	int ret;
>  
> -	for (alg_it = algs; *alg_it; alg_it++) {
> -		ret = crypto_register_alg(*alg_it);
> -		printk(KERN_INFO "crypto_register_alg '%s' = %d\n",
> -		       (*alg_it)->cra_name, ret);
> -		if (ret) {
> -			for (alg_it--; alg_it >= algs; alg_it--)
> -				crypto_unregister_alg(*alg_it);
> -			break;
> -		}
> -	}
> +	ret = crypto_register_shash(&p8_ghash_alg);
>  	if (ret)
> -		return ret;
> +		goto err;
>  
> -	ret = crypto_register_shash(&p8_ghash_alg);
> -	if (ret) {
> -		for (alg_it = algs; *alg_it; alg_it++)
> -			crypto_unregister_alg(*alg_it);
> -	}
> +	ret = crypto_register_alg(&p8_aes_alg);
> +	if (ret)
> +		goto err_unregister_ghash;
> +
> +	ret = crypto_register_skcipher(&p8_aes_cbc_alg);
> +	if (ret)
> +		goto err_unregister_aes;
> +
> +	ret = crypto_register_skcipher(&p8_aes_ctr_alg);
> +	if (ret)
> +		goto err_unregister_aes_cbc;
> +
> +	ret = crypto_register_skcipher(&p8_aes_xts_alg);
> +	if (ret)
> +		goto err_unregister_aes_ctr;
> +
> +	return 0;
> +
> +err_unregister_aes_ctr:
> +	crypto_unregister_skcipher(&p8_aes_ctr_alg);
> +err_unregister_aes_cbc:
> +	crypto_unregister_skcipher(&p8_aes_cbc_alg);
> +err_unregister_aes:
> +	crypto_unregister_alg(&p8_aes_alg);
> +err_unregister_ghash:
> +	crypto_unregister_shash(&p8_ghash_alg);
> +err:
>  	return ret;
>  }
>  
>  static void __exit p8_exit(void)
>  {
> -	struct crypto_alg **alg_it;
> -
> -	for (alg_it = algs; *alg_it; alg_it++) {
> -		printk(KERN_INFO "Removing '%s'\n", (*alg_it)->cra_name);
> -		crypto_unregister_alg(*alg_it);
> -	}
> +	crypto_unregister_skcipher(&p8_aes_xts_alg);
> +	crypto_unregister_skcipher(&p8_aes_ctr_alg);
> +	crypto_unregister_skcipher(&p8_aes_cbc_alg);
> +	crypto_unregister_alg(&p8_aes_alg);
>  	crypto_unregister_shash(&p8_ghash_alg);
>  }
>  
> -- 
> 2.21.0.1020.gf2820cf01a-goog
