Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D8E8C65DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 13:37:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=cryptogams.org header.i=@cryptogams.org header.a=rsa-sha256 header.s=gmail header.b=l9I4ake1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VfWRk6SZ0z3d2x
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2024 21:37:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=cryptogams.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cryptogams.org header.i=@cryptogams.org header.a=rsa-sha256 header.s=gmail header.b=l9I4ake1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cryptogams.org (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=appro@cryptogams.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VfRHH5mT4z3bNs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 18:30:01 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2dcc8d10d39so76671341fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2024 01:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cryptogams.org; s=gmail; t=1715761797; x=1716366597; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kdZ6+CYbkRe4GWY6A69afts7kPSMUQxevIZoOvytkAk=;
        b=l9I4ake1B60uOzEOmV0gs8s9raAR+KlRBWytYC+ndQakQcgI2YnDWibOu9QU4LZ4lu
         AAy+eX2+/Bn04hj5ND9FTB+8MOAR6f4oMtGfW0vdExKzbeVrCZwwcZyGNYuMIOxI3In+
         G1W0/pu6A0bamGh2gEXoFgtPg4viqyqc4pGPqek00FLFEoZbJUOhF2j6aL0Ul6EbCC1a
         jNdBR8c2+MuLUho4Ed+g4hVZ2NDp8r4lkEejKc893sfEIq2uH1cQFfacmen3WcsR4TSC
         SDz2hP0WSeXpPxKe0iuRRB+eZgZK/itFrARxMuKQBcTM3xZvYLu5po5dFAU5aUDK8uQf
         ncdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715761797; x=1716366597;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kdZ6+CYbkRe4GWY6A69afts7kPSMUQxevIZoOvytkAk=;
        b=T2L9F6Evw7IKMetHc5TQ778hZW6r3hqm/9aJBuf8LuXN72YOjYZrbnmgZEsfRL1NHJ
         JBnjJvDYdL4nRrQcqZkRnongcsBAJtrdMULwe1dROgpHG7baQ4tv6DXMoqE+b989eV1/
         /40FObE+7ZLW915BSpL47N7zNKIVlCsnBEBgn7VAzVhfWLqZ9b0+jKrpMOrG4m0Q1Sjz
         XTHo9FoGrGdUR7HXTpQfKYYbHBhbxuwhvKzI/vhPI+vCO5B+Zdj7Ksbme2e8e9YThDmj
         kDiD1TFrXsFWrtCdeSjwOrev+tRIn2YuvVsWC+yDxwR5gybW2fitZQewKmBrQg3XFSIM
         1rag==
X-Forwarded-Encrypted: i=1; AJvYcCWX28VFFts4bfoaxqywALNwCj90eGyCXrBJPZdnqrf1nfFJwDPsw6a/fVQ4g+Z6P4Q2JPiTNFoGLicD+NM4/P29EeXVbPeNzKhU18oOCQ==
X-Gm-Message-State: AOJu0YzV7hea5kTyiaYQwYye9QrVRs31LK0mmWy95WOFqSrJrbuGhAI6
	FQ1wjLCIOgU5Jub0FprTv1qamEo9ODNW38ukF8/nLbKw/6MPUoku4ITPMCY0glI=
X-Google-Smtp-Source: AGHT+IGrFyIGNekgvi7YvLggWgiFyAjxsuUBqcC1ibM/CNjEyWzWGDg20jTRgwWYO3bbnH8X0/j41Q==
X-Received: by 2002:a2e:a591:0:b0:2e2:9416:a649 with SMTP id 38308e7fff4ca-2e5205c3760mr106145011fa.53.1715761796962;
        Wed, 15 May 2024 01:29:56 -0700 (PDT)
Received: from [10.0.1.129] (c-922370d5.012-252-67626723.bbcust.telenor.se. [213.112.35.146])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2e6a8a64d84sm8110551fa.76.2024.05.15.01.29.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 May 2024 01:29:56 -0700 (PDT)
Message-ID: <847f2e4f-ace1-415d-b129-ed2751429eec@cryptogams.org>
Date: Wed, 15 May 2024 10:29:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] crypto: X25519 core functions for ppc64le
To: Danny Tsen <dtsen@linux.ibm.com>, linux-crypto@vger.kernel.org
References: <20240514173835.4814-1-dtsen@linux.ibm.com>
 <20240514173835.4814-3-dtsen@linux.ibm.com>
Content-Language: en-US
From: Andy Polyakov <appro@cryptogams.org>
In-Reply-To: <20240514173835.4814-3-dtsen@linux.ibm.com>
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

> +static void cswap(fe51 p, fe51 q, unsigned int bit)
> +{
> +	u64 t, i;
> +	u64 c = 0 - (u64) bit;
> +
> +	for (i = 0; i < 5; ++i) {
> +		t = c & (p[i] ^ q[i]);
> +		p[i] ^= t;
> +		q[i] ^= t;
> +	}
> +}

The "c" in cswap stands for "constant-time," and the problem is that 
contemporary compilers have exhibited the ability to produce 
non-constant-time machine code as result of compilation of the above 
kind of technique. The outcome is platform-specific and ironically some 
of PPC code generators were observed to generate "most" 
non-constant-time code. "Most" in sense that execution time variations 
would be most easy to catch. One way to work around the problem, at 
least for the time being, is to add 'asm volatile("" : "+r"(c))' after 
you calculate 'c'. But there is no guarantee that the next compiler 
version won't see through it, hence the permanent solution is to do it 
in assembly. I can put together something...

Cheers.

