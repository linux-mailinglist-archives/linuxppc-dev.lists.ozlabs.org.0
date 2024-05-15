Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 12A468C65DB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 13:38:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=cryptogams.org header.i=@cryptogams.org header.a=rsa-sha256 header.s=gmail header.b=pmJT7ccq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfWSW3Njrz3cc0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 21:38:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cryptogams.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cryptogams.org header.i=@cryptogams.org header.a=rsa-sha256 header.s=gmail header.b=pmJT7ccq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cryptogams.org (client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com; envelope-from=appro@cryptogams.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfS6037h2z30fM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 19:07:03 +1000 (AEST)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2e52181c228so52985551fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 02:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cryptogams.org; s=gmail; t=1715764019; x=1716368819; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sCN4Aw4+b34uYf5T+77CTVPm7n3v2SZABsZPxP6R4EM=;
        b=pmJT7ccq0DW/Pn/Z9tFfGiuW44+pgVdoBAQQyP0b7TtwL7emM8e8goY3c9EFpmrWeY
         hWhpgOAEPzSosyL43p5FNaToMvukl6RZ2LjhlQzHTJmKMZOcDLwiLV5/NbJPbB1mb8Os
         z4j98LvjUsT4g0ZwwxkWYgcIa7hCeH93wjuJJ+vaI6C4pqqHdo57w+D3N2V9F+H3q7Uh
         PdzAScPFnVhkNde4UK5LmcP1uPaF7if1IsVmQbUeoBERe+rIdsf6Uzy0MWWdwbkQUyTi
         elrvZIupMykcLnbOyAaS8GsQavgHs0wZKwRpYhGbx4vTeg98/f3ETDpJYHcqT7UJUwgf
         ysUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715764019; x=1716368819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sCN4Aw4+b34uYf5T+77CTVPm7n3v2SZABsZPxP6R4EM=;
        b=gOjeb80ZYu7pZ1aC07pIZSNCFJe2pDfxugvNEnNogjkkTwbvw+vQQb9rn79c/C54fT
         lkTwqAuEMDLOTpP5nRMBjn9FDipqsj2MtD62TgerDQxdEHpHCWW2Gluoqjoe6nDO2kT4
         TC9HsZknamLEoQ+nXIp534+0rFU4Tl0GMwr/IHguGWEI/BdIMtOARBkuDaglWsdrGnuS
         v+R0bmoKux6EkACYxtzcU0vnq1fKFIlHEf3W1Ci3MfpkHDZbBmfXKVgt77tF4Q8w9hAH
         +mbxC6/e9AyH81Q1KS7w7g5ag+rRImHD00Nkta3wa+zAzpHFoE+ci+MOv4EtuaNK4UZx
         oVAw==
X-Forwarded-Encrypted: i=1; AJvYcCU+WgDsfIfhoK4x2tUo8isbAyloQ/liP6zQrrhpPtDvveKP10UW4FtgRYghQ9p4+MIduXnyf8rVHK2kvQcEZXxE2DfJF3BHTEDZgBI8Rg==
X-Gm-Message-State: AOJu0Yxr6r+kSL/68C04sTgfbIpkMwaY63kJU0WMhDDiWAAtPs7nNgGV
	ew4eNUEhkxN8hnU7Keac5rwYdGTYOH6fz2BWYP22CH+Jl/OoU7ntGpCl4Nb6aEz0lDuPEUUjit6
	F
X-Google-Smtp-Source: AGHT+IFGA1MJpKD7oQyr1PZIq0Tmx5HGUB13Z1Mg0iiS0ZqwHQj3FyTq5u9WwgiEAYYNn+VyIwyrpw==
X-Received: by 2002:a2e:a794:0:b0:2e6:f3af:c6aa with SMTP id 38308e7fff4ca-2e6f3afcb13mr16822391fa.40.1715764019239;
        Wed, 15 May 2024 02:06:59 -0700 (PDT)
Received: from [10.0.1.129] (c-922370d5.012-252-67626723.bbcust.telenor.se. [213.112.35.146])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e4d1621233sm20272571fa.126.2024.05.15.02.06.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 02:06:58 -0700 (PDT)
Message-ID: <db513fd8-4723-4b4c-bc14-7da7222617b3@cryptogams.org>
Date: Wed, 15 May 2024 11:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] crypto: X25519 low-level primitives for ppc64le.
To: Danny Tsen <dtsen@linux.ibm.com>, linux-crypto@vger.kernel.org
References: <20240514173835.4814-1-dtsen@linux.ibm.com>
 <20240514173835.4814-2-dtsen@linux.ibm.com>
Content-Language: en-US
From: Andy Polyakov <appro@cryptogams.org>
In-Reply-To: <20240514173835.4814-2-dtsen@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Wed, 15 May 2024 21:36:22 +1000
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
Cc: herbert@gondor.apana.org.au, dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

> +SYM_FUNC_START(x25519_fe51_sqr_times)
> ...
> +
> +.Lsqr_times_loop:
> ...
> +
> +	std	9,16(3)
> +	std	10,24(3)
> +	std	11,32(3)
> +	std	7,0(3)
> +	std	8,8(3)
> +	bdnz	.Lsqr_times_loop

I see no reason for why the stores can't be moved outside the loop in 
question.

> +SYM_FUNC_START(x25519_fe51_frombytes)
> +.align	5
> +
> +	li	12, -1
> +	srdi	12, 12, 13	# 0x7ffffffffffff
> +
> +	ld	5, 0(4)
> +	ld	6, 8(4)
> +	ld	7, 16(4)
> +	ld	8, 24(4)

Is there actual guarantee that the byte input is 64-bit aligned? While 
it is true that processor is obliged to handle misaligned loads and 
stores by the ISA specification, them being inefficient doesn't go 
against it. Most notably inefficiency is likely to be noted at the page 
boundaries. What I'm trying to say is that it would be more appropriate 
to avoid the unaligned loads (and stores).

Cheers.

