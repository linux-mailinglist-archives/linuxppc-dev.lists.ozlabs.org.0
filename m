Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B04461A7368
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 08:10:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491ZpR5qcVzDqWG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 16:10:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=swLCNyX7; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491Zmj3kZjzDqKr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 16:08:37 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 491Zmc64yLz9txkH;
 Tue, 14 Apr 2020 08:08:32 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=swLCNyX7; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4yni2YpdXT3P; Tue, 14 Apr 2020 08:08:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 491Zmc4L0Rz9txkG;
 Tue, 14 Apr 2020 08:08:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586844512; bh=AyML/oaUiIiNPJKHTIdsIrbz6fYQpNyy/73cMAJtVGI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=swLCNyX719PsbdWXJyAjua3tpVkuZHN/PgaRAzIUI6j3FuSDm374UPnlGZYSrGzxT
 ndt6dm09KOl8ksmzmfqqYKRuIRIOuM5gK03jv/9oM2sodvHG7ZsAdW0K43bNG1m7AR
 C9uF0GCYNnsgDDdT0CCsxA/cfFfbv77mzxAhptqM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B4A48B77D;
 Tue, 14 Apr 2020 08:08:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id IsbJC8uJ2iOV; Tue, 14 Apr 2020 08:08:33 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 997728B752;
 Tue, 14 Apr 2020 08:08:30 +0200 (CEST)
Subject: Re: [PATCH v2 2/2] crypto: Remove unnecessary memzero_explicit()
To: Waiman Long <longman@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Howells <dhowells@redhat.com>,
 Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, Joe Perches
 <joe@perches.com>, Matthew Wilcox <willy@infradead.org>,
 David Rientjes <rientjes@google.com>
References: <20200413211550.8307-1-longman@redhat.com>
 <20200413222846.24240-1-longman@redhat.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <eca85e0b-0af3-c43a-31e4-bd5c3f519798@c-s.fr>
Date: Tue, 14 Apr 2020 08:08:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200413222846.24240-1-longman@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: samba-technical@lists.samba.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, linux-sctp@vger.kernel.org, target-devel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, devel@driverdev.osuosl.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 kasan-dev@googlegroups.com, cocci@systeme.lip6.fr, linux-wpan@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-crypto@vger.kernel.org,
 linux-pm@vger.kernel.org, ecryptfs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-cifs@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 wireguard@lists.zx2c4.com, linux-ppp@vger.kernel.org,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/04/2020 à 00:28, Waiman Long a écrit :
> Since kfree_sensitive() will do an implicit memzero_explicit(), there
> is no need to call memzero_explicit() before it. Eliminate those
> memzero_explicit() and simplify the call sites. For better correctness,
> the setting of keylen is also moved down after the key pointer check.
> 
> Signed-off-by: Waiman Long <longman@redhat.com>
> ---
>   .../allwinner/sun8i-ce/sun8i-ce-cipher.c      | 19 +++++-------------
>   .../allwinner/sun8i-ss/sun8i-ss-cipher.c      | 20 +++++--------------
>   drivers/crypto/amlogic/amlogic-gxl-cipher.c   | 12 +++--------
>   drivers/crypto/inside-secure/safexcel_hash.c  |  3 +--
>   4 files changed, 14 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> index aa4e8fdc2b32..8358fac98719 100644
> --- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> +++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
> @@ -366,10 +366,7 @@ void sun8i_ce_cipher_exit(struct crypto_tfm *tfm)
>   {
>   	struct sun8i_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
>   
> -	if (op->key) {
> -		memzero_explicit(op->key, op->keylen);
> -		kfree(op->key);
> -	}
> +	kfree_sensitive(op->key);
>   	crypto_free_sync_skcipher(op->fallback_tfm);
>   	pm_runtime_put_sync_suspend(op->ce->dev);
>   }
> @@ -391,14 +388,11 @@ int sun8i_ce_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
>   		dev_dbg(ce->dev, "ERROR: Invalid keylen %u\n", keylen);
>   		return -EINVAL;
>   	}
> -	if (op->key) {
> -		memzero_explicit(op->key, op->keylen);
> -		kfree(op->key);
> -	}
> -	op->keylen = keylen;
> +	kfree_sensitive(op->key);
>   	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
>   	if (!op->key)
>   		return -ENOMEM;
> +	op->keylen = keylen;

Does it matter at all to ensure op->keylen is not set when of->key is 
NULL ? I'm not sure.

But if it does, then op->keylen should be set to 0 when freeing op->key.

>   
>   	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
>   	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
> @@ -416,14 +410,11 @@ int sun8i_ce_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
>   	if (err)
>   		return err;
>   
> -	if (op->key) {
> -		memzero_explicit(op->key, op->keylen);
> -		kfree(op->key);
> -	}
> -	op->keylen = keylen;
> +	kfree_sensitive(op->key);
>   	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
>   	if (!op->key)
>   		return -ENOMEM;
> +	op->keylen = keylen;

