Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DEBE71FDB2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 04:14:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454FNQ2b4XzDqYh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 12:14:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="diGpPQUv"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454FLw1pypzDqDx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 12:12:55 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id z26so962011pfg.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 19:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=P1EJ1RRPpfxvuymwKbVdpkG8jtFroZ7XoSxbEw7EEDk=;
 b=diGpPQUvm5HSFAy+VLt5eOwRlixnUhHkksBGIzBsBzh/MBpy6JPSkSleSXUipe4h7P
 K/HBmfOJtXeFye86w4oHBVGSdu17ef1ZyvuT0TqMkKvz6c9CvoxDyFEUES2mkTKoXY/I
 MLFvlXUK8yNmWyIKd25+axaHewj41UfMrKGp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=P1EJ1RRPpfxvuymwKbVdpkG8jtFroZ7XoSxbEw7EEDk=;
 b=KIUFCMyfA0eXPSBV95wMr47zeqesOjUDDAGlQiAouMmI2sPEDkt4kab2bH4QJ7Kyd3
 jlNefO/t6e5dvQuUqfF6IeDnyEzpi1kvQOmGUGY7ZlBGD0UfCEWL2T5cXjpSsPQyBSUM
 utftRlJtULtMLZ6wfi6OH4VbDbVBAZblCNYgTRlJSCKsxH/HLExv/guyaDK3AntaGk3O
 /2TLgM+7os3k8yh/R0m2mi3UcbKiYE/0Z8QY9vUtkvpPONYrWqrwWlL1hkQx5O0X9qJa
 oFjho5Ba9cDdCAVKHkTulHtItL0t4V0ZksHlJ7zTnntNynlwC8ZXdYIkazGB15RVLo/a
 q9ig==
X-Gm-Message-State: APjAAAWu77JpDEnOdENK82lKCnahmrcf6oQgUyAArBpkjizpSyWJjGu1
 ApU25qyoh0UYVSLcryPDcswa8Q==
X-Google-Smtp-Source: APXvYqx9Ch2TUCqBHQUNB0h/htgu14X1hw6d4YC3kulfKT/9lZ5ws04g0kx2rz8qhRljndmNx2xFdQ==
X-Received: by 2002:aa7:95bb:: with SMTP id a27mr39662147pfk.30.1557972772641; 
 Wed, 15 May 2019 19:12:52 -0700 (PDT)
Received: from localhost (dip-220-235-49-186.wa.westnet.com.au.
 [220.235.49.186])
 by smtp.gmail.com with ESMTPSA id 132sm4162765pga.79.2019.05.15.19.12.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 19:12:51 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Herbert Xu <herbert@gondor.apana.org.au>
Subject: Re: [PATCH] crypto: vmx - fix copy-paste error in CTR mode
In-Reply-To: <874l5w1axv.fsf@dja-thinkpad.axtens.net>
References: <20190315043433.GC1671@sol.localdomain>
 <8736nou2x5.fsf@dja-thinkpad.axtens.net>
 <20190410070234.GA12406@sol.localdomain>
 <87imvkwqdh.fsf@dja-thinkpad.axtens.net>
 <2c8b042f-c7df-cb8b-3fcd-15d6bb274d08@linux.vnet.ibm.com>
 <8736mmvafj.fsf@concordia.ellerman.id.au>
 <20190506155315.GA661@sol.localdomain>
 <20190513005901.tsop4lz26vusr6o4@gondor.apana.org.au>
 <87pnomtwgh.fsf@concordia.ellerman.id.au>
 <877eat0wi0.fsf@dja-thinkpad.axtens.net>
 <20190515035336.y42wzhs3wzqdpwzn@gondor.apana.org.au>
 <874l5w1axv.fsf@dja-thinkpad.axtens.net>
Date: Thu, 16 May 2019 12:12:48 +1000
Message-ID: <871s0z171b.fsf@dja-thinkpad.axtens.net>
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
Cc: leo.barbosa@canonical.com, nayna@linux.ibm.com,
 Stephan Mueller <smueller@chronox.de>, Nayna <nayna@linux.vnet.ibm.com>,
 omosnacek@gmail.com, Eric Biggers <ebiggers@kernel.org>,
 marcelo.cerri@canonical.com, pfsmorigo@gmail.com, linux-crypto@vger.kernel.org,
 leitao@debian.org, George Wilson <gcwilson@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:

> Herbert Xu <herbert@gondor.apana.org.au> writes:
>
>> On Wed, May 15, 2019 at 03:35:51AM +1000, Daniel Axtens wrote:
>>>
>>> By all means disable vmx ctr if I don't get an answer to you in a
>>> timeframe you are comfortable with, but I am going to at least try to
>>> have a look.
>>
>> I'm happy to give you guys more time.  How much time do you think
>> you will need?
>>
> Give me till the end of the week: if I haven't solved it by then I will
> probably have to give up and go on to other things anyway.

So as you've hopefully seen, I've nailed it down and posted a patch.
(http://patchwork.ozlabs.org/patch/1099934/)

I'm also seeing issues with ghash with the extended tests:

[    7.582926] alg: hash: p8_ghash test failed (wrong result) on test vector 0, cfg="random: use_final src_divs=[<reimport>9.72%@+39832, <reimport>18.2%@+65504, <reimport,nosimd>45.57%@alignmask+18, <reimport,nosimd>15.6%@+65496, 6.83%@+65514, <reimport,nosimd>1.2%@+25, <reim"

It seems to happen when one of the source divisions has nosimd and the
final result uses the simd finaliser, so that's interesting.

Regards,
Daniel

>
> (FWIW, it seems to happen when encoding greater than 4 but less than 8
> AES blocks - in particular with both 7 and 5 blocks encoded I can see it
> go wrong from block 4 onwards. No idea why yet, and the asm is pretty
> dense, but that's where I'm at at the moment.)
>
> Regards,
> Daniel
>
>> Thanks,
>> -- 
>> Email: Herbert Xu <herbert@gondor.apana.org.au>
>> Home Page: http://gondor.apana.org.au/~herbert/
>> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
