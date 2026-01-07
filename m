Return-Path: <linuxppc-dev+bounces-15349-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9859DCFBF4F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 05:30:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmFT40m21z2yFh;
	Wed, 07 Jan 2026 15:30:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767757792;
	cv=none; b=ZII5LNIQv6/VZp5GgLZegUMbGoGKLFUocHbTuKpGmSSlDWhcTW0YyeZjSQi7G7nvju3Sd6DtlnGLa0k1/4q/BqJhvcGVh5xVEzGakc5P2bkKU8I7RTbi9bGLC6/JIm43QiRpRWyqZdr3pWQt1T1uM7z+EM9BxW/dEvIO2LFege41TLsHkvOeiXkjhKap4ODlng6R3qu1xfUkfTCHDvFWihj39xx/8U1/jTKLpMX+rQlycoUGtH0/ZazkNA5KVmggmPCjL8k4HyJioABiGNoShZqVC8Ss4wjSYocahc9yALF4rSIxYSE3rRuj/3sB0ykDgonbQ/rleIYRTwFGmcxGxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767757792; c=relaxed/relaxed;
	bh=lVfOOsMtVesahSpJ7NzEZB2a7bFJ+2QiFmRNgCZu9gM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hnzhRggUOeeJLqk6heMocL7WNuxkreyUL9pBA7FBpMaLGtptS78X4LVEYP/742FBhI3iFNKRcrtS1QH0JpLGHPoeU873Db64IBewc1PTT2JfE1VBSk+Cqv1jK8zTUTocf0nw4+meCtpwH11ZSowCrGo/d2oj/DGfiulyXFSkAd6R+U49SLfKNS8gl+k8gElAHlAPMYTYlgbIbfLs7YDd3I6OI36DUWVAPW1f15N4I/PA/y//clKc2S9fs8TjqAouTqR0b9v96ZEZFJ//Dz7IN4Q1hqSoCPTd/HGf3Zx73OJoZGxQMcz6tbc3ZCpl0ImOzZwJKzngmud2AY28eJ+f3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Cgnvwhi8; dkim-atps=neutral; spf=pass (client-ip=74.125.82.175; helo=mail-dy1-f175.google.com; envelope-from=dqfext@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Cgnvwhi8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=74.125.82.175; helo=mail-dy1-f175.google.com; envelope-from=dqfext@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmDZ52m1Rz2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 14:49:48 +1100 (AEDT)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ae61424095so982239eec.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 19:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767757726; x=1768362526; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVfOOsMtVesahSpJ7NzEZB2a7bFJ+2QiFmRNgCZu9gM=;
        b=Cgnvwhi8cCR5tjeJLjnmATnKTs9RRcyzLDUvH+2orP3Re0HTmhdSsfKay+7i9yZ5sZ
         HV+OmHqGlOC4OhKlAFm/GO4uXc68E/opSKcEzGUd/ahMX/7U9Ur1i5O4nfxvpa4EX7YU
         2cZ/eHFsAWLwTsZl4G9mWpsU7xlO2yVUMbjDdp1BhyXF1Oxu8Jrt4H4LHwXGqmB5BzXO
         v9D9GDhmGgmxW4cr69kKk3O8krVISpQZPhkxVRODKwAzxV+RgGhLeQ0qIbYnA0bsvSju
         ZnNCtUw1xTt8dMGBcoHPw1NeVaSJsEGdP06+klUCGIFLY5vp3H2FqjDtyCJEvJkGyVzE
         GhFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767757726; x=1768362526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lVfOOsMtVesahSpJ7NzEZB2a7bFJ+2QiFmRNgCZu9gM=;
        b=oJcP/jw8lmnPkgDeFY85///32PuNB/mJxLoLlHdBRk7RUQD/W+wLzjVKBd5W8rmj6A
         1DOQBKbhXOH+lHTCOFNGzL3KI0suLmIzA9GA46JOEoHqN49TA6A7IVFeCkkE1NNht0Kk
         EmufmZQm5SBak9AHg6VqLYYCx9C1XvgUAyK6QlVI6QpUZyPhRrf8ecaMVood4DUslTnd
         8uYMllp7tCXMG/qNHbqQhKMJkEPMRxRE+l4fLvEbOV8zAi0IvwKRowCudJaVZMtVP6k8
         OS1aqsLKLanaCDVZQubN1h55+y0Sw12hVhM/4o4CP4uIl8wh34hDz0whMX0jIzYmKfnZ
         gP2A==
X-Forwarded-Encrypted: i=1; AJvYcCX/ZAG94rnZqSoDvXvqZ603XoKqxIJqdNJZRyTYjZxadB7VohoWDwE+MOfjx57qGitnTBthDKXxWLOZ+Ek=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxTHE4+U5chPdLkcX8IWWhovXa03rwu46WoVazhRzUZ2kHCZwLT
	Gl9G5LImI7G1TmwIkKFhngIOTDzNn/3ZMMywKa5na0t8j6X5fe/4H0ox