Same comment as above.

>   
>   	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
>   	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
> diff --git a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
> index 5246ef4f5430..0495fbc27fcc 100644
> --- a/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
> +++ b/drivers/crypto/allwinner/sun8i-ss/sun8i-ss-cipher.c
> @@ -249,7 +249,6 @@ static int sun8i_ss_cipher(struct skcipher_request *areq)
>   			offset = areq->cryptlen - ivsize;
>   			if (rctx->op_dir & SS_DECRYPTION) {
>   				memcpy(areq->iv, backup_iv, ivsize);
> -				memzero_explicit(backup_iv, ivsize);
>   				kfree_sensitive(backup_iv);
>   			} else {
>   				scatterwalk_map_and_copy(areq->iv, areq->dst, offset,
> @@ -367,10 +366,7 @@ void sun8i_ss_cipher_exit(struct crypto_tfm *tfm)
>   {
>   	struct sun8i_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
>   
> -	if (op->key) {
> -		memzero_explicit(op->key, op->keylen);
> -		kfree(op->key);
> -	}
> +	kfree_sensitive(op->key);
>   	crypto_free_sync_skcipher(op->fallback_tfm);
>   	pm_runtime_put_sync(op->ss->dev);
>   }
> @@ -392,14 +388,11 @@ int sun8i_ss_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
>   		dev_dbg(ss->dev, "ERROR: Invalid keylen %u\n", keylen);
>   		return -EINVAL;
>   	}
> -	if (op->key) {
> -		memzero_explicit(op->key, op->keylen);
> -		kfree(op->key);
> -	}
> -	op->keylen = keylen;
> +	kfree_sensitive(op->key);
>   	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
>   	if (!op->key)
>   		return -ENOMEM;
> +	op->keylen = keylen;

Same comment as above.

>   
>   	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
>   	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
> @@ -418,14 +411,11 @@ int sun8i_ss_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
>   		return -EINVAL;
>   	}
>   
> -	if (op->key) {
> -		memzero_explicit(op->key, op->keylen);
> -		kfree(op->key);
> -	}
> -	op->keylen = keylen;
> +	kfree_sensitive(op->key);
>   	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
>   	if (!op->key)
>   		return -ENOMEM;
> +	op->keylen = keylen;

Same comment as above.

>   
>   	crypto_sync_skcipher_clear_flags(op->fallback_tfm, CRYPTO_TFM_REQ_MASK);
>   	crypto_sync_skcipher_set_flags(op->fallback_tfm, tfm->base.crt_flags & CRYPTO_TFM_REQ_MASK);
> diff --git a/drivers/crypto/amlogic/amlogic-gxl-cipher.c b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> index fd1269900d67..6aa9ce7bbbd4 100644
> --- a/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> +++ b/drivers/crypto/amlogic/amlogic-gxl-cipher.c
> @@ -341,10 +341,7 @@ void meson_cipher_exit(struct crypto_tfm *tfm)
>   {
>   	struct meson_cipher_tfm_ctx *op = crypto_tfm_ctx(tfm);
>   
> -	if (op->key) {
> -		memzero_explicit(op->key, op->keylen);
> -		kfree(op->key);
> -	}
> +	kfree_sensitive(op->key);
>   	crypto_free_sync_skcipher(op->fallback_tfm);
>   }
>   
> @@ -368,14 +365,11 @@ int meson_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
>   		dev_dbg(mc->dev, "ERROR: Invalid keylen %u\n", keylen);
>   		return -EINVAL;
>   	}
> -	if (op->key) {
> -		memzero_explicit(op->key, op->keylen);
> -		kfree(op->key);
> -	}
> -	op->keylen = keylen;
> +	kfree_sensitive(op->key);
>   	op->key = kmemdup(key, keylen, GFP_KERNEL | GFP_DMA);
>   	if (!op->key)
>   		return -ENOMEM;
> +	op->keylen = keylen;

Same comment as above.

>   
>   	return crypto_sync_skcipher_setkey(op->fallback_tfm, key, keylen);
>   }
> diff --git a/drivers/crypto/inside-secure/safexcel_hash.c b/drivers/crypto/inside-secure/safexcel_hash.c
> index 43962bc709c6..4a2d162914de 100644
> --- a/drivers/crypto/inside-secure/safexcel_hash.c
> +++ b/drivers/crypto/inside-secure/safexcel_hash.c
> @@ -1081,8 +1081,7 @@ static int safexcel_hmac_init_pad(struct ahash_request *areq,
>   		}
>   
>   		/* Avoid leaking */
> -		memzero_explicit(keydup, keylen);
> -		kfree(keydup);
> +		kfree_sensitive(keydup);
>   
>   		if (ret)
>   			return ret;
> 


Christophe
