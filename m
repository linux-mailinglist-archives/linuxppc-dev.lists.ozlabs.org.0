Return-Path: <linuxppc-dev+bounces-850-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA89967BA9
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Sep 2024 20:08:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WxfyH3Bkqz2xrb;
	Mon,  2 Sep 2024 04:08:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725214103;
	cv=none; b=Vcmsh+j4bq3G1S3VFy8JmjTr7ehymnRWsJJC5VWkYjQmcYimvJJ/UbEApJdi9UtPfQi6z/VEZDDVcCDxm5VgoJDvZaKy+o2bCkBq4JtnJuKBwKhqcNw5tOaLeQGJA9M/7obz6ueA8riomX+Yv+yFGV28n9Iry4wmRz7a2ewrdxQF5ADQO7qLtTflQvjvKwpCLqUwIiP9bjJI924Zf8XaRBNcYit0k463jp+NUT/f8qVC+bEvedJ776sb3rkCT+xVzwQ7HCcprlG7al30gp7S58iPHee6qxD6oyC2I1ss0Zi4RMWt1plTz0AtRLNDi8+yKjvW1RCdnkv88kXl9ctu6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725214103; c=relaxed/relaxed;
	bh=hDcbmJFVf51B3DxM7aIxiA7R5RQ5bYbOxlx/Tq3o184=;
	h=Received:Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=MbTmMHyEt6p+KM5TlIxbLXarXiRbMsz3BNq4U2t3i2NQdcfmbYy9HqJ+baYlY5Kfg4f/wMeDGRsaHBIGJUV7boha+jwB+XFCZ8nNMohLi/Tf4IpplOX8wXajbDtD+4x6v9wImQqI3rmN0nSZSWuZrhS2CN3s7Ipn43xI3GAGRvpR7ny4HVBRcqItE1U3r3X4ocrPSW3kukxzMuoYSPVteG2Qmd4VtkmR0ofbo7at9Vbw/huU+ayW1/uyGSMo3E8rfzHcUrNFcGhXDfK28gUCmAHaU3ZGkNbnUBL81+SHbGK4R7DnAha1O3aJWUj+RceRW5nqBy09VxkCDfvYwJD+cQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com; dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=E7YjuNk0; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=mkha=p7=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha256 header.s=20210105 header.b=E7YjuNk0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=mkha=p7=zx2c4.com=jason@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WxfyF3xDVz2xnc
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 04:08:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A97C5C10CD;
	Sun,  1 Sep 2024 18:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 136D5C4CEC3;
	Sun,  1 Sep 2024 18:08:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="E7YjuNk0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105;
	t=1725214096;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hDcbmJFVf51B3DxM7aIxiA7R5RQ5bYbOxlx/Tq3o184=;
	b=E7YjuNk0zpHf+yksVPfbo/nQ72vo8pY5DqufJkzPd5LMag1IeraDXdasiNltC7NhrvEU5C
	EGOw+nxG2LiejYjHNqTMtGD2ZGPSx0a6pmrVWHdSNakLRAwK3iqTEpmeB3+mu29zk903Ix
	BrYVYIwP0k+6CdWnWlsDUb0Itv5vvHo=
Received: 
	by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5b555000 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Sun, 1 Sep 2024 18:08:16 +0000 (UTC)
Date: Sun, 1 Sep 2024 20:08:13 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH] selftests: vDSO: Also test counter in vdso_test_chacha
Message-ID: <ZtStjU_3K9yIJsmp@zx2c4.com>
References: <f9f64c5ded3925ae408f01c1c61e2fdf6f645a71.1725212364.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f9f64c5ded3925ae408f01c1c61e2fdf6f645a71.1725212364.git.christophe.leroy@csgroup.eu>

On Sun, Sep 01, 2024 at 07:40:33PM +0200, Christophe Leroy wrote:
> -static void reference_chacha20_blocks(uint8_t *dst_bytes, const uint32_t *key, size_t nblocks)
> +static void reference_chacha20_blocks(uint8_t *dst_bytes, const uint32_t *key, uint32_t *counter, size_t nblocks)
>  {
>  	uint32_t s[16] = {
>  		0x61707865U, 0x3320646eU, 0x79622d32U, 0x6b206574U,
> -		key[0], key[1], key[2], key[3], key[4], key[5], key[6], key[7]
> +		key[0], key[1], key[2], key[3], key[4], key[5], key[6], key[7],
> +		counter[0], counter[1],

While you're doing this, also add the remaining, `0, 0` elements.

> +			if (memcmp(output1, output2, sizeof(output1)) ||
> +			    memcmp(counter2, counter2, sizeof(counter1)))

counter2 will always be counter2. You meant for the first argument to be
counter1.

> +	reference_chacha20_blocks(output1, key, counter1, BLOCKS);
> +	__arch_chacha20_blocks_nostack(output2, key, counter2, BLOCKS);
> +	if (memcmp(output1, output2, sizeof(output1)) ||
> +	    memcmp(counter2, counter2, sizeof(counter1)))
> +		return KSFT_FAIL;
> +
> +	reference_chacha20_blocks(output1, key, counter1, BLOCKS);
> +	__arch_chacha20_blocks_nostack(output2, key, counter2, BLOCKS);
> +	if (memcmp(output1, output2, sizeof(output1)) ||
> +	    memcmp(counter2, counter2, sizeof(counter1)))
> +		return KSFT_FAIL;
> +

Why repeat these two stanzas? Also, same issue with counter2 used twice
in that memcmp.