X-Gm-Gg: AY/fxX6fyaNa6EigvJ+nfWiKQcwkw0cebdiYcFjv91iQvBWWPSFUSDJmrEGXlQOEl5n
	Rq4RNd4nAfk7rIjjj9Bg8O+QxEc0bQ/0roloXt8k4wKNI3MeRNnKAb4SRa+6tUuWOOjLgkby32+
	HX5azllwEL9s/r25uQPThh4jhWDq4h6AGYK6xiKSgPpOqu55ZRWWW8CX4rCMpO+53JwTCiL5vP4
	lK5TjidFO7LSGdaXsg+6nAGcdmSIfxQ16Rv4kqTTr2Qvtttn+sV6AnWqB9rBcKs2msdpa3x/1ub
	nOJZrgkfNEi1AtDG56DfQ4eWZdJS0UcHl4jxnHtBpPJdJrqYKznIm7CHw/R86n1hO8wejdMLHI3
	iijZIXx8nHrKC1Wu5PV8LxLnKr3cj7eqIcobYtbhMo3c/2A6Kz3HjgyhZiP8cNew=
X-Google-Smtp-Source: AGHT+IH/ZbpZvf+ufhdSrgq15FQAA5DMOGdsUeBWMvuc3LZNVn+XAns8eGMqcOV8TZ1Q54ktkq+I7A==
X-Received: by 2002:a05:7301:578d:b0:2a4:3593:c7c5 with SMTP id 5a478bee46e88-2b17d1f058bmr978905eec.5.1767757725777;
        Tue, 06 Jan 2026 19:48:45 -0800 (PST)
Received: from gmail.com ([2a09:bac5:1f0d:28::4:33f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b2256sm5392191eec.25.2026.01.06.19.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 19:48:45 -0800 (PST)
From: Qingfang Deng <dqfext@gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>
Subject: Re: [PATCH 30/36] crypto: inside-secure - Use new AES library API
Date: Wed,  7 Jan 2026 11:48:33 +0800
Message-ID: <20260107034834.1447-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105051311.1607207-31-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org> <20260105051311.1607207-31-ebiggers@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun,  4 Jan 2026 21:13:03 -0800, Eric Biggers wrote:
> --- a/drivers/crypto/inside-secure/safexcel_cipher.c
> +++ b/drivers/crypto/inside-secure/safexcel_cipher.c
> @@ -2505,37 +2505,35 @@ static int safexcel_aead_gcm_setkey(struct crypto_aead *ctfm, const u8 *key,
>  				    unsigned int len)
>  {
>  	struct crypto_tfm *tfm = crypto_aead_tfm(ctfm);
>  	struct safexcel_cipher_ctx *ctx = crypto_tfm_ctx(tfm);
>  	struct safexcel_crypto_priv *priv = ctx->base.priv;
> -	struct crypto_aes_ctx aes;
> +	struct aes_enckey aes;
>  	u32 hashkey[AES_BLOCK_SIZE >> 2];
>  	int ret, i;
>  
> -	ret = aes_expandkey(&aes, key, len);
> -	if (ret) {
> -		memzero_explicit(&aes, sizeof(aes));
> +	ret = aes_prepareenckey(&aes, key, len);
> +	if (ret)
>  		return ret;
> -	}
>  
>  	if (priv->flags & EIP197_TRC_CACHE && ctx->base.ctxr_dma) {
>  		for (i = 0; i < len / sizeof(u32); i++) {
> -			if (le32_to_cpu(ctx->key[i]) != aes.key_enc[i]) {
> +			if (ctx->key[i] != get_unaligned((__le32 *)key + i)) {

"key" is big-endian. Casting it to __le32 does not seem correct.
Did you mean "get_unaligned_le32", which also convert the endianness?

>  				ctx->base.needs_inv = true;
>  				break;
>  			}
>  		}
>  	}
>  
>  	for (i = 0; i < len / sizeof(u32); i++)
> -		ctx->key[i] = cpu_to_le32(aes.key_enc[i]);
> +		ctx->key[i] = get_unaligned((__le32 *)key + i);

Same here.

>  
>  	ctx->key_len = len;
>  
>  	/* Compute hash key by encrypting zeroes with cipher key */
>  	memset(hashkey, 0, AES_BLOCK_SIZE);
> -	aes_encrypt(&aes, (u8 *)hashkey, (u8 *)hashkey);
> +	aes_encrypt_new(&aes, (u8 *)hashkey, (u8 *)hashkey);
>  
>  	if (priv->flags & EIP197_TRC_CACHE && ctx->base.ctxr_dma) {
>  		for (i = 0; i < AES_BLOCK_SIZE / sizeof(u32); i++) {
>  			if (be32_to_cpu(ctx->base.ipad.be[i]) != hashkey[i]) {
>  				ctx->base.needs_inv = true;

